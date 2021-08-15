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
<link rel="stylesheet" type="text/css" href="assest/css/sell_detail.css" />
</head>
<body>
	<!-- header 头部 -->
	<div class="header">
		<!-- container 宽度是1200px -->
		<div class="container clearfix">
			<!-- 顶部右侧导航栏 -->
			<div class="right_nav fr">
				<ul class="clearfix">
					<li class="fl arr"><a href="user/index">首页</a></li>
					<li class="fl arr"><a href="user/login">登录</a></li>
					<li class="fl arr"><a href="user/register">注册</a></li>
					<li class="fl arr"><a href="order/myorder">我的订单</a></li>
					<li class="fl">
						<div class="cart position_relative">
							<div class="text">
								<img src="assest/img/index/shop_logo.png" class="vertical"> <a
									href="user/cart" class="vertical">购物车</a>
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
					<li class="logo vertical"><img
						src="assest/img/index/ia_100000006.png"></li>
					<li class="huawei vertical"><img
						src="assest/img/index/ia_100000007.png"></li>
					<li class="glory vertical"><img
						src="assest/img/index/ia_100000008.png"></li>
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
	<div class="bor"></div>
	<div class="content bottom clearfix">
		<div class="head">
			<a href="user/index">首页</a> &nbsp; > &nbsp; <a href="user/selllist?rootid=${comm.rootid }">${rootcata.cataname }</a> &nbsp; > &nbsp;
			<a href="user/cataselllist?preid=${precata.catalogueid }">${precata.cataname }</a> &nbsp; > &nbsp;${comm.commname }
		</div>
		<div class="pic fl">
			<img class="img_1" src="assest/img/${comm.commimg }">
		</div>

		<div class="details clearfix fr">
			<div>
				<a class="title" href="#">${comm.commname }</a>
			</div>
			
			<ul class="price">
				<li class="cost">价 &nbsp; &nbsp; &nbsp;格<span>￥${comm.commprice }</span></li>
				<li class="stage"><span><img
						src="assest/img/sell_detail/images/2.jpg">
						花呗、掌上生活、银联、工行分期支付可享免息（免息活动适用于单款免息商品订单，含多123</span></li>
				<li class="integral"><span><img
						src="assest/img/sell_detail/images/3.jpg"> 购买即赠商城积分，积分可抵现~</span></li>
				<li class="detail"></li>
				<li class="detail">商 &nbsp;品 &nbsp;详 &nbsp;情  &nbsp;<span>${comm.commdetails }</span></li>
			</ul>
			<div class="border"></div>
			<ul class="deploy clearfix">
				<li class="fix fl">
					<div class="have_chosen">${comm.description }</div>
				</li>
				<li class="fix fl">
				<div style="font-family:幼圆;font-size:15px;color:red;height: 30px;line-height: 30px">${error }</div>
				</li>
			</ul>
			<ul class="end clearfix">
				<li class="button clearfix fl">
					<div class="counter fl">1</div>
					<button class="add fr" type="button">+</button>
					<button class="subtract fr" disabled type="button">―</button>
				</li>
				<li class="settle_accounts fl">
					<button class="cart" type="button">加入购物车</button>
					<button class="pay" type="button">立即下单</button>
					<form action="cart/submitcart" class="ordersubmit">
						<input type="hidden" name="userid">
						<input type="hidden" name="commid" class="commid">
						<input type="hidden" name="count">
						<input type="hidden" name="price">
					</form>
				</li>
				<li>
				<form class="submit" action="user/cart" method="post">
					<input class="commcount" type="hidden" name="commcount">
					<input class="commname" type="hidden" name="commname">
					<input class="commid" type="hidden" name="commid">
				</form>
				</li>
			</ul>
		</div>
	</div>
	
	<div class="content">
		<div class="comment_1">售后服务</div>
		<div class="cut_off_2"></div>
		<ul class="html clearfix">
			<li class="list">本产品全国联保，享受三包服务，质保期为：一年质保</li>
			<li class="list">如因质量问题或故障，凭厂商维修中心或特约维修点的质量检测证明，享受7天内退货，15日内换货，15日以上在质保期内享受免费保修等三包服务！</li>
			<li class="list">售后服务电话：950800</li>
			<li class="list">华为消费者BG官网： https://consumer.huawei.com/cn/</li>
		</ul>
		<ul class="Hanzi ">
			<li>*因可能存在系统缓存，页面更新导致价格变动异常等不确定性情况出现，如您发现活动商品标价或促销信息有异常，请您立即联系我们，以便我们及时补正。</li>
			<li>*以上页面中的产品图片及屏幕内容仅作示意，实物产品效果（包括但不限于外观、颜色、尺寸）和屏幕显示内容（包括但不限于背景、UI、配图）可能略有差异，请以实物为准。</li>
			<li>*以上页面中的数据为理论值，均来自华为内部实验室，于特定测试环境下所得（请见各项具体说明），实际使用中可能因产品个体差异、软件版本、使用条件和环境因素不同略有不同，请以实际使用的情况为准。</li>
			<li>*为提供尽可能准确的产品信息、规格参数、产品特性，华为或荣耀可能实时调整和修订以上页面中的文字表述、图片效果等内容，以求与实际产品性能、规格、指数、零部件等信息相匹配，由于产品批次和生产供应因素实时变化，如遇确有进行上述修改和调整必要的情形，恕不专门通知。</li>
		</ul>
	</div>
	<div class="cut_off"></div>
	<div class="content">
		<div class="num"></div>
	</div>


	<!-----------------------右侧固定定位  复制footer的话要一起复制这这个哦 --------------->
	<div class="right_fixed">
		<ul>
			<li class="position_relative"><a href="user/cart"> <img
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
			<div class="textlist clearfix">
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
	<script src="assest/lib/swiper/js/swiper.min.js" type="text/javascript"
		charset="utf-8"></script>
	<script src="assest/lib/layer/layer.js"></script>
	<script src="assest/js/sell_detail.js"></script>
	<script src="assest/js/footer_header.js"></script>
	<script type="text/javascript">
	var ctx="${ctx}/";
	var userid="${ssmuser.userid}";
	var commid="${comm.commid}";
	var commname="${comm.commname}";
	var counter=$(".counter");
	var money=${comm.commprice};
	var count=${comm.count};
	</script>
</body>
</html>
