<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%@page import="java.net.*"%>
<%
    response.setContentType("application/x-download");//设置为下载application/x-download
    String filedownload = "/YYBS.apk";//即将下载的文件的相对路径
    String filedisplay = "远元商学院.apk";//下载文件时显示的文件保存名称
    String filenamedisplay = URLEncoder.encode(filedisplay,"UTF-8");
    response.addHeader("Content-Disposition","attachment;filename=" + filenamedisplay);
    
    try
    {
        RequestDispatcher dis = application.getRequestDispatcher(filedownload);
        if(dis!= null)
        {
            dis.forward(request,response); 
        }
        response.flushBuffer();
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
    finally
    {
    
    }
%>
<html>

<script language="javascript">
</script>
</html>
