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
	<!-- jsp文件头和头部 -->
	<%@ include file="../../system/index/top.jsp"%>
	<script type="text/javascript" src="static/ace/js/jquery.js"></script>
	<!-- 上传插件 -->
	<script type="text/javascript">
		var jsessionid = "<%=session.getId()%>";  //勿删，uploadify兼容火狐用到
	</script>
	<link href="<%=basePath%>plugins/uploadify/uploadify.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="<%=basePath%>plugins/uploadify/swfobject.js"></script>
	<script type="text/javascript" src="<%=basePath%>plugins/uploadify/jquery.uploadify.v2.1.4.min.js"></script>
</head>
<body class="no-skin">
	<div class="main-container" id="main-container">
	 <div id="zhongxin" style="padding-top: 13px;width: 100%;text-align: center;">
				<table  id="table_report" class="table table-striped table-bordered table-hover">
					<tr>
						<td style="width: 75%;">
							<input style="width:100%;" type="text" name="fileExcel" id="fileExcel" value="" />
						</td>
						<td style="width: 25%;">
							 <input type="file" name="File_name" id="uploadify1" keepDefaultStyle="true"/>
						</td>
					</tr>
				</table> 
		<div>
		  <table id="exceltableId" class="table table-striped table-bordered table-hover" style="width: 100%;height:260px;margin-bottom: 0px;border-bottom: 0px;margin-top:2px;">
		  		<tr height="30" style="border-bottom: 1 solid #000000;">
		  			<td>&nbsp;</td>
		  			<td>&nbsp;</td>
		  			<td>&nbsp;</td>
		  			<td>&nbsp;</td>
		  		</tr>
		  		<tr>
		  			<td>&nbsp;</td>
		  			<td>&nbsp;</td>
		  			<td>&nbsp;</td>
		  			<td>&nbsp;</td>
		  		</tr>
		  </table>
		  <table class="table table-striped table-bordered table-hover" style="width: 100%;height:30px;margin-top:0px;">
		  		<tr height="30" style="border-bottom: 1 solid #000000;border-top: 0px;">
		  			<td colspan="4">总数据量：<sapn id="tableRowId"></sapn>行</td>
		  		</tr>
		  </table>
		  	  <table class="table table-striped   table-hover" style="width: 100%;height:30px;margin-top:0px;">
		  		<tr height="25" style="border: 0px;">
		  			<td style="width: 90px;text-align: center;"><input type="checkbox" >会员卡号 </td>
		  			<td style="text-align: left;">
		  				<select style="width:100%;" class="chosen-select form-control" name="CARDNO" id="CARDNO" data-placeholder="请选择" style="vertical-align:top;width: 170px;">
		  					<option value="1" selected="selected" ></option>
		  				</select>
		  			</td>
		  			<td style="width: 90px;text-align: center;"><input type="checkbox" >电话号码 </td>
		  			<td style="text-align: left;">
		  				<select style="width:100%;" class="chosen-select form-control" name="TEL" id="TEL" data-placeholder="请选择" style="vertical-align:top;width: 170px;">
		  				<option value="1" selected="selected" ></option>
		  				</select>
		  			</td>
		  			<td style="width: 90px;text-align: center;"><input type="checkbox" >会员姓名 </td>
		  			<td style="text-align: left;">
		  				<select style="width:100%;" class="chosen-select form-control" name="NAME" id="NAME" data-placeholder="请选择" style="vertical-align:top;width: 170px;">
		  				<option value="1" selected="selected" ></option>
		  				</select>
		  			</td>
		  	   </tr>
		  	    <tr height="30" >
		  			<td style="width: 90px;text-align: center;"><input type="checkbox" >储值余额 </td>
		  			<td style="text-align: left;">
		  				<select style="width:100%;" class="chosen-select form-control" name="STORAGEBALANCE" id="STORAGEBALANCE" data-placeholder="请选择" style="vertical-align:top;width: 170px;">
		  				<option value="1" selected="selected" ></option>
		  				</select>
		  			</td>
		  			<td style="width: 90px;text-align: center;"><input type="checkbox" >会员积分 </td>
		  			<td style="text-align: left;">
		  				<select style="width:100%;" class="chosen-select form-control" name="INTEGRAL" id="INTEGRAL" data-placeholder="请选择" style="vertical-align:top;width: 170px;">
		  				<option value="1" selected="selected" ></option>
		  				</select>
		  			</td>
		  			<td style="width: 90px;text-align: center;"><input type="checkbox" >会员密码 </td>
		  			<td style="text-align: left;">
		  				<select style="width:100%;" class="chosen-select form-control" name="PASSWORD" id="PASSWORD" data-placeholder="请选择" style="vertical-align:top;width: 170px;">
		  				<option value="1" selected="selected" ></option>
		  				</select>
		  			</td>
		  	   </tr>
		  	   		<tr height="30"  >
		  			<td style="width: 90px;text-align: center;"><input type="checkbox" >联系地址 </td>
		  			<td style="text-align: left;">
		  				<select style="width:100%;" class="chosen-select form-control" name="ADDRESS" id="ADDRESS" data-placeholder="请选择" style="vertical-align:top;width: 170px;">
		  				<option value="1" selected="selected" ></option>
		  				</select>
		  			</td>
		  				<td style="width: 90px;text-align: center;"><input type="checkbox" >会员等级 </td>
		  			<td style="text-align: left;">
		  				<select style="width:100%;" class="chosen-select form-control" name="VIPTYPE" id="VIPTYPE" data-placeholder="请选择" style="vertical-align:top;width: 170px;">
		  				<option value="1" selected="selected" >普通会员</option>
		  				</select>
		  			</td>
		  			<td>	&nbsp; </td>
		  			<td>
		  				&nbsp;
		  			</td>
		  	   </tr>
		  </table>
		  <table style="width: 100%;">
		  	<tr style="text-align: right;">
				<td  >
					<a class="btn btn-mini btn-primary" style="width: 80px;" onclick="save();">保存</a>
					<a class="btn btn-mini btn-danger" style="width: 80px;" onclick="top.Dialog.close();">取消</a>
				</td>
		 	</tr>
		 	</table>
		   
		</div>
	 
	</div>
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
		
		/**
		*读取excel文件，并转成list 数据
		*/
		function readExceltoTable(excelFile){
		 	var optStr="";
			$.ajax({
				type: "POST",
				url: '<%=basePath%>vipuser/getExcelTable.do',
		    	data: {
		    		excelFile:excelFile
		    	},
				dataType:'json',
				cache: false,
				success: function(data){
					 var str='';
					 var listData=data["listData"];
					 var k=1;
					 var sumcount=0;
					 for(var i=0;i<listData.length;i++){
						 if(i<11){
							 str+='<tr height="30" style="border-bottom: 1 solid #000000;">';
							 var list= listData[i];
								 for(var j in list){
									 var celStr=list[j];
									 if(i==0){
										 optStr+="<option value='celStr'>"+celStr+"</option>";
										 celStr="["+k+"]"+celStr;  
										 k+=1; 
									 } 
									 str+='<td style="word-break: keep-all;white-space:nowrap;">'+celStr+' </td>'; 
								 }
							   str+='</tr>'; 
					     }
					 }
					  
					 $("#CARDNO").append(optStr);
					 $("#TEL").append(optStr);
					 $("#STORAGEBALANCE").append(optStr);
					 $("#NAME").append(optStr);
					 $("#INTEGRAL").append(optStr);
					 $("#PASSWORD").append(optStr);
					 $("#ADDRESS").append(optStr);
					 
					 $("#exceltableId tr").remove();
					 $("#exceltableId").append(str);
				 }
			});
		}
		
		
		function setUploadBtn(upId){
			 var str=""; 
				$("#"+upId).uploadify({   
					'buttonImg'	: 	"<%=basePath%>static/images/fileup.png",
					'uploader'	:	"<%=basePath%>plugins/uploadify/uploadify.swf",
					'script'    :	"<%=basePath%>plugins/uploadify/uploadFile.jsp;jsessionid="+jsessionid,
					'cancelImg' :	"<%=basePath%>plugins/uploadify/cancel.png",    
					'folder'	:	"<%=basePath%>uploadFiles/product/",
					'queueId'	:	"fileQueue",  
					'displayData' : "speed",
					'queueSizeLimit':	1,//限制上传文件的数量 
					'fileExt'   : "*.xls;*.xlsx",
					'fileDesc'  : "Please choose(*.xls,*.xlsx)", 
					'auto'		: true,
					'multi'		: false,//是否允许多文件上传
					'simUploadLimit':1,//同时运行上传的进程数量
					'buttonText':"files",
					 'removeCompleted': true,
					'scriptData':{'uploadPath':'/uploadFiles/product/'},//这个参数用于传递用户自己的参数，此时'method' 必须设置为GET, 后台可以用request.getParameter('name')获取名字的值
					'method'	:"GET",
					'onComplete':function(event,queueId,fileObj,response,data){  
						  str="/uploadFiles/product/"+response.trim();
					},
				
					'onAllComplete' : function(event,data) {
						 readExceltoTable(str);
			    	},'onError': function(event, queueID, fileObj) {
			    	      alert("文件:" + fileObj.name + "上传失败");
			    	},'onSelect' : function(event, queueId, fileObj){
			    		// str="/uploadFiles/product/"+fileObj.name;
			    		$("#fileExcel").val("/uploadFiles/product/"+fileObj.name);
			    	}
				});
			} 
	 
		$(function() {
			setUploadBtn('uploadify1');
		});
		</script>
</body>
</html>