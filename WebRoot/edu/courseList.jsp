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
<jsp:include page="username.jsp" flush="true"></jsp:include>


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
<script type="text/javascript">
 	function openLink(url){
 		
 		 window.location.href=url;
 	} 
    String.prototype.replaceAll  = function(s1,s2){    
        return this.replace(new RegExp(s1,"gm"),s2);    
    }
 	function openStudyRecord(status){
 	
 	  if(status=="0"){
 		 var classname=	$("#btn1").attr("class");
 	 	 if(classname.indexOf("btn-warning")>0){
 	 		$("#btn1").removeClass("btn-warning");
 	 		$("#btn1").addClass("btn-success"); 
 	 		$("#btn2").removeClass("btn-success");
 	 		$("#btn2").addClass("btn-warning"); 
 	 		$("#list1").show();
 	 		$("#list2").hide();
 	 	 } 
 		  
 	  }else{
 		  
 		 var classname=	$("#btn2").attr("class");
	 	 if(classname.indexOf("btn-warning")>0){
	 		$("#btn2").removeClass("btn-warning");
	 		$("#btn2").addClass("btn-success"); 
	 		$("#btn1").removeClass("btn-success");
	 		$("#btn1").addClass("btn-warning");  
	 		$("#list1").hide();
 	 		$("#list2").show();

	 	 }  
 	  }
 	}
	
	 /*
    * 课程支持
    *
   */
   function courseManagerSupport(COURSEMANAGER_ID,SupportId){
  	 //单击直接修改
 	  var url="<%=basePath%>courseManagerSupport";
 	  var support=$("#"+SupportId).text();
 	 
 	  support=$.trim(support);
 	  var count=parseInt(support)+1;   
 		$.ajax({
			url:url,
			data:{
				COURSEMANAGER_ID:COURSEMANAGER_ID,  
				SUPPORTTIMES:count
			},
			dataType:'json',
			success:function(data){
				$("#"+SupportId).text("  "+count+'');
			}
		});
 		
   }
 	function appendData(status){
 		var url="<%=basePath %>newestCourseList?READSTATUS="+status; 		
 		 $(".pages_container1").children().remove(); 
 		$.ajax({
 			url:url,
 			dataType:'json',
 			success:function(data){
 				var hm='<div class="service_box1">'+
 					'<table style="width: 100%;margin-top:0px;"  >'+
					'<tr style="cursor: pointer;" onclick="openLink(\'<%=basePath%>showCourse?COURSEMANAGER_ID=@COURSEMANAGER_ID\');" >'+  
					'<td  rowspan="3" style="border-bottom: 1px #ddd solid;width: 60%;padding-left:15px;" ><img src="<%=basePath%>@IMGPATH" width="180" height="120" alt="" title="" /></td>'+
					'<td style="height:36px;padding-top:20px;">@COURSETITLE<td>'+
					'</tr>'+ 
					'<tr>'+
					'<td style="height:36px;">发布人：@LECTURERNAME</td>'+
					'</tr>'+
					'<tr>'+ 
					'<td style="padding-top:10px;border-bottom: 1px #ddd solid;"><i class="menu-icon fa fa-eye black">&nbsp;</i>@VIEWTIMES &nbsp;'+
					'<i class="menu-icon fa fa-comments black">&nbsp;</i>@MESSAGETIMES  &nbsp;'+
					'<i class="menu-icon icon-thumbs-up-alt black"  style="cursor: pointer;" id="relationSupportId@index" '+
 					'onclick="courseManagerSupport(\'@COURSEMANAGER_ID\',\'relationSupportId@index\');">	@SUPPORTTIMES</i> </p><br/>&nbsp;</td>'+
 					'</tr>'+
 					'</table>';
		           '</div>';
		           
		         var divstr="";
 				 for ( var i in data) {
 					var result="";
 					result=hm.replaceAll("@IMGPATH", data[i].IMGPATH); 
 					result=result.replaceAll("@COURSETITLE", data[i].COURSETITLE);
 					result=result.replaceAll("@LECTURERNAME", data[i].LECTURERNAME);
 					result=result.replaceAll("@VIEWTIMES", data[i].VIEWTIMES);
 					result=result.replaceAll("@MESSAGETIMES", data[i].MESSAGETIMES);
 					result=result.replaceAll("@SUPPORTTIMES", data[i].SUPPORTTIMES);
 					result=result.replaceAll("@COURSEMANAGER_ID", data[i].COURSEMANAGER_ID);
 					result=result.replaceAll("@index", i);
 					divstr+=result;
				}
 				
 				 $(".pages_container1").append(divstr);
 			}
 		});
 		
 	}
 	
 	$(document).ready(function(){
 		
 		appendData('0');
 	});
 
</script> 
</head>

<body style="overflow: hidden; ">
    <div id="title1" >
		<a  href="javascript:void(0);" onclick="openLink('<%=basePath%>edu?jsessionid=<%=session.getId() %>');">
		<span style="text-align: left;float: left;padding-left: 10px;font-size: 22px;cursor:pointer; font-weight: bold;">
		&lt; </span></a>
		<span id="ftitle" style="text-align: center;width: 80%;" >
			 排行榜
		</span>
		 
	</div> 
 	<div style="height: 400px;">
	   	<div class="pages_container1">
	 
		     	
	      
	        
	        
   	  </div>                 
	</div> 
	
	
 </body>
</html>
