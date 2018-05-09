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
					
					<form action="leave/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="LEAVE_ID" id="LEAVE_ID" value="${pd.LEAVE_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">请假日期:</td>
								<td><input class="span10 date-picker" name="LEAVEDATE" id="LEAVEDATE" value="${pd.LEAVEDATE}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="请假日期" title="请假日期" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">请假天数:</td>
								<td><input type="number" name="LEAVEDAYS" id="LEAVEDAYS" value="${pd.LEAVEDAYS}" maxlength="32" placeholder="这里输入请假天数" title="请假天数" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">请假原因:</td>
								<td><input type="text" name="LEAVEREASON" id="LEAVEREASON" value="${pd.LEAVEREASON}" maxlength="255" placeholder="这里输入请假原因" title="请假原因" style="width:98%;"/></td>
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
			if($("#LEAVEDATE").val()==""){
				$("#LEAVEDATE").tips({
					side:3,
		            msg:'请输入请假日期',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#LEAVEDATE").focus();
			return false;
			}
			if($("#LEAVEDAYS").val()==""){
				$("#LEAVEDAYS").tips({
					side:3,
		            msg:'请输入请假天数',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#LEAVEDAYS").focus();
			return false;
			}
			if($("#LEAVEREASON").val()==""){
				$("#LEAVEREASON").tips({
					side:3,
		            msg:'请输入请假原因',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#LEAVEREASON").focus();
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