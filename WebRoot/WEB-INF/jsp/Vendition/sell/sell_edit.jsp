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
					
					<form action="sell/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="SELL_ID" id="SELL_ID" value="${pd.SELL_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">进货单号:</td>
								<td><input type="text" name="SELLID" id="SELLID" value="${pd.SELLID}" maxlength="255" placeholder="这里输入进货单号" title="进货单号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">商品编号:</td>
								<td><input type="text" name="WAREID" id="WAREID" value="${pd.WAREID}" maxlength="255" placeholder="这里输入商品编号" title="商品编号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">出货日期:</td>
								<td><input class="span10 date-picker" name="SELLDATE" id="SELLDATE" value="${pd.SELLDATE}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="出货日期" title="出货日期" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">出货数量:</td>
								<td><input type="text" name="SELLAMOUNT" id="SELLAMOUNT" value="${pd.SELLAMOUNT}" maxlength="255" placeholder="这里输入出货数量" title="出货数量" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">金额合计:</td>
								<td><input type="text" name="MONEYSUM" id="MONEYSUM" value="${pd.MONEYSUM}" maxlength="255" placeholder="这里输入金额合计" title="金额合计" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">操作员:</td>
								<td><input type="text" name="OPERATOR" id="OPERATOR" value="${pd.OPERATOR}" maxlength="255" placeholder="这里输入操作员" title="操作员" style="width:98%;"/></td>
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
			if($("#SELLID").val()==""){
				$("#SELLID").tips({
					side:3,
		            msg:'请输入进货单号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SELLID").focus();
			return false;
			}
			if($("#WAREID").val()==""){
				$("#WAREID").tips({
					side:3,
		            msg:'请输入商品编号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#WAREID").focus();
			return false;
			}
			if($("#SELLDATE").val()==""){
				$("#SELLDATE").tips({
					side:3,
		            msg:'请输入出货日期',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SELLDATE").focus();
			return false;
			}
			if($("#SELLAMOUNT").val()==""){
				$("#SELLAMOUNT").tips({
					side:3,
		            msg:'请输入出货数量',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SELLAMOUNT").focus();
			return false;
			}
			if($("#MONEYSUM").val()==""){
				$("#MONEYSUM").tips({
					side:3,
		            msg:'请输入金额合计',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MONEYSUM").focus();
			return false;
			}
			if($("#OPERATOR").val()==""){
				$("#OPERATOR").tips({
					side:3,
		            msg:'请输入操作员',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#OPERATOR").focus();
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