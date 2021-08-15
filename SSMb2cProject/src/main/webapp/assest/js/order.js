$('.designation_fr li').click(function () {
	var index=$(this).index();
	$(' .main_ul li').css("display",'none');
	$(' .main_ul li').eq(index).css('display','inline-block');
})
$('.main_one_title').click(function () {
	var index=$(this).index();
	$(' .main_one_content').css("display",'none');
	$(' .main_one_content').eq(index).css('display','inline-block');
	 $('.main_one_title').css('background-color','rgb(245,245,245)');
	$('.main_one_title').eq(index) .css('background-color','black');
	$('.main_one_title').css('color','black');
	$('.main_one_title').eq(index) .css('color','white')
})
//查看全部订单
$(".all").click(function(){
$(".name").attr("value","all");
$(".submit").submit();
});
//查看代付款订单
$(".afford").click(function(){
$(".name").attr("value","afford");
$(".submit").submit();
});
//查看已完成订单
$(".finish").click(function(){
$(".name").attr("value","finish");
$(".submit").submit();
});
//查看已取消订单
$(".exit").click(function(){
$(".name").attr("value","exit");
$(".submit").submit();
});
$('.del').click(function () {
var me=$(this);
var delall=layer.confirm("确定要删除该订单吗！",function(){
			var url=ctx+"/order/delorder";
			var orderid=$(me).next().next().next().val();
			$.post(url,{
				"orderid":orderid
			},function(resp){
				if(resp.success){
					$(me).parents('.list-group-item').remove();
					layer.close(delall);
					layer.alert("删除成功！");
				}else{
					layer.alert("删除失败，订单还未支付或者借阅未归还!");
				}
			},"json");
		});
});

//图书退货操作
$(".return").click(function(){
	var me=$(this);
	var delall=layer.confirm("确定要进行退货吗！",function(){
			var url=ctx+"/order/returnbook";
			var orderid=$(me).next().val();
			$.post(url,{
				"orderid":orderid
			},function(resp){
				if(resp.success){
					$(me).parents('.list-group-item').remove();
					layer.close(delall);
					layer.alert("退货成功！");
					}
			},"json");
		});
});
//图书归还操作
$(".bookreturn").click(function(){
	var me=$(this);
	var delall=layer.confirm("确定要将图书归还吗?",function(){
			var url=ctx+"/order/bookreturn";
			var orderid=$(me).prev().val();
			$.post(url,{
				"orderid":orderid
			},function(resp){
				if(resp.success){
					$(me).parents().prev().prev().text("是");
					layer.close(delall);
					layer.alert("归还成功！");
					}
			},"json");
		});
});
