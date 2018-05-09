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
					
					<form action="usergrade/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="USERGRADE_ID" id="USERGRADE_ID" value="${pd.USERGRADE_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">会员等级:</td>
								<td><input type="text" name="NAME" id="NAME" value="${pd.NAME}" maxlength="255" placeholder="这里输入会员等级" title="会员等级" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">折扣:</td>
								<td><input type="text" name="DISCOUNT" id="DISCOUNT" value="${pd.DISCOUNT}" maxlength="255" placeholder="这里输入折扣" title="折扣" style="width:90%;"/>%</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">升级积分:</td>
								<td><input type="number" name="UPGRADEINTEGRAL" id="UPGRADEINTEGRAL" value="${pd.UPGRADEINTEGRAL}" maxlength="32" placeholder="这里输入升级积分" title="升级积分" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">参与积分:</td>
								<td>
								    <label style="float:left;padding-left: 8px;padding-top:7px;">
							           <input name="PARTAKEINTEGRAL" type="radio" value="是" checked="checked" class="ace" id="PARTAKEINTEGRAL">	<span class="lbl">是</span>
							   	    </label>
							        <label style="float:left;padding-left: 5px;padding-top:7px;">
							           <input name="PARTAKEINTEGRAL" type="radio" class="ace" value="否" id="PARTAKEINTEGRAL">	<span class="lbl">否</span>
							    	</label>
							   </td> 
							</tr> 
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注:</td>
								<td><input type="text" name="REMARK" id="REMARK" value="${pd.REMARK}" maxlength="255" placeholder="这里输入备注" title="备注" style="width:98%;"/></td>
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
		//保存
		function save(){
			
			if($("#NAME").val()==""){
				$("#NAME").tips({
					side:3,
		            msg:'请输入会员等级',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#NAME").focus();
			 return false; 
			}
			if($("#DISCOUNT").val()==""){
				$("#DISCOUNT").tips({
					side:3,
		            msg:'请输入折扣',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#DISCOUNT").focus();
			 return false;
			}
			if($("#UPGRADEINTEGRAL").val()==""){
				$("#UPGRADEINTEGRAL").tips({
					side:3,
		            msg:'请输入升级积分',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#UPGRADEINTEGRAL").focus();
			 return false;
			}
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		$(function() {
			
			var partakintegral='${pd.PARTAKEINTEGRAL}';
			var   upgradeintegral='${pd.UPGRADEINTEGRAL}';
			if(upgradeintegral==""){
				$("#UPGRADEINTEGRAL").val(0);
			}
			
			$("input:radio[name='PARTAKEINTEGRAL'][value="+partakintegral+"]").attr("checked",true);
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		</script>
</body>
</html>