package com.ssm.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
//配置用户拦截器，拦截非登入请求
public class UserInterceptor implements HandlerInterceptor {
	//前置处理
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session=request.getSession();
		if(session.getAttribute("ssmuser")==null) {
			response.sendRedirect(request.getContextPath()+"/user/login");
			return false;	
		}
		return true;
		}
}
