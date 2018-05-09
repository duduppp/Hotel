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
					
					<form action="mediauser/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="MEDIAUSER_ID" id="MEDIAUSER_ID" value="${pd.MEDIAUSER_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">学习提醒:</td>
								<td><input class="span10 date-picker" name="REMINDLEARNING" id="REMINDLEARNING" value="${pd.REMINDLEARNING}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="学习提醒" title="学习提醒" style="width:58%;"/></td>
							</tr>
							<tr>
							 <td style="width:75px;text-align: right;padding-top: 13px;">角色:</td>
							 <td>
							  <input  name="ROLENAME" id="roleName" value="${pd.ROLENAME}" type="text" onclick="openRole();"  style="width:58%;"/></td>
							</tr> 
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">签到:</td>
								<td><input type="number" name="SIGN" id="SIGN" value="${pd.SIGN}" maxlength="32" placeholder="这里输入签到" title="签到" style="width:58%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">积分:</td>
								<td><input type="text" name="INTEGRAL" id="INTEGRAL" value="${pd.INTEGRAL}" maxlength="255" placeholder="这里输入积分" title="积分" style="width:58%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">昵称:</td>
								<td><input type="text" name="NICKNAME" id="NICKNAME" value="${pd.NICKNAME}" maxlength="255" placeholder="这里输入昵称" title="昵称" style="width:58%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">我的捐赠:</td>
								<td><input type="text" name="DONATION" id="DONATION" value="${pd.DONATION}" maxlength="255" placeholder="这里输入我的捐赠" title="我的捐赠" style="width:58%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">优惠券:</td>
								<td><input type="text" name="COUPON" id="COUPON" value="${pd.COUPON}" maxlength="255" placeholder="这里输入优惠券" title="优惠券" style="width:58%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">账号:</td>
								<td><input type="text" name="USERNAME" id="USERNAME" value="${pd.USERNAME}" maxlength="255" placeholder="这里输入账号" title="账号" style="width:58%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">头像图片:</td>
								<td><input type="text" name="PICPATH" id="PICPATH" value="${pd.PICPATH}" maxlength="255" placeholder="这里输入头像图片" title="头像图片" style="width:58%;"/></td>
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

<div id="divmenu" >
	<ul id="treeDemo" class="ztree" style="display: none;"></ul>
</div>
	
	
<!-- /.main-container -->
	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
	<link type="text/css" rel="stylesheet" href="plugins/zTree/3.5/zTreeStyle.css" />
	<script type="text/javascript" src="plugins/zTree/3.5/jquery.ztree.core-3.5.js"></script>
	<script type="text/javascript" src="plugins/zTree/3.5/jquery.ztree.excheck-3.5.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>  
	
	<script type="text/javascript"> 
		$(top.hangge());
		//保存
		function save(){
			if($("#REMINDLEARNING").val()==""){
				$("#REMINDLEARNING").tips({
					side:3,
		            msg:'请输入学习提醒',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#REMINDLEARNING").focus();
			return false;
			}
			if($("#SIGN").val()==""){
				$("#SIGN").tips({
					side:3,
		            msg:'请输入签到',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SIGN").focus();
			return false;
			}
			if($("#INTEGRAL").val()==""){
				$("#INTEGRAL").tips({
					side:3,
		            msg:'请输入积分',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#INTEGRAL").focus();
			return false;
			}
			if($("#NICKNAME").val()==""){
				$("#NICKNAME").tips({
					side:3,
		            msg:'请输入昵称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#NICKNAME").focus();
			return false;
			}
			if($("#DONATION").val()==""){
				$("#DONATION").tips({
					side:3,
		            msg:'请输入我的捐赠',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#DONATION").focus();
			return false;
			}
			if($("#COUPON").val()==""){
				$("#COUPON").tips({
					side:3,
		            msg:'请输入优惠券',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#COUPON").focus();
			return false;
			}
			if($("#USERNAME").val()==""){
				$("#USERNAME").tips({
					side:3,
		            msg:'请输入账号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#USERNAME").focus();
			return false;
			}
			if($("#PICPATH").val()==""){
				$("#PICPATH").tips({
					side:3,
		            msg:'请输入头像图片',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PICPATH").focus();
			return false;
			}
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		var zTreeObj;
		var setting = { 
				check: {
					enable: true,
					chkboxType: {"Y" : "s", "N" : "s"}  // "Y" : "s", "N" : "s"  子关联  "Y" : "p", "N" : "p" 父关联
				},
				data: { 
					simpleData: {
						enable: true
					}
				},
				    showLine: true,
				    isSimpleData : true,   
			        treeNodeKey : "id",  
			    
			       
			        treeNodeParentKey : "id",
		 			callback: {
					onCheck: onCheck
				}  
			}; 
			
			var zNodes = [{
				name : "董事长",
				checked:false,
				open : true,
				children : [  {
					name : "经理",
					checked:false,
					open : true,
					children : [ {
						name : "副经理" ,checked:false,
						open : true,
						children : [ {  
							name : "总监" ,checked:false,
							open : true,
							children : [ {
								name : "部长" ,checked:false,
								open : true,
								children : [ {
									name : "员工" ,checked:false
								}]
							}]
						}]
					} ]
				}]
						
			}];
			function onCheck(e, treeId, treeNode) {  
			    var msg="";
			    var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
			    
		        var nodes = treeObj.getCheckedNodes(true); 		    
		        for (var i = 0; i < nodes.length; i++) {
		            msg += nodes[i].name+",";
		        }
		        if(nodes.length>0){
		        	msg=msg.substring(0,msg.length-1);
		        }
		       $("#roleName").val(msg);
		       $("#divmenu").hide();  
			}  
		$(function() {  
			  
			//日期框
		     zTreeObj = $.fn.zTree.init($("#treeDemo"), setting,zNodes); 
		}); 
		
		//选择角色
		function openRole(){
			var roleName = $("#roleName");
			var roleNameOffset = $("#roleName").offset();
			$("#treeDemo").css({
				left:roleNameOffset.left + "px", 
				top:roleNameOffset.top + roleName.outerHeight() + "px",  
				position:'absolute' 
				}).slideDown("fast");
		    $("#divmenu").show(); 
		}
		</script>
</body>
</html>