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
				$("#"+SupportId).text("   "+count+'');
			}
		});
    }
 </script> 
</head>

<body style="overflow: hidden; ">
    <div id="title1" >
		<a  href="javascript:void(0);" onclick="openLink('edu');"><span style="text-align: left;float: left;padding-left: 10px;font-size: 22px;cursor:pointer; font-weight: bold;">
		&lt; </span></a>
		<span id="ftitle" style="text-align: center;width: 80%;" >我的收藏    &nbsp; </span>
	</div> 
 	<div style="height: 400px;margin-top: 35px;">
	   	<div class="pages_container1">
	   	   <c:forEach items="${varList}" var="var" varStatus="vs">   
	     	 <div class="service_box1">
	     	 		 <table style="width: 100%;margin-top:0px;"  >
 					 <tr  onclick="openLink('<%=basePath%>showCourse?COURSEMANAGER_ID=${var.COURSEMANAGER_ID}')"  style="cursor: pointer;" >  
 					 <td  rowspan="3" style="border-bottom: 1px #ddd solid;width: 60%;padding-left:15px;" ><img src="<%=basePath%>${var.IMGPATH }" width="180" height="120" alt="" title="" /></td> 
 					 <td style="height:36px;padding-top:20px;">${var.COURSETITLE }<td> 
 					 </tr> 
 					 <tr> 
 					 <td style="height:36px;">发布人：${var.LECTURERNAME }</td> 
 					 </tr>
 					 <tr>  
 					 <td style="padding-top:10px;border-bottom: 1px #ddd solid;"><i class="menu-icon fa fa-eye black">&nbsp;</i>${var.VIEWTIMES } &nbsp; 
 					 <i class="menu-icon fa fa-comments black">&nbsp;</i>${var.MESSAGETIMES } &nbsp; 
 					 <i class="menu-icon icon-thumbs-up-alt black" id="relationSupportId${var.index}" style="cursor: pointer;" 
 					  onclick="courseManagerSupport('${var.COURSEMANAGER_ID}','relationSupportId${var.index}');" >   ${var.SUPPORTTIMES }</i></p><br/>&nbsp;</td> 
 					 </tr> 
 					 </table>  
	         </div>
         </c:forEach>
   	  </div>                 
	</div> 
	
	
 </body>
</html>
