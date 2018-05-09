<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="com.fh.entity.system.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
<title>商学院</title>
 <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes" />
<!-- <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />   -->
<meta content="black" name="apple-mobile-web-app-status-bar-style" />  
<meta content="telephone=no" name="format-detection" />
<link rel="stylesheet" href="<%=basePath %>static/edu/css/common.css">
<link rel="stylesheet" href="<%=basePath %>static/ace/css/font-awesome.css" />
<link href="<%=basePath %>plugins/mobileLayer/need/layer.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="static/js/jquery-1.9.1.min.js"></script>
<link rel="shortcut icon" href="<%=basePath%>view/images/favicon.ico" type="image/x-icon" />
<script type="text/javascript" src="static/js/jquery.cookie.js"></script>    
<script type="text/javascript" src="<%=basePath %>plugins/layer/layer.js"></script>
<script type="text/javascript" src="static/edu/js/touchwipe.js"></script>   
<script type="text/javascript">
	var jsessionid = "<%=session.getId()%>"; 
	var ctx='<%=basePath %>';  
	function cancelSearch(){
		$("#headSearchId").hide();
	}
</script>
<c:import url="username.jsp"></c:import>
</head>
<body>
	<div id="headSearchId" style="height: 32px;width: 100%;padding-top:3px; display: none;z-index: 999;">
	  <form class="search1"   method="get">  
		    <table style="text-align: center;width: 100%;   vertical-align: middle;" border="0">
		    	<tr style="text-align: center;">
		    		<td style="width: 1%;">&nbsp;</td>
		    		<td style="width: 88%;"> <input name="search" id="searchId" type="text" placeholder="搜索" class="text"   >  </td>
		    		<td style="width:10%;">
	 		  			 <span onclick="cancelSearch();" style="font-weight: bold;cursor: pointer;color: gray;">取消</span>
	 		  			 
		    		</td>
		    		<td style="width: 1%;">&nbsp;</td>
		    	</tr>
		    </table>
	    </form>
	   </div>
  <div id="content">
 
 <div class="mlwarp">
	<i class="mlgomr"></i>
 </div>
 <!-- header -->
	
 <div id="header">
    <div class="hewarp">
		<ul style="margin-left: -20;">
			<li class="index">
				<a href="<%=basePath %>edu" title="首页" >
				<img src="static/edu/images/shouye/m-sy.png"   alt="" tyle="margin-left: 10px;"/>
				</a>
			</li>
            	<li class="history">
				<a style="cursor: pointer; " onclick="openLink('edu/managertypes2.jsp?NAME=课程分类');"  title="课程列表">
					<img src="static/edu/images/shouye/m-kc.png" alt=""/>
			 
			  </a>  
			</li>
			
            
			<li class="narcar">
			  <a style="cursor: pointer;text-align:center; margin-top: -25px;" onclick="openLink('edu/liveTV.jsp');"  title="直 播" >
				<img src="static/edu/images/shouye/m-zb.png"   alt="" style="width:90px;height: 95px;margin-left: -8px;"/>
			 </a>
			</li>
		   <li class="classify">
			<span  >
 				<a href="javascript:void(0);" onclick="openLink('edu/gam.jsp');">
				 <img src="static/edu/images/shouye/m-rw.png" alt="" style="margin-left: 15px;">
			 </a>
			</span> 
			</li>
			   <li>
				  <a   href="javascript:void(0);" onclick="userProcess();"  title="任务">  
				  <img src="static/edu/images/shouye/m-jy.png" alt=""  style="margin-left: 15px;"/>
				 
			  </a>
			</li>
		</ul>
	</div>
  
 </div>
<div id="banner">
<div class="bgstyle banner">
   <div class="swiper-container bannerswiper">
		<div class="swiper-wrapper" id="headWapperId">
				<c:forEach items="${headCourseList}" var="var" varStatus="vs">
				 	<div class="swiper-slide">
					 	<a  href="javascript:void(0);" onclick="openLink('showCourse?COURSEMANAGER_ID=${var.COURSEMANAGER_ID}');">
					 	   <img  src="<%=basePath %>${var.IMGPATH} " style="height: 190px;" alt='1' />
					 	</a>
			        </div>   
				</c:forEach>   
		</div> 
	  <div class="pagination"></div>
    </div>
