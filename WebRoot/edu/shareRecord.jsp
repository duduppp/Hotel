<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>


<html>
  <head>
   <title>商学院</title>
 <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />  
<meta content="yes" name="apple-mobile-web-app-capable" />  
<meta content="black" name="apple-mobile-web-app-status-bar-style" />  
<meta content="telephone=no" name="format-detection" />
<link rel="stylesheet" href="<%=basePath %>static/ace/css/bootstrap.css" />
<link rel="stylesheet" href="<%=basePath %>static/edu/css/common.css">
<link rel="stylesheet" href="<%=basePath %>static/edu/css/star.css">
<link rel="stylesheet" href="<%=basePath %>static/ace/css/font-awesome.css">
  
<link rel="stylesheet" href="<%=basePath %>static/css/font-awesome.min.css" />
<script type="text/javascript" src="<%=basePath%>static/js/jquery-1.9.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=basePath %>plugins/uploadify/Huploadify.css"/>
<script type="text/javascript" src="<%=basePath %>plugins/uploadify/jquery.Huploadify.js"></script>
<link href="<%=basePath %>plugins/mobileLayer/need/layer.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="<%=basePath %>plugins/layer/layer.js"></script>
<jsp:include page="username.jsp" flush="true"></jsp:include>

<script type="text/javascript">
var jsessionid = "<%=session.getId()%>"; //勿删，uploadify兼容火狐用到
//课程名称
var courseTitle="";

function openLink(url, status) {
	if(status){
		 
		window.location.href = url;	
	} 
	

}

String.prototype.replaceAll = function (s1, s2) {
	return this.replace(new RegExp(s1, "gm"), s2);
}

function openStudyRecord(status) {

	if (status == "0") {
		var classname = $("#btn1").attr("class");
		if (classname.indexOf("btn-warning") > 0) {
			$("#btn1").removeClass("btn-warning");
			$("#btn1").addClass("btn-success");
			$("#btn2").removeClass("btn-success");
			$("#btn2").addClass("btn-warning");
			$("#list1").show();
			$("#list2").hide();
		}
		appendData('0');
	} else {
		var classname = $("#btn2").attr("class");
		if (classname.indexOf("btn-warning") > 0) {
			$("#btn2").removeClass("btn-warning");
			$("#btn2").addClass("btn-success");
			$("#btn1").removeClass("btn-success");
			$("#btn1").addClass("btn-warning");
			$("#list1").hide();
			$("#list2").show();
		} 
		
		appendData('1');
	}
}

/*
 * 得到所有课程信息
 *
 */
function getShareCourse() {
	//单击直接修改
	var url = "<%=basePath%>courseManagerSupport"; 
	$.ajax({
		url: url,
		data: {
			COURSEMANAGER_ID: COURSEMANAGER_ID,
			SUPPORTTIMES: count
		},
		dataType: 'json',
		success: function (data) {
			$("#" + SupportId).text("  " + count + '');
		}
	});
}  

 /**
  *   初始上传控件
 */
function initFile() {
	
	$('#upload').Huploadify({
		auto: true,
		fileTypeExts: '*.mp4; *.avi;*.rmvb',
		multi: false,
		formData: {
			key: 123456,
			key2: 'vvvv'
		},
		fileSizeLimit: 512000,
		showUploadedPercent: false,
		showUploadedSize: false,
		removeTimout: 9999999,
		uploader: "<%=basePath%>plugins/uploadify/uploadFile.jsp;jsessionid=" + jsessionid + "?folder=<%=basePath%>uploadFiles/edu/share/" + userName + "/&uploadPath=/uploadFiles/edu/share/" + userName + "/",
		onUploadSuccess(file, responseText) {
			//保存分享信息
			saveMyshareData(responseText);
		}
	});
	
}
 
