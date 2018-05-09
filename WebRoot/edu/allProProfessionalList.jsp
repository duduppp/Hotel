<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<jsp:include page="username.jsp" flush="true"></jsp:include>

<html>
  <head>
    <title>所有讲师</title>
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />  
	<meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no" />  
	<meta content="yes" name="apple-mobile-web-app-capable" />  
	<meta content="black" name="apple-mobile-web-app-status-bar-style" />  
	<meta content="telephone=no" name="format-detection" />
	<link rel="stylesheet" href="<%=basePath %>static/ace/css/bootstrap.css" />
	<link rel="stylesheet" href="<%=basePath %>static/edu/css/common.css"/>
	<link rel="stylesheet" href="<%=basePath %>static/edu/css/star.css"/>
	<link rel="stylesheet" href="<%=basePath %>static/ace/css/font-awesome.css"/>
	<link rel="stylesheet" href="<%=basePath %>plugins/mobileLayer/need/layercss"   />
	<link rel="stylesheet" href="<%=basePath %>static/css/font-awesome.min.css" />
	<script type="text/javascript" src="<%=basePath%>static/js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>static/edu/js/star.js"></script>
	<script type="text/javascript" src="<%=basePath%>edu/video.js"></script>
	<script type="text/javascript" src="<%=basePath %>plugins/mobileLayer/layer.js"></script>
	<script type="text/javascript">
		 jQuery.ctx='<%=basePath%>';   
		 /**
		   * 打开连接，判断否登录
		   * @param url
		   */
		  function openLink(url){ 
			  
			  if($.trim(userName).length>0){
				  window.location.href=url; 
			  }else{
				  window.location.href="./edu/win_login.jsp";  
			  }
		  }
	</script>
</head>
<body>

	<div id="title1" >
		<a  href="javascript:void(0);" onclick="openLink('<%=basePath%>edu');">
		<span style="text-align: left;float: left;padding-left: 10px;font-size: 22px;cursor:pointer; font-weight: bold;">
		&lt; </span></a>
		<span id="ftitle" style="text-align: center;width: 80%;" >
			 专题课程
		</span>
	</div> 
 	<div style="height: 400px;">
	   	<div class="pages_container1">
	 		   <c:forEach items="${proProfessionalList}" var="var" varStatus="vs">                      
           	   		<div style="cursor: pointer;margin-bottom: 5px;" onclick="openLink('showCourse?COURSEMANAGER_ID=${var.COURSEMANAGER_ID}');">
           	   			<img width="100%" height="150" src="${var.IMGPATH }" alt="${var.COURSETITLE }" title="${var.COURSETITLE }"  />
           	   		</div> 
            		<div class="spbtn1 radius6"  >${var.COURSETITLE }</div>
            		<div class="spdate" style="margin-bottom: 20px;">
            		 <fmt:formatDate value="${var.RELEASETIME}" pattern="yyyy-MM-dd  HH:mm:ss"   />	
            	 </div>
            </c:forEach>
   	   </div>                 
	</div> 
</body>
</html>