</div>
</div>

	<div id="scrolldiv">
		<ul>
		<c:forEach items="${headCourseList}" var="var" varStatus="vs">
  		   <li><a href="javascript:void(0);" txtid="${var.COURSEMANAGER_ID}" onclick="openLink('showCourse?COURSEMANAGER_ID=${var.COURSEMANAGER_ID}');">${var.COURSETITLE}</a></li>
  		   </c:forEach>
		</ul>
		<div style="float: left; right: 30px;display: block;position: absolute;line-height:30px;top:0;"  >
	 	<c:forEach items="${headCourseList}" var="var" varStatus="vs">
		  <c:if test="${vs.first}">
		    <img alt="" txt="${var.COURSEMANAGER_ID}" src="<%=basePath %>static/edu/images/shouye/gun2.png" width="6px;" height="6px" style="">
		  </c:if>
		  <c:if test="${!vs.first}">
		  	  <img alt="" txt="${var.COURSEMANAGER_ID}" src="<%=basePath %>static/edu/images/shouye/gun1.png" width="6px;" height="6px" style="">
		  </c:if>
		  
		 
		</c:forEach>
		</div>
	</div>
 
  <ul class="neir" style="width:95%; margin-left:5%;border: rgba(37, 195, 137, 0) 1px solid;overflow:hidden; min-height:135px;padding-bottom: 5px;" id="ul2">
    <li class="active">
       <div class="row" style="min-height: 140px; margin:0 auto;">
                    <!-- 所有功能 -->  
                    <a href="javascript:void(0);" onclick="openLink('edu/studyRecord.jsp');" class="item_one" style="display: block;" data-type="all">
                        <img class="gntub" src="static/edu/images/shouye/s-xijl.png">
                    </a>
                    <a href="javascript:void(0);" onclick="openLink('myFavorites');" class="item_one" style="display: block;" data-type="all" >
                        <img class="gntub" src="static/edu/images/shouye/s-wdsc.png">
                    </a>
                    <a href="javascript:void(0);" onclick="openLink('edu/RanklecturerCourse.jsp');" class="item_one" style="display:block;" data-type="all">
                        <img class="gntub" src="static/edu/images/shouye/s-phb.png">
                    </a>
                    <a href="javascript:void(0);"  onclick="openLink('edu/managertypes2.jsp?NAME=管理');"   class="item_one" style="display: block;" data-type="all">
                        <img class="gntub" src="static/edu/images/shouye/s-wwez.png">  
                       
                    </a>
                     <a href="javascript:void(0);" onclick="openLink('showArticle?COURSETITLE=集团简介');" class="item_one" style="display: block;" data-type="all">
                        <img class="gntub" src="static/edu/images/shouye/s-jtjj.png">
                         
                     </a>
                    <a href="javascript:void(0);" onclick="openLink('showArticle?COURSETITLE=企业文化');" class="item_one" style="display: block;" data-type="all">
                        <img class="gntub" src="static/edu/images/shouye/s-qywh.png">
                         
                    </a> 

                    <!--最新功能-->
                    <a href="javascript:void(0);"  onclick="openLink('edu/bigEvents.jsp');"  class="item_one" style="display: block;" data-new="new">
                        <img class="gntub" src="static/edu/images/shouye/s-zxzx.png">
                        
                    </a>
                    <a href="javascript:void(0);" onclick="goLecturerCoursePage('edu/goLecturerCoursePage');"  class="item_one" style="display: block;" data-new="new">
                        <img class="gntub" src="static/edu/images/shouye/s-jsjy.png"> 
                        
                </a>
          </div>
    </li>
 </ul>  
     <div id="title1" style="clear:both;"> 
		<span id="ftitle">专题活动 </span>
		<span id="fmore" style="cursor: pointer; " onclick="openLink('allProProfessionalList?SHOWSTATUS=6');"></span>
	</div> 
	<div style="clear:both;margin-bottom: 30px;">
		 <div class="pages_container1">
            <c:forEach items="${proProfessionalList}" var="var" varStatus="vs">                      
           	   	 <c:if test="${vs.index < 4 }">
           	   		<div style="cursor: pointer;" onclick="openLink('showCourse?COURSEMANAGER_ID=${var.COURSEMANAGER_ID}');">
           	   			<img width="100%" height="170" src="${var.IMGPATH }" alt="${var.COURSETITLE }" title="${var.COURSETITLE }"  />
           	   		</div> 
            		<div class="spbtn radius6">专题</div>
            		<div class="spdate">
            		    <fmt:formatDate value="${var.RELEASETIME}" pattern="yyyy-MM-dd  HH:mm:ss"   />	
            		</div> 
            	 </c:if>
            </c:forEach>
		</div> 
 </div>       
 <div id="title1">
		<span id="ftitle"> 最新课程</span>
		<span id="fmore" style="cursor: pointer; " onclick="openLink('edu/courseList.jsp');"></span>
