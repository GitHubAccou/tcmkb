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

</style>
</head>
<body>
<div id='errorMsg' class="alert alert-danger with-icon">
  <i class="icon-ok-sign"></i>
  <div class="content"></div>
</div>
<div id="reportAddAndEdit"  style='display:none;'>
	<h3>申报项目<a class='pull-right' href='<%=request.getContextPath()%>/projects.php?go=downNoticeFile&fn=notice.doc'><span class='icon icon-file-word' style='color:#8d0707'>填报说明下载</span></a></h3>
	<form id='projectForm'>
		<div class="panel-group" id="parentDiv">
		  <div class="panel panel-primary">
			  <div class="panel-heading"><a style="text-decoration:none;color:black" data-toggle="collapse" data-parent="#parentDiv" href="#cDIV1">一、项目申报基本情况</a></div>
			  <div class="panel-body" id="cDIV1">
			  		<div class='form-group row'>
						<div class='col-md-2'>
							<label class='form-label pull-right'>项目名称</label>
						</div>
						<div class='col-md-5'>
							<select id="projectId" class='form-control' name="projectId" onchange='togglePanel();'></select>
						</div>
						<div class='col-md-2'>
							<label class='Validform_checktip'></label>
						</div>
					</div>
					<div class='form-group row'>
						<div class='col-md-2'>
							<label class='form-label pull-right'>服务模式</label>
						</div>
						<div class='col-md-5'>
							<select class='form-control' name='serviceType'>
								<option value='1'>跨境支付</option>
								<option value='2'>境外消费</option>
								<option value='3'>商业存在</option>
								<option value='4	'>自然人移动</option>
							</select>
						</div>
						<div class='col-md-2'>
							<label class='Validform_checktip'></label>
						</div>
					</div>
					<div class='form-group row'>
						<div class='col-md-2'>
							<label class='form-label pull-right'>主要国家和地区</label>
						</div>
						<div class='col-md-5'>
							<input class='form-control' type='text' name='mainCountry'/>
						</div>
						<div class='col-md-2'>
							<label class='Validform_checktip'></label>
						</div>
					</div>
					<div class='form-group row'>
						<div class='col-md-2'>
							<label class='form-label pull-right'>其他参加单位(以逗号分隔)</label>
						</div>
						<div class='col-md-5'>
							<input class='form-control' type='text' name='others'/>
						</div>
						<div class='col-md-2'>
							<label class='Validform_checktip'></label>
						</div>
					</div>		
					<div class='form-group row'>
						<div class='col-md-2'>
							<label class='form-label pull-right'>项目负责人姓名</label>
						</div>
						<div class='col-md-5'>
							<input class='form-control' type='text' name='managerName'/>
						</div>
						<div class='col-md-2'>
							<label class='Validform_checktip'></label>
						</div>
					</div>		
					<div class='form-group row'>
						<div class='col-md-2'>
							<label class='form-label pull-right'>项目负责人职位</label>
						</div>
						<div class='col-md-5'>
							<input class='form-control' type='text' name='managerPosition'/>
						</div>
						<div class='col-md-2'>
							<label class='Validform_checktip'></label>
						</div>
					</div>		
					<div class='form-group row'>
						<div class='col-md-2'>
							<label class='form-label pull-right'>项目负责人单位</label>
						</div>
						<div class='col-md-5'>
							<input class='form-control' type='text' name='managerCompany'/>
						</div>
						<div class='col-md-2'>
							<label class='Validform_checktip'></label>
						</div>
					</div>		
					<div class='form-group row'>
						<div class='col-md-2'>
							<label class='form-label pull-right'>项目负责人电话</label>
						</div>
						<div class='col-md-5'>
							<input class='form-control' type='text' name='managerPhone'/>
						</div>
						<div class='col-md-2'>
							<label class='Validform_checktip'></label>
						</div>
					</div>		
					<div class='form-group row'>
						<div class='col-md-2'>
							<label class='form-label pull-right'>项目负责人邮箱</label>
						</div>
						<div class='col-md-5'>
							<input class='form-control' type='text' name='managerEmail'/>
						</div>
						<div class='col-md-2'>
							<label class='Validform_checktip'></label>
						</div>
					</div>		
					<div class='form-group row'>
						<div class='col-md-2'>
							<label class='form-label pull-right'>参加项目人数</label>
						</div>
						<div class='col-md-5'>
							<input class='form-control' type='text' name='total'/>
						</div>
						<div class='col-md-2'>
							<label class='Validform_checktip'></label>
						</div>
					</div>		
					<div class='form-group row'>
						<div class='col-md-2'>
							<label class='form-label pull-right'>精通外语人数</label>
						</div>
						<div class='col-md-5'>
							<input class='form-control' type='text' name='englishTotal'/>
						</div>
						<div class='col-md-2'>
							<label class='Validform_checktip'></label>
						</div>
					</div>		
			  </div>
		  </div>
		  <div class="panel panel-primary">
		    <div class="panel-heading"><a style="text-decoration:none;color:black;" data-toggle="collapse" data-parent="#parentDiv" href="#cDIV2">二、工作基础(提供近三年服务量，服务金额(以美元为单位)等信息)</a></div>
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
				  				<div class='col-md-3'><input class='form-control' type='text' name='BJFirstFirstPerson' style='width:35%;display:inline'/>人次<input class='form-control'   name='BJFirstFirstMoney=' type='text' style='width:35%;display:inline'/>万元</div>
				  				<div class='col-md-3'><input class='form-control' type='text' name='BJFirstSecondPerson'  style='width:35%;display:inline'/>人次<input class='form-control' name='BJFirstSecondMoney' type='text' style='width:35%;display:inline'/>万元</div>
				  				<div class='col-md-3'><input class='form-control' type='text' name='BJFirstThirdPerson'  style='width:35%;display:inline'/>人次<input class='form-control'  name='BJFirstThirdMoney' type='text' style='width:35%;display:inline'/>万元</div>
			  				</div>
			  				<div class='form-group row'>
				  				<div class='col-md-3'><div class='form-label pull-right'>在国外接待境内患者就诊</div></div>
				  				<div class='col-md-3'><input class='form-control' type='text' name='BJSecondFirstPerson'  style='width:35%;display:inline'/>人次<input class='form-control' name='BJSecondFirstMoney'  type='text' style='width:35%;display:inline'/>万元</div>
				  				<div class='col-md-3'><input class='form-control' type='text' name='BJSecondSecondPerson' style='width:35%;display:inline'/>人次<input class='form-control' name='BJSecondSecondMoney' type='text' style='width:35%;display:inline'/>万元</div>
				  				<div class='col-md-3'><input class='form-control' type='text' name='BJSecondThirdPerson'  style='width:35%;display:inline'/>人次<input class='form-control' name='BJSecondThirdMoney'  type='text' style='width:35%;display:inline'/>万元</div>
			  				</div>
			  				<div class='form-group row'>
				  				<div class='col-md-3'><div class='form-label pull-right'>在国内为境外提供远程就诊</div></div>
				  				<div class='col-md-3'><input class='form-control' type='text' name='BJThirdFirstPerson'  style='width:35%;display:inline'/>人次<input class='form-control' name='BJThirdFirstMoney'  type='text' style='width:35%;display:inline'/>万元</div>
				  				<div class='col-md-3'><input class='form-control' type='text' name='BJThirdSecondPerson' style='width:35%;display:inline'/>人次<input class='form-control' name='BJThirdSecondMoney' type='text' style='width:35%;display:inline'/>万元</div>
				  				<div class='col-md-3'><input class='form-control' type='text' name='BJThirdThirdPerson'  style='width:35%;display:inline'/>人次<input class='form-control' name='BJThirdThirdMoney'  type='text' style='width:35%;display:inline'/>万元</div>
			  				</div>
			  				<div class='form-group row'>
				  				<div class='col-md-3'><div class='form-label pull-right'>其他</div></div>
				  				<div class='col-md-3'><input class='form-control' type='text' name='BJFourthFirstPerson'  style='width:35%;display:inline'/>人次<input class='form-control' name='BJFourthFirstMoney'  type='text' style='width:35%;display:inline'/>万元</div>
				  				<div class='col-md-3'><input class='form-control' type='text' name='BJFourthSecondPerson' style='width:35%;display:inline'/>人次<input class='form-control' name='BJFourthSecondMoney' type='text' style='width:35%;display:inline'/>万元</div>
				  				<div class='col-md-3'><input class='form-control' type='text' name='BJFourthThirdPerson'  style='width:35%;display:inline'/>人次<input class='form-control' name='BJFourthThirdMoney'  type='text' style='width:35%;display:inline'/>万元</div>
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
				  				<div class='col-md-3'><input class='form-control' type='text' name='PXFirstFirstPerson'  style='width:35%;display:inline'/>人<input class='form-control' name='PXFirstFirstMoney'  type='text' style='width:35%;display:inline'/>万元</div>
				  				<div class='col-md-3'><input class='form-control' type='text' name='PXFirstSecondPerson' style='width:35%;display:inline'/>人<input class='form-control' name='PXFirstSecondMoney' type='text' style='width:35%;display:inline'/>万元</div>
				  				<div class='col-md-3'><input class='form-control' type='text' name='PXFirstThirdPerson'  style='width:35%;display:inline'/>人<input class='form-control' name='PXFirstThirdMoney'  type='text' style='width:35%;display:inline'/>万元</div>
			  				</div>
			  				<div class='form-group row'>
				  				<div class='col-md-3'><div class='form-label pull-right'>在国内接待国外留学生短期培训</div></div>
				  				<div class='col-md-3'><input class='form-control' type='text' name='PXSecondFirstPerson'  style='width:35%;display:inline'/>人<input class='form-control' name='PXSecondFirstMoney'  type='text' style='width:35%;display:inline'/>万元</div>
				  				<div class='col-md-3'><input class='form-control' type='text' name='PXSecondSecondPerson' style='width:35%;display:inline'/>人<input class='form-control' name='PXSecondSecondMoney' type='text' style='width:35%;display:inline'/>万元</div>
				  				<div class='col-md-3'><input class='form-control' type='text' name='PXSecondThirdPerson'  style='width:35%;display:inline'/>人<input class='form-control' name='PXSecondThirdMoney'  type='text' style='width:35%;display:inline'/>万元</div>
			  				</div>
			  				<div class='form-group row'>
				  				<div class='col-md-3'><div class='form-label pull-right'>在国外招生留学生学历教育</div></div>
				  				<div class='col-md-3'><input class='form-control' name='PXThirdFirstPerson'  type='text' style='width:35%;display:inline'/>人<input class='form-control' name='PXThirdFirstMoney'  type='text' style='width:35%;display:inline'/>万元</div>
				  				<div class='col-md-3'><input class='form-control' name='PXThirdSecondPerson' type='text' style='width:35%;display:inline'/>人<input class='form-control' name='PXThirdSecondMoney' type='text' style='width:35%;display:inline'/>万元</div>
				  				<div class='col-md-3'><input class='form-control' name='PXThirdThirdPerson'  type='text' style='width:35%;display:inline'/>人<input class='form-control' name='PXThirdThirdMoney'  type='text' style='width:35%;display:inline'/>万元</div>
			  				</div>
			  				<div class='form-group row'>
				  				<div class='col-md-3'><div class='form-label pull-right'>在国外接待国外留学生短期培训</div></div>
				  				<div class='col-md-3'><input class='form-control' name='PXFourthFirstPerson'  type='text' style='width:35%;display:inline'/>人<input class='form-control' name='PXFourthFirstMoney'  type='text' style='width:35%;display:inline'/>万元</div>
				  				<div class='col-md-3'><input class='form-control' name='PXFourthSecondPerson' type='text' style='width:35%;display:inline'/>人<input class='form-control' name='PXFourthSecondMoney' type='text' style='width:35%;display:inline'/>万元</div>
				  				<div class='col-md-3'><input class='form-control' name='PXFourthThirdPerson'  type='text' style='width:35%;display:inline'/>人<input class='form-control' name='PXFourthThirdMoney'  type='text' style='width:35%;display:inline'/>万元</div>
			  				</div>
			  				<div class='form-group row'>
				  				<div class='col-md-3'><div class='form-label pull-right'>其他</div></div>
				  				<div class='col-md-3'><input class='form-control' name='PXFifthFirstPerson'  type='text' style='width:35%;display:inline'/>人<input class='form-control' name='PXFifthFirstMoney'  type='text' style='width:35%;display:inline'/>万元</div>
				  				<div class='col-md-3'><input class='form-control' name='PXFifthSecondPerson' type='text' style='width:35%;display:inline'/>人<input class='form-control' name='PXFifthSecondMoney' type='text' style='width:35%;display:inline'/>万元</div>
				  				<div class='col-md-3'><input class='form-control' name='PXFifthThirdPerson'  type='text' style='width:35%;display:inline'/>人<input class='form-control' name='PXFifthThirdMoney'  type='text' style='width:35%;display:inline'/>万元</div>
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
				  				<div class='col-md-2'><input class='form-control' name='KYFirstFirst'  type='text'/></div>
				  				<div class='col-md-2'><input class='form-control' name='KYFirstSecond' type='text'/></div>
				  				<div class='col-md-2'><input class='form-control' name='KYFirstThird'  type='text'/></div>
			  				</div>
			  				<div class='form-group row'>
				  				<div class='col-md-3'><div class='form-label pull-right'>向境外转让技术</div></div>
				  				<div class='col-md-2'><input class='form-control' name='KYSecondFirst'  type='text'/></div>
				  				<div class='col-md-2'><input class='form-control' name='KYSecondSecond' type='text'/></div>
				  				<div class='col-md-2'><input class='form-control' name='KYSecondThird'  type='text'/></div>
			  				</div>
			  				<div class='form-group row'>
				  				<div class='col-md-3'><div class='form-label pull-right'>向境外提供咨询服务</div></div>
				  				<div class='col-md-2'><input class='form-control' name='KYThirdFirst'  type='text'/></div>
				  				<div class='col-md-2'><input class='form-control' name='KYThirdSecond' type='text'/></div>
				  				<div class='col-md-2'><input class='form-control' name='KYThirdThird'  type='text'/></div>
			  				</div>
			  				<div class='form-group row'>
				  				<div class='col-md-3'><div class='form-label pull-right'>其他</div></div>
				  				<div class='col-md-2'><input class='form-control' name='KYFourthFirst'  type='text'/></div>
				  				<div class='col-md-2'><input class='form-control' name='KYFourthSecond' type='text'/></div>
				  				<div class='col-md-2'><input class='form-control' name='KYFourthThird'  type='text'/></div>
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
				  				<div class='col-md-2'><input class='form-control' name='CYFirstFirst'  type='text'/></div>
				  				<div class='col-md-2'><input class='form-control' name='CYFirstSecond' type='text'/></div>
				  				<div class='col-md-2'><input class='form-control' name='CYFirstThird'  type='text'/></div>
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
				  				<div class='col-md-2'><input class='form-control' name='WHFirstFirst'  type='text'/></div>
				  				<div class='col-md-2'><input class='form-control' name='WHFirstSecond' type='text'/></div>
				  				<div class='col-md-2'><input class='form-control' name='WHFirstThird'  type='text'/></div>
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
				  				<div class='col-md-2'><input class='form-control' name='QTFirstFirst'  type='text'/></div>
				  				<div class='col-md-2'><input class='form-control' name='QTFirstSecond' type='text'/></div>
				  				<div class='col-md-2'><input class='form-control' name='QTFirstThird'  type='text'/></div>
			  				</div>			  			
			  			</div>
			  		</div>
			  		<div class='panel'>
			  			<div class='panel-heading'>在基础条件建设、人员配置、服务特色、对外签订协议或合同、注册保险认证等方面的情况</div>
				  		<div class="panel-body">
						  <textarea rows="5" class='form-control' style='resize:none' name='point2'></textarea>
						</div>
			  		</div>
			  </div>
		  </div>
		  <div class="panel panel-primary">
		    <div class="panel-heading"><a style="text-decoration:none;color:black" data-toggle="collapse" data-parent="#parentDiv" href="#cDIV3">三、实施的经验、优势；存在的主要问题、风险及解决办法；拟突破的关键体制机制和政策障碍</a></div>
			<div class="panel-body" id="cDIV3">
			  <textarea rows="5" class='form-control' style='resize:none' name='point3'></textarea>
			</div>
		  </div>
		  <div class="panel panel-primary">
		    <div class="panel-heading"><a style="text-decoration:none;color:black" data-toggle="collapse" data-parent="#parentDiv" href="#cDIV4">四、建设目标、主要任务、实施方案</a></div>
			<div class="panel-body" id="cDIV4">
			  <textarea rows="5" class='form-control' style='resize:none' name='point4'></textarea>
			</div>
		  </div>
		  <div class="panel panel-primary">
		    <div class="panel-heading"><a style="text-decoration:none;color:black" data-toggle="collapse" data-parent="#parentDiv" href="#cDIV5">五、保障措施</a></div>
			<div class="panel-body" id="cDIV5">
			  <textarea rows="5" class='form-control' style='resize:none' name='point5'></textarea>
			</div>
		  </div>
		  <div class="panel panel-primary">
		    <div class="panel-heading"><a style="text-decoration:none;color:black" data-toggle="collapse" data-parent="#parentDiv" href="#cDIV6">六、主要考核指标</a></div>
			<div class="panel-body" id="cDIV6">
			  <textarea rows="5" class='form-control' style='resize:none' name='point6'></textarea>
			</div>
		  </div>
		  <div class="panel panel-primary">
		    <div class="panel-heading"><a style="text-decoration:none;color:black" data-toggle="collapse" data-parent="#parentDiv" href="#cDIV7">七、年度计划及年度目标</a></div>
			<div class="panel-body" id="cDIV7">
			  <textarea rows="5" class='form-control' style='resize:none' name='point7'></textarea>
			</div>
		  </div>
		  <div class="panel panel-primary">
		    <div class="panel-heading"><a style="text-decoration:none;color:black" data-toggle="collapse" data-parent="#parentDiv" href="#cDIV8">八、 预期成果及经济、社会效益分析</a></div>
			<div class="panel-body" id="cDIV8">
			  <textarea rows="5" class='form-control' style='resize:none' name='point8'></textarea>
			</div>
		  </div>
		</div>
		<div class='form-group row pull-right' style="position: absolute; left: 50%;margin-left: -56px;">
			<button class='btn btn-info' onclick='subForm("projectForm")' style="background:#515453;border-color:#515453;">确定</button>
			<button class='btn btn-info' onclick='toggle("userAddAndEdit","userMain")'  style="background:#515453;border-color:#515453;">取消</button>
		</div>
	</form>
