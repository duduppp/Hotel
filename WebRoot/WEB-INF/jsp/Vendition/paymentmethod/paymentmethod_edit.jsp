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
					
					<form action="paymentmethod/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="PAYMENTMETHOD_ID" id="PAYMENTMETHOD_ID" value="${pd.PAYMENTMETHOD_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">是否开启微信支付:</td>
								<td><input type="text" name="WX_STATUS" id="WX_STATUS" value="${pd.WX_STATUS}" maxlength="255" placeholder="这里输入是否开启微信支付" title="是否开启微信支付" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">商户号:</td>
								<td><input type="text" name="WX_MERCHANTNUMBER" id="WX_MERCHANTNUMBER" value="${pd.WX_MERCHANTNUMBER}" maxlength="255" placeholder="这里输入商户号" title="商户号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">支付APPID:</td>
								<td><input type="text" name="WX_APPID" id="WX_APPID" value="${pd.WX_APPID}" maxlength="255" placeholder="这里输入支付APPID" title="支付APPID" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">支付秘钥:</td>
								<td><input type="text" name="WX_PAYSCECRETKEY" id="WX_PAYSCECRETKEY" value="${pd.WX_PAYSCECRETKEY}" maxlength="255" placeholder="这里输入支付秘钥" title="支付秘钥" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">是否开启支付宝:</td>
								<td><input type="text" name="ALIPAY_STATUS" id="ALIPAY_STATUS" value="${pd.ALIPAY_STATUS}" maxlength="255" placeholder="这里输入是否开启支付宝" title="是否开启支付宝" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">支付宝APPID:</td>
								<td><input type="text" name="ALIPAY_APPID" id="ALIPAY_APPID" value="${pd.ALIPAY_APPID}" maxlength="255" placeholder="这里输入支付宝APPID" title="支付宝APPID" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">支付宝公钥:</td>
								<td><input type="text" name="ALIPAY_PAYSCECRETKEY" id="ALIPAY_PAYSCECRETKEY" value="${pd.ALIPAY_PAYSCECRETKEY}" maxlength="255" placeholder="这里输入支付宝公钥" title="支付宝公钥" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">商户私钥:</td>
								<td><input type="text" name="ALIPAY_MERCHANTNUMBER" id="ALIPAY_MERCHANTNUMBER" value="${pd.ALIPAY_MERCHANTNUMBER}" maxlength="255" placeholder="这里输入商户私钥" title="商户私钥" style="width:98%;"/></td>
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
			if($("#WX_STATUS").val()==""){
				$("#WX_STATUS").tips({
					side:3,
		            msg:'请输入是否开启微信支付',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#WX_STATUS").focus();
			return false;
			}
			if($("#WX_MERCHANTNUMBER").val()==""){
				$("#WX_MERCHANTNUMBER").tips({
					side:3,
		            msg:'请输入商户号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#WX_MERCHANTNUMBER").focus();
			return false;
			}
			if($("#WX_APPID").val()==""){
				$("#WX_APPID").tips({
					side:3,
		            msg:'请输入支付APPID',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#WX_APPID").focus();
			return false;
			}
			if($("#WX_PAYSCECRETKEY").val()==""){
				$("#WX_PAYSCECRETKEY").tips({
					side:3,
		            msg:'请输入支付秘钥',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#WX_PAYSCECRETKEY").focus();
			return false;
			}
			if($("#ALIPAY_STATUS").val()==""){
				$("#ALIPAY_STATUS").tips({
					side:3,
		            msg:'请输入是否开启支付宝',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ALIPAY_STATUS").focus();
			return false;
			}
			if($("#ALIPAY_APPID").val()==""){
				$("#ALIPAY_APPID").tips({
					side:3,
		            msg:'请输入支付宝APPID',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ALIPAY_APPID").focus();
			return false;
			}
			if($("#ALIPAY_PAYSCECRETKEY").val()==""){
				$("#ALIPAY_PAYSCECRETKEY").tips({
					side:3,
		            msg:'请输入支付宝公钥',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ALIPAY_PAYSCECRETKEY").focus();
			return false;
			}
			if($("#ALIPAY_MERCHANTNUMBER").val()==""){
				$("#ALIPAY_MERCHANTNUMBER").tips({
					side:3,
		            msg:'请输入商户私钥',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ALIPAY_MERCHANTNUMBER").focus();
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