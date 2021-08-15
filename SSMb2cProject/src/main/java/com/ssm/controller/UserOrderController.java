package com.ssm.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.modle.Commodity;
import com.ssm.modle.SuperPage;
import com.ssm.modle.User;
import com.ssm.modle.UserOrder;
import com.ssm.serviceimpl.CommodityServiceImpl;
import com.ssm.serviceimpl.UserCartServiceImpl;
import com.ssm.serviceimpl.UserOrderServiceImpl;
import com.ssm.serviceimpl.UserServiceImpl;

/**
 * 用户订单controller层
 * @author ASUS
 *
 */
@Controller
@RequestMapping("/order")
public class UserOrderController {
	
	@Autowired
	private UserServiceImpl usi;
	@Autowired
	private CommodityServiceImpl csi;
	@Autowired
	private UserOrderServiceImpl uosi;
	@Autowired
	private UserCartServiceImpl ucsi;
	
	//跳转订单页面
	//最好添加事务
	@RequestMapping("/submit")
	public String submit(UserOrder order,Map<String,Object> map) {
		order.setUser(usi.findByUser(order.getUserid()));
		order.setComm(csi.findById(order.getCommid()));
		int count=Integer.valueOf(order.getCount());
		order.setPrice(count*(order.getComm().getCommprice()));
		order.setState("0");
		//下单时间
        Date now = new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String nowdate=sdf.format(now);
		order.setIntime(nowdate);
		ucsi.delCartComm(order.getUserid(), order.getCommid());
		UserOrder textorder=uosi.findByOrderid(order.getOrderid());
		if(textorder==null) {
			uosi.saveOrder(order);
		}
		//购买时库存减去相应的数量
		int bookcount=order.getComm().getCount()-order.getCount();
		csi.updateCommCount(order.getCommid(),bookcount);
		map.put("order",order);
		return "front/order_details";
	}
	
	//借阅图书逻辑
	@RequestMapping("/subcribe")
	public String subcribeSubmit(UserOrder order,Map<String,Object> map) {
		order.setUser(usi.findByUser(order.getUserid()));
		order.setComm(csi.findById(order.getCommid()));
		order.setPrice((int)((order.getComm().getCommprice())/2));
		order.setCount(1);
		order.setState("0");
		order.setSubcribe("Y");
		//下单时间
		Date now = new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String nowdate=sdf.format(now);
		order.setIntime(nowdate);
		ucsi.delCartComm(order.getUserid(), order.getCommid());
		UserOrder textorder=uosi.findByOrderid(order.getOrderid());
		if(textorder==null) {
			uosi.saveOrder(order);
		}
		//借阅时库存减一
		int bookcount=order.getComm().getCount()-1;
		csi.updateCommCount(order.getCommid(),bookcount);
		map.put("order",order);
		return "front/order_subcribe";
	}
	
	//删除用户订单
	@RequestMapping("/delorder")
	@ResponseBody
	public String delOrder(String orderid) {
		boolean success=false;
		UserOrder order=uosi.findByOrderid(orderid);
		if("Y".equals(order.getIsreturn())) {
			success=true;
			return "{\"success\":"+success+"}";
		}
		if("0".equals(order.getState())) {
			return "{\"success\":"+success+"}";
		}
		if("N".equals(order.getIsreturn())&&"Y".equals(order.getSubcribe())) {
			return "{\"success\":"+success+"}";
		}
		int a=uosi.delByOrderid(orderid);
		if(a==1) {
			success=true;
		}
		return "{\"success\":"+success+"}";
	}
	
	//跳转支付页面
	@RequestMapping("/defray")
	public String defray(String orderid,Map<String,Object> map) {
		UserOrder order=uosi.findByOrderid(orderid);
		map.put("order", order);
		return "front/order_refer";
	}
	
