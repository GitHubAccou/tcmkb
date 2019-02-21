<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@include file="linkSources.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style='height:100%;width:100%;'>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<title>中医科学院项目审批系统</title>
	 <script src="<%=request.getContextPath()%>/dist/echarts-all.js"></script>
	 <style type="text/css">
	 	.panel-primary>.panel-heading {
	 		    background-color: #39aa7f;
    			border-color: #39aa7f;
    			
	 	}
	 	.navbar-nav{
	 	    background-color: #2b2d42;
	 	}
	 	.navbar-default .navbar-nav>li>a {
	 		color: #fff;
	 		font-size:16;
	 	}
	 	.navbar-default .navbar-nav>li>a:hover {
	 		color: #fff;
	 	}
	 	.panel-primary{
	 	border-color:#39aa7f;
	 	}
	 	#scrollDiv1 a {
	 		color: #515453;
	 		font-weight: bold;
	 	}
	 	.header{
    
    margin-bottom: 0;
}
.navbar {
	 		margin-bottom: 0;
	 		border: none;
	 		border-radius: 0;
	 	}
.navbar-default .navbar-nav>li>a:focus, .navbar-default .navbar-nav>li>a:hover{
            color:white;
}
	 </style>
	 
</head>

<body class='col-md-8 col-md-offset-2' style='background:#fff'>
	<h1 class="header" style='background: rgb(57,170,127);height: 80px;line-height: 75px;padding-left: 10px;'><img src="<%=request.getContextPath()%>/images/logo.png"><div style='padding-left: 10px;color:white;font-size:100%;display:inline;font-weight:bold;'>国家中医药管理局项目申报平台</div></h1>
	<nav class="navbar navbar-default navbar-primary" role="navigation" >
	  <ul class="nav navbar-nav nav-justified">
	    <!--   <li class="active"><a href="your/nice/url/1"><i class='icon icon-home'></i>首页</a></li>
	    <li><a href="your/nice/url/2"><i class='icon icon-check-board'></i>公告</a></li>-->
	   <li><a href="<%=request.getContextPath()%>/pages/News.jsp"><!--  <i class='icon icon-home'>--></i>首页</a></li>
	    <li><a href="#" onclick="news()"><!--  <i class='icon icon-check-board'>--></i>通知公告</a></li>
	    <li><a href="<%=request.getContextPath()%>/pages/login.jsp"><!--  <i class='icon icon-signin'>--></i>平台登录</a></li>
	    <li><a href="<%=request.getContextPath()%>/pages/reg.jsp"><!--  <i class='icon icon-signin'>--></i>用户注册</a></li>
	    <li><a href="<%=request.getContextPath()%>/pages/login.jsp"><!--  <i class='icon icon-signin'>--></i>项目申报</a></li>
	  </ul>
	</nav>
	<div class="panel-group">
	  <div class="panel panel-primary" id="a1">
		  <div class="panel-heading">
		    项目审批结果公示&nbsp;&nbsp;<i class="icon icon-bullhorn"></i>
		  </div>
		  <div class="panel-body" id="scrollContainer">
		    <div id="scrollDiv1" style="overflow-y:hidden;height:300px;">
		        <ul style="color:#39aa7f;">
		        </ul>
    		</div>
		  </div>
		  <div class="panel-footer">
		  </div>
	  </div>
  	  <div class="panel panel-primary" id="a2">
	    <div class="panel-heading">
		  区域统计
		  </div>
		  <div class="panel-body" id="graph-protocol" style="height: 400px;">
		    
		  </div>
	  </div>
	  <div class="panel panel-primary" id="a3">
	    <div class="panel-heading">
		    统计趋势图
		  </div>
		  <div class="panel-body" id="graph-census" style="height: 400px;">
		    
		  </div>
	  </div>
	</div>
