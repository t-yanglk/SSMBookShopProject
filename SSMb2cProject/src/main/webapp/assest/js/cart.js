//点击加号并且选中时价格数量都要变
$('.add').click(function() {
	var x = parseFloat($(this).siblings('span').text().trim());
	var y = $(this).parents('.ul').find('.goods-price span').text();
	var txt = x + 1;
	var z = txt * y;
	$(this).siblings('span').text(txt)
	$(this).parents('.ul').find('.goods-price-total').text(z)
	var isCheck = $(this).parents(".goods-list").find('.check').prop('checked');
	if (isCheck) {
		var check = parseInt($('.order-total-price p').find('span').text())+parseInt(y);
		var othernum=parseInt($('.total-choose').find('em').text())-parseInt(txt)+1;
		var first = parseInt(txt)+othernum;
	} else {
		var check = parseInt($('.order-total-price p').find('span').text())
		var first = parseInt($('.total-choose').find('em').text())
	}
	var index = first;
	var ott = check;
	$('.order-total-price p').find('span').text(ott)
	$('.total-choose').find('em').text(index)
	var url=ctx+"cart/addGoodsCount"
	var commid=$(this).parents(".goods").find(".commid").val();
	$.post(url,{
		"count":x,
		"userid":userid,
		"commid":commid
	},function(resp){
		if(!resp.success){
			layer.alert("添加失败！");
		}
	},"json")
	
});
//点击减号并且选中时价格数量都要变
$('.subtract').click(function() {
	var x = parseFloat($(this).siblings('span').text().trim());
	var y = $(this).parents('.ul').find('.goods-price span').text();
	var txt = x - 1;
	if (txt <= 0) {
		txt = 1
		return;
	}
	var z = txt * y;
	$(this).siblings('span').text(txt)
	$(this).parents('.ul').find('.goods-price-total').text(z)
	var isCheck = $(this).parents(".goods-list").find('.check').prop('checked');
	if (isCheck) {
		var check = parseInt($('.order-total-price p').find('span').text())-parseInt(y);
		var othernum=parseInt($('.total-choose').find('em').text())-parseInt(txt)-1;
		var first = parseInt(txt)+othernum;
	} else {
		var check = parseInt($('.order-total-price p').find('span').text())
		var first = parseInt($('.total-choose').find('em').text())
	}
	var index = first;
	var ott = check;
	$('.order-total-price p').find('span').text(ott)
	$('.total-choose').find('em').text(index)
	var url=ctx+"cart/reduceGoodsCount"
	var commid=$(this).parents(".goods").find(".commid").val();
	$.post(url,{
		"count":x,
		"userid":userid,
		"commid":commid
	},function(resp){
		if(!resp.success){
			layer.alert("减少失败！");
		}
	},"json")
})
//点击单个事件时价格和数量都要变
$('.check').click(function() {
	var isCheck = $(this).prop('checked');
	if (isCheck) {
		var check = parseInt($(this).parent('.checkbox').siblings().find('.goods-price-total').text())+parseInt($('.order-total-price p').find('span').text());
		var count = parseInt($(this).parent('.checkbox').siblings().find('.goods-1 span').text())+parseInt($('.total-choose').find('em').text());
	} else {
		var check = parseInt($('.order-total-price p').find('span').text())-parseInt($(this).parent('.checkbox').siblings().find('.goods-price-total').text());
		var count = parseInt($('.total-choose').find('em').text())-parseInt($(this).parent('.checkbox').siblings().find('.goods-1 span').text());
	}
	var index = count;
	var ott = check;
	$('.order-total-price p').find('span').text(ott)
	$('.total-choose').find('em').text(index)
})
//对单个用户商品进行删除
$('.cart-list').on('click', '.goods-del', function() {
	var url=ctx+"cart/cartdel";
	var del=$(this).parents(".goods");
	var delcheck=$(this).parents(".delcheck");
	var delall=layer.confirm("确定要将选中的商品从购物车中移除吗？",function(){
			var commid=delcheck.prev().val();
			$.post(url,{
				"userid":userid,
				"commid":commid
			},function(resp){
				if(resp.success){
					del.remove();
					layer.close(delall);
					};
			},"json");
		});
});
//获取全选操作
$('.checkAll').click(function() {
	//获取自身的checked状态并修改单价和商品数量
	var isCheckAll = $(this).prop('checked');
	$(".check").prop("checked",isCheckAll);
	$(".checkAll").prop("checked",isCheckAll);
	if(isCheckAll){
	var checks=$(".check:checked");
	var totalprice=0;
	var totalnum=0;
	checks.each(function(index,item){
		var price=parseInt($(item).parents().siblings(".goods-area").find(".goods-price-total").text());
		var num=parseInt($(item).parents().siblings(".goods-area").find(".add").next().text());
		totalprice+=price;
		totalnum+=num;
	});
	$('.order-total-price p').find('span').text(totalprice);
	$('.total-choose').find('em').text(totalnum);
	}else{
		$('.order-total-price p').find('span').text(0);
		$('.total-choose').find('em').text(0);
	}
});
//全部选中删除
$(".delallcomms").click(function(){
	var checks=$(".check:checked");
	var commids=[];
	checks.each(function(index,item){
		var commid=$(item).parents().next().find(".commid").val();
		commids.push(commid);
	})
	commids=commids.join(",");
	if(checks.length!=0){
	var url=ctx+"cart/cartdelall";
	var delcheck=$(this).parents(".delcheck");
	var delall=layer.confirm("确定要将选中的商品从购物车中移除吗？",function(){
		$.post(url,{
		"userid":userid,
		"commids":commids
		},function(resp){
			if(resp.success){
				$(".check:checked").parents(".goods").remove();
				layer.close(delall);
			}
		},"json");
		});
	}else{
		layer.alert("请选中要删除的商品！");
	}
});
//全选--反方向 项目选中/取消=>全选状态
$('.child-check').click(function() {
	//获取checkbox的总数
	var all = $('.child-check').length;
	//已经选中的数量
	var checked = $('.child-check:checked').length;
	$('.checkAll').prop('checked', checked == all);
})
//立即结算提交订单
$(".order-total-btn").click(function(){
	var checks=$(".check:checked");
	if(checks.length!=0){
		if(checks.length!=1){
			layer.alert("一次只能结算一件商品！");
		}else{
			var commid=$(checks[0]).parents().next().find(".commid").val();
			var price=$(checks[0]).parents().next().find(".goods-price-total").html();
			var count=$(checks[0]).parents().next().find(".num").html();
			$("input[name='userid']").attr("value",userid);
			$("input[name='commid']").attr("value",commid);
			$("input[name='price']").attr("value",price);
			$("input[name='count']").attr("value",count);
			$(".submitcart").submit();
		}
		
	}else{
		layer.alert("请选中要加入订单的商品！");
	}
	
});

