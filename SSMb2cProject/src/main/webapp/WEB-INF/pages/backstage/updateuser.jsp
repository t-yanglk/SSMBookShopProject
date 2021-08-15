<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<base href="${ctx}/">
<meta charset="UTF-8">
<title>请输入您想要修改的用户信息！</title>
<link rel="stylesheet" type="text/css" href="assest/lib/validform_5.3.2/css/style.css" />
<link rel="stylesheet" type="text/css" href="assest/css/reset.css" />
<link rel="stylesheet" href="assest/css/layui.css" media="all">
<link href="assest/css/layui.mobile.css" />
<style type="text/css">
html,body{
height:100%;
width:100%;
}
body{
margin: 0;
padding: 0;
}
.title,.form{
width:400px;
margin: 0 auto !important;
text-align: center;
}
.title{
font-family:隶书;
font-size: 20px;
}
</style>
</head>
<body>
<div class="title">请对用户进行修改！</div>
<hr/>
	<form class="layui-form form" action="user/updateuser" method="post">
		<div class="layui-form-item">
			<label class="layui-form-label">用户ID</label>
			<div class="layui-input-inline">
				<input type="text" name="userid" required value="${user.userid }"
					readonly="readonly" lay-verify="required" placeholder="请输入用户ID"
					autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">用户名称</label>
			<div class="layui-input-inline">
				<input type="text" name="uname" required value="${user.uname }" readonly="readonly"
					lay-verify="required" placeholder="请输入用户名称" autocomplete="off"
					class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">用户密码</label>
			<div class="layui-input-inline">
				<input type="text" name="password" readonly="readonly" lay-verify="required" placeholder="请输入用户密码"
					value="${user.password }" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">用户电话</label>
			<div class="layui-input-inline">
				<input type="text" name="phone" required value="${user.phone }" readonly="readonly"
					lay-verify="required" placeholder="请输入用户电话" autocomplete="off"
					class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">用户资金</label>
			<div class="layui-input-inline">
				<input type="text" name="money" lay-verify="required" placeholder="请输入用户资金"
					value="${user.money }" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div style="font-family:幼圆;font-size:10px;color:red;height: 20px;line-height: 20px">${error }</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button type="submit" class="layui-btn layui-btn-lg">确认</button>
				<button type="button" class="layui-btn layui-btn-lg back">返回</button>
			</div>
		</div>
	</form>
	<hr/>
	<script src="assest/layui.all.js"></script>
	<script src="assest/layui.js"></script>
	<script src="assest/js/jquery-3.4.1.min.js" type="text/javascript"
		charset="utf-8"></script>
	<script type="text/javascript">
	$(function(){
		$(".back").click(function(){
			$(".form").attr("action","user/selectuser");
			$(".form").submit();
		});
	});
	</script>
</body>
</html>