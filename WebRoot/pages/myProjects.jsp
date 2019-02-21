<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
.panel-primary>.panel-heading{
 background-color: #f1f1f1;

}
.panel-primary{
 border-color:#f1f1f1;
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
<div id='userMain'>
	<table id='usersTable' style="background-color:white;text-align: center;"></table>
</div>
<div id="userAddAndEdit" style='display:none;'>
	<h3>申报项目情况</h3>
	<h3>
		<div class="btn-toolbar">
			<button class='btn btn-info pull-right' onclick='exp();' style="background:#39aa7f;border-color:#39aa7f;"><i class='icon icon-file'>导出word</i></button>
		</div>
	</h3>
	<form id='approveForm'>
		<div class="panel-group" id="parentDiv">
		  <div class="panel panel-primary">
			  <div class="panel-heading"><a style="text-decoration:none;color:black" data-toggle="collapse" data-parent="#parentDiv" href="#cDIV1">一、项目申报基本情况</a></div>
			  <div class="panel-body" id="cDIV1">
			  		<div class='form-group row'>
						<div class='col-md-3'>
							<label class='form-label pull-right'>项目名称</label>
						</div>
						<div class='col-md-5'>
							<input type="text" class='form-control' name="projectName" disabled="disabled" />
						</div>
					</div>
					<div class='form-group row'>
						<div class='col-md-3'>
							<label class='form-label pull-right'>服务模式</label>
						</div>
						<div class='col-md-5'>
							<select class='form-control' name='serviceType' disabled="disabled">
								<option value='1'>跨境支付</option>
								<option value='2'>境外消费</option>
								<option value='3'>商业存在</option>
								<option value='4'>自然人移动</option>
							</select>
						</div>
					</div>
					<div class='form-group row'>
						<div class='col-md-3'>
							<label class='form-label pull-right'>主要国家和地区</label>
						</div>
						<div class='col-md-5'>
							<input class='form-control' type='text' name='mainCountry' disabled="disabled"/>
						</div>
					</div>
					<div class='form-group row'>
						<div class='col-md-3'>
							<label class='form-label pull-right'>其他参加单位(以逗号分隔)</label>
						</div>
						<div class='col-md-5'>
							<input class='form-control' type='text' name='others' disabled="disabled"/>
						</div>
					</div>		
					<div class='form-group row'>
						<div class='col-md-3'>
							<label class='form-label pull-right'>项目负责人姓名</label>
						</div>
						<div class='col-md-5'>
							<input class='form-control' type='text' name='managerName'  disabled="disabled"/>
						</div>
					</div>		
					<div class='form-group row'>
						<div class='col-md-3'>
							<label class='form-label pull-right'>项目负责人职位</label>
						</div>
						<div class='col-md-5'>
							<input class='form-control' type='text' name='managerPosition'  disabled="disabled"/>
						</div>
					</div>		
					<div class='form-group row'>
						<div class='col-md-3'>
							<label class='form-label pull-right'>项目负责人单位</label>
						</div>
						<div class='col-md-5'>
							<input class='form-control' type='text' name='managerCompany' disabled="disabled"/>
						</div>
					</div>		
					<div class='form-group row'>
						<div class='col-md-3'>
							<label class='form-label pull-right'>项目负责人电话</label>
						</div>
						<div class='col-md-5'>
							<input class='form-control' type='text' name='managerPhone' disabled="disabled"/>
						</div>
					</div>		
					<div class='form-group row'>
						<div class='col-md-3'>
							<label class='form-label pull-right'>项目负责人邮箱</label>
						</div>
						<div class='col-md-5'>
							<input class='form-control' type='text' name='managerEmail' disabled="disabled"/>
						</div>
					</div>		
					<div class='form-group row'>
						<div class='col-md-3'>
							<label class='form-label pull-right'>参加项目人数</label>
						</div>
						<div class='col-md-5'>
							<input class='form-control' type='text' name='total' disabled="disabled"/>
						</div>
					</div>		
					<div class='form-group row'>
						<div class='col-md-3'>
							<label class='form-label pull-right'>精通外语人数</label>
						</div>
						<div class='col-md-5'>
							<input class='form-control' type='text' name='englishTotal' disabled="disabled"/>
						</div>
					</div>		
			  </div>
		  </div>
		  <div class="panel panel-primary">
		    <div class="panel-heading"><a style="text-decoration:none;color:black" data-toggle="collapse" data-parent="#parentDiv" href="#cDIV2">二、工作基础(提供近三年服务量，服务金额(以美元为单位)等信息)</a></div>
			  <div class="panel-body" id="cDIV2">
			  		<div class="panel projectTypeToggle">
			  			<div class='panel-body'>
			  				<div class='form-group row'>
			  					<div class='col-md-3'></div>
			  					<div class='col-md-3'><div class='form-label'>第一年</div></div>
			  					<div class='col-md-3'><div class='form-label'>第二年</div></div>
			  					<div class='col-md-3'><div class='form-label'>第三年</div></div>
			  				</div>
			  				<div class='form-group row'>
				  				<div class='col-md-3'><div class='form-label pull-right'>在国内接待境内患者就诊</div></div>
				  				<div class='col-md-3'><input disabled="disabled" class='form-control' type='text' name='BJFirstFirstPerson' style='width:35%;display:inline'/>人次<input disabled="disabled" class='form-control'   name='BJFirstFirstMoney=' type='text' style='width:35%;display:inline'/>万元</div>
				  				<div class='col-md-3'><input disabled="disabled" class='form-control' type='text' name='BJFirstSecondPerson'  style='width:35%;display:inline'/>人次<input disabled="disabled" class='form-control' name='BJFirstSecondMoney' type='text' style='width:35%;display:inline'/>万元</div>
				  				<div class='col-md-3'><input disabled="disabled" class='form-control' type='text' name='BJFirstThirdPerson'  style='width:35%;display:inline'/>人次<input disabled="disabled" class='form-control'  name='BJFirstThirdMoney' type='text' style='width:35%;display:inline'/>万元</div>
			  				</div>
			  				<div class='form-group row'>
				  				<div class='col-md-3'><div class='form-label pull-right'>在国外接待境内患者就诊</div></div>
				  				<div class='col-md-3'><input disabled="disabled" class='form-control' type='text' name='BJSecondFirstPerson'  style='width:35%;display:inline'/>人次<input disabled="disabled" class='form-control' name='BJSecondFirstMoney'  type='text' style='width:35%;display:inline'/>万元</div>
				  				<div class='col-md-3'><input disabled="disabled" class='form-control' type='text' name='BJSecondSecondPerson' style='width:35%;display:inline'/>人次<input disabled="disabled" class='form-control' name='BJSecondSecondMoney' type='text' style='width:35%;display:inline'/>万元</div>
				  				<div class='col-md-3'><input disabled="disabled" class='form-control' type='text' name='BJSecondThirdPerson'  style='width:35%;display:inline'/>人次<input disabled="disabled" class='form-control' name='BJSecondThirdMoney'  type='text' style='width:35%;display:inline'/>万元</div>
			  				</div>
			  				<div class='form-group row'>
				  				<div class='col-md-3'><div class='form-label pull-right'>在国内为境外提供远程就诊</div></div>
				  				<div class='col-md-3'><input disabled="disabled" class='form-control' type='text' name='BJThirdFirstPerson'  style='width:35%;display:inline'/>人次<input disabled="disabled" class='form-control' name='BJThirdFirstMoney'  type='text' style='width:35%;display:inline'/>万元</div>
				  				<div class='col-md-3'><input disabled="disabled" class='form-control' type='text' name='BJThirdSecondPerson' style='width:35%;display:inline'/>人次<input disabled="disabled" class='form-control' name='BJThirdSecondMoney' type='text' style='width:35%;display:inline'/>万元</div>
				  				<div class='col-md-3'><input disabled="disabled" class='form-control' type='text' name='BJThirdThirdPerson'  style='width:35%;display:inline'/>人次<input disabled="disabled" class='form-control' name='BJThirdThirdMoney'  type='text' style='width:35%;display:inline'/>万元</div>
			  				</div>
			  				<div class='form-group row'>
				  				<div class='col-md-3'><div class='form-label pull-right'>其他</div></div>
				  				<div class='col-md-3'><input disabled="disabled" class='form-control' type='text' name='BJFourthFirstPerson'  style='width:35%;display:inline'/>人次<input disabled="disabled" class='form-control' name='BJFourthFirstMoney'  type='text' style='width:35%;display:inline'/>万元</div>
				  				<div class='col-md-3'><input disabled="disabled" class='form-control' type='text' name='BJFourthSecondPerson' style='width:35%;display:inline'/>人次<input disabled="disabled" class='form-control' name='BJFourthSecondMoney' type='text' style='width:35%;display:inline'/>万元</div>
				  				<div class='col-md-3'><input disabled="disabled" class='form-control' type='text' name='BJFourthThirdPerson'  style='width:35%;display:inline'/>人次<input disabled="disabled" class='form-control' name='BJFourthThirdMoney'  type='text' style='width:35%;display:inline'/>万元</div>
			  				</div>
			  			</div>
			  		</div>
			  		<div class="panel projectTypeToggle">
			  			<div class='panel-body'>
			  				<div class='form-group row'>
			  					<div class='col-md-3'></div>
			  					<div class='col-md-3'><div class='form-label'>第一年</div></div>
			  					<div class='col-md-3'><div class='form-label'>第二年</div></div>
			  					<div class='col-md-3'><div class='form-label'>第三年</div></div>
			  				</div>
			  				<div class='form-group row'>
				  				<div class='col-md-3'><div class='form-label pull-right'>在国内招生留学生学历教育</div></div>
				  				<div class='col-md-3'><input disabled="disabled" class='form-control' type='text' name='PXFirstFirstPerson'  style='width:35%;display:inline'/>人<input disabled="disabled" class='form-control' name='PXFirstFirstMoney'  type='text' style='width:35%;display:inline'/>万元</div>
				  				<div class='col-md-3'><input disabled="disabled" class='form-control' type='text' name='PXFirstSecondPerson' style='width:35%;display:inline'/>人<input disabled="disabled" class='form-control' name='PXFirstSecondMoney' type='text' style='width:35%;display:inline'/>万元</div>
				  				<div class='col-md-3'><input disabled="disabled" class='form-control' type='text' name='PXFirstThirdPerson'  style='width:35%;display:inline'/>人<input disabled="disabled" class='form-control' name='PXFirstThirdMoney'  type='text' style='width:35%;display:inline'/>万元</div>
			  				</div>
			  				<div class='form-group row'>
				  				<div class='col-md-3'><div class='form-label pull-right'>在国内接待国外留学生短期培训</div></div>
				  				<div class='col-md-3'><input disabled="disabled" class='form-control' type='text' name='PXSecondFirstPerson'  style='width:35%;display:inline'/>人<input disabled="disabled" class='form-control' name='PXSecondFirstMoney'  type='text' style='width:35%;display:inline'/>万元</div>
				  				<div class='col-md-3'><input disabled="disabled" class='form-control' type='text' name='PXSecondSecondPerson' style='width:35%;display:inline'/>人<input disabled="disabled" class='form-control' name='PXSecondSecondMoney' type='text' style='width:35%;display:inline'/>万元</div>
				  				<div class='col-md-3'><input disabled="disabled" class='form-control' type='text' name='PXSecondThirdPerson'  style='width:35%;display:inline'/>人<input disabled="disabled" class='form-control' name='PXSecondThirdMoney'  type='text' style='width:35%;display:inline'/>万元</div>
			  				</div>
			  				<div class='form-group row'>
				  				<div class='col-md-3'><div class='form-label pull-right'>在国外招生留学生学历教育</div></div>
				  				<div class='col-md-3'><input disabled="disabled" class='form-control' name='PXThirdFirstPerson'  type='text' style='width:35%;display:inline'/>人<input disabled="disabled" class='form-control' name='PXThirdFirstMoney'  type='text' style='width:35%;display:inline'/>万元</div>
				  				<div class='col-md-3'><input disabled="disabled" class='form-control' name='PXThirdSecondPerson' type='text' style='width:35%;display:inline'/>人<input disabled="disabled" class='form-control' name='PXThirdSecondMoney' type='text' style='width:35%;display:inline'/>万元</div>
				  				<div class='col-md-3'><input disabled="disabled" class='form-control' name='PXThirdThirdPerson'  type='text' style='width:35%;display:inline'/>人<input disabled="disabled" class='form-control' name='PXThirdThirdMoney'  type='text' style='width:35%;display:inline'/>万元</div>
			  				</div>
			  				<div class='form-group row'>
				  				<div class='col-md-3'><div class='form-label pull-right'>在国外接待国外留学生短期培训</div></div>
				  				<div class='col-md-3'><input disabled="disabled" class='form-control' name='PXFourthFirstPerson'  type='text' style='width:35%;display:inline'/>人<input disabled="disabled" class='form-control' name='PXFourthFirstMoney'  type='text' style='width:35%;display:inline'/>万元</div>
				  				<div class='col-md-3'><input disabled="disabled" class='form-control' name='PXFourthSecondPerson' type='text' style='width:35%;display:inline'/>人<input disabled="disabled" class='form-control' name='PXFourthSecondMoney' type='text' style='width:35%;display:inline'/>万元</div>
				  				<div class='col-md-3'><input disabled="disabled" class='form-control' name='PXFourthThirdPerson'  type='text' style='width:35%;display:inline'/>人<input disabled="disabled" class='form-control' name='PXFourthThirdMoney'  type='text' style='width:35%;display:inline'/>万元</div>
			  				</div>
			  				<div class='form-group row'>
				  				<div class='col-md-3'><div class='form-label pull-right'>其他</div></div>
				  				<div class='col-md-3'><input disabled="disabled" class='form-control' name='PXFifthFirstPerson'  type='text' style='width:35%;display:inline'/>人<input disabled="disabled" class='form-control' name='PXFifthFirstMoney'  type='text' style='width:35%;display:inline'/>万元</div>
				  				<div class='col-md-3'><input disabled="disabled" class='form-control' name='PXFifthSecondPerson' type='text' style='width:35%;display:inline'/>人<input disabled="disabled" class='form-control' name='PXFifthSecondMoney' type='text' style='width:35%;display:inline'/>万元</div>
				  				<div class='col-md-3'><input disabled="disabled" class='form-control' name='PXFifthThirdPerson'  type='text' style='width:35%;display:inline'/>人<input disabled="disabled" class='form-control' name='PXFifthThirdMoney'  type='text' style='width:35%;display:inline'/>万元</div>
			  				</div>
			  			</div>
			  		</div>
			  		<div class="panel projectTypeToggle">
			  			<div class='panel-body'>
			  				<div class='form-group row'>
			  					<div class='col-md-3'></div>
			  					<div class='col-md-2'><div class='form-label'>第一年</div></div>
			  					<div class='col-md-2'><div class='form-label'>第二年</div></div>
			  					<div class='col-md-2'><div class='form-label'>第三年</div></div>
			  				</div>
			  				<div class='form-group row'>
				  				<div class='col-md-3'><div class='form-label pull-right'>承担境外科研外包任务</div></div>
				  				<div class='col-md-2'><input disabled="disabled" class='form-control' name='KYFirstFirst'  type='text'/></div>
				  				<div class='col-md-2'><input disabled="disabled" class='form-control' name='KYFirstSecond' type='text'/></div>
				  				<div class='col-md-2'><input disabled="disabled" class='form-control' name='KYFirstThird'  type='text'/></div>
			  				</div>
			  				<div class='form-group row'>
				  				<div class='col-md-3'><div class='form-label pull-right'>向境外转让技术</div></div>
				  				<div class='col-md-2'><input disabled="disabled" class='form-control' name='KYSecondFirst'  type='text'/></div>
				  				<div class='col-md-2'><input disabled="disabled" class='form-control' name='KYSecondSecond' type='text'/></div>
				  				<div class='col-md-2'><input disabled="disabled" class='form-control' name='KYSecondThird'  type='text'/></div>
			  				</div>
			  				<div class='form-group row'>
				  				<div class='col-md-3'><div class='form-label pull-right'>向境外提供咨询服务</div></div>
				  				<div class='col-md-2'><input disabled="disabled" class='form-control' name='KYThirdFirst'  type='text'/></div>
				  				<div class='col-md-2'><input disabled="disabled" class='form-control' name='KYThirdSecond' type='text'/></div>
				  				<div class='col-md-2'><input disabled="disabled" class='form-control' name='KYThirdThird'  type='text'/></div>
			  				</div>
			  				<div class='form-group row'>
				  				<div class='col-md-3'><div class='form-label pull-right'>其他</div></div>
				  				<div class='col-md-2'><input disabled="disabled" class='form-control' name='KYFourthFirst'  type='text'/></div>
				  				<div class='col-md-2'><input disabled="disabled" class='form-control' name='KYFourthSecond' type='text'/></div>
				  				<div class='col-md-2'><input disabled="disabled" class='form-control' name='KYFourthThird'  type='text'/></div>
			  				</div>
			  			</div>
			  		</div>
			  		<div class="panel projectTypeToggle">
			  			<div class='panel-body'>
			  				<div class='form-group row'>
			  					<div class='col-md-3'></div>
			  					<div class='col-md-2'><div class='form-label'>第一年</div></div>
			  					<div class='col-md-2'><div class='form-label'>第二年</div></div>
			  					<div class='col-md-2'><div class='form-label'>第三年</div></div>
			  				</div>
			  				<div class='form-group row'>
				  				<div class='col-md-3'><div class='form-label pull-right'>提供与中医药有关的贸易</div></div>
				  				<div class='col-md-2'><input disabled="disabled" class='form-control' name='CYFirstFirst'  type='text'/></div>
				  				<div class='col-md-2'><input disabled="disabled" class='form-control' name='CYFirstSecond' type='text'/></div>
				  				<div class='col-md-2'><input disabled="disabled" class='form-control' name='CYFirstThird'  type='text'/></div>
			  				</div>
			  			</div>
			  		</div>
			  		<div class="panel projectTypeToggle">
			  			<div class='panel-body'>
			  				<div class='form-group row'>
			  					<div class='col-md-3'></div>
			  					<div class='col-md-2'><div class='form-label'>第一年</div></div>
			  					<div class='col-md-2'><div class='form-label'>第二年</div></div>
			  					<div class='col-md-2'><div class='form-label'>第三年</div></div>
			  				</div>
			  				<div class='form-group row'>
				  				<div class='col-md-3'><div class='form-label pull-right'>向境外销售文化产品</div></div>
				  				<div class='col-md-2'><input disabled="disabled" class='form-control' name='WHFirstFirst'  type='text'/></div>
				  				<div class='col-md-2'><input disabled="disabled" class='form-control' name='WHFirstSecond' type='text'/></div>
				  				<div class='col-md-2'><input disabled="disabled" class='form-control' name='WHFirstThird'  type='text'/></div>
			  				</div>			  			
			  			</div>
			  		</div>
			  		<div class="panel projectTypeToggle">
			  			<div class='panel-body'>
			  				<div class='form-group row'>
			  					<div class='col-md-3'></div>
			  					<div class='col-md-2'><div class='form-label'>第一年</div></div>
			  					<div class='col-md-2'><div class='form-label'>第二年</div></div>
			  					<div class='col-md-2'><div class='form-label'>第三年</div></div>
			  				</div>
			  				<div class='form-group row'>
				  				<div class='col-md-3'><div class='form-label pull-right'>提供与中医药有关的贸易</div></div>
				  				<div class='col-md-2'><input disabled="disabled" class='form-control' name='QTFirstFirst'  type='text'/></div>
				  				<div class='col-md-2'><input disabled="disabled" class='form-control' name='QTFirstSecond' type='text'/></div>
				  				<div class='col-md-2'><input disabled="disabled" class='form-control' name='QTFirstThird'  type='text'/></div>
			  				</div>			  			
			  			</div>
			  		</div>
			  		<div class='panel'>
			  			<div class='panel-heading'>在基础条件建设、人员配置、服务特色、对外签订协议或合同、注册保险认证等方面的情况</div>
				  		<div class="panel-body">
						  <textarea disabled="disabled" rows="5" class='form-control' style='resize:none' name='point2'></textarea>
						</div>
			  		</div>
			  </div>
		  </div>
		  <div class="panel panel-primary">
		    <div class="panel-heading"><a style="text-decoration:none;color:black" data-toggle="collapse" data-parent="#parentDiv" href="#cDIV3">三、实施的经验、优势；存在的主要问题、风险及解决办法；拟突破的关键体制机制和政策障碍</a></div>
			<div class="panel-body" id="cDIV3">
			  <textarea disabled="disabled" rows="5" class='form-control' style='resize:none' name='point3'></textarea>
			</div>
		  </div>
		  <div class="panel panel-primary">
		    <div class="panel-heading"><a style="text-decoration:none;color:black" data-toggle="collapse" data-parent="#parentDiv" href="#cDIV4">四、建设目标、主要任务、实施方案</a></div>
			<div class="panel-body" id="cDIV4">
			  <textarea disabled="disabled" rows="5" class='form-control' style='resize:none' name='point4'></textarea>
			</div>
		  </div>
		  <div class="panel panel-primary">
		    <div class="panel-heading"><a style="text-decoration:none;color:black" data-toggle="collapse" data-parent="#parentDiv" href="#cDIV5">五、保障措施</a></div>
			<div class="panel-body" id="cDIV5">
			  <textarea disabled="disabled" rows="5" class='form-control' style='resize:none' name='point5'></textarea>
			</div>
		  </div>
		  <div class="panel panel-primary">
		    <div class="panel-heading"><a style="text-decoration:none;color:black" data-toggle="collapse" data-parent="#parentDiv" href="#cDIV6">六、主要考核指标</a></div>
			<div class="panel-body" id="cDIV6">
			  <textarea disabled="disabled" rows="5" class='form-control' style='resize:none' name='point6'></textarea>
			</div>
		  </div>
		  <div class="panel panel-primary">
		    <div class="panel-heading"><a style="text-decoration:none;color:black" data-toggle="collapse" data-parent="#parentDiv" href="#cDIV7">七、年度计划及年度目标</a></div>
			<div class="panel-body" id="cDIV7">
			  <textarea disabled="disabled" rows="5" class='form-control' style='resize:none' name='point7'></textarea>
			</div>
		  </div>
		  <div class="panel panel-primary">
		    <div class="panel-heading"><a style="text-decoration:none;color:black" data-toggle="collapse" data-parent="#parentDiv" href="#cDIV8">八、 预期成果及经济、社会效益分析</a></div>
			<div class="panel-body" id="cDIV8">
			  <textarea disabled="disabled" rows="5" class='form-control' style='resize:none' name='point8'></textarea>
			</div>
		  </div>
		</div>
		<input type='hidden' name='userId'/>
		<input type='hidden' name='projectId'/>
		<div class='form-group row pull-right' style="position: absolute; left: 50%;margin-left: -56px;">
			<button class='btn btn-info' onclick='subForm()' style="background:#515453;border-color:#515453;">确定</button>
			<button class='btn btn-info' onclick='toggle("approveAddAndEdit","approveMain")' style="background:#515453;border-color:#515453;">取消</button>
		</div>
	</form>
</div>
</body>
<script>
$(function(){
	$('#usersTable').bootstrapTable({
		columns:[
			{field:'projectName',title:'项目名称'},
			{field:'projectType',title:'项目类型',formatter:function(value,row,index){
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
				}
			}},
			{field:'endTime',title:'截止邮箱',formatter:function(value,row,index){return value;}},
			{field:'status',title:'审批状态',formatter:function(value,row,index){
				switch(value){
				case 1:
					return '等待省级审批';
				case 2:
					return '省级审批不通过';
				case 3:
					return '等待国家审批';
				case 4:
					return '国家审批不通过';
				case 5:
					return '项目通过';
				}
			}},
			{field:'',title:'操作',formatter:function(value,row,index){
				return '<button class="btn btn-sm btn-info" onclick="showInfo(\''+row.userId+'\',\''+row.projectId+'\');" style="background:#39aa7f;border-color:#39aa7f;">查看/审核</button>';	
			}},
		],//列参数
		url:'<%=request.getContextPath()%>/userProjects.php?go=ajaxListAll',//请求数据的URL
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
		pageSize:2,//每页条数
		pageList:[20,50,100,200],//可选每页数据条数
		clickToSelect:true,//点击行勾选行的CheckBox或radio
		singleSelect:false,//启用行单选
		height:500,
		striped:true,
		checkbox:true,//启用复选框
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
};
showInfo=function(userId,projectId){
	toggle("userMain","userAddAndEdit");
	$.post('<%=request.getContextPath()%>/userProjects.php',{go:'getInfo',userId:userId,projectId:projectId},function(data){
		data=JSON.parse(data);
		for(var x in data){
			$('#approveForm input[name="'+x+'"],select[name="'+x+'"]').val(data[x]);
			$('#approveForm textarea[name="'+x+'"]').empty().append(data[x]);
		}
		
		var type=data.type;
		index=parseInt(type)-1;
		$('div.projectTypeToggle').hide();
		$('div.projectTypeToggle:eq('+index+')').show();
		$("#approveForm input[name='userId']").val(userId);
		$("#approveForm input[name='projectId']").val(projectId);
		
	});
};
exp=function(){
	var userId=$("#approveForm input[name='userId']").val();
	var projectId=$("#approveForm input[name='projectId']").val();
	window.location.href='<%=request.getContextPath()%>/userProjects.php?go=export&userId='+userId+'&projectId='+projectId;
}
</script>
</html>