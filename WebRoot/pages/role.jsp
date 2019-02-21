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
<div id='roleMain'>
	<h3>
		<div class="btn-toolbar">
		  <div class="btn-group">
		    <button class="btn btn-primary" onclick='showAdd();' style="background:#39aa7f;border-color:#39aa7f;"><i class="icon icon-plus"></i>添加</button>
	     	<button class="btn btn-primary" onclick='showEdit();' style="background:#39aa7f;border-color:#39aa7f;"><i class="icon icon-pencil"></i>修改</button>
	     	<button class="btn btn-primary" onclick='del();' style="background:#39aa7f;border-color:#39aa7f;"><i class="icon icon-trash"></i>删除</button>
		  </div>
		</div>
	</h3>
	<table id='rolesTable' style="background-color:white;text-align: center;"></table>
</div>
<div id="roleAddAndEdit" style='display:none;'>
	<h3>添加角色</h3>
	<form id="roleForm">
		<input type='hidden' name='id'/>
		<div class='form-group row'>
			<div class='col-md-2'>
				<label class='form-label pull-right'>角色名称</label>
			</div>
			<div class='col-md-5'>
				<input type='text' class='form-control' name='name' placeholer='角色名称'/>
			</div>
			<div class='col-md-2'>
				<label class='Validform_checktip'></label>
			</div>
		</div>
		<div class='form-group row'>
			<div class='col-md-2'>
				<label class='form-label pull-right'>分配用户</label>
			</div>
			<div class='col-md-5' id='userItems'>
			
			</div>
			<div class='col-md-2'>
				<label class='Validform_checktip'></label>
			</div>
		</div>
		<div class='form-group row'>
			<div class='col-md-2'>
				<label class='form-label pull-right'>角色描述</label>
			</div>
			<div class='col-md-5'>
				<textarea rows="5" class='form-control' name='desc' style='resize: none;'></textarea>
			</div>
			<div class='col-md-2'>
				<label class='Validform_checktip'></label>
			</div>
		</div>
		<div class='form-group row pull-right' style="position: absolute; left: 50%;margin-left: -56px;">
			<button class='btn btn-info' onclick='subForm("add")' style="background:#515453;border-color:#515453;">确定</button>
			<button class='btn btn-info' onclick='toggle("roleAddAndEdit","roleMain")' style="background:#515453;border-color:#515453;">取消</button>
		</div>
	</form>
</div>
</body>
<script>
$(function(){
	$('#rolesTable').bootstrapTable({
		columns:[
			{checkbox:true},
			{field:'id',title:'编号'},
			{field:'name',title:'角色名称'},
			{field:'users',title:'包含用户'},
			{field:'desc',title:'角色描述'},
		],//列参数
		url:'<%=request.getContextPath()%>/roles.php?go=ajaxListAll',//请求数据的URL
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
		checkbox:true//启用复选框
	});
});

toggle=function(first,second){
	$('#'+first).hide();
	$('#'+second).show();
}
subForm=function(){
	var array=$('#roleForm').serializeArray();
	var params=formatParams(array,";");
	params.go=$('#roleForm').data('action');
	alert(params.go);
	$.post('<%=request.getContextPath()%>/roles.php',params,function(data){
		alert('ok');
	});
	
}
showAdd=function (){
	toggle("roleMain","roleAddAndEdit");
	$('#roleAddAndEdit h3:first').empty().append('添加角色');
	$('#roleForm input[name="name"]').removeProp('readonly');
	$('#roleForm').data("action","add");
	loadUser(null);
}
showEdit=function (){
	var seled = $('#rolesTable').bootstrapTable('getSelections');
	if(seled.length!=1){
		alert('请选择一条数据');
		return ;
	}
	toggle("roleMain","roleAddAndEdit");
	$('#roleAddAndEdit h3:first').empty().append('修改角色');
	$('#roleForm input[name="name"]').prop('readonly','readonly');
	$('#roleForm input[name="id"]').val(seled[0].id);
	$('#roleForm input[name="name"]').val(seled[0].name);
	$('#roleForm textarea[name="desc"]').val(seled[0].desc);
	$('#roleForm').data("action","edit");
	loadUser(seled[0].id);
	
}
loadUser=function(id){
	if(id!=null&&id!=undefined){
		param={roleId:id};
	}else{
		param={};
	}
	$.post('<%=request.getContextPath()%>/roles.php?go=ajaxAvailableUsersByRole',param,function(data){
		$('#userItems').empty();
		data=JSON.parse(data);
		for(var x in data){
			$('#userItems').append('<input id="userCheckbox'+x+'" type="checkbox" name="userIds" value="'+data[x].id+'"'+(data[x].hasOwnProperty("checked")?' checked="checked "':'')+'/> <label for="userCheckbox'+x+'">'+data[x].username+'</label>')
		}
			
	});
}
del=function(){
	var seled = $('#rolesTable').bootstrapTable('getSelections');
	if(seled.length<1){
		alert('请选择一条数据');
		return ;
	}
	var params={ids:''};
	for(var x in seled){
		params.ids+=';'+seled[x].id;
	}
	$.post('<%=request.getContextPath()%>/roles.php?go=del',params,function(data){
		alert('ok');
	})
}
</script>
</html>