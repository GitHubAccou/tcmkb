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
	<div id="menuMain">
		<h3>
			<div class="btn-toolbar">
			  <div class="btn-group">
			    <button class="btn btn-primary" onclick='showAdd();' style="background:#39aa7f;border-color:#39aa7f;"><i class="icon icon-plus"></i>添加</button>
		     	<button class="btn btn-primary" onclick='showEdit();' style="background:#39aa7f;border-color:#39aa7f;"><i class="icon icon-pencil"></i>修改</button>
		     	<button class="btn btn-primary" onclick='del();' style="background:#39aa7f;border-color:#39aa7f;"><i class="icon icon-trash"></i>删除</button>
			  </div>
			</div>
		</h3>
		<table id='menusTable' style="background-color:white;text-align: center;"></table>
	</div>
	<div id="menuAddAndEdit" style="display:none;">
	 <h3></h3>
	 <form id="menuForm">
	 	<div class='form-group row'>
	 		<div class='col-md-2'>
	 			<label class='form-label pull-right'>父节点</label>
	 		</div>
	 		<div class='col-md-5'>
	 			<select class='form-control' name='parentPath' id='parentNodeItems'></select>
	 		</div>
	 	</div>
	 	<div class='form-group row'>
	 		<div class='col-md-2'>
	 			<label class='form-label pull-right'>名称</label>
	 		</div>
	 		<div class='col-md-5'>
	 			<input type='text' class='form-control' name='name'/>
	 		</div>
	 		<div class='col-md-2'>
	 			<label class='Validform_checktip'></label>
	 		</div>
	 	</div>
	 	<div class='form-group row'>
	 		<div class='col-md-2'>
	 			<label class='form-label pull-right'>链接</label>
	 		</div>
	 		<div class='col-md-5'>
	 			<input type='text' class='form-control' name='url'/>
	 		</div>
	 		<div class='col-md-2'>
	 			<label class='Validform_checktip'></label>
	 		</div>
	 	</div>
	 	<div class='form-group row'>
	 		<div class='col-md-2'>
	 			<label class='form-label pull-right'>图标</label>
	 		</div>
	 		<div class='col-md-5'>
	 			<input type='text' class='form-control' name='icon'/>
	 		</div>
	 		<div class='col-md-2'>
	 			<label class='Validform_checktip'></label>
	 		</div>
	 	</div>
	 	<div class='form-group row'>
	 		<div class='col-md-2'>
	 			<label class='form-label pull-right'>描述</label>
	 		</div>
	 		<div class='col-md-5'>
	 			<input type='text' class='form-control' name='desc'/>
	 		</div>
	 		<div class='col-md-2'>
	 			<label class='Validform_checktip'></label>
	 		</div>
	 	</div>
	 	<input type='hidden' name='path'/>
	 	<div class='form-group row pull-right' style="position: absolute; left: 50%;margin-left: -56px;">
			<button class='btn btn-info' onclick='subForm("menuForm")' style="background:#515453;border-color:#515453;">确定</button>
			<button class='btn btn-info' onclick='toggle("menuAddAndEdit","menuMain")' style="background:#515453;border-color:#515453;">取消</button>
		</div>
	 </form>
	</div>
</body>
<script>
$(function(){
	$('#menusTable').bootstrapTable({
		columns:[
			{checkbox:true},
			{field:'path',title:'路径',formatter:function(value,row,index){return value;}},
			{field:'name',title:'名称',formatter:function(value,row,index){return value;}},
			{field:'url',title:'链接',formatter:function(value,row,index){return value;}},
			{field:'desc',title:'描述',formatter:function(value,row,index){return value;}},
			{field:'icon',title:'图标',formatter:function(value,row,index){return value;}},
			{field:'parentPath',title:'上级路径',formatter:function(value,row,index){return value;}}
		],//列参数
		url:'<%=request.getContextPath()%>/menus.php?go=ajaxListAll',//请求数据的URL
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
});
toggle=function(first,second){
	$('#'+first).hide();
	$('#'+second).show();
}
showAdd=function(){
	toggle("menuMain","menuAddAndEdit");
	$('#menuAddAndEdit h3:first').empty().append('新建菜单项');
	$('#menuForm').data('action','add');
	$('#menuForm select[name="parentPath"]').removeProp('disabled');
	loadParentNodes();
}
showEdit=function(){
	var seled = $('#menusTable').bootstrapTable('getSelections');
	if(seled.length!=1){
		alert('请选择一条数据');
		return ;
	}
	toggle("menuMain","menuAddAndEdit");
	$('#menuAddAndEdit h3:first').empty().append('修改菜单项');
	$('#menuForm').data('action','edit');
	$('#menuForm select[name="parentPath"]').prop('disabled','disabled');
	$('#menuForm input[name="path"]').val(seled[0].path);
	$('#menuForm input[name="name"]').val(seled[0].name);
	$('#menuForm input[name="url"]').val(seled[0].url);
	$('#menuForm input[name="icon"]').val(seled[0].icon);
	$('#menuForm input[name="desc"]').val(seled[0].desc);
	loadParentNodes();
}

loadParentNodes=function(){
	$.post('<%=request.getContextPath()%>/menus.php?go=ajaxAvailableParentNodes',{},function(data){
		$('#parentNodeItems').empty();
		data=JSON.parse(data);
		for(var x in data){
			$('#parentNodeItems').append('<option value="'+data[x].path+'"'+(data[x].hasOwnProperty("selected")?' selected="selected "':'')+'>'+data[x].name+'</option>')
		}
	});
}
subForm=function(formId){
	var params=$('#'+formId).serializeArray();
	params=formatParams(params,';');
	params.go=$('#'+formId).data('action');
	$.post('<%=request.getContextPath()%>/menus.php',params,function(data){
		alert('ok');
	})
}
del=function(){
	var seled = $('#menusTable').bootstrapTable('getSelections');
	if(seled.length<1){
		alert('请选择一条数据');
		return ;
	}
	params={paths:''};
	for(var x in seled){
		params.paths+=';'+seled[x].path;
	}
	params.paths=params.paths.substring(1);
	$.post('<%=request.getContextPath()%>/menus.php?go=del',params,function(data){
		alert('ok');
	})
}
</script>
</html>