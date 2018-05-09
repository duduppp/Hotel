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
<link rel="stylesheet" href="<%=basePath %>plugins/mobileLayer/need/layer.css"   />
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
<script type="text/javascript" src="<%=basePath%>edu/video.js"></script>
<script type="text/javascript" src="<%=basePath %>plugins/mobileLayer/layer.js"></script>
<script type="text/javascript">
	 jQuery.ctx='<%=basePath%>'; 	
	 var jsessionid = "<%=session.getId()%>";  //勿删，uploadify兼容火狐用到
</script>
<jsp:include page="username.jsp" flush="true"></jsp:include>
<script type="text/javascript">
    $(document).ready(function(){
    	
    	 playVideo({
             elemt: document.getElementById("myElement"),
             src: "<%=basePath%>${course.FILEPATH}",
             poster:"<%=basePath%>${course.SCREENSHOT}",
             preload: "false",
             autoplay: "false",
             loop: "true",
             height:"190"
         });
   
      	 window.setTimeout(function(){
       
      		
    	  document.getElementById("playVideo").play(); 
    	 }, 3000);   
    	
       //size xl, lg, md, sm, and xs
    	$(".rating").rating({
	    		min:0,
	    		max:5,
	    		step:1
	    		
    	}); 
       
        if('${studyRecordData.SCORE}'!=''){
        	<c:if test="${!empty studyRecordData}">
        	 $(".rating").rating('update',
      			   ${studyRecordData.SCORE}); 
        	</c:if> 
        }
    	
       //设置星星
    	$(".rating").on('rating.change', function(event, value) {
    		 //单击直接修改
    	  var url="<%=basePath%>updateCourseData";
    		$.ajax({
 			url:url,
 			data:{
 				USERNAME:'${sessionScope.sessionUser.USERNAME}', 
 				COURSEID:'${course.COURSEMANAGER_ID }',
 				SCORE:value
 			},
 			dataType:'json',
 			success:function(data){
 				console.info(data.status); 
 				 
 			}
			 });
    	 });
    	 //设置心的颜色
    	 if('${studyRecordData.SUPPORTSTATUS}'=='0'){
    		 $("#SUPPORTSTATUS").css({
    			"color":"black"
    		 }); 
    	 }else{
	 		$("#SUPPORTSTATUS").css({
	 		  "color":"red" 
	    	});
    	 }
    	 
    	 var bodyheight=$(document.body).height();
    	 
    	 $("#contentdivId").css({
    		height: bodyheight-280
    	 });
    	 $("#leavedivId").css({
    		 top:bodyheight-156
    	 });
    	  
    	  var before = $("#contentdivId").scrollTop();
          $("#contentdivId").scroll(function() {
              var after = $("#contentdivId").scrollTop();
              if (before<after) {
            	  $("#leavedivId").hide(); 
                  before = after;
              };
              if (before>after) {
            	  $("#leavedivId").show();
                  before = after;
              };
          });
 
		getCommentMessages();
 
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
			+'<td rowspan="3" style="text-align: center;width: 20%;"> '
			+'	<img class="gntub" style="padding-top: -20px;" src="@REMARK">'
			+'</td>'
			+'<td style="text-align: left;width: 65%;height: 36px;">   '
			+' 	<span style="font-size: 12px;font-weight: bold;"><c:out value="@USERNAME"></c:out></span>'
			+'</td>'
			+'<td style="text-align: left;width: 15%;"> '
			+'</td>'
			+'</tr>'
			+'<tr onclick="replay(\'@USERNAME\');">'
			+'	<td style="text-align: left;height: 36px;"> ' 
			+'	 	<span style="font-size: 12px;font-weight: bold;">@CONTENT</span>'
			+'</td>'
			+' <td>  '
			+'  </td>'
			+'  <td>'
			+'  </td>'
			+'</tr>'
			+'<tr>'
			+'	<td onclick="replay(\'@USERNAME\');" style="text-align: left;height: 36px;"> ' 
			+'	 	<span style="font-size: 10px;">@COMMENTTIME</span>'
		 	+' </td>'
		 	+' <td style="text-align: right;"> ' 
		 	+'   	<span style="font-size: 16px;font-weight: bold;cursor: pointer;" onclick="leaveMessageSupport(\'@COMMENTMANAGEMENT_ID\',@SUPPORT,\'\');" >'
		 	+'	   		<i class="menu-icon icon-thumbs-up-alt black"   >&nbsp;</i>   '
		 	+'	   		 @SUPPORT'
		 	+'	   </span>'
		 	+'    </td>'
		 	+'   <td>	'
		 	+'  </td>' 
		 	+'</tr>';
		 	
    	var url="<%=basePath%>getCommentMessages"; 
    	 $.ajax({
 			url:url,
 			data:{
 				COURSEMANAGER_ID:'${course.COURSEMANAGER_ID }'
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
 					 
 					$("#commentMessageCountId").text("("+commentmanagementList.length+")"); 
 					$("#messageTimesId").text(commentmanagementList.length); 
 					$("#inputmessageCountId").text(commentmanagementList.length); 
 					
 					
 				for ( var i in commentmanagementList) {
 						 
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
 						tablestr=tablestr.replaceAll("@REMARK",commentmanagementList[i].REMARK);
 						tablestr=tablestr.replaceAll("@CONTENT",commentmanagementList[i].CONTENT);
 						tablestr=tablestr.replaceAll("@COURSEID",commentmanagementList[i].COURSEID);
 						tablestr=tablestr.replaceAll("@SUPPORT",commentmanagementList[i].SUPPORT);  
 						tablestr=tablestr.replaceAll("@COMMENTMANAGEMENT_ID",commentmanagementList[i].COMMENTMANAGEMENT_ID);
 						result+=tablestr;
 					}  
 				 $("#commentTableid").append(result); 
 				
 				}
 			}
 		 }); 
    }
    
    /*
     *
     *回复消息
     */
    function replay(username){
    	$("#toUserName").val(username);
	     var bodyheight=$(document.body).height();	
	     $("#leavedivId").hide(); 
	 	 $("#replyId").css({
	 		 top:bodyheight-156
	 	 }).show();
    	
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
    	alert('<%=session.getId() %>');
  	  if('<%=session.getId() %>'.length>0){ 
  		  window.top.location.href=url; 
  	  }else{
  		  window.top.location.href="./edu/win_login.jsp";  
  	  }
    } 
    
    /**
    *
    * 点击  喜爱（支持）
    *
    */
    function supportCourse(COURSEMANAGER_ID){    
    	
    	var SUPPORTSTATUS=$("#SUPPORTSTATUS").attr("value");
    	if(SUPPORTSTATUS==0||SUPPORTSTATUS==""){ 
    		 $("#SUPPORTSTATUS").css({
    			 "color":"red"
    		 });
    		 SUPPORTSTATUS=1;
    		 $("#SUPPORTSTATUS").attr("value",SUPPORTSTATUS);
    	 }else{
	 		$("#SUPPORTSTATUS").css({
	 			 "color":"black" 
	    	});
	 		SUPPORTSTATUS=0;
	 		$("#SUPPORTSTATUS").attr("value",SUPPORTSTATUS);
    	 }
    
   	   var url="<%=basePath%>updateCourseData";
   	   
	   $.ajax({
			url:url,
			data:{
				USERNAME:'${sessionScope.sessionUser.USERNAME}', 
				COURSEID:'${course.COURSEMANAGER_ID }', 
				SUPPORTSTATUS:SUPPORTSTATUS
			},
			dataType:'json',
			success:function(data){
			}
		 });  
     }
    /*
    * 显示打赏二维码
    */
    function showReward2Code(){
 
    	layer.open({
			  type: 1,
			  title: false,
			  closeBtn: 0,
			  shadeClose: true,
			  skin: 'layui-layer-demo	',
			  content: '<div style="padding:20px;z-index:99999;"><img width="200px" height="170" src="<%=basePath%>${course.REWARD2CODE}" ></div>'
		});  
    	
    } 
    
    /*
     * 课程支持
     *
    */
    function courseManagerSupport(COURSEMANAGER_ID,SupportId){
   	 //单击直接修改
  	  var url="<%=basePath%>courseManagerSupport";
  	  var support=$("#"+SupportId).text();
  	 
  	  support=$.trim(support);
  	  var count=parseInt(support)+1;   
  		$.ajax({
			url:url,
			data:{
				COURSEMANAGER_ID:COURSEMANAGER_ID,  
				SUPPORTTIMES:count
			},
			dataType:'json',
			success:function(data){
				$("#"+SupportId).text(count+'');
			}
		});
    }
    
    /*
    *留言支持
    */
    function leaveMessageSupport(COMMENTMANAGEMENT_ID,SUPPORT,relationSupportId){
    	
      var url="<%=basePath%>leaveMessageSupport";
      var count=SUPPORT+1;   
   	   $.ajax({
   			url:url,
   			data:{
   				COMMENTMANAGEMENT_ID:COMMENTMANAGEMENT_ID,
   				SUPPORT:count
   			},  
   			dataType:'json',  
   			success:function(data){ 
   			    getCommentMessages();
   			}
   		 });  
    }
    
    //回复
    function sendmessage(replayNAme){
    	var url="<%=basePath%>addleaveMessageSupport";
     	var content=$("#replayinputId").val();   
    	
     	if(content.length>250){   
			$("#replayinputId").val(""); 
			return false;
		}
    	
     	var replayName=$("#toUserName").val();
  	    $.ajax({
  			url:url,
  			data:{ 
  				USERNAME:'${sessionScope.sessionUser.USERNAME}', 
  				COURSEID:'${course.COURSEMANAGER_ID }',
  				SUPPORT:0,
  				COMMENTTIME:getNowFormatDate(), 
  				CONTENT:'回复 '+replayName+":"+content
  			},
  			dataType:'json',
  			success:function(data){
  				$("#replayinputId").val(""); 
  				 $("#replyId").hide();
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
      				COURSEID:'${course.COURSEMANAGER_ID }', 
      				SUPPORT:0,
      				COMMENTTIME:getNowFormatDate(),   
      				CONTENT:commentstr
      			},
      			dataType:'json',
      			success:function(data){
      				
      				getCommentMessages();
      				$("#"+id).val("");
      				$("#leavedivId").hide();
      			}
      		 }); 
    	 }
    }
    
    /**
     *右上角分享
     *
     */
    function shareLink(sheretype,title, desc, link, imgUrl){
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
		<span id="ftitle" style="text-align: center;width: 40%;margin-top: 5px;" ></span>
		<span id="ftitle" style="text-align: center;width: 40%;margin-top: 5px;" ></span>
  </div> 
  <div id="myElement" style="width: 100%;height: 190px;z-index: 1119;margin:0px;  z-index:999; top:0;margin-top: 0px;padding-top: 0px;">
   &nbsp;</div>
  <div style="height:250px;overflow: auto;" id="contentdivId">
    <div style="height: 10px;">&nbsp;</div>
       <div style="width: 100%;" >
     	 <div style="border-bottom:  2px solid #000000;margin-left: 10px;margin-right: 10px;   ">
     		<table style="width: 100%;margin-bottom: 10px;" >
     			<tr height="36">
     				<td colspan="3" style="width: 90%"><span style="font-weight: bold;">${course.COURSETITLE}</span> </td>
     				<td rowspan="3" style="text-align: right;"> 
     					<i id="SUPPORTSTATUS" value="${studyRecordData.SUPPORTSTATUS}" class="menu-icon fa fa-heart red"
     					 style="font-size: 30px;cursor: pointer;" onclick="supportCourse('${course.COURSEMANAGER_ID}');">&nbsp;</i>  
     				</td>
     			</tr>
     			<tr height="30">
     				<td style="font-size: 12px;">
     				   <input id="starId" value="0" type="number" class="rating" style="cursor: pointer;"  data-size="xs" >
     				 </td>
     				<td style="text-align: center;"><span style="font-size: 10px;">| <font style="font-weight:bold; " id="messageTimesId">
     				${course.MESSAGETIES }</font> 人已评</span></td>
     				<td></td> 
     			</tr>
     			<tr  height="30">
     				<td><span style="font-weight: bold;">${course.COURSETITLE}</span> </td>
     				<td></td>
     				<td></td>
     			 
     			</tr>
     			<tr  height="30">
     				<td> <span style="color: red;font-weight: bold;" > </span></td>
     				<td></td>
     				<td>  <input type="button" style="background-color: red;color: #ffffff;" onclick="showReward2Code();" value=" 打  赏 " >  </td>
     				<td></td>
     			</tr>
     		</table>
     	</div>
     	<div style="padding-bottom:  1px solid #acacac;margin-left: 10px;margin-right: 10px; margin-top: 5px;  ">
     		<table style="width: 100%;margin-bottom: 10px;">
     			<tr height="30">
     				<td><span style="font-weight: bold;">讲师：</span>${course.LECTURERNAME } &nbsp;>    </td>
     				<td></td>
     				<td></td>
     				<td></td>
     			</tr>
     			<tr height="30">
     				<td><span style="font-weight: bold;">课程简介：</span> </td>
     				<td></td>
     				<td></td>
     				<td></td>
     			</tr>
     			<tr >
     				<td rowspan="4" >
     					<div id="infotdid" status="0"  style="cursor:pointer; height:80px;width: 100%;display:block;overflow:hidden;"
     					 onclick="showInfo('infotdid');" >
     						${course.COURSEINTRODUCTION }
     					</div>
     				</td>
     			</tr>
     			 
     		</table>
     	</div>
     <div style="margin-left: 10px;margin-right: 10px; margin-top: 5px;    ">
     		<table style="width: 100%;">
     			<tr>
     				<td>
     				    <span style="font-weight: bold;">课程章节 ：</span>
     				    <span style="font-size: 10px;">${course.COURSECHAPTERS }</span>
     				</td>
     				<td></td>
     				<td></td>
     				<td style="text-align: right;"><span style="font-size: 10px;"> 全部></span></td>
     			</tr>
     		</tabe>
     		<div he ></div>
     		<table style="width: 100%;margin-bottom: 10px;" border="0">
     			
     			 <c:forEach items="${allCourseList}" var="var" varStatus="vs">
	     			<tr height="36" onclick="openLink('showCourse?COURSEMANAGER_ID=${var.COURSEMANAGER_ID}');" style="cursor: pointer;" >
	     				<td style="width: 5%;text-align: left;font-size: 12px;text-align: right;" >${var.COURSECHAPTERS } </td>
	     				<td style="width: 15%;padding-bottom:  1px solid #000000; text-align: center;font-size: 10px;  ">【MP4】</td>
	     				<td style="width: 65%;padding-bottom:  1px solid #000000;text-align: left;vertical-align: middle;   ">
	     					<div style="font-size: 14px;font-weight: bold;">
	     					${var.COURSETITLE }
	     					</div>
	     					<br/>
	     					<div style="font-size: 10px;">学完本章节需要用时：${var.PLAYTIME }</div>
	     				 </td>
	     				<td style="width: 15%;padding-bottom:  1px solid #000000; text-align: right; font-size: 10px; ">${var.FILESIZE }</td>
	     			</tr>
	     			<tr height="15" >
	     			<td> &nbsp;</td>
	     			<td colspan="3"><hr style="height: 3px;color: red;"/>  </td>
	     			</tr>
     			
     			</c:forEach>
     			 
     		</table>
     	</div>
     	<div style="margin-bottom:30px;margin-left: 10px;margin-right: 10px;   ">
     		<table style="width: 100%;border-bottom: 10px;">
     			<tr height="36">
     				<td ><span style="font-size: 14px;font-weight: bold;">谁在学</span> <span style="font-size: 10px;">(${fn:length(readCoursePageDataList)})</span> </td>
     				<td></td>
     				<td></td>
     				<td style="text-align: right;"> 全部></td>
     			</tr>
     			</table>
     	   <table style="width: 100%;margin-bottom: 10px solid #000000;">
     			<tr>
	     			<c:forEach items="${readCoursePageDataList}" var="stu" varStatus="vs">
	     				<td style="text-align: center;">  
	     					<img class="gntub" src="${stu.REMARK}">
	                        <div  style="margin-top: 10px;font-size: 10px;">
	                            <span>${stu.USERNAME}</span>
	                        </div>
	                    </td> 
	                </c:forEach>
     			</tr>
     			<tr>
      				<td colspan=" ${fn:length(readCoursePageDataList)}">
     					<hr/> 
     				</td>
     			</tr>
     		</table>
     	</div>
     	<div style="margin-left: 10px;margin-right: 10px;   ">
     		<table id="commentTableid"  style="width: 100%;margin-bottom: 10px solid #000000;" border="0"   >
     			<tr height="36px" >
     				<td> <span style="font-size: 14px;font-weight: bold;margin-left: 5px;">评论</span> 
     				 <span style="font-size: 10px;" id="commentMessageCountId">0</span></td>
     				<td></td>
     				<td style="text-align: right;"><span style="font-size: 12px;"> 全部 ></span></td>
     			</tr> 
     		</table>
     	</div> 
     		<div style="margin-left: 10px;margin-right: 10px;   ">
     		<div style="height: 20px;width: 100%;">
     			 <span style="font-size: 14px;font-weight: bold;">相关推荐 </span>
     		</div>
     		    
		  	<div class="pages_container1">
			   	   <c:forEach items="${recommendRelatedList}" var="var" varStatus="vs">   
			     	 <div class="service_box1" >
			     	 	 <table style="width: 100%;margin-top:0px; " border="0"  >
		 					 <tr>  
			 					 <td  rowspan="3" style="width: 60%;padding-left:15px;cursor: pointer;"
			 					  onclick="openLink('showCourse?COURSEMANAGER_ID=${var.COURSEMANAGER_ID}');" >
			 					 	<img src="<%=basePath%>${var.IMGPATH }" width="180" height="120" alt="${var.COURSETITLE }" title="${var.COURSETITLE }" />
			 					 </td>  
			 					 <td style="height:36px;padding-top:20px;">${var.COURSETITLE }<td> 
		 					 </tr> 
		 					 <tr style="padding-bottom:10px;"> 
		 					 	<td style="height:36px;">发布人：${var.LECTURERNAME }</td> 
		 					 </tr>
		 					 <tr>  
		 						 <td >
		 						   <i class="menu-icon fa fa-eye black">&nbsp;</i>${var.VIEWTIMES } &nbsp; 
		 					 	   <i class="menu-icon fa fa-comments black">&nbsp;</i>${var.MESSAGETIMES } &nbsp; 
		 					  	   <i class="menu-icon icon-thumbs-up-alt black"  style="cursor: pointer;" id="relationSupportId${vs.index}"
		 					  	    onclick="courseManagerSupport('${var.COURSEMANAGER_ID}','relationSupportId${vs.index}');">${var.SUPPORTTIMES }</i>
		 					  	  </td>  
		 					 </tr>
		 					  <tr style="padding-bottom:10px;border-bottom: 1px #ddd solid;"> 
		 					 	<td style="height:10px;" colspan="2">&nbsp;</td> 
		 					 </tr>
		 				 </table>  
			         </div>
		         </c:forEach>
		   	  </div>                 
     		</div>
     		</div>
     </div>
     
     <div style="margin: 0 auto;display: none;" id="leavedivId" >
	     <table   style="width: 100%;border-top: 1px solid #536068; ">
	     	<tr height="60">
	     		<td style="width: 55%;text-align: center;">
	     			<input type="text" id="commentId" placeholder="请输入评论" onkeydown="comment('commentId');" style="width: 90%;height:36px; left: 20px;border-radius:6px;" >
	     		</td>
	     		<td style="width: 15%;text-align: center;">
	     		 	 <i class="menu-icon icon-comments-alt black" style="font-size: 26px;"></i>
	     		 	 <sup  id="inputmessageCountId" style="background: red;color: white;border-radius: 5px;padding: 0px 3px;top: -1.2em;margin-left: -10px">0</sup>
	     		</td>
	     		<td style="width: 15%;text-align: center;cursor:pointer;" onclick="courseManagerSupport('${course.COURSEMANAGER_ID}','messageSupportNumId');">
	     			<i class="menu-icon icon-thumbs-up-alt black" style="font-size: 26px;"></i>
	     			<sup id="messageSupportNumId" style=" background: red;color: white;border-radius: 5px;padding: 0px 3px;top: -1.2em;margin-left: -10px;">${course.SUPPORTTIMES }</sup>
	     		 </td>
	     		<td style="width: 15%;text-align: center;cursor:pointer;">
	     		 	<i class="menu-icon fa fa-external-link  black" style="font-size: 26px;cursor: pointer;"
	     		 	onclick="shareLink('showCourse?COURSEMANAGER_ID=${course.COURSEMANAGER_ID}');" ></i> 
	     		 </td> 
	     	</tr>
	      
	     </table>
     </div>
      <div style="margin: 0 auto;display: none;" id="replyId" >
	     <table   style="width: 100%;border-top: 1px solid #536068; ">
	     	<tr height="64">
	     		<td style="width: 90%;text-align: center;">
	     			<input id="replayinputId" type="text" placeholder="请输入评论" style="width: 95%;height:36px;  border-radius:6px;" >
	     			<input type="hidden" id="toUserName" value="">
	     		</td>
	     		<td style="width: 10%;text-align: center;">
	     		 	<a class="btn btn-sm btn-success"  onclick="sendmessage('0');">发送</a>
	     		</td>
	     	</tr>
	     
	     </table>
     </div>
  </body>
</html>
