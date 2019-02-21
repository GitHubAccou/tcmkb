<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style>
	.ztree * {
		font-size: 14px;
	}

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
	<div id='authMain'>
	<h3>
		<div class="btn-toolbar">
		  <div class="btn-group">
	     	<button class="btn btn-primary" onclick='editShow();' style="background:#39aa7f;border-color:#39aa7f;"><i class="icon icon-pencil"></i>权限分配</button>
		  </div>
		</div>
	</h3>
	<table id='authTable' style="background-color:white;text-align: center;" ></table>
</div>
<div id="authAddAndEdit" style='display:none;height:100%;font-size: 15px;'>
	<h3>权限分配</h3>
	<form action="">
	<div class='form-group row'>
		<div class='col-md-2'>
			<label class='form-label pull-right'>角色</label>
		</div>
		<div class='col-md-4'>
			<select name='authTree' id='authTree' class='form-control' onchange="loadTree(this.id);">
			</select>
		</div>
	</div>
	<div class='form-group row'>
		<div class='col-md-2'>
			<label class='form-label pull-right'>权限树</label>
		</div>
		<div class='col-md-4'>
			<div id='userRole' class='ztree'>
			
			</div>
		</div>
	</div>
	<div class='form-group row'>
		<div class='col-md-4 col-md-offset-6' style="position: absolute; left: 30%;margin-left: -56px;">
			<button class='btn btn-info' type='button' onclick="addRight()" style="background:#515453;border-color:#515453;">确定</button>
			<button class='btn btn-priamy'  style="background:#515453;border-color:#515453;color: white;text-shadow: none;" >取消</button>
		</div>
	</div>
	</form>
</div>
</body>
<script>
	$(function(){
		$('#authTable').bootstrapTable({
			columns:[
				{field:'name',title:'角色',formatter:function(value,row,index){return value;}},
				{field:'desc',title:'角色描述',formatter:function(value,row,index){return value;}},
				{field:'menus',title:'菜单(以分号分割)',formatter:function(value,row,index){return value;}},
			],//列参数
			url:'../auth.php?go=ajaxListAll',//请求数据的URL
			cache:false,//是否启用缓存
			queryParams:{
				
			},//查询参数
			pagination:true,//是否启用分页
			sidePagination:'server',//分页方式
			pageSize:2,//每页条数
			pageList:[20,50,100,200],//可选每页数据条数
			clickToSelect:true,//点击行勾选行的CheckBox或radio
			singleSelect:false,//启用行单选
			height:500,
			striped:true,
			checkbox:true//启用复选框
		});
		//显示权限分配页面
		editShow=function(){
			toggle("authMain","authAddAndEdit");
			$.post('<%=request.getContextPath()%>/auth.php?go=ajaxAllRoleForSelect',{},function(data){
				$('#authTree option').remove();
				var json=JSON.parse(data);
				for(var x =0;x<json.length;x++){
					$('#authTree').append('<option value="'+json[x].id+'">'+json[x].name+'</option>');
				}
				//加载对应的数据权限
				ajaxRoleRightList($('#authTree option:first').attr('value'));
			});
			
		}
		ajaxRoleRightList=function(roleId){
			$.post('../auth.php?go=roleRightList',{roleId:roleId},function(data){
				zTreeObj = $.fn.zTree.init($("#userRole"), {
					check:{
						authCheckTirgger:true,
						chkStyle:'checkbox',
						enable:true,
						nocheckInherit:true,
						chkdisabledInherit:true,
					},
					data:{
						key:{
							checked:'checked',
						},
						simpleData:{
							enable:true,
							idKey:'path',
							pIdKey:'parent'
						}
					}
				}, data);
			},'json');
		}
		
		
		
	});
	
	toggle=function(first,second){
		$('#'+first).hide();
		$('#'+second).show();
	}
	loadTree=function(id){
		ajaxRoleRightList($('#'+id+' option:selected').attr('value'));
	}
	addRight=function(){
		var roleId=$('#authTree option:selected').attr('value');
		var x=zTreeObj.getCheckedNodes(true);
		var right=[];
		for(var c=0;c<x.length;c++){
			right[c]=x[c]['path'];
		}
		$.post('<%=request.getContextPath()%>/auth.php?go=updateRightByRole',{roleId:roleId,rights:JSON.stringify(right)},function(data){
			toggle("authMain","authAddAndEdit");
		});
		return ;
	}
</script>
</html>