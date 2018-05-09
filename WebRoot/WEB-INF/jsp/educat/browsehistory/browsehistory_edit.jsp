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
					
					<form action="browsehistory/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="BROWSEHISTORY_ID" id="BROWSEHISTORY_ID" value="${pd.BROWSEHISTORY_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">登录账号:</td>
								<td><input type="text" name="USERNAME" id="USERNAME" value="${pd.USERNAME}" maxlength="255" placeholder="这里输入登录账号" title="登录账号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">浏览地址:</td>
								<td><input type="text" name="BROWSEURL" id="BROWSEURL" value="${pd.BROWSEURL}" maxlength="255" placeholder="这里输入浏览地址" title="浏览地址" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">课程编号:</td>
								<td><input type="text" name="COURSEID" id="COURSEID" value="${pd.COURSEID}" maxlength="255" placeholder="这里输入课程编号" title="课程编号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">课程名称:</td>
								<td><input type="text" name="COURSENAME" id="COURSENAME" value="${pd.COURSENAME}" maxlength="255" placeholder="这里输入课程名称" title="课程名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注:</td>
								<td><input type="text" name="REMARK" id="REMARK" value="${pd.REMARK}" maxlength="255" placeholder="这里输入备注" title="备注" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">浏览次数:</td>
								<td><input type="number" name="BROWSECOUNT" id="BROWSECOUNT" value="${pd.BROWSECOUNT}" maxlength="32" placeholder="这里输入浏览次数" title="浏览次数" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">留言次数:</td>
								<td><input type="number" name="LEAVEMESSAGECOUNT" id="LEAVEMESSAGECOUNT" value="${pd.LEAVEMESSAGECOUNT}" maxlength="32" placeholder="这里输入留言次数" title="留言次数" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">收藏次数:</td>
								<td><input type="number" name="COLLECTCOUNT" id="COLLECTCOUNT" value="${pd.COLLECTCOUNT}" maxlength="32" placeholder="这里输入收藏次数" title="收藏次数" style="width:98%;"/></td>
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
			if($("#USERNAME").val()==""){
				$("#USERNAME").tips({
					side:3,
		            msg:'请输入登录账号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#USERNAME").focus();
			return false;
			}
			if($("#BROWSEURL").val()==""){
				$("#BROWSEURL").tips({
					side:3,
		            msg:'请输入浏览地址',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#BROWSEURL").focus();
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
			if($("#BROWSECOUNT").val()==""){
				$("#BROWSECOUNT").tips({
					side:3,
		            msg:'请输入浏览次数',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#BROWSECOUNT").focus();
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
			if($("#COLLECTCOUNT").val()==""){
				$("#COLLECTCOUNT").tips({
					side:3,
		            msg:'请输入收藏次数',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#COLLECTCOUNT").focus();
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