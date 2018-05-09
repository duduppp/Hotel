<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<jsp:include page="username.jsp" flush="true"></jsp:include>

<html>
  <head>
   <title>商学院</title>
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />  
<meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no" />  
<meta content="yes" name="apple-mobile-web-app-capable" />  
<meta content="black" name="apple-mobile-web-app-status-bar-style" />  
<meta content="telephone=no" name="format-detection" />
<link rel="stylesheet" href="<%=basePath %>static/ace/css/bootstrap.css" />
<link rel="stylesheet" href="<%=basePath %>static/edu/css/common.css"/>
<link rel="stylesheet" href="<%=basePath %>static/edu/css/star.css"/>
<link rel="stylesheet" href="<%=basePath %>static/ace/css/font-awesome.css"/>
<link href="<%=basePath %>plugins/mobileLayer/need/layer.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="<%=basePath %>static/css/font-awesome.min.css" />
<style type="text/css">

.login-others {
    text-align: center;
    padding-top: 20px;
    -webkit-transition: all .28s;
    transition: all .28s;
}

.login-others .other-logo:first-child {
	margin-left: 0;
}

.login-others .other-logo {
	display: inline-block;
	width: 81px;
	margin-left: 38px;
}

.other-logo{
	display:inline-block;
	width:81px;
	margin-left:38px;
	text-align:center;
}

.login-others span {
	width: 82px;
	height: 82px;
	display: block;
	background: url('<%=basePath %>static/edu/images/shouye/login_v6.png') no-repeat;
}

 .logo-qq  span{
	background-position: 0 0;
	
}
.logo-qq span:hover{
	background-position: 0 -84px;
}
.logo-wechat span {
	background-position: -168px 0;
}

.logo-wechat span:hover {
	background-position: -168px -84px;
}

.logo-weibo  span{ 
	background-position: -84px 0;
}

.logo-weibo span:hover  {
	background-position: -84px -84px;
}
</style>
<script type="text/javascript" src="<%=basePath%>static/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>static/edu/js/star.js"></script>
<script type="text/javascript" src="<%=basePath %>plugins/mobileLayer/layer.js"></script>
<script type="text/javascript" src="<%=basePath %>static/player/sewise.player.min.js"></script>
 
    
<script type="text/javascript">
	 jQuery.ctx='<%=basePath%>'; 
	 var courseID="123456789";
