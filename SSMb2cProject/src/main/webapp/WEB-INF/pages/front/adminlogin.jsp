<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
	<head>
	<base href="${ctx }/">
		<meta charset="utf-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="assest/lib/validform_5.3.2/css/style.css" />
		<link rel="stylesheet" type="text/css" href="assest/css/reset.css" />
		<link rel="stylesheet" type="text/css" href="assest/css/login.css"/>
	</head>
	<body>
		<div class="background">
			<div class="container">
				<span>基于SSM框架的网上书城</span>
			</div>
		</div>
		<div class="register_frame">
			<div class="title clearfix">		
				<div class="register_title fl">管理员账号登陆</div>
			</div>
			<div class="content">
				<!-- 账号登陆 -->
				<div class="register_content">
					<form class="form" action="admin/submit" method="post">
						<div class="form_list">
							<div class="list ">
								<div class="list_two "><input type="tel" id="tel" placeholder="账号" datatype="*" name="adminid"   nullmsg="请输入你的账号" class="tel_phone"/></div>
							</div>
							<div class="error-tip "></div>
						</div>
						<div class="form_list">
							<div class="list ">
								<div class="list_two "><input type="password" id="tel" placeholder="密码" datatype="*" name="password"   nullmsg="请输入你的密码" class="tel_phone"/></div>
						</div>
						<div style="font-family:幼圆;font-size:10px;color:red;height: 20px;line-height: 20px">${error }</div>
						<div class="account_btn"><button type="submit" class="account">登陆</button></div>
						<div class="rem_list"></div>
						<div class="more">
							<a href="admin/adminforget">忘记密码</a>
						</div>
					</form>
				</div>
			</div>
		</div>
		<script src="assest/js/jquery-3.4.1.min.js"></script>
		<script src="assest/lib/validform_5.3.2/js/Validform_v5.3.2_min.js" type="text/javascript" charset="utf-8"></script>
		<script src="assest/js/login.js" type="text/javascript" charset="utf-8"></script>
	</body>
</html>
