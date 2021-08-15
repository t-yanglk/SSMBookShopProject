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
<link rel="stylesheet" href="assest/css/layui.css" media="all">
<link href="assest/css/layui.mobile.css" />
<style type="text/css">
body,html{
width: 100%;
height: 100%;
}
</style>
</head>
<body>
	
	<!-- echarts主界面 -->
	<div id="main" style="width: 100%;height:100%;"></div>
	
	<script src="assest/js/echarts.min.js"></script>
	<script src="assest/js/jquery-3.4.1.min.js" type="text/javascript"
		charset="utf-8"></script>
	<script type="text/javascript">
	var myChart = echarts.init(document.getElementById('main'));
	
    // 指定图表的配置项和数据
   var option = {
		   title: {
               text: '分类热销单品统计'
           },
		    tooltip: {
		        trigger: 'item'
		    },
		    legend: {
		        top: '5%',
		        left: 'center'
		    },
		    series: [
		        {
		            name: '访问来源',
		            type: 'pie',
		            radius: ['40%', '80%'],
		            avoidLabelOverlap: false,
		            itemStyle: {
		                borderRadius: 10,
		                borderColor: '#fff',
		                borderWidth: 2
		            },
		            label: {
		                show: false,
		                position: 'center'
		            },
		            emphasis: {
		                label: {
		                    show: true,
		                    fontSize: '20',
		                    fontWeight: 'bold'
		                }
		            },
		            labelLine: {
		                show: false
		            },
		            data: [
		                ${data}
		            ]
		        }
		    ]
		};

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
	</script>
</body>
</html>