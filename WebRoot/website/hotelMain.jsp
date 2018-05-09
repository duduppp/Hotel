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
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title></title>
<script type="text/javascript">
	var fulls = "left=0,screenX=0,top=0,screenY=0,scrollbars=0";    //定义弹出窗口的参数  
	if (window.screen) {  
	   var ah = screen.availHeight ;  
	   var aw = screen.availWidth ;      
	   fulls += ",height=" + ah;  
	   fulls += ",innerHeight=" + ah;  
	   fulls += ",width=" + aw;  
	   fulls += ",innerWidth=" + aw;   
	   fulls += ",resizable"  
	} else {  
	   fulls += ",resizable"; // 对于不支持screen属性的浏览器，可以手工进行最大化。 manually  
	}  
	function openNewWindow(url,name){  
	window.opener=null;
	  try {
		window.open(url,name,fulls);  
		
		  opener.focus(); 
	      window.open('', '_self'); 
		  } catch (ex) { 
			   parent.window.close(); 
	     }finally{ 
	    	 _self.close();   //这里很关键
	     }
	
	}  
	openNewWindow("<%=basePath%>website/hotel.jsp", "酒店");
	window.setTimeout(function() {
		CloseWebPage();
	}, 1000);

	function CloseWebPage() {
		if (navigator.userAgent.indexOf("MSIE") > 0) {
			if (navigator.userAgent.indexOf("MSIE 6.0") > 0) {
				window.opener = null;
				window.close();
			} else {
				window.open('', '_top');
				window.top.close();
			}
		} else if (navigator.userAgent.indexOf("Firefox") > 0) {
			window.location.href = 'about:blank ';
		} else {
			window.opener = null;
			window.open('', '_self', '');
			window.close();
		}
	}
</script>
</head>
<body>

</body>
</html>
