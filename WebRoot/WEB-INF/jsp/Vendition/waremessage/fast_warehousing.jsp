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
					<div class="col-xs-12" >
					
					<iframe id="hiddenIframe" style="display: none;" ></iframe>
					<form action="waremessage/${msg }.do" name="Form" id="Form" method="post"  target="hiddenIframe"  >
						<input type="hidden" name="WAREMESSAGE_ID" id="WAREMESSAGE_ID" value="${pd.WAREMESSAGE_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;width: 70%;float: left;">
						   <fieldset>
						  		 <legend>基础信息（必填）</legend>
						   			<table id="table_report" class="table table-striped table-bordered table-hover">
						   				<tr>
											<td style="width:115px;text-align: right;padding-top: 13px;">商品条形码:</td>
											<td colspan="5">
												<input tabindex="1"  type="text" name="WARE_BARCODE" id="WARE_BARCODE" value="${pd.WARE_BARCODE}" maxlength="255" placeholder="这里输入商品条形码" title="商品条形码" style="width:98%;"/>
											</td>
										</tr>
						   			</table>
						   </fieldset>
						
						  <fieldset>
						 <legend>商品基本信息</legend>
								<table id="table_report" class="table table-striped table-bordered table-hover">
									<tr>
										<td style="width:20%;text-align: right;padding-top: 13px;">商品名称:</td>
										<td colspan="5">
											 ${pd.WARENAME}
										</td>
									</tr>
				   					<tr>	
										
										<td style="text-align: right;padding-top: 13px;">商品单位:</td>
										<td>
											 ${pd.UNIT}
										</td>
									</tr>
				   					<tr>
										<td style="text-align: right;padding-top: 13px;">商品货号:</td>
										<td  >
											${pd.ARTNO}
										</td>
									</tr>
									</table>
									<table>
					   					<tr>
											<td style="width:75px;text-align: center;" >库存:</td>
											<td style="width:75px;"> ${pd.STOCK}</td>
											
											<td style="width:75px;text-align: center;" >当前进阶</td>
											<td style="width:75px;">${pd.STOCKPRICE}</td>
											
											<td style="width:75px;text-align: center;">当前销售:</td>
											<td style="width:75px;"><span style="text-align: center;">${pd.RATE}</span> </td>
										</tr>   
						  		     </table>
					  		 </fieldset>
					  		 
					  		  <fieldset>
								 <legend>本次进货</legend>
									<table id="table_report" class="table table-striped table-bordered table-hover">
										<tr>
											<td>本次进阶</td>
											<td>
												<input type="text" name="STOCKPRICE" id="STOCKPRICE" value="${pd.STOCKPRICE}" maxlength="255" placeholder="这里输入进货价" title="进货价" style="width:98%;"/>
											</td>
											<td>采购数量</td>
											<td>
												<input type="text" name="PurchaseNum" id="PurchaseNum" value="0" maxlength="255" placeholder="这里输入采购双" title="采购数量" style="width:98%;"/>
											</td>
										</tr>
								</table>
							</fieldset>
							  <table id="table_report" class="table table-striped table-bordered table-hover">
								 <tr>
								 	<td>&nbsp;</td>
									<td style="text-align:right;" colspan="10">
									
									<a class="btn btn-mini btn-danger" tabindex="21"  onclick="top.Dialog.close();"> 关  闭 (ESC) </a>
										<a class="btn btn-mini btn-primary" tabindex="20" onclick="save();"> 入库(Enter)</a>
										
									</td>
								</tr>  
							  </table>
							  
							  
						</div>
							<div 	 style="float: right;margin-top: 50px;">
									<textarea id="editLog" rows="20" cols="22"></textarea>
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
			
			if($("#PurchaseNum").val()==""){
				$("#PurchaseNum").tips({
					side:3,
		            msg:'请输入商品编号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PurchaseNum").focus();
			return false; 
			}  
		 
			$.ajax({
				type: "POST",
				url: 'waremessage/${msg }.do',
		    	data: {
		    		"WAREMESSAGE_ID":'${pd.WAREMESSAGE_ID}',
		    		"PurchaseNum":$("#PurchaseNum").val(),
		    		"STOCKPRICE":$("#STOCKPRICE").val()
		    	},
				dataType:'json',
				//beforeSend: validateData,
				cache: false,
				success: function(data){
					 var str= $("#editLog").val();
					 $("#editLog").val(str+"\n"+data["backresult"]);
				}
			});
			
			
			
			//$("#Form").submit();
		//	$("#zhongxin").hide();
	//	$("#zhongxin2").show();
		}
		 
		
		$(function() {
	 		$("#PurchaseNum").focus();
		});
		</script>
</body>
</html>