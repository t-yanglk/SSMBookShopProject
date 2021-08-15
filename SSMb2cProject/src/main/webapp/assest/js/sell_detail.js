//查找元素
var oAddBtn = document.querySelector(".details .cart");
//数组
//读取Cookie
var cat = getCookie("cat");
if (cat) {
	cat = JSON.parse(cat);
} else {
	cat = [];
}

oAddBtn.onclick = function() {
	var price = $('.cost span').text()
	var name = $(".details .title").text()
	var num = $('.end .counter').text()
	var goods = {
		name: name,
		price: price,
		num: num,
	}

	if (cat.name == name) {
		cat.num += num;
		console.log(cat.num)
		document.cookie = "cat =" + JSON.stringify(cat);
		return;
	}

	cat.push(goods);
	document.cookie = "cat =" + JSON.stringify(cat);
}

function getCookie(cname) {
	var name = cname + "=";
	var ca = document.cookie.split(';');
	for (var i = 0; i < ca.length; i++) {
		var c = ca[i].trim();
		var arrC = c.split("=");
		if (arrC[0] == cname) {
			return arrC[1];
		}
	}
	return "";
}

var swiper = new Swiper('.pic .swiper-container', {
	slidesPerView: 3,
	direction: getDirection(),
	navigation: {
		nextEl: '.prev',
		prevEl: '.next',
	},
	on: {
		resize: function() {
			swiper.changeDirection(getDirection());
		}
	}
});

function getDirection() {
	var windowWidth = window.innerWidth;
	var direction = window.innerWidth <= 760 ? 'vertical' : 'horizontal';

	return direction;
}


var swiper = new Swiper('.swiper .swiper-container', {
	slidesPerView: 3,
	direction: getDirection(),
	navigation: {
		nextEl: '.prev_btn',
		prevEl: '.next_btn',
	},
	on: {
		resize: function() {
			swiper.changeDirection(getDirection());
		}
	}
});

function getDirection() {
	var windowWidth = window.innerWidth;
	var direction = window.innerWidth <= 900 ? 'vertical' : 'horizontal';

	return direction;
}



$(".details .arrows").hover(function() {
	$(this).text("︿");
	$(".details .click_buy").css("height", "60px")
}, function() {
	$(this).text("﹀");
	$(".details .click_buy").css("height", "40px")
})

$('.deploy .fix button').click(function() {
	$(this).css('border', '1px solid #ca141d')
	$(this).siblings("button").css('border', '1px solid #e5e5e5')
})
$('.recommend button').click(function() {
	$(this).css('border', "1px solid #e5e5e5")
	$(this).siblings().css('border', "1px solid #e5e5e5")
});
$('.service button').click(function() {
	$(this).css('border', "1px solid #e5e5e5")
	$(this).siblings().css('border', "1px solid #e5e5e5")
});

$('.deploy .capacity button').click(function() {
	var txt = $(this).text().trim()
	console.log(txt)
	if (txt == '8GB+512GB') {
		$('.cost span').text("￥7899.00")
		$('.content .head a span').text("8GB+512GB")
		$('.details .title span').text("8GB+512GB")
	}
	if (txt == '8GB+256GB') {
		$('.cost span').text("￥6899.00")
		$('.content .head span').text("8GB+256GB")
		$('.details .title span').text("8GB+256GB")
	}
	if (txt == '8GB+128GB') {
		$('.cost span').text("￥6399.00")
		$('.content .head span').text("8GB+128GB")
		$('.details .title span').text("8GB+128GB")
	}
})

