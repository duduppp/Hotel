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
					
					<form action="playlist/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="PLAYLIST_ID" id="PLAYLIST_ID" value="${pd.PLAYLIST_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">播放标题:</td>
								<td><input type="text" name="TITLE" id="TITLE" value="${pd.TITLE}" maxlength="255" placeholder="这里输入播放标题" title="播放标题" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">影片时长:</td>
								<td><input type="text" name="PLAYERTIME" id="PLAYERTIME" value="${pd.PLAYERTIME}" maxlength="255" placeholder="这里输入影片时长" title="影片时长" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">影片图片:</td>
								<td><input type="text" name="VIDEOIMG" id="VIDEOIMG" value="${pd.VIDEOIMG}" maxlength="255" placeholder="这里输入影片图片" title="影片图片" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">影片路径:</td>
								<td><input type="text" name="VIDEOPATH" id="VIDEOPATH" value="${pd.VIDEOPATH}" maxlength="255" placeholder="这里输入影片路径" title="影片路径" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">账号名称:</td>
								<td><input type="text" name="LOGINNAME" id="LOGINNAME" value="${pd.LOGINNAME}" maxlength="255" placeholder="这里输入账号名称" title="账号名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">播放顺序:</td>
								<td><input type="number" name="PLAYSORT" id="PLAYSORT" value="${pd.PLAYSORT}" maxlength="32" placeholder="这里输入播放顺序" title="播放顺序" style="width:98%;"/></td>
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
			if($("#TITLE").val()==""){
				$("#TITLE").tips({
					side:3,
		            msg:'请输入播放标题',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TITLE").focus();
			return false;
			}
			if($("#PLAYERTIME").val()==""){
				$("#PLAYERTIME").tips({
					side:3,
		            msg:'请输入影片时长',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PLAYERTIME").focus();
			return false;
			}
			if($("#VIDEOIMG").val()==""){
				$("#VIDEOIMG").tips({
					side:3,
		            msg:'请输入影片图片',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#VIDEOIMG").focus();
			return false;
			}
			if($("#VIDEOPATH").val()==""){
				$("#VIDEOPATH").tips({
					side:3,
		            msg:'请输入影片路径',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#VIDEOPATH").focus();
			return false;
			}
			if($("#LOGINNAME").val()==""){
				$("#LOGINNAME").tips({
					side:3,
		            msg:'请输入账号名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#LOGINNAME").focus();
			return false;
			}
			if($("#PLAYSORT").val()==""){
				$("#PLAYSORT").tips({
					side:3,
		            msg:'请输入播放顺序',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PLAYSORT").focus();
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