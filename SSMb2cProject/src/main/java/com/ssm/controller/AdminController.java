package com.ssm.controller;


import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.modle.Admin;
import com.ssm.modle.SuperPage;
import com.ssm.serviceimpl.AdminServiceImpl;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private AdminServiceImpl asi;
	//登入管理员页面
	@RequestMapping("/login")
	public String login(HttpSession sess) {
		if(sess.getAttribute("@admin")!=null) {
			sess.removeAttribute("@admin");
		}
		return "front/adminlogin";
	}
	//提交进入后台
	@PostMapping("/submit")
	public String submit(String adminid,String password,HttpServletRequest req,Map<String,Object> map) {
		
		Admin admin=asi.findByAdminid(adminid);
		if(admin==null) {
			map.put("error", "查无此管理员！");
			return "front/adminlogin";
		}else if(password.contentEquals(admin.getPassword())) {
			HttpSession session=req.getSession();
			session.setAttribute("@admin", admin);
			map.put("admin",admin);
			return "backstage/backstageframe";
		}
		map.put("error", "密码输入错误！");
		return "front/adminlogin";
	}
	
	//跳转找回页面
	@RequestMapping("/adminforget")
	public String adminForget() {
		return "front/adminforget";
	}
	
	//管理员找回密码
		@RequestMapping("/adminfind")
		public String adminFind(String adminid,String password,Map<String,String> map) {
			String error=null;
			Admin admin=asi.findByAdminid(adminid);
			if(admin==null) {
				error="抱歉！查无此管理员";
				map.put("error", error);
				return "front/adminforget";
			}
			int a=asi.updateAdmin(adminid,password);
			if(a==1) {
				error="找回密码成功！点击登入即可登入";
				map.put("error", error);
				return "front/adminforget";
			}
			error="抱歉！修改失败";
			map.put("error", error);
			return "front/adminforget";
		}
		
		// 跳转到用户信息页面
		@RequestMapping("/selectadmin")
		public String commodityback(Admin admin, SuperPage sp, Map<String, Object> map) {
			// 进行分页操作
			int pageno = sp.getPageno() == 0 ? 1 : sp.getPageno();
			int pagesize = sp.getPagesize() == 0 ? 10 : sp.getPagesize();
			PageHelper.startPage(pageno, pagesize);
			sp.setPageno(pageno);
			sp.setPagesize(pagesize);
			// 将分页信息导入
			List<Admin> admins = asi.findAll(admin);
			PageInfo<Admin> pi = new PageInfo<Admin>(admins);
			if (pi.getPages() >= 5) {
				pi.calcByNavigatePages(5);
			} else {
				pi.calcByNavigatePages(pi.getPages());
			}
			map.put("pi", pi);
			map.put("admins", admins);
			return "backstage/adminback";
		}
		//跳转添加管理员界面
		@PostMapping("/addadminjsp")
		public String addAdminjsp(Map<String,Object> map) {
			map.put("admin", null);
			return "backstage/addadmin";
		}
		//对管理员进行添加
		@PostMapping("/insertadmin")
		public String insertAdmin(Admin admin,Map<String,Object> map) {
			Admin admintext=asi.findByAdminid(admin.getAdminid());
			map.put("admin", admin);
			if(admintext!=null) {
				map.put("error", "该管理员已存在，请重新输入管理员ID!");
				return "backstage/addadmin";
			}
			if(admin.getAdminid()==null||admin.getAdminid()=="") {
				map.put("error", "管理员id不允许为空!");
				return "backstage/addadmin";
			}
			if(admin.getAname()==null||admin.getAname()=="") {
				map.put("error", "管理员姓名不允许为空!");
				return "backstage/addadmin";
			}
			if(admin.getPassword()==null||admin.getPassword()=="") {
				map.put("error", "管理员密码不允许为空!");
				return "backstage/addadmin";
			}
			if(admin.getPhone()==null||admin.getPhone()=="") {
				map.put("error", "管理员手机不允许为空!");
				return "backstage/addadmin";
			}
			if(admin.getPassword().length()<=6) {
				map.put("error", "管理员的密码长度小于6位，请重新填写!");
				return "backstage/addadmin";
			}
			if(admin.getPhone().length()!=11) {
				map.put("error", "管理员的电话长度不为11位，请重新填写!");
				return "backstage/addadmin";
			}
			int a=asi.insertAdmin(admin);
			if(a==1) {
				map.put("error", "管理员成功添加!");
			}
			return "backstage/addadmin";
		}
		
		//批量删除管理员
		@PostMapping("/delcheckadmin")
		@ResponseBody
		public String delCheckAdmin(String ids) {
			boolean success=false;
			List<String> adminids=Arrays.asList(ids.split(","));
			int count=0;
			for(String adminid:adminids) {
				int a=asi.delById(adminid);
				if(a==1) {
					count++;
				}
			}
			if(count==adminids.size()) {
				success=true;
			}
			return "{\"success\":"+success+"}";
		}
		//对管理员进行删除
		@PostMapping("/deladmin")
		@ResponseBody
		public String delAdmin(String adminid) {
			boolean success=true;
			int a=asi.delById(adminid);
			if(a==1) {
				success=true;
			}
			return "{\"success\":"+success+"}";
		}
		
}
