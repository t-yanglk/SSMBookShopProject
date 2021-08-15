//关闭添加地址框
$("#address-box").click(function() {
	window.parent.layer.closeAll();
});
//打开添加框
$(".address-box").click(function() {
	// $(".address-cover").stop(true).fadeIn();
	layer.open({
		type: 1,
		area: '600px',
		content: $('.address-cover'), //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
	});
});

//取消
$(".remove-btn").click(function() {
	$(".address-cover").stop(true).fadeOut();
});


//保存
 $(".keep-btn").click(function() {
 	var province=$(".province").val();
 	var city=$(".city").val();
 	var district=$(".district").val();
 	var address=province+city+district;
 	$(this).parents(".address-cover").parent().parent().prev().find(".keep-address").text(address);
 });
$('.form').Validform({
	tiptype: function(msg, o, cssctl) {
		//o.obj正在验证的元素(表单)
		//错误信息提示对象;
		var $tip = o.obj.next('.error-tip');
		//展示信息
		// cssctl($tip,o.type);
		//修改提示信息
		$tip.text(msg);
		if (o.type == 3) {
			$tip.fadeIn();
		} else {
			$tip.fadeOut();
		}
	},
	beforeSubmit: function(curform) {
		layer.closeAll();
		return false;
	}
});

//提交购买订单
$(".submission-btn").click(function(){
	var delall=layer.confirm("是否确定提交订单？",function(){
		
		address=address.text();
		$("input[name='address']").attr("value",address);
		$(".submit").submit();
		});
});

//提交借阅图书订单
$(".subcribe-btn").click(function(){
	var delall=layer.confirm("是否确定借阅图书？",function(){
		address=address.text();
		$("input[name='address']").attr("value",address);
		$(".submit").attr("action","order/subcribe");
		$(".submit").submit();
		});
});

// 删除
$('.address-section').on('click', '.delet', function() {
	$(this).parents('.keep-box').remove()
})
$('.address-section').on('click', '.keep-box', function() {
	$(this).siblings('.keep-box').css('border', '1px solid gray')
	$(this).find('.tacit').css('display', "none");

	$(this).css("border", "1px solid red");
	$(this).find('.tacit').css('display', "block");

})


	
	
