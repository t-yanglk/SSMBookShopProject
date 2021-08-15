$('.skip').click(function () {
	var  index=$(this).index();
	$('.content').css('display','none');
	$(' .content').eq(index).css('display','inline-block');
	$('.skip button').css('background-color',' #CCC');
	$(' .skip button').eq(index).css('background-color','red');
})
var flagx=false;
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


$('form').submit(function () {

	return  true;
	
})