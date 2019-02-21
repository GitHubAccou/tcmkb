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
<div id='projectMain'>
	<h3>
		<div class="btn-toolbar">
		  <div class="btn-group">
		    <button class="btn btn-primary" onclick='toggle("projectMain","projectAddAndEdit");' style="background:#39aa7f;border-color:#39aa7f;"><i class="icon icon-plus"></i>发布项目</button>
		  </div>
		</div>
	</h3>
	<table id='projectTable' style="background-color:white;text-align: center;"></table>
</div>
<div id="projectAddAndEdit" style='display:none;'>
	<h3>发布项目</h3>
	<form id='projectForm' enctype="multipart/form-data">
		<div class='form-group row'>
			<div class='col-md-2'>
				<label class='form-label pull-right'>项目名称</label>
			</div>
			<div class='col-md-5'>
				<input type="text" class='form-control' name='name' datatype=/.+/ />
			</div>
			<div class='col-md-2'>
				<label class='Validform_checktip'></label>
			</div>
		</div>
		<div class='form-group row'>
			<div class='col-md-2'>
				<label class='form-label pull-right'>类型</label>
			</div>
			<div class='col-md-5'>
				<select class='form-control' name='type' >
					<option value='1'>医疗保健</option>
					<option value='2'>教育培训</option>
					<option value='3'>科研</option>
					<option value='4'>产业</option>
					<option value='5'>文化</option>
					<option value='6'>其他</option>
				</select>
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
				<label class='form-label pull-right'>截止日期</label>
			</div>
			<div class='col-md-5'>
				<input type='text' class='form-control' name='endTime' />
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
				<input type='text' class='form-control' name='desc' datatype=/.+/ />
			</div>
			<div class='col-md-2'>
				<label class='Validform_checktip'></label>
			</div>
		</div>
		<div class='for-group row'>
			<div class='col-md-2'>
				<label class='form-label pull-right'>附件</label>
			</div>
			<div class='col-md-5'>
				<input type='file' multiple='multiple' name='upFiles' style='display:none;' onchange='changeFile();'  />
				<button type="button" class='btn btn-primary' onclick='showUpLoad();'  style="background:#515453;border-color:#515453;"><i class='icon icon-cloud-upload'>添加附件</i></button>
				<div class='panel panel-success' id='toBeUp'>
					<div class='panel-heading' >
						待上传的文件
					</div>
					<div class='panel-body'></div>
				</div>
			</div>
		</div>
		<div class='form-group row pull-right' style="position: absolute; left: 50%;margin-left: -56px;">
			<button class='btn btn-info' id="btn_sub" style="background:#515453;border-color:#515453;">确定</button>
			<button class='btn btn-info' onclick='toggle("projectAddAndEdit","projectMain")' style="background:#515453;border-color:#515453;">取消</button>
		</div>
	</form>
</div>
</body>
<script>
$(function(){
	$('#projectTable').bootstrapTable({
		columns:[
			{checkbox:true},
			{field:'id',title:'编号',formatter:function(value,row,index){return value;}},
			{field:'name',title:'名称',formatter:function(value,row,index){return value;}},
			{field:'type',title:'项目类型',formatter:function(value,row,index){
				switch(value){
				case 1:
					return '医疗保健';
				case 2:
					return '教育培训';
				case 3:
					return '科研';
				case 4:
					return '产业';
				case 5:
					return '文化';
				case 6:
					return '其他';
				return value;
			}}},
			{field:'provinceName',title:'项目省份',formatter:function(value,row,index){return value;}},
			{field:'provinceId',title:'项目省份',visible:false},
			{field:'endTime',title:'截止日期',formatter:function(value,row,index){return value;}},
			{field:'desc',title:'项目描述',formatter:function(value,row,index){return value;}},
			{field:'status',title:'项目状态',formatter:function(value,row,index){
				switch(value){
				case 1:
					return '新发布';
				case 2:
					return '进行中';
				case 3:
					return '项目分配完成关闭';
			}}},
		],//列参数
		url:'../projects.php?go=ajaxListAll',//请求数据的URL
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
	
	$("input[name='endTime']").datetimepicker(
			{
			    weekStart: 1,
			    todayBtn:  1,
			    autoclose: 1,
			    todayHighlight: 1,
			    startView: 2,
			    forceParse: 0,
			    showMeridian: 1,
			    format: "yyyy-mm-dd hh:ii"
			});
	
	//加载省份数据
	$.post('<%=request.getContextPath()%>/province.php?go=ajaxList',{},function(provins){
		provins=JSON.parse(provins);
		$('#projectForm select[name="provinceId"]').empty();
		for(x in provins){
			$('#projectForm select[name="provinceId"]').append('<option value="'+provins[x].id+'">'+provins[x].name+'</option>');
		}
	});
});
validForm=$('#projectForm').Validform({
	tiptype:2,
	tipSweep:false,
	btnSubmit:'#btn_sub',
	callback:function(form){
		if(check){
			subForm("projectForm");
		}
		return false;
	}
});
toggle=function(first,second){
	$('#'+first).hide();
	$('#'+second).show();
}
toggleLock=function(lock){
	var seled = $('#projectTable').bootstrapTable('getSelections');
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
	//alert("she");
	var ok=validForm.check(false);
	if(ok){
			var form=document.getElementById(id);
	        var fd =new FormData(form);
	        if(fd.get('lock')===undefined){
	        	fd.append('lock',0);
			}
	       //alert($("#content").html());
	        $.ajax({
	             url: "<%=request.getContextPath()%>/projects.php?go=publishProject",
	             type: "POST",
	             data: fd,
	             processData: false,  // 告诉jQuery不要去处理发送的数据
	             contentType: false,   // 告诉jQuery不要去设置Content-Type请求头
	             success: function(response,status,xhr){
	                var data=response.responseText;
	                data=JSON.parse(data);
	                alert(data.msg);
	             }
	        });
		
		
		
	}
}

showUpLoad=function(){
	$('input[type="file"]').trigger('click');
	
}
changeFile=function(){
	var fs=$('input[type="file"]').prop('files');
	
	$('#toBeUp div.panel-body').empty().append('<ul style="list-style:none"></ul>');
	for(var x=0;x<fs.length;x++){
		$('#toBeUp div.panel-body ul').append('<li><i class="icon icon-file" style="color:green"></i> '+fs[x].name+'</li>');
	}
}
</script>
</html>