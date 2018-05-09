<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />  
<meta content="yes" name="apple-mobile-web-app-capable" />  
<meta content="black" name="apple-mobile-web-app-status-bar-style" />  
<meta content="telephone=no" name="format-detection" />
 <style type="text/css">
 #title2 {
	top:1px;width:auto;
	overflow:hidden;
	height: 35px;
	line-height: 30px;
	background-image:-webkit-linear-gradient(bottom,#EFEFF0 3%,#EFEFF0 97%,#fff 100%);
	border-bottom: 1px #fff solid;
	position:fixed!important;/*FF IE7*/ 
	position:absolute;/*IE6*/ 
	width:100%;
	z-index: 9999;
}
 #ftitle {
    float: left;
    display: block;
    width: 76px;
    height: 29px;
    font-weight: bold;
    padding-left: 3px;
    top: 0;
}
 .list-ui-b li, .list-ui-div {
    background: -webkit-gradient(linear, 50% 0%, 50% 100%,from(#F9F9F9),to(#eee));
}

 .fix:after{ display:block; content:''; clear:both; visibility:hidden}
.list-ui-div {
    border-bottom: 1px solid #ccc;
}
.cate-list dt{color:#3367CD;font-size:16px;padding:0 16px;margin-top:-21px;font-weight:700;}
.cate-list dt:after{content:' ';position:absolute;top:12px;right:20px;width:8px;height:8px;border:#999 solid;border-width:2px 2px 0 0;-webkit-transform:rotate(135deg);}
.cate-list dt.cur:after{-webkit-transform:rotate(-45deg);top:15px;}
.cate-list li:first-child dt{border-top:none;}
.cate-list dt a{display:block;color:#38720B;font-size:20px;}
.cate-list dd{background:#fff; padding-left: 0px;margin-left: 0px;}
.cate-list dd li{float:left;width:50%;}
.cate-list dd a,.cate-list dd span{display:block;height:39px;line-height:39px;text-align:center;overflow:hidden;border-bottom:1px solid #ccc;border-right:1px solid #ccc;}
.cate-list dd li:nth-of-type(even) a{border-right:0;}
.list-ui-a li, .list-ui-b li, .list-ui-div {
    position: relative;
    height: 38px;
    line-height: 38px;
    overflow: hidden;
    background: -webkit-gradient(linear, 50% 0%, 50% 100%,from(#eee),to(#ddd));
    border-top: 1px solid #ccc;
    font-size: 14px;
}
body{
  	margin: 0px;
  	padding: 0px;
}
a {
    color: #333;
    text-decoration: none;
}
.line {
    background: #ccc;
    border-bottom: 1px solid #fbfbfb;
    height: 1px;
    overflow: hidden;
    margin: 10px 0;
}
ul, ol, li {
    list-style: none;
    padding-left: 0px;
    margin-left: 0;
}
li {
    display: list-item;
    text-align: -webkit-match-parent;
}
 </style>
 
<c:import url="username.jsp"></c:import>
<script type="text/javascript" src="<%=basePath%>static/js/jquery-1.9.1.min.js"></script>
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
 		 $("#pages_container1").children().remove();  
 		$.ajax({
 			url:url,
 			dataType:'json',
 			success:function(arrdata){  
 				 
 				var hm="";
		       
 				for( var i in arrdata) {  
 					var result='<li style="padding-left:-20px;margin-left:0px;"><dl><dt class="list-ui-div"><a href="javascript:void(0);">@NAME</a></dt><dd><ul class="fix">';  
 					var itemData=arrdata[i].subCoursetype;  
 				
 					var itemNames=""; 
 					var ctheight=0; 
 			
 				 	for(var j in itemData){   
 						itemNames+='<li style="padding-left:0px;margin-left:0px;"><a href="javascript:void(0);" onclick="showManagerTypes(\''+arrdata[i].NAME+'\',\''+itemData[j].NAME+'\');">'+itemData[j].NAME+'</a></li>';
 						ctheight=j; 
 					}  javascript:void(0);
 					
					if(NAME=="课程分类"){ 
						if(arrdata[i].NAME!="管理"){
							hm+=result.replaceAll("@NAME", arrdata[i].NAME)+itemNames+"</ul></dd></dl></li>"; 	
						}
						
 					}else{
 						hm+=result.replaceAll("@NAME", arrdata[i].NAME)+itemNames+"</ul></dd></dl></li>"; 	
 					}
				}
 				console.info(hm);
    		  $("#pages_container1").append(hm); 
 			  
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
	<div id="title2">
		<a href="javascript:void(0);"
			onclick="openLink('<%=basePath%>edu?jsessionid=<%=session.getId()%>');">
			<span style="text-align: left;float: left;padding-left: 10px;font-size: 22px;cursor:pointer; font-weight: bold;">
				&lt; 
			</span>
		</a> 
		<span id="ftitle" style="text-align: center;width: 80%;margin-top: 5px;"> 管理分类 </span>
	</div>
	<div style="height: 400px;margin-top: 36px;">

		<div class="line"></div>
		<div class="cate-list">
			<ul class="fix" id="pages_container1">
			 
			</ul>
		</div>
		<div class="line"></div>

	</div>

</body>
</html>
