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
<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
<title>商学院</title>
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />  
<meta content="yes" name="apple-mobile-web-app-capable" />  
<meta content="black" name="apple-mobile-web-app-status-bar-style" />  
<meta content="telephone=no" name="format-detection" />
<link rel="stylesheet" href="<%=basePath %>static/edu/css/common.css">
<link rel="stylesheet" href="<%=basePath %>static/ace/css/font-awesome.css" />
<link href="<%=basePath %>plugins/mobileLayer/need/layer.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="static/js/jquery-1.9.1.min.js"></script>
<link rel="shortcut icon" href="<%=basePath%>view/images/favicon.ico" type="image/x-icon" />
<script type="text/javascript" src="static/js/jquery.cookie.js"></script>    
<script type="text/javascript" src="<%=basePath %>plugins/layer/layer.js"></script>
</head>
<body>

<!--  <div id="search" class="clearfix"> -->
<!-- 		    <form class="search " action="/site/list" method="get"> -->
<!-- 		        <input name="search" type="text" placeholder="输入搜索" class="text"> -->
<!-- 		        <input type="submit" value="search" class="submit"> -->
<!-- 		    </form> -->
<!--  </div> -->
 
 <div class="mlwarp">
	<i class="mlgomr"></i>
 </div>
 <!-- header -->
	
 <div id="header">
  
    <div class="hewarp">
		<ul>
			<li class="index">
				<a href="<%=basePath %>edu" title="首页" >
				<img src="static/edu/images/comui_tab_home.png" alt=""/>
				 首 页
				</a>
			</li>
            
            	<li class="history">
			<a style="cursor: pointer; " onclick="openLink('edu/courseList.jsp');"  title="课程列表">
				<img src="static/edu/images/comui_tab_person.png" alt=""/>
				课 程
			  </a>
			</li>
			
            
			<li class="narcar">
			  <a style="cursor: pointer; " onclick="openLink('edu/liveTV.jsp');"  title="我的购物车" >
				<img src="static/edu/images/comui_tab_post.png"   alt=""/>
			直 播
			 </a>
			</li>
		   <li class="classify">
			<span>
 			<a href="javascript:void(0);" >
				<img src="static/edu/images/comui_tab_pond.png" alt="">
				社 区</a>
			</span> 
			</li>
			   <li>
				  <a   href="javascript:void(0);" onclick="userProcess();"  title="任务">  
				  <img src="static/edu/images/comui_tab_person.png" alt=""/>
				     用 户
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
					 	   <img  src="<%=basePath %>${var.IMGPATH} " style="height: 160px;" alt='1' />
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
  		   <li><a href="${var.COURSEURL }">${var.COURSETITLE}</a></li>
  		   </c:forEach>
		</ul>
		<span class="newsmore">
		 	<a href="javascript:void(0);" onclick="clickMore();">更多新闻</a>
		</span>
	</div>
 
  <ul class="neir" style="width:95%; margin-left:5%;border: rgba(37, 195, 137, 0) 1px solid;overflow:hidden; min-height:135px;padding-bottom: 5px;" id="ul2">
    <li class="active">
       <div class="row" style="min-height: 130px; margin:0 auto;">
                    <!-- 所有功能 -->  
                    <a href="javascript:void(0);" onclick="openLink('edu/studyRecord.jsp');" class="item_one" style="display: block;" data-type="all">
                        <img class="gntub" src="static/edu/images/shouye/1.png">
                        <div class="tet2">  
                            <span>学习记录</span>
                        </div>
                    </a>
                    <a href="javascript:void(0);" onclick="openLink('myFavorites');" class="item_one" style="display: block;" data-type="all" >
                        <img class="gntub" src="static/edu/images/shouye/2.png">
                        <div class="tet2">
                            <span>我的收藏</span>
                        </div>
                    </a>
                    <a href="javascript:void(0);" onclick="openLink('edu/rankingList.jsp');" class="item_one" style="display:block;" data-type="all">
                    
                        <img class="gntub" src="static/edu/images/shouye/3.png">
                        <div class="tet2">
                            <span style="letter-spacing: 4px;">排行榜</span> 
                        </div>
                    </a>
                    <a href="javascript:void(0);"    class="item_one" style="display: block;" data-type="all">
                        <img class="gntub" src="static/edu/images/shouye/4.png">
                        <div class="tet2">
                            <span>考试任务</span>
                        </div>
                    </a>
                     <a href="javascript:void(0);" onclick="openLink('showArticle?COURSETITLE=集团简介');" class="item_one" style="display: block;" data-type="all">
                        <img class="gntub" src="static/edu/images/shouye/5.png">
                        <div class="tet2">
                            <span>集团简介</span>
                        </div>
                     </a>
                    <a href="javascript:void(0);" onclick="openLink('showArticle?COURSETITLE=企业文化');" class="item_one" style="display: block;" data-type="all">
                        <img class="gntub" src="static/edu/images/shouye/6.png">
                        <div class="tet2">
                            <span>企业文化</span>
                        </div>
                    </a>

                    <!--最新功能-->
                    <a href="javascript:void(0);" class="item_one" style="display: block;" data-new="new">
                        <img class="gntub" src="static/edu/images/shouye/7.png">
                        <div class="tet2">
                            <span>&nbsp;最新资讯</span>
                        </div>
                    </a>
                    <a href="javascript:void(0);"  class="item_one" style="display: block;" data-new="new">
                        <img class="gntub" src="static/edu/images/shouye/8.png">
                        <div class="tet2">
                            <span>更多分类</span>
                        </div>
                </a>
          </div>
    </li>
 </ul>         
 <div id="title1">
		<span id="ftitle"> 最新课程</span>
		<span id="fmore" style="cursor: pointer; " onclick="openLink('edu/courseList.jsp');"></span>
