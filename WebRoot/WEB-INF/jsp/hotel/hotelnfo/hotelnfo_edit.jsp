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
	<script type="text/javascript" src="static/ace/js/jquery.js"></script>
	<!-- 上传插件 -->
	<link href="plugins/uploadify/uploadify.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="plugins/uploadify/swfobject.js"></script>
	<script type="text/javascript" src="plugins/uploadify/jquery.uploadify.v2.1.4.min.js"></script>
	<!-- 上传插件 -->
	<script type="text/javascript">
		var jsessionid = "<%=session.getId()%>";  //勿删，uploadify兼容火狐用到
	</script>
	 
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
					
					<form action="hotelnfo/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="HOTELNFO_ID" id="HOTELNFO_ID" value="${pd.HOTELNFO_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">酒店名称:</td>
								<td><input type="text" name="NAME" id="NAME" value="${pd.NAME}" maxlength="255" placeholder="这里输入酒店名称" title="酒店名称" style="width:98%;"/></td>
							</tr>
							<tr>
							<td style="width:75px;text-align: right;padding-top: 13px;">登录账号:</td>
							<td> <input type="text" name="LOGINNAME" id="LOGINNAME" value="${pd.LOGINNAME}" maxlength="255" placeholder="这里输入编辑人" title="编辑人" style="width:98%;"/>
							</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">联系电话 :</td>
								<td><input type="text" name="PHONE" id="PHONE" value="${pd.PHONE}" maxlength="255" placeholder="这里输入联系电话 " title="联系电话 " style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">屏幕布局 :</td>
								<td>
									<select class="chosen-select form-control" name="SCREENLAYOUT" id="SCREENLAYOUT" data-placeholder="请选择屏幕布局" style="vertical-align:top;"  title="屏幕布局" style="width:98%;" >
										<option value="全屏图文">全屏图文</option>
										<option value="二分之一">二分之一</option>
										<option value="三分之二">三分之二</option>
										<option value="全屏视频">全屏视频</option>
									</select>
								 </td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">当前模板 :</td>
								<td>
									<select class="chosen-select form-control" name="CURRENTTEMP" id="CURRENTTEMP" data-placeholder="请选择模板" style="vertical-align:top;"  title="级别" style="width:98%;" >
										<option value="0">麗枫酒店</option>
										<option value="1">非繁城品</option>
										<option value="2">梦幻迷城</option>
										<option value="3">面纱之美</option>
										<option value="4">紫金格兰</option>
										<option value="5">圣光女神</option>
										<option value="6">海光漫日</option>
										<option value="7">黄金斗士</option>
										<option value="8">福光蟾蜍</option>
										<option value="9">星斗疑云</option>
									</select>
								
								 </td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">背景图片:</td>
								<td>
								<input type="hidden" name="bkvalue" id="bkvalue" value="${pd.BACKGROUDIMG}" />
									<select class="chosen-select form-control" name="BACKGROUDIMG" id="BACKGROUDIMG" data-placeholder="请选择背景" style="vertical-align:top;"  title="级别" style="width:98%;" >
										<option value=""></option>
									</select>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">logo图片:</td>
								<td>
									<input type="file" name="File_name" id="uploadify1" keepDefaultStyle = "true"/>
									<input type="text" name="LOGOIMG" id="LOGOIMG" value="${pd.LOGOIMG}"/>
								</td>
								
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">提醒内容:</td>
								<td>
								<textarea style="width:95%;height:80px;" rows="10" cols="10" name="CONTENT" id="CONTENT" title="提醒内容" maxlength="1000" placeholder="这里输入内容">
								</textarea>
											<div><font color="#808080">请不要多于255字否则无法发送</font></div>
								
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">播放类型:</td>
								<td>
								<select class="chosen-select form-control" name="PLAYTYPE" id="PLAYTYPE" data-placeholder="请选择模板" style="vertical-align:top;"  title="播放类型" style="width:98%;" >
										<option value="图片">图片</option>
										<option value="视频">视频</option>
										<option value="电视">电视</option>
										<option value="直播">直播</option>
									</select>  
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">城市 :</td>
								<td><input type="text" name="CITY" id="CITY" value="${pd.CITY}" maxlength="255" placeholder="这里输入城市 " title="城市 " style="width:98%;"/></td>
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
			if($("#NAME").val()==""){
				$("#NAME").tips({
					side:3,
		            msg:'请输入酒店名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#NAME").focus();
			return false;
			}
			if($("#PHONE").val()==""){
				$("#PHONE").tips({
					side:3,
		            msg:'请输入联系电话 ',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PHONE").focus();
			return false;
			}
			if($("#CURRENTTEMP").val()==""){
				$("#CURRENTTEMP").tips({
					side:3,
		            msg:'请输入当前模板 ',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CURRENTTEMP").focus();
			return false;
			}
		 
			if($("#CITY").val()==""){
				$("#CITY").tips({
					side:3,
		            msg:'请输入城市 ',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CITY").focus();
			return false;
			}
			
			var logoimg=$("#LOGOIMG").val();
			if(logoimg.length>0){
				$("#Form").submit();
				$("#zhongxin").hide();
				$("#zhongxin2").show();
			}else{
				$('#uploadify1').uploadifyUpload();
			}
			
		}
		
	
		
		$(function() { 	
			
				var content="${pd.CONTENT}";
				$("#CONTENT").html(content.replace(/(^\s+)/g, ""));    
				var sessionUserName='${sessionScope.sessionUser.USERNAME}'; 
				$("#LOGINNAME").val(sessionUserName);  
				$("#CURRENTTEMP").val("${pd.CURRENTTEMP}");
				$("#SCREENLAYOUT").val("${pd.SCREENLAYOUT}");
				$("#PLAYTYPE").val("${pd.PLAYTYPE}"); 
				 $.ajax({
			             url:'<%=basePath%>backgroundimg/listData.do',
			             /*预期服务器端返回的数据类型，假设我现在跨域了，我就改成jsonp 就可以了 */
			         dataType:"json",
			         success:function(data){
			        		console.info(data);
			        	 if(undefined!=data&&data.length>0){
			        		var bkvalue=$("#bkvalue").val();
			        		 for ( var i in data) {
			        			 
			        			 if(bkvalue==data[i].IMGPATH){  
			        				 $("#BACKGROUDIMG").append("<option value='"+data[i].IMGPATH+"' selected='selected'>"+data[i].IMGNAME+"</option>"); 
			        			 }else{
			        				 $("#BACKGROUDIMG").append("<option value='"+data[i].IMGPATH+"'>"+data[i].IMGNAME+"</option>");
			        			 }
			        			
							 }
			        	 }
			        		
			         }
				 }); 
			 
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
			var str='';
			 
			$("#uploadify1").uploadify({
				'buttonImg'	: 	"<%=basePath%>static/images/fileup.png",
				'uploader'	:	"<%=basePath%>plugins/uploadify/uploadify.swf",
				'script'    :	"<%=basePath%>plugins/uploadify/uploadFile.jsp;jsessionid="+jsessionid,
				'cancelImg' :	"<%=basePath%>plugins/uploadify/cancel.png",    
				'folder'	:	"<%=basePath%>uploadFiles/hotel/",//上传文件存放的路径,请保持与uploadFile.jsp中PATH的值相同
				'queueId'	:	"fileQueue",  
				'queueSizeLimit'	:	1,//限制上传文件的数量 
				//'fileExt'	:	"*.rar,*.zip",
				//'fileDesc'	:	"RAR *.rar",//限制文件类型
				'fileExt'     : '*.*;*.*;*.*',
				'fileDesc'    : 'Please choose(.*, .*, .*)',
				'auto'		:	false,
				'multi'		:	true,//是否允许多文件上传
				'simUploadLimit':	2,//同时运行上传的进程数量
				'buttonText':	"files",
				'scriptData':	{'uploadPath':'/uploadFiles/hotel/'},//这个参数用于传递用户自己的参数，此时'method' 必须设置为GET, 后台可以用request.getParameter('name')获取名字的值
				'method'	:	"GET",
				'onComplete':function(event,queueId,fileObj,response,data){  
				
					str = response.trim();//单个上传完毕执行 
				},
				'onAllComplete' : function(event,data) {
					//全部上传完毕执行
					$("#LOGOIMG").val(str);
					$("#Form").submit();
					$("#zhongxin").hide();
					$("#zhongxin2").show();
		    	},
		    	'onSelect' : function(event, queueId, fileObj){
		    		$("#hasTp1").val("ok");
		    	}
			});
					
		 
		//====================上传=================
			//清除空格
		String.prototype.trim=function(){
		     return this.replace(/(^\s*)|(\s*$)/g,'');
		};
		});
		</script>
</body>
</html>