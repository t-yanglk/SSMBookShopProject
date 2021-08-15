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
		<link rel="stylesheet" type="text/css" href="assest/lib/jq22jQueryDistpicker881120160621/bootstrap-3.3.4.css" />
		<link rel="stylesheet" type="text/css" href="assest/css/user_center.css" />
		<style type="text/css">
		.right{
			margin-right: 10px !important;
		}
		</style>
	</head>
	<body>
		<div class="header">
			<div class="container1 clearfix">
				<div class="logo fl">
					<span class="sign">HUAWEI</span>
					<span>账号中心</span>
				</div>
				<div class="quit fr right">
					<a href="order/myorder">我的订单</a>
				</div>
				<div class="quit fr right">
					<a href="order/meuser?userid=${user.userid }">${user.uname }</a>
				</div>
				<div class="quit fr right">
					<a href="user/cart">购物车</a>
				</div>
				<div class="quit fr right">
					<a href="user/index">首页</a>
				</div>
			</div>
		</div>
		<div class="background">
			<div class="container1">
				<div class="content">
					<ul class="tab_content">
						<!-- 账户与安全 -->
						<li>
							<!-- 安全 -->
							<div class="safety">
								<div class="label co_label"><span>基本信息</span></div>
								<!-- 账号 -->
								<div class="protect clearfix">
									<div class="img co_img fl">
										<img src="assest/img/user-center/account_p.png">
									</div>
									<div class="name fl">
										<span class="cell-phone co_text">用户账号</span>
										<span class="cell-phone co_text">${user.userid }</span>
									</div>
								</div>
								<!-- 用户名 -->
								<div class="protect clearfix">
									<div class="img co_img fl">
										<img src="assest/img/user-center/account_p.png">
									</div>
									<div class="name fl">
										<span class="cell-phone co_text">用户名</span>
										<span class="cell-phone co_text">${user.uname }</span>
									</div>
									<div class="fr">
									</div>
								</div>
								<!-- 手机号 -->
								<div class="protect clearfix">
									<div class="img co_img fl">
										<img src="assest/img/user-center/phone.png">
									</div>
									<div class="name fl">
										<span class="cell-phone co_text">手机号</span>
										<span class="cell-phone co_text">${user.phone }</span>
									</div>
									<div class="fr">
									</div>
								</div>
								<!-- 用户余额 -->
								<div class="protect clearfix">
									<div class="img co_img fl">
										<img src="assest/img/user-center/account_p.png">
									</div>
									<div class="name fl">
										<span class="cell-phone co_text">用户余额</span>
										<span class="cell-phone co_text">￥${user.money }</span>
									</div>
									<div class="fr">
									</div>
								</div>
								<!-- 修改密码 -->
								<div class="protect clearfix">
									<div class="img co_img fl">
										<img src="assest/img/user-center/modify.png">
									</div>
									<div class="name fl">
										<span class="cell-phone co_text">修改密码</span>
									</div>
									<div class="fr">
									</div>
								</div>
							</div>
							<!-- 绑定 -->
							<div class="biding">
								<div class="label co_label"><span>绑定</span></div>
								<div class="vx clearfix">
									<div class="img co_img fl">
										<img src="assest/img/user-center/wap_weixin.png">
									</div>
									<div class="name fl">
										<span class="cell-phone co_text">微信</span>
									</div>
									<div class="fr">
										<button type="button" class="btn_type">解绑</button>
									</div>
								</div>
								<div class="qq clearfix">
									<div class="img co_img fl">
										<img src="assest/img/user-center/wap_qq%20(1).png">
									</div>
									<div class="name fl">
										<span class="cell-phone co_text">QQ</span>
									</div>
									<div class="fr">
										<button type="button" class="btn_type">解绑</button>
									</div>
								</div>
								<div class="wb clearfix">
									<div class="img co_img fl">
										<img src="assest/img/user-center/wap_weibo.png">
									</div>
									<div class="name fl">
										<span class="cell-phone co_text">微博</span>
									</div>
									<div class="fr">
										<button type="button" class="btn_type">解绑</button>
									</div>
								</div>
							</div>
							
						</li>
						<!-- 个人信息 -->
						<li>
							<div class="massage clearfix">
								<div class="img fl"><img src="assest/img/user/头像.jpg"></div>
								<div class="open fl">
									<div class="title"><span>公开信息</span></div>
									<div class="list clearfix">
										<div class="list_fl fl">
											<span class="nickname">昵称:</span>
											<span class="name nickname_name">哈哈哈</span>
										</div>
										<div class="list_fr fr"><button type="button" class="name_compile massage_name">编辑</button></div>
									</div>
								</div>
								<div class="open fl">
									<div class="list clearfix">
										<div class="list_fl fl">
											<span class="nickname">华为号:</span>
											<span class="name huawei_name">huawei</span>
										</div>
										<div class="list_fr fr"><button type="button" class="name_compile massage_huawei">编辑</button></div>
									</div>
								</div>
								<div class="open fl">
									<div class="list clearfix">
										<div class="list_fl fl">
											<span class="nickname">性别:</span>
											<span class="name gender_name">男</span>
										</div>
										<div class="list_fr fr"><button type="button" class="name_compile massage_gender">选择</button></div>
									</div>
								</div>
								<div class="open region fl">
									<span>选择地区</span>
									<form class="form-inline">
										<div data-toggle="distpicker">
											<div class="form-group">
												<label class="sr-only" for="province1">Province</label>
												<select class="form-control" id="province1"></select>
											</div>
											<div class="form-group">
												<label class="sr-only" for="city1">City</label>
												<select class="form-control" id="city1"></select>
											</div>
											<div class="form-group">
												<label class="sr-only" for="district1">District</label>
												<select class="form-control" id="district1"></select>
											</div>
										</div>
									</form>
								</div>
								<div class="open fl anopen">
									<div class="title"><span>非公开信息</span></div>
									<div class="list clearfix">
										<div class="list_fl fl">
											<span class="nickname">姓名:</span>
											<span class="name name_compellation">哈哈哈</span>
										</div>
										<div class="list_fr fr"><button type="button" class="name_compile massage_compellation">编辑</button></div>
									</div>
									<div class="list clearfix">
										<div class="list_fl fl">
											<span class="nickname">生日:</span>
											<input id="d422" class="Wdate" type="text" onclick="WdatePicker({maxDate:'%y-%M-%d'})" value="2016-02-16" />
											<span class="name"></span>
										</div>

									</div>
								</div>
							</div>
						</li>
						<!-- //安全中心 -->
						<li>
							<div class="security">
								<div class="title">安全中心</div>
								<div class="content">
									<div class="list clearfix">
										<div class="list_fl fl clearfix list_one">
											<div class="fl"><img src="assest/img/user-center/ic-findpwd.png"></div>
											<div class="text fl">
												<div><a href="#">找回密码</a></div>
												<span>找回华为账号密码</span>
											</div>
										</div>
										<div class="list_fl fl clearfix">
											<div class="fl"><img src="assest/img/user-center/ic-findpwd.png"></div>
											<div class="text fl">
												<div><a href="#">自助申诉</a></div>
												<span>手机或邮件停用时自助申诉</span>
											</div>
										</div>
									</div>
									<div class="list clearfix">
										<div class="list_fl fl clearfix list_one">
											<div class="fl"><img src="assest/img/user-center/ic-froze.png"></div>
											<div class="text fl">
												<div><a href="#">冻结账号</a></div>
												<span>可紧急冻结账号</span>
											</div>
										</div>
										<div class="list_fl fl clearfix">
											<div class="fl"><img src="assest/img/user-center/ic-unfroze.png"></div>
											<div class="text fl">
												<div><a href="#">解冻账号</a></div>
												<span>解除安全风险后，可解冻账号</span>
											</div>
										</div>
									</div>
								</div>

							</div>
						</li>
						<!-- 设置 -->
						<li>
							<div class="set">
								<div class="folk">
									<div class="title">家人共享</div>
									<div class="explain">
										若要管理“家人共享”，请前往华为手机系统“设置”>“华为帐号”>“家人共享”。<a href="#">了解更多</a>
									</div>
								</div>
							</div>
							<!-- 隐私中心 -->
							<div class="privacy">
								<div class="caption">
									<div class="title">隐私中心</div>
									<div class="explain">了解我们如何致力于保护您的隐私,访问我们的<a href="#">隐私网站</a></div>
								</div>
								<div class="content">
									<div class="details clearfix">
										<div class="img fl"><assest/img src="img/user-center/7e793934-338b-4ec0-8a10-06329ba73da1.png"></div>
										<div class="text fl">
											<div class="text_one">控制对您账号的访问</div>
											<div class="text_two">查看和撤回您授权第三方应用或网站的账号访问权限</div>
										</div>
										<div class="go fr"><a href="#"><img src="assest/img/user-center/836fc0bd-ad6e-4397-8f28-76cd3e6fb413.png" class="arrows"></a></div>
									</div>
									<div class="details clearfix">
										<div class="img fl"><img src="assest/img/user-center/838407f8-12fd-4e89-a541-a8ed414bfebc.png"></div>
										<div class="text fl">
											<div class="text_one">销号</div>
											<div class="text_two">永久删除你的华为账号和相关数据</div>
										</div>
										<div class="go fr"><a href="#"><img src="assest/img/user-center/836fc0bd-ad6e-4397-8f28-76cd3e6fb413.png" class="arrows"></a></div>
									</div>
									<div class="details clearfix">
										<div class="img fl"><img src="assest/img/user-center/99543b36-2b3c-4957-adb6-8a958b0c7950.png"></div>
										<div class="text fl">
											<div class="text_one">订阅信息</div>
											<div class="text_two">订阅我们的最新消息,最佳优惠和重要公告</div>
										</div>
										<div class="go fr"><a href="#"><img src="assest/img/user-center/836fc0bd-ad6e-4397-8f28-76cd3e6fb413.png" class="arrows"></a></div>
									</div>

								</div>
							</div>
							<!-- 云空间通知 -->
							<div class="notification">
								<div class="headline clearfix">
									<div class="title fl">
										<div class="big_title">华为账号与云空间通知</div>
										<div class="explain">已注册中国华为帐号</div>
									</div>
									<div class="arrow fr">
										<img src="assest/img/user-center/87557c40-9e22-4a9c-ae05-a67a687f21d1.png" class="arrow_show">
										<img src="assest/img/user-center/286ae64e-262b-470c-93e0-c8659ed57280.png" class="arrow_hidden">
									</div>
								</div>
								<div class="notification_content"><span>“华为帐号”与“云空间”是由华为软件技术有限公司（以下称“我们”或“华为”）为您提供的华为终端云业务的基础服务。请在使用本服务前仔细阅读以下内容：
									.在华为手机上使用华为帐号登录后，将启用云空间，查找我的手机和会员中心等服务，华为帐号也将作为华为终端类业务的通行凭证为华为应用市场、华为视频、华为音乐等业务及华为其他终端类设备及相关合作伙伴提供的一致的用户体验和认证安全。
									.“云空间”为您提供实时同步和备份功能，可以安全存储您的照片、联系人、日历、备忘录、浏览器书签等数据，并且在您的各个设备上保持同步，以保护您的个人数据，防止意外丢失。
									.国家要求的实名认证信息（包括身份证、银行卡信息）可能会提供给国家机关、企业事业单位进行核对以确保安全。我们同时构建了健全的风险控制系统，收集上述信息以保障华为、您或其他华为客户的权利，防止欺诈等违法活动并减少信用风险。
									.设备会关联您的华为帐号以为您提供更好的服务与支持。
									上述数据将会传输并保存至中华人民共和国境内的服务器。
									如果您不同意我们采集上述信息，我们可能无法为您提供完整的服务，您可以退出或注销华为帐号以终止以上数据或功能的收集与处理。
									您已于2020年2月14日同意上述内容及<a href="#">华为帐号与云空间用户协议</a>、<a href="#">关于华为帐号与云空间隐私的声明</a>。</span></div>
							</div>
						</li>
					</ul>
				</div>
				<!-- 尾部 -->
				<div class="footer">
					<div>
						<a href="#">华为账号与云空间协议</a>
						<a href="#">关于华为账号与云空间隐私的声明</a>
						<a href="#">常见问题</a>
						<a href="#">Cookies</a>
					</div>
					<div> <span>Copyight</span></div>
				</div>
			</div>
		</div>
		<!-- 用户名弹出框 -->
		<div class="pop_uname">
			<div class="farm">
				<div><span>用户名</span><input type="text" class="uname_input" /></div>
				<div class="phone_mistake">用户名输入错误</div>
				<div class="push"><button type="button" class="cancel_uname pop_phone_uname">取消</button>
					<button type="button" class="confirm_phone pop_phone_type">确定</button></div>
			</div>
		</div>
		<!--手机 弹出框 -->
		<div class="pop_phone">
			<div class="farm">
				<div><span>手机号</span><input type="text" class="phone_input" /></div>
				<div class="phone_mistake">手机号输入错误</div>
				<div class="push"><button type="button" class="cancel_phone pop_phone_type">取消</button>
					<button type="button" class="confirm_phone pop_phone_type">确定</button></div>
			</div>
		</div>
		<!-- 设置余额 -->
		<div class="pop_email">
			<div class="farm">
				<div><span>修改余额</span><input type="text" class="email_input" /></div>
				<div class="email_mistake">余额输入错误</div>
				<div class="push"><button type="button" class="cancel_email pop_phone_type">取消</button>
					<button type="button" class="confirm_email pop_phone_type">确定</button></div>
			</div>
		</div>
		<!-- 密码 -->
		<div class="pop_nickname">
			<div class="farm">
				<div class="name"><span>密码</span></div>
				<div class="import"><input type="text" class="input nickname_input" /></div>
				<div class="push">
					<button type="button" class="type cancel_nickname ">取消</button>
					<button type="button" class="type confirm_nickname">确定</button>
				</div>
			</div>
		</div>
		<!-- 华为号 -->
		<div class="pop_huawei">
			<div class="farm">
				<div class="name"><span>昵称</span></div>
				<div class="import"><input type="text" class="input huawei_input" /></div>
				<div class="push">
					<button type="button" class="type cancel_huawei ">取消</button>
					<button type="button" class="type confirm_huawei">確定</button>
				</div>
			</div>
		</div>
		<!-- //性别 -->
		<div class="pop_gender">
			<div class="farm">
				<div class="namex"><span>性别</span></div>
				<div class="push clearfix">
					<span class="name fl">男</span>
					<input type="radio" name="man" value="男" class="gender_input fr">
				</div>
				<div class="push clearfix">
					<span class=" name fl">女</span>
					<input type="radio" name="man" value="女" class="gender_input fr">
				</div>
				<div class="push clearfix">
					<span class=" name fl">保密</span>
					<input type="radio" name="man" value="保密" class="gender_input fr" checked>
				</div>
				<div>
					<button type="button" class="type confirm_gender">確定</button>
				</div>
			</div>
		</div>
		<!-- 姓名 -->
		<div class="pop_compellation">
			<div class="farm">
				<div class="name"><span>昵称</span></div>
				<div class="import"><input type="text" class="input compellation_input" />
					<div class="compellation_mistake">请输入正确的姓名</div>
				</div>

				<div class="push">
					<button type="button" class="type cancel_compellation ">取消</button>
					<button type="button" class="type confirm_compellation">確定</button>
				</div>
			</div>
		</div>
		<script src="assest/js/jquery-3.4.1.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="assest/lib/My97DatePicker/WdatePicker.js" type="text/javascript" charset="utf-8"></script>
		<script src="http://www.jq22.com/jquery/1.11.1/jquery.min.js"></script>
		<script src="http://www.jq22.com/jquery/bootstrap-3.3.4.js"></script>
		<script src="assest/lib/jq22jQueryDistpicker881120160621/jQueryDistpicker20160621/js/distpicker.data.js" type="text/javascript"
		 charset="utf-8"></script>
		<script src="assest/lib/jq22jQueryDistpicker881120160621/jQueryDistpicker20160621/js/distpicker.js" type="text/javascript"
		 charset="utf-8"></script>
		<script src="assest/js/user_center.js" type="text/javascript" charset="utf-8"></script>
	</body>
</html>
