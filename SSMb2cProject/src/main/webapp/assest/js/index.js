//header_adver广告关闭事件
$('.header_adver .close').click(function () {
	$(this).parents('.header_adver').css('display','none');
})

//搜索的点击事件
$('.input_right input').focus(function () {
	$(this).siblings('.dropdown_search').css('display','block');
});
$('.input_right input').blur(function () {
	$(this).siblings('.dropdown_search').css('display','none');
});


// banner轮播图
var mySwiper = new Swiper('.swiper-container', {
	// direction: 'vertical', // 垂直切换选项
	effect: 'fade',
	loop: true, // 循环模式选项
	autoplay: {
		delay: 3000,
		stopOnLastSlide: false,
		disableOnInteraction: false,
	},
	// 如果需要分页器
	pagination: {
		el: '.swiper-pagination',
		clickable: true,
		bulletClass: 'my-bullet', //需设置.my-bullet样式
	},

	// 如果需要前进后退按钮
	navigation: {
		nextEl: '.swiper-button-next',
		prevEl: '.swiper-button-prev',
	},

});
// //鼠标滑过pagination控制swiper切换
// for (i = 0; i < Swiper.pagination.bullets.length; i++) {
// 	Swiper.pagination.bullets[i].onmouseover = function() {
// 		this.click();
// 	};
// }



// 公告的动画
var i = 0;
var timer;
start()

function start() {
	timer = setInterval(function() {
		move()
	}, 2000)
}

function move() {
	i = i + 32;
	$('.person .right .list').animate({
		top: '-' + i + 'px'
	});
	var topnum = $('.person .right .list').css('top')
	// console.log(topnum)
	if (topnum == '-160px') {
		i = -32;
		$('.person .right .list').css('top', '0')
	}
}

function stop() {
	clearInterval(timer);
}
$('.person .right .list').hover(function() {
	stop();
}, function() {
	start()
})




// 精品推荐的点击事件
//获取移动的宽度
var width = $('.container').css('width');
$('.recom_list .next').click(function() {
	$(this).siblings('.back').css('display', 'block');
	$(this).siblings('.recom_nav').animate({
		left: '-' + width
	})
	$(this).css('display', 'none');
})
$('.recom_list .back').click(function() {
	$(this).siblings('.recom_nav').animate({
		left: "0px"
	});
	$(this).css('display', 'none');
	$(this).siblings('.next').css('display', 'block');
});

//楼层跳转

$('.floor-box .item').click(function() {
	$('.floor-box .item').css('color', 'gray')
	//获取索引
	var i = $(this).index();
	//获取楼层的scrollTop值
	var top = $('.HuaWei_phone').eq(i).offset().top;
	//滚动
	$('html,body').animate({
		scrollTop: top
	});
	$(this).css('color', '#cf0a2c');
});

var floor = $('.HuaWei_phone').eq(0).offset().top;
var floor2 = $('.HuaWei_phone').eq(1).offset().top;
var floor3 = $('.HuaWei_phone').eq(2).offset().top;
//楼层跳转消失
$(window).scroll(function() {
	var scrollTop = $(this).scrollTop()+100;
	// console.log(scrollTop);
	// console.log(floor);
	if (scrollTop >= floor) {
		$('.floor-box .item').removeClass('border');
		$('.floor-box .item').eq(0).addClass('border');
	}
	if (scrollTop >= floor2) {
		$('.floor-box .item').removeClass('border');
		$('.floor-box .item').eq(1).addClass('border');
	}
	if (scrollTop >= floor3) {
		$('.floor-box .item').removeClass('border');
		$('.floor-box .item').eq(2).addClass('border');
	}
	if (scrollTop > 2070) {
		$('.floor-box').stop(true).fadeIn(200);
	} else {
		$('.floor-box').stop(true).fadeOut(200);
	}

});

// ------------------------------ footer 的样式  以上可以删除---------------------------------------------------
//回到顶部
$(window).scroll(function() {
	// 获取scrollTop值
	var scrollTop = $(this).scrollTop();
	// console.log(scrollTop);
	if (scrollTop > 300) {
		$('.backTop').stop(true).fadeIn();
	} else {
		$('.backTop').stop(true).fadeOut();
	}
});

//回到顶部
$('.backTop').click(function() {
	$('html,body').animate({
		scrollTop: 0
	});
});
