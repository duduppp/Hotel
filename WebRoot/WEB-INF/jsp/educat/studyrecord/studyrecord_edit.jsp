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
					
					<form action="studyrecord/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="STUDYRECORD_ID" id="STUDYRECORD_ID" value="${pd.STUDYRECORD_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">记录时间:</td>
								<td><input class="span10 date-picker" name="RECORDTIME" id="RECORDTIME" value="${pd.RECORDTIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="记录时间" title="记录时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">观看次数:</td>
								<td><input type="number" name="WATCHCOUNT" id="WATCHCOUNT" value="${pd.WATCHCOUNT}" maxlength="32" placeholder="这里输入观看次数" title="观看次数" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">留言次数:</td>
								<td><input type="text" name="LEAVEMESSAGECOUNT" id="LEAVEMESSAGECOUNT" value="${pd.LEAVEMESSAGECOUNT}" maxlength="255" placeholder="这里输入留言次数" title="留言次数" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">喜欢次数:</td>
								<td><input type="text" name="LOVECOUNT" id="LOVECOUNT" value="${pd.LOVECOUNT}" maxlength="255" placeholder="这里输入喜欢次数" title="喜欢次数" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注:</td>
								<td><input type="text" name="REMARK" id="REMARK" value="${pd.REMARK}" maxlength="255" placeholder="这里输入备注" title="备注" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">课程名称:</td>
								<td><input type="text" name="COURSENAME" id="COURSENAME" value="${pd.COURSENAME}" maxlength="255" placeholder="这里输入课程名称" title="课程名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">课程编号:</td>
								<td><input type="text" name="COURSEID" id="COURSEID" value="${pd.COURSEID}" maxlength="255" placeholder="这里输入课程编号" title="课程编号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">是否读完:</td>
								<td><input type="text" name="READSTATUS" id="READSTATUS" value="${pd.READSTATUS}" maxlength="255" placeholder="这里输入是否读完" title="是否读完" style="width:98%;"/></td>
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
			if($("#RECORDTIME").val()==""){
				$("#RECORDTIME").tips({
					side:3,
		            msg:'请输入记录时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#RECORDTIME").focus();
			return false;
			}
			if($("#WATCHCOUNT").val()==""){
				$("#WATCHCOUNT").tips({
					side:3,
		            msg:'请输入观看次数',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#WATCHCOUNT").focus();
			return false;
			}
			if($("#LEAVEMESSAGECOUNT").val()==""){
				$("#LEAVEMESSAGECOUNT").tips({
					side:3,
		            msg:'请输入留言次数',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#LEAVEMESSAGECOUNT").focus();
			return false;
			}
			if($("#LOVECOUNT").val()==""){
				$("#LOVECOUNT").tips({
					side:3,
		            msg:'请输入喜欢次数',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#LOVECOUNT").focus();
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
			if($("#COURSENAME").val()==""){
				$("#COURSENAME").tips({
					side:3,
		            msg:'请输入课程名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#COURSENAME").focus();
			return false;
			}
			if($("#COURSEID").val()==""){
				$("#COURSEID").tips({
					side:3,
		            msg:'请输入课程编号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#COURSEID").focus();
			return false;
			}
			if($("#READSTATUS").val()==""){
				$("#READSTATUS").tips({
					side:3,
		            msg:'请输入是否读完',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#READSTATUS").focus();
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