</div>
</body>
<script>
$(function(){
	$.post('<%=request.getContextPath()%>/projects.php',{go:"chkReport"},function(data){
		data=JSON.parse(data);
		if(data.success){
			$('#errorMsg').hide();
			$('#reportAddAndEdit').show();
			loadProject();
		}else{
			$('#errorMsg div.content').empty().append(data.msg);
		}
	});
});
validForm=$('#userForm').Validform({
	tiptype:2,
	tipSweep:false
});
subForm=function(id){
	var arr=$('#'+id).serializeArray();
	var params=formatParams(arr,';');
	params.go="report";
	$.post('<%=request.getContextPath()%>/projects.php',params,function(data){
	})
}
loadProject=function(){
	$.post('<%=request.getContextPath()%>/projects.php',{go:"getAvailableProjects"},function(data){
		data=JSON.parse(data);
		$('#projectId').empty();
		for(var x in data){
			$('#projectId').append('<option value="'+data[x].id+'" data-type='+data[x].type+'>'+data[x].name+'</option>');
		}
		togglePanel();
	});
}
togglePanel=function(){
	var type=$('#projectId option:selected')[0].dataset.type;
	index=parseInt(type)-1;
	$('div.projectTypeToggle').hide();
	$('div.projectTypeToggle:eq('+index+')').show();
}
</script>
</html>