function saveMyshareData(shareurl) {
 
	var url = "<%=basePath%>educate/saveMyShare"; 
	$.ajax({
		url: url,
		data: {
			USERNAME:userName,
			COURSENAME: courseTitle, 
			SHAREURL: shareurl,
			APPROVESTATUS: "false"
		},
		dataType: 'json',
		success: function (data) {
			getMyShareList();
			
		}
	});

}
function getMyShareList(){
	
	 
		 	
  	var url="<%=basePath%>showMyShare"; 
  	 $.ajax({
			url:url,
			dataType:'json',
			success:function(data){ 
	 		    var myshareList=data["myshareList"];
	 		 
			 	var result="";
				if(null!=myshareList){ 
					
					$('#shareTableId tr').each(function () {                  
		               $(this).remove();      
		            });  
				for ( var i in myshareList) {
						//羊毛出在羊身上
					    var uploadTime=myshareList[i].UPLOADTIME;
					    var tablestr='<tr onclick="openLink(\'<%=basePath%>showCourse?COURSEMANAGER_ID=@COURSEMANAGER_ID\',@APPROVESTATUS);" >'+ 
					 	'<td rowspan="3" style="padding-top:10px;width: 45%;padding-left:15px;" >'+
					 		'<img src="@IMAGEPATH" width="180" height="120" alt="" title="" /></td>'+
						 	'<td style="height:36px;padding-top:20px;">@COURSENAME</td>'+ 
						 '</tr>'+
						 '<tr> '+
							 '<td style="height:36px;">发布人：@USERNAME</td>'+
						 '</tr>'+ 
						 '<tr>'+  
						 	'<td>时间：@UPLOADTIME</td>'+ 
						'</tr><tr style="padding-top:10px;border-bottom: 1px #ddd solid;"><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>';
						
					    tablestr=tablestr.replaceAll("@MYSHARE_ID",myshareList[i].MYSHARE_ID);
						tablestr=tablestr.replaceAll("@UPLOADTIME",uploadTime);
						tablestr=tablestr.replaceAll("@COURSENAME",myshareList[i].COURSENAME);
						tablestr=tablestr.replaceAll("@SHAREURL",myshareList[i].SHAREURL);
						tablestr=tablestr.replaceAll("@COURSEMANAGER_ID",myshareList[i].COURSEMANAGER_ID);
						tablestr=tablestr.replaceAll("@APPROVESTATUS",myshareList[i].APPROVESTATUS);
						tablestr=tablestr.replaceAll("@USERNAME",myshareList[i].USERNAME);
						if("true"==myshareList[i].APPROVESTATUS){
							tablestr=tablestr.replaceAll("@IMAGEPATH","<%=basePath%>uploadFiles/edu/share/"+userName+"/"+myshareList[i].IMAGEPATH);  	
						}else{
							tablestr=tablestr.replaceAll("@IMAGEPATH","<%=basePath%>uploadFiles/edu/share/zzsh.png");  		
						}
						 
						result+=tablestr;  
				 } 
				
				 $("#shareTableId").append(result); 
				
				}
			}
		 }); 
  }
$(document).ready(function () {
	initFile();
	//加载分享
	getMyShareList();
});

function uploadimg() {
	//先删除
	
	  layer.prompt({title: '输入课程名称，并确认', formType: 2}, function(text, index){
		    layer.close(index);
		    courseTitle=text;
		    $("#select_btn_1").click();
		    
	});
}
</script> 
</head>

<body style="overflow: hidden; ">
    <div id="title2" > 
		<a  href="javascript:void(0);" onclick="openLink('<%=basePath%>edu',true);">
		<span style="text-align: left; float: left;padding-left: 10px;font-size: 22px;cursor:pointer; font-weight: bold;">
		&lt; </span></a>
		<span id="ftitle" style="text-align: center;width:80%;margin-top: 5px;" >
			<button type="button" id="btn1" class="btn btn-success" onclick="uploadimg();"  style="height: 98%;font: bold;">上传文件</button>
		</span>
		  <div id="upload" style="display: none;" >
	  </div>
	</div> 
 	<div style="height: 400px;margin-top: 36px;">
	   	<div class="pages_container1">
	 		<table id="shareTableId" style="width: 100%;margin-top:0px;cursor: pointer;"   >
 				 
 		   </table> 
   	  </div>                 
	</div> 
 </body>
</html>
