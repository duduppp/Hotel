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

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
<title>商学院</title>
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />  
<meta content="yes" name="apple-mobile-web-app-capable" />  
<meta content="black" name="apple-mobile-web-app-status-bar-style" />  
<meta content="telephone=no" name="format-detection" />
<link rel="stylesheet" href="<%=basePath %>static/edu/css/common.css">
<link rel="stylesheet" href="<%=basePath %>static/ace/css/font-awesome.css" />
<link href="<%=basePath %>plugins/mobileLayer/need/layer.css" type="text/css" rel="stylesheet">
<link href="<%=basePath %>static/jquerymobile/jquery.mobile-1.4.5.min.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="static/js/jquery-1.9.1.min.js"></script> 
<link rel="shortcut icon" href="<%=basePath%>view/images/favicon.ico" type="image/x-icon" />
<script type="text/javascript" src="<%=basePath %>plugins/layer/layer.js"></script>
<script type="text/javascript" src="<%=basePath %>static/jquerymobile/jquery.mobile-1.4.5.min.js"></script>
 <script type="text/javascript">  
 
    function showPage(id1,id2,id3){
    	
    	$("#"+id1).show();
    	$("#"+id2).hide();
    	$("#"+id3).hide();
    	
    }
    
    function openLink(url){ 
    	
    	  if($.trim(userName).length>0){
    		  window.top.location.href=url; 
    	  }else{
    		  window.top.location.href="./edu/win_login.jsp";  
    	  }
    } 
    
    $(document).on("pageinit","#pageone",function(){  
     
     });  
 </script> 
</head>
  <body>
     <div id="title2">
		<a  href="javascript:void(0);" onclick="openLink('<%=basePath%>edu');">
			<span style="text-align: left;float: left;padding-left: 10px;font-size: 22px;cursor:pointer; font-weight: bold;">
		&lt; </span></a>
		<span id="ftitle" style="text-align: center;width: 80%;margin-top: 5px;" >讨论区</span>
	</div>
  
    <div data-role="page" id="pageone" style="background-color: white;margin-top: 36px;"" data-url="pageone" tabindex="0" class="ui-page ui-page-theme-a ui-page-active">
		<div data-role="header" role="banner" class="ui-header ui-bar-inherit">
			<div id="pageone" data-role="navbar" class="ui-navbar" >
				<ul class="ui-grid-b">
					<li class="ui-block-a"><a href="#one" onclick="showPage('one','two','three');" data-icon="home" 
					class="ui-link ui-btn ui-icon-home ui-btn-icon-top ui-btn-active">家园讨论</a></li>
					<li class="ui-block-b"><a href="#two" onclick="showPage('two','one','three');" data-icon="arrow-r" 
					class="ui-link ui-btn ui-icon-arrow-r ui-btn-icon-top">课程讨论</a></li>
					<li class="ui-block-c"><a href="#three" onclick="showPage('three','one','two');" data-icon="search" 
					class="ui-link ui-btn ui-icon-search ui-btn-icon-top">社区讨论</a></li>
				</ul>
			</div> 
			
			 <div id="one" class="ui-body-d ui-content">  
		   		 <h1>家园正在建设中……</h1>  
		    </div>  
		    <div id="two" style="display: none;">  
		      <ul data-role="listview" data-inset="true" >  
		        <li><a href="#">家园正在建设中……</a></li>  
		        <li><a href="#">家园正在建设中……</a></li>  
		      </ul>  
		   </div>  
		   <div id="three" class="ui-body-d ui-content"  style="display: none;">  
		    <h1>家园正在建设中…………</h1>  
		  </div>
			
			
		</div>
	</div>

		 
  </body>
</html>
