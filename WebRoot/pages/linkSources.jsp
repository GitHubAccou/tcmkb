<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link  rel="stylesheet" type="text/css" href='<%=request.getContextPath() %>/css/zui.min.css'/>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<link  rel="stylesheet" type="text/css" href='<%=request.getContextPath() %>/css/bootstrap-table.min.css'/>
<link  rel="stylesheet" type="text/css" href='<%=request.getContextPath() %>/css/Validform_v5.3.2.css'/>
<link  rel="stylesheet" type='text/css' href='<%=request.getContextPath() %>/css/ZTree/zTreeStyle/zTreeStyle.css'/>
<link  rel="stylesheet" type='text/css' href='<%=request.getContextPath() %>/css/step.css'/>
<link  rel="stylesheet" type='text/css' href='<%=request.getContextPath()%>/js/datetimepicker/datetimepicker.min.css'/>


<script src='<%=request.getContextPath()%>/js/jquery/jquery-1.9.1.min.js'></script>
<script src='<%=request.getContextPath()%>/js/zui.min.js'></script>
<script src='<%=request.getContextPath()%>/js/bootstrap-table.min.js'></script>
<script src='<%=request.getContextPath()%>/js/bootstrap-table-zh-CN.min.js'></script>
<script src='<%=request.getContextPath()%>/js/Validform_v5.3.2_min.js'></script>
<script src='<%=request.getContextPath()%>/js/ZTree/jquery.ztree.all.min.js'></script>
<script src='<%=request.getContextPath()%>/js/rollingNews/jq_scroll.js'></script>
<script src='<%=request.getContextPath()%>/js/step.js'></script>
<script src='<%=request.getContextPath()%>/js/datetimepicker/datetimepicker.min.js'></script>
<script src='<%=request.getContextPath()%>/js/jquery.md5.js'></script>

<script >
	formatParams=function(json,separator){
		var result={};
		for(var x in json){
			if(result[json[x].name]==undefined){
				result[json[x].name]='';
			}
			result[json[x].name]+=separator+json[x].value;
		}
		for(var x in result){
			result[x]=result[x].substring(1);
		}
		return result;
	}
</script>
</head>
<body>
</body>
</html>