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
					
					<form action="vipuser/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="VIPUSER_ID" id="VIPUSER_ID" value="${pd.VIPUSER_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:120px;text-align: right;padding-top: 13px;">会员卡号:</td>
								<td colspan="3">
								<input type="text" name="CARDNO" id="CARDNO" value="${pd.CARDNO}" maxlength="255" placeholder="这里输入会员卡号" title="会员卡号" style="width:85%;"/>
										<a class="btn btn-mini btn-success" style="float: right;" onclick="makeCardNo();">默认生成</a>
								</td>
							</tr>
							<tr>
								<td style="text-align: right;padding-top: 13px;">会员密码:</td>
								<td colspan="3">
									<input type="password" name="PASSWORD" id="PASSWORD" value="${pd.PASSWORD}" maxlength="255" placeholder="这里输入会员密码" title="会员密码" style="width:80%;"/>
								<a class="btn btn-mini btn-success" style="float: right;" onclick="setDefaultPwd();">默认生成(123456)</a>
								</td>
							</tr>
							<tr>
								<td style="text-align: right;padding-top: 13px;">确认密码:</td>
								<td colspan="3"><input type="password" name="REPASSWORD" id="REPASSWORD"  maxlength="255" placeholder="这里输入会员密码" title="会员密码" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="text-align: right;padding-top: 13px;">会员类型:</td>
								<td colspan="3">
									<select class="chosen-select form-control" name="VIPTYPE" id="VIPTYPE" data-placeholder="请选择">
									</select> 
									<input type="hidden" name="DISCOUNT" id="DISCOUNT" value="${pd.DISCOUNT}" maxlength="255" placeholder="这里输入折扣" title="折扣" style="width:98%;"/>
								</td>
							</tr>
						 
							<tr>
								<td style="text-align: right;padding-top: 13px;">姓名:</td>
								<td colspan="3"><input type="text" name="NAME" id="NAME" value="${pd.NAME}" maxlength="255" placeholder="这里输入姓名" title="姓名" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="text-align: right;padding-top: 13px;">电话:</td>
								<td  ><input type="text" name="TEL" id="TEL" value="${pd.TEL}" maxlength="255" placeholder="这里输入电话" title="电话" style="width:98%;"/></td>
						 
								<td style="text-align: right;padding-top: 13px;">生日:</td>
								<td  ><input class="span10 date-picker" name="BRITHDAY" id="BRITHDAY" value="${pd.BRITHDAY}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="生日" title="生日" style="width:98%;"/></td>
						 
							</tr>
							<tr>
								<td style="text-align: right;padding-top: 13px;">地址:</td>
								<td colspan="3"><input type="text" name="ADDRESS" id="ADDRESS" value="${pd.ADDRESS}" maxlength="255" placeholder="这里输入地址" title="地址" style="width:98%;"/></td>
							</tr>
							
							<tr>
								<td style="text-align: right;padding-top: 13px;">初始存值:</td>
								<td><input type="number" name="STORAGEBALANCE" id="STORAGEBALANCE" value="${pd.STORAGEBALANCE}" maxlength="255" placeholder="这里输入存储余额" title="存储余额" style="width:98%;"/></td>
								<td style="width:120px; text-align: right;padding-top: 13px;">初始存卷:</td>
								<td>
								<input type="number" name="INVENTORYBALANCE" id="INVENTORYBALANCE" value="${pd.INVENTORYBALANCE}" maxlength="255" placeholder="这里输入存卷余额" title="存卷余额" style="width:98%;"/>
								<input type="hidden" name="INTEGRAL" id="INTEGRAL" value="${pd.INTEGRAL}" maxlength="255" placeholder="这里输入积分" title="积分" style="width:98%;"/>
								</td>
							</tr>
							<tr>
						
							</tr>
							<tr>
								<td style="text-align: right;padding-top: 13px;">开卡时间 :</td>
								<td  ><input class="span10 date-picker" name="OPENCARDTIME" id="OPENCARDTIME" value="${pd.OPENCARDTIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="开卡时间 " title="开卡时间 " style="width:98%;"/></td>
								<td style="text-align: right;padding-top: 13px;">有效时间:</td>
								<td  >
								<input  name="EXPIRATIONDATE" id="EXPIRATIONDATE" value="${pd.EXPIRATIONDATE}" type="text" maxlength="255" placeholder="这里输入时间" title="有效时间" style="width:90%;"/>
								天</td>
							</tr>
							<tr>
								<td style="text-align: right;padding-top: 13px;">备注:</td>
								<td colspan="3">
								<input type="text" name="REMARK" id="REMARK" value="${pd.REMARK}" maxlength="255" placeholder="这里输入备注" title="备注" style="width:98%;"/></td>
							</tr>
							
							<tr>
								<td colspan="4" style="text-align: center;" colspan="10">
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
			if($("#CARDNO").val()==""){
				$("#CARDNO").tips({
					side:3,
		            msg:'请输入会员卡号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CARDNO").focus();
			return false;
			}
	 
			if($("#NAME").val()==""){
				$("#NAME").tips({
					side:3,
		            msg:'请输入姓名',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#NAME").focus();
			return false;
			}
		 
			if($("#STORAGEBALANCE").val()==""){
				$("#STORAGEBALANCE").tips({
					side:3,
		            msg:'请输入存储余额',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#STORAGEBALANCE").focus();
			return false;
			}
			if($("#INVENTORYBALANCE").val()==""){
				$("#INVENTORYBALANCE").tips({
					side:3,
		            msg:'请输入存卷余额',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#INVENTORYBALANCE").focus();
			return false;
			}
		 
			if($("#OPENCARDTIME").val()==""){
				$("#OPENCARDTIME").tips({
					side:3,
		            msg:'请输入开卡时间 ',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#OPENCARDTIME").focus();
			return false;
			}
			if($("#EXPIRATIONDATE").val()==""){
				$("#EXPIRATIONDATE").tips({
					side:3,
		            msg:'请输入过期日期',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#EXPIRATIONDATE").focus();
			return false;
			}
		 
			if($("#PASSWORD").val()==""){
				$("#PASSWORD").tips({
					side:3,
		            msg:'请输入会员密码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PASSWORD").focus();
			return false;
			}
			  
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		/**
		 * 加载会员类型
		 */
		function loadUserType(){
			
			$.ajax({ 
				url:'<%=basePath%>usergrade/listData.do',
				dataType:'json',
				success:function(result){
					//加载会员等级 usergrade
					for(var i in result){
						 var usergrade=result[i];
						 
							$("#VIPTYPE").append("<option value='"+usergrade["NAME"]+"' dicount='"+usergrade["DISCOUNT"]+"'>"+usergrade["NAME"]+"</option>");
					}
				 
				}
			});
			
			
		}
		
		/**
		* 生成默认的会员卡号
		*/
		function makeCardNo(){
			
			var no = randomNum(1, 1);
			
			$("#CARDNO").val(no);
			
		}
		
		function setDefaultPwd(){
			
			$("#PASSWORD").val("123456");
			$("#REPASSWORD").val("123456");
		}
		
		function randomNum(minNum, maxNum) {
			var today = new Date();
			var day = today.getDate(); //获取当前日(1-31)
			var month = today.getMonth() + 1; //显示月份比实际月份小1,所以要加1
			var year = today.getYear(); //获取完整的年份(4位,1970-????)  getFullYear()
			var years = today.getFullYear();
			years = years < 99 ? "20" + years : years;
			month = month < 10 ? "0" + month : month; //数字<10，实际显示为，如5，要改成05
			day = day < 10 ? "0" + day : day;
			var hh = today.getHours();
			hh = hh < 10 ? "0" + hh : hh;
			var ii = today.getMinutes();
			ii = ii < 10 ? "0" + ii : ii;
			var ss = today.getSeconds();
			ss = ss < 10 ? "0" + ss : ss;
			var dada = years + month + day + hh + ii + ss; //时间不能直接相加，要这样相加！！！14位

			switch (arguments.length) {
			case 1:
				return dada + parseInt(Math.random() * minNum + 1, 10);
				break;
			case 2:
				return dada + parseInt(Math.random() * (maxNum - minNum + 1) + minNum, 10);
				break;
			default:
				return 0;
				break;
			}
		}
	
		 function setdefaultData(){
			 if('${pd.VIPUSER_ID}'==""){
				 $("#STORAGEBALANCE").val(0);
				 $("#INVENTORYBALANCE").val(0);
				 //开卡时间为当前时间
			 	 $("#INTEGRAL").val(0); 
				 $("#STORAGEBALANCE").val(0); 
				 $("#BRITHDAY").val("1983-01-01");
				 $("#EXPIRATIONDATE").val(720); 
				 $('#OPENCARDTIME').val(formatDateTime(new Date()));
			 }
		 }
		 
		 //格式化时间
		 var formatDateTime = function (date) {  
             var y = date.getFullYear();  
             var m = date.getMonth() + 1;  
             m = m < 10 ? ('0' + m) : m;  
             var d = date.getDate();  
             d = d < 10 ? ('0' + d) : d;  
           
             return y + '-' + m + '-' + d;  
         }; 
         
         function setVIPTYPE(){
        	 
        	 
        	 $("#VIPTYPE").change(function(){
        		 var ss= $(this).children('option:selected').val();
        		 var discount= $(this).children('option:selected').attr("dicount");
        		 $("#DISCOUNT").val(discount);
        		 
        	 });
        	 
         }
		$(function() {
			//日期框
			setVIPTYPE();
		
		 	$('.date-picker').datepicker({autoclose: true,todayHighlight: true, defaultDate : new Date()});
			setdefaultData();
			loadUserType();
		});
		</script>
</body>
</html>