</div>                  
<!-- 栏目 -->
<div style="clear:both;margin-bottom: 30px;">
		 <div class="pages_container1">
            <c:forEach items="${headCourseList}" var="var" varStatus="vs">                      
           	   	 <c:if test="${vs.index < 4 }">
           	   		<div style="cursor: pointer;" onclick="openLink('showCourse?COURSEMANAGER_ID=${var.COURSEMANAGER_ID}');">
           	   			<img width="100%" height="170" src="${var.IMGPATH }" alt="${var.COURSETITLE }" title="${var.COURSETITLE }"  />
           	   		</div> 
            	 </c:if>
            </c:forEach>
		</div> 
 </div>       
<!-- 栏目 END -->
 <div id="title1">
		<span id="ftitle"> 热门讲师</span>
		<span id="fmore" style="cursor: pointer; " onclick="openLink('allLecturer');"></span>
 </div>  

<div style="clear:both;margin-bottom: 30px;">
		 <div class="pages_container1">
            <c:forEach items="${teacherList}" var="var" varStatus="vs">                      
           	   	 <c:if test="${vs.index < 4 }">
           	   		<div style="cursor: pointer;" onclick="openLink('./edu/lecturerCourse.jsp?LECTURERNAME=${var.LECTURERNAME}');">
           	   			<img width="100%" height="170" src="${var.PICTURE1 }" alt="${var.PERSONALHONOR }" title="${var.LECTURERNAME }"  />
           	   		</div> 
            	 </c:if>
            </c:forEach>
		</div> 
 </div>   
	 <div id="title1" style="clear:both;">
		<span id="ftitle">精品推荐</span> 
		<span id="fmore" style="cursor: pointer; " onclick="openLink('allBoutiqueList');"></span>
	</div> 
	<div style="height: 400px;">
	   	<div class="pages_container1">
	   	   <c:forEach items="${newCourselList}" var="var" varStatus="vs">   
	     	 <c:if test="${vs.index < 4 }">
	     	 <div class="service_box1" style="cursor: pointer;" onclick="openLink('showCourse?COURSEMANAGER_ID=${var.COURSEMANAGER_ID}');" >
	            <table style="width: 100%;margin-top:0px; table-layout: fixed; "  >
 					 <tr  >  
 					 	<td style="border-bottom: 1px #ddd solid;width: 100%;padding-left:0px;" >
 					 		<img src="<%=basePath%>${var.IMGPATH }" width="100%" height="235" alt="发布人：${var.LECTURERNAME }" title="" />
 					 		</td> 
 					  
 					 </tr> 
 					 
 					 <tr height="20px;">  
 					 <td style="padding-top:0px;border-bottom: 1px #ddd solid;padding-left: 15px;">
		 					 <i class="menu-icon fa fa-eye black">&nbsp;</i>${var.VIEWTIMES } &nbsp; 
		 					 <i class="menu-icon fa fa-comments black">&nbsp;</i>${var.MESSAGETIMES } &nbsp; 
		 					 <i class="menu-icon icon-thumbs-up-alt black">&nbsp;</i>${var.SUPPORTTIMES }
		 					 </td> 
 					 </tr> 
 				</table>  
	         </div>
	         </c:if>
         </c:forEach>
    </div> 
    </div>
     <div id="title1" style="clear:both;">
		<span id="ftitle">大家来分享</span>
		<span id="fmore" style="cursor: pointer; " onclick="openLink('allShareList');"></span>
	</div>  
	<div style="height: 400px;">
	   	<div class="pages_container1">
	   	   <c:forEach items="${shareCourseList}" var="var" varStatus="vs">   
	     	 <c:if test="${vs.index < 2 }">
		     	 <div class="service_box1" style="cursor: pointer;" onclick="openLink('showCourse?COURSEMANAGER_ID=${var.COURSEMANAGER_ID}');">
		        	 <table style="width: 100%;margin-top:0px;"  >
	 				    <tr>  
	 					 <td  rowspan="3" style="border-bottom: 1px #ddd solid;width: 60%;padding-left:15px;"  >
	 					 	<a href="javascript:void(0);" onclick="openLink('showCourse?COURSEMANAGER_ID=${var.COURSEMANAGER_ID}');">
	 					 		<img src="<%=basePath%>${var.IMGPATH }" width="180" height="120" alt="" title="" />
	 					 	</a>
	 					 </td> 
	 					 <td style="height:36px;padding-top:20px;">${var.COURSETITLE }<td> 
	 				   </tr> 
	 				   <tr> 
	 					 <td style="height:36px;">发布人：${var.LECTURERNAME }</td> 
	 				   </tr>
	 				   <tr>   
	 					 	<td style="padding-top:10px;border-bottom: 1px #ddd solid;"><i class="menu-icon fa fa-eye black">&nbsp;</i>${var.VIEWTIMES } &nbsp; 
	 					 	<i class="menu-icon fa fa-comments black">&nbsp;</i>${var.MESSAGETIMES } &nbsp; 
	 					 	<i class="menu-icon icon-thumbs-up-alt black">&nbsp;</i>${var.SUPPORTTIMES }</p><br/>&nbsp;</td> 
	 				   </tr> 
	 				</table>  
		        </div>
	        </c:if>
         </c:forEach>
      </div>                           
   </div> 
	<div class="mxy-footer" style="font-family: 华文行楷;font-size: 28px;">
		  让全天下人的脚健康美丽<br/>
		  	      远元梦！
	</div>
  </div>
<!-- 右边隐藏的内容 -->
 
<!-- 右边隐藏的内容 END -->
<script src="<%=basePath %>static/edu/js/RefreshCarCount.js" type="text/javascript"></script>


<script src="<%=basePath %>static/edu/js/idangerous.swiper-2.1.min.js" type="text/javascript"></script>

  <script src="<%=basePath %>/edu/index.js" type="text/javascript"></script>
  <script src="<%=basePath %>static/edu/js/idangerous.swiper-2.1.min.js" type="text/javascript"></script>
  <script type="text/javascript">
  $('#content').touchwipe({
	　　wipeLeft:function(){  
		 userProcess();
	}, 
	　　wipeRight:function(){
		　openLink('edu/managertypes2.jsp?NAME=课程分类');
		
	},
		//向上查询
	　　wipeUp:function(){
	 
	},
	wipe:function(){
		$("#headSearchId").hide();
	},
	// 向下刷新
	　　wipeDown:function(){
		$("#headSearchId").show();
		$("#searchId").focus();
	　 
	},
	　　preventDefaultEvents:true
	});
  
  </script>
  
</body>
</html>