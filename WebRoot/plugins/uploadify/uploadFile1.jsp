<%@page import="sun.misc.BASE64Decoder"%>
<%@page import="com.fh.entity.system.User"%>
<%@page import="com.sun.net.httpserver.HttpContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.util.*, org.apache.commons.fileupload.*, java.util.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*, org.apache.commons.fileupload.servlet.*" %>
<%!
	
	public void upload(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
	
	  try{
	 request.setCharacterEncoding("UTF-8");
     String fileName=request.getParameter("username")+new Date().getTime()+".jpg";

   
    	
    	String imgStr = "data:image/png;base64,"+request.getParameter("fileNmae").toString();  
    	 
    	 System.out.println(imgStr);
         BASE64Decoder decoder = new BASE64Decoder();  
    
             byte[] b = decoder.decodeBuffer(imgStr);  
             for(int i=0;i<b.length;++i)  
             {  
                 if(b[i]<0)  
                 { 
                     b[i]+=256;  
                 }  
             }  
             
             String imgFilePath = "D:\\new.jpg";//新生成的图片  
             OutputStream out = new FileOutputStream(imgFilePath);       
             out.write(b);  
             out.flush();  
             out.close();  
            
         
     }
     catch(Exception e){
         response.setContentType("application/json;charset=utf-8");
         response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
         String s="{\"result\":\"failure\"}";
         response.getWriter().print(s);
     }
     response.setContentType("application/json;charset=utf-8");
     
     String s="{\"result\":\"success\"}";
     response.getWriter().print(s);
 }
%>
 
 