</body>
<script type="text/javascript">
function news(){
	//alert("she");
	document.getElementById("a2").style.display="none";
	document.getElementById("a3").style.display="none";
}
</script>
<script type="text/javascript">
    (function () {
       // 基于准备好的dom，初始化echarts图表
       var myChart = echarts.init($('#graph-protocol').get(0));
       
       var option = {
       	    title : {
       	        text: '全国34个省市自治区',
       	        subtext: '',
       	        x:'center'
       	    },
       	    tooltip : {
       	        trigger: 'item',
       	        formatter: '{b}'
       	    },
       	    legend: {
       	        orient: 'vertical',
       	        x:'left',
       	        data:['','','']
       	    },
       	    dataRange: {
       	        min: 0,
       	        max: 2500,
       	        x: 'left',
       	        y: 'bottom',
       	        text:['高','低'],           // 文本，默认为数值文本
       	        calculable : true
       	    },
       	    toolbox: {
       	        show: false,
       	        orient : 'vertical',
       	        x: 'right',
       	        y: 'center',
       	        feature : {
       	            mark : {show: false},
       	            dataView : {show: true, readOnly: false},
       	            restore : {show: true},
       	            saveAsImage : {show: true}
       	        }
       	    },
       	    roamController: {
       	        show: false,
       	        x: 'right',
       	        mapTypeControl: {
       	            'china': true
       	        }
       	    },
       	    series : [
       	        {
       	            name: 'iphone3',
       	            type: 'map',
       	            mapType: 'china',
       	            roam: false,
       	            itemStyle:{
       	                normal:{label:{show:true}},
       	                emphasis:{label:{show:true}}
       	            },
       	            data:[
       	                {name: '北京',value: Math.round(Math.random()*1000)},
       	                {name: '天津',value: Math.round(Math.random()*1000)},
       	                {name: '上海',value: Math.round(Math.random()*1000)},
       	                {name: '重庆',value: Math.round(Math.random()*1000)},
       	                {name: '河北',value: Math.round(Math.random()*1000)},
       	                {name: '河南',value: Math.round(Math.random()*1000)},
       	                {name: '云南',value: Math.round(Math.random()*1000)},
       	                {name: '辽宁',value: Math.round(Math.random()*1000)},
       	                {name: '黑龙江',value: Math.round(Math.random()*1000)},
       	                {name: '湖南',value: Math.round(Math.random()*1000)},
       	                {name: '安徽',value: Math.round(Math.random()*1000)},
       	                {name: '山东',value: Math.round(Math.random()*1000)},
       	                {name: '新疆',value: Math.round(Math.random()*1000)},
       	                {name: '江苏',value: Math.round(Math.random()*1000)},
       	                {name: '浙江',value: Math.round(Math.random()*1000)},
       	                {name: '江西',value: Math.round(Math.random()*1000)},
       	                {name: '湖北',value: Math.round(Math.random()*1000)},
       	                {name: '广西',value: Math.round(Math.random()*1000)},
       	                {name: '甘肃',value: Math.round(Math.random()*1000)},
       	                {name: '山西',value: Math.round(Math.random()*1000)},
       	                {name: '内蒙古',value: Math.round(Math.random()*1000)},
       	                {name: '陕西',value: Math.round(Math.random()*1000)},
       	                {name: '吉林',value: Math.round(Math.random()*1000)},
       	                {name: '福建',value: Math.round(Math.random()*1000)},
       	                {name: '贵州',value: Math.round(Math.random()*1000)},
       	                {name: '广东',value: Math.round(Math.random()*1000)},
       	                {name: '青海',value: Math.round(Math.random()*1000)},
       	                {name: '西藏',value: Math.round(Math.random()*1000)},
       	                {name: '四川',value: Math.round(Math.random()*1000)},
       	                {name: '宁夏',value: Math.round(Math.random()*1000)},
       	                {name: '海南',value: Math.round(Math.random()*1000)},
       	                {name: '台湾',value: Math.round(Math.random()*1000)},
       	                {name: '香港',value: Math.round(Math.random()*1000)},
       	                {name: '澳门',value: Math.round(Math.random()*1000)}
       	            ]
       	        }
       	    ]
       	};

       // 为echarts对象加载数据 
       myChart.setOption(option,true); 
       
    		var projectName =[];
    		var startTime;
    		var datea=[];
       var myChart1 = echarts.init($('#graph-census').get(0));
       $.post("<%=request.getContextPath()%>/userProjects.php?go=listAll",{},function(data){
	       	datea=JSON.parse(data);
	       	startTime = datea.startDate;
	       	datea = datea.rows;
	       	for(var x =0;x<datea.length;x++){
	   			projectName[x] = datea[x].name;
	       	}
	       	render();
	   	});
       function render(){
		var option = {
				tooltip : {
					trigger : 'axis'
				},
				legend : {
					data : projectName
				},
				toolbox : {
					show : false,
					feature : {
						mark : {
							show : true
						},
						dataView : {
							show : true,
							readOnly : false
						},
						magicType : {
							show : true,
							type : [ 'line', 'bar', 'stack', 'tiled' ]
						},
						restore : {
							show : true
						},
						saveAsImage : {
							show : true
						}
					}
				},
				calculable : true,
				xAxis : [ {
					type : 'category',
					boundaryGap : false,
					data : startTime
				} ],
				yAxis : [ {
					type : 'value'
				} ],
				series : datea
			};
		myChart1.setOption(option, true);
		}
    })();
        
</script>
<script>
var timer;
$(function(){
	/**
	*滚动新闻
	*/
	refreshNotice();
	timer=setInterval(function(){
		refreshNotice();
	},10000);
	
});
   
refreshNotice =function(){
	$.post('<%=request.getContextPath()%>/notice.php',{go:"ajaxListAll",offset:0,limit:10},function(data){
		data=JSON.parse(data);
		if(data.success=="1"){
			$('#scrollContainer').empty().append('<div id="scrollDiv1" style="overflow-y:hidden;height:300px;"><ul></ul></div>');
			
			$("#scrollDiv1 ul").empty();
			for(var x=0;x<data.data.length;x++){
				$("#scrollDiv1 ul").append("<li><h4><a href='#'  class='linktit'>"+data.data[x].title+"</a></h4><div>"+data.data[x].content+"</div></li>");
			}
			$("#scrollDiv1").Scroll({line:1,speed:500,timer:3000});
		}
	});
}
</script>
</html>