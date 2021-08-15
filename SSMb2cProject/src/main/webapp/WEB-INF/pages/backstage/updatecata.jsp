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
<div class="title">请对分类进行修改！</div>
<hr/>
	<form class="layui-form form" action="catalogue/updatecata" method="post" enctype="multipart/form-data">
		<div class="layui-form-item">
			<label class="layui-form-label">分类ID</label>
			<div class="layui-input-inline">
				<input type="text" name="catalogueid" required value="${cata.catalogueid }"
					readonly="readonly" lay-verify="required" placeholder="请输入分类ID"
					autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">分类名称</label>
			<div class="layui-input-inline">
				<input type="text" name="cataname" required value="${cata.cataname }"
					lay-verify="required" placeholder="请输入分类名称" autocomplete="off"
					class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">详情图片</label>
			<div class="layui-input-inline">
				<input type="file" name="image" multiple="multiple" style="margin-top: 5px" lay-verify="count" autocomplete="off">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">类别层级</label>
			<div class="layui-input-inline">
				<input type="text" name="depth" required value="${cata.depth }"
					readonly="readonly" lay-verify="required" placeholder="请输入类别层级"
					value="${cata.depth }" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">父类ID</label>
			<div class="layui-input-inline">
				<select name="preid">
					<c:forEach items="${preids }" var="item">
						<option value="${item }">${item }</option>
					</c:forEach>
				</select>
			</div>
		</div>
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
			$(".form").attr("action","catalogue/selectcata");
			$(".form").submit();
		});
	});
	</script>
</body>
</html>