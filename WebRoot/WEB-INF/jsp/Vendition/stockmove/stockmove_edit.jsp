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
	 
	<!-- bootstrap & fontawesome -->
	<link rel="stylesheet" href="static/ace/css/bootstrap.css" />
	<link rel="stylesheet" href="static/ace/css/font-awesome.css" />
	
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
					
					<form action="stockmove/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="STOCKMOVE_ID" id="STOCKMOVE_ID" value="${pd.STOCKMOVE_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:100px;text-align: right;padding-top: 13px;">商品条码:</td>
								<td>
									<select class="myware2 chosen-select form-control" name="WARE_BARCODE" id="WARE_BARCODE" data-placeholder="这里输入商品条码" style="vertical-align:top;"  title="级别" style="width:90%;" >
										<option value=""></option>
									</select>
									</td>
							</tr>
							<tr>
								<td style="text-align: right;padding-top: 13px;">商品名称:</td>
								<td>
									<select class="myware chosen-select form-control" name="WARENAME" id="WARENAME" data-placeholder="这里输入商品条码" style="vertical-align:top;"  title="级别" style="width:90%;" >
										<option value=""></option>
									</select>
								</td>
							</tr>
							<tr>
								<td style="text-align: right;padding-top: 13px;">规格:</td>
								<td><input type="text" name="STANDARD" id="STANDARD" value="${pd.STANDARD}" maxlength="255" placeholder="这里输入规格" title="规格" style="width:90%;"/></td>
							</tr>
							<tr>
								<td style="text-align: right;padding-top: 13px;">异动原因:</td>
								<td>
								
								 <select class="chosen-select form-control" name="MOVERESON" id="MOVERESON" data-placeholder="请选择异动原因">
									<option value="其他">其他</option> 
									<option value="损坏">损坏</option>
									<option value="退货">退货</option>
									<option value="自用">自用</option>
									<option value="赠送">赠送</option>
								 </select>
								 </td> 	 	
							</tr>
							<tr>
								<td style="text-align: right;padding-top: 13px;">数量:</td>
								<td><input type="number" name="STOCK" id="STOCK" value="${pd.STOCK}" maxlength="32" placeholder="这里输入数量" title="数量" style="width:90%;"/></td>
							</tr>
							<tr>
								<td style="text-align: right;padding-top: 13px;">异动日期:</td>
								<td><input class="span10 date-picker" name="MOVEDATE" id="MOVEDATE" value="${pd.MOVEDATE}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="异动日期" title="异动日期" style="width:90%;"/></td>
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
	<script src="static/ace/js/bootstrap.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
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
			if($("#PRODUCTDATE").val()==""){
				$("#PRODUCTDATE").tips({
					side:3,
		            msg:'请输入创建时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PRODUCTDATE").focus();
			return false;
			}
			if($("#WARE_BARCODE").val()==""){
				$("#WARE_BARCODE").tips({
					side:3,
		            msg:'请输入商品条码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#WARE_BARCODE").focus();
			return false;
			}
			if($("#WARENAME").val()==""){
				$("#WARENAME").tips({
					side:3,
		            msg:'请输入商品名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#WARENAME").focus();
			return false;
			}
			if($("#STANDARD").val()==""){
				$("#STANDARD").tips({
					side:3,
		            msg:'请输入规格',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#STANDARD").focus();
			return false;
			}
			if($("#MOVERESON").val()==""){
				$("#MOVERESON").tips({
					side:3,
		            msg:'请输入异动原因',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MOVERESON").focus();
			return false;
			}
			if($("#STOCK").val()==""){
				$("#STOCK").tips({
					side:3,
		            msg:'请输入数量',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#STOCK").focus();
			return false;
			}
			if($("#MOVEDATE").val()==""){
				$("#MOVEDATE").tips({
					side:3,
		            msg:'请输入异动日期',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MOVEDATE").focus();
			return false;
			}
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		function loadSelectedData(){
		 
				var ware_barcode="";//$(this).val(); 
				$.ajax({
					type: "POST",
					url: '<%=basePath%>waremessage/findWare.do',
			    	data: {
			    		"WARE_BARCODE":ware_barcode 
			    	},
					dataType:'json',
					success: function(data){ 
					 
						if(null!=data){
							
						    var optStr="",optSelected="";
							for(var i=0;i<data.length;i++){	
								var wareArr=data[i]; 
							    var warebarCode=wareArr["WARE_BARCODE"];
							    var wareName=wareArr["WARENAME"];
							    
							    var standard=wareArr["STANDARD"]; 
							    optSelected+="<option value =\""+i+"\">"+warebarCode+"</option>";
							    optStr+="<li class=\"active-result\" onclick=\"setData('"+warebarCode+"');\" data-option-array-index=\""+i+"\">"+warebarCode+"</li>";
								$("<option value='"+warebarCode+"' wareName='"+wareName+"' STANDARD="+standard+">"+warebarCode+"</option>").appendTo("#WARE_BARCODE"); 
								$("<option value='"+wareName+"' warebarCode='"+warebarCode+"' STANDARD="+standard+">"+wareName+"</option>").appendTo("#WARENAME");
							}
							 $(".chosen-select").trigger("liszt:updated");  
							 
						 } 
						 
						 $('.myware').chosen({
							 disable_search_threshold: 10,
							 no_results_text:"没有找到", 
							 allow_single_deselect:true
						 });
						 
						 $('.myware2').chosen({
							 disable_search_threshold: 10,
							 no_results_text:"没有找到", 
							 allow_single_deselect:true
						 });
						 
						 $(".myware2").on('change', function(e, params) {
							   
							 var selectedValue=  $(this).val();
							 var standard=  $("#WARE_BARCODE option[value='"+selectedValue+"']").attr("STANDARD");  
							 var wareName= $("#WARE_BARCODE option[value='"+selectedValue+"']").attr("wareName");  
							 $("#WARENAME option[value='"+wareName+"']").attr("selected","selected");  
							 $("#STANDARD").val(standard);
							 //link change
							 $('.myware').trigger('chosen:updated');
						  });  
						 
						  $(".myware").on('change', function(e, params) {
							  
							
							  var selectedValue=  $(this).val();
							  var standard= $("#WARENAME option[value='"+selectedValue+"']").attr("STANDARD");  
							  var warebarCode= $("#WARENAME option[value='"+selectedValue+"']").attr("warebarCode");  
							  $("#WARE_BARCODE option[value='"+warebarCode+"']").attr("selected","selected");  
							  $("#STANDARD").val(standard);
							  $('.myware2').trigger('chosen:updated');
						 });  
					}    
					    
				});
			  
		}
		
		
		function setData(data){ 
			
			$("#WARE_BARCODE  [value='"+data+"']").attr('selected','selected');
		 
		}
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
			loadSelectedData();  
	

		});
		</script>
</body>
</html>