$('.arr_1 input').click(function() {
	var isCheck = $(this).prop('checked')
	if (isCheck) {
		$(this).parent().css('display', 'none')
		$(this).parent().siblings('.list_1').css('display', 'block')
		$(this).parent().siblings('.list_2').css('display', 'none')
		$(this).parent().siblings('.list_3').css('display', 'none')
		$(this).parent().siblings('.arr_2').css('display', 'block')
		$(this).parent().siblings('.arr_3').css('display', 'block')
	}
})
$('.arr_2 input').click(function() {
	var isCheck = $(this).prop('checked')
	if (isCheck) {
		$(this).parent().css('display', 'none')
		$(this).parent().siblings('.list_2').css('display', 'block')
		$(this).parent().siblings('.list_1').css('display', 'none')
		$(this).parent().siblings('.list_3').css('display', 'none')
		$(this).parent().siblings('.arr_1').css('display', 'block')
		$(this).parent().siblings('.arr_3').css('display', 'block')
	}
})
$('.arr_3 input').click(function() {
	var isCheck = $(this).prop('checked')
	if (isCheck) {
		$(this).parent().css('display', 'none')
		$(this).parent().siblings('.list_3').css('display', 'block')
		$(this).parent().siblings('.list_1').css('display', 'none')
		$(this).parent().siblings('.list_2').css('display', 'none')
		$(this).parent().siblings('.arr_1').css('display', 'block')
		$(this).parent().siblings('.arr_2').css('display', 'block')
	}
})
$('.arr_label').on('click', '.care_del', function() {
	$(this).parents('.label_1').css('display', 'none')
	$(this).parents('.label_1').siblings('.arr_list').css('display', 'inline-block')
})
