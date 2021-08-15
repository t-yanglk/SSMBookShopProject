<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>

<head>
<base href="${ctx}/">
<meta charset="UTF-8">
<title></title>

<link rel="stylesheet" type="text/css" href="assest/css/reset.css" />
<link rel="stylesheet" type="text/css" href="assest/css/footer_header.css" />
<link rel="stylesheet" type="text/css" href="assest/css/order_confirm.css" />
<style type="text/css">
.order_img,.order_img img{
	height: 100%; 
}
.subcribe-btn {
    margin-top: 20px;
    text-align: center;
    background-color: gainsboro;
    color: firebrick;
    width: 172px;
    line-height: 46px;
    font-size: 18px;
    border-radius: 2px;
    outline: 0px;
    border: 0px;
    display: inline-block;
    cursor: pointer;
}
.subcribe-btn:hover{
	background-color: #FF0000;
	color: white;
}
</style>
</head>

<body>

	<!--头部-->
	<div class="header">
		<!-- 顶部右侧导航栏 -->
		<div class="right_nav fr">
			<ul class="clearfix">
				<li class="fl"><a href="user/index">${user.uname }</a></li>
				<li class="fl"><a href="user/index">首页</a></li>
				<li class="fl"><a href="user/register">注册</a></li>
				<li class="fl"><a href="order.html">我的订单</a></li>
				<li class="fl">
					<div class="cart position_relative">
						<div class="text">
							<img src="assest/img/index/shop_logo.png" class="vertical">
							<a href="user/cart" class="vertical">购物车</a>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</div>

	</div>
	<div class="logo_nav">
		<div class="container clearfix">
			<div class="logo_left fl">
				<ul class="clearfix">
					<li class="logo vertical"><img
						src="assest/img/index/ia_100000006.png"></li>
					<li class="huawei vertical"><img
						src="assest/img/index/ia_100000007.png"></li>
					<li class="glory vertical"><img
						src="assest/img/index/ia_100000008.png"></li>
					<li class="font vertical"><a href="#">安心居家</a></li>
					<li class="font vertical"><a href="#">Mate30系列</a></li>
					<li class="font vertical"><a href="#">荣耀V30 5G</a></li>
				</ul>
			</div>
			<div class="input_right fr position_relative">
				<input type="text" placeholder="Mate 30   nova 5z" id="" value=""
					class="search" />
				<div class="search_logo">
					<img src="assest/img/index/ia_100000000_ser_03.png">
				</div>
			</div>
		</div>
	</div>
	<!--确认订单-->
	<div class="main">
		<div class="container">
			<div class="login-prompt"></div>
			<div class="address-section">
				<div class="address-main clearfix">
					<div class="address-title">收货地址</div>
						<div class="keep-box fl">
							<div class="tacit">默认地址</div>
							<div class="keep-name">${user.uname }</div>
							<div class="keep-phone">${user.phone }</div>
							<div class="keep-address">${user.address }</div>
						</div>
					<div class="address-box fl">
						 <span class="address-news-world">修改收货地址</span>
					</div>
				</div>
			</div>
			<div class="het"></div>
		</div>
	</div>
	<!--添加地址-->
	<div class="address-cover" style="display: none;">
		<div class="address-content">
			<div class="close-cover clearfix">
				<a href="#" class="fr"></a>
			</div>
			<div class="address-title">-修改地址-</div>
			<form class="form" action="#">
				<div class="receiver  blur">
					<label for="user"><span class="star">*</span>收货人:</label> 
					<input type="text" value="${user.uname }" readonly="readonly"/>
					<div class="error-tip" id='error-tip-receiver'></div>
				</div>
				<div class="phone-number  blur">
					<label for=""><span class="star">*</span>手机号码:</label> 
					<input type="text" value="${user.phone }" readonly="readonly"/>
					<div class="error-tip" id='error-tip-phone'></div>
				</div>
				<div class="address  blur">
					<label for=""><span class="star">*</span>收货地址:</label> 
					<div data-toggle="distpicker" class="select">
						<select class="province"></select>
						<select class="city"></select>
						<select class="district"></select>
					</div>
				</div>
				<div class="address-btn">
					<button type="button" class="keep-btn" id="address-box">取消</button>
					<button type="submit" class="keep-btn">保存并使用</button>
				</div>
			</form>
		</div>
	</div>

	<!-- 详情 -->
		<div class="order_content">
			<div class="container">
				<div class="content clearfix">
					<div class="content_fl fl">
						<div class="list_one clearfix">
							<div class="fl order_img">
								<img src="assest/img/${order.comm.commimg }">
							</div>
							<div class="hover fl">${order.comm.commname }</div>
							<div class="quantity fl">x${order.count }</div>
							<div class="money fl">￥${order.price }</div>
						</div>
					</div>
					<div class="content_fr fr">
						<div class="base">
							<div>
								商品由<a href="#" class="link">华为商城</a>选择合作快递
							</div>
							<div class="all">
								<span class="money">订单号</span> <span>${order.orderid }</span>
							</div>
							<div class="all">
								<span class="money">商品金额</span> <span>￥${order.comm.commprice }</span>
							</div>
							<div class="all">
								<span class="money">结算金额:</span> <span class="all_money">￥${order.price }</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


	<!--提交订单-->
	<div class="submission">
		<div class="container">
			<div class="submission_bg clearfix">
				<div class="sub_price clearfix">
					<span class="fr">￥${order.price }</span> <span class="fr">应付总金: </span>
				</div>
				<div class=" fr">
					<form action="order/submit" class="submit">
						<input type="hidden" name="orderid" value="${order.orderid }">
						<input type="hidden" name="userid" value="${order.userid }">
						<input type="hidden" name="commid" value="${order.commid }">
						<input type="hidden" name="count" value="${order.count }">
						<input type="hidden" name="address">
					</form>
					<div class="subcribe-btn">借阅图书</div>
					<div class="submission-btn">提交订单</div>
				</div>
			</div>
		</div>
	</div>
	<div class="right_fixed">
		<ul>
			<li class="position_relative"><a href="#"> <img
					src="assest/img/index/ia_100000000_01_03.png">
			</a>
				<div class="cart">购物车</div></li>
			<li class="position_relative"><a href="#"> <img
					src="assest/img/index/ia_100000000_01_05.png">
			</a>
				<div class="cart">在线客服</div></li>
			<li class="position_relative"><a href="#"> <img
					src="assest/img/index/ia_100000000_01_07.png">
			</a>
				<div class="cart">意见反馈</div></li>
			<li class="position_relative  backTop"><a href="#"> <img
					src="assest/img/index/ia_100000000_01_09.png">
			</a></li>
		</ul>
	</div>
	<div class="footer">
		<div class="container">
			<div class="flaglist">
				<ul class="clearfix overflow_cut">
					<li class="fl"><a href="#"> <img
							src="assest/img/index/ia_100000406_02.png" class="logo vertical">
							<span class="des vertical">百强企业 品质保证</span>
					</a></li>

					<li class="fl"><a href="#"> <img
							src="assest/img/index/ia_100000406_03.png" class="logo vertical">
							<span class="des vertical">7天退货 15天换货</span>
					</a></li>

					<li class="fl"><a href="#"> <img
							src="assest/img/index/ia_100000406_04.png" class="logo vertical">
							<span class="des vertical">48元起免运费</span>
					</a></li>

					<li class="fl"><a href="#"> <img
							src="assest/img/index/ia_100000406_05.png" class="logo vertical">
							<span class="des vertical">1000家维修网点 全国联保</span>
					</a></li>

				</ul>
			</div>

			<div class="copyright clearfix">
				<div class="fl">
					<img src="assest/img/index/ia_100000364.png" class="logo">
				</div>
				<div class="copy_text fl">
					<div>
						<a href="#">隐私声明</a> <a href="#">服务协议</a> <a href="#">COOKIES</a>
						Copyright © 2012-2020 华为终端有限公司 版权所有 <a href="#">粤ICP备19015064号</a>|
						<a href="#">粤公网安备 44190002003939号</a>
						增值电信业务经营许可证：粤B2-20190762|备案主体编号：44201919072182
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="assest/js/jquery-3.4.1.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="assest/lib/validform_5.3.2/js/Validform_v5.3.2_min.js" type="text/javascript" charset="utf-8"></script>
	<script src="assest/lib/layer/layer.js" type="text/javascript" charset="utf-8"></script>
	<script src="assest/lib/jq22jQueryDistpicker881120160621/jQueryDistpicker20160621/js/distpicker.data.js" type="text/javascript"
		 charset="utf-8"></script>
	<script src="assest/lib/jq22jQueryDistpicker881120160621/jQueryDistpicker20160621/js/distpicker.js" type="text/javascript"
		 charset="utf-8"></script>
	<script src="assest/js/footer_header.js" type="text/javascript" charset="utf-8"></script>
	<script src="assest/js/order_confirm.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
		var address=$(".main").find(".keep-address");
	</script>
</body>
</html>