$('.content .pic .swiper-slide:eq(0) img').hover(function() {
	$('.pic .img_1').attr('src', 'assest/img/sell_detail/ia_100000005945.jpg')
	$(this).css('border', '1px solid #ca141d')
}, function() {
	$(this).css('border', '1px solid white')
})
$('.content .pic .swiper-slide:eq(1) img').hover(function() {
	$('.pic .img_1').attr('src', 'assest/img/sell_detail/images/22.png')
	$(this).css('border', '1px solid #ca141d')
}, function() {
	$(this).css('border', '1px solid white')
})
$('.content .pic .swiper-slide:eq(2) img').hover(function() {
	$('.pic .img_1').attr('src', 'assest/img/sell_detail/images/19.png')
	$(this).css('border', '1px solid #ca141d')
}, function() {
	$(this).css('border', '1px solid white')
})
$('.content .pic .swiper-slide:eq(3) img').hover(function() {
	$('.pic .img_1').attr('src', 'assest/img/sell_detail/images/20.png')
	$(this).css('border', '1px solid #ca141d')
}, function() {
	$(this).css('border', '1px solid white')
})
$('.content .pic .swiper-slide:eq(4) img').hover(function() {
	$('.pic .img_1').attr('src', 'assest/img/sell_detail/images/18.png')
	$(this).css('border', '1px solid #ca141d')
}, function() {
	$(this).css('border', '1px solid white')
})
$('.content .pic .swiper-slide:eq(5) img').hover(function() {
	$('.pic .img_1').attr('src', 'assest/img/sell_detail/images/23.png')
	$(this).css('border', '1px solid #ca141d')
}, function() {
	$(this).css('border', '1px solid white')
})
$('.content .pic .swiper-slide:eq(6) img').hover(function() {
	$('.pic .img_1').attr('src', 'assest/img/sell_detail/images/21.png')
	$(this).css('border', '1px solid #ca141d')
}, function() {
	$(this).css('border', '1px solid white')
})
$('.content .pic .swiper-slide:eq(7) img').hover(function() {
	$('.pic .img_1').attr('src', 'assest/img/sell_detail/images/24.png')
	$(this).css('border', '1px solid #ca141d')
}, function() {
	$(this).css('border', '1px solid white')
})

$('.white button').click(function() {
	$('.white').css('display', 'none')
	$('.rep').css('height', "9490px")
})
$('.block button').click(function() {
	$('.white').css('display', 'block')
	$('.rep').css('height', "1490px")
})
//scrollTop
$(window).scroll(function() {
	//获取scrollTop
	var scrollTop = $(this).scrollTop();
	var hei = $('.rep').css('height');
	var rep = $('.rep').offset().top
	var pic = $('.cut_off_1').offset().top
	var sale = $('.after_sale_1').offset().top
	var num = $('.num').offset().top

	

	//导航动画
	if (scrollTop > pic) {
		$('.nav_1').css({
			position: 'fixed',
			'background-color': 'white',
			width: "100%",
			height: "80px",
			textAlign: 'center',
			top: "0",
			left: "0",
			marginTop: '-24px',
			zIndex: '100',
		})
	} else {
		$('.nav_1').css({
			position: 'relative',
		})
	}
	if (scrollTop < rep && scrollTop > pic) {
		$('.nav_1 .commodity_details').css({
			borderBottom: '1px solid #CA141D',
			color: '#ca141d',
		})
		$('.nav_1 .commodity_details').siblings().css({
			borderBottom: '0',
			color: '#3a3a3a',
		})
	}
	if (scrollTop < sale && scrollTop > rep) {
		$('.nav_1 .parameter').css({
			borderBottom: '1px solid #CA141D',
			padding: '0 10px 5px',
			color: '#ca141d',
		})
		$('.nav_1 .parameter').siblings().css({
			borderBottom: '0',
			color: '#3a3a3a',
		})
	}
	if (scrollTop > sale && scrollTop < num) {
		$('.nav_1 .after_sale').css({
			borderBottom: '1px solid #CA141D',
			padding: '0 10px 5px',
			color: '#ca141d',
		})
		$('.nav_1 .after_sale').siblings().css({
			borderBottom: '0',
			color: '#3a3a3a',
		})
	}
	if (scrollTop > num) {
		$('.nav_1 .comment').css({
			borderBottom: '1px solid #CA141D',
			padding: '0 10px 5px',
			color: '#ca141d',
		})
		$('.nav_1 .comment').siblings().css({
			borderBottom: '0',
			color: '#3a3a3a',
		})
	}

	$('.nav_1 .commodity_details').click(function() {
		$(window).scrollTop(pic + 1)
	})
	$('.nav_1 .parameter').click(function() {
		$(window).scrollTop(rep + 1)
	})

	$('.nav_1 .after_sale').click(function() {
		$(window).scrollTop(sale + 1)
	})
	$('.nav_1 .comment').click(function() {
		$(window).scrollTop(num + 1)
	})

})
$('.navigation_1 li').click(function() {
	var index = $(this).index();
	$(this).css({
		color: '#CA141D',
		padding: '0 10px 5px',
		'border-bottom': '2px solid #CA141D',
	})
	$(this).siblings().css({
		color: '#3a3a3a',
		padding: '0',
		'border-bottom': '0',
	})
	$('.dex').find('.first').eq(index).css('display', 'block');
	$('.dex').find('.first').eq(index).siblings().css('display', 'none');
})

