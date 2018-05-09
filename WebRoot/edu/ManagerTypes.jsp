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
<style type="text/css">
 .badge { 
    float: right;
    color: red;
    background-color: white;
    cursor:pointer; 
    font-weight: bold;
    font-size: 16px;
  }
</style>
<link rel="stylesheet" href="<%=basePath %>static/css/font-awesome.min.css" />
<script type="text/javascript" src="<%=basePath%>static/js/jquery-1.9.1.min.js"></script>
<c:import url="username.jsp"></c:import>
<script type="text/javascript">
	var jsessionid = "<%=session.getId()%>";  //勿删，uploadify兼容火狐用到
	function openLink(url){
 		
 		 window.location.href=url;
 		 
 	} 
	
    String.prototype.replaceAll  = function(s1,s2){    
        return this.replace(new RegExp(s1,"gm"),s2);    
    }
 	
 	function appendData(){
 		var NAME='<%=request.getParameter("NAME")%>';
 		var url="<%=basePath %>showManagerTypes?NAME="+NAME; 	 	
 		 $(".pages_container1").children().remove();  
 		$.ajax({
 			url:url,
 			dataType:'json',
 			success:function(arrdata){  
 				var hm='<h1 style="text-align:center;color:#133D59;padding: 14px 14px;border: 1px solid #C1D6E6;border-bottom: none;font-size: 16px;">@NAME</h1>'+ 
    					'<div id="items" style="width:100%;height:@height;"><ul class="list-group">@itemNames </ul>';  
		        var divstr="";
 				for( var i in arrdata) {  
 					var result="";
 					var itemData=arrdata[i].subCoursetype; 
 				
 					var itemNames="";
 					var ctheight=0; 
 			
 				 	for(var j in itemData){   
 						itemNames+='<li class="list-group-item" onclick="showManagerTypes(\''+arrdata[i].NAME+'\',\''+itemData[j].NAME+'\');" style="cursor:pointer;"><b><span class = "badge">&gt;</span><span>'+itemData[j].NAME+"</span> </b></li>";
 						ctheight=j;
 					}  
 					
					if(NAME=="课程分类"){ 
						if(arrdata[i].NAME!="管理"){
							result=hm.replaceAll("@NAME", arrdata[i].NAME).replaceAll("@itemNames", itemNames).replaceAll("@height", ctheight*40); 	
							divstr+=result; 	
						}
						
 					}else{
 						result=hm.replaceAll("@NAME", arrdata[i].NAME).replaceAll("@itemNames", itemNames).replaceAll("@height", ctheight*40); 	
						divstr+=result; 
 					}
				}
 				
    		  $(".pages_container1").append('<div class="service_box1">'+divstr+'</div>'); 
 			  
 			}
 		});
 	}
 	
 	
 	function showManagerTypes(titleName,managerName){
 	   window.location.href="<%=basePath %>edu/ManagerTypeCourse.jsp?courseName="+managerName+"&titleName="+titleName;   
 	}
 	
 	$(document).ready(function(){
 		
 		appendData(); 
 	});
 
</script> 
</head>

<body>
    <div id="title2" >
		<a  href="javascript:void(0);" onclick="openLink('<%=basePath%>edu?jsessionid=<%=session.getId() %>');">
			<span style="text-align: left;float: left;padding-left: 10px;font-size: 22px;cursor:pointer; font-weight: bold;">
			&lt;
			</span>
		</a>
		<span id="ftitle" style="text-align: center;width: 80%;margin-top: 5px;" >
			管理分类
		</span>
	</div>
 	<div style="height: 400px;margin-top: 36px;">
	   	<div class="pages_container1"></div>                 
	</div> 
	
 </body>
</html>
