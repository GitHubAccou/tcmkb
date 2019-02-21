<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
.pagination>.active>a, .pagination>.active>a:focus, .pagination>.active>a:hover, .pagination>.active>span, .pagination>.active>span:focus, .pagination>.active>span:hover {
    z-index: 3;
    color: #fff;
    cursor: default;
    background-color: #39aa7f;
    border-color: #39aa7f;
    }
    .pagination>li>a, .pagination>li>span {
    color: #39aa7f;
    
}
.fixed-table-container tbody td .th-inner, .fixed-table-container thead th .th-inner{
    font-size: 15px;
    text-align: center;

}
  </style>
</head>
<body>
<div id='userMain'>
	<h3>
		<div class="btn-toolbar">
		  <div class="btn-group">
		    <button class="btn btn-primary" onclick='toggle("userMain","userAddAndEdit");'  style="background:#39aa7f;border-color:#39aa7f;"><i class="icon icon-plus"></i>添加</button>
	     	<button class="btn btn-primary" onclick='toggleLock(true);' style="background:#39aa7f;border-color:#39aa7f;"><i class="icon icon-lock"  ></i>锁定</button>
	     	<button class="btn btn-primary" onclick='toggleLock(false);' style="background:#39aa7f;border-color:#39aa7f;"><i class="icon icon-unlock-alt" ></i>解锁</button>
		  </div>
		</div>
	</h3>
	<table id='usersTable' style="background-color:white;text-align: center;"></table>
</div>
<div id="userAddAndEdit" style='display:none;'>
	<h3>添加用户</h3>
	<form id='userForm'>
		<div class='form-group row'>
			<div class='col-md-2'>
				<label class='form-label pull-right'>用户名</label>
			</div>
			<div class='col-md-5'>
				<input type="text" class='form-control' name='username' datatype='*6-18' />
			</div>
			<div class='col-md-2'>
				<label class='Validform_checktip'></label>
			</div>
		</div>
		<div class='form-group row'>
			<div class='col-md-2'>
				<label class='form-label pull-right'>密码</label>
			</div>
			<div class='col-md-5'>
				<input class='form-control' type='password' name='password' datatype='*6-18' />
			</div>
			<div class='col-md-2'>
				<label class='Validform_checktip'></label>
			</div>
		</div>
		<div class='form-group row'>
			<div class='col-md-2'>
				<label class='form-label pull-right'>确认密码</label>
			</div>
			<div class='col-md-5'>
				<input class='form-control' type='password' datatype='*' recheck='password'/>
			</div>
			<div class='col-md-2'>
				<label class='Validform_checktip'></label>
			</div>
		</div>
		<div class='form-group row'>
			<div class='col-md-2'>
				<label class='form-label pull-right'>账户锁定</label>
			</div>
			<div class='col-md-5'>
				<input type='checkbox' name='lock' checked='checked' value='1'/>
			</div>
		</div>
		<div class='form-group row'>
			<div class='col-md-2'>
				<label class='form-label pull-right'>省份</label>
			</div>
			<div class='col-md-5'>
				<select class='form-control' name='provinceId'></select>
			</div>
		</div>
		<div class='form-group row'>
			<div class='col-md-2'>
				<label class='form-label pull-right'>电话</label>
			</div>
			<div class='col-md-5'>
				<input type='text' class='form-control' name='phone' datatype=/^13[0-9]{9}$|14[0-9]{9}|15[0-9]{9}$|18[0-9]{9}|17[0-9]{9}$//>
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
				<input type='text' class='form-control' name='email' datatype='e'/>
			</div>
			<div class='col-md-2'>
				<label class='Validform_checktip'></label>
			</div>
		</div>
		<div class='form-group row'>
			<div class='col-md-2'>
				<label class='form-label pull-right'>公司</label>
			</div>
			<div class='col-md-5'>
				<input type='text' class='form-control' name='company' datatype=/^*{2,50}$/ />
			</div>
			<div class='col-md-2'>
				<label class='Validform_checktip'></label>
			</div>
		</div>
		<div class='form-group row'>
			<div class='col-md-2'>
				<label class='form-label pull-right'>公司类型</label>
			</div>
			<div class='col-md-5'>
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
		<div class='form-group row pull-right' style="position: absolute; left: 50%;margin-left: -56px;">		
			<button class='btn btn-info' onclick='subForm("userForm")' style="background:#515453;border-color:#515453;">确定</button>
			<button class='btn btn-info' onclick='toggle("userAddAndEdit","userMain")' style="background:#515453;border-color:#515453;">取消</button>
		</div>
	</form>