</div>                  
<!-- 栏目 -->
<div class="bgstyle indexsub">
	 <ul>
    	 <c:forEach items="${headCourseList}" var="var" varStatus="vs">
    	   <c:if test="${vs.index < 4 }"> 
			   <li class="s${vs.index+1} bg1">
					<a  href="javascript:void(0);" onclick="openLink('showCourse?COURSEMANAGER_ID=${var.COURSEMANAGER_ID}');">
						<div class="subtype"  style="background-image: url('<%=basePath%>${var.IMGPATH }') ;background-size:100% 100%; ">
					<%--  	<em>${var.COURSETITLE} </em>
							<span>${var.COURSEINTRODUCTION}</span>
							<s></s>   --%>
						</div>
					</a>
					<div style="height:20px;font-size: 14px;padding-left: 15px;cursor: pointer;" 
					onclick="openLink('showCourse?COURSEMANAGER_ID=${var.COURSEMANAGER_ID}');">
						${var.COURSETITLE}  
					</div>
					<div style="height:20px;font-size: 12px;padding-left: 15px;color: gray;">
						${var.ARTICLETYPE}
					</div>
				</li>
			 </c:if>
		 </c:forEach>  
	 </ul>
</div>
<!-- 栏目 END -->
 

 
 <div id="title1">
		<span id="ftitle"> 热门讲师</span>
		<span id="fmore" style="cursor: pointer; " onclick="openLink('allLecturer');"></span>
</div>  
   <div class="pages_container1">
   	 <c:forEach items="${teacherList}" var="var" varStatus="vs">
   	   <c:if test="${vs.index < 5 }">
          <table style="width: 100%;margin-top:5px;"  >
			 <tr  >  
				 <td  rowspan="2" style="border-bottom: 1px #ddd solid;width: 40%;padding-left:15px;cursor: pointer;" onclick="openlick('');" >
				 	<img src="<%=basePath%>${var.PICTURE1 }" width="130" height="150" alt="${var.PERSONALHONOR }" title="${var.PERSONALHONOR }" />
				 </td> 
				 <td style="height:36px;font-size: 14px;">
				 	${var.PERSONALHONOR }   
				 </td>
			 </tr> 
			 <tr> 
				 <td style="height:70px;border-bottom: 1px #ddd solid;">
				    ${var.INTRODUCTION}
				 </td> 
			 </tr>
 		 </table>  
 		</c:if>		 
        </c:forEach>
    </div>   
                                     
    <div id="title1" style="clear:both;"> 
		<span id="ftitle">专题活动 </span>
		<span id="fmore" style="cursor: pointer; " onclick="openLink('allProProfessionalList');"></span>
	</div> 
	<div style="clear:both;margin-bottom: 30px;">
		 <div class="pages_container1">
            <c:forEach items="${proProfessionalList}" var="var" varStatus="vs">                      
           	   	 <c:if test="${vs.index < 4 }">
           	   		<div style="cursor: pointer;" onclick="openLink('showCourse?COURSEMANAGER_ID=${var.COURSEMANAGER_ID}');">
           	   			<img width="100%" height="150" src="${var.IMGPATH }" alt="${var.COURSETITLE }" title="${var.COURSETITLE }"  />
           	   		</div> 
            		<div class="spbtn radius6">专题</div>
            		<div class="spdate">
            		    <fmt:formatDate value="${var.RELEASETIME}" pattern="yyyy-MM-dd  HH:mm:ss"   />	
            		</div> 
            	 </c:if>
            </c:forEach>
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
	            <table style="width: 100%;margin-top:0px;"  >
 					 <tr  >  
 					 <td  rowspan="3" style="border-bottom: 1px #ddd solid;width: 60%;padding-left:15px;" >
 					 	<img src="<%=basePath%>${var.IMGPATH }" width="180" height="120" alt="" title="" /></td> 
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
     <div id="title1">
		<span id="ftitle">大家来分享</span>
		<span id="fmore" style="cursor: pointer; " onclick="openLink('allShareList');"></span>
	</div>  
	<div style="height: 400px;">
	   	<div class="pages_container1">
	   	   <c:forEach items="${newCourselList}" var="var" varStatus="vs">   
	     	 <c:if test="${vs.index < 4 }">
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
	<div class="mxy-footer">
		  每个企业都是一所大学！
	</div>
 
  
<!-- 右边隐藏的内容 -->
 
<!-- 右边隐藏的内容 END -->
<script src="<%=basePath %>static/edu/js/RefreshCarCount.js" type="text/javascript"></script>


<script src="<%=basePath %>static/edu/js/idangerous.swiper-2.1.min.js" type="text/javascript"></script>
  <script type="text/javascript">
 	 var userName='${sessionScope.sessionUser.USERNAME}';
  </script>
  <script src="<%=basePath %>/edu/index.js" type="text/javascript"></script>
  <script src="<%=basePath %>static/edu/js/idangerous.swiper-2.1.min.js" type="text/javascript"></script>
</body>
</html>