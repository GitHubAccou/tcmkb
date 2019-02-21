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

    
  </style>
</head>
<body>
<div id='msgMain'>
	<h3>
		<div class="btn-toolbar">
		  <div class="btn-group">
		    <button class="btn btn-outline" onclick='toggle("userMain","userAddAndEdit");'><i class="icon icon-plus"></i>添加</button>
	     	<button class="btn btn-outline" onclick='toggleLock(true);'><i class="icon icon-flag" style='color:gray;'></i>标记为已读</button>
		  </div>
		</div>
	</h3>
	<table id='msgsTable' style="background-color:white;"></table>
</div>
</body>
<script>
$(function(){
	$('#msgsTable').bootstrapTable({
		columns:[
			{checkbox:true},
			{field:'',title:'标记',formatter:function(value,row,index){
				return '<i class="icon icon-flag" style="color:'+(row.read==1?"gray":"red")+'"></i>'+(row.read==1?"已读":"未读");
			}},
			{field:'projectName',title:'相关项目'},
			{field:'content',title:'内容'},
			{field:'read',title:'已读',formatter:function(value,row,index){return value==1?'是':'否';}},
			{field:'time',title:'时间'},
		],//列参数
		url:'<%=request.getContextPath()%>/msgs.php?go=ajaxListAll',//请求数据的URL
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
		pageSize:1,//每页条数
		pageList:[20,50,100,200],//可选每页数据条数
		clickToSelect:true,//点击行勾选行的CheckBox或radio
		singleSelect:false,//启用行单选
		height:500,
		striped:true,
		checkbox:true,//启用复选框
		 COLOR:green,
	});
	
});
toggleLock=function(){
	var seled = $('#msgsTable').bootstrapTable('getSelections');
	if(seled.length<=0){
		alert('请选择一条数据至少');
		return ;
	}
	var ids='';
	for(var x=0;x<seled.length;x++){
		ids+=';'+seled[x].id;
	}
	ids=ids.substring(1);
	$.post('<%=request.getContextPath()%>/msgs.php?go=updateRead',{ids:ids},function(data){
		
	});
}
</script>
</html>