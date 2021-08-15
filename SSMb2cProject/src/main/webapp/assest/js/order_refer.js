// 倒计时
var ring = new Date().setHours(new Date().getHours() + 24);

function timelost() {
	var now = new Date();
	//date对象之差
	var time = ring - now;
	var oTime = document.querySelector(".time");
	//毫秒
	var sec = parseInt(time / 1000 % 60);
	var min = parseInt(time / (1000 * 60) % 60);
	var hour = parseInt(time / (1000 * 60 * 60) % 24);

	var str = hour + "时" + min + "分" + sec + "秒";

	oTime.innerHTML = str;
}
timelost();
var timer;
timer = setInterval(function() {
	timelost();
}, 1)




// 订单详情的点击事件
var flag = true;
$('.dropdown').click(function() {
	if (flag) {
		$(this).parents('.text').siblings('.list').animate({
			height: '150px'
		})
		flag = false;
	} else {
		$(this).parents('.text').siblings('.list').animate({
			height: '0'
		})
		flag = true;
	}
});

// 选项卡
$('.tab_title li').click(function() {
	//获取索引下标
	var index = $(this).index();
	// oContent 切换
	$(".tab_content .list").css('display', 'none');
	$(".tab_content .list").eq(index).css('display', 'block');
	//title 的切换
	$(".tab_title li").css('background-color', '#e8e8e8');
	$(this).css('background-color', 'white');
})

$('.tab_content li .logo').click(function() {
	$('.tab_content .list').find('.hide').css('display', 'none');
	$('.tab_content .list').find('.item').css('border', '1px solid #d0d0d0');

	$(this).find('.hide').css('display', 'block');
	$(this).children('.item').css('border', '1px solid #CF0A2C');
});


//绑定支付按钮的事件
$('.send').click(function() {
	layer.open({
		type: 1,
		skin: 'layui-layer-rim', //加上边框
		area: ['620px', '400px'], //宽高
		content: $('#layer'),
	});
	$('.one_btn').click(function() {
		window.parent.layer.closeAll()
		layer.msg('您已停止支付', {
			icon: 2
		});
	})
	$('.two_btn').click(function() {
		var url=ctx+"order/updateorder";
		$.post(url,{
			"orderid":orderid
		},function(resp){
			if(!resp.success){
				layer.alert("支付失败，请检查您的余额或者该图书您已支付！");
			}
		},"json");
			window.parent.layer.closeAll();
			layer.alert('交易完成,感谢您再次光临!', {
				skin: 'layui-layer-lan',
				closeBtn: 0,
				icon: 1,
				anim: 0 //动画类型
				});
			
	})

})
