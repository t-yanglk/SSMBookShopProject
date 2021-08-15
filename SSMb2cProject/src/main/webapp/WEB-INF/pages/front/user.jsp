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
		<link rel="stylesheet" type="text/css" href="assest/lib/swiper/css/swiper.min.css" />
		<link rel="stylesheet" type="text/css" href="assest/css/reset.css" />
		<link rel="stylesheet" type="text/css" href="assest/css/header_footer.css"/>
		<link rel="stylesheet" type="text/css" href="assest/css/footer_header.css"/>
		<link rel="stylesheet" type="text/css" href="assest/css/user.css" />
	</head>
	<body>
		<div class="header">
			<!-- container 宽度是1200px -->
			<div class="container clearfix">
				<!-- 顶部右侧导航栏 -->
				<div class="right_nav fr">
					<ul class="clearfix">
						<li class="fl">
							<a href="user/index">首页</a>
						</li>
						<li class="fl"><a href="order/meuser?userid=${user.userid }">${user.uname }</a></li>
						<li class="fl">
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
					</ul>
				</div>
			</div>
		</div>
		
		<!-- 内容 -->
		<div class='background'>
			<div class="container">
				<div class="home1">
					<!-- 首页 跳转-->
					<a href="#">首页</a>
					<span>></span>
					<a href="#">我的商城</a>
				</div>
				<div class="content clearfix">
					<!-- 导航栏 -->
					<div class="sidebar fl">
						<div class="title"><a href="">我的商城</a></div>
						<div class="subnav">
							<ul>
								<li class="li"><span>订单中心</span>
									<ol>
										<li><a href="order/myorder">我的订单</a></li>
										<li><a href="order/myorder">我的退换货</a></li>
										<li><a href="order/myorder">我的退款</a></li>
									</ol>
								</li>
								<li class="li"><span>购买支持</span>
									<ol>
										<li> <a href="receiver_address.html">收货地址管理</a></li>
										<li> <a href="order/myorder">实名认证</a></li>
										<li> <a href="order/myorder">我的预约</a></li>
										<li> <a href="order/myorder">到货通知</a></li>
										<li> <a href="order/myorder">我的优享购</a></li>
									</ol>
								</li>
							</ul>
						</div>
					</div>
					<!-- 栏目 -->
					<div class="column fl">
						<div class="head clearfix">
							<div class="img fl"><img src="assest/img/user/头像.jpg"></div>
							<div class="name fl">
								<div><span class="consumer">${user.uname }</span></div>
								<div class="consumer_base">
									<a href="order/meuser?userid=${user.userid }" class="vip">会员权益</a>
									<a href="user/usercenter?userid=${user.userid }" class="account">账号中心</a>
								</div>
							</div>
							<div class="chunk fl">
								<div><a href="#" class="num">5</a></div>
								<div><span>积分</span></div>
							</div>
							<div class="chunk  fl">
								<div><a href="#" class="num">4</a></div>
								<div><span>优惠卷</span></div>
							</div>
							<div class="chunk  fl">
								<div><a href="#" class="num">0.00</a></div>
								<div><span>代金券</span></div>
							</div>
							<div class="chunk  fl">
								<div><a href="#" class="num">0</a></div>
								<div><span>花瓣</span></div>
							</div>
						</div>
						<!-- 内容 -->
						<div class="main clearfix">
							<!-- 中间部分 -->
							<div class="middle fl">
								<!-- 最近浏览 -->
								<div class="browse">
									<div class="title"><span>最近下单</span></div>
									<!-- 轮播图 -->
									<div class="swiper-container">
										<div class="swiper-wrapper">
										<c:forEach items="${orders }" var="order">
											<div class="swiper-slide"><img src="assest/img/${order.comm.commimg }"></div>
										</c:forEach>
										</div>
										<div class="swiper-button-prev"></div>
										<div class="swiper-button-next"></div>
									</div>
								</div>
							</div>
							<!-- 右侧内容 -->
							<div class="rights fl">
								<!-- 广告 -->
								<div class="advertising"><img src="assest/img/user/uesr_homepage/VUTCWxITsS0jb0wNXhJD.png" ></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 商品按钮 -->
		<div class="rapid">
			<div><a href="#"><img src="assest/img/user/uesr_homepage/图标1.jpg" ></a></div>
			<div><a href="#"><img src="assest/img/user/uesr_homepage/图标2.jpg" ></a></div>
		<div><a href="#"><img src="assest/img/user/uesr_homepage/图标3.jpg" ></a></div>
		<div class="back"><img src="assest/img/user/uesr_homepage/图标4.jpg" ></div>
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
				<div class="textlist clearfix">
					<ul class="clearfix overflow_cut fl">
						<li class="fl">
							<dl>
								<dt>
									<a href="#">购物相关</a>
								</dt>
								<dd>
									<a href="#">购物指南</a>
								</dd>
								<dd>
									<a href="#">配送方式</a>
								</dd>
								<dd>
									<a href="#">支付方式</a>
								</dd>
								<dd>
									<a href="#">常见问题</a>
								</dd>
							</dl>
						</li>
		
						<li class="fl">
							<dl>
								<dt>
									<a href="#">保修与退换货</a>
								</dt>
								<dd>
									<a href="#">保修政策</a>
								</dd>
								<dd>
									<a href="#">退换货政策</a>
								</dd>
								<dd>
									<a href="#">退换货流程</a>
								</dd>
								<dd>
									<a href="#">保修状态查询</a>
								</dd>
								<dd>
									<a href="#">配件防伪查询</a>
								</dd>
							</dl>
						</li>
		
						<li class="fl">
							<dl>
								<dt>
									<a href="#">维修与技术支持</a>
								</dt>
								<dd>
									<a href="#">售后网点</a>
								</dd>
								<dd>
									<a href="#">预约维修</a>
								</dd>
								<dd>
									<a href="#">手机寄修</a>
								</dd>
								<dd>
									<a href="#">备件价格查询</a>
								</dd>
								<dd>
									<a href="#">上门服务</a>
								</dd>
							</dl>
						</li>
		
						<li class="fl">
							<dl>
								<dt>
									<a href="#">特色服务</a>
								</dt>
								<dd>
									<a href="#">防伪查询</a>
								</dd>
								<dd>
									<a href="#">补购保障</a>
								</dd>
								<dd>
									<a href="#">以旧换新</a>
								</dd>
								<dd>
									<a href="#">礼品包装</a>
								</dd>
							</dl>
						</li>
		
						<li class="fl">
							<dl>
								<dt>
									<a href="#">关于我们</a>
								</dt>
								<dd>
									<a href="#">公司介绍</a>
								</dd>
								<dd>
									<a href="#">华为商城简介</a>
								</dd>
								<dd>
									<a href="#">华为零售店</a>
								</dd>
								<dd>
									<a href="#">荣耀零售店</a>
								</dd>
								<dd>
									<a href="#">意见反馈</a>
								</dd>
							</dl>
						</li>
		
						<li class="fl">
							<dl>
								<dt>
									<a href="#">友情链接</a>
								</dt>
								<dd>
									<a href="#">华为集团</a>
								</dd>
								<dd>
									<a href="#">华为CBG官网</a>
								</dd>
								<dd>
									<a href="#">荣耀官网</a>
								</dd>
								<dd>
									<a href="#">花粉俱乐部</a>
								</dd>
								<dd>
									<a href="#">华为云</a>
								</dd>
							</dl>
						</li>
		
					</ul>
					<div class="tellus fl">
						<div class="phone_num">950805</div>
						<div class="des">7x24小时客服热线（仅收市话费）</div>
						<div class="online">
							<a href="#">
								<img src="assest/img/index/ia_100000410_tell_11.png" class="vertical">
								<span class="call vertical">在线客服</span>
							</a>
						</div>
					</div>
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
		<script src="assest/js/footer_header.js" type="text/javascript" charset="utf-8"></script>
		<script src="assest/js/user.js" type="text/javascript" charset="utf-8"></script>
		
	</body>

</html>
