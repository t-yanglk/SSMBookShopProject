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
			}
		}
		$("#pageno").val(pageno);
		$("#pagesize").val(pagesize);
		//提交表单
		$(".form").submit();
		
	});
	//刷新表格
	$(".renovate").click(function(){
		$(".cataid").attr("value","");
		$(".cataname").attr("value","");
		$(".depth").attr("value","");
		$(".select").submit();
	});
	//全选操作
	$(".checkall").click(function(){
		var flax=$(this).prop("checked");
		$(".check").prop("checked",flax);
	});
	//批量删除操作
	$(".delcheck").click(function(){
		var url=ctx+"/catalogue/delcheck";
		var checks=$(".check:checked");
		var checkid=[];
		if(checks.length==0){
			layer.alert("请选中想要删除的数据！");
		}else{
		var delall=layer.confirm("确定全部删除吗！",function(){
				checks.each(function(index,item){
					checkid.push($(item).parent().next().text());
				});
				var cataids=checkid.join(",");
			$.post(url,{
				"cataids":cataids
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
	//单个删除操作
	$(".delete").click(function(){
		var url=ctx+"/catalogue/deletecata";
		var me=$(this).parent().parent();
		var id=me.find(".select").text()
		var del=layer.confirm("确定要删除该分类吗？",function(){
			$.post(url,{
				"cataid":id
			},function(resp){
				if(resp.success){
					me.remove();
					layer.close(del);
				}
			},"json");
		});
	});
	//增加类别
	$(".addcheck").click(function(){
		var checks=$(".check:checked");
		if(checks.length>1){
			layer.alert("只能根据一条数据进行添加！");
		}else if(checks.length==0){
		var depth="0";
		var preid="";
			$(".addcata").append("<input type='hidden' name='depth' value='"+depth+"'>");
			$(".addcata").append("<input type='hidden' name='preid' value='"+preid+"'>");
			$(".addcata").submit();
		}else{
			var check=checks[0];
			var depth=$(check).parent().next().next().next().next().text();
			var preid=$(check).parent().next().html();
			$(".addcata").append("<input type='hidden' name='depth' value='"+depth+"'>");
			$(".addcata").append("<input type='hidden' name='preid' value='"+preid+"'>");
			$(".addcata").submit();
		}
	});
	//对数据进行修改
	$(".updatecheck").click(function(){
		var checks=$(".check:checked");
		if(checks.length>1){
			layer.alert("只能根据一条数据进行修改！");
		}else if(checks.length==0){
			layer.alert("请选择您要修改的数据！");
		}else{
			var check=checks[0];
			var cataid=$(check).parent().next().text();
			$(".updatecata").append("<input type='hidden' name='cataid' value='"+cataid+"'>");
			$(".updatecata").submit();
		}
	});
	
});