	//跳转用户订单页面
	@RequestMapping("/myorder")
	public String myorder(Map<String,Object> map,HttpSession session) {
		User user=(User) session.getAttribute("ssmuser");
		if(user==null) {
			return "redirect:/user/login";
		}
		map.put("user", user);
		List<UserOrder> orders=uosi.findByUserid(user.getUserid());
		if(orders!=null){
			map.put("orders", orders);
		}else {
			map.put("orders", null);	
		}
		return "front/order";
	}
	//成功支付逻辑
	@PostMapping("/updateorder")
	@ResponseBody
	public String updateOrder(String orderid) {
		boolean success=false;
		UserOrder order=uosi.findByOrderid(orderid);
		User user=order.getUser();
		int money=user.getMoney()-order.getPrice();
		if("已支付".equals(order.getState())) {
			return "{\"success\":"+success+"}"; 
		}
		if(money<0) {
			return "{\"success\":"+success+"}";
		}
		user.setMoney(money);
		int a=usi.updateMoney(user);
		int b=uosi.updateOrder(orderid);
		if(a==1&&b==1) {
			success=true;
		}
		return "{\"success\":"+success+"}";
	}
	//后端跳转订单管理页面
	@RequestMapping("/selectindent")
	public String selectIndent(SuperPage sp,User user,Commodity comm,UserOrder order,String orderstate,Map<String,Object> map) {
		int pageno = sp.getPageno() == 0 ? 1 : sp.getPageno();
		int pagesize = sp.getPagesize() == 0 ? 10 : sp.getPagesize();
		PageHelper.startPage(pageno, pagesize);
		sp.setPageno(pageno);
		sp.setPagesize(pagesize);
		List<UserOrder> orders=new ArrayList<>();
		
		if(user.getUname()!=null&&user.getUname()!="") {
			List<User> users=usi.findAll(user);
			for(User u:users) {
				List<UserOrder> os=uosi.findByUserid(u.getUserid());
				for(UserOrder o:os) {
					orders.add(o);
				}
			}
			// 将分页信息导入
			PageInfo<UserOrder> pi = new PageInfo<UserOrder>(orders);
			if (pi.getPages() >= 5) {
				pi.calcByNavigatePages(5);
			} else {
				pi.calcByNavigatePages(pi.getPages());
			}
			map.put("pi", pi);
			map.put("orders", orders);
			return "backstage/orderback";
		}else if(comm.getCommname()!=null&&comm.getCommname()!="") {
			List<Commodity> comms=csi.findAll(comm);
			for(Commodity c:comms) {
				List<UserOrder> os=uosi.findByCommid(c.getCommid());
				for(UserOrder o:os) {
					orders.add(o);
				}
			}
			// 将分页信息导入
			PageInfo<UserOrder> pi = new PageInfo<UserOrder>(orders);
			if (pi.getPages() >= 5) {
				pi.calcByNavigatePages(5);
			} else {
				pi.calcByNavigatePages(pi.getPages());
			}
			map.put("pi", pi);
			map.put("orders", orders);
			return "backstage/orderback";
		}else if(orderstate!=null&&orderstate!="") {
			if("是".equals(orderstate)) {
				order.setState("1");
			}else if("否".equals(orderstate)) {
				order.setState("0");
			}
		}
		orders = uosi.findAllOrders(order);
		// 将分页信息导入
		PageInfo<UserOrder> pi = new PageInfo<UserOrder>(orders);
		if (pi.getPages() >= 5) {
			pi.calcByNavigatePages(5);
		} else {
			pi.calcByNavigatePages(pi.getPages());
		}
		map.put("pi", pi);
		map.put("orders", orders);
		return "backstage/orderback";
	}
	//批量删除订单
	@RequestMapping("/delcheckorder")
	@ResponseBody
	public String delCheckOrder(String orderid) {
		boolean success=false;
		String[] orderids=orderid.split(",");
		int a=0;
		for(int i=0;i<orderids.length;i++) {
			UserOrder uo=uosi.findByOrderid(orderids[i]);
			if("0".equals(uo.getState())) {
				success=false;
				return "{\"success\":"+success+"}";
			}
		}
		for(int i=0;i<orderids.length;i++) {
			uosi.delByOrderid(orderids[i]);
			a++;
		}
		if(a==orderids.length) {
			success=true;
		}
		return "{\"success\":"+success+"}";
	}
	//后台删除单个订单
	@PostMapping("/orderdelajax")
	@ResponseBody
	public String orderDelAjax(String orderid) {
		boolean success=false;
		UserOrder uo=uosi.findByOrderid(orderid);
		if("0".equals(uo.getState())) {
			success=false;
			return "{\"success\":"+success+"}";
		}
		int a=uosi.delByOrderid(orderid);
		if(a==1) {
			success=true;
		}
		return "{\"success\":"+success+"}";
	}
	
