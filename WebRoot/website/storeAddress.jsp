<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <style>
table { margin-top:10px; border-left:1px solid #ace; border-top:1px solid #ace; border-collapse:collapse; border-spacing:0; background-color:#F7FBFF; width:100%;}
th,td { vertical-align:middle; text-align:center; height:25px; line-height:25px; border-right:1px solid #ace; border-bottom:1px solid #ace;color:#07519A;font-size:13px;}
.blue{color:#07519A}
.red{color:red}
td { font-size:12px; color:#07519A;}
th { background:#ECF1F9}
tr { height:25px; line-height:25px;}
</style>

 

<table>
   <tr>
	 <th colspan='3'>郑远元店面信息表</th>
   </tr>
   <tr>
		<td width='40%'><strong class="red">店面名称</strong></td>
		<td width='40%'><strong><a  class="red" target="_blank" title="查看更多>>">联系电话</a></strong></td>
		<td width='20%'><strong><a  class="red" target="_blank" title="查看更多>>"></a></strong></td>
   </tr>
   <tr>  
	   <td>
	   <strong>
	  	 	<a>北京市</a>
	  		</strong>
	   	</td>
	   	<td>100000</td>
	   	<td></td>
   </tr> 
</table>