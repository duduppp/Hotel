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
					
					<form action="graphic/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="GRAPHIC_ID" id="GRAPHIC_ID" value="${pd.GRAPHIC_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">主目录:</td>
								<td><input type="text" name="CATALOG" id="CATALOG" value="${pd.CATALOG}" maxlength="255" placeholder="这里输入主目录" title="主目录" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">子目录:</td>
								<td><input type="text" name="SUBDIRECTORY" id="SUBDIRECTORY" value="${pd.SUBDIRECTORY}" maxlength="255" placeholder="这里输入子目录" title="子目录" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">孙子目录:</td>
								<td><input type="text" name="SUNCATALOGUE" id="SUNCATALOGUE" value="${pd.SUNCATALOGUE}" maxlength="255" placeholder="这里输入孙子目录" title="孙子目录" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">录入时间:</td>
								<td><input class="span10 date-picker" name="INPUTDATE" id="INPUTDATE" value="${pd.INPUTDATE}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="录入时间" title="录入时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">编辑人:</td>
								<td><input type="text" name="NAME" id="NAME" value="${pd.NAME}" maxlength="255" placeholder="这里输入编辑人" title="编辑人" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">内容:</td>
								<td><input type="text" name="CONTENT" id="CONTENT" value="${pd.CONTENT}" maxlength="20000" placeholder="这里输入内容" title="内容" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">标题:</td>
								<td><input type="text" name="TITLE" id="TITLE" value="${pd.TITLE}" maxlength="255" placeholder="这里输入标题" title="标题" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">简介:</td>
								<td><input type="text" name="BRIEF_INTRODUCTION" id="BRIEF_INTRODUCTION" value="${pd.BRIEF_INTRODUCTION}" maxlength="255" placeholder="这里输入简介" title="简介" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">上传图片:</td>
								<td><input type="text" name="IMGPATH" id="IMGPATH" value="${pd.IMGPATH}" maxlength="255" placeholder="这里输入上传图片" title="上传图片" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">是否展示:</td>
								<td><input type="number" name="SHOWSTATUS" id="SHOWSTATUS" value="${pd.SHOWSTATUS}" maxlength="32" placeholder="这里输入是否展示" title="是否展示" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">排序编号:</td>
								<td><input type="number" name="SORT_NO" id="SORT_NO" value="${pd.SORT_NO}" maxlength="32" placeholder="这里输入排序编号" title="排序编号" style="width:98%;"/></td>
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
			if($("#CATALOG").val()==""){
				$("#CATALOG").tips({
					side:3,
		            msg:'请输入主目录',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CATALOG").focus();
			return false;
			}
			if($("#SUBDIRECTORY").val()==""){
				$("#SUBDIRECTORY").tips({
					side:3,
		            msg:'请输入子目录',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SUBDIRECTORY").focus();
			return false;
			}
			if($("#SUNCATALOGUE").val()==""){
				$("#SUNCATALOGUE").tips({
					side:3,
		            msg:'请输入孙子目录',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SUNCATALOGUE").focus();
			return false;
			}
			if($("#INPUTDATE").val()==""){
				$("#INPUTDATE").tips({
					side:3,
		            msg:'请输入录入时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#INPUTDATE").focus();
			return false;
			}
			if($("#NAME").val()==""){
				$("#NAME").tips({
					side:3,
		            msg:'请输入编辑人',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#NAME").focus();
			return false;
			}
			if($("#CONTENT").val()==""){
				$("#CONTENT").tips({
					side:3,
		            msg:'请输入内容',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CONTENT").focus();
			return false;
			}
			if($("#TITLE").val()==""){
				$("#TITLE").tips({
					side:3,
		            msg:'请输入标题',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TITLE").focus();
			return false;
			}
			if($("#BRIEF_INTRODUCTION").val()==""){
				$("#BRIEF_INTRODUCTION").tips({
					side:3,
		            msg:'请输入简介',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#BRIEF_INTRODUCTION").focus();
			return false;
			}
			if($("#IMGPATH").val()==""){
				$("#IMGPATH").tips({
					side:3,
		            msg:'请输入上传图片',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#IMGPATH").focus();
			return false;
			}
			if($("#SHOWSTATUS").val()==""){
				$("#SHOWSTATUS").tips({
					side:3,
		            msg:'请输入是否展示',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SHOWSTATUS").focus();
			return false;
			}
			if($("#SORT_NO").val()==""){
				$("#SORT_NO").tips({
					side:3,
		            msg:'请输入排序编号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SORT_NO").focus();
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