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
					
					<form action="pricemanager/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="PRICEMANAGER_ID" id="PRICEMANAGER_ID" value="${pd.PRICEMANAGER_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">房型:</td>
								<td>
									<input type="hidden" name="bkvalue1" id="bkvalue1" value="${pd.HOUSETYPE}" />
									<select class="chosen-select form-control" name="HOUSETYPE" id="HOUSETYPE" data-placeholder="请选择房型" style="vertical-align:top;"  title="房型" style="width:98%;" >
									</select>
								
								 </td>
							</tr>
							
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">会员类型:</td>
								<td>
								<input type="hidden" name="bkvalue2" id="bkvalue2" value="${pd.MEMBERTYPE}" />
								 
								<select class="chosen-select form-control" name="MEMBERTYPE" id="MEMBERTYPE" data-placeholder="请选择会员类型" style="vertical-align:top;"  title="会员类型" style="width:98%;" >
									</select>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">价格:</td>
								<td><input type="text" name="PRICE" id="PRICE" value="${pd.PRICE}" maxlength="255" placeholder="这里输入价格" title="价格" style="width:98%;"/>
								
								<input type="hidden" name="LOGINNAME" id="LOGINNAME" value="${pd.LOGINNAME}" maxlength="255" placeholder="这里输入账户" title="账户" style="width:98%;"/>
								</td>
							
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
						<input type="hidden" name="TYPESORT" id="TYPESORT" value="${pd.TYPESORT}" />
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
			if($("#HOUSETYPE").val()==""){
				$("#HOUSETYPE").tips({
					side:3,
		            msg:'请输入房型',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#HOUSETYPE").focus();
			return false;
			}
			if($("#MEMBERTYPE").val()==""){
				$("#MEMBERTYPE").tips({
					side:3,
		            msg:'请输入会员类型',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MEMBERTYPE").focus();
			return false;
			}
			if($("#PRICE").val()==""){
				$("#PRICE").tips({
					side:3,
		            msg:'请输入价格',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PRICE").focus();
			return false;
			}
			if($("#LOGINNAME").val()==""){
				$("#LOGINNAME").tips({
					side:3,
		            msg:'请输入账户',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#LOGINNAME").focus();
			return false;
			}
		 
			if($("#TYPESORT").val()==""){
				$("#TYPESORT").tips({
					side:3,
		            msg:'请输入类型排序',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TYPESORT").focus();
			return false;
			}
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		$(function() {
			
			var sessionUserName='${sessionScope.sessionUser.USERNAME}'; 
			$("#LOGINNAME").val(sessionUserName);  
			
			$.ajax({
	             url:'<%=basePath%>housetype/getHouseTypes.do', 
	             /*预期服务器端返回的数据类型，假设我现在跨域了，我就改成jsonp 就可以了 */
	         dataType:"json",
	         success:function(data){
	        	 $("#HOUSETYPE").append("<option value=''>请选择</option>");
	        	 if(undefined!=data&&data.length>0){
	        		var bkvalue=$("#bkvalue1").val();
	        		
	        		 for ( var i in data) {
	        			 
	        			 if(bkvalue==data[i].TYPENAME){  
	        				 $("#HOUSETYPE").append("<option value='"+data[i].TYPENAME+"' selected='selected'>"+data[i].TYPENAME+"</option>"); 
	        			 }else{
	        				 $("#HOUSETYPE").append("<option value='"+data[i].TYPENAME+"'>"+data[i].TYPENAME+"</option>");
	        			 }
	        			
					 }
	        	 }
	        		
	         }
		 });  
			 
			 $.ajax({
	             url:'<%=basePath%>configtype/getMemberTypes.do',
	             /*预期服务器端返回的数据类型，假设我现在跨域了，我就改成jsonp 就可以了 */
	         dataType:"json",
	         success:function(data){
	        	 $("#MEMBERTYPE").append("<option value='' >请选择</option>");
	        	 if(undefined!=data&&data.length>0){
	        		var bkvalue=$("#bkvalue2").val();   
	        		
	        		 for ( var i in data) {   
	        			 if(bkvalue==data[i].MEMBERTYPE){   
	        				 $("#MEMBERTYPE").append("<option value='"+data[i].MEMBERTYPE+"' selected='selected'>"+data[i].MEMBERTYPE+"</option>"); 
	        			 }else{
	        				 $("#MEMBERTYPE").append("<option value='"+data[i].MEMBERTYPE+"'>"+data[i].MEMBERTYPE+"</option>");
	        			 }
	        			
					 }
	        	 }
	        		
	         }
		 }); 
		});
		</script>
</body>
</html>