$('.end .add').click(function() {
	var txt = parseInt($('.end .counter').text().trim())
	txt = txt + 1;
	$('.end .counter').text(txt)
	$('.end .subtract').prop('disabled', false);
})
$('.end .subtract').click(function() {
	var txt = parseInt($('.end .counter').text().trim())
	if (txt == 2) {
		$(this).prop('disabled', true);
	} else {
		$(this).prop('disabled', false);
	}
	txt = txt - 1;
	$('.end .counter').text(txt)
})

$('.click_1').click(function() {
	var addprice = parseFloat($('.add_up_to .sum span').text())
	var addnum = parseFloat($('.add_up_to b').text())
	var isCheck = $(this).prop('checked')
	if (isCheck) {
		var one = parseFloat($(this).siblings('b').text())
		var o1 = 1;
		var x = one + addprice;
		var y = o1 + addnum;
		$('.add_up_to .sum span').text(x)
		$('.add_up_to b').text(y)
	} else {
		var one = parseFloat($(this).siblings('b').text())
		var o1 = 1;
		var a = addprice - one;
		var b = addnum - o1;
		$('.add_up_to .sum span').text(a)
		$('.add_up_to b').text(b)
	}
})
$('.click_2').click(function() {
	var addprice = parseFloat($('.add_up_to .sum span').text())
	var addnum = parseFloat($('.add_up_to b').text())
	var isCheck = $(this).prop('checked')
	if (isCheck) {
		var one = parseFloat($(this).siblings('b').text())
		var o1 = 1;
		var x = one + addprice;
		var y = o1 + addnum;
		$('.add_up_to .sum span').text(x)
		$('.add_up_to b').text(y)
	} else {
		var one = parseFloat($(this).siblings('b').text())
		var o1 = 1;
		var a = addprice - one;
		var b = addnum - o1;
		$('.add_up_to .sum span').text(a)
		$('.add_up_to b').text(b)
	}
})
$('.click_3').click(function() {
	var addprice = parseFloat($('.add_up_to .sum span').text())
	var addnum = parseFloat($('.add_up_to b').text())
	var isCheck = $(this).prop('checked')
	if (isCheck) {
		var one = parseFloat($(this).siblings('b').text())
		var o1 = 1;
		var x = one + addprice;
		var y = o1 + addnum;
		$('.add_up_to .sum span').text(x)
		$('.add_up_to b').text(y)
	} else {
		var one = parseFloat($(this).siblings('b').text())
		var o1 = 1;
		var a = addprice - one;
		var b = addnum - o1;
		$('.add_up_to .sum span').text(a)
		$('.add_up_to b').text(b)
	}
})
$('.click_4').click(function() {
	var addprice = parseFloat($('.add_up_to .sum span').text())
	var addnum = parseFloat($('.add_up_to b').text())
	var isCheck = $(this).prop('checked')
	if (isCheck) {
		var one = parseFloat($(this).siblings('b').text())
		var o1 = 1;
		var x = one + addprice;
		var y = o1 + addnum;
		$('.add_up_to .sum span').text(x)
		$('.add_up_to b').text(y)
	} else {
		var one = parseFloat($(this).siblings('b').text())
		var o1 = 1;
		var a = addprice - one;
		var b = addnum - o1;
		$('.add_up_to .sum span').text(a)
		$('.add_up_to b').text(b)
	}
})
$('.click_5').click(function() {
	var addprice = parseFloat($('.add_up_to .sum span').text())
	var addnum = parseFloat($('.add_up_to b').text())
	var isCheck = $(this).prop('checked')
	if (isCheck) {
		var one = parseFloat($(this).siblings('b').text())
		var o1 = 1;
		var x = one + addprice;
		var y = o1 + addnum;
		$('.add_up_to .sum span').text(x)
		$('.add_up_to b').text(y)
	} else {
		var one = parseFloat($(this).siblings('b').text())
		var o1 = 1;
		var a = addprice - one;
		var b = addnum - o1;
		$('.add_up_to .sum span').text(a)
		$('.add_up_to b').text(b)
	}
})
$('.click_6').click(function() {
	var addprice = parseFloat($('.add_up_to .sum span').text())
	var addnum = parseFloat($('.add_up_to b').text())
	var isCheck = $(this).prop('checked')
	if (isCheck) {
		var one = parseFloat($(this).siblings('b').text())
		var o1 = 1;
		var x = one + addprice;
		var y = o1 + addnum;
		$('.add_up_to .sum span').text(x)
		$('.add_up_to b').text(y)
	} else {
		var one = parseFloat($(this).siblings('b').text())
		var o1 = 1;
		var a = addprice - one;
		var b = addnum - o1;
		$('.add_up_to .sum span').text(a)
		$('.add_up_to b').text(b)
	}
})
$('.click_7').click(function() {
	var addprice = parseFloat($('.add_up_to .sum span').text())
	var addnum = parseFloat($('.add_up_to b').text())
	var isCheck = $(this).prop('checked')
	if (isCheck) {
		var one = parseFloat($(this).siblings('b').text())
		var o1 = 1;
		var x = one + addprice;
		var y = o1 + addnum;
		$('.add_up_to .sum span').text(x)
		$('.add_up_to b').text(y)
	} else {
		var one = parseFloat($(this).siblings('b').text())
		var o1 = 1;
		var a = addprice - one;
		var b = addnum - o1;
		$('.add_up_to .sum span').text(a)
		$('.add_up_to b').text(b)
	}
})
$('.click_8').click(function() {
	var addprice = parseFloat($('.add_up_to .sum span').text())
	var addnum = parseFloat($('.add_up_to b').text())
	var isCheck = $(this).prop('checked')
	if (isCheck) {
		var one = parseFloat($(this).siblings('b').text())
		var o1 = 1;
		var x = one + addprice;
		var y = o1 + addnum;
		$('.add_up_to .sum span').text(x)
		$('.add_up_to b').text(y)
	} else {
		var one = parseFloat($(this).siblings('b').text())
		var o1 = 1;
		var a = addprice - one;
		var b = addnum - o1;
		$('.add_up_to .sum span').text(a)
		$('.add_up_to b').text(b)
	}
})

