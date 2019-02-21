<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style='width:100%;height:100%'>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body style='width:100%;height:100%; border:solid 1px #ddd'>
<div id="infoEdit">
	<h3 class='header-dividing'>修改个人信息</h3>
	<form id="infoForm">
		<div class='form-group row'>
			<div class='col-md-2'>
				<label class='form-label pull-right'>用户名</label>
			</div>
			<div class='col-md-5'>
				<input class='form-control' type='text' name='username' readonly="readonly"/>
			</div>
		</div>
		<div class='form-group row'>
			<div class='col-md-2'>
				<label class='form-label pull-right'>省份</label>
			</div>
			<div class='col-md-5'>
				<select class='form-control' id='provinceId' name='provinceId' datatype='*'>
				</select>
			</div>
			<div class='col-md-2'>
				<label class='Validform_checktip'></label>
			</div>
		</div>
		<div class='form-group row'>
			<div class='col-md-2'>
				<label class='form-label pull-right'>新密码</label>
			</div>
			<div class='col-md-5'>
				<input class='form-control' type='password' name='newPassword' placeholder='新密码' datatype=/^\s|[^\s]{6,18}$/ />
			</div>
			<div class='col-md-2'>
				<label class='Validform_checktip'></label>
			</div>
		</div>
		<div class='form-group row'>
			<div class='col-md-2'>
				<label class='form-label pull-right'>密码确认</label>
			</div>
			<div class='col-md-5'>
				<input class='form-control' type='password' placeholder='密码确认' datatype=/^\s|[^\s]{6,18}$/ recheck='newPassword'/>
			</div>
			<div class='col-md-2'>
				<label class='Validform_checktip'></label>
			</div>
		</div>
		<div class='form-group row'>
			<div class='col-md-2'>
				<label class='form-label pull-right'>电话</label>
			</div>
			<div class='col-md-5'>
				<input class='form-control' type='text' placeholder='电话' name='phone' datatype=/^13[0-9]{9}$|14[0-9]{9}|15[0-9]{9}$|18[0-9]{9}|17[0-9]{9}$//>
			</div>
			<div class='col-md-2'>
				<label class='Validform_checktip'></label>
			</div>
		</div>
		<div class='form-group row'>
			<div class='col-md-2'>
				<label class='form-label pull-right'>邮箱</label>
			</div>
			<div class='col-md-5'>
				<input class='form-control' type='text' placeholder='邮箱' name='email' datatype='e'/>
			</div>
			<div class='col-md-2'>
				<label class='Validform_checktip'></label>
			</div>
		</div>
		<div class='form-group row'>
			<div class='col-md-2 pull-right' style="position: absolute; left: 34%;margin-left: -56px;">
				<button class='btn btn-primary' onclick='formSub("infoForm")' style="background:#515453;border-color:#515453;">提交</button>
				<button class='btn' style="background:#515453;border-color:#515453;color: white;text-shadow: none;">取消</button>
			</div>
		</div>
	</form>
</div>
</body>
<script>
$(function(){
	$.post('<%=request.getContextPath()%>/users.php?go=infoEdit',{},function(data){
		data=JSON.parse(data);
		for(x in data){
			$('#infoForm input[name="'+x+'"]').val(data[x]);
		}
		$.post('<%=request.getContextPath()%>/province.php?go=ajaxList',{},function(provins){
			provins=JSON.parse(provins);
			$('#infoForm select[name="provinceId"]').empty();
			for(x in provins){
				$('#infoForm select[name="provinceId"]').append('<option value="'+provins[x].id+'" '+(provins[x].id===data.provinceId?'selected="selected"':'')+'>'+provins[x].name+'</option>');
			}
		})
	});
	
	validForm=$('#infoForm').Validform({
		tiptype:2,
		tipSweep:false
	});
});

function formSub(id){
	var ok=validForm.check();
	if(ok){
		$.post('<%=request.getContextPath()%>/users.php?go=edit',formatParams($('#infoForm').serializeArray(),';'),function(){
			alert('xxxx');
		})
	}
}

</script>
</html>