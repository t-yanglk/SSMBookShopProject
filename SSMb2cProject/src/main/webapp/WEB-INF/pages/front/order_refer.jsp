<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<base href="${ctx}/">
<meta charset="utf-8">
<title></title>
<link rel="stylesheet" type="text/css" href="assest/css/reset.css" />
<link rel="stylesheet" type="text/css" href="assest/css/order_refer.css" />
</head>
<body>
	<!-- 支付页面 -->
	<!-- logo -->
	<div class="container clearfix">
		<div class="logo fl">
			<img src="assest/img/order_refer/ia_10001.png">
		</div>
		<div class="title fl">收银台</div>
		<div class="title fl"><a href="user/index">返回首页</a></div>
	</div>


	<!-- 内容 -->
	<div class="container">
		<div class="pay">
			<div class="content clearfix">
				<div class="img fl">
					<img src="assest/img/order_refer/ia_10002.png">
				</div>
				<div class="text fl clearfix">
					<div class="fl">
						<span class="des"> 订单提交成功，只差付款了~ </span> <span class="num">
							订单号：${order.orderid }
						</span>

						<div class="losetime">
							请您在 <span class="time"> </span> 内完成支付，否则订单将自动取消。
						</div>
					</div>

					<div class="price fr">
						<div>
							订单金额： <span class="num"> ￥${order.price }</span>
						</div>

						<div class="dropdown">
							查看详情 <img src="assest/img/order_refer/ia_10039.png"
								class="droplogo" alt="">
						</div>
					</div>
				</div>

				<div class="list">
					<ul>
						<li>订单编号： <span>11580660125</span>
						</li>
						<li>收货信息： ${order.user.uname }*${order.user.phone }</li>
						<li>商品名称：${order.comm.commname }</li>
					</ul>
				</div>
			</div>

			<!-- 选项卡 -->
			<div class="content_bottom">
				<ul class="tab_title">
					<li>常用</li>
					<li>平台支付</li>
					<li>分期支付</li>
					<li>网银支付</li>
				</ul>
				<ul class="tab_content">
					<li class="list first">
						<ul class="clearfix">
							<li class="logo fl ">
								<div class="item position_relative">
									<img src="assest/img/order_refer/ia_10004.png" class="img">
									<img src="assest/img/order_refer/ia_10030.png" class="hide">
								</div>
							</li>
							<li class="logo fl ">
								<div class="item position_relative">
									<img src="assest/img/order_refer/ia_10003.png" class="img">
									<img src="assest/img/order_refer/ia_10030.png" class="hide">
								</div>
							</li>
							<li class="logo fl ">
								<div class="item position_relative">
									<img src="assest/img/order_refer/ia_10008.png" class="img">
									<img src="assest/img/order_refer/ia_10030.png" class="hide">
								</div>
							</li>
							<li class="logo fl ">
								<div class="item position_relative">
									<img src="assest/img/order_refer/ia_10005.png" class="img">
									<img src="assest/img/order_refer/ia_10030.png" class="hide">
								</div>
							</li>
							<li class="logo fl ">
								<div class="item position_relative">
									<img src="assest/img/order_refer/ia_10007.png" class="img">
									<img src="assest/img/order_refer/ia_10030.png" class="hide">
								</div>
							</li>
						</ul>
					</li>
					<li class="list">
						<ul class="clearfix">
							<li class="logo fl ">
								<div class="item position_relative">
									<img src="assest/img/order_refer/ia_10003.png" class="img">
									<img src="assest/img/order_refer/ia_10030.png" class="hide">
								</div>
							</li>
							<li class="logo fl ">
								<div class="item position_relative">
									<img src="assest/img/order_refer/ia_10004.png" class="img">
									<img src="assest/img/order_refer/ia_10030.png" class="hide">
								</div>
							</li>
							<li class="logo fl ">
								<div class="item position_relative">
									<img src="assest/img/order_refer/ia_10005.png" class="img">
									<img src="assest/img/order_refer/ia_10030.png" class="hide">
								</div>
							</li>
							<li class="logo fl ">
								<div class="item position_relative">
									<img src="assest/img/order_refer/ia_10006.png" class="img">
									<img src="assest/img/order_refer/ia_10030.png" class="hide">
								</div>
							</li>
						</ul>
					</li>
					<li class="list">
						<ul class="clearfix">
							<li class="logo fl ">
								<div class="item position_relative">
									<img src="assest/img/order_refer/ia_10007.png" class="img">
									<img src="assest/img/order_refer/ia_10030.png" class="hide">
								</div>
							</li>
							<li class="logo fl ">
								<div class="item position_relative">
									<img src="assest/img/order_refer/ia_10008.png" class="img">
									<img src="assest/img/order_refer/ia_10030.png" class="hide">
								</div>
							</li>
							<li class="logo fl ">
								<div class="item position_relative">
									<img src="assest/img/order_refer/ia_10010.png" class="img">
									<img src="assest/img/order_refer/ia_10030.png" class="hide">
								</div>
							</li>
						</ul>
					</li>
					<li class="list">
						<ul class="clearfix">
							<li class="logo fl ">大众版限额500元
								<div class="item position_relative">
									<img src="assest/img/order_refer/ia_10009.png" class="img">
									<img src="assest/img/order_refer/ia_10030.png" class="hide">
								</div>
							</li>
							<li class="logo fl ">大众版限额500元
								<div class="item position_relative">
									<img src="assest/img/order_refer/ia_10010.png" class="img">
									<img src="assest/img/order_refer/ia_10030.png" class="hide">
								</div>
							</li>
							<li class="logo fl ">大众版限额500元
								<div class="item position_relative">
									<img src="assest/img/order_refer/ia_10011.png" class="img">
									<img src="assest/img/order_refer/ia_10030.png" class="hide">
								</div>
							</li>
							<li class="logo fl ">大众版限额500元
								<div class="item position_relative">
									<img src="assest/img/order_refer/ia_10012.png" class="img">
									<img src="assest/img/order_refer/ia_10030.png" class="hide">
								</div>
							</li>
							<li class="logo fl ">大众版限额500元
								<div class="item position_relative">
									<img src="assest/img/order_refer/ia_10013.png" class="img">
									<img src="assest/img/order_refer/ia_10030.png" class="hide">
								</div>
							</li>
							<li class="logo fl ">大众版限额500元
								<div class="item position_relative">
									<img src="assest/img/order_refer/ia_10014.png" class="img">
									<img src="assest/img/order_refer/ia_10030.png" class="hide">
								</div>
							</li>
							<li class="logo fl ">大众版限额500元
								<div class="item position_relative">
									<img src="assest/img/order_refer/ia_10015.png" class="img">
									<img src="assest/img/order_refer/ia_10030.png" class="hide">
								</div>
							</li>
						</ul>
					</li>
				</ul>

				<input type="button" name="send" class="send" value="确认支付" />
			</div>
		</div>
	</div>


	<!-- 页尾 -->
	<div class="footer">
		<div class="container">
			<img src="assest/img/order_refer/ia_10028.png" class="vertical">
			<span class="vertical"> 隐私声明 服务协议Copyright © 2012-2019
				华为终端有限公司 粤ICP备19015064号-4 版权所有 保留一切权利 </span>
		</div>
	</div>


	<div class="layer" id="layer" style="display: none;">
		<img class="img_111" src="assest/img/order_refer/1.png" alt="">
		<button class="one_btn" type="button">更换支付方式</button>
		<button class="two_btn" type="button">已完成支付</button>
	</div>
	
	
	
	<script src="assest/js/jquery-3.4.1.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="assest/js/order_refer.js" type="text/javascript" charset="utf-8"></script>
	<script src="assest/lib/layer/layer.js"></script>
	<script type="text/javascript">
		var ctx="${ctx}/";
		var orderid="${order.orderid}";
	</script>
</body>
</html>