</div>
</body>
<script>
$(function(){
	$('#usersTable').bootstrapTable({
		columns:[
			{checkbox:true},
			{field:'username',title:'用户名',formatter:function(value,row,index){return value;}},
			{field:'password',title:'密码',formatter:function(value,row,index){return value;}},
			{field:'phone',title:'电话',formatter:function(value,row,index){return value;}},
			{field:'email',title:'邮箱',formatter:function(value,row,index){return value;}},
			{field:'company',title:'公司',formatter:function(value,row,index){return value;}},
			{field:'lock',title:'锁定',formatter:function(value,row,index){return value==1?'是':'否';}},
			{field:'comType',title:'单位类型',formatter:function(value,row,index){
				switch(value){
				case 0:
					return '企业法人';
				case 1:
					return '国家机关';
				case 2:
					return '事业单位';
				case 3:
					return '社会团体';
				case 4:
					return '军事机构';
				case 5:
					return '其他';
				}
			}},
		],//列参数
		url:'../users.php?go=ajaxListAll',//请求数据的URL
		cache:false,//是否启用缓存
		queryParams:function (params) {
	        return {
	        	offset:params.offset,
	        	limit:params.limit,
	        	sortName:params.sortName,
	        	sortOrder:params.sortOrder
	        }
	    },//查询参数
		pagination:true,//是否启用分页
		sidePagination:'server',//分页方式
		pageSize:10,//每页条数
		pageList:[20,50,100,200],//可选每页数据条数
		clickToSelect:true,//点击行勾选行的CheckBox或radio
		singleSelect:false,//启用行单选
		height:500,
		striped:true,
		checkbox:true,//启用复选框
	});
	
	//加载省份数据
	$.post('<%=request.getContextPath()%>/province.php?go=ajaxList',{},function(provins){
		provins=JSON.parse(provins);
		$('#userForm select[name="provinceId"]').empty();
		$('#userForm select[name="provinceId"]').append('<option value="-1">无</option>');
		for(x in provins){
			$('#userForm select[name="provinceId"]').append('<option value="'+provins[x].id+'">'+provins[x].name+'</option>');
		}
	});
});
validForm=$('#userForm').Validform({
	tiptype:2,
	tipSweep:false
});
toggle=function(first,second){
	$('#'+first).hide();
	$('#'+second).show();
}
toggleLock=function(lock){
	var seled = $('#usersTable').bootstrapTable('getSelections');
	if(seled.length<=0){
		alert('请选择一条数据至少');
		return ;
	}
	var needToLock='';
	for(var x=0;x<seled.length;x++){
		needToLock+=';'+seled[x].id;
	}
	if(lock){
		$.post('<%=request.getContextPath()%>/users.php?go=lock',{userIds:needToLock},function(data){
			
		});
	}else{
		$.post('<%=request.getContextPath()%>/users.php?go=unLock',{userIds:needToLock},function(data){
			
		});
	}
}
subForm=function(id){
	var arr=$('#'+id).serializeArray();
	var params=formatParams(arr,';');
	if(params.lock===undefined){
		params.lock=0;
	}
	$.post('<%=request.getContextPath()%>/users.php?go=addUser',params,function(data){
		alert(data);
	})
}
</script>
</html>