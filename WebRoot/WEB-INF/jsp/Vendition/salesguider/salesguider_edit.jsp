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
					
					<form action="salesguider/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="SALESGUIDER_ID" id="SALESGUIDER_ID" value="${pd.SALESGUIDER_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">编号:</td>
								<td><input type="text" name="NO" id="NO" value="${pd.NO}" maxlength="255" placeholder="这里输入编号" title="编号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">姓名:</td>
								<td><input type="text" name="NAME" id="NAME" value="${pd.NAME}" maxlength="255" placeholder="这里输入姓名" title="姓名" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">累计销售额:</td>
								<td><input type="number" name="CUMULATIVESALE" id="CUMULATIVESALE" value="${pd.CUMULATIVESALE}" maxlength="32" placeholder="这里输入累计销售额" title="累计销售额" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">本月销售额:</td>
								<td><input type="number" name="MONTHSALE" id="MONTHSALE" value="${pd.MONTHSALE}" maxlength="32" placeholder="这里输入本月销售额" title="本月销售额" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">提成:</td>
								<td><input type="number" name="EXTRACT" id="EXTRACT" value="${pd.EXTRACT}" maxlength="32" placeholder="这里输入提成" title="提成" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">销售数量:</td>
								<td><input type="number" name="SALEVOLUMES" id="SALEVOLUMES" value="${pd.SALEVOLUMES}" maxlength="32" placeholder="这里输入销售数量" title="销售数量" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">提成/件:</td>
								<td><input type="number" name="EXTRACT_PIECE" id="EXTRACT_PIECE" value="${pd.EXTRACT_PIECE}" maxlength="32" placeholder="这里输入提成/件" title="提成/件" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">本月提成:</td>
								<td><input type="number" name="MONTH_EXTRACT" id="MONTH_EXTRACT" value="${pd.MONTH_EXTRACT}" maxlength="32" placeholder="这里输入本月提成" title="本月提成" style="width:98%;"/></td>
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
			if($("#NO").val()==""){
				$("#NO").tips({
					side:3,
		            msg:'请输入编号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#NO").focus();
			return false;
			}
			if($("#NAME").val()==""){
				$("#NAME").tips({
					side:3,
		            msg:'请输入姓名',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#NAME").focus();
			return false;
			}
			if($("#CUMULATIVESALE").val()==""){
				$("#CUMULATIVESALE").tips({
					side:3,
		            msg:'请输入累计销售额',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CUMULATIVESALE").focus();
			return false;
			}
			if($("#MONTHSALE").val()==""){
				$("#MONTHSALE").tips({
					side:3,
		            msg:'请输入本月销售额',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MONTHSALE").focus();
			return false;
			}
			if($("#EXTRACT").val()==""){
				$("#EXTRACT").tips({
					side:3,
		            msg:'请输入提成',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#EXTRACT").focus();
			return false;
			}
			if($("#SALEVOLUMES").val()==""){
				$("#SALEVOLUMES").tips({
					side:3,
		            msg:'请输入销售数量',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SALEVOLUMES").focus();
			return false;
			}
			if($("#EXTRACT_PIECE").val()==""){
				$("#EXTRACT_PIECE").tips({
					side:3,
		            msg:'请输入提成/件',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#EXTRACT_PIECE").focus();
			return false;
			}
			if($("#MONTH_EXTRACT").val()==""){
				$("#MONTH_EXTRACT").tips({
					side:3,
		            msg:'请输入本月提成',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MONTH_EXTRACT").focus();
			return false;
			}
			if($("#REMARK").val()==""){
				$("#REMARK").tips({
					side:3,
		            msg:'请输入备注',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#REMARK").focus();
			return false;
			}
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		</script>
</body>
</html>