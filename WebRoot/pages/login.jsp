<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="linkSources.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>中医科学院项目审批系统</title>
<style>
body {
  padding: 0;
  margin: 0;
  width: 100%;
  height: 100%;
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

button:focus,input:focus {
  outline: none;
  outline-offset: 0;
}

/*头部*/
.header {
  width: 100%;
  height: 50px;
  line-height: 50px;
  background-color: rgb(43,45,66);
  color: #fff;
}
.rightWrap {
  height: 100%;
  line-height: 50px;
  float: right;
}
.rightWrap ul {
  overflow: hidden;
}
.rightWrap ul li {
  float: left;
  padding-right: 30px;
  font-size: 14px;
  font-family: "微软雅黑";
}

/*内容区*/
.content {
  width: 100%;
  overflow: hidden;
}
/*图标*/
.nav {
  width: 100%;
  height: 80px;
  background-color: rgb(57,170,127);
  padding-top: 15px;
  box-sizing: border-box;
}
.nav .innerBox {
  width: 470px;
  height: 50px;
  line-height: 50px;
  margin-left: 40px;
  box-sizing: border-box;
}
.nav .innerBox .imgWrap {
  float: left;
  width: 46px;
  height: 46px;
  margin-right: 25px;
  margin-top: 2px;
  background-image: url("<%=request.getContextPath() %>/images/logo.png");
  background-size: 46px 46px;
}
.nav .innerBox .txtWrap {
  float: left;
  height: 50px;
  line-height: 50px;
}
.nav .innerBox p {
  float: left;
  font-size: 28px;
  font-weight: bold;
  font-family: "微软雅黑";
  color: #fff;
}

/*登录框*/
.loginBox {
  position: relative;
  width: 100%;
  height: 305px;
  background-image: url("<%=request.getContextPath() %>/images/bg.png");
  background-position: bottom;
  background-repeat: no-repeat;
  background-size: cover;
}
.loginBox .login {
  position: absolute;
  top: 0;
  right: 350px;
  width: 280px;
  height: 305px;
  background-color: rgb(43,45,66);
}
.loginBox .login .login_head {
  width: 100%;
  height: 55px;
}
.loginBox .login .login_head .left {
  width: 50%;
  height: 55px;
  background-color: rgb(29,33,52);
  color: #b02832;
  font-size: 18px;
  text-align: center;
  line-height: 55px;
}
.loginBox .login .email,.loginBox .login .password {
  width: 100%;
  height: 50px;
}
.loginBox .login .email input,.loginBox .login .password input {
color:white;
  box-sizing: border-box;
  display: inherit;
  width: 80%;
  height: 45px;
  margin: 5px auto;
  border-style: none;
  background-color: rgb(43,45,66);
  border-bottom: 1px dashed #fff;
}
.loginBox .login .forgetPsw {
  width: 80%;
  height: 65px;
  line-height: 65px;
  margin: 0 auto;
}
.loginBox .login .forgetPsw .left {
  float: left;
  width: 100%;
  height: 65px;
  font-size: 11px;
  color: #fff;
}
.loginBox .login .forgetPsw .right {
  float: right;
  width: 0%;
  height: 65px;
  font-size: 11px;
  color: #fff;
  text-align: right;
}
.loginBox .login .login_btn {
  width: 100%;
  height: 70px;
  line-height: 70px;
  text-align: center;
}
.loginBox .login .login_btn button {
  width: 60%;
  height: 40px;
  line-height: 40px;
  background-color: rgb(176,40,50);
  color: #fff;
  padding: 0;
  border-style: none;
}
.loginBox .login .login_btn button:hover {
  background-color: rgb(196,72,81);
}

/*最新公告*/
.newsBox {
  width: 100%;
  height: 60px;
  line-height: 60px;
  background-color: rgb(244,244,244);
}
.newsBox .innerWrap {
  height: 60px;
  margin-left: 50px;
  margin-right: 75px;
  color: #333;
}
.newsBox .innerWrap .leftTxt {
  float: left;
  font-size: 18px;
  font-family: "宋体";
}
.newsBox .innerWrap .rightTxt {
  float: right;
  font-size: 13px;
  font-family: "微软雅黑";
}


/*四个图标*/
.picBox {
  height: 400px;
  padding-top: 60px;
  box-sizing: border-box;
}
.picBox .innerBox {
  width: 700px;
  height: 140px;
  margin: 0 auto;
}
.picBox .innerBox ul {
  overflow: hidden;
}
.picBox .innerBox ul .item{
  float: left;
}
.picBox .innerBox ul .item_1,.picBox .innerBox ul .item_2,.picBox .innerBox ul .item_3{
  margin-right: 100px;
}
.picBox .innerBox ul .item .iconWrap{
  width: 100px;
  height: 100px;
  background-color: rgb(57,170,127);
}
.picBox .innerBox ul .item_1 .iconWrap{
  background-image: url("<%=request.getContextPath() %>/images/item_1.png");
  background-position: center;
  background-repeat: no-repeat;
}
.picBox .innerBox ul .item_2 .iconWrap{
  background-image: url("<%=request.getContextPath() %>/images/item_2.png");
  background-position: center;
  background-repeat: no-repeat;
}
.picBox .innerBox ul .item_3 .iconWrap{
  background-image: url("<%=request.getContextPath() %>/images/item_3.png");
  background-position: center;
  background-repeat: no-repeat;
}
.picBox .innerBox ul .item_4 .iconWrap{
  background-image: url("<%=request.getContextPath() %>/images/item_4.png");
  background-position: center;
  background-repeat: no-repeat;
}

.picBox .innerBox ul .item .txt{
  height: 40px;
  line-height: 40px;
  text-align: center;
  font-family: "微软雅黑";
  font-size: 18px;
  color: #333;
}
.picBox .innerBox ul .item .txt a{
 
  color: black;
}

/*底部*/
.footer {
  position: relative;
  width: 100%;
  height: 80px;
  text-align: center;
  color: #fff;
  background-color: rgb(43,45,66);
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
</style>
</head>
<body >
   <div class="wrap">
    <div class="header">
      <div class="rightWrap">
        <ul>
          <li></li>
          <li></li>
          <li></li>
          <li></li>
        </ul>
      </div>
    </div>
    <div class="content">
      <!--图标-->
      <div class="nav">
        <div class="innerBox">
          <div class="imgWrap">

          </div>
          <div class="txtWrap">
            <p>国家中医药管理局项目申报平台</p>
          </div>
        </div>
      </div>

      <!--登录框-->
      <form class="form-group" action="<%=request.getContextPath() %>/users.php" id='loginForm'>
      <div class="loginBox">
        <div class="login">

          <div class="login_head">
            <div class="left">
              登录Login<input type='hidden' class='form-control input-sm' name='go' value='login'/>
            </div>
          </div>

          <div class="email">
           <input class='form-control input' style='background:transparent;' name='un' placeholder="用户名" datatype=/.+/ nullmsg='请填写用户名'/>
          </div>

          <div class="password">
            <input type='password' class='form-control input' style='background:transparent;' name='ps' placeholder="密码" datatype=/.+/ nullmsg='请填写密码'/>
          </div>

          <div class="forgetPsw">
            <div class="left">
            <span></span>
             <input type='text' class='form-control input' style='background:transparent;width:40%;display:inline;color:white;' name='qrCode' placeholder="验证码" datatype=/.{5}/ nullmsg='请填写验证码'/>              
             <img id='QRcode' src='<%=request.getContextPath()%>/images/index.png' class='form-control pull-right' style='cursor:pointer;width:50%;display:inline;' onclick='refresh();'/>            
            </div>
            <div class="right">
            <span></span>
             
            </div>
          </div>
          <div class="login_btn">
            <!-- <button>Login</button> -->
            <button type='button' id='btn_sub'>登 陆</button>
          </div>
        </div>

      </div>
      </form>	

      <!--最新公告-->
      <div class="newsBox">
        <div class="innerWrap">
          <p class="leftTxt"> <b></b></p>
          <p class="rightTxt"></p>
        </div>
      </div>

      <!--四个图标-->
      <div class="picBox">
        <div class="innerBox">
          <ul>
            <li class="item item_1">
              <div class="iconWrap">

              </div>
              <p class="txt">
              <a href='<%=request.getContextPath()%>/pages/News.jsp' style="cursor:pointer;">数据统计</a>
              </p>
            </li>
            <li class="item item_2">
              <div class="iconWrap">

              </div>
              <p class="txt">
              <a href='<%=request.getContextPath()%>/pages/News.jsp' style="cursor:pointer;">通知公告</a>
              </p>
            </li>
            <li class="item item_3">
              <div class="iconWrap">

              </div>
              <p class="txt">
              <a href='<%=request.getContextPath()%>/pages/reg.jsp' style="cursor:pointer;">账号注册</a>
              </p>
            </li>
            <li class="item item_4">
              <div class="iconWrap">

              </div>
              <p class="txt">
              <a href='<%=request.getContextPath()%>/pages/login.jsp' style="cursor:pointer;">项目申报</a>
              </p>
            </li>
          </ul>
        </div>
      </div>

    </div>

    <div class="footer">
      <p class="txt">
        Copyright © 2017 SATCM All Rights Reserved　版权所有·国家中医药管理局<br>技术支持：中国中医科学院中医药信息研究所
      </p>
    </div>
  </div>
	  <!--  <div id='panel' class='col-md-offset-4 col-md-4' style='border:white solid 1px;height:300px;border-radius:5px;'>
		<form class="form-group" action="<%=request.getContextPath() %>/users.php" id='loginForm'>
			<div class='form-group'>
				<input type='hidden' class='form-control input-sm' name='go' value='login'/>
			</div>
			<div class='form-grouop'>
				<h3 class='text-center'>账号登陆</h3>
			</div>
			<div class='form-group row'>
				<div class='col-md-12'>
					<input class='form-control input' style='background:transparent;' name='un' placeholder="用户名" datatype=/.+/ nullmsg='请填写用户名'/>
				</div>
			</div>
			<div class='form-group row'>
				<div class='col-md-12'>
					<input type='password' class='form-control input' style='background:transparent;' name='ps' placeholder="密码" datatype=/.+/ nullmsg='请填写密码'/>
				</div>
			</div>
			<div class='form-group row'>
				<div class='col-md-12 from-group'>
					<input type='text' class='form-control input' style='background:transparent;width:60%;display:inline;' name='qrCode' placeholder="验证码" datatype=/.{5}/ nullmsg='请填写验证码'/>
					<img id='QRcode' src='<%=request.getContextPath()%>/images/index.png' class='form-control pull-right' style='cursor:pointer;width:30%;display:inline;' onclick='refresh();'/>
				</div>
			</div>
			<div class='form-group row'>
				<div class='col-md-12'>
					<button class='btn btn-block btn-primary'type='button' id='btn_sub'>登 陆</button>
				</div>
			</div>
			<div class='form-group row'>
				<a class='pull-right' href='<%=request.getContextPath()%>/pages/reg.jsp' style="cursor:pointer">账号注册>></a>
			</div>
		</form>	
	</div>-->
	
	 
  
</body>
<script type="text/javascript">
var validForm=$('#loginForm').Validform({
	tiptype:function(msg,o,cssctl){
		if(o.type==3){
			//type=3表示验证不通过
			alert(msg);
			return;
		}else{
		}
	},
	tipSweep:true,
	btnSubmit:'#btn_sub',
	callback:function(form){
		subForm("loginForm");
		return false;
	}
});
$(function(){
	refresh();
});
refresh=function(){
	$.post("<%=request.getContextPath()%>/users.php?go=genIndenC",{},function(data){
		$('#QRcode').attr('src',data);
	});
}

subForm=function(id){
	var ok=validForm.check(false);
	if(ok){
		var arr=$('#'+id).serializeArray();
		var params=formatParams(arr,';');
		params.go='login';
		params.ps=$.md5(params.ps);
		$.post('<%=request.getContextPath()%>/users.php',params,function(data){
			data=JSON.parse(data);
			if(data.ok){
				window.location.href='<%=request.getContextPath()%>/'+data.url;
			}else{
				alert(data.msg);
			}
			//重置表单内容
			validForm.resetForm();
			//重置表单状态
			validForm.resetStatus();
			
		});
	}
}
</script>
</html>