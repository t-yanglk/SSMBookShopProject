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
<link rel="stylesheet" type="text/css"
	href="assest/css/footer_header.css" />
<link rel="stylesheet" type="text/css" href="assest/css/cart.css" />
</head>
<body>
	<!-- header 头部 -->
	<div class="header">
		<!-- container 宽度是1200px -->
		<div class="container clearfix">
			<!-- 顶部右侧导航栏 --> 
			<div class="right_nav fr">
				<ul class="clearfix">
					<li class="fl arr"><a href="order/meuser?userid=${user.userid }">${user.uname }</a></li>
					<li class="fl arr"><a href="user/index">首页</a></li>
					<li class="fl arr"><a href="order/myorder">我的订单</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="logo">
		<ul class="content clearfix">
			<li class="img fl"><img src="assest/img/index/ia_100000006.png"></li>
			<li class="cart fl">我的购物车</li>
			<li class="img_2 fr"><img src="assest/img/cart/2_1.png"></li>
		</ul>
	</div>
	<div class="layout">
		<div class="container">
			<div class="main">
				<div class="content">
					<div class="arr-cart">
						<div>
							<img src="assest/img/cart/11.png">
						</div>
						<p>您的购物车里什么也没有哦~</p>
						<a href="#">去逛逛</a>
					</div>
				</div>

				<!--实体购物车-->
				<div class="cart-list">
					<div class="cart-title clearfix">
						<label for="" class="checkbox"> <input readonly="readonly"
							type="checkbox" class="checkAll vam checked">全选
						</label>
						<ul class="clearfix">
							<li>商品</li>
							<li>单价</li>
							<li>数量</li>
							<li>小计</li>
							<li>操作</li>
						</ul>
					</div>
						<c:forEach items="${carts }" var="cart">
							<div class="allway">
								<form action="#" method="post">
									<div class="goods">
										<div class="goods-section">
											<div class="goods-list clearfix">
												<label class="checkbox"> <input type="checkbox"
													name="hobby" class="child-check check">
												</label>
												<div class="goods-area clearfix">
													<div class="goods-main clearfix">
														<a href="#" class="goods-img"><img
															src="assest/img/${cart.comm.commimg }" /></a>
														<input type="hidden" name="commid" value="${cart.comm.commid }" class="commid">
														<ul class="ul clearfix delcheck">
															<li><a href="user/selldetails?commid=${cart.comm.commid }" class="goods-name">${cart.comm.commname }</a></li>
															<li>
																<div class="goods-price">
																	<span>&nbsp;${cart.comm.commprice }</span>
																</div>
															</li>
															<li>
																<div class="goods-stock">
																	<div class="goods-1 clearfix">
																		<button class="add" type="button">+</button>
																		<span class="num">${cart.commcount }</span>
																		<button class="subtract" type="button">-</button>
																	</div>
																</div>
															</li>
															<li class="goods-price-total">${cart.comm.commprice*cart.commcount }</li>
															<li><div class="goods-del">删除</div></li>
														</ul>
													</div>
												</div>
											</div>
										</div>
									</div>
								</form>
						</c:forEach>
					

					
				<div class="order order-position">
					<div class="order-total-tool clearfix ">
						<div class="order-total-control">
							<label class="checkbox"><input readonly="readonly"
								type="checkbox" class="checkAll vam checked"> 全选</label> <div class="delallcomms">删除</div>
						</div>
						<div class="order-total-btn ">
							<form class="submitcart" action="cart/submitcart" method="post">
								<input type="hidden" name="userid">
								<input type="hidden" name="commid">
								<input type="hidden" name="price">
								<input type="hidden" name="count">
							</form>
							<div>立即结算</div>
						</div>
						<div class="order-total-price">
							<p>
								<label>总计：</label> ¥&nbsp; <span class="money">0</span> <em><b>不含运费</b></em>
							</p>
							<div class="total-choose">
								已选择 <em>0</em>件商品
							</div>
						</div>
					</div>
				</div>
			</div>
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
	<script src="assest/js/jquery-3.4.1.min.js"></script>
	<script src="assest/lib/layer/layer.js"></script>
	<script src="assest/js/cart.js"></script>
	<script src="assest/lib/swiper/js/swiper.min.js"></script>
	<script type="text/javascript">
		var ctx="${ctx}/";
		var userid=${user.userid};
	</script>
</body>
</html>
