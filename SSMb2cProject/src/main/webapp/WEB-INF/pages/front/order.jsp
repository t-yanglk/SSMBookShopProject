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
			<link rel="stylesheet" type="text/css" href="assest/css/footer_header.css"/>
			<link rel="stylesheet" type="text/css" href="assest/css/user.css" />
			<link rel="stylesheet" type="text/css" href="assest/css/order.css" />
			<style type="text/css">
				.list-group-item{
				width: 1300px !important;
				}
				.return,.del,.bookreturn{
				color:black;
				cursor: pointer;
				}
				.return:hover,.del:hover,.bookreturn:hover{
				color:red;
				}
				.all,.finish,.afford,.exit{
				cursor: pointer;
				}
			</style>
	</head>
	<body>
		<div class="header">
				<!-- 顶部右侧导航栏 -->
				<div class="right_nav fr">
					<ul class="clearfix">
						<li class="fl">
							<a href="user/index">首页</a>
						</li>
						<li class="fl" ><a href="order/meuser?userid=${user.userid }" class="vertical">${user.uname }</a></li>
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
					</ul>
				</div>
			</div>
		</div>
		<!-- 内容 -->
		
			<div class="container">
				<div class="home1">
					<!-- 首页 跳转-->
					<a href="user/index">首页</a>
					<span>></span>
					<a href="order/myorder">我的订单</a>
				</div>
				<div class="content clearfix">
					<!-- 栏目 -->
					<div class="fl details">
						<!-- 标题 -->
						<div class="title clearfix">
							<div class="designation fl">我的订单</div>
							<div class="designation_fr fr">
								<ul>
									<li>用户订单</li>
								</ul>
							</div>
						</div>
						<div class="main">
							<ul class="main_ul">
								<li class="main_one"><div class="main_first">
									<div class="title_one">
									<form class="submit" method="post" action="order/showcheck">
										<input type="hidden" name="name" class="name"/>
										<span class="main_one_title all">全部有效订单</span>
										<span class="main_one_title afford">待付款</span>
									</form>
									</div>
									<div class="column">
										<div>
											<span class="commodity">商品</span>
											<span class="unit">单价/元</span>
											<span class="quantity">数量</span>
											<span class="phase">支付状态</span>
											<span class="borrow">是否借阅</span>
											<span class="isreturn">是否归还</span>
											<span class="payment">实付款数</span>
											<span class="operation">订单状态及操作</span>
										</div>
									</div>
									<div>
										<div class="main_one_content">
										
										<c:forEach items="${orders }" var="order">
											<!-- 商品 -->
											<div class="list-group-item">
												<div class="item-product clearfix">
													<div class="item-message fl">
														<span class="no orderid">订单号</span><span>${order.orderid }</span>
														<span class="logistics">物流信息</span>
													</div>
												</div>
												<div class="product-phone clearfix">
													<div class="img fl"><img src="assest/img/${order.comm.commimg }" ></div>
													<div class="name fl">${order.comm.commname }</div>
													<div class="money fl">￥${order.comm.commprice }</div>
													<div class="quantity fl">${order.count }</div>
													<div class="state fl">${order.state=="0"?"未支付":"已支付"}</div>
													<div class="state fl">${order.subcribe=="N"?"否":"是"  }</div>
													<div class="state fl">${order.isreturn=="N"?"否":"是" }</div>
													<div class="actual fl">${order.price }</div>
													<div class="operation fl">
														<div class="del">删除订单</div>
														<div><a href="order/defray?orderid=${order.orderid }">去支付</a></div>
														<div class="return">图书退货</div>
														<input type="hidden" class="hidden_orderid" value="${order.orderid }">
														<div class="bookreturn">归还图书</div>
													</div>
												</div>
											</div>
										</div>
										</c:forEach>
									</div>
								</div></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		<div class="right_fixed">
			<ul>
				<li class="position_relative">
					<a href="#">
						<img src="assest/img/index/ia_100000000_01_03.png">
					</a>
					<div class="cart">购物车</div>
				</li>
				<li class="position_relative">
					<a href="#">
						<img src="assest/img/index/ia_100000000_01_05.png">
					</a>
					<div class="cart">在线客服</div>
				</li>
				<li class="position_relative">
					<a href="#">
						<img src="assest/img/index/ia_100000000_01_07.png">
					</a>
					<div class="cart">意见反馈</div>
				</li>
				<li class="position_relative  backTop">
					<a href="#">
						<img src="assest/img/index/ia_100000000_01_09.png">
					</a>
				</li>
			</ul>
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
						<div class="other">
							<span>关注Vmall：</span>
							<a href="#">
								<img src="assest/img/index/ia_100000410_02.png">
							</a>
							<a href="#">
								<img src="assest/img/index/ia_100000410_04.png">
							</a>
							<a href="#">
								<img src="assest/img/index/ia_100000410_06.png">
							</a>
							<a href="#">
								<img src="assest/img/index/ia_100000410_08.png">
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
		<script src="assest/js/footer_header.js" type="text/javascript" charset="utf-8"></script>
		<script src="assest/lib/layer/layer.js"></script>
		<script src="assest/js/order.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			var ctx="${ctx}";
		</script>
	</body>
</html>
