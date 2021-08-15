var swiper = new Swiper('.swiper-container', {
 	loop: true, // 循环模式选项
 	slidesPerView: 3,
 	spaceBetween: 30,
 	pagination: {
 		el: '.swiper-pagination',
 		clickable: true,
 	},
 	navigation: {
 		nextEl: '.swiper-button-next',
 		prevEl: '.swiper-button-prev',
 	},
 });

$('.back').click(function () {
	$('html,body').animate({scrollTop:0})
});
$(window).scroll(function () {
	var scrollTop=$(this).scrollTop();
	if(scrollTop>600){
		$('.back').css('opacity',1);
	}else{
		$('.back').css('opacity',0);
	}
	
})