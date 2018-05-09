<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="author" content="远元集团">
<meta name="keywords" content="郑远元,远元集团">
<meta name="description" content="郑远元,远元集团 官网">
<link href="favicon.ico" type="image/x-icon" rel="icon">
<link href="favicon.ico" type="image/x-icon" rel="shortcut icon">
<html lang="en">
	<head>
	<base href="<%=basePath%>">
	<!-- basic styles -->
	<link href="static/css/bootstrap.min.css" rel="stylesheet" />
	<link href="static/css/bootstrap-responsive.min.css" rel="stylesheet" />
	<link rel="stylesheet" href="static/css/font-awesome.min.css" />
	<!-- page specific plugin styles -->
	<!-- 下拉框-->
	<link rel="stylesheet" href="static/css/chosen.css" />
	<!-- ace styles -->
	<link rel="stylesheet" href="static/css/ace.min.css" />
	<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
	<link rel="stylesheet" href="static/css/ace-skins.min.css" />
	<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
</head>
<body class="no-skin">
<div class="main-container" id="main-container">
	 
	<div class="main-content">
		<div class="main-content-inner">
			<div class="page-content">
				<div class="row">
					<div class="col-xs-12">
					<form   name="Form" id="Form" method="post"  >
					 	<input type="hidden" name="IS_READ" id="IS_READ" value="0" />
					 	<input type="hidden" name="MSG_TYPE" id="MSG_TYPE" value="留言板" />
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">发送人:</td>
								<td><input type="text" name="SENDER" id="SENDER" value="" maxlength="255" placeholder="这里输入发送人" title="发送人" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">电话:</td>
								<td><input type="text" name="TEL" id="TEL" value="" maxlength="255" placeholder="这里输入电话" title="电话" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">邮箱:</td>
								<td><input type="text" name="MAIL" id="MAIL" value="" maxlength="100" placeholder="这里输入邮箱" title="邮箱" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">内容:</td>
								<td>
								 	  <textarea style="width:95%;height:80px;" rows="10" cols="10" name="CONTENT" id="CONTENT" title="这里输入内容" maxlength="254" placeholder="这里输入内容"></textarea>
									  <div><font color="#808080">请不要多于255字否则无法保存</font></div>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">创建时间:</td>
								<td><input type="text" name="CREATE_TIME" id="CREATE_TIME" readonly="readonly"  style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">验证码:</td>
								<td>
									<input type="text" name="verification_code" id="verification_code" style="width:18%;"/>    
									<img style="height:22px;cursor: pointer;" id="codeImg" alt="点击更换" title="点击更换" src="" />
								</td>
							</tr> 
							<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="save();">提交</a>
									<a class="btn btn-mini btn-danger" onclick="cancelForm();">取消</a>
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
	 <script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script src="static/ace/js/bootstrap.js"></script>
		<script type="text/javascript">
	//	$(top.hangge());
		//保存
		function save(){
			if($("#SENDER").val()==""){
				$("#SENDER").tips({
					side:3,
		            msg:'请输入发送人',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SENDER").focus();
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
			if($("#CREATE_TIME").val()==""){
				$("#CREATE_TIME").tips({
					side:3,
		            msg:'请输入创建时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CREATE_TIME").focus();
			return false;
			}
			
			var myreg = /^(((13[0-9]{1})|159)+\d{8})$/;
			if($("#TEL").val()==""){
				
				$("#TEL").tips({
					side:3,
		            msg:'输入手机号',
		            bg:'#AE81FF',
		            time:3
		        });
				$("#TEL").focus();
				return false;
			}else if($("#TEL").val().length != 11 && !myreg.test($("#PHONE").val())){
				$("#TEL").tips({
					side:3,
		            msg:'手机号格式不正确',
		            bg:'#AE81FF',
		            time:3
		        });
				$("#TEL").focus();
				return false;
			}
			if($("#MAIL").val()==""){
				
				$("#MAIL").tips({
					side:3,
		            msg:'输入邮箱',
		            bg:'#AE81FF',
		            time:3
		        });
				$("#MAIL").focus();
				return false;
			}else if(!ismail($("#MAIL").val())){
				$("#MAIL").tips({
					side:3,
		            msg:'邮箱格式不正确',
		            bg:'#AE81FF',
		            time:3
		        });
				$("#MAIL").focus();
				return false;
			}

			 
			//$("#Form").submit();
			var str_data = $("#Form input").map(function () {
				return ($(this).attr("name") + '=' + $(this).val());
			}).get().join("&");
			str_data+="&CONTENT="+ $("#CONTENT").val();
			console.info(str_data);
			$.ajax({
				type: "POST",
				url: "<%=basePath %>saveMsg.do",
				data: str_data,
				dataType:"json",
				success: function (data) {
					 alert(data.msg); 
					  if(data.status=="true"){  
						  cancelForm();   
					  }else{
						  $("#verification_code").val("");
					  }
					
					  
				}
			});
		}
		
		function cancelForm(){
			 $(':input','#Form').val('');
			 $("#CONTENT").val(""); 
			 setDate();
		}
		function ismail(mail){
			return(new RegExp(/^(?:[a-zA-Z0-9]+[_\-\+\.]?)*[a-zA-Z0-9]+@(?:([a-zA-Z0-9]+[_\-]?)*[a-zA-Z0-9]+\.)+([a-zA-Z]{2,})+$/).test(mail));
 		}
		function setDate(){
			var date = new Date();
		    var seperator1 = "-";
		    var seperator2 = ":";
		    var month = date.getMonth() + 1;
		    var strDate = date.getDate();
		    if (month >= 1 && month <= 9) {
		        month = "0" + month;
		    }
		    if (strDate >= 0 && strDate <= 9) {
		        strDate = "0" + strDate;
		    }
		    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
		            + " " + date.getHours() + seperator2 + date.getMinutes()
		            + seperator2 + date.getSeconds();
		   $("#CREATE_TIME").val(currentdate); 
		}
		$(function() {
			  
			setDate(); 
			changeCode();
			$("#codeImg").bind("click", changeCode);
			//日期框
		 
		});
		function genTimestamp() {
			var time = new Date();
			return time.getTime();
		}
		function changeCode() {
			$("#codeImg").attr("src", "code.do?t=" + genTimestamp());
		}
		</script>
</body>
</html>