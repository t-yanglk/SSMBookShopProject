// 查看全部商品的定位框的动画
$('.logo_nav .logo_left .all').hover(function() {
	$(this).children('.banner').css('display', 'block');
}, function() {
	$(this).children('.banner').css('display', 'none');
})

//  筛选事件
var price_level;
var flag;
$('.Sizer .price_level label').on('click', 'input', function() {
	flag = $(this).prop('checked');
	var value = $(this).val();
	$('.sell_list li').css('display', 'none');
	if (flag) {
		$(this).parent('label').siblings().children('input').prop('checked', false);
		// console.log(value);
		$('.sell_list .item .text .num b').each(function() {
			price_level = $(this).text();
			price_level = parseFloat(price_level);
			console.log(price_level);
			if (value == 499 && price_level <= 499) {
				$(this).parents('li').css('display', 'block');
			}
			if (value == 999 && price_level <= 999 && price_level >= 500) {
				$(this).parents('li').css('display', 'block');
			}
			if (value == 1999 && price_level <= 1999 && price_level >= 1000) {
				$(this).parents('li').css('display', 'block');
			}
			if (value == 2999 && price_level >= 2000 && price_level <= 2999) {
				$(this).parents('li').css('display', 'block');
			}
			if (value == 3000 && price_level >= 3000) {
				$(this).parents('li').css('display', 'block');
			}
		})
	} else {
		$('.sell_list li').css('display', 'block');
	}
})

// 排序
var flag1 = true;
$('.Sizer .primary .sort').click(function() {
	var arr = [];
	$('.sell_list li').each(function() {
		arr.push($(this));
	});
	if (flag) {
		//正序
		arr.sort(function($itemA, $itemB) {
			var priceA = $itemA.find('.num b').text();
			var priceB = $itemB.find('.num b').text();
			return priceA - priceB;
		})
		$(this).children('.high').css('display','none');
		$(this).children('.low').css('display','inline-block');
		flag = false;
	}else {
		//倒序
		arr.sort(function($itemA, $itemB) {
			var priceA = $itemA.find('.num b').text();
			var priceB = $itemB.find('.num b').text();
			return priceB - priceA;
		})
		$(this).children('.high').css('display','inline-block');
		$(this).children('.low').css('display','none');
		flag = true;
	}
	arr.forEach(function(item, index) {
		$('.sell_list ul').append(item);
	})
	console.log(arr);
});
