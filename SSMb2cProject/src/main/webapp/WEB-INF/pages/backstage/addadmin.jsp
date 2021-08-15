<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<base href="${ctx}/">
<meta charset="UTF-8">
<title>请输入您想要增加的信息！</title>
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
.layui-form-item .description{
width:800px;
}
</style>
</head>
<body>
	<div class="title">请添加管理员信息</div>
	<hr />
	<form class="layui-form form" action="admin/insertadmin" method="post">
		<div class="layui-form-item">
			<label class="layui-form-label">管理员ID</label>
			<div class="layui-input-inline">
				<input type="text" name="adminid" lay-verify="adminid" lay-filter="test"
					value="${admin.adminid }" placeholder="请输入管理员ID" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">管理员名称</label>
			<div class="layui-input-inline">
				<input type="text" name="aname" lay-verify="aname"
					value="${admin.aname }" placeholder="请输入管理员名称" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">管理员密码</label>
			<div class="layui-input-inline">
				<input type="text" name="password" lay-verify="password"
					value="${admin.password }" placeholder="请输入管理员密码" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">管理员电话</label>
			<div class="layui-input-inline">
				<input type="text" name="phone" lay-verify="rootid" 
					value="${admin.phone }" placeholder="请输入管理员电话" autocomplete="off" class="layui-input">
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
	<hr />
	<script src="assest/layui.all.js"></script>
	<script src="assest/layui.js"></script>
	<script src="assest/js/jquery-3.4.1.min.js" type="text/javascript"
		charset="utf-8"></script>
	<!-- 配置文件 -->
	<script type="text/javascript" src="assest/lib/ueditor/ueditor.config.js"></script>
	<!-- 编辑器源码文件 -->
	<script type="text/javascript" src="assest/lib/ueditor/ueditor.all.js"></script>
	<script type="text/javascript">
		$(function(){
			$(".back").click(function(){
				$(".form").attr("action","admin/selectadmin");
				$(".form").submit();
			});
		});
	</script>
</body>
</html>