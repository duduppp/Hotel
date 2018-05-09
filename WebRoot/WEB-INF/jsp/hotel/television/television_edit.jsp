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
					
					<form action="television/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="TELEVISION_ID" id="TELEVISION_ID" value="${pd.TELEVISION_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:95px;text-align: right;padding-top: 13px;">电视源地址:</td>
								<td><input type="text" name="SOURCEPATH" id="SOURCEPATH" value="${pd.SOURCEPATH}" maxlength="255" placeholder="这里输入电视源地址" title="电视源地址" style="width:95%;"/></td>
							</tr>
							<tr>
								<td style="width:95px;text-align: right;padding-top: 13px;">频道名称:</td>
								<td><input type="text" name="NAME" id="NAME" value="${pd.NAME}" maxlength="255" placeholder="这里输入频道名称" title="频道名称" style="width:95%;"/>
								<input type="hidden" name="LOGINNAME" id="LOGINNAME" value="${pd.LOGINNAME}" maxlength="255" placeholder="这里输入账户" title="账户" style="width:95%;"/>
								
								</td>
							</tr>
							 <tr>
								<td  style="width:70px;text-align: right;padding-top: 13px;" >状态 </td>
								<td>
								<label>
							        <input name="STATUS" id="STATUS" class="ace ace-switch ace-switch-3" type="checkbox"  checked="checked" value="true">	<span class="lbl"></span>
							    </label>
								</td>
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
			if($("#SOURCEPATH").val()==""){
				$("#SOURCEPATH").tips({
					side:3,
		            msg:'请输入电视源地址',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SOURCEPATH").focus();
			return false;
			}
			if($("#NAME").val()==""){
				$("#NAME").tips({
					side:3,
		            msg:'请输入频道名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#NAME").focus();
			return false;
			}
		 	
		 
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		$(function() {
			var sessionUserName='${sessionScope.sessionUser.USERNAME}'; 
			$("#LOGINNAME").val(sessionUserName);  
			var STATUS="${pd.STATUS}";
			
			if(STATUS=="true"){
				$("#STATUS").attr("checked","checked"); 
			//	$("#STATUS").attr("value","true");
			}else{
				$("#STATUS").removeAttr('checked');
			//	$("#STATUS").attr("value","0");
			}
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		</script>
</body>
</html>