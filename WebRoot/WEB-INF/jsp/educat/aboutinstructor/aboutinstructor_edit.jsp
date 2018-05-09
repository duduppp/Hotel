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
	<!-- 日期框 -->
	<link rel="stylesheet" href="static/ace/css/datepicker.css" /><!-- 上传插件 -->
	 
  
	<!-- 上传插件 -->
	<script type="text/javascript">
		var jsessionid = "<%=session.getId()%>";  //勿删，uploadify兼容火狐用到
	</script>
	<link href="<%=basePath%>plugins/uploadify/uploadify.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="<%=basePath%>plugins/uploadify/swfobject.js"></script>
	<script type="text/javascript" src="<%=basePath%>plugins/uploadify/jquery.uploadify.v2.1.4.min.js"></script>
	<script type="text/javascript">
	function userBinding(obj){
		 top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="绑定用户";
		 diag.URL = '<%=basePath%>user/listUsersForWindow.do';
		 diag.Width = 700;
		 diag.Height = 545;
		 diag.Modal = true;				//有无遮罩窗口
		 diag.ShowMaxButton = true;	//最大化按钮
	     diag.ShowMinButton = true;		//最小化按钮
		 diag.CancelEvent = function(){ //关闭事件
			if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
				var USERNAME = diag.innerFrame.contentWindow.document.getElementById('USERNAME').value;
				$(obj).val(USERNAME);
		 
			 }
			diag.close();
		 };
		 diag.show();
	}
	
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
						<input type="hidden" name="hasTp1" id="hasTp1" value="no">
					<form action="aboutinstructor/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="ABOUTINSTRUCTOR_ID" id="ABOUTINSTRUCTOR_ID" value="${pd.ABOUTINSTRUCTOR_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:95px;text-align: right;padding-top: 13px;">讲师名称:</td>
								<td style="width:305px;" >
								<input style="width:90%;" type="text" name="LECTURERNAME" id="LECTURERNAME" value="${pd.LECTURERNAME}" maxlength="255" placeholder="这里输入讲师名称" title="讲师名称" /></td>
								<td style="width:125px;text-align: right;padding-top: 13px;">个人荣誉:</td>
								<td> 
									<textarea style="width:90%;height:60px;" rows="10" cols="10" name="PERSONALHONOR" id="PERSONALHONOR" title="介绍" maxlength="1000"
									 placeholder="这里输入介绍">${pd.PERSONALHONOR}</textarea>
								</td>
							</tr> 
							<tr>
								<td>绑定用户</td>
								
								<td>  
									<input type="text" placeholder="选择用户" class="nav-search-input" id="nav-search-input" name="LOGINNAME" onclick="userBinding(this)" /> 
								</td> 
								<td>&nbsp;</td>
								<td>&nbsp;</td> 
							</tr>
							<tr>
								<td style="width:95px;text-align: right;padding-top: 13px;">介绍:</td>
								<td colspan="3" >
									<textarea style="width:95%;height:80px;" rows="10" cols="10" name="INTRODUCTION" id="INTRODUCTION" title="介绍" maxlength="1000" placeholder="这里输入介绍">${pd.INTRODUCTION}</textarea>
								</td> 
							</tr>
							 
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">展示图片</td>
								<td>
									<select style="width:90%;" class="chosen-select form-control" name="IMGSTATUS" id="IMGSTATUS" data-placeholder="请选择" style="vertical-align:top;width: 170px;">
										<option value="1" selected="selected" >图片一</option>
										<option value="2">图片二</option>
										<option value="3">图片三</option>
										<option value="4">图片四</option>
							   	 	</select>
								</td>
									<td style="width:75px;text-align: right;padding-top: 13px;">备注:</td>
								<td><input style="width:90%;" type="text" name="REMARK" id="REMARK" value="${pd.REMARK}" maxlength="255" placeholder="这里输入备注" title="备注" /></td>
							
							</tr>
							 
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">图片1:</td>
								<td>
									<input type="file" name="File_name" id="uploadify1" keepDefaultStyle="true"/>
								</td>
								<td>
								    <a class="btn btn-mini btn-primary" onclick="uploadimg('uploadify1','PICTURE1','img1');">上传</a>
								    <a class="btn btn-mini btn-primary" onclick="deleteimg('PICTURE1','img1');">删除</a>
								</td> 
								<td>
									<input type="hidden" name="PICTURE1" id="PICTURE1" value="${pd.PICTURE1}"   height="100">
									<img alt="" name="img1" id="img1" src="${pd.PICTURE1}"   height="80">
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">图片2:</td>
								<td>
									<input type="file" name="File_name" id="uploadify2" keepDefaultStyle = "true"/>
								</td>
								<td>
								 	<a class="btn btn-mini btn-primary" onclick="uploadimg('uploadify2','PICTURE2','img2');">上传</a>
									<a class="btn btn-mini btn-primary" onclick="deleteimg('PICTURE2','img2');">删除</a>
								 
								</td> 
								<td>
									<input type="hidden" name="PICTURE2" id="PICTURE2" value="${pd.PICTURE2}"   height="100">
									<img alt="" name="img2" id="img2" src="${pd.PICTURE2}"   height="80">
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">图片3:</td>
								<td>
									<input type="file" name="File_name" id="uploadify3" keepDefaultStyle = "true"/>
								</td>
								<td>
										<a class="btn btn-mini btn-primary" onclick="uploadimg('uploadify3','PICTURE3','img3');">上传</a>
										<a class="btn btn-mini btn-primary" onclick="deleteimg('PICTURE3','img3');">删除</a>
								</td>
								<td>
										<input type="hidden" name="PICTURE3" id="PICTURE3" value="${pd.PICTURE3}"   height="80">
										<img alt="" name="img3" id="img3" src="${pd.PICTURE3}"   height="80">
								</td> 
							
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">图片4:</td>
								<td>
									<input type="file" name="File_name" id="uploadify4" keepDefaultStyle = "true"/>
								</td>
								<td>
								
										<a class="btn btn-mini btn-primary" onclick="uploadimg('uploadify4','PICTURE4','img4');">上传</a>
										<a class="btn btn-mini btn-primary" onclick="deleteimg('PICTURE4','img4');">删除</a>
								</td> 
								<td>
									<input type="hidden" name="PICTURE4" id="PICTURE4" value="${pd.PICTURE4}"   height="80">
									<img alt="" name="img4" id="img4" src="${pd.PICTURE4}"   height="80">
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
	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
	<!-- 下拉框 -->
	<script src="static/ace/js/bootstrap.js"></script>
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
			
			if($("#LECTURERNAME").val()==""){
				$("#LECTURERNAME").tips({
					side:3,
		            msg:'请输入讲师名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#LECTURERNAME").focus();
			return false;
			}  
			$("#Form").submit(); 
			$("#zhongxin").hide();
			$("#zhongxin2").show();   
			 
		}
		
		function deleteimg(id,imgid){  
			
			var COURSEURL=$("#"+id).val();
			 
			bootbox.confirm("确定要删除吗?", function(result) { 
				if(result) {
					var url = "<%=basePath%>coursemanager/deletefile.do?fileurl="+COURSEURL+"&tm="+new Date().getTime();
					$.get(url,function(data){
					 
						if(data=="success"){
							$("#"+id).val("");
							$("#"+imgid).attr("src","");
							
							bootbox.alert("删除成功！");	
						}else{
							bootbox.alert("删除失败！"); 	
						}
					});
				}
			});
			
		}
		
		function uploadimg(upId,id){
			//先删除
			var imgid=$("#"+id).val();
			var url = "<%=basePath%>coursemanager/deletefile.do?fileurl="+imgid+"&tm="+new Date().getTime();
			$.get(url,function(data){
			 
				if(data=="success"){
					$('#'+upId).uploadifyUpload();
				}
			});
		}
		
		 
		function setUploadBtn(upId,id,imgid){
		 var str=""; 
			$("#"+upId).uploadify({   
				'buttonImg'	: 	"<%=basePath%>static/images/fileup.png",
				'uploader'	:	"<%=basePath%>plugins/uploadify/uploadify.swf",
				'script'    :	"<%=basePath%>plugins/uploadify/uploadFile.jsp;jsessionid="+jsessionid,
				'cancelImg' :	"<%=basePath%>plugins/uploadify/cancel.png",    
				'folder'	:	"<%=basePath%>uploadFiles/edu/",//上传文件存放的路径,请保持与uploadFile.jsp中PATH的值相同
				'queueId'	:	"fileQueue",  
				'displayData'    : 'speed',
				'queueSizeLimit'	:	1,//限制上传文件的数量 
				'fileExt'     : '*.GIF;*.gif;*.jpg;*.JPG;*.PNG;*.png',
				'fileDesc'    : 'Please choose(*.GIF,*.JPG,*.PNG)', 
				'auto'		:	false,
				'multi'		:	false,//是否允许多文件上传
				'simUploadLimit':	1,//同时运行上传的进程数量
				'buttonText':	"files",
				 'removeCompleted': true,
				'scriptData':	{'uploadPath':'/uploadFiles/edu/'},//这个参数用于传递用户自己的参数，此时'method' 必须设置为GET, 后台可以用request.getParameter('name')获取名字的值
				'method'	:	"GET",
				'onComplete':function(event,queueId,fileObj,response,data){  
					str = response.trim();//单个上传完毕执行  
				},
				'onAllComplete' : function(event,data) {
					//全部上传完毕执行
					$("#"+id).val("uploadFiles/edu/"+str);  
					$("#"+imgid).attr("src","uploadFiles/edu/"+str); 
					// $("#Form").submit();
				 	// $("#zhongxin").hide();
					//$("#zhongxin2").show();
		    	},
		    	 'onError': function(event, queueID, fileObj) {
		    	      alert("文件:" + fileObj.name + "上传失败");
		    	  },
		    	'onSelect' : function(event, queueId, fileObj){
		    		$("#hasTp1").val("ok");
		    	}
			});
		}
		
		$(function() {
			
			$("#IMGSTATUS").val(1);
			var status="${pd.IMGSTATUS}";
		 	if(status.length>0){
		 		 $("#IMGSTATUS").val(status);
		 	}
			
			
			//日期框
			for(var i=1; i<5;i++){
				setUploadBtn('uploadify'+i,'PICTURE'+i,'img'+i);
			}
		 
	
		});
		</script>
</body>
</html>