	//图书订单退货操作
	@PostMapping("/returnbook")
	@ResponseBody
	public String returnBook(String orderid) {
		boolean success=false;
		UserOrder order=uosi.findByOrderid(orderid);
		Commodity comm=order.getComm();
		User user=order.getUser();
		if(order.getState()=="已支付") {
			int price=user.getMoney()+order.getPrice();
			user.setMoney(price);
			usi.updateMoney(user);	
		}
		int a=uosi.delByOrderid(orderid);
		int b=csi.updateCommCount(comm.getCommid(), comm.getCount()+order.getCount());
		if(a==1&&b==1) {
			success=true;
		}
		return "{\"success\":"+success+"}";
	}
	
	//图书借阅归还操作
		@PostMapping("/bookreturn")
		@ResponseBody
		public String bookReturn(String orderid) {
			boolean success=false;
			UserOrder order=uosi.findByOrderid(orderid);
			Commodity comm=order.getComm();
			User user=order.getUser();
			if(order.getState()=="已支付") {
				int price=user.getMoney()+order.getPrice();
				user.setMoney(price);
				usi.updateMoney(user);	
			}
			int a=uosi.updateOrderReturn(orderid);
			int b=csi.updateCommCount(comm.getCommid(), comm.getCount()+order.getCount());
			if(a==1&&b==1) {
				success=true;
			}
			return "{\"success\":"+success+"}";
		}
		
		//跳转我的信息页面
		@RequestMapping("/meuser")
		public String meUser(String userid,Map<String,Object> map) {
			User user=usi.findByUser(userid);
			List<UserOrder> orders=uosi.orderByTime(userid);
			List<UserOrder> neworders=new ArrayList<>();
			if(orders.size()>=8) {
				for(int i=0;i<8;i++) {
					UserOrder order=orders.get(i);
					neworders.add(order);
				}
			}else {
				for(int i=0;i<orders.size();i++) {
					UserOrder order=orders.get(i);
					neworders.add(order);
				}
			}
			map.put("user", user);
			map.put("orders", neworders);
			return "front/user";
		}
		
	//筛选相应订单
	@PostMapping("showcheck")
	public String showCheck(String name,Map<String,Object> map) {
		UserOrder order=new UserOrder();
		if(name.equals("all")) {
			List<UserOrder> orders=uosi.findAllOrders(null);
			map.put("orders", orders);
			return "front/order";
		}else if(name.equals("afford")) {
			order.setState("0");
			order.setIsreturn(null);
			order.setSubcribe(null);
			List<UserOrder> orders=uosi.findAllOrders(order);
			map.put("orders", orders);
			return "front/order";
		}else if(name.equals("finish")) {
			order.setIsreturn(null);
			order.setSubcribe("Y");
			List<UserOrder> orders=uosi.findAllOrders(order);
			map.put("orders", orders);
			return "front/order";
		}else {
			order.setSubcribe("Y");
			order.setIsreturn("Y");
			List<UserOrder> orders=uosi.findAllOrders(order);
			map.put("orders", orders);
			return "front/order";
		}
	}
}
