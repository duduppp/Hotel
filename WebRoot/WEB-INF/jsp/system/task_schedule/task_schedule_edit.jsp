<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<base href="<%=basePath%>">
	<!-- 下拉框 -->
	<link rel="stylesheet" href="static/ace/css/chosen.css" />
	<!-- jsp文件头和头部 -->
	<%@ include file="../../system/index/top.jsp"%>
	<!-- 日期框 -->
	<link rel="stylesheet" href="static/ace/css/datepicker.css" />
</head>
<body class="no-skin">
<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
	<!-- /section:basics/sidebar -->
	<div class="main-content">
		<div class="main-content-inner">
			<div class="page-content">
				<div class="row">
					<div class="col-xs-12">
					
					<form action="task_schedule/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="TASK_SCHEDULE_ID" id="TASK_SCHEDULE_ID" value="${pd.TASK_SCHEDULE_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:95px;text-align: right;padding-top: 13px;">任务名称:</td>
								<td><input type="text" name="JOBNAME" id="JOBNAME" value="${pd.JOBNAME}" maxlength="255" placeholder="这里输入任务名称" title="任务名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">任务类Class:</td>
								<td><input type="text" name="JOBCLASS" id="JOBCLASS" value="${pd.JOBCLASS}" maxlength="255" placeholder="这里输入任务类Class" title="任务类Class" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">状态:</td>
								<td>
								    <input type="checkbox" name="checksta" id="checksta" class="ace ace-switch ace-switch-3" onchange="statusClick();" 
								    checked="checked" value="0">	<span class="lbl"></span>
									<input type="text" name="STATUS" id="STATUS" value="${pd.STATUS}" />   
								</td>
							</tr> 
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">规则说明:</td>
								<td><input type="text" name="CRONEXPRESSION" id="CRONEXPRESSION" value="${pd.CRONEXPRESSION}" maxlength="255" placeholder="这里输入规则说明" title="规则说明" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">描述:</td>
								<td><input type="text" name="DESCRIPTION" id="DESCRIPTION" value="${pd.DESCRIPTION}" maxlength="255" placeholder="这里输入描述" title="描述" style="width:98%;"/></td>
							</tr>
						</table>
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;" id="setFHTIME">设定:</td>
								<td style="text-align: right;">
									<select onchange="setTimegz(this.value,'month')">
										<option value="*">每</option>
										<option value="1">一</option>
										<option value="2">二</option>
										<option value="3">三</option>
										<option value="4">四</option>
										<option value="5">五</option>
										<option value="6">六</option>
										<option value="7">七</option>
										<option value="8">八</option>
										<option value="9">九</option>
										<option value="10">十</option>
										<option value="11">十一</option>
										<option value="12">十二</option>
									</select>
								</td>
								<td style="width:75px;text-align: left;padding-top: 13px;">月</td>
								<td style="text-align: right;">
									<select onchange="setTimegz(this.value,'week')" id="weekId">
										<option value="*">每</option>
										<option value="MON">一</option>
										<option value="TUES">二</option>
										<option value="WED">三</option>
										<option value="THUR">四</option>
										<option value="FTI">五</option>
										<option value="SAT">六</option>
										<option value="SUN">七</option>
									</select>
								</td>
								<td style="width:75px;text-align: left;padding-top: 13px;">周</td>
								<td style="text-align: right;">
									<select onchange="setTimegz(this.value,'day')" id="dayId">
										<option value="*">每</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
										<option value="7">7</option>
										<option value="8">8</option>
										<option value="9">9</option>
										<option value="10">10</option>
										<option value="11">11</option>
										<option value="12">12</option>
										<option value="13">13</option>
										<option value="14">14</option>
										<option value="15">15</option>
										<option value="16">16</option>
										<option value="17">17</option>
										<option value="18">18</option>
										<option value="19">19</option>
										<option value="20">20</option>
										<option value="21">21</option>
										<option value="22">22</option>
										<option value="23">23</option>
										<option value="24">24</option>
										<option value="25">25</option>
										<option value="26">26</option>
										<option value="27">27</option>
										<option value="28">28</option>
									</select>
								</td>
								<td style="width:75px;text-align: left;padding-top: 13px;">日</td>
								<td style="text-align: right;">
									<select onchange="setTimegz(this.value,'hour')">
										<option value="*">每</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
										<option value="7">7</option>
										<option value="8">8</option>
										<option value="9">9</option>
										<option value="10">10</option>
										<option value="11">11</option>
										<option value="12">12</option>
										<option value="13">13</option>
										<option value="14">14</option>
										<option value="15">15</option>
										<option value="16">16</option>
										<option value="17">17</option>
										<option value="18">18</option>
										<option value="19">19</option>
										<option value="20">20</option>
										<option value="21">21</option>
										<option value="22">22</option>
										<option value="23">23</option>
										<option value="24">24</option>
									</select>
								</td>
								<td style="width:75px;text-align: left;padding-top: 13px;">时</td>
							</tr>
							<tr>
								<td colspan="10" class="center"><b>规则说明</b></td>
							</tr>
							<tr>
								<td colspan="10">
								<input type="text" class="center" name="CRONEXPRESSION_EXPLAIN" id="CRONEXPRESSION_EXPLAIN" value="${pd.CRONEXPRESSION_EXPLAIN}" maxlength="100" placeholder="这里是规则说明" title="规则说明" style="width:100%;" readonly="readonly"/></td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
								</td>
							</tr>
						</table>
						</div>
						<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
					</form>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.page-content -->
		</div>
	</div>
	<!-- /.main-content -->
</div>
<!-- /.main-container -->


	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		
		var hour = "*";
		var day = "*";
		var week = "*";
		var month = "*";
		//设置时间规则
		function setTimegz(value,type){
			if('hour' == type){
				hour = value;
			}else if('day' == type){
				day = value;
			}else if('week' == type){
				week = value;
			}else{
				month = value;
			}
			var strM = "";
			var strW = "";
			var strD = "";
			var strH = "";
			if("*" == month){
				strM = "每个月";
			}else{
				strM = "每年 "+month + " 月份";
			}
			if("?" != week){
				if("*" == week){
					strW = "每周";
					strD = "每天";
					$("#dayId").removeAttr("disabled");  
					$("#dayId").css("background","#FFFFFF");
				}else{
					$("#dayId").attr("disabled","disabled"); 
					$("#dayId").css("background","#F5F5F5");
					day = "?";
					strD = "";
					strW = "每个星期"+getWeek(week);
				}
			}
			if("?" != day){
				if("*" == day){
					strD = "每天";
					strW = "每周";
					$("#weekId").removeAttr("disabled");
					$("#weekId").css("background","#FFFFFF");
				}else{
					$("#weekId").attr("disabled","disabled"); 
					$("#weekId").css("background","#F5F5F5");
					week = "?";
					strW = "";
					strD = day + "号";
				}
			}
			if("*" == hour){
				strH = "每小时";
			}else{
				strH = hour + "点时";
			}
			if("*" == day && "*" == week){
				day = "*";
				week = "?";
			}
			$("#CRONEXPRESSION").val("0 0 "+hour + " " + day + " " + month + " " + week);
			$("#CRONEXPRESSION_EXPLAIN").val(strM+"的 "+strW+" "+strD+" "+strH+"执行一次");
		}
		
		//获取星期汉字
		function getWeek(value){
			var arrW = new Array("MON","TUES","WED","THUR","FTI","SAT","SUN");
			var arrH = new Array("一","二","三","四","五","六","日");
			for(var i=0;i<arrW.length;i++){
				if(value == arrW[i]) return arrH[i];
			}
		}
		//保存
		function save(){
		 
		 
			if($("#ALIASNAME").val()==""){
				$("#ALIASNAME").tips({
					side:3,
		            msg:'请输入任务别名',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ALIASNAME").focus();
			return false;
			}
			if($("#JOBCLASS").val()==""){
				$("#JOBCLASS").tips({
					side:3,
		            msg:'请输入任务类Class',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#JOBCLASS").focus();
			return false;
			}
		 
			if($("#CRONEXPRESSION").val()==""){
				$("#CRONEXPRESSION").tips({
					side:3,
		            msg:'请输入规则说明',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CRONEXPRESSION").focus();
			return false;
			}
			 
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		/**
		*checkbox 事件 
		*/
		function statusClick(){
			
			if($("#checksta").is(':checked')){
				 $("#checksta").attr("value",1); 
				 $("#STATUS").attr("value",1);
			}else{
				 $("#checksta").attr("value",0); 
				 $("#STATUS").attr("value",0);
			}
		}
		
		
		$(function() {
			
			var STATUS="${pd.STATUS}";
			if(STATUS==1){
				$("#checksta").attr("checked","checked"); 
				 	$("#STATUS").attr("value",1);
			}else{
				$("#checksta").removeAttr('checked');
		 		$("#STATUS").attr("value",0); 
			}
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		</script>
</body>
</html>