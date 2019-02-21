<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="linkSources.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
#a {
    background-color: #39aa7f;
  
}
.step-arrow li.active a:after, .step-arrow li.active a:hover:after {
    background-color: #39aa7f !important;
}

.step-arrow li:nth-child(n+2) a:hover {
	    background-color: #39aa7f;
}
.step-arrow li a:hover:before {
    background: #ffffff;
    color: #39aa7f;
}

</style>
</head>
<body style="background: #f4f4f7">
<div id="userAddAndEdit" style='background: white;margin-top:10px' class='col-md-8 col-md-offset-2'>
	<ul class="nav nav-pills nav-justified step step-arrow">
		<li>
			<a id="a">注册</a>
		</li>
		<li>
			<a>注册结果</a>
		</li>
	</ul>
	<div id='step1'>
		<form id='userForm' method="post">
			<div class='form-group row'>
				<div class='col-md-8 col-md-offset-2' style='text-align: center'>
					<h3>用户注册</h3>
				</div>
			</div>
			<div class='form-group row'>
				<div class='col-md-3'>
					<label class='form-label pull-right'><font style='color:red'>*</font>用户名</label>
				</div>
				<div class='col-md-6'>
					<input type="text" class='form-control' name='username' datatype=/[a-zA-Z0-9_]{6,15}/ />
				</div>
				<div class='col-md-2'>
					<label class='Validform_checktip'></label>
				</div>
			</div>
			<div class='form-group row'>
				<div class='col-md-3'>
					<label class='form-label pull-right'><font style='color:red'>*</font>密码</label>
				</div>
				<div class='col-md-6'>
					<input class='form-control' type='password' name='password' datatype='*6-18' />
				</div>
				<div class='col-md-2'>
					<label class='Validform_checktip'></label>
				</div>
			</div>
			<div class='form-group row'>
				<div class='col-md-3'>
					<label class='form-label pull-right'><font style='color:red'>*</font>确认密码</label>
				</div>
				<div class='col-md-6'>
					<input class='form-control' type='password' datatype='*' recheck='password'/>
				</div>
				<div class='col-md-2'>
					<label class='Validform_checktip'></label>
				</div>
			</div>
			<div class='form-group row'>
				<div class='col-md-3'>
					<label class='form-label pull-right'><font style='color:red'>*</font>省份</label>
				</div>
				<div class='col-md-6'>
					<select class='form-control' name='provinceId'></select>
				</div>
			</div>
			<div class='form-group row'>
				<div class='col-md-3'>
					<label class='form-label pull-right'><font style='color:red'>*</font>电话</label>
				</div>
				<div class='col-md-6'>
					<input type='text' class='form-control' name='phone' datatype=/^13[0-9]{9}$|14[0-9]{9}|15[0-9]{9}$|18[0-9]{9}|17[0-9]{9}$//>
				</div>
				<div class='col-md-2'>
					<label class='Validform_checktip'></label>
				</div>
			</div>
			<div class='form-group row'>
				<div class='col-md-3'>
					<label class='form-label pull-right'><font style='color:red'>*</font>邮箱</label>
				</div>
				<div class='col-md-6'>
					<input type='text' class='form-control' name='email' datatype='e'/>
				</div>
				<div class='col-md-2'>
					<label class='Validform_checktip'></label>
				</div>
			</div>
			<div class='form-group row'>
				<div class='col-md-3'>
					<label class='form-label pull-right'><font style='color:red'>*</font>公司</label>
				</div>
				<div class='col-md-6'>
					<input type='text' class='form-control' name='company' datatype=/^\w{2,50}$/ />
				</div>
				<div class='col-md-2'>
					<label class='Validform_checktip'></label>
				</div>
			</div>
			<div class='form-group row'>
				<div class='col-md-3'>
					<label class='form-label pull-right'>公司类型</label>
				</div>
				<div class='col-md-6'>
					<select name='comType' class='form-control'>
						<option value='0'>企业法人</option>
						<option value='1'>国家机关</option>
						<option value='2'>事业单位</option>
						<option value='3'>社会团体</option>
						<option value='4'>军事机构</option>
						<option value='5'>其他</option>
					</select>
				</div>
			</div>
			<div class='form-group row text-center'>
				<button class='btn btn-info' id="btn_sub" style="width:47%;background:#39aa7f;border-color:#39aa7f;">注册</button>
			</div>
		</form>
		<hr>
		<a class='pull-right' style='margin-bottom:10px;color:#39aa7f' href='<%=request.getContextPath() %>/pages/login.jsp'>有账号？前去登录>></a>
	</div>
	<div id='step2' class="alert alert-danger with-icon" style="display:none">
	  <i class="icon-ok-sign"></i>
	  <div class="content"></div>
	  <hr/>
	  <div style="display:block">
		  <button class='btn btn-info' onclick='backReg();' Style="color:#39aa7f"><i class="icon icon-arrow-left" >返回注册页</i></button>
		  <a class='btn btn-info pull-right' href='<%=request.getContextPath() %>/pages/login.jsp'  Style="color:#39aa7f"><i class="icon icon-arrow-right">前去登录</i></a>
	  </div>
	</div>
</div>
</body>
<script>
$(function(){
	$("ul.step").bsStep(1);
	//加载省份数据
	$.post('<%=request.getContextPath()%>/province.php',{go:"ajaxList"},function(provins){
		provins=JSON.parse(provins);
		$('#userForm select[name="provinceId"]').empty();
		for(x in provins){
			$('#userForm select[name="provinceId"]').append('<option value="'+provins[x].id+'">'+provins[x].name+'</option>');
		}
	});
});
validForm=$('#userForm').Validform({
	tiptype:2,
	tipSweep:false,
	postonce:true,
	ignoreHidden:true,
	btnSubmit:'#btn_sub',
	callback:function(form){
		var check=confirm("您确定要提交表单吗？");
		if(check){
			subForm("userForm");
		}
		return false;
	}
});
subForm=function(id){
	var ok=validForm.check(false);
	if(ok){
		var arr=$('#'+id).serializeArray();
		var params=formatParams(arr,';');
		if(params.lock===undefined){
			params.lock=1;
		}
		params.go='addUser';
		$.post('<%=request.getContextPath()%>/users.php',params,function(data){
			data=JSON.parse(data);
			$("ul.step").bsStep(2);
			$('#step1').hide();
			$('#step2').show();
			//重置表单内容
			validForm.resetForm();
			//重置表单状态
			validForm.resetStatus();
			
			if(data.success=="1"){
				$('#step2').removeClass('alert-danger');
				$('#step2').addClass('alert-success');
				$('#step2').css('display','block');
				$('#step2 div.content').empty()
				$('#step2 div.content').append(data.msg);
			}else{
				$('#step2').removeClass('alert-success');
				$('#step2').addClass('alert-danger');
				$('#step2').css('display','block');
				$('#step2 div.content').empty()
				$('#step2 div.content').append(data.msg);
			}
		});
	}
}
backReg=function(){
	$("ul.step").bsStep(1);
	$('#step2').hide();
	$('#step1').show();
}
</script>
</html>