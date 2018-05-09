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
					
					<form action="statistics/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="STATISTICS_ID" id="STATISTICS_ID" value="${pd.STATISTICS_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">数量:</td>
								<td><input type="number" name="BROWSE_NUM" id="BROWSE_NUM" value="${pd.BROWSE_NUM}" maxlength="32" placeholder="这里输入数量" title="数量" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注:</td>
								<td><input type="text" name="REMOVE" id="REMOVE" value="${pd.REMOVE}" maxlength="255" placeholder="这里输入备注" title="备注" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">时间:</td>
								<td><input class="span10 date-picker" name="END_TIME" id="END_TIME" value="${pd.END_TIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="时间" title="时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注:</td>
								<td><input type="text" name="REMARK" id="REMARK" value="${pd.REMARK}" maxlength="255" placeholder="这里输入备注" title="备注" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">父类型编号:</td>
								<td><input type="text" name="TYPE_PARENT_ID" id="TYPE_PARENT_ID" value="${pd.TYPE_PARENT_ID}" maxlength="255" placeholder="这里输入父类型编号" title="父类型编号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">子类型id:</td>
								<td><input type="text" name="TYPE_SUB_ID" id="TYPE_SUB_ID" value="${pd.TYPE_SUB_ID}" maxlength="255" placeholder="这里输入子类型id" title="子类型id" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">孙子类型id:</td>
								<td><input type="text" name="TYPE_SUN_ID" id="TYPE_SUN_ID" value="${pd.TYPE_SUN_ID}" maxlength="255" placeholder="这里输入孙子类型id" title="孙子类型id" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">大类名称:</td>
								<td><input type="text" name="TYPE_PARENT_NAME" id="TYPE_PARENT_NAME" value="${pd.TYPE_PARENT_NAME}" maxlength="255" placeholder="这里输入大类名称" title="大类名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">子类名称:</td>
								<td><input type="text" name="TYPE_SUB_NAME" id="TYPE_SUB_NAME" value="${pd.TYPE_SUB_NAME}" maxlength="255" placeholder="这里输入子类名称" title="子类名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">孙子类名称:</td>
								<td><input type="text" name="TYPE_SUN_NAME" id="TYPE_SUN_NAME" value="${pd.TYPE_SUN_NAME}" maxlength="255" placeholder="这里输入孙子类名称" title="孙子类名称" style="width:98%;"/></td>
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
			if($("#BROWSE_NUM").val()==""){
				$("#BROWSE_NUM").tips({
					side:3,
		            msg:'请输入数量',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#BROWSE_NUM").focus();
			return false;
			}
			if($("#REMOVE").val()==""){
				$("#REMOVE").tips({
					side:3,
		            msg:'请输入备注',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#REMOVE").focus();
			return false;
			}
			if($("#END_TIME").val()==""){
				$("#END_TIME").tips({
					side:3,
		            msg:'请输入时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#END_TIME").focus();
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
			if($("#TYPE_PARENT_ID").val()==""){
				$("#TYPE_PARENT_ID").tips({
					side:3,
		            msg:'请输入父类型编号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TYPE_PARENT_ID").focus();
			return false;
			}
			if($("#TYPE_SUB_ID").val()==""){
				$("#TYPE_SUB_ID").tips({
					side:3,
		            msg:'请输入子类型id',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TYPE_SUB_ID").focus();
			return false;
			}
			if($("#TYPE_SUN_ID").val()==""){
				$("#TYPE_SUN_ID").tips({
					side:3,
		            msg:'请输入孙子类型id',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TYPE_SUN_ID").focus();
			return false;
			}
			if($("#TYPE_PARENT_NAME").val()==""){
				$("#TYPE_PARENT_NAME").tips({
					side:3,
		            msg:'请输入大类名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TYPE_PARENT_NAME").focus();
			return false;
			}
			if($("#TYPE_SUB_NAME").val()==""){
				$("#TYPE_SUB_NAME").tips({
					side:3,
		            msg:'请输入子类名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TYPE_SUB_NAME").focus();
			return false;
			}
			if($("#TYPE_SUN_NAME").val()==""){
				$("#TYPE_SUN_NAME").tips({
					side:3,
		            msg:'请输入孙子类名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TYPE_SUN_NAME").focus();
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