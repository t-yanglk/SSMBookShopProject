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