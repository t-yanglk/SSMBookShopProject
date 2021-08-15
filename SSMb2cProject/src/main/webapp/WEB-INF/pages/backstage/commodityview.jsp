<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<base href="${ctx}/">
<meta charset="UTF-8">
<title>浏览量汇总</title>
<link rel="stylesheet" type="text/css" href="assest/lib/validform_5.3.2/css/style.css" />
<link rel="stylesheet" type="text/css" href="assest/css/reset.css" />
<link rel="stylesheet" href="assest/css/layui.css" media="all">
<link href="assest/css/layui.mobile.css" />
<style type="text/css">
body,html{
width: 100%;
height: 100%;
}
.cataname{
width: 300px !important;
font-size: 20px;
font-family: 幼圆;
font-weight: bold;
color: gray;
}
.cata{
width: 620px;
margin: 0 auto;
}
.submit{
display: inline-block;
float: right;
}
</style>
</head>
<body>
	
	<form class="layui-form" action="commodity/showcommsale" method="post">
	<div class="layui-form-item cata">
			<label class="layui-form-label cataname">请选择要查看的图书分类名称</label>
			<div class="layui-input-inline">
				<select name="catalogueid">
					<c:forEach items="${catas }" var="cata">
						<option value="${cata.catalogueid }">${cata.cataname }</option>
					</c:forEach>
				</select>
			</div>
			<button type="submit" class="layui-btn layui-btn-lg submit">确认</button>
		</div>
	</form>
	
	<!-- echarts主界面 -->
	<div id="main" style="width: 100%;height:90%;"></div>
	
	<script src="assest/layui.all.js"></script>
	<script src="assest/layui.js"></script>
	<script src="assest/js/echarts.min.js"></script>
	<script src="assest/js/jquery-3.4.1.min.js" type="text/javascript"
		charset="utf-8"></script>
	<script type="text/javascript">
	var myChart = echarts.init(document.getElementById('main'));
	
    // 指定图表的配置项和数据
   var option = {
		   title: {
              text: '各类图书热销单品统计'
           },
           tooltip: {
               trigger: 'axis',
               axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                   type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
               }
           },
           grid: {
               left: '3%',
               right: '4%',
               bottom: '3%',
               containLabel: true
           },
		    xAxis: {
		        type: 'category',
		        data: [
		        	${commnames}
		        ],
		        axisTick: {
	                alignWithLabel: true
	            }
		    },
		    yAxis: {
		        type: 'value'
		    },
		    series: [{
		        data: [
		        	${commcounts}
		        ],
		        type: 'bar',
		        showBackground: true,
		        backgroundStyle: {
		            color: 'rgba(180, 180, 180, 0.2)'
		        }
		    }]
		};

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
	</script>
</body>
</html>