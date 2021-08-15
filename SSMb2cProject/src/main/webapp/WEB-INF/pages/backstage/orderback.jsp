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
	<form class="select formcss" action="order/selectindent" method="post">
	<div class="layui-form-item">
			<div class="layui-input-inline">
				<input type="text" name="orderid" lay-verify="required"
					placeholder="请输入订单编号进行查询" autocomplete="off" class="layui-input">
			</div>
			<div class="layui-input-inline">
				<input type="text" name="uname" lay-verify="required"
					placeholder="请输入用户名称进行查询" autocomplete="off" class="layui-input">
			</div>
			<div class="layui-input-inline">
				<input type="text" name="commname" lay-verify="required"
					placeholder="请输入商品名称进行查询" autocomplete="off" class="layui-input">
			</div>
			<div class="layui-input-inline">
				<input type="text" name="orderstate" lay-verify="required"
					placeholder="订单是否已支付（是/否）" autocomplete="off" class="layui-input">
			</div>
			<button type="submit" class="layui-btn">查询订单</button>
			<button type="button" class="layui-btn renovateorder">刷新表格</button>
		</div>
	</form>
			<button type="button" class="layui-btn delcheckorder layui-btn-danger"><i class="layui-icon"></i></button>
		
	
		
		
		<table class="layui-table">
			<colgroup>
				<col width="25">
				<col width="200">
				<col width="100">
				<col width="200">
				<col width="100">
				<col width="100">
				<col width="150">
				<col width="100">
				<col width="100">
			</colgroup>
			<thead>
				<tr class="thtr">
					<th><input class="checkall" type="checkbox" lay-skin="primary"></th>
					<th>订单编号</th>
					<th>用户姓名</th>
					<th>商品名称</th>
					<th>商品数量</th>
					<th>商品总价</th>
					<th>下单时间</th>
					<th>订单状态</th>
					<th>是否订阅</th>
					<th>是否归还</th>
					<th>订单操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${orders }" var="item">
					<tr>
						<td><input class="check" type="checkbox" lay-skin="primary"></td>
						<td class="select">${item.orderid }</td>
						<td>${item.user.uname}</td>
						<td>${item.comm.commname }</td>
						<td>${item.count }</td>
						<td>${item.price }</td>
						<td>${item.intime }</td>
						<td>${item.state=="0"?"未支付":"已支付" }</td>
						<td>${item.subcribe=="N"?"否":"是" }</td>
						<td>${item.isreturn=="N"?"否":"是" }</td>
						<td>
							<button type="button" class="layui-btn layui-btn-sm layui-btn-danger deleteorder">
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
		<form class="form" action="order/selectindent" method="post"
			style="display: none">
			<input type="hidden" name="pageno" id="pageno"> <input
				type="hidden" name="pagesize" id="pagesize">
		</form>
	</div>
	
	<script src="assest/js/jquery-3.4.1.min.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript" src="assest/js/layerjs/layer.js"></script>
	<script src="assest/js/backwork.js"></script>
	<script type="text/javascript">
		var ctx = "${ctx}";
		var page = ${pi.getPageNum()};
		var maxpage = ${pi.getPages()};
		var navigate = ${pi.getNavigatePages()}
	</script>
</body>
</html>