<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<base href="${ctx}/">
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="assest/css/layui.css">
<link href="assest/css/layui.mobile.css" />
<style type="text/css">
ul {
	padding: 0;
	margin: 0 5px;
	list-style-type: none;
	width: 700px;
	height: 30px;
	line-height: 30px;
}

ul li{
	display: inline-block;
	height: 30px;
	width: 50px;
	cursor: pointer;
	text-align: center !important;
	line-height: 30px;
	border: 1px solid #E6E6E6;
	color: #666666;
}

ul li:hover {
	background-color: #009688;
	color: white;
}

ul input {
	width: 50px;
	height: 100%;
	border: 0;
}
tr th,tr td{
	text-align: center !important;
}

input[type=checkbox]{
	display: inline-block !important;
}
.formcss{
	display: inline-block !important;
	margin-right: 10px;
}
</style>
</head>
<body>
	<hr/>
	<div class="layui-form">
	<form class="select formcss" action="catalogue/selectcata" method="post">
	<div class="layui-form-item">
			<div class="layui-input-inline">
				<input type="text" name="cataid" lay-verify="required"
					placeholder="请输入分类ID进行查询" autocomplete="off" class="layui-input">
			</div>
			<div class="layui-input-inline">
				<input type="text" name="cataname" lay-verify="required"
					placeholder="请输入类别名称进行查询" autocomplete="off" class="layui-input">
			</div>
			<div class="layui-input-inline">
				<input type="text" name="depth" lay-verify="required"
					placeholder="请输入类别深度进行查询" autocomplete="off" class="layui-input">
			</div>
			<button type="submit" class="layui-btn">查询分类</button>
			<button type="button" class="layui-btn renovate">刷新表格</button>
		</div>
	</form>
			<form class="formcss addcata" action="catalogue/addcatajsp" method="post">
				<button type="button" class="layui-btn addcheck layui-btn-normal" ><i class="layui-icon"></i></button>
			</form>
			<form class="formcss updatecata" action="catalogue/updatecatajsp" method="post">  
				<button type="button" class="layui-btn updatecheck"><i class="layui-icon"></i></button>
			</form>
				<button type="button" class="layui-btn delcheck layui-btn-danger"><i class="layui-icon"></i></button>
		
	
		
		
		<table class="layui-table">
			<colgroup>
				<col width="25">
				<col width="100">
				<col width="200">
				<col width="200">
				<col width="100">
				<col width="100">
				<col width="200">
				<col width="100">
			</colgroup>
			<thead>
				<tr class="thtr">
					<th><input class="checkall" type="checkbox" lay-skin="primary"></th>
					<th>分类ID</th>
					<th>类别名称</th>
					<th>类别图片</th>
					<th>类别深度</th>
					<th>父类ID</th>
					<th>相关操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${catas }" var="item">
					<tr>
						<td><input class="check" type="checkbox" lay-skin="primary"></td>
						<td class="select">${item.catalogueid }</td>
						<td>${item.cataname }</td>
						<td>${item.cataimg }</td>
						<td>${item.depth }</td>
						<td>${item.parentcata.catalogueid }</td>
						<td>
							<form class="formcss" action="catalogue/updatecatajsp" method="post">
								<input type="hidden" name="cataid" value="${item.catalogueid }"/>
								<button type="submit" class="layui-btn layui-btn-sm update">
									<i class="layui-icon"></i>
								</button>
							</form>
							<button type="button" class="layui-btn layui-btn-sm layui-btn-danger delete">
								<i class="layui-icon"></i>
							</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<hr />
		<ul class="ul">
			<li class="functionli">首页</li>
			<li class="functionli" id="page">上一页</li>
			<c:forEach begin="${pi.getNavigateFirstPage() }"
				end="${pi.getNavigateLastPage() }" var="p">
				<li class="functionli p">${p}</li>
			</c:forEach>
			<li><input id="input" type="text" name="pagejump"></li>
			<li class="functionli">跳转</li>
			<li class="functionli" id="page">下一页</li>
			<li class="functionli">尾页</li>
		</ul>
		<form class="form" action="catalogue/selectcata" method="post"
			style="display: none">
			<input type="hidden" name="pageno" id="pageno"> <input
				type="hidden" name="pagesize" id="pagesize">
		</form>
	</div>
	
	<script src="assest/js/jquery-3.4.1.min.js" type="text/javascript"
		charset="utf-8"></script>
	<script type="text/javascript" src="assest/js/layerjs/layer.js"></script>
	<script src="assest/js/catalogue.js"></script>
	<script type="text/javascript">
		var ctx = "${ctx}";
		var page = ${pi.getPageNum()};
		var maxpage = ${pi.getPages()};
		var navigate = ${pi.getNavigatePages()}
	</script>
</body>
</html>