</script>
<script type="text/javascript">

    $(document).ready(function(){
    	
 
    	 var bodyheight=$(document.body).height();
    	 
    	 $("#contentdivId").css({
    		height: bodyheight-320
    	 });
    	 $("#leavedivId").css({
    		 top:bodyheight-176
    	 });
    	 getCommentMessages();
    	 window.setInterval(function(){
    		 
    		 getCommentMessages();
    	 }, 10000); 
		
 
    }); 
    
    String.prototype.replaceAll  = function(s1,s2){ 
    	
        return this.replace(new RegExp(s1,"gm"),s2);    
    }
    
    Date.prototype.format = function(format) {
        var date = {
               "M+": this.getMonth() + 1,
               "d+": this.getDate(),
               "h+": this.getHours(),
               "m+": this.getMinutes(),
               "s+": this.getSeconds(),
               "q+": Math.floor((this.getMonth() + 3) / 3),
               "S+": this.getMilliseconds()
        };
        if (/(y+)/i.test(format)) {
               format = format.replace(RegExp.$1, (this.getFullYear() + '').substr(4 - RegExp.$1.length));
        }
        for (var k in date) {
               if (new RegExp("(" + k + ")").test(format)) {
                      format = format.replace(RegExp.$1, RegExp.$1.length == 1
                             ? date[k] : ("00" + date[k]).substr(("" + date[k]).length));
               }
        }
        return format;
 }
 
    function getCommentMessages(){
    	
  	  var str='<tr onclick="replay(\'@USERNAME\');" >'
			+'<td rowspan="2" style="text-align: center;width: 20%;"> '
			+'	<img id="PICPATHid" style="width:40px;height:40px;cursor: pointer;" src="<%=basePath%>static/edu/images/user/user01.png" />'
			+'<br/><c:out value="@USERNAME"></c:out>'
			+'</td>'
			+'</tr>'
			+'<tr onclick="replay(\'@USERNAME\');">'
			+'	<td style="text-align: left;height: 96px;"> ' 
			+'	 	<span style="font-size: 12px;font-weight: bold;">@CONTENT</span>'
			+'</td><td></td>'
			+'</tr>'
			+'<tr style="border-bottom:  1px solid #000000;">'
			+'	<td onclick="replay(\'@USERNAME\');" style="text-align: left;height: 10px;"> ' 
			+'	 	<span style="font-size: 10px;"></span>'
		 	+' </td><td></td>'
		 	+'</tr>';
		 	
    	var url="<%=basePath%>getCommentMessages"; 
    	 $.ajax({
 			url:url,
 			data:{
 				COURSEMANAGER_ID:courseID
 			},
 			dataType:'json',
 			success:function(data){ 
 	 		var commentmanagementList=data["commentmanagementList"];
 			 var tablestr="";
 			 var result="";
 				if(null!=commentmanagementList){ 
 					
 					$('#commentTableid tr:gt(0)').each(function () {                  
		               $(this).remove();      
		            });  
 				 
 					$("#messageTimesId").text(commentmanagementList.length); 
 					$("#inputmessageCountId").text(commentmanagementList.length); 
 					
 					var ct=0;
 				for ( var i in commentmanagementList) {
 					  if(ct<7){ 
 						var loginsign=commentmanagementList[i].USERNAME;
 						 if(loginsign.length>6){
 							loginsign=loginsign.substring(0,6)+"****";
 						 }else{
 							loginsign+="****"; 
 						 }
 						tablestr=str.replaceAll("@USERNAME",loginsign);
 					    var commentTime=commentmanagementList[i].COMMENTTIME;
 					 
 					 	var newDate=new Date();
 					 	newDate.setTime(commentTime); 
 					    commentTime=newDate.format('yyyy-MM-dd h:m:s');
 						tablestr=tablestr.replaceAll("@COMMENTTIME",commentTime);
 						tablestr=tablestr.replaceAll("@CONTENT",commentmanagementList[i].CONTENT);
 						tablestr=tablestr.replaceAll("@COURSEID",commentmanagementList[i].COURSEID);
 						tablestr=tablestr.replaceAll("@SUPPORT",commentmanagementList[i].SUPPORT);  
 						tablestr=tablestr.replaceAll("@COMMENTMANAGEMENT_ID",commentmanagementList[i].COMMENTMANAGEMENT_ID);
 						result+=tablestr;
 					  }
 						ct+=1; 
 					}  
 				 $("#commentTableid").append(result); 
 				
 				}
 			}
 		 }); 
    }
    
 
    //获取当前的日期时间 格式“yyyy-MM-dd HH:MM:SS”
    function getNowFormatDate() {
        var date = new Date();
        var seperator1 = "-";
        var seperator2 = ":";
        var month = date.getMonth() + 1;
        var strDate = date.getDate();
        if (month >= 1 && month <= 9) {
            month = "0" + month;
        }
        if (strDate >= 0 && strDate <= 9) {
            strDate = "0" + strDate;
        }
        var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
                + " " + date.getHours() + seperator2 + date.getMinutes()
                + seperator2 + date.getSeconds();
        return currentdate;
    }
    
    function showInfo(id){
    	
    	var status=$("#"+id).attr("status");
    	var hei=$("#"+id).height();
    	if(status==0){ 
    		$("#"+id).css({
        		height:"100%"
        	});
    		status=1;
    		$("#"+id).attr("status",status);
    	}else{
    		$("#"+id).css({
        		height:80
        	});
    		status=0;
    		$("#"+id).attr("status",status);
    	}  
    }
    
    function openLink(url){ 
    	
  	  if($.trim(userName).length>0){
  		  window.top.location.href=url; 
  	  }else{
  		  window.top.location.href="./edu/win_login.jsp";  
  	  }
    } 
    
   
    /*
    * 显示打赏二维码
    */
    function showReward2Code(){
    	
		var  index=layer.open({
			  type: 1,
			  title: '长按识别二维码',
			  closeBtn: 0,
			  shadeClose: true,
			  skin: 'layui-layer-demo',
			  content: '<div style="padding:20px;z-index:99999;"><img width="200px" height="170" src="<%=basePath%>static/edu/code2.png" ></div>'
		}); 
    	$(".section").css({
    		position:"absolute",
    		top:230,
    		left:"15%"
    	});
    } 
 
    
    //回复
    function sendmessage(){
    	var url="<%=basePath%>addleaveMessageSupport";
     	var content=$("#replayinputId").val();   
     	if(content.length>250){    
			$("#replayinputId").val(""); 
			return false;
		}
  	    $.ajax({ 
  			url:url,
  			data:{ 
  				USERNAME:'${sessionScope.sessionUser.USERNAME}', 
  				COURSEID:courseID,
  				SUPPORT:0,
  				COMMENTTIME:getNowFormatDate(), 
  				CONTENT:content
  			},
  			dataType:'json',
  			success:function(data){
  				$("#replayinputId").val(""); 
  			 
  				getCommentMessages();
  			}
  	     
  		 });  
    }
    /*
    *留言
    */
    function comment(id){
    
    	if (event.keyCode == 13){
    	    event.returnValue=false;
    	    event.cancel = true;
    		var commentstr=$("#"+id).val();
    		if(commentstr.length>250){
    			$("#"+id).val("");
    			return false;
    		}
    		var url="<%=basePath%>addleaveMessageSupport"; 
    	    $.ajax({
      			url:url,
      			data:{
      				USERNAME:'${sessionScope.sessionUser.USERNAME}', 
      				COURSEID:courseID, 
      				SUPPORT:0,
      				COMMENTTIME:getNowFormatDate(), 
      				CONTENT:commentstr
      			},
      			dataType:'json',
      			success:function(data){
      				
      				getCommentMessages();
      				$("#"+id).val("");
      			 
      			}
      	      
      		 }); 
    	 }
    }
    /**
     *右上角分享
     *
     */
    function shareLink(){
    	layer.open({
    		  type: 3,
    		  content:'在右上角单击进行分享'
    	});   
     
    }
    /**
     * 打开连接，判断否登录
     * @param url
     */
    function openLink(url){ 
  	  
  	  if($.trim(userName).length>0){
  		  window.location.href=url; 
  	  }else{
  		  window.location.href="./edu/user.jsp";   
  	  }
    }
    
    </script>
  </head>
  <body style="overflow: hidden; ">
    
  <div id="title1">  
		<a  href="javascript:void(0);" onclick="openLink('<%=basePath%>edu');">
			<span style="text-align: left;float: left;padding-left: 10px;font-size: 22px;cursor:pointer; font-weight: bold;">
		&lt; </span>
		</a>
		<span id="ftitle" style="text-align: center;width: 80%;margin-top: 5px;" >直    播     间</span>
  </div> 
 
  <div id="player" style="width:100%;height: 230px;">
		<script type="text/javascript">
			SewisePlayer.setup({
				server: "vod",
				type: "m3u8",
				autostart: "true",
				poster: "<%=basePath%>static/edu/images/shouye/timg.jpg",
				videourl: "http://www.zhengyuanyuan.com:8080/hls/dp.m3u8",
		        skin: "vodWhite",//"liveWhite",
		        title: "远元 直播间",
		        lang: "zh_CN",
		        claritybutton: 'disable'
			}, "player");
		</script>
   </div>
		
  <div style="height:10px;overflow: auto;" id="contentdivId">
    <div style="height: 10px;">&nbsp;</div>
       <div style="width: 100%;" >
     	 <div style="border-bottom:  2px solid #000000;margin-left: 10px;margin-right: 10px;   ">
  			
     	</div>
     	<div style="margin-left: 10px;margin-right: 10px;   ">
     		<table id="commentTableid"  style="width: 100%;margin-bottom: 10px solid #000000;" border="0"   >
     			<tr height="36px" >
     				<td> <span style="font-size: 14px;font-weight: bold;margin-left: 5px;">评论</span> 
     			</td>
     				<td></td>
     				<td style="text-align: right;"><span style="font-size: 12px;"></span></td>
     			</tr> 
     		</table>
     	</div> 
     	 
     		</div>
     </div>
     
     <div style="margin: 0 auto;" id="leavedivId" >
	     <table   style="width: 100%;border-top: 1px solid #536068; ">
	     	<tr height="60">
	     		<td style="width: 65%;text-align: center;">
	     		 <input  x-webkit-speech lang="zh-CN" x-webkit-grammar="builtin:search" type="search" contenteditable="true" value="" id="replayinputId" style="width: 95%;height:36px;  border-radius:6px;" />
	     			<input type="hidden" id="toUserName" value="">
	     		</td>
	     		<td style="width: 25%;text-align: center;">
	     		 	<a class="btn btn-sm btn-success"   onclick="sendmessage();">发送</a>
	     		</td>
	     		<td>
	     			 
	     			<a class="btn btn-sm btn-warning"  onclick="showReward2Code();">打  赏</a>
	     			
	     		 
	     		</td>
	     		<td style="width: 20%;text-align: center;cursor:pointer;">
	     		 	<i class="menu-icon fa fa-external-link  black" style="font-size: 26px;cursor: pointer;"
	     		 	onclick="shareLink();" ></i> 
	     		 </td> 
	     	 
	     	</tr>
	      
	     </table>
     </div>
  </body>
</html>
