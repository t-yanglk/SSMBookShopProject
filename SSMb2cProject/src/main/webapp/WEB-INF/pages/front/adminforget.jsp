<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
	<head>
		<base href="${ctx }/">
		<meta charset="utf-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="assest/lib/Validform_5.3.2/css/style.css" />
		<link rel="stylesheet" type="text/css" href="assest/css/reset.css" />
		<link rel="stylesheet" type="text/css" href="assest/css/register.css" />
		<style type="text/css">
			input{
				background-color: white !important;
			}
			.error{
				color:red;
			}
		</style>
	</head>
	<body>
		<div class="head">
			<div class="container clearfix">
				<img src="assest/img/login/head-top.svg">
				<span>|</span>
				<span>SSM书城</span>
			</div>
		</div>
		<div class="container">
			<div class="title clearfix">
				<div class="fl">
					<div class="skip skip_one"><button type="button"><img src="assest/img/login/2.png">找回密码</button></div>
				</div>
				<div class="login fr">想起密码<a href="admin/login">登陆</a></div>
			</div>
			
			<div class="main">
					<!-- 管理员注册 -->
					<div class="content ">
						<div class="phone_title">管理员找回密码</div>
						<div class="phone_explain">找回密码，轻松登入</div>
						<form class="form" action="admin/adminfind" method="post">
							<!-- 管理员账号 -->
							<div class="form_list">
								<div class="list clearfix">
									<div class="list_one fl"><span>账号:</span></div>
									<div class="list_two fl"><input type="text" placeholder="请输入账号" nullmsg="必须填写账号" datatype="s6-18" errormsg="账号至少6个字符" name="adminid"/></div>
								</div>
								<div class="error-tip "></div>
							</div>
							<!-- 密码 -->
							<div class="form_list">
								<div class="list clearfix">
									<div class="list_one fl"><span>新密码:</span></div>
									<div class="list_two fl"><input type="password" id="password" placeholder="输入密码" nullmsg="必须填写密码" datatype="s6-18"
										 errormsg="密码至少6个字符" name="password" /></div>
								</div>
								<div class="error-tip "></div>
							</div>
							<!-- 确认密码 -->
							<div class="form_list" >
								<div class="list clearfix">
									<div class="list_one fl"><span>密码:</span></div>
									<div class="list_two fl"><input type="password" id="recheck" placeholder="再次输入密码"  recheck="password"  datatype="*" errormsg="两次输入的密码不一致"/></div>
								</div>
								<div class="error-tip "></div>
							</div>
							<div class="error">${error}</div>
							<button type="submit" class="phone_register">找回</button>
						</form>
					</div>
			</div>
			<div class="tail">
				<div>书城账号与云空间管理员协议&nbsp;&nbsp;关于书城账号与云空间隐私的声明&nbsp;&nbsp;常见问题&nbsp;&nbsp;Cookies</div>
				<div>Copyright@2011-2019 书城软件技术有限公司 版权所有 保留一切权力</div>
			</div>
		</div>
		<script src="assest/js/jquery-3.4.1.min.js"></script>
		<script src="assest/lib/validform_5.3.2/js/Validform_v5.3.2_min.js" type="text/javascript" charset="utf-8"></script>
		<script src="assest/js/register.js"></script>
	</body>
</html>