$('.right_nav .cart').click(function() {
	$(location).attr('href', 'cart.html')
})

$('.end .cart').click(function() {
	if(userid!=""){
		layer.confirm(commname+'成功加入购物车!', {
		btn: ['在逛逛', '去结算'] //按钮
	}, function() {
		var url=ctx+"cart/addcart";
		var num = $('.end .counter').text();
		if(count<num){
			layer.alert("抱歉，您选择的商品数量超出库存，请核对后选择！");
		}else{
		$.post(url,{
			"commid":commid,
			"commname":commname,
			"commcount":num
		},function(resp){
			if(resp.success){
				layer.msg('好的', {
					icon: 1
				});
			}
		},"json");
		}
	}, function() {
	var num = $('.end .counter').text()
	if(count<num){
		layer.alert("抱歉，您选择的商品数量超出库存，请核对后选择！");
	}else{
		$(".commcount").attr("value",num);
		$(".commname").attr("value",commname);
		$(".commid").attr("value",commid);
		$(".submit").submit();
		}
	});
	}else{
	var delall=layer.confirm("您还未登入，请您先登入！",function(){
				$(".submit").submit();
				layer.close(delall);
			});
	}
});
$('.pay').click(function() {
	if(userid!=""){
	var count=counter.text();
	var price=money*count;
	$(this).next().find(".commid").attr("value",commid);
	$("input[name='userid']").attr("value",userid);
	$("input[name='count']").attr("value",count);
	$("input[name='price']").attr("value",price);
	$(".ordersubmit").submit();
	}else{
	var delall=layer.confirm("您还未登入，请您先登入！",function(){
				$(".submit").submit();
				layer.close(delall);
			});
	}
	
	
})
