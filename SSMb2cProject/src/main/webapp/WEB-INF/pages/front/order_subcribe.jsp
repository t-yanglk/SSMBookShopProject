<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
	<head>
		<base href="${ctx}/">
		<meta charset="utf-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="assest/lib/swiper/css/swiper.min.css" />
		<link rel="stylesheet" type="text/css" href="assest/css/reset.css" />
		<link rel="stylesheet" type="text/css" href="assest/css/footer_header.css"/>
		<link rel="stylesheet" type="text/css" href="assest/css/user.css" />
		<link rel="stylesheet" type="text/css" href="assest/css/order_details%20.css" />
	</head>
	<body>
		<div class="header">
			<!-- container 宽度是1200px -->
			<div class="container clearfix">
				<!-- 顶部右侧导航栏 -->
				<div class="right_nav fr">
					<ul class="clearfix">
						<li class="fl arr">
							<a href="user/login">首页</a>
						</li>
						<li class="fl arr">
							<a href="order/myorder">我的订单</a>
						</li>
						
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
						<li class="logo vertical">
							<img src="assest/img/index/ia_100000006.png">
						</li>
						<li class="huawei vertical">
							<img src="assest/img/index/ia_100000007.png">
						</li>
						<li class="glory vertical">
							<img src="assest/img/index/ia_100000008.png">
						</li>
						<li class="font vertical">
							<a href="#">安心居家</a>
						</li>
						<li class="font vertical">
							<a href="#">Mate30系列</a>
						</li>
						<li class="font vertical">
							<a href="#">荣耀V30 5G</a>
						</li>
					</ul>
				</div>
				<div class="input_right fr position_relative">
					<input type="text" placeholder="Mate 30   nova 5z" id="" value="" class="search" />
					<div class="search_logo">
						<img src="assest/img/index/ia_100000000_ser_03.png">
					</div>
				</div>
			</div>
		</div>

		<!-- 内容 -->
		<div class='background'>
			<div class="container">
				<div class="home1">
					<!-- 首页 跳转-->
					<a href="user/index">首页</a>
					<span>></span>
					<a href="index.html">我的商城</a>
					<span>></span>
					<a href="#">我的订单</a>
				</div>
				<div class="content clearfix">
					<!-- 导航栏 -->
					<div class="sidebar fl">
						<div class="title"><a href="">我的商城</a></div>
						<div class="subnav">
							<ul>
								<li class="li"><span class="text">我的消息</span>
									<ol>
										<li><a href="#">消息中心</a></li>
										<li><a href="#">活动推送</a></li>
									</ol>
								</li>
								<li class="li"><span>订单中心</span>
									<ol>
										<li><a href="order/myorder" style="color: #CA141D;">我的订单</a></li>
									</ol>
								</li>
								<li class="li"><span>购买支持</span></li>
							</ul>
						</div>
					</div>
					<div class="right">
						<div class="btn clearfix">
							<span>订单号：${order.orderid }</span>
							<form action="order/delorder" class="form" method="post">
								<input type="hidden" name="orderid" class="delorderid">
							</form>
							<div class="box clearfix">
								<div class="msg_left fl">
									<div>基本信息</div>
									<div class="msg">姓名：<span>${order.user.uname }</span></div>
									<div class="msg">收货地址：<span>${order.address }</span></div>
									<div class="msg">联系电话：<span>${order.user.phone }</span></div>
								</div>
								<div class="br fl"></div>
								<div class="msg_right fl">
									<div>发票信息</div>
									<div class="msg">发票类型：<span>电子普通发票</span></div>
									<div class="msg">发票抬头：<span>个人</span></div>
								</div>
								<div class="br fl"></div>
							</div>
							<div class="commodity">商品清单</div>
							<div class="border_1 clearfix">
								<div class="name fl">商品名称 <i>|</i></div>
								<div class="else fl">单价/元 <i>|</i></div>
								<div class="else fl">数量 <i>|</i></div>
								<div class="else fl">是否订阅 <i>|</i></div>
								<div class="else fl">押金/元 <i>|</i></div>
								<div class="else fl">状态</div>
							</div>
							<div class="border_2 clearfix">
								<div class="name fl clearfix">
									<img class="pic fl" src="assest/img/${order.comm.commimg }">
									<a class="txt fl" href="#">${order.comm.commname }</a>
								</div>
								<div class="else fl">￥${order.comm.commprice }</div>
								<div class="else fl">1</div>
								<div class="else fl">${order.subcribe=="N"?"否":"是" }</div>
								<div class="else fl">${order.comm.commprice*0.5 }</div>
								<div class="else fl">${order.state=="0"?"未支付":"已支付" }</div>
							</div>
							<div class="bor"></div>
							<div align='right' class="total">
								<i>押金（价格一半）：</i>
								<b>￥${order.comm.commprice*0.5 }</b>
							</div>
							<div class="bor"></div>
							<div class="afford">立即支付</div>
							<form action="order/defray" method="post" class="orderafford">
								<input type="hidden" name="orderid" class="affordid">
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
		</div>
		<!-- 商品按钮 -->
		<div class="rapid">
			<div><a href="#"><img src="assest/img/user/uesr_homepage/图标1.jpg"></a></div>
			<div><a href="#"><img src="assest/img/user/uesr_homepage/图标2.jpg"></a></div>
			<div><a href="#"><img src="assest/img/user/uesr_homepage/图标3.jpg"></a></div>
			<div class="back"><img src="assest/img/user/uesr_homepage/图标4.jpg"></div>
		</div>
		<div class="footer">
			<div class="container">
				<div class="flaglist">
					<ul class="clearfix overflow_cut">
						<li class="fl">
							<a href="#">
								<img src="assest/img/index/ia_100000406_02.png" class="logo vertical">
								<span class="des vertical">百强企业 品质保证</span>
							</a>
						</li>

						<li class="fl">
							<a href="#">
								<img src="assest/img/index/ia_100000406_03.png" class="logo vertical">
								<span class="des vertical">7天退货 15天换货</span>
							</a>
						</li>

						<li class="fl">
							<a href="#">
								<img src="assest/img/index/ia_100000406_04.png" class="logo vertical">
								<span class="des vertical">48元起免运费</span>
							</a>
						</li>

						<li class="fl">
							<a href="#">
								<img src="assest/img/index/ia_100000406_05.png" class="logo vertical">
								<span class="des vertical">1000家维修网点 全国联保</span>
							</a>
						</li>

					</ul>
				</div>
					
					

				<div class="copyright clearfix">
					<div class="fl">
						<img src="assest/img/index/ia_100000364.png" class="logo">
					</div>
					<div class="copy_text fl">
						<ul class="clearfix">
							<li class="fl">
								<a href="#">
									华为集团
								</a>
							</li>
							<li class="fl">
								<a href="#">
									华为CBG官网
								</a>
							</li>
							<li class="fl">
								<a href="#">
									荣耀官网
								</a>
							</li>
							<li class="fl">
								<a href="#">
									花粉俱乐部
								</a>
							</li>
							<li class="fl">
								<a href="#">
									华为应用市场
								</a>
							</li>
							<li class="fl">
								<a href="#">
									EMUI
								</a>
							</li>
							<li class="fl">
								<a href="#">
									华为终端云空间
								</a>
							</li>
							<li class="fl">
								<a href="#">
									开发者联盟
								</a>
							</li>
							<li class="fl">
								<a href="#">
									华为商城手机版
								</a>
							</li>
							<li class="fl">
								<a href="#">
									网站地图
								</a>
							</li>
						</ul>
						<div>
							<a href="#">隐私声明</a>
							<a href="#">服务协议</a>
							<a href="#">COOKIES</a>
							Copyright © 2012-2020 华为终端有限公司 版权所有
							<a href="#">粤ICP备19015064号</a>|
							<a href="#">粤公网安备 44190002003939号</a>
							增值电信业务经营许可证：粤B2-20190762|备案主体编号：44201919072182</div>
					</div>
					<div class="copy_palice fr">
						<a href="#">
							<img src="assest/img/index/1111.png">
						</a>
					</div>
				</div>
			</div>
		</div>
		<script src="assest/js/jquery-3.4.1.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="assest/lib/swiper/js/swiper.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="assest/lib/layer/layer.js"></script>
		<script src="assest/js/footer_header.js" type="text/javascript" charset="utf-8"></script>
		<script src="assest/js/user.js" type="text/javascript" charset="utf-8"></script>
		<script src="assest/js/order_details%20.js"></script>
		<script type="text/javascript">
			var orderid="${order.orderid}";
			var state="${order.state}";
		</script>
	</body>

</html>
