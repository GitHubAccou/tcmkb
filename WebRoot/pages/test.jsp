<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="linkSources.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style='height:100%;width:100%;'>
<head>
<meta http-equiv="Content-Type" content="text/html; charset= charset=utf-8">
<title>Insert title here</title>
<style>
body {
  padding: 0;
  margin: 0;
  width: 100%;
  height: 100%;
  font-size: 12px;
}
ul {
  margin: 0;
  padding: 0;
}
li {
  list-style: none;
}
p {
  margin: 0;
  padding: 0;
}

/*头部*/
.header {
  width: 100%;
  height: 80px;
  background-color: rgb(43,45,66);
  padding-top: 15px;
  box-sizing: border-box;
}
.header .innerBox {
  width: 700px;
  height: 50px;
  line-height: 50px;
  margin-left: 25px;
}
.header .innerBox .picBox {
  float: left;
  width: 46px;
  height: 46px;
  margin-right: 30px;
  background-image: url("<%=request.getContextPath() %>/images/logo2.png");
  background-size: 46px 46px;
}
.header .innerBox .txt {
  float: left;
  font-size: 28px;
  font-weight: bold;
  font-family: "微软雅黑";
  color: #39aa7f;
}
.collapse{
  width: 100%;
  height: 50px;
  line-height: 50px;
  background-color: rgb(57,170,127);
}

/*内容区*/
.content {
  display: flex;
  position: relative;
  width: 100%;
  height: 100%;
}

/*底部*/
.footer {
  position: relative;
  width: 100%;
  height: 80px;
  background-color: rgb(72,72,72);
  color: #fff;
  text-align: center;
}
.footer .txt {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  margin: auto;
  width: 560px;
  height: 50px;
  line-height: 25px;
  font-size: 12px;
  font-family: "微软雅黑";
}
#menu{
height:calc(100% - 0px);
overflow-y:auto;
background-color: rgb(72,72,72);
font-weight:800;
color:#FFFFFF;
font-size:150%;
border:none;
border-radius:0;
}

@media (min-width:992px) {
	#menu {
		width: 12%;
	}
	#content {
		width: 88%;
	}
}
.tree-menu li>a {
    color: white;
    font-weight:normal;
    font-family: "微软雅黑";
    }
.tree-menu li>a:active,.tree-menu li>a:focus,.tree-menu li>a:hover{
color:#adaaaa;
}
#content{
height:calc(100% - 0px);
overflow-y:auto;
//width: 90%;
// background-image: url("<%=request.getContextPath() %>/images/logo.png");
}
#msgBox{
background-color:#515453;
}
</style>
</head>

<!--  <body style='height:100%;width:100%;'>-->
<body>

<div class="wrap">
  <div class="header">
    <div class="innerBox">
      <div class="picBox">

      </div>
      <p class="txt">国家中医药管理局项目申报平台</p>

    </div>

  </div>
<div class="collapse navbar-collapse navbar-collapse-example">
      <!-- 右侧的导航项目 -->
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#" onclick='loadMsg();' ><i class='icon icon-bell'></i><span class="label label-badge label-primary" id='msgBox' >0</span></a></li>
        <li class="dropdown">
          <a href="your/nice/url" class="dropdown-toggle" data-toggle="dropdown"><%=request.getSession().getAttribute("username") %> <b class="caret"></b></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#" onclick='infoEdit()'>修改资料</a></li>
            <li class="divider"></li>
            <li><a href="<%=request.getContextPath() %>/users.php?go=logOut"><i class='icon icon-signout'></i>退出</a></li>
          </ul>
        </li>
      </ul>
    </div>
    </div> 
	
	
	</div>
  <div class="content">
  <div id='menu' class='col-md-2'>
	
	</div>
	<div id='content' class='col-md-10'>
	
      </div>

      <!--右边-->
  </div>

  <div class="footer">
    <p class="txt">
      Copyright © 2017 SATCM All Rights Reserved　版权所有·国家中医药管理局<br>技术支持：中国中医科学院中医药信息研究所
    </p>
  </div>
</div>


    <!-- 导航项目 -->
    <!-- END .navbar-collapse -->
  </div>
</nav>
	</div> 
	
</body>
<script>
	$(function(){
		$.post('<%=request.getContextPath()%>/menus.php?go=ListMenuByRole',{},function(data){
			data=JSON.parse(data);
			//alert(JSON.stringify(data));
			$('#menu').tree({
				animation:true,
				data:data,
				initState:'normal'
			});
			$('#menu').addClass('tree-menu');
			$('#menu li a[data-m]').on('click',function(){
				$('#content').load(this.dataset.m);
			});
		});
		/*$.getJSON('<%=request.getContextPath() %>/pages/menu.json',function(data){
			$('#menu').tree({
				animation:true,
				data:data,
				initState:'normal'
			});
			$('#menu').addClass('tree-menu');
			$('#menu li a[data-m]').on('click',function(){
				$('#content').load(this.dataset.m);
			});
		});*/
		
		
		setInterval(function(){
			$.post('<%=request.getContextPath()%>/msgs.php?',{go:'getMsgCount'},function(data){
				data=JSON.parse(data);
				if(data.success){
					$('#msgBox').empty().append(data.cnt)
				}else{
					$('#msgBox').empty().append(data.cnt);
				}
			});
		},200000);
		
	});
	function infoEdit(){
		$('#content').load('<%=request.getContextPath()%>/pages/infoEdit.jsp');
	}
	loadContent =function (options){
		if(options.hasOwnProperty('params')){
			$('#content').load('<%=request.getContextPath()%>/pages/'+options.url);
		}else{
			$('#content').load('<%=request.getContextPath()%>/pages/'+options.url,options.params);
		}
	}
	loadMsg=function(){
		//alert("she");
		loadContent({url:'msgs.jsp'});
	}
</script>
</html>