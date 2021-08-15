<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<base href="${ctx}/">
<meta charset="UTF-8">
<title>请操作您想要修改的信息！</title>
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
	<div class="title">请修改您要修改的商品信息</div>
	<div class="center">
	<hr />
	<form class="layui-form form" action="commodity/updatesucc" method="post" enctype="multipart/form-data">
		<div class="layui-form-item">
			<label class="layui-form-label">商品ID</label>
			<div class="layui-input-inline">
				<input type="text" name="commid" value="${comm.commid }" lay-verify="commid" lay-filter="test"
					readonly="readonly" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">商品名称</label>
			<div class="layui-input-inline">
				<input type="text" name="commname" lay-verify="commname" value="${comm.commname }"
					placeholder="请输入分类名称" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">商品价格</label>
			<div class="layui-input-inline">
				<input type="text" name="commprice" lay-verify="commprice" value="${comm.commprice }"
					placeholder="请输入商品价格" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">详情图片</label>
			<div class="layui-input-inline">
				<input type="file" name="image" multiple="multiple" style="margin-top: 5px" lay-verify="count" autocomplete="off">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">类别ID</label>
			<div class="layui-input-inline">
				<input type="text" name="rootid" readonly="readonly" lay-verify="rootid" value="${comm.rootid }"
					placeholder="请输入类别ID" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">父类ID</label>
			<div class="layui-input-inline">
				<input type="text" name="preid" lay-verify="preid" value="${comm.preid }"
					placeholder="请输入父类ID" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">商品描述</label>
			<div class="layui-input-inline">
				<input type="text" name="description" lay-verify="description" value="${comm.description }"
					placeholder="请输入商品描述" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">库存</label>
			<div class="layui-input-inline">
				<input type="text" name="count" lay-verify="count" value="${comm.count }"
					placeholder="请输入库存" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">商品详情</label>
			<div class="layui-input-inline">
				<input type="text" name="commdetails" lay-verify="count" value="${comm.commdetails }"
					placeholder="请输入详情" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div style="font-family:幼圆;font-size:10px;color:red">${error }</div>
		<br/>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button type="submit" class="layui-btn layui-btn-lg">确认</button>
				<button type="button" class="layui-btn layui-btn-lg back">返回</button>
			</div>
		</div>
	</form>
	<hr>
	</div>
	<script src="assest/layui.all.js"></script>
	<script src="assest/layui.js"></script>
	<script src="assest/js/jquery-3.4.1.min.js" type="text/javascript"
		charset="utf-8"></script>
	<script type="text/javascript">
	$(function(){
		$(".back").click(function(){
			$(".form").attr("action","commodity/selectcomm");
			$(".form").submit();
		});
	});
	</script>
</body>
</html>