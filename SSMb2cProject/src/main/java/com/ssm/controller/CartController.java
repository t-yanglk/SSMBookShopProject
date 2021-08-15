package com.ssm.controller;

import java.util.Arrays;
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
import com.ssm.modle.UserCart;
import com.ssm.modle.UserOrder;
import com.ssm.serviceimpl.CommodityServiceImpl;
import com.ssm.serviceimpl.UserCartServiceImpl;
import com.ssm.serviceimpl.UserServiceImpl;
import com.ssm.util.RandomClass;

/**
 * 用户购物车操作
 * 
 * @author ASUS
 *
 */
@Controller
@RequestMapping("/cart")
public class CartController {
	@Autowired
	private UserCartServiceImpl ucsi;
	@Autowired
	private UserServiceImpl usi;
	@Autowired
	private CommodityServiceImpl csi;


	// 对单个用户购物车进行删除
	@PostMapping("/cartdel")
	@ResponseBody
	public String cartDel(String userid, String commid) {
		boolean success = false;
		int a = ucsi.delCartComm(userid, commid);
		if (a > 0) {
			success = true;
		}
		return "{\"success\":" + success + "}";
	}

	// 删除某个用户的所有购物车
	@PostMapping("/cartdelall")
	@ResponseBody
	public String delAllUserComm(String userid, String commids) {
		boolean success = false;
		int a = 0;
		String[] ids = commids.split(",");
		for (int i = 0; i < ids.length; i++) {
			ucsi.delCartComm(userid, ids[i]);
			a++;
		}
		if (a == ids.length) {
			success = true;
		}
		return "{\"success\":" + success + "}";
	}

	// 对商品进行添加购物车
	@PostMapping("/addcart")
	@ResponseBody
	public String addCartComm(UserCart cart,HttpSession sess) {
		boolean success = false;
		User user = (User) sess.getAttribute("ssmuser");
		if(user!=null) {
			cart.setUserid(user.getUserid());
		}
		// 判断用户是否购买过此商品，若购买过，则使得其数量加一
		if (cart.getCommid() != null) {
			//使得该商品的销售量加一
			Commodity comm=csi.findById(cart.getCommid());
			int sales=comm.getSelasvolume()+1;
			csi.updateSales(cart.getCommid(),sales);
			UserCart uo = ucsi.findCommCart(cart);
			if (uo != null) {
				int count = uo.getCommcount() + 1;
				uo.setCommcount(count);
				int a=ucsi.updateCommCount(uo);
				if(a==1) {
					success=true;
				}
			} else {
				int a=ucsi.insertCart(cart);
				if(a==1) {
					success=true;
				}
			}
		}
		return "{\"success\":" + success + "}";
	}

	// 跳转购物车后台页面
	@RequestMapping("/selectcart")
	public String selectIndent(SuperPage sp, UserCart cart, User user, Commodity comm, Map<String, Object> map) {
		int pageno = sp.getPageno() == 0 ? 1 : sp.getPageno();
		int pagesize = sp.getPagesize() == 0 ? 10 : sp.getPagesize();
		PageHelper.startPage(pageno, pagesize);
		sp.setPageno(pageno);
		sp.setPagesize(pagesize);
		// 将分页信息导入
		List<UserCart> carts = null;
		// 根据用户名称进行查询
		if (user.getUname() != null && user.getUname() != "") {
			List<User> users = usi.findAll(user);
			for (User u : users) {
				carts = ucsi.findByUid(u.getUserid());
			}
			// 根据商品名称进行查询
		} else if (comm.getCommname() != null && comm.getCommname() != "") {
			List<Commodity> comms = csi.findAll(comm);
			for (Commodity c : comms) {
				carts = ucsi.findByCommid(c.getCommid());
			}
		} else {
			carts = ucsi.findAllCart(cart);
		}
		PageInfo<UserCart> pi = new PageInfo<UserCart>(carts);
		if (pi.getPages() >= 5) {
			pi.calcByNavigatePages(5);
		} else {
			pi.calcByNavigatePages(pi.getPages());
		}
		map.put("pi", pi);
		map.put("carts", carts);
		return "backstage/cartback";
	}

	// 跳转用户购物车订单页面
	@RequestMapping("/submitcart")
	public String submitCart(UserOrder order,HttpSession session,Map<String, Object> map) {
		
		String orderid=RandomClass.randomOrderId();
		order.setOrderid(orderid);
		order.setComm(csi.findById(order.getCommid()));
		order.setUser(usi.findByUser(order.getUserid()));
		User user=(User) session.getAttribute("ssmuser");
		if(user!=null) {
			map.put("user", user);
		}else {
			return "forward:/user/login";
		}
		int count=csi.findById(order.getCommid()).getCount();
		if(count<order.getCount()) {
			map.put("error", "订单提交失败，该商品数量超过库存，请重新选择！");
			map.put("commid", order.getCommid());
			return "forward:/user/selldetails";
		}
		map.put("order", order);
		return "front/order_confirm";
	}

	// 购物车增加数量Ajax
	@PostMapping("/addGoodsCount")
	@ResponseBody
	public String addCartCount(String count, UserCart cart) {
		boolean success = false;
		int num = Integer.valueOf(count);
		num += 1;
		cart.setCommcount(num);
		int a = ucsi.updateCommCount(cart);
		if (a == 1) {
			success = true;
		}
		return "{\"success\":" + success + "}";
	}

	// 购物车减少数量Ajax
	@PostMapping("/reduceGoodsCount")
	@ResponseBody
	public String reduceCartCount(String count, UserCart cart) {
		boolean success = false;
		int num = Integer.valueOf(count);
		if (num != 1) {
			num -= 1;
			cart.setCommcount(num);
			int a = ucsi.updateCommCount(cart);
			if (a == 1) {
				success = true;
			}
		} else {
			success = true;
		}
		return "{\"success\":" + success + "}";
	}
	//后端委托批量删除购物车
	@PostMapping("/delcheckcart")
	@ResponseBody
	public String delCheckCart(String[] userids,String[] commids) {
		boolean success=false;
		List<String> uids=Arrays.asList(userids);
		List<String> cids=Arrays.asList(commids);
		int a=0;
		for(int i=0;i<uids.size();i++) {
			int b=ucsi.delCartComm(uids.get(i), cids.get(i));
			if(b==1) {
				a+=1;
			}
		}
		if(a==uids.size()) {
			success=true;
		}
		return "{\"success\":"+success+"}";
	}
	//后台委托删除单个购物车
	@PostMapping("/cartdelajax")
	@ResponseBody
	public String delCart(String userid,String commid) {
		boolean success=false;
		int a=ucsi.delCartComm(userid, commid);
		if(a==1) {
			success=true;
		}
		return "{\"success\":"+success+"}";
	}
}
