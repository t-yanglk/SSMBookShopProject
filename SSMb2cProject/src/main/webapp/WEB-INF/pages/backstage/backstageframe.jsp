<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<base href="${ctx}/">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>后台管理</title>
<link rel="stylesheet" href="assest/css/layui.css">
<link rel="stylesheet" href="assest/css/backstage.css">
</head>
<body class="layui-layout-body">
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<div class="layui-logo titlecss">SSM后台管理系统</div>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item"><a href="javascript:;"> <img
						src="http://t.cn/RCzsdCq" class="layui-nav-img">
						${admin.aname }
				</a></li>
				<li class="layui-nav-item"><a href="admin/login">退出登入</a></li>
			</ul>
		</div>

		<div class="layui-side layui-bg-black">
			<div class="layui-side-scroll">
				<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
				<ul class="layui-nav layui-nav-tree" lay-filter="test">

					<li class="layui-nav-item"><a class="fontcss"
						href="javascript:;">详情管理</a>
						<dl class="layui-nav-child">
							<dd>
								<div class="fontcsstwo comm">商品管理</div>
							</dd>
							<dd>
								<div class="fontcsstwo cata">分类管理</div>
							</dd>
						</dl></li>
					<li class="layui-nav-item "><a class="fontcss"
						href="javascript:;">信息管理</a>
						<dl class="layui-nav-child">
							<dd>
								<div class="fontcsstwo indent">订单管理</div>
							</dd>
							<dd>
								<div class="fontcsstwo cart">购物车管理</div>
							</dd>
						</dl></li>
					<li class="layui-nav-item "><a class="fontcss"
						href="javascript:;">热销统计</a>
						<dl class="layui-nav-child">
							<dd>
								<div class="fontcsstwo cataloguechart">分类浏览视图</div>
							</dd>
							<dd>
								<div class="fontcsstwo bookechart">图书热销统计</div>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><div class="fontcss user">用户管理</div></li>
					<li class="layui-nav-item"><div class="fontcss admin">管理员管理</div></li>
				</ul>
			</div>
		</div>

		<div class="layui-body">
			<!-- 内容主体区域 -->
			<iframe class="iframe" src="commodity/selectcomm"></iframe>
		</div>

	</div>
	<script src="assest/layui.js"></script>
	<script src="assest/js/jquery-3.4.1.min.js" type="text/javascript"
		charset="utf-8"></script>
	<script>
		//JavaScript代码区域
		layui.use('element', function() {
			var element = layui.element;
		});

		$(".comm").click(function() {
			$(".iframe").attr("src", "commodity/selectcomm");
		});
		$(".cata").click(function() {
			$(".iframe").attr("src", "catalogue/selectcata");
		});
		$(".indent").click(function() {
			$(".iframe").attr("src", "order/selectindent");
		});
		$(".cart").click(function() {
			$(".iframe").attr("src", "cart/selectcart");
		});
		$(".user").click(function() {
			$(".iframe").attr("src", "user/selectuser");
		});
		$(".admin").click(function() {
			$(".iframe").attr("src", "admin/selectadmin");
		});
		$(".cataloguechart").click(function() {
			$(".iframe").attr("src", "catalogue/echartview");
		});
		$(".bookechart").click(function() {
			$(".iframe").attr("src", "commodity/echartview");
		});
	</script>
</body>
</html>
