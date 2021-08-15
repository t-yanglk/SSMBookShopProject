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
	<div class="title">请输入您要增加的分类信息</div>
	</hr>
	<form class="layui-form form" action="catalogue/insertcata" method="post" enctype="multipart/form-data">
		<hr />
		<div class="layui-form-item">
			<label class="layui-form-label">分类ID</label>
			<div class="layui-input-inline">
				<input type="text" name="catalogueid" lay-verify="catalogueid" lay-filter="test"
					placeholder="请输入分类ID" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">分类名称</label>
			<div class="layui-input-inline">
				<input type="text" name="cataname" lay-verify="cataname"
					placeholder="请输入分类名称" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">详情图片</label>
			<div class="layui-input-inline">
				<input type="file" name="image" multiple="multiple" style="margin-top: 5px" lay-verify="count" autocomplete="off">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">分类层级</label>
			<div class="layui-input-inline">
				<input type="text" name="depth" lay-verify="depth"
				    value="${depth }"  readonly="readonly" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">父类ID</label>
			<div class="layui-input-inline">
				<input type="text" name="preid" lay-verify="preid"
					value="${preid }" readonly="readonly" autocomplete="off" class="layui-input">
			</div>
		</div>
		<hr />
		<div style="font-family:幼圆;font-size:10px;color:red;height: 20px;line-height: 20px">${error }</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button type="submit" class="layui-btn layui-btn-lg">确认</button>
				<button type="button" class="layui-btn layui-btn-lg back">返回</button>
			</div>
		</div>
	</form>
	<script src="assest/layui.all.js"></script>
	<script src="assest/layui.js"></script>
	<script src="assest/js/jquery-3.4.1.min.js" type="text/javascript"
		charset="utf-8"></script>
	<script type="text/javascript">
		$(function(){
			$(".back").click(function(){
				$(".form").attr("action","catalogue/selectcata");
				$(".form").submit();
			});
		});
	</script>

</body>
</html>