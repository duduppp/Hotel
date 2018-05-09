<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.fh.entity.system.User"%>
<script type="text/javascript">
var userName="";
<%
    
	User user = (User) request.getSession().getAttribute("sessionUser");
	if (null == user) {
		System.out.println("暂未登录" ); 
	} else {%> 
	 
  userName='<%=user.getUSERNAME()%>';
<%}%>
   
</script>