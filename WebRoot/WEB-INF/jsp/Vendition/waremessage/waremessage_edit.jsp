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
					
					<form action="waremessage/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="WAREMESSAGE_ID" id="WAREMESSAGE_ID" value="${pd.WAREMESSAGE_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						   <fieldset>
						  		 <legend>基础信息（必填）</legend>
						   			<table id="table_report" class="table table-striped table-bordered table-hover">
						   				<tr>
											<td style="width:115px;text-align: right;padding-top: 13px;">商品条形码:</td>
											<td colspan="5">
												<input tabindex="1"  type="text" name="WARE_BARCODE" id="WARE_BARCODE" value="${pd.WARE_BARCODE}" maxlength="255" placeholder="这里输入商品条形码" title="商品条形码" style="width:98%;"/>
											</td>
										</tr>
										<tr>
											<td style="width:115px;text-align: right;padding-top: 13px;">商品名称:</td>
											<td colspan="5">
											<input type="text" name="WARENAME" id="WARENAME" value="${pd.WARENAME}" maxlength="255" placeholder="这里输入商品名称" title="商品名称" style="width:98%;"/></td>
										</tr>
					   					<tr>
											<td style="width:75px;text-align: right;padding-top: 13px;">商品原价:</td>
											<td><input type="text" name="RATE" id="RATE" value="${pd.RATE}" maxlength="255" placeholder="这里输入商品原价" title="商品原价" style="width:98%;"/></td>
											<td style="width:75px;text-align: right;padding-top: 13px;">购物卷:</td>
											<td><input type="text" name="SHOPPINGPRICE" id="SHOPPINGPRICE" value="${pd.SHOPPINGPRICE}" maxlength="255" placeholder="这里输入购物卷" title="购物卷" style="width:98%;"/></td>
						  
											<td style="width:75px;text-align: right;padding-top: 13px;">库存:</td>
											<td><input type="text" name="STOCK" id="STOCK" value="${pd.STOCK}" maxlength="255" placeholder="这里输入库存" title="库存" style="width:98%;"/></td>
										</tr>   
						   			</table>
						   </fieldset>
						
						  <fieldset>
						 <legend>其他信息</legend>
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr> 
								<td style="width:100px;text-align: right;padding-top: 13px;">商品货号:</td>
								<td  style="width:80px;">
									<input type="text"   name="ARTNO" id="ARTNO" value="${pd.ARTNO}" maxlength="50" placeholder="这里输入商品编号" title="商品编号"  />
								</td>
						
								<td style="width:100px;text-align: right;padding-top: 13px;">拼音码:</td>
								<td style="width:80px;" >
									<input type="text" name="PINYIN" id="PINYIN" value="${pd.PINYIN}" maxlength="50"  title="商品拼音"  />
								</td>
							</tr>
							
							<tr>
								<td style="text-align: right;padding-top: 13px;">商品单位:</td>
								<td>
										<select class="chosen-select form-control" name="UNIT" id="UNIT" data-placeholder="请选择">
									 	<option value=""></option>
									 	</select>
								</td>
								<td style="text-align: right;padding-top: 13px;">商品分类:</td>
								<td>
									<input type="text" name="WARESTYPES" id="WARESTYPES" value="${pd.WARESTYPES}" maxlength="255" placeholder="这里输入商品分类" title="商品分类"/>
								</td>
								
							</tr>
							<tr>
								<td style="text-align: right;padding-top: 13px;">规格:</td>
								<td><input type="text" name="STANDARD" id="STANDARD" value="${pd.STANDARD}" maxlength="255" placeholder="这里输入规格" title="规格"  /></td>
								
								<td style="text-align: right;padding-top: 13px;">供货商:</td>
								<td>
										<select class="chosen-select form-control" name="SUPPLIER" id="SUPPLIER" data-placeholder="请选择">
									 	 <option value=""></option>
									 	</select>
								</td>
							</tr>
							<tr>
								<td style="text-align: right;padding-top: 13px;">会员价:</td>
								<td><input type="text" name="VIPPRICE" id="VIPPRICE" value="${pd.VIPPRICE}" maxlength="255" placeholder="这里输入会员价" title="会员价" /></td>
								<td style="text-align: right;padding-top: 13px;">生产日期:</td>
								<td>
									 <input class="span10 date-picker" name="PRODUCTDATE" id="PRODUCTDATE" value="${pd.PRODUCTDATE}" 
									    type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:150px;" placeholder="生产日期" title="生产日期">
								</td>
							</tr>						
							
							<tr>
								<td style="text-align: right;padding-top: 13px;">进货价:</td>
								<td>
								<input type="text" name="STOCKPRICE" id="STOCKPRICE" value="${pd.STOCKPRICE}" maxlength="255" placeholder="这里输入库存价格" title="库存价格" /></td>
								<td style="text-align: right;padding-top: 13px;">保质期:</td>
								<td>
									<input class="span10 date-picker" name="QUALITYDATE" id="QUALITYDATE" value="${pd.QUALITYDATE}" 
									    type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:150px;" placeholder="这里输入保质期" title="保质期">
								</td>
							</tr> 
							<tr>
								<td style="text-align: right;padding-top: 13px;">允许打折:</td>
								<td>
									<input type="radio" value="1" name="DISCOUNT_STATUS" id="DISCOUNT_STATUS1" checked="checked">是
									<input type="radio" value="0" name="DISCOUNT_STATUS" id="DISCOUNT_STATUS0" >否
								</td>
								<td rowspan="3">备注</td>
								<td rowspan="3">
								 <textarea rows="6" id="REMARK" name="REMARK"   cols="25">${pd.REMARK}</textarea>	
								</td>
							</tr>
							<tr>
								<td style=" text-align: right;padding-top: 13px;">是否积分:</td>
								<td>
									<input name="INTEGRAL_STATUS" id="INTEGRAL_STATUS1" type="radio" value="1" checked="checked">是
									<input name="INTEGRAL_STATUS" id="INTEGRAL_STATUS0" type="radio" value="0">否
								</td>
							</tr>
							<tr>
								<td style=" text-align: right;padding-top: 13px;">每消费:</td>
								<td>
									<input type="text" value="${pd.CONSUM_AMOUNT}" id="CONSUM_AMOUNT" name="CONSUM_AMOUNT">元 积1分
								</td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="10">
									<input type="hidden" value="${status}" id="status" name="status">
									<a class="btn btn-mini btn-primary" tabindex="20" onclick="save();">保存</a>
									<a class="btn btn-mini btn-danger" tabindex="21"  onclick="top.Dialog.close();">取消</a>
								</td>
							</tr>
						</table>
						</fieldset>
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
			if($("#WAREID").val()==""){
				$("#WAREID").tips({
					side:3,
		            msg:'请输入商品编号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#WAREID").focus();
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
		 
			if($("#UNIT").val()==""){
				$("#UNIT").tips({
					side:3,
		            msg:'请输入单位',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#UNIT").focus();
			return false;
			}
			if($("#RATE").val()==""){
				$("#RATE").tips({
					side:3,
		            msg:'请输入商品原价',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#RATE").focus();
			return false;
			}
		 
			if($("#VIPPRICE").val()==""){
				$("#VIPPRICE").tips({
					side:3,
		            msg:'请输入会员价',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#VIPPRICE").focus();
			return false;
			}
			if($("#SHOPPINGPRICE").val()==""){
				$("#SHOPPINGPRICE").tips({
					side:3,
		            msg:'请输入购物价',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SHOPPINGPRICE").focus();
			return false;
			}
			if($("#STOCK").val()==""){
				$("#STOCK").tips({
					side:3,
		            msg:'请输入库存',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#STOCK").focus();
			return false;
			}
			if($("#STOCKPRICE").val()==""){
				$("#STOCKPRICE").tips({
					side:3,
		            msg:'请输入库存价格',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#STOCKPRICE").focus();
			return false;
			}
			if($("#ARTNO").val()==""){
				$("#ARTNO").tips({
					side:3,
		            msg:'请输入货号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ARTNO").focus();
			return false;
			}
			if($("#WARESTYPES").val()==""){
				$("#WARESTYPES").tips({
					side:3,
		            msg:'请输入商品分类',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#WARESTYPES").focus();
			return false;
			}
			if($("#SUPPLIER").val()==""){
				$("#SUPPLIER").tips({
					side:3,
		            msg:'请输入供货商',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SUPPLIER").focus();
			return false;
			}
			if($("#PRODUCTDATE").val()==""){
				$("#PRODUCTDATE").tips({
					side:3,
		            msg:'请输入生产日期',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PRODUCTDATE").focus();
			return false;
			}
			if($("#QUALITYDATE").val()==""){
				$("#QUALITYDATE").tips({
					side:3,
		            msg:'请输入保质期',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#QUALITYDATE").focus();
			return false;
			}
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		
		//ajax 处理中文转成拼音
		
		function  convert2Pinyin(){
			
			$("#WARENAME").blur(function(){ 
				var warename=$(this).val();
				var timedate=new Date().getTime();      
				$.ajax({
					type: "POST",
					url:'<%=basePath %>productunit/SpellCnHelper.do?tm='+timedate,
					data:{
						name:warename
					},
					//dataType:'json',
					success: function(data){
						$("#PINYIN").val(data); 
					}
				});
			});
			
		}
		
		$(function() {
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});

			
			 var status='${status}';
			 if(status=="1"){
				 $("#WAREMESSAGE_ID").val(""); 
			 }
			$("#WARE_BARCODE").focus();
			
			var diccountStatus='${pd.DISCOUNT_STATUS }';
			$("#DISCOUNT_STATUS"+diccountStatus).attr("checked",true);
			
			var  integralStatus='${pd.INTEGRAL_STATUS }';
			$("#INTEGRAL_STATUS"+integralStatus).attr("checked",true); 
			 
			convert2Pinyin();
				$.ajax({
					type: "POST",
					url: '<%=basePath %>productunit/getProUnit.do', 
					dataType:'json', 
					cache: false,   
					success: function(data){
					
						var serverManList=data["proUnitList"];
						//这里需要加载供货商的信息
						$("#UNIT").html('<option>请选择</option>');
						$.each(serverManList, function(i, dvar){ 
								$("#UNIT").append("<option value="+dvar.UNITNAME+">"+dvar.UNITNAME+"</option>");
						});
						var proUnitList=data["serverManList"];
						 $.each(proUnitList, function(i, dvar){ 
								$("#SUPPLIER").append("<option value="+dvar.SERVENAME+">"+dvar.SERVENAME+"</option>");
						 });
						  
						 //生产日期,保质期
						 var unit='${pd.UNIT}';
						 var supplier='${pd.SUPPLIER}';	
						 $("#UNIT").val(unit);
						 $("#SUPPLIER").val(supplier); 
					}
				}); 
				
				//UNIT
		});
		</script>
</body>
</html>