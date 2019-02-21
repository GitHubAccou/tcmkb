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
	<h3><button class='btn btn-primary' onclick='loadContent({url:"report.jsp"});' style="background:#39aa7f;border-color:#39aa7f;">申请项目</button></h3>
	<table id='projectTable' Style="text-align: center;"></table>
</div>

</body>
<script>
$(function(){
	$('#projectTable').bootstrapTable({
		columns:[
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
			{field:'provinceId',title:'项目省份',hidden:true},
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
				}}
			}
		],//列参数
		url:'<%=request.getContextPath()%>/projects.php?go=ajaxListAll',//请求数据的URL
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
</script>
</html>