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
	<link rel="stylesheet" href="static/ace/css/datepicker.css" />
		<!-- 上传插件 -->
	<script type="text/javascript">
	var jsessionid = "<%=session.getId()%>";  //勿删，uploadify兼容火狐用到
	</script>
		<!-- 上传插件 -->
	<link href="plugins/uploadify/uploadify.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="plugins/uploadify/swfobject.js"></script>
	<script type="text/javascript" src="plugins/uploadify/jquery.uploadify.v2.1.4.min.js"></script>
		<!-- 编辑框-->
	<link href="plugins/ueditor/themes/default/css/ueditor.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" charset="utf-8">window.UMEDITOR_HOME_URL = "<%=path%>/plugins/ueditor/";</script>
	<script type="text/javascript" charset="utf-8" src="plugins/ueditor/ueditor.config.js"></script>
	<script type="text/javascript" charset="utf-8" src="plugins/ueditor/ueditor.all.js"></script>
	<script type="text/javascript" charset="utf-8" src="plugins/ueditor/lang/zh-cn/zh-cn.js"></script>

	<script type="text/javascript" charset="utf-8" src="plugins/ueditor/formdesign/leipi.formdesign.v4.js"></script>
	<script type="text/javascript" charset="utf-8" src="plugins/ueditor/ueditor.parse.min.js"></script>
	<!-- 树形下拉框start -->
	<link rel="stylesheet" type="text/css" href="plugins/selectZtree/import_fh.css"/>
	<link type="text/css" rel="stylesheet" href="plugins/selectZtree/ztree/ztree.css"></link>
	<script type="text/javascript" src="plugins/selectZtree/selectTree.js"></script>
	<script type="text/javascript" src="plugins/selectZtree/framework.js"></script>

	<script type="text/javascript" src="plugins/selectZtree/ztree/ztree.js"></script>
	
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
					
					<form action="coursemanager/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="COURSEMANAGER_ID" id="COURSEMANAGER_ID" value="${pd.COURSEMANAGER_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">讲师名称:</td>
								<td style="width:200px;">	
									<select class="chosen-select form-control" name="lectureSelect " id="lectureSelect" data-placeholder="请选择模板" 
									style="vertical-align:top;width:200px;"  title="讲师名称" onchange="lectureSelected();"  >
										 <option value="">请选择</option> 
										 <c:forEach items="${aboutinstructorList}" var="al" varStatus="als">
											 <option value="${al.ABOUTINSTRUCTOR_ID}">${al.LECTURERNAME}</option>
										 </c:forEach>
								    </select> 
								    <input type="hidden" name="LECTURERID" id="LECTURERID" value="${pd.LECTURERID}" />
								    <input type="hidden" name="LECTURERNAME" id="LECTURERNAME" value="${pd.LECTURERNAME}" maxlength="255" placeholder="这里输入讲师编号" title="讲师编号"  />
							
							 	 	<input type="hidden" name="SHARE2CODE" id="SHARE2CODE" value="${pd.SHARE2CODE}" />
							    	<input type="hidden" name="REWARD2CODE" id="REWARD2CODE" value="${pd.REWARD2CODE}" />
								</td> 
								
								<td style="width:75px;text-align: right;padding-top: 13px;">文章分类:</td>
								<td style="width:200px;">
									 <input type="text" placeholder="选择用户" class="nav-search-input" id="nav-search-input" 
											 name="ARTICLETYPE" value="${pd.ARTICLETYPE}"   onclick="userBinding(this)" />
									 <input type="hidden" name="ARTICLETYPEID" id="ARTICLETYPEID" value="${pd.ARTICLETYPEID}">
								</td>
								<td style="width:75px;text-align: right;padding-top: 13px;">课程章程:</td>
								<td style="width:200px;" >
<!-- 									<input type="text" style=" width:200px;" name="COURSECONSTITUTION" id="COURSECONSTITUTION" value="${pd.COURSECONSTITUTION}" maxlength="255" placeholder="这里输入课程章程" title="课程章程"  "/> -->
									
									<select class="chosen-select form-control" name="COURSECONSTITUTION" id="COURSECONSTITUTION" data-placeholder="请选择" style="float:left; width: 90px;">
										<option value="1" selected="selected" >第1章</option>
										<option value="2">第2章</option>
										<option value="3">第3章</option>
										<option value="4">第4章</option>
										<option value="5">第5章</option> 
										<option value="6">第6章</option> 
										<option value="7">第7章</option>
										<option value="8">第8章</option>
										<option value="9">第9章</option>
										<option value="10">第10章</option>
										<option value="11">第11章</option>
										<option value="12">第12章</option>
										<option value="13">第13章</option> 
										<option value="14">第14章</option> 
										<option value="15">第15章</option> 
										<option value="16">第16章</option> 
										<option value="17">第17章</option> 
										<option value="18">第18章</option> 
										<option value="19">第19章</option>
										<option value="20">第20章</option>      
								  	</select>
								   <select class="chosen-select form-control" name="COURSECHAPTERS" id="COURSECHAPTERS" data-placeholder="请选择" style="float:left;width: 90px;">
										<option value="1" selected="selected" >第1节</option>
										<option value="2">第2节</option>
										<option value="3">第3节</option>
										<option value="4">第4节</option>
										<option value="5">第5节</option> 
										<option value="6">第6节</option> 
										<option value="7">第7节</option>  
										<option value="8">第8节</option>  
										<option value="9">第9节</option>  
										<option value="10">第10节</option>  
										<option value="11">第11节</option>  
										<option value="12">第12节</option>  
								  	</select>
								</td>
							
							</tr>
							
							<tr>
								<td  style="width:75px;text-align: right;padding-top: 13px;">上传封面:</td>
								<td colspan="2">
								<input type="file" name="File_name" id="uploadify1" keepDefaultStyle = "true"/>
								</td>
									<td colspan="3" >
											<a class="btn btn-mini btn-primary" onclick="uploadimg();">上传</a>
											<a class="btn btn-mini btn-primary" onclick="deleteimg();">删除</a>
										<input type="text" name="IMGPATH" readonly="readonly" id="IMGPATH" value="${pd.IMGPATH}"  style="width:80%;"/>
									</td>
							</tr>
							<tr>	
							<td style="width:75px;text-align: right;padding-top: 13px;">课程标题:</td>
								<td colspan="5" ><input type="text" name="COURSETITLE" id="COURSETITLE" value="${pd.COURSETITLE}" maxlength="255" placeholder="这里输入课程标题" title="课程标题" style="width:98%;"/></td>
								
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">课程简介:</td>
								<td colspan="5">
								  <script id="COURSEINTRODUCTION" name="COURSEINTRODUCTION" type="text/plain" style="width:100%;height:190px;"></script>
								 
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">
									类型:
								</td>
								<td>
									<select class="chosen-select form-control" name="SHOWTYPE" id="SHOWTYPE" onchange="showStatus();" data-placeholder="请选择" style="vertical-align:top;width: 200px;">
										<option value="0" selected="selected">上传(视频，音频，Word，PPT，Excel)</option>
										<option value="1">直播,链接视频</option>
										<option value="3">链接音频</option>
										<option value="4">写文章</option>
								  	</select>
								</td> 
								<td style="width:75px;text-align: right;padding-top: 13px;">
									状态:
								</td>
								<td>
									<select class="chosen-select form-control" name="SHOWSTATUS" id="SHOWSTATUS" data-placeholder="请选择" style="vertical-align:top;width: 200px;">
										<option value="1">发布</option>
										<option value="2">发布及精品</option>
										<option value="3">精品</option>
										<option value="4">推荐</option>
										<option value="5">首页展示</option> 
										<option value="6">预告专题</option> 
										<option value="8">分享</option> 
										<option value="9">讲师课程</option>  
										<option value="7">关闭</option>  
								  	</select>
								
								</td>
								<td style="width:75px;text-align: right;padding-top: 13px;"> 发布时间：</td>
								<td>
								 
									<input class="span10 date-picker" name="RELEASETIME" id="RELEASETIME"    type="text" 
								 	 readonly="readonly"   style="width:150px;" placeholder="日期" title="日期"/>
								</td>
							</tr>
							<tr>
								
							</tr>
							<tr  id="shangchuantrid">
								<td style="width:75px;text-align: right;padding-top: 13px;">课程文件:</td>
								<td colspan="2">
									<input type="file" name="File_name" id="uploadify2" keepDefaultStyle = "true"/>
								</td>
									<td colspan="3">
										   <a class="btn btn-mini btn-primary" onclick="uploadimg2();">上传</a>
											<a class="btn btn-mini btn-primary" onclick="deleteimg2();">删除</a>
										<input type="text" name="COURSEURL" id="COURSEURL" value="${pd.COURSEURL}"  style="width:80%;"/>
									</td>
							</tr>
							<tr id="zhibotrid" style="display: none;"> 
								<td style="width:75px;text-align: right;padding-top: 13px;">直播,视频地址:</td>
								<td colspan="5">
								<input type="text" name="VIDEOURL" id="VIDEOURL" value="${pd.VIDEOURL}" maxlength="255" placeholder="这里输入视频地址" title="视频地址"
								  style="width:98%;"/></td>
							</tr>   
							<tr id="yinpintrid" style="display: none;"> 
								<td style="width:75px;text-align: right;padding-top: 13px;">音频地址:</td> 
								<td colspan="5"><input type="text" name="AUDIOURL" id="AUDIOURL" value="${pd.AUDIOURL}" maxlength="255" placeholder="这里输入视频地址" title="视频地址" style="width:98%;"/></td>
							</tr>
							<tr id="xiewenzhangtrid" style="display: none;">
								<td style="width:75px;text-align: right;padding-top: 13px;">文章内容:</td>
								<td colspan="5">
								  <script id="ARTICLECONTENT" name="ARTICLECONTENT" type="text/plain" style="width:100%;height:300px;"></script>
							 	</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注:</td>
								<td colspan="5">
									<textarea style="width:95%;height:80px;" rows="10" cols="10" name="REMARK" id="REMARK" title="备注内容" maxlength="1000" placeholder="这里输入内容">${pd.REMARK}</textarea>
							</tr>
						 
							<tr>
								<td style="text-align: center;" colspan="10">
								 <input type="hidden" name="ismovieuploaded" id="ismovieuploaded" value="0" />
								 <input type="hidden" name="VIEWTIMES" id="VIEWTIMES" value="${pd.VIEWTIMES}" />
								 <input type="hidden" name="MESSAGETIMES" id="MESSAGETIMES" value="${pd.MESSAGETIMES}" />
								 <input type="hidden" name="SUPPORTTIMES" id="SUPPORTTIMES" value="${pd.SUPPORTTIMES}" />
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
								</td> 
							</tr>
						</table>
						</div>
						<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/>
						<img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交...转码中...</h4></div>
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
	<script src="static/ace/js/chosen.jquery.js"></script>
		<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/moment.js"></script>
	<script src="static/ace/js/date-time/bootstrap-datetimepicker.js"></script>
 
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		
		//讲师选择
		function lectureSelected(){
			
			var leName=$("#lectureSelect").find("option:selected").text();  
			$("#LECTURERNAME").val(leName);
			var lecture=$("#lectureSelect").find("option:selected").val();  
			$("#LECTURERID").val(lecture);
		}
		
		Date.prototype.Format = function (fmt) { //author: meizz   
		    var o = {  
		        "M+": this.getMonth() + 1, //月份   
		        "d+": this.getDate(), //日   
		        "H+": this.getHours(), //小时   
		        "m+": this.getMinutes(), //分   
		        "s+": this.getSeconds(), //秒   
		        "q+": Math.floor((this.getMonth() + 3) / 3), //季度   
		        "S": this.getMilliseconds() //毫秒   
		    };  
		    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));  
		    for (var k in o)  
		    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));  
		  return fmt;  
		}  
		  
		function deleteimg(){
			
			var IMGPATH=$("#IMGPATH").val(); 
			bootbox.confirm("确定要删除吗?", function(result) {
				if(result) {
					var url = "<%=basePath%>coursemanager/deletefile.do?fileurl="+IMGPATH+"&tm="+new Date().getTime();
					$.get(url,function(data){
					 
						if(data=="success"){
							$("#IMGPATH").val("");
							bootbox.alert("删除成功！");	
						}else{
							bootbox.alert("删除失败！");	
						}
					});
				}
			});
		}
		
		function deleteimg2(){
			var COURSEURL=$("#COURSEURL").val();
		 
			bootbox.confirm("确定要删除吗?", function(result) {
				if(result) {
					var url = "<%=basePath%>coursemanager/deletefile.do?fileurl="+COURSEURL+"&tm="+new Date().getTime();
					$.get(url,function(data){
					 
						if(data=="success"){
							$("#COURSEURL").val("");
							bootbox.alert("删除成功！");	
						}else{
							bootbox.alert("删除失败！"); 	
						}
					});
				}
			});
			
		 
		}
	 
	
		$(function() {
			var   lectuer='${pd.LECTURERID}';
			if(lectuer!=''){
				$("#lectureSelect").val(lectuer); 
				
			}
			
			var   SHOWTYPE='${pd.SHOWTYPE}';
			if(SHOWTYPE!=''){
				$("#SHOWTYPE").val(SHOWTYPE); 
				showStatus();
			}
			
			
			var   SHOWSTATUS='${pd.SHOWSTATUS}';
			if(SHOWSTATUS!=''){
				$("#SHOWSTATUS").val(SHOWSTATUS); 
				
			}
			
			//初始化课程简介
			 var ue1 = UE.getEditor('COURSEINTRODUCTION',{
				 toolbars: [
				            ['source','fullscreen', 'insertimage', 'undo', 'redo', 'bold','inserttable']
				        ],
				        autoHeightEnabled: true,
				        autoFloatEnabled: true
			 });  
	        ue1.ready(function() {//编辑器初始化完成再赋值  
	            ue1.setContent('${pd.COURSEINTRODUCTION}');  //赋值给UEditor  
	        });  
			
			var COURSECHAPTERS='${pd.COURSECHAPTERS}'; 
			if(COURSECHAPTERS!=''){ 
				$("#COURSECHAPTERS").val(COURSECHAPTERS); 
				
			}
			
		    var ue = UE.getEditor('ARTICLECONTENT');  
	        ue.ready(function() {//编辑器初始化完成再赋值  
	            ue.setContent('${pd.ARTICLECONTENT}');  //赋值给UEditor  
	        });  
		        
			if('${pd.RELEASETIME}'==""){
				 $("#RELEASETIME").val(new Date().Format("yyyy-MM-dd HH:mm") );//设置
			}else{
				 $("#RELEASETIME").val('${pd.RELEASETIME}');//设置 
			}
			//日期框
		  
			 $('#RELEASETIME').datetimepicker({
				// minView: "month",
				 language:  'zh-CN',
				 format: 'YYYY-MM-DD HH:mm',
				 todayBtn:  1,
				 autoclose: 1
			 });
		 
			var videourl=$("#VIDEOURL").val();
		 
			if(videourl.length==0){
				$("#VIDEOURL").val("rtmp://www.zhengyuanyuan.com:1935/live/dp");
			}
			if($("#VIDEOURL").val().length==0){
				$("#VIDEOURL").val("http://");
			}
			if($("#AUDIOURL").val().length==0){
				$("#AUDIOURL").val("http://");
			}
		});
		
			//打开绑定用户窗口
	   function userBinding(obj){
				 top.jzts();
				 var diag = new top.Dialog();
				 diag.Drag=true;
				 diag.Title ="选择课程";
				 diag.URL = '<%=basePath%>coursetype/listCourseTypeForWindow.do';
				 diag.Width = 700;
				 diag.Height = 545;
				 diag.Modal = true;				//有无遮罩窗口
				 diag.ShowMaxButton = true;	//最大化按钮
			     diag.ShowMinButton = true;		//最小化按钮
				 diag.CancelEvent = function(){ //关闭事件
					if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
						var ARTICLETYPEID = diag.innerFrame.contentWindow.document.getElementById('USERNAME').value;
						var NAME = diag.innerFrame.contentWindow.document.getElementById('NAME').value;
						$(obj).val(NAME);
				 		$("#ARTICLETYPEID").val(ARTICLETYPEID);
					 }
					diag.close();
				 };
				 diag.show();
		}

		
		function uploadimg(){
			//先删除
			var IMGPATH=$("#IMGPATH").val();
			 
			var url = "<%=basePath%>coursemanager/deletefile.do?fileurl="+IMGPATH+"&tm="+new Date().getTime();
			$.get(url,function(data){
				if(data=="success"){ 
					$('#uploadify1').uploadifyUpload();
				//	$("#IMGPATH").val("");
				}
			});
		}
		
		function uploadimg2(){
			//先删除
			var COURSEURL=$("#COURSEURL").val();
			var url = "<%=basePath%>coursemanager/deletefile.do?fileurl="+COURSEURL+"&tm="+new Date().getTime();
			$.get(url,function(data){
			 
				if(data=="success"){
					$("#ismovieuploaded").val(1);
					$('#uploadify2').uploadifyUpload();
				//	$("#COURSEURL").val("");
				}
			});
		}
		
		
		function showStatus(){
			var showtype=$("#SHOWTYPE").val();
			if(showtype=="0"){
				$("#shangchuantrid").show();
				$("#zhibotrid").hide();
				$("#shipintrid").hide();
				$("#yinpintrid").hide();
				$("#xiewenzhangtrid").hide();
			}
			if(showtype=="1"){
				$("#shangchuantrid").hide();
				$("#zhibotrid").show();
				$("#shipintrid").hide();
				$("#yinpintrid").hide();
				$("#xiewenzhangtrid").hide();
			}
			if(showtype=="3"){
				$("#shangchuantrid").hide();
				$("#zhibotrid").hide();
				$("#shipintrid").hide();
				$("#yinpintrid").show();
				$("#xiewenzhangtrid").hide();	
			}
			if(showtype=="4"){
				$("#shangchuantrid").hide();
				$("#zhibotrid").hide();
				$("#shipintrid").hide();
				$("#yinpintrid").hide();
				$("#xiewenzhangtrid").show();
			}
		}
		
		//保存
		function save(){
			if($("#COURSETITLE").val()==""){
				$("#COURSETITLE").tips({
					side:3,
		            msg:'请输入课程标题',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#COURSETITLE").focus();
				return false;
			}
	 
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
		 
			if($("#ARTICLETYPE").val()==""){
				$("#ARTICLETYPE").tips({
					side:3,
		            msg:'请输入文章分类',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ARTICLETYPE").focus();
				return false;
			}
		 
			 
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		 var formEditor = UE.getEditor('ARTICLECONTENT',{
			    toolleipi:true, 
			    textarea: 'design_content',   
			    elementPathEnabled:false,    
			    initialFrameHeight:300,
			    iframeCssUrl:"plugins/ueditor/formdesign/bootstrap/css/bootstrap.css" 
			});
		 
		$(function() {	 
			var str="";
			$("#uploadify1").uploadify({
				'buttonImg'	: 	"<%=basePath%>static/images/fileup.png",
				'uploader'	:	"<%=basePath%>plugins/uploadify/uploadify.swf",
				'script'    :	"<%=basePath%>plugins/uploadify/uploadFile.jsp;jsessionid="+jsessionid,
				'cancelImg' :	"<%=basePath%>plugins/uploadify/cancel.png",
				'folder'	:	"/uploadFiles/edu",//上传文件存放的路径,请保持与uploadFile.jsp中PATH的值相同
				'queueId'	:	"fileQueue",
				'method':'get',
				'queueSizeLimit'	:	1,//限制上传文件的数量
				'fileExt'	:	"*.*",
				//'fileDesc'	:"RAR *.rar",//限制文件类型
				'fileExt'     : '*.GIF;*.gif;*.jpg;*.JPG;*.PNG;*.png',
				'fileDesc'    : 'Please choose(*.GIF,*.JPG,*.PNG)', 
				'auto'		:	false,
				'multi'		:	false,//是否允许多文件上传
				'simUploadLimit':	2,//同时运行上传的进程数量
				'buttonText':	"files",
				'scriptData':	{'uploadPath':'/uploadFiles/edu/'},//这个参数用于传递用户自己的参数，此时'method' 必须设置为GET, 后台可以用request.getParameter('name')获取名字的值
				'method'	:	"GET",
				'onComplete':function(event,queueId,fileObj,response,data){
					str = response.trim();//单个上传完毕执行 
				},
				'onAllComplete' : function(event,data) {
					//alert(str);	//全部上传完毕执行
					$("#IMGPATH").val("uploadFiles/edu/"+str); 
					
		    	},
		    	'onSelect' : function(event, queueId, fileObj){
		    		$("#hasTp1").val("ok"); 
		    	}
			});
			
			
			$("#uploadify2").uploadify({
				'buttonImg'	: 	"<%=basePath%>static/images/fileup.png",
				'uploader'	:	"<%=basePath%>plugins/uploadify/uploadify.swf",
				'script'    :	"<%=basePath%>plugins/uploadify/uploadFile.jsp;jsessionid="+jsessionid,
				'cancelImg' :	"<%=basePath%>plugins/uploadify/cancel.png",
				'folder'	:	"<%=basePath%>uploadFiles/edu/course",//上传文件存放的路径,请保持与uploadFile.jsp中PATH的值相同
				'queueId'	:	"fileQueue",
			 	'queueSizeLimit'	:	1,//限制上传文件的数量
				'fileExt'	:	"*.*",
				'fileExt'   : '*.*;*.*;*.*',
				'fileDesc'  : 'Please choose(.*, .*, .*)',
				'auto'		:	false,
				'multi'		:	false,//是否允许多文件上传 
				'simUploadLimit':	1,//同时运行上传的进程数量
				'buttonText':	"files", 
				'scriptData':{'uploadPath':'/uploadFiles/edu/course/'},//这个参数用于传递用户自己的参数，此时'method' 必须设置为GET, 后台可以用request.getParameter('name')获取名字的值
				'method'	:	"GET",
				'onComplete':function(event,queueId,fileObj,response,data){
					str  = str+","+response.trim();//单个上传完毕执行  
				},
				'onAllComplete': function(event,data) {
					 	//全部上传完毕执行
					$("#COURSEURL").val("uploadFiles/edu/course/"+str); 
		    	},
		    	'onSelect' : function(event, queueId, fileObj){  
		    		$("#hasTp1").val("ok");
		    	}
			});
		});
		
	
		//下拉树
		//var defaultNodes = {"treeNodes":${zTreeNodes}};
		var defaultNodes={"treeNodes":[{"name":"总公司","icon":"static/images/user.gif","id":"a6c6695217ba4a4dbfe9f7e9d2c06730","parentId":"0"},{"name":"集团公司","icon":"static/images/user.gif","id":"fdfb93fb19444fd0a46c7b01d7bfbef7","parentId":"a6c6695217ba4a4dbfe9f7e9d2c06730"},{"name":"人事中心","icon":"static/images/user.gif","id":"f3985fcf7f29442d8bb19de95bcfeadd","parentId":"fdfb93fb19444fd0a46c7b01d7bfbef7"},{"name":"信息管理中心","icon":"static/images/user.gif","id":"071168bfaf804467ba0d833d8396c23a","parentId":"fdfb93fb19444fd0a46c7b01d7bfbef7"},{"name":"品牌管理中心","icon":"static/images/user.gif","id":"01b7876669b94741b18f82b2355528e9","parentId":"fdfb93fb19444fd0a46c7b01d7bfbef7"},{"name":"总经办","icon":"static/images/user.gif","id":"ac82125b6617434b820c67948a8475ae","parentId":"fdfb93fb19444fd0a46c7b01d7bfbef7"},{"name":"财务中心","icon":"static/images/user.gif","id":"3a4d4d06f75b49379305abbb722b1f37","parentId":"fdfb93fb19444fd0a46c7b01d7bfbef7"},{"name":"员工","icon":"static/images/user.gif","id":"6e964d8ae7d64f6a9ba532ac0ed6eaf0","parentId":"f3985fcf7f29442d8bb19de95bcfeadd"},{"name":"总监","icon":"static/images/user.gif","id":"7c2334265e734d8095653cf1ace6dec2","parentId":"f3985fcf7f29442d8bb19de95bcfeadd"},{"name":"员工","icon":"static/images/user.gif","id":"3dc7fb2ae7ff4bf982c6cf65f4439eb8","parentId":"071168bfaf804467ba0d833d8396c23a"},{"name":"总监","icon":"static/images/user.gif","id":"de215c555c624af28364f7af9c0bad69","parentId":"071168bfaf804467ba0d833d8396c23a"},{"name":"员工","icon":"static/images/user.gif","id":"d055157bf03e438c9dacbe24a7da73d6","parentId":"ac82125b6617434b820c67948a8475ae"},{"name":"总监","icon":"static/images/user.gif","id":"d8ebebd1fc1a45228e94b79bc9cfe726","parentId":"ac82125b6617434b820c67948a8475ae"},{"name":"员工","icon":"static/images/user.gif","id":"0349f8f752d24f2abe2b26e655736852","parentId":"3a4d4d06f75b49379305abbb722b1f37"},{"name":"总监","icon":"static/images/user.gif","id":"58e66f0567074d58b07a926e375b6cc2","parentId":"3a4d4d06f75b49379305abbb722b1f37"}]};

		function initComplete(){
			//绑定change事件
			$("#selectTree").bind("change",function(){
				if(!$(this).attr("relValue")){
			      //  top.Dialog.alert("没有选择节点");
			    }else{
					//alert("选中节点文本："+$(this).attr("relText")+"<br/>选中节点值："+$(this).attr("relValue"));
					$("#DEPARTMENT_ID").val($(this).attr("relValue"));
			    }
			});
			//赋给data属性
			$("#selectTree").data("data",defaultNodes);  
			$("#selectTree").render();
			$("#selectTree2_input").val("${null==depname?'请选择':depname}");
		}

	 
		</script>
</body>
</html>