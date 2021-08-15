package com.ssm.controller;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.code.kaptcha.Producer;
import com.ssm.modle.Catalogue;
import com.ssm.modle.Commodity;
import com.ssm.modle.SuperPage;
import com.ssm.modle.User;
import com.ssm.modle.UserCart;
import com.ssm.serviceimpl.CatalogueServiceImpl;
import com.ssm.serviceimpl.CommodityServiceImpl;
import com.ssm.serviceimpl.UserCartServiceImpl;
import com.ssm.serviceimpl.UserServiceImpl;
import com.ssm.util.CheckId;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private Producer captchaProducer;
	@Autowired
	private UserServiceImpl usi;
	@Autowired
	private CatalogueServiceImpl csi;
	@Autowired
	private UserCartServiceImpl ucsi;
	@Autowired
	private CommodityServiceImpl cosi;
	MessageDigest m = null;
	String result = "";
	private String text;
	//用户登入
	@RequestMapping("/login")
	public String login(HttpSession sess) {
		if (sess.getAttribute("ssmuser") != null) {
			sess.removeAttribute("ssmuser");
		}
		return "front/userlogin";
	}

	/* 获取验证码图片 */
	@RequestMapping("/apthca")
	public void getVerificationCode(HttpServletResponse response, HttpServletRequest request) throws IOException {
		text = captchaProducer.createText();
		HttpSession session = request.getSession();
		session.setAttribute("text", text);
		BufferedImage image = captchaProducer.createImage(text);
		ServletOutputStream outputStream = response.getOutputStream();
		ImageIO.write(image, "jpg", outputStream);
	}
	//提交登入
	@PostMapping("/submit")
	public String submit(String userid, String password,String capthca,HttpServletRequest req) {
		User user = usi.findByUser(userid);
		if (user == null) {
			req.setAttribute("error", "用户不存在！");
			return "forward:/user/login";
		}else if(!text.equals(capthca)) {
			req.setAttribute("error", "验证码输入错误！");
			return "forward:/user/login";
		}else if (password.contentEquals(user.getPassword())) {
			HttpSession session = req.getSession();
			session.setAttribute("ssmuser", user);
			req.setAttribute("user", user);
			return "forward:/user/cart";
		}else {
			req.setAttribute("error", "密码输入错误！");
			return "forward:/user/login";
		}
	}

	// 注册提交
	@PostMapping("/regsubmit")
	public String regSubmit(User user, Map<String, String> map) {
		List<User> us = usi.findAll(null);
		boolean flax = CheckId.checkUserId(user.getUserid(), us);
		if (!flax) {
			map.put("error", "该账号已被人注册，请重新注册！");
			return "front/userregister";
		}
		try {
			m = MessageDigest.getInstance("MD5");
			m.update(user.getPassword().getBytes("UTF8"));
			byte s[] = m.digest();
			for (int i = 0; i < s.length; i++) {
				result += Integer.toHexString((0x000000ff & s[i]) | 0xffffff00).substring(6);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		map.put("uname", user.getUname());
		map.put("uid", user.getUserid());
		map.put("password", result);
		map.put("phone", user.getPhone());
		try {
			int num = usi.insertUser(map);
			if (num > 0) {
				return "front/userlogin";
			}
		}catch(Exception e) {
			map.put("error", "用户id过长，请及时修正在10位以内！");
			return "front/userregister";	
		}
		return "front/userregister";
	}

	// 跳转到用户信息页面
	@RequestMapping("/selectuser")
	public String commodityback(User user, SuperPage sp, Map<String, Object> map) {
		// 进行分页操作
		int pageno = sp.getPageno() == 0 ? 1 : sp.getPageno();
		int pagesize = sp.getPagesize() == 0 ? 10 : sp.getPagesize();
		PageHelper.startPage(pageno, pagesize);
		sp.setPageno(pageno);
		sp.setPagesize(pagesize);
		// 将分页信息导入
		List<User> users = usi.findAll(user);
		PageInfo<User> pi = new PageInfo<User>(users);
		if (pi.getPages() >= 5) {
			pi.calcByNavigatePages(5);
		} else {
			pi.calcByNavigatePages(pi.getPages());
		}
		map.put("pi", pi);
		map.put("users", users);
		return "backstage/userback";
	}
	
	@PostMapping("/updateuserjsp")
	public String updateUserjsp(String userid,Map<String,Object> map) {
		User user=usi.findByUser(userid);
		map.put("user", user);
		return "backstage/updateuser";
	}
	
	@PostMapping("/updateuser")
	public String updateUser(User user,Map<String,Object> map) {
		try {
			int a=usi.updateMoney(user);
			if(a==1) {
				map.put("user", user);
				map.put("error", "修改钱包信息成功！");
			}
		}catch(Exception e) {
			map.put("error", "请输入正确资金格式以及数值！");
			return "backstage/updateuser";
		}
		return "backstage/updateuser";
	}
	
	@PostMapping("/delcheckuser")
	@ResponseBody
	public String delCheckUsers(String userid) {
		List<String> userids=Arrays.asList(userid.split(","));
		boolean success=true;
		int count=0;
		for(String id:userids) {
			int a=usi.delById(id);
			if(a==1) {
				count++;
			}
		}
		if(count==userids.size()) {
			success=true;
		}
		return "{\"success\":"+success+"}";
	}
	
	@PostMapping("/deluser")
	@ResponseBody
	public String delUser(String userid) {
		boolean success=true;
		int a=usi.delById(userid);
		if(a==1) {
			success=true;
		}
		return "{\"success\":"+success+"}";
	}

	// 跳转注册页面
	@RequestMapping("/register")
	public String register() {
		return "front/userregister";
	}

	// 跳转找回页面
	@RequestMapping("/userforget")
	public String userForget() {
		return "front/user_forget";
	}

	// 用户找回密码
	@RequestMapping("/userfind")
	public String userFind(String userid, String password, Map<String, String> map) {
		String error = null;
		User user = usi.findByUser(userid);
		if (user == null) {
			error = "抱歉！查无此用户";
			map.put("error", error);
			return "front/user_forget";
		}
		int a = usi.updatepassword(userid, password);
		if (a == 1) {
			error = "找回密码成功！点击登入即可登入";
			map.put("error", error);
			return "front/user_forget";
		}
		error = "抱歉！修改失败";
		map.put("error", error);
		return "front/user_forget";
	}

	// 跳转首页请求
	@RequestMapping("/index")
	public String index(Map<String, Object> map, HttpSession sess) {
		User user = (User) sess.getAttribute("ssmuser");
		// 查询所有一级类别
		List<Catalogue> catas=csi.findDepthItem(1);
		for(Catalogue cata:catas) {
			List<Commodity> newcomms=new ArrayList<Commodity>();
			List<Commodity> comms=cata.getRootcomms();
			for(int i=0;i<5;i++) {
				newcomms.add(comms.get(i));
			}
			cata.setRootcomms(newcomms);
		}
		//浏览量前几名图书展示
		List<Commodity> comms=cosi.selectDescPrice();
		List<Commodity> desccomms=new ArrayList<>();
		for(int i=0;i<8;i++) {
			desccomms.add(comms.get(i));
		}
		map.put("user", user);
		map.put("comms", desccomms);
		map.put("catas", catas);
		return "front/index";
	}

	// 跳转商品详情页面
	@RequestMapping("/selldetails")
	public String selldetails(String commid, Map<String, Object> map) {
		Commodity comm = cosi.findById(commid);
		Catalogue rootcata = csi.findByCataid(comm.getRootid());
		Catalogue precata = csi.findByCataid(comm.getPreid());
		map.put("comm", comm);
		map.put("rootcata", rootcata);
		map.put("precata", precata);
		return "front/sell_details";
	}

	// 跳转分类详情页面
	@RequestMapping("/selllist")
	public String sellList(String rootid, Map<String, Object> map) {
		List<Catalogue> catas = csi.findDepthItem(1);
		List<Commodity> comms = cosi.findCommsByRootid(rootid);
		Catalogue cata = csi.findByCataid(rootid);
		map.put("cata", cata);
		map.put("catas", catas);
		map.put("comms", comms);
		return "front/sell_list";
	}
	
	// 跳转二级分类详情页面
		@RequestMapping("/cataselllist")
		public String cataSellList(String preid,Map<String, Object> map) {
			List<Catalogue> catas = csi.findDepthItem(1);
			List<Commodity> comms = cosi.findCommsByPreid(preid);
			Catalogue cata = csi.findByCataid(preid);
			map.put("cata", cata);
			map.put("catas", catas);
			map.put("comms", comms);
			return "front/catasell_list";
		}

	// 跳转购物车请求
	@RequestMapping("/cart")
	public String myCart(UserCart cart, HttpSession sess, Map<String, Object> map) {
		User user = (User) sess.getAttribute("ssmuser");
		if (user == null) {
			return "user/login";
		}
		cart.setUserid(user.getUserid());
		if (cart.getCommid() != null) {
			UserCart uo = ucsi.findCommCart(cart);
			if (uo != null) {
				int count = uo.getCommcount() + cart.getCommcount();
				uo.setCommcount(count);
				ucsi.updateCommCount(uo);
			} else {
				ucsi.insertCart(cart);
			}
		}
		// 查询登入用户的相关订单
		List<UserCart> carts = ucsi.findByUid(user.getUserid());
		map.put("carts", carts);
		map.put("user", user);
		return "front/cart";
	}
	
	//跳转账号请求页面
	@GetMapping("usercenter")
	public String userCenter(String userid,Map<String,Object> map) {
		User user=usi.findByUser(userid);
		map.put("user",user);
		return "front/user_center";
	}

	// 提交结算请求
	@RequestMapping("/refer")
	public String usercart() {
		return "front/order_refer";
	}
}
