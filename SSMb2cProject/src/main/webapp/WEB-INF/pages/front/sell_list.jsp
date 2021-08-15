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
	href="assest/css/footer_header.css" />
<link rel="stylesheet" type="text/css" href="assest/css/sell_list.css" />
</head>
<body>
	<!-- header 头部 -->
	<div class="header">
		<!-- container 宽度是1200px -->
		<div class="container clearfix">
			<!-- 顶部右侧导航栏 -->
			<div class="right_nav fr">
				<ul class="clearfix">
					<li class="fl"><a href="user/index">首页</a></li>
					<li class="fl"><a href="user/login">请登录</a></li>
					<li class="fl"><a href="user/register">注册</a></li>
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
	<!-- logo -->
	<div class="logo_nav">
		<div class="container clearfix ">
			<div class="logo_left fl">
				<ul class="clearfix">
					<li class="logo vertical"><img
							src="assest/img/index/ia_100000006.png">
					</li>
				</ul>
			</div>
		</div>
	</div>

	<!-- 位置 -->
	<div class="location">
		<div class="container">
			<span> <a href="user/index"> 首页 </a>
			</span> <span> > </span> <span>${cata.cataname }</span>
		</div>
	</div>
	<!-- 筛选 -->
	<div class="container">
		<div class="Sizer">
			<div class="item">
				<span class="rule"> 类别: </span> <span class="flag">${cata.cataname }</span>
			</div>
			<div class="item price_level">
				<span class="rule"> 价格区间： </span> <label> <input
					type="checkbox" name="price" id="" value="499" class="price" /> <span
					class="flag"> 0-499 </span>
				</label> <label> <input type="checkbox" name="price" id=""
					value="999" class="price" /> <span class="flag"> 500-999
				</span>
				</label> <label> <input type="checkbox" name="price" id=""
					value="1999" class="price" /> <span class="flag"> 1000-1999
				</span>
				</label> <label> <input type="checkbox" name="price" id=""
					value="2999" class="price" /> <span class="flag"> 2000-2999
				</span>
				</label> <label> <input type="checkbox" name="price" id=""
					value="3000" class="price" /> <span class="flag"> 3000及以上 </span>
				</label>
			</div>

		</div>
	</div>


	<!-- 商品列表 -->
	<div class="container">
		<div class="sell_list">
			<ul class="clearfix overflow_cut">
			<c:forEach items="${comms }" var="comm">
					<li class="fl"><a href="user/selldetails?commid=${comm.commid }">
							<div class="item position_relative">
								<div class="mask bgcolor_blue">新品</div>
								<img src="assest/img/${comm.commimg }">
								<div class="text">
									<div class="name">${comm.commname }</div>
									<div class="price">
										<span class="num">¥<b>${comm.commprice }</b></span> <span class="tip">多款可选</span>
									</div>
									<div class="des">
										<span>准点赠送</span>
									</div>
									<div class="good">
										<span>${comm.description }</span> 
									</div>
								</div>
							</div>
					</a></li>
				</c:forEach>
			</ul>
		</div>
	</div>



	<!-----------------------右侧固定定位  复制footer的话要一起复制这这个哦 --------------->
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
	<!----------------------- footer  尾部  要把上边的固定定位一起复制--------------------------->
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

	<script src="assest/js/jquery-3.4.1.min.js" type="text/javascript"
		charset="utf-8"></script>
	<script src="assest/js/footer_header.js" type="text/javascript"
		charset="utf-8"></script>
	<script src="assest/js/sell_list.js" type="text/javascript"
		charset="utf-8"></script>
</body>
</html>
