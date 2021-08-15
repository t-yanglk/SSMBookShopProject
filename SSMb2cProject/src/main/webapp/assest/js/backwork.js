$(function(){
	//分页操作
	$(".p").each(function(idx,item){
	if($(item).text()==page){
		$(item).attr("style","background-color:#FF5722;color:white");
	}
	});
	$(".ul>.functionli").click(function(){
		var pageno=1;
		var pagesize=10;
		var $me=$(this).index();
		switch($me){
			case 0:{
				//首页
				pageno=1;
				break;
			}
			case 1:{
				//上一页
				if(page==1){
				    pageno=page;
					break;
				}
				pageno=page-1;
				break;
			}
			case (3+navigate):{
				//跳转
				var a=$("#input").val();
				if(a<=maxpage&&a>0&&a!=null){
					pageno=a;
					break;
				}else{
					pageno=page;
				}
				break;
			}
			case (4+navigate):{
				//下一页
				if(page!=maxpage){
					pageno=page+1;
				}else{
					pageno=maxpage;
				}
				break;
			}
			case (5+navigate):{
				//尾页
				pageno=maxpage;
				break;
			}
			default:{
				//具体页码
				if(page>=5){
					pageno=page-4+parseInt($me);
				}else{
					pageno=parseInt($me)-1;
				}
				break;
			}
		}
		$("#pageno").val(pageno);
		$("#pagesize").val(pagesize);
		//提交表单
		$(".form").submit();
		
	});
	//刷新商品表格
	$(".renovatecomm").click(function(){
		$("input[name='commid']").attr("value","");
		$("input[name='commname']").attr("value","");
		$("input[name='commprice']").attr("value","");
		$("input[name='preid']").attr("value","");
		$(".select").submit();
	});
	//刷新购物车表格
	$(".renovatecart").click(function(){
		$("input[name='userid']").attr("value","");
		$("input[name='uname']").attr("value","");
		$("input[name='commid']").attr("value","");
		$("input[name='commname']").attr("value","");
		$(".select").submit();
	});
	//刷新订单表格
	$(".renovateorder").click(function(){
		$("input[name='orderid']").attr("value","");
		$("input[name='uname']").attr("value","");
		$("input[name='commname']").attr("value","");
		$("input[name='orderstate']").attr("value","");
		$(".select").submit();
	});
	//刷新用户表格
	$(".renovateuser").click(function(){
		$("input[name='userid']").attr("value","");
		$("input[name='uname']").attr("value","");
		$("input[name='phone']").attr("value","");
		$(".select").submit();
	});
	//刷新管理员表格
	$(".renovateadmin").click(function(){
		$("input[name='adminid']").attr("value","");
		$("input[name='aname']").attr("value","");
		$("input[name='phone']").attr("value","");
		$(".select").submit();
	});
	//全选操作
	$(".checkall").click(function(){
		var flax=$(this).prop("checked");
		$(".check").prop("checked",flax);
	});
	//批量删除商品操作
	$(".delcheckcomm").click(function(){
		var url=ctx+"/commodity/delcheck";
		var checks=$(".check:checked");
		var checkid=[];
		if(checks.length==0){
			layer.alert("请选中想要删除的图书！");
		}else{
		var delall=layer.confirm("确定全部删除图书吗！",function(){
				checks.each(function(index,item){
					checkid.push($(item).parent().next().text());
				});
				var checkids=checkid.join(",");
			$.post(url,{
				"checkids":checkids
			},function(resp){
				if(resp.success){
					checks.each(function(index,item){
					$(item).parent().parent().remove();
					layer.close(delall);
					});
				}
			},"json");
		});
		}
	});
	//批量删除购物车操作
	$(".delcheckcart").click(function(){
		var url=ctx+"/cart/delcheckcart";
		var checks=$(".check:checked");
		var userid=[];
		var commid=[];
		if(checks.length==0){
			layer.alert("请选中想要删除的购物车商品！");
		}else{
		var delall=layer.confirm("确定全部删除选中的购物车中的商品吗！",function(){
				checks.each(function(index,item){
		 			userid.push($(item).parent().next().text());
					commid.push($(item).parent().next().next().next().text());
				});
				var userids=userid.join(",");
				var commids=commid.join(",");
			$.post(url,{
				"userids":userids,
				"commids":commids
			},function(resp){
				if(resp.success){
					checks.each(function(index,item){
					$(item).parent().parent().remove();
					layer.close(delall);
					});
				}
			},"json");
		});
		}
	});
	//批量删除订单操作
	$(".delcheckorder").click(function(){
		var url=ctx+"/order/delcheckorder";
		var checks=$(".check:checked");
		var orderid=[];
		if(checks.length==0){
			layer.alert("请选中想要删除的订单！");
		}else{
		var delall=layer.confirm("确定全部删除选中的订单吗！",function(){
				checks.each(function(index,item){
		 			orderid.push($(item).parent().next().text());
				});
				orderid=orderid.join(",");
			$.post(url,{
				"orderid":orderid
			},function(resp){
				if(resp.success){
					checks.each(function(index,item){
					$(item).parent().parent().remove();
					layer.close(delall);
					});
				}else{
					alert("删除失败，有未支付的订单");
					layer.close(del);
				}
			},"json");
		});
		}
	});
	//批量删除用户操作
	$(".delcheckuser").click(function(){
		var url=ctx+"/user/delcheckuser";
		var checks=$(".check:checked");
		var userid=[];
		if(checks.length==0){
			layer.alert("请选中想要删除的用户！");
		}else{
		var delall=layer.confirm("确定全部删除选中的用户吗！",function(){
				checks.each(function(index,item){
		 			userid.push($(item).parent().next().text());
				});
				userid=userid.join(",");
			$.post(url,{
				"userid":userid
			},function(resp){
				if(resp.success){
					checks.each(function(index,item){
					$(item).parent().parent().remove();
					layer.close(delall);
					});
				}
			},"json");
		});
		}
	});
	//批量删除管理员操作
	$(".delcheckadmin").click(function(){
		var url=ctx+"/admin/delcheckadmin";
		var checks=$(".check:checked");
		var adminid=[];
		if(checks.length==0){
			layer.alert("请选中想要删除的用户！");
		}else{
		var delall=layer.confirm("确定全部删除选中的用户吗！",function(){
				checks.each(function(index,item){
		 			adminid.push($(item).parent().next().text());
				});
				adminid=adminid.join(",");
			$.post(url,{
				"ids":adminid
			},function(resp){
				if(resp.success){
					checks.each(function(index,item){
					$(item).parent().parent().remove();
					layer.close(delall);
					});
				}
			},"json");
		});
		}
	});
	//单个删除商品操作
	$(".deletecomm").click(function(){
		var url=ctx+"/commodity/deletecomm";
		var me=$(this).parent().parent();
		var id=me.find(".select").text()
		var del=layer.confirm("确定要删除该商品吗？",function(){
			$.post(url,{
				"id":id
			},function(resp){
				if(resp.success){
					me.remove();
					layer.close(del);
				}
			},"json");
		});
	});
	//单个删除购物车操作
	$(".deletecart").click(function(){
		var url=ctx+"/cart/cartdelajax";
		var me=$(this).parent().parent();
		var userid=me.find(".select").text()
		var commid=me.find(".select").next().next().text();
		var del=layer.confirm("确定要将该商品从购物车中删除吗？",function(){
			$.post(url,{
				"userid":userid,
				"commid":commid
			},function(resp){
				if(resp.success){
					me.remove();
					layer.close(del);
				}
			},"json");
		});
	});
	//单个删除订单操作
	$(".deleteorder").click(function(){
		var url=ctx+"/order/orderdelajax";
		var me=$(this).parent().parent();
		var orderid=me.find(".select").text()
		var del=layer.confirm("确定要将该订单删除吗？",function(){
			$.post(url,{
				"orderid":orderid,
			},function(resp){
				if(resp.success){
					me.remove();
					layer.close(del);
				}else{
					alert("删除失败，该订单未支付！");
					layer.close(del);
				}
			},"json");
		});
	});
	//单个删除用户操作
	$(".deleteuser").click(function(){
		var url=ctx+"/user/deluser";
		var me=$(this).parent().parent();
		var userid=me.find(".select").text()
		var del=layer.confirm("确定要将该用户删除吗？",function(){
			$.post(url,{
				"userid":userid,
			},function(resp){
				if(resp.success){
					me.remove();
					layer.close(del);
				}
			},"json");
		});
	});
	//单个删除管理员操作
	$(".deleteadmin").click(function(){
		var url=ctx+"/admin/deladmin";
		var me=$(this).parent().parent();
		var adminid=me.find(".select").text()
		var del=layer.confirm("确定要将该管理员删除吗？",function(){
			$.post(url,{
				"adminid":adminid,
			},function(resp){
				if(resp.success){
					me.remove();
					layer.close(del);
				}
			},"json");
		});
	});
	//增加及多图片上传操作
	$(".addcheck").click(function(){
		var checks=$(".check:checked");
		if(checks.length>1){
			layer.alert("只能根据一条数据进行添加！");
		}else if(checks.length==0){
			$(".addcomm").submit();
		}else{
			var check=checks[0];
			var preid=$(check).parent().next().next().next().next().next().next().text();
			var rootid=$(check).parent().next().next().next().next().next().text();
			$(".addcomm").append("<input type='hidden' name='preid' value='"+preid+"'>");
			$(".addcomm").append("<input type='hidden' name='rootid' value='"+rootid+"'>");
			$(".addcomm").submit();
		}
	});
	//对商品数据进行修改
	$(".updatecheck").click(function(){
		var checks=$(".check:checked");
		if(checks.length>1){
			layer.alert("只能根据一条数据进行修改！");
		}else if(checks.length==0){
			layer.alert("请选择您要修改的数据！");
		}else{
			var check=checks[0];
			var commid=$(check).parent().next().text();
			$(".updatecomm").append("<input type='hidden' name='commid' value='"+commid+"'>");
			$(".updatecomm").submit();
		}
	});
	
	//对用户资金进行修改
	$(".payforcheck").click(function(){
		var checks=$(".check:checked");
		if(checks.length>1){
			layer.alert("一次只能修改一位用户的资金！");
		}else if(checks.length==0){
			layer.alert("请选择您要修改的用户！");
		}else{
			var check=checks[0];
			var userid=$(check).parent().next().text();
			$(".payformoney").append("<input type='hidden' name='userid' value='"+userid+"'>");
			$(".payformoney").submit();
		}
	});
	
});