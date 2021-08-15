$('.tab_title li').click(function() {
	var index = $(this).index();
	console.log(index);
	$('.tab_content li').css("display", 'none')
	$('.tab_content li').eq(index).css("display", 'inline-block')
})
//更换名称
$('.change_uname').click(function() {
	$('.pop_uname').css("display", 'inline-block');
	$('.uname_input').val($('.number').text());
})
// 名称取消
$('.cancel_uname').click(function() {
	$('.pop_phone').css("display", 'none')
	$('.phone_input').val('');
	$('.phone_mistake').css('display', 'none');
})
//更换手机号
$('.change_phone').click(function() {
	$('.pop_phone').css("display", 'inline-block');
	$('.phone_input').val($('.number').text());

})
// 手机号-取消
$('.cancel_phone').click(function() {
	$('.pop_phone').css("display", 'none')
	$('.phone_input').val('');
	$('.phone_mistake').css('display', 'none');
})
//验证手机号
var flag = false;
$('.phone_input').change(function() {
	var txt = $(this).val().trim();
	var reg = /^1(3|4|5|6|7|8|9)\d{9}$/
	var isValid = reg.test(txt);
	if (isValid) {
		$('.phone_mistake').css('display', 'none');
		flag = true;
	} else {
		$('.phone_mistake').css('display', 'inline-block');
	}
})
//手机号-确定
$('.confirm_phone').click(function() {
	if (flag) {
		var val = $('.phone_input').val().trim();
		$('.pop_phone').css("display", 'none')
		$('.number').text(val);
		$('.phone_input').val('');
		flag = false;
	}
})
//改变余额
$('.change_email').click(function() {
	$('.pop_email').css("display", 'inline-block');
		$('.email_input').val($('.email_number').text());

})
//余额取消
$('.cancel_email').click(function() {
	$('.pop_email').css("display", 'none')
	$('.email_input').val('');
	$('.email_mistake').css('display', 'none');
})
//验证余额
var flag1 = false;
$('.email_input').change(function() {
	var txt = $(this).val().trim();
	var isValid = reg.test(txt);
	if (isValid) {
		$('.email_mistake').css('display', 'none');
		flag1 = true;
	} else {
		$('.email_mistake').css('display', 'inline-block');
	}
})
//邮箱-确定
$('.confirm_email').click(function() {
	if (flag1) {
		var val = $('.email_input').val().trim();
		$('.pop_email').css("display", 'none')
		$('.email_number').text(val);
		$('.email_input').val('');
		flag1 = false;
	}
})
//更換名字
$('.massage_name').click(function() {
	$('.pop_nickname').css('display', 'inline-block');
	$('.nickname_input').val($('.nickname_name').text());
})
// 取消
$('.cancel_nickname').click(function() {
	console.log(1);
	$('.pop_nickname').css("display", 'none');
	$('.nickname_input').val(" ");
})
//確定
$('.confirm_nickname').click(function() {
	var val = $('.nickname_input').val().trim();
	$('.nickname_name').text(val);

	$('.pop_nickname').css("display", 'none');

})
$('.massage_huawei').click(function() {
	$('.pop_huawei').css('display', 'inline-block');
	$('.huawei_input').val($('.huawei_name').text());
})
// 取消
$('.cancel_huawei').click(function() {
	$('.pop_huawei').css("display", 'none');
	$('.huawei_input').val(" ");
})
//確定
$('.confirm_huawei').click(function() {
	var val = $('.huawei_input').val().trim();
	$('.huawei_name').text(val);
	$('.pop_huawei').css("display", 'none');

})
$('.massage_gender').click(function() {
	$('.pop_gender').css('display', 'inline-block');
})

// 点击 性别
$('.confirm_gender').click(function() {
	$('.pop_gender').css('display', 'none');


})
//确定
$('.gender_input').click(function() {
	var gender = $(this).prop('value');
	$('.gender_name').text(gender);
})
//姓名-点击
$('.massage_compellation').click(function() {
	$('.pop_compellation').css('display', 'inline-block');
	$('.compellation_input').val($('.name_compellation').text());
	
})
// 姓名-取消
$('.cancel_compellation').click(function() {
	$('.pop_compellation').css("display", 'none')
	$('.compellation_mistake').css('display', 'none');
})
//验证姓名
var flag_name = false;
$('.compellation_input').change(function() {
	var txt = $(this).val().trim();
	var reg = /^[\u4E00-\u9FA5A-Za-z]+$/;
	var isValid = reg.test(txt);
	if (isValid) {
		flag_name = true;
		$('.compellation_mistake').css('display', 'none');
	} else {
		$('.compellation_mistake').css('display', 'inline-block');
	}
})
//姓名-确定
$('.confirm_compellation').click(function() {
	if (flag_name) {
		console.log(111)
		var val = $('.compellation_input').val().trim();
		$('.pop_compellation').css("display", 'none')
		$('.name_compellation').text(val);
		flag_name = false;
	}
})
$("#distpicker2").distpicker({
	province: "---- 所在省 ----",
	city: "---- 所在市 ----",
	district: "---- 所在区 ----"
});
$('.arrow_show').click(function () {
	$('.notification_content').css('display','inline-block')
	$(this).css("display",'none');
	$('.arrow_hidden').css('display','inline-block')
})
$('.arrow_hidden').click(function () {
	$('.notification_content').css('display','none');
	$(this).css("display",'none');
	$('.arrow_show').css('display','inline-block')
})
