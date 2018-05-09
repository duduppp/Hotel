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
					
					<form action="<%=basePath%>workflow/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="MODEL_ID" id="MODEL_ID" value="${pd.MODEL_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;"><font color="red">*</font>名称:</td>
								<td><input type="text" name="NAME" id="NAME" value="${pd.name}" maxlength="255" placeholder="这里输入ID" title="ID" style="width:98%;"/></td>
							</tr>
							<tr> 
								<td style="width:75px;text-align: right;padding-top: 13px;"><font color="red">*</font>KEY:</td>
								<td><input type="text" name="KEY" id="KEY" value="${pd.KEY}" maxlength="255" placeholder="这里输入KEY" title="KEY" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">描述:</td>
								<td><input type="text" name="DESCRIPTION" id="DESCRIPTION" value="${pd.DESCRIPTION}" maxlength="255" placeholder="这里输入描述" title="描述" style="width:98%;"/></td>
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
		 
			if($("#KEY").val()==""){
				$("#KEY").tips({
					side:3,
		            msg:'请输入KEY',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#KEY").focus();
			return false;
			}
			if($("#NAME").val()==""){
				$("#NAME").tips({
					side:3,
		            msg:'请输入名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#NAME").focus();
			return false;
			}
		 //	var ID=$("#ID").val(); 
		 	var NAME=$("#NAME").val(); 
		 	var KEY=$("#KEY").val();
		 	var description=$("#DESCRIPTION").val();
		 	var url=$("#Form").attr("action");
	  		//create
		 	$.ajax({
				type: "POST",
				url: url,
		    	data: {
		    		name:NAME,
		    		key:KEY,
		    		description:description
		    	},
				dataType:'json',
				cache: false, 
				success: function(data){
					 $("#zhongxin").hide();
					 $("#zhongxin2").show();
					 window.open("<%=basePath %>act-process-editor/modeler.jsp?modelId="+data); 
					 top.Dialog.close();
					
				}
			});  
			 
		}
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		</script>
</body>
</html>