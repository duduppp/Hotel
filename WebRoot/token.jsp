
<%@page import="java.util.Date"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.*"%>
<%
	BufferedReader br = new BufferedReader(new InputStreamReader((ServletInputStream) request.getInputStream()));

	String line = null;

	StringBuilder sb = new StringBuilder();

	while ((line = br.readLine()) != null) {
		sb.append(line);
	}

	//去除发送用户  
	String xmlS = sb.toString();

	System.out.println(xmlS);

	if (xmlS != null && !xmlS.equals("")) {
		int fromuser_s = xmlS.indexOf("<FromUserName><![CDATA[");

		int fromuser_e = xmlS.indexOf("]]></FromUserName>");

		String fromuser = xmlS.substring(fromuser_s + 23, fromuser_e);

		System.out.println("fromuser:" + fromuser);

		//取出目标用户  
		int touser_s = xmlS.indexOf("<ToUserName><![CDATA[");

		int touser_e = xmlS.indexOf("]]></ToUserName>");

		String touser = xmlS.substring(touser_s + 21, touser_e);

		//取出发送内容  
		int content_s = xmlS.indexOf("<Content><![CDATA[");

		int content_e = xmlS.indexOf("]]></Content>");

		String content = xmlS.substring(content_s + 18, content_e);

		System.out.println("content:" + content);

		if (content.equals("Hello2BizUser")) {
			out.print("<xml>");

			out.print("<ToUserName><![CDATA[" + fromuser
					+ "]]></ToUserName>");

			out.print("<FromUserName><![CDATA[" + touser
					+ "]]></FromUserName>");

			out.print("<CreateTime>" + new Date().getTime()+ "</CreateTime>");

			out.print("<MsgType><![CDATA[text]]></MsgType>");

			out.print("<Content><![CDATA[额.....没能成功识别，元芳淡定的说：有错别字，请换个试试！]]></Content>");

			out.print("<FuncFlag>0</FuncFlag>");

			out.print("</xml>");
		}
		 File f=new File("c:\\weixin.txt");
		    
	     FileWriter fw=null;
	     BufferedWriter bw=null;
	     try{
	         if(!f.exists()){
	             f.createNewFile();
	         }
	          fw=new FileWriter(f.getAbsoluteFile(),true);  
	          bw=new BufferedWriter(fw);
	          bw.write(content);
	          bw.close();
	     }catch(Exception e){
	        e.printStackTrace();
	     }
	}
	
	
%>
