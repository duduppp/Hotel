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
<script type="text/javascript" src="<%=basePath%>static/edu/js/star.js"></script>
<script type="text/javascript">
	 jQuery.ctx='<%=basePath%>'; 
	  /**
	   * 打开连接，判断否登录
	   * @param url
	   */
	  function openLink(url){ 
		  if($.trim(userName).length>0){
			  window.history.back();
		  }else{
			  window.location.href="./edu/win_login.jsp";  
		  }
	  }
</script> 
</head>
  
  <body>
   <div id="title2">
		<a  href="javascript:void(0);" onclick="openLink('<%=basePath%>edu');">
			<span style="text-align: left;float: left;padding-left: 10px;font-size: 22px;cursor:pointer; font-weight: bold;">
		&lt; </span></a>
		<span id="ftitle" style="text-align: center;width: 80%;margin-top: 5px;" > ${IntroductionData.TITLE}
		</span>
	</div>
	   
 		     <div style="width: 100%;margin-top: 36px;">
		     	<div style="margin-left: 10px;margin-right: 10px;">
		     		${IntroductionData.CONTENT}
     			</div>
     	</div>
      
  </body>
</html>
