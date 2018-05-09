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
	
	<style type="text/css">
		pre{margin-top:10px; padding:6px; background:#f7f7f7}
		select{background-color: #fff; background-position: right center; background-repeat: no-repeat; border: 1px solid #888; 
		border-radius: 3px; box-sizing: border-box; font: 12px/1.5 Tahoma,Arial,sans-serif; height: 30px; padding: 0 4px;}
		.per{border-bottom: 1px dotted #ddd; padding: 20px 0}
		.per h3{margin-bottom: 6px; font-size: 14px}
		.per p{margin: 3px 0}
	</style>  
	<script type="text/javascript">
	 var weburl ='<%=basePath %>';
	</script>
	 <script type="text/javascript" src="<%=basePath %>static/resource/assert/js/jquery.min.js"></script>  
	<script type="text/javascript" src="<%=basePath %>static/resource/assert/js/jquery.cityselect.js"></script>

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
					
					<form action="storeinfo/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="STOREINFO_ID" id="STOREINFO_ID" value="${pd.STOREINFO_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
								<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">店面名称:</td>
								<td><input type="text" name="STORE_NAME" id="STORE_NAME" value="${pd.STORE_NAME}" maxlength="255" placeholder="这里输入店面名称" title="店面名称" style="width:98%;"/></td>
							</tr>
							
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">省份:</td>
								<td>
									 <select class="prov" name="PROVINCE_NAME" id="PROVINCE_NAME" value="${pd.PROVINCE_NAME}"></select>
								</td>
							</tr>
							<tr> 
								<td style="width:75px;text-align: right;padding-top: 13px;">城市:</td>
								<td>
									<select class="city" name="CITY_NAME" id="CITY_NAME" disabled="disabled"></select>
								</td>
							</tr> 
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">区县名称:</td>
								<td>
									<select class="dist" name="DIST_NAME" id="DIST_NAME" disabled="disabled"></select>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">联系人:</td>
								<td><input type="text" name="NAME" id="NAME" value="${pd.NAME}" maxlength="255" placeholder="这里输入名称" title="名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">电话:</td>
								<td><input type="text" name="TEL" id="TEL" value="${pd.TEL}" maxlength="255" placeholder="这里输入电话" title="电话" style="width:98%;"/></td>
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
		            msg:'请输入联系人',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#NAME").focus();
			return false;
			}
			if($("#PROVINCE_NAME").val()==""){
				$("#PROVINCE_NAME").tips({
					side:3,
		            msg:'请输入省份',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PROVINCE_NAME").focus();
			return false;
			}
			if($("#CITY_NAME").val()==""){
				$("#CITY_NAME").tips({
					side:3,
		            msg:'请输入城市',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CITY_NAME").focus();
			return false;
			}
		 
			if($("#STORE_NAME").val()==""){
				$("#STORE_NAME").tips({
					side:3,
		            msg:'请输入店面名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#STORE_NAME").focus();
			return false;
			}
			if($("#TEL").val()==""){
				$("#TEL").tips({
					side:3,
		            msg:'请输入电话',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TEL").focus();
			return false;
			}
			 
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		$(function() {
		 
			//日期框
			 $("#zhongxin").citySelect({
			 nodata: "none", 
			 required: false, 
             prov: "${pd.PROVINCE_NAME}",
             city: "${pd.CITY_NAME}",
             dist: "${pd.DIST_NAME}",
      		   });
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		</script>
</body>
</html>