<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.fh.entity.system.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
	<title>商学院</title>
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />  
<meta content="yes" name="apple-mobile-web-app-capable" />  
<meta content="black" name="apple-mobile-web-app-status-bar-style" />  
<meta content="telephone=no" name="format-detection" />
<link rel="stylesheet" type="text/css" href="static/edu/css/component.css" />
 
<style>
	 a{
	 
	 	text-decoration: none ;
	 }
	.top-banner {
		z-index: 999;
		text-align: right;
		height: 30px !important;
		line-height: 30px !important;
	}
	.top-banner a {
	/*  	color:green !important; */
		text-shadow: none;
	}
/* 	.column {
		margin: 60px auto;
		float: none;
		text-align: center;
		width: 75%;
		min-height: 100px;
	} */
	*, *:after, *:before { -webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; }
.clearfix:after{visibility:hidden;display:block;font-size:0;content:" ";clear:both;height:0}
.clearfix{*zoom:1}
.fl{float:left}
.fr{float:right}
.fl,.fr{_display:inline}
.top-banner {
	position:absolute;
	z-index: 999;
	left:0;
	top:0;
	height:40px;
	line-height:40px;
	padding:0 30px;
	width:100%;
	font-size: 13px;
	background-color: rgba(255, 255, 255, 0.15);
	color: #fff;
	font-family: "瀹嬩綋","Microsoft Yahei","Helvetica Neue",Helvetica,Arial,sans-serif;
	font-size: 15px;
	/*text-shadow: 1px 1px 3px #333;*/
	/*box-shadow: 0 1px 0 #999;*/
}
.top-banner a {
	color: #fff;
	text-decoration: none;
}
 
#title2{
	top:1px;width:auto;
	overflow:hidden;
	height: 35px;
	line-height: 35px;
	background-image:-webkit-linear-gradient(bottom,#DEDAC6 3%,#FAF9F5 97%,#fff 100%);
	border-bottom: 1px #fff solid;
	position:fixed!important;/*FF IE7*/ 
	position:absolute;/*IE6*/ 
	width:100%;
	z-index: 9999;

}
#ftitle{
	float: left;
	display: block;
	width: 76px;
	height:29px;
 	font-weight:bold;
 	padding-left:3px;
	top: 0;
}
</style>  
 
<script type="text/javascript">
	var jsessionid = "<%=session.getId()%>"; 
	var ctx='<%=basePath %>';
	//http://www.yyyweb.com/demo/sidebar-transitions/#
	//http://www.17sucai.com/pins/demoshow/6952
</script>
<script type="text/javascript" src="static/edu/js/modernizr.custom.js"></script>

<script type="text/javascript" src="static/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		var lis="";
		var date=new Date;
		 var year=date.getFullYear()+1;       
		for(var i=year;i>2005;i--){
			lis+='<li><label for="'+i+'">'+i+'</label></li>';
		}
		$("#nagulID").append(lis);
		initContent();
		
	});
	
	function initContent(){
		var url="<%=basePath%>getSortBigEvent";
		$.ajax({
 			url:url,
 			dataType:'json',
 			success:function(data){ 
 			  var result="";	
  			  for (var i=2020;i>2005;i--) {			 
  				  
				  var bienvents=data[i]; 
				  var lievents='<div><h3 id="'+i+'">'+i+'</h3>';				  
				   if(!!bienvents[0]){    					
					
				 	  var liItem="";
					  for (var j in bienvents) { 
						  var li_events_contents='<li><span>@monthDay</span><p><span><a href="<%=basePath %>goIntroduction?BIGBUSINESSEVENTS_ID=@BIGBUSINESSEVENTS_ID">@title</a></span></p></li>';
	  					  var bigtime=bienvents[j].BIGTIME; 
	  					  var year=bigtime.substring(0,4); 
	  					  var monthDay=bigtime.substring(5,10); 
	  					  monthDay=monthDay.replaceAll("-","月");
	  				 	  var bigeventID=bienvents[j].BIGBUSINESSEVENTS_ID;
	  				 	  var title=bienvents[j].TITLE;
	  				 	  li_events_contents=li_events_contents.replaceAll("@BIGBUSINESSEVENTS_ID", bigeventID); 
	  				 	  li_events_contents=li_events_contents.replaceAll("@title1", bigeventID);  
	  				 	  li_events_contents=li_events_contents.replaceAll("@title", title);
	  				 	  li_events_contents=li_events_contents.replaceAll("@monthDay", monthDay);
	  				 	  liItem+=li_events_contents;
					  }
					  result+=lievents+liItem+"</div>"; 
						
				  }
				
 			  }
  			  $("#ulEventsID").append(result);
 			}
		});
  				
	}
	  String.prototype.replaceAll  = function(s1,s2){    
	        return this.replace(new RegExp(s1,"gm"),s2);    
	    }
	function openLink(url){
 		
 		 window.location.href=url;   
 		 
 	} 
</script>
<c:import url="username.jsp"></c:import>
</head>
<body style="padding: 0px;margin: 0px;">
   <div id="title1" >
		<a  href="javascript:void(0);" onclick="openLink('<%=basePath%>edu?jsessionid=<%=session.getId() %>');">
		<span style="text-align: left;float: left;padding-left: 10px;font-size: 22px;cursor:pointer; font-weight: bold;">
		&lt; </span></a>
		<span id="ftitle" style="text-align: center;width:80%;margin-top: 1px;" >
			 最新资讯	<button id="btn1" data-effect="st-effect-1" >选择时间</button>
		</span>
	 
	</div> 
  <div id="st-container" class="st-container"  >
		 
			<nav class="st-menu st-effect-1" id="menu-1">
				<ul id="nagulID" class="event_year"></ul>
			</nav>
			<div class="st-pusher">
				<div class="st-content">
					<div class="st-content-inner">
						 <div class="main clearfix">
					 	 <div id="st-trigger-effects" class="column">  
								 <ul class="event_list" id="ulEventsID">
								 </ul>
						    </div>  
						 </div> 
						 <div style="width: 100%;height:40px;">&nbsp;</div>
					</div> 
				</div> 
			</div> 
		</div> 
    <script type="text/javascript" src="static/edu/js/classie.js"></script>
    <script type="text/javascript" src="static/edu/js/sidebarEffects.js"></script>
	<script src="static/edu/js/jquery.min_v1.0.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(function(){
			$('label').click(function(){
				$('#nagulID>li').removeClass('current');
				$(this).parent('li').addClass('current');
				var year = $(this).attr('for');
				$('#'+year).parent().prevAll('div').slideUp(800);
				$('#'+year).parent().slideDown(800).nextAll('div').slideDown(800);
			}); 
		}); 
	</script>
    
  </body>
</html>
