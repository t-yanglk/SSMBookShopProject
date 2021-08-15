<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="assest/css/reset.css"/>
		<link rel="stylesheet" type="text/css" href="assest/css/footer_header.css"/>
	</head>
	<body>
		<!-- header 头部 -->
		<div class="header">
			<!-- container 宽度是1200px -->
			<div class="container clearfix">
				<!-- 左侧顶部导航栏 -->
				<div class="left_nav fl">
					<ul class="clearfix">
						<li>
							<a href="#">首页</a>
						</li>
						<li>
							<a href="#">华为官网</a>
						</li>
						<li>
							<a href="#">荣耀官网</a>
						</li>
						<li>
							<a href="#">花粉俱乐部</a>
						</li>
						<li>
							<a href="#">V码(优购码)</a>
						</li>
						<li>
							<a href="#">企业购</a>
						</li>
						<li>
							<a href="#">Select Region</a>
						</li>
						<li>
							<div class="dropdown position_relative">
								<div class="more shortcut">
									<a href="#" class="vertical">更多精彩</a>
									<i class="arrows_icon icon_arrow_black vertical"></i>
								</div>
								<div class="list">
									<div class="dropdown_more">
										<dl>
											<dt>
												<a href="#">EMUI</a>
											</dt>
											<dt>
												<a href="#">应用市场</a>
											</dt>
											<dt>
												<a href="#">华为终端云空间</a>
											</dt>
											<dt>
												<a href="#">开发者联盟</a>
											</dt>
										</dl>
									</div>
								</div>
							</div>
						</li>
					</ul>
				</div>
				<!-- 顶部右侧导航栏 -->
				<div class="right_nav fr">
					<ul class="clearfix">
						<li class="fl">
							<a href="#">请登录</a>
						</li>
						<li class="fl">
							<a href="#">注册</a>
						</li>
						<li class="fl">
							<a href="#">我的订单</a>
						</li>
						<li class="fl">
							<div class="service position_relative">
								<div class="text">
									<a href="#" class="vertical">客户服务</a>
									<div class="arrows_icon icon_arrow_black vertical"></div>
								</div>
								<div class="service_list">
									<div>
										<a href="#">服务中心</a>
									</div>
									<div>
										<a href="#">联系客服</a>
									</div>
								</div>
							</div>
		
						</li>
						<li class="fl">
							<div class="shop position_relative">
								<div class="shop_nav">
									<a href="#" class="vertical">网站导航</a>
									<div class="arrows_icon icon_arrow_black vertical"></div>
								</div>
								<div class="shop_list">
									<div class="navigation clearfix">
										<span class="login-icon">
											<a href="#">
												<i class="arrows_icon icon_home"></i>
												商城首页
											</a>
										</span>
										<!--频道-->
										<dl>
											<dt>
												频道
											</dt>
											<dd>
												<a href="#">
													华为专区
												</a>
											</dd>
											<dd>
												<a href="#">
													企业购
												</a>
											</dd>
										</dl>
										<!--荣耀专区-->
										<dl>
											<dt>
		
											</dt>
											<dd>
												<a href="#">
													荣耀专区
												</a>
											</dd>
										</dl>
										<!--产品-->
										<dl>
											<dt>
												产品
											</dt>
											<dd>
												<a href="#">
													手机
												</a>
											</dd>
											<dd>
												<a href="#">
													平板&笔记本
												</a>
											</dd>
											<dd>
												<a href="#">
													智能穿戴
												</a>
											</dd>
										</dl>
										<!--智能家居-->
										<dl>
											<dt>
		
											</dt>
											<dd>
												<a href="#">
													智能家居
												</a>
											</dd>
											<dd>
												<a href="#">
													通用配件
												</a>
											</dd>
											<dd>
												<a href="#">
													专属配件
												</a>
											</dd>
										</dl>
										<!--增值服务-->
										<dl>
											<dt>
												增值服务
											</dt>
											<dd>
												<a href="#">
													依旧换新
												</a>
											</dd>
											<dd>
												<a href="#">
													补够保障
												</a>
											</dd>
										</dl>
										<!--礼品包装-->
										<dl>
											<dt>
		
											</dt>
											<dd>
												<a href="#">
													礼品包装
												</a>
											</dd>
											<dd>
												<a href="#">
													一口价换电池
												</a>
											</dd>
										</dl>
										<!--会员-->
										<dl>
											<dt>
												会员
											</dt>
											<dd>
												<a href="#">
													会员频道
												</a>
											</dd>
		
										</dl>
									</div>
								</div>
							</div>
		
						</li>
		
						<li class="fl">
							<div class="phone position_relative">
								<div class="text">
									<a href="#">手机版</a>
									<div class="arrows_icon icon_arrow_black vertical"></div>
								</div>
								<div class="dropdown_list">
									<div class="app clearfix">
										<div class="img fl"><img src="assest/img/index/ia_100004572.png"></div>
										<div class="des fl">
											<p class="title">华为商城APP</p>
											<p>新人专享好礼</p>
											<p>最高5000积分</p>
										</div>
									</div>
									<div class="weixin clearfix">
										<div class="img fl"><img src="img/index/ia_100000363.jpg"></div>
										<div class="des fl">
											<p class="title">华为商城公众号</p>
											<p>扫一扫查看</p>
										</div>
									</div>
									<div class="weixin_shop clearfix">
										<div class="img fl"><img src="assest/img/index/ia_100004574.jpg"></div>
										<div class="des fl">
											<p class="title">华为微信小程序</p>
											<p>扫一扫查看</p>
										</div>
									</div>
								</div>
							</div>
		
						</li>
						<li class="fl">
							<div class="cart position_relative">
								<div class="text">
									<img src="img/index/shop_logo.png" class="vertical">
									<a href="#" class="vertical">购物车(0)</a>
								</div>
								<div class="dropdown_cart">
									<div class="cart_list">
										<div><img src="assest/img/index/ia_100000000_52_02.png"></div>
										<p>您的购物车是空的，赶紧选购吧~</p>
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
		
		
		<!-----------------------右侧固定定位  复制footer的话要一起复制这这个哦 --------------->
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
		
		
		<!----------------------- footer  尾部  要把上边的固定定位一起复制--------------------------->
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
	</body>
</html>
