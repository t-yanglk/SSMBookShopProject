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
<link rel="stylesheet" type="text/css"
	href="assest/lib/swiper/css/swiper.min.css" />
<link rel="stylesheet" type="text/css" href="assest/css/index.css" />

</head>
<body>
	<!-- header 头部 -->
	<div class="header">
		<!-- container 宽度是1200px -->
		<div class="container clearfix">
			<!-- 顶部右侧导航栏 -->
			<div class="right_nav fr">
				<ul class="clearfix">
					<li class="fl"><a href="order/meuser?userid=${user.userid }">${user.uname }</a></li>
					<li class="fl"><a href="user/login">请登录</a></li>
					<li class="fl"><a href="user/register">注册</a></li>
					<li class="fl"><a href="order/myorder">我的订单</a></li>
					<li class="fl">
						<div class="cart position_relative">
							<div class="text">
								<img src="assest/img/index/shop_logo.png" class="vertical">
								<a href="user/cart" class="vertical">购物车</a>
							</div>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>

	</div>
	<!-- logo -->
	<div class="logo_nav">
		<div class="container clearfix">
			<div class="logo_left fl">
				<ul class="clearfix">
					<li class="logo vertical"><a href="#"> <img
							src="assest/img/index/ia_100000006.png">
					</a></li>
				</ul>
			</div>
		</div>
	</div>

	<!-- 轮播图 -->
	<div class="swiper-container">
		<div class="swiper-wrapper">
			<div class="swiper-slide">
				<img src="assest/img/commodity/1155117160017041_b .jpg">
			</div>
			<div class="swiper-slide">
				<img src="assest/img/commodity/Redocn_2013072112053442.jpg">
			</div>
			<div class="swiper-slide">
				<img src="assest/img/commodity/LDaJM6SXcW_small.jpg">
			</div>
			<div class="swiper-slide">
				<img src="assest/img/commodity/xiaoyuantushuguanwenhuaqiang_9330449.jpg">
			</div>
			<div class="swiper-slide">
				 <img src="assest/img/commodity/xianggangzhongw897_3.jpg">
			</div>
		</div>
		<!-- 如果需要分页器 -->
		<div class="swiper-pagination"></div>

	</div>
	<!-- 如果需要导航按钮 -->
	<div class="container position_relative">

		<div class="swiper-button-prev"></div>
		<div class="swiper-button-next"></div>
	</div>

	<!-- 遮盖栏  -->
	<div class="banner">
		<div class="container position_relative">
			<div class="banner_mask position_relative">

				<c:forEach items="${catas }" var="cata">
					<div class="box">
						<div class="list">
							<span class="item vertical">${cata.cataname }</span> <img
								src="assest/img/index/banner_next_02.png" class="next vertical"
								alt="">
						</div>
						<div class="hidenbox clearfix">

							<c:forEach items="${cata.childrencata }" var="childcata">
								<div class="left fl">
									<div>
										<a href="user/selllist?rootid=${cata.catalogueid }"> <img src="${childcata.cataimg }"
											class="img vertical" alt=""> <span class="vertical">${childcata.cataname }</span>
										</a>
									</div>
								</div>
							</c:forEach>
							<div class="left fl">
								<div class="all">
									<a href="user/selllist?rootid=${cata.catalogueid }"> <img
										src="assest/img/index/banner_next_02.png" class="vertical">
										<span class="des vertical">查看全部</span>
									</a>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>


	<!-- 热销产品 -->
	<div class="container">
		<div class="item_title">热销图书</div>
		<div class="hot_photos clearfix">
			<div class="left_ph fl">
				<img src="assest/img/index/t013f5054990b98376c.jpg">
			</div>

			<div class="right_ph fl">
				<ul class="clearfix overflow_cut">
				<c:forEach items="${comms }" var="comm">
				<li class="fl"><a href="user/selldetails?commid=${comm.commid }">
							<div class="item">
								<img src="assest/img/${comm.commimg }">
								<div class="title">${comm.commname }</div>
								<p class="desc">${comm.description }</p>
								<p class="price">¥${comm.commprice }</p>
							</div>
					</a></li>
				</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	<!-- 前进箭头 -->
	<div class="next">&gt;</div>
	</div>
	</div>

		<!-- 广告轮播图 -->
	<div class="adver container">
		<div class="swiper-container">
			<div class="swiper-wrapper">
				<div class="swiper-slide">
					<a href="sell_detail.html"> <img
						src="assest/img/index/ia_100000177.jpg">
					</a>
				</div>
				<div class="swiper-slide">
					<a href="sell_detail.html"> <img
						src="assest/img/index/ia_100000178.jpg">
					</a>
				</div>
				<div class="swiper-slide">
					<a href="sell_detail.html"> <img
						src="assest/img/index/ia_100000179.jpg">
					</a>
				</div>
				<div class="swiper-slide">
					<a href="sell_detail.html"> <img
						src="assest/img/index/ia_100000180.jpg">
					</a>
				</div>
				<div class="swiper-slide">
					<a href="sell_detail.html"> <img
						src="assest/img/index/ia_100000181.jpg">
					</a>
				</div>
				<div class="swiper-slide">
					<a href="sell_detail.html"> <img
						src="assest/img/index/ia_100000182.jpg">
					</a>
				</div>
				<div class="swiper-slide">
					<a href="sell_detail.html"> <img
						src="assest/img/index/ia_100000183.jpg">
					</a>
				</div>
			</div>
			<!-- 如果需要分页器 -->
			<div class="swiper-pagination"></div>
		</div>
	</div>



	<!-- 商品展示 -->
	<c:forEach items="${catas }" var="comm">
		<div class="container">
			<div class="HuaWei_phone clearfix">
				<div class="text">
					<div class="item_title fl">${comm.cataname }</div>
					<ul class="list clearfix fl">
						<c:forEach items="${comm.childrencata }" var="children">
							<li class="fl"><a href="user/cataselllist?preid=${children.catalogueid }">
									${children.cataname }</a></li>
						</c:forEach>
					</ul>
					<div class="more fr">
						<a href="user/selllist?rootid=${comm.catalogueid }" class="vertical">查看更多</a> <img
							src="assest/img/index/banner_next_02.png" class="vertical">
					</div>
				</div>
				<div class="item">
					<ul class="clearfix overflow_cut">
						<c:forEach items="${comm.rootcomms }" var="commodity">
							<li class="fl"><a
								href="user/selldetails?commid=${commodity.commid}"> <img
									src="assest/img/${commodity.commimg }" class="img">
									<div class="name">${commodity.commname }</div>
									<div class="des">${commodity.description }</div>
									<div class="price">¥${commodity.commprice }</div>
							</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
			<!-- 广告轮播图 -->
	<div class="adver container">
		<div class="swiper-container">
			<div class="swiper-wrapper">
				<div class="swiper-slide">
					<a href="sell_detail.html"> <img
						src="assest/img/index/ia_100000177.jpg">
					</a>
				</div>
				<div class="swiper-slide">
					<a href="sell_detail.html"> <img
						src="assest/img/index/ia_100000178.jpg">
					</a>
				</div>
				<div class="swiper-slide">
					<a href="sell_detail.html"> <img
						src="assest/img/index/ia_100000179.jpg">
					</a>
				</div>
				<div class="swiper-slide">
					<a href="sell_detail.html"> <img
						src="assest/img/index/ia_100000180.jpg">
					</a>
				</div>
				<div class="swiper-slide">
					<a href="sell_detail.html"> <img
						src="assest/img/index/ia_100000181.jpg">
					</a>
				</div>
				<div class="swiper-slide">
					<a href="sell_detail.html"> <img
						src="assest/img/index/ia_100000182.jpg">
					</a>
				</div>
				<div class="swiper-slide">
					<a href="sell_detail.html"> <img
						src="assest/img/index/ia_100000183.jpg">
					</a>
				</div>
			</div>
			<!-- 如果需要分页器 -->
			<div class="swiper-pagination"></div>
		</div>
	</div>
	</c:forEach>


	<!-- 前进箭头 -->
	<div class="next">&gt;</div>
	</div>
	</div>

	<!-- 前进箭头 -->
	<div class="next">&gt;</div>
	</div>
	</div>
	<!-- 前进箭头 -->
	<div class="next">&gt;</div>
	</div>
	</div>

	<!-- 主页楼层跳转 -->
	<div class="floor-box">
		<ul>
			<c:forEach items="${catas }" var="cata">
				<li class="item">${cata.cataname }</li>
			</c:forEach>
		</ul>
	</div>

	<!-----------------------右侧固定定位  复制footer的话要一起复制这这个哦 --------------->
	<div class="right_fixed">
		<ul>
			<li class="position_relative"><a href="cart.html"> <img
					src="assest/img/index/ia_100000000_01_03.png">
			</a>
				<div class="cart">购物车</div></li>
			<li class="position_relative"><a
				href="https://celia.consumer.huawei.com/vmall/#/?businessUUID=902d812b8bdb44e089e34544fb5d77e2&enterurl=https%3A%2F%2Fwww.vmall.com%2F&k=1&from=06&remark=">
					<img src="assest/img/index/ia_100000000_01_05.png">
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


	<!----------------------- footer  尾部  要把上边的固定定位一起复制--------------------------->
	<div class="footer">
		<div class="container">
			<div class="flaglist">
				<ul class="clearfix overflow_cut">
					<li class="fl"><a
						href="https://www.vmall.com/help/faq-934.html"> <img
							src="assest/img/index/ia_100000406_02.png" class="logo vertical">
							<span class="des vertical">百强企业 品质保证</span>
					</a></li>

					<li class="fl"><a
						href="https://www.vmall.com/help/faq-834.html"> <img
							src="assest/img/index/ia_100000406_03.png" class="logo vertical">
							<span class="des vertical">7天退货 15天换货</span>
					</a></li>

					<li class="fl"><a
						href="https://www.vmall.com/help/faq-4367.html"> <img
							src="assest/img/index/ia_100000406_04.png" class="logo vertical">
							<span class="des vertical">48元起免运费</span>
					</a></li>

					<li class="fl"><a
						href="https://consumer.huawei.com/cn/support/service-center/">
							<img src="assest/img/index/ia_100000406_05.png"
							class="logo vertical"> <span class="des vertical">1000家维修网点
								全国联保</span>
					</a></li>
				</ul>
			</div>
			<div class="copyright clearfix">
				<div class="fl">
					<img src="assest/img/index/ia_100000364.png" class="logo">
				</div>
				<div class="copy_text fl">
					<div class="text">
						<a href="#">隐私声明</a> <a href="#">服务协议</a> <a href="#">COOKIES</a>
						Copyright © 2012-2020 华为终端有限公司 版权所有 <a href="#">粤ICP备19015064号</a>|
						<a href="#">粤公网安备 44190002003939号</a>
						增值电信业务经营许可证：粤B2-20190762|备案主体编号：44201919072182
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="assest/lib/swiper/js/swiper.min.js" type="text/javascript"
		charset="utf-8"></script>
	<script src="assest/js/jquery-3.4.1.min.js" type="text/javascript"
		charset="utf-8"></script>
	<script src="assest/js/index.js" type="text/javascript" charset="utf-8"></script>

</body>
</html>
