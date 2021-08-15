$('.register_title').click(function () {
	var index=$(this).index();
	$('.register_content').css('display','none');
	$('.register_content').eq(index).css('display','inline-block');
	$(this).siblings().css('color','black');
	$(this).css('color','red');
})
  /* 验证码刷新 */
    $("#checkcode").click(function () {
        var date = new Date();
        $("#checkcode").attr("src", "user/aptcha?d=" + date);
        $("#verifyCode").val(null);
    });
$('.form').Validform({
			tiptype:function (msg,o,cssctl) {
				//o.obj正在验证的元素(表单)
				//错误信息提示对象;
				var $tip=o.obj.parent().parent().next('.error-tip');
				//展示信息
				// cssctl($tip,o.type);
				//修改提示信息
				$tip.text(msg);
				if(o.type==3){
					$tip.fadeIn();
				}else{
					$tip.fadeOut();
				}
				
			}
});
$('.QR').mouseenter(function () {
	$(this).siblings('img').stop(true).show();
})
$('.QR').mouseleave(function () {
	$(this).siblings('img').stop(true).hide();
})
  