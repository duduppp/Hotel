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
			<!-- 编辑框-->
	<link href="plugins/ueditor/themes/default/css/ueditor.css" rel="stylesheet" type="text/css">
	<link href="<%=basePath%>static/edu/css/mobiscroll.custom-2.5.0.min.css" rel="stylesheet" type="text/css" />
	<style type="text/css">
/* 		.edui-default  .edui-for-button_leipi .edui-icon {background-position: -401px -40px;} */  
/* 		.edui-default  .edui-for-button_template .edui-icon {background-position: -339px -40px;} */
	</style>
	<script type="text/javascript" charset="utf-8">window.UMEDITOR_HOME_URL = "<%=path%>/plugins/ueditor/";</script>
	<script type="text/javascript" charset="utf-8" src="plugins/ueditor/ueditor.config.js"></script>
	<script type="text/javascript" charset="utf-8" src="plugins/ueditor/ueditor.all.js"></script>
	<script type="text/javascript" charset="utf-8" src="plugins/ueditor/lang/zh-cn/zh-cn.js"></script>
	<script type="text/javascript" charset="utf-8" src="plugins/ueditor/formdesign/leipi.formdesign.v4.js"></script>
	<script type="text/javascript" charset="utf-8" src="plugins/ueditor/ueditor.parse.min.js"></script>
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
						<form action="../bigbusinessevents/${msg }.do" name="Form" id="Form" method="post">
							<input type="hidden" name="BIGBUSINESSEVENTS_ID" id="BIGBUSINESSEVENTS_ID" value="${pd.BIGBUSINESSEVENTS_ID}"/>
							<div id="zhongxin" style="padding-top: 13px;">
							<table id="table_report" class="table table-striped table-bordered table-hover">
								<tr>
									<td style="width:75px;text-align: right;padding-top: 13px;">日期:</td>
									<td>
										<input class="span10 date-picker" name="BIGTIME" id="BIGTIME" value="${pd.BIGTIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="时间" title="时间" style="width:28%;"/>
									</td>
								</tr>
								<tr>
									<td style="width:75px;text-align: right;padding-top: 13px;">标题:</td>
									<td><input type="text" name="TITLE" id="TITLE" value="${pd.TITLE}" maxlength="255" placeholder="这里输入标题" title="标题" style="width:48%;"/></td>
								</tr>
								<tr>
									<td style="width:75px;text-align: right;padding-top: 13px;">内容:</td>
									<td>
										<script id="CONTENT" name="CONTENT" type="text/plain" style="width:97%;height:300px;z-index: -123;"></script>
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
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	
	  <script type="text/javascript" src="<%=basePath%>static/edu/js/jquery.mobile-1.3.0.min.js" ></script>
      <script type="text/javascript" src="<%=basePath%>static/edu/js/mobiscroll.js" ></script>
         	
		<script type="text/javascript">
		$(top.hangge());
		//保存
		function save(){
			if($("#BIGTIME").val()==""){
				$("#BIGTIME").tips({
					side:3,
		            msg:'请输入时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#BIGTIME").focus();
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
		 
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		 
		 var newjavascript = {
					plugdatetime: function ($dateTxt, type) {
						//var curr = new Date().getFullYear();
			 	var opt = {}
						opt.time = {
							preset: 'time'
						};
						opt.date = {
							preset: 'date'
						};
						 
						opt.datetime = { 
							preset: type,
							dateFormat: 'yyyy-mm-dd', // 日期格式
							minDate: new Date(2010, 1, 01, 00, 00),
							maxDate: new Date(2020, 12, 31, 24, 59),
							stepMinute: 1
						}
	 				
	 		$dateTxt.val('').scroller('destroy').scroller(
							$.extend(opt[type], {
								theme: "sense-ui", //android-ics light , sense-ui ,jqm
								mode: "scroller",
								display: "modal",
								lang: "english",
								dateOrder : 'yyyymmdd', 
								yearText: "年",
								monthText: "月",
								dayText: "日",
								hourText: "时",
								minuteText: "分",
							 	ampmText: "上午/下午",
								setText: '确定',
								cancelText: '取消',
								dateFormat: 'yy-mm-dd', 
									onSelect:function(valueText,inst){
										var yearStr=valueText.substring(0,10);
										$("#BIGTIME").val(yearStr);
								 }
						})); 
					}
		   };  
		$(function() {
			//时间选择插件
			newjavascript.plugdatetime($("#BIGTIME"), "datetime");
			var ue = UE.getEditor('CONTENT');  
		        ue.ready(function() { 
		            ue.setContent('${pd.CONTENT}');   
		        });  
			        
		});
		</script>
</body>
</html>