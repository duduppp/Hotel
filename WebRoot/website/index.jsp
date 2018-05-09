<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>远元集团</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="author" content="远元集团">
<meta name="keywords" content="郑远元,远元集团">
<meta name="description" content="郑远元,远元集团 官网">
<link href="favicon.ico" type="image/x-icon" rel="icon">
<link href="favicon.ico" type="image/x-icon" rel="shortcut icon">
<link href="<%=basePath %>static/resource/assert/css/style.css" rel="stylesheet" type="text/css" />
 
<link href="<%=basePath %>static/resource/assert/css/animate.css" rel="stylesheet" type="text/css" />
 
<link rel="stylesheet" type="text/css" href="<%=basePath %>static/resource/assert/css/jquery.vm-carousel.css">
<style type="text/css">
  .vmc-centered .vmc_active .imgtitle { transform: scale(2.83,1.2);}
  .vmc-centered .vmc_active .centerImg {top:-125px;  }

.shake {
	display: inline-block;
	cursor:pointer;
	-webkit-transform-origin: center center;
	-ms-transform-origin: center center;
	transform-origin: center center;
}

.shake:hover{

	transform: scale(1.3,1.3);
}  

</style>
<script type="text/javascript" src="<%=basePath %>static/resource/assert/js/html5.js"></script>
<script type="text/javascript" src="<%=basePath %>static/resource/assert/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=basePath %>static/resource/assert/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath %>static/resource/assert/js/common.js"></script>
<script type="text/javascript" src="<%=basePath %>static/resource/assert/js/jquery.SuperSlide.js"></script>
<script src="<%=basePath %>static/resource/assert/js/modernizr.js"></script>
 
<script> 
    
	$(document).ready(function (e) {
		var $li = $('#tab li');
		var $ul = $('#content ul');
		//新闻资讯直接加载
		getWebSiteData("newsimgid","newstitleid","newsbriefid","新闻中心","新闻中心","",2);		
		$li.mouseover(function(){
		 
			var $this = $(this);
			var $t = $this.index();
			$li.removeClass();
			$this.addClass('current');
			$ul.css('display','none');
			$ul.eq($t).css('display','block');
			//行业动态
			if($t==1){ 
				getWebSiteData("media_img_id","media_title_id","media_brief_id","行业动态","","",2);
			}
			// 店面分布 
			if($t==2){ 
				 
			}
			if($t==3){ 
				getWebSiteData("","onlineVideo","","新闻中心","聚焦媒体","",6);	   
			}
			
		});	
		
	});
	
	
	function getWebSiteData(imgid,titleid,briefid,CATALOG_NAME,SUBDIRECTORY_NAME,SUNCATALOGUE_NAME,number){
		$.ajax({
			type: "POST",
			url: '<%=basePath%>goNews.do?tm='+new Date().getTime(),
	    	data: {
	    		CATALOG_NAME:CATALOG_NAME,
				SUBDIRECTORY_NAME:SUBDIRECTORY_NAME, 
				SUNCATALOGUE_NAME:SUNCATALOGUE_NAME
	    	},
			dataType:'json',
			success: function(data){

				if(number<data.length){
					number=data.length; 
				}
			 	for(var i=0;i<number;i++){   
					 	var pagedata=data[i];
					 	if(!!pagedata){
					 	if(imgid.length>0){
					  	
					  		$("#"+imgid+(i+1)).attr("src",'<%=basePath %>'+pagedata.IMGPATH);	
					 	}
					 
					 	if(undefined!=pagedata.TITLE){
					 		var title=pagedata.TITLE; 
					 		
					 		var titleLen=30;
					 		if(briefid.length>0){
					 			titleLen=18;
					 		}
							if(title.length>=titleLen){
								title=title.substring(0,titleLen)+'……'; 
							} 	
					 	}
						var brief=pagedata.BRIEF_INTRODUCTION;
						
						if(brief.length>=42){
							brief=brief.substring(0,42)+'……';
						}
						
						if(titleid.length>0){
							$("#"+titleid+(i+1)).empty();
							$("#"+titleid+(i+1)).append(title); 
						}
						
						if(briefid.length>0){  
							 
							$("#"+briefid+(i+1)).empty();
							$("#"+briefid+(i+1)).append(brief);  
						}
					 }
				}  
			}
		}); 
	 
	}
	
	function setHomePage(obj) {
	 
        var aUrls = document.URL.split("/");
        var vDomainName = "http://" + aUrls[2] + "/";
        try {
            obj.style.behavior = "url(#default#homepage)";        
            obj.setHomePage(vDomainName);
            
        } catch (e) {
            if (window.netscape) {
                try {
                    netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
                }catch (e) {
                    alert("此操作被浏览器拒绝！\n请在浏览器地址栏输入“about:config”并回车\n然后将[signed.applets.codebase_principal_support]设置为'true'");
                } 
                var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components.interfaces.nsIPrefBranch);
                prefs.setCharPref('browser.startup.homepage', vDomainName);
            }
        }
        if (window.netscape) alert("设置首页成功！");
        return false;
    }
	
    //加入收藏函数
    function addFavorite(obj) {
        var aUrls = document.URL.split("/");
        var vDomainName = "http://" + aUrls[2] + "/";
        var description = obj.title;
        try {//IE
            window.external.AddFavorite(vDomainName, description);
        } catch (e) {//Firefox
        	 try {
        		 window.sidebar.addPanel(description, vDomainName, "");
        	 }catch (e) {
        			if (/Opera/.test(window.navigator.userAgent)) { // Opera
        				obj.rel = "sidebar";
        				obj.href = url;
        				return true;
        			}
        	 }
        }
        return false; //阻止a标签继续执行
    }
 
     function moveMenu(aid,divid,menuxialaid){
    	
    	 if(aid=="aid0"){
    		 $(".navigationlist a").css({
        		 "background":"#ffffff",
        		 "color":"#000000"
        	 });
    		 $(".menuxiala").hide();
    		 $("#showpageid").css({
        		 "background":"#f00",
        		 "color":"#ffffff"
        	 });
    		 
    	 }else{
    		 var offset=$("#"+aid).position();
        	 var divwidth= $("#"+divid).width()+30;
        	 var mwidth=offset.left;
        	 var mtop=offset.top+100;
        	 
    		 $(".navigationlist a").css({
        		 "background":"#ffffff",
        		 "color":"#000000"
        	 });
        	 
        	 $("#"+aid).css({
        		 "background":"#f00",
        		 "color":"#ffffff"
        	 });
        	 
        	 $(".menuxiala").hide();
         
        	 $("#"+menuxialaid).css({
        		 "position":"absolute",
        		 "left":mwidth,
        		  top:mtop
        		 
        	 }).show();
        		$("#"+divid).show();
    		 
    	 }
     }
     
     function outMenu(id){
    	 
    	// $(".menuxiala").hide();
     }
 
     function submoveMenu(aid,subid){
    
    	 
    	 $(".navigationlist a").css({
    		 "background":"#ffffff",
    		 "color":"#000000"
    	 });
    	 
    	 $("#"+aid).css({
    		 "background":"#f00",
    		 "color":"#ffffff"
    	 });
    	 $("#"+subid).show();  
    	
    	
     }
     
     function suboutMenu(menuxialaid){
    	 
    	  $("#"+menuxialaid).hide();  
     }
 
    /*
               打开店面分布图
    */
    function openStoreDistribution(){ 
     		
       window.location.href="<%=basePath %>website/storeDistribution.jsp"; 	 	
     		
    }
       

</script>
</head>

<body class="body_picture">

	<!--顶部 开始-->
	
		<div style="height:31px;background-color: red; color:white;" >
		<div class="mdhead">
		<div class="lhead">
		<span>
			欢迎来远元集团。客服热线：400-029-0303
			<span style="width: 350px;">&nbsp;</span>&nbsp;&nbsp;
		 </span> 
		
	</div>

		 <div class="rhead">
	<!--      <ul><li><a>关注我们</a></li><li><a>进度查询</a></li><li><a>售后工单</a></li></ul> -->
			<a href="javascript:void(0)" onclick="setHomePage(this);" style="margin-right:10px;cursor: pointer;" >设为首页</a>|	&nbsp;&nbsp;
			 
			<a href="javascript:void(0)" onclick="addFavorite(this);" style="margin-right:10px;cursor: pointer;">加入收藏</a>|	&nbsp;&nbsp;
			
			<a href="http://wpa.qq.com/msgrd?v=3&amp;uin=319147570&amp;site=qq&amp;menu=yes"  style="margin-right:10px;cursor: pointer;" >在线咨询 </a> 
		</div>
	</div>
	</div> 
	<div class="clr">
</div>

	<!--顶部 结束-->
	<!--Logo 开始-->

	<div id="logo_main">
		<div id="logo">
			<!--网站Logo 开始-->
			<div class="WebLogo">
				<a href="javascript:void(0)" target="_self">
					<img src="<%=basePath %>static/resource/images1/LOGO.png" height="58"  title="远元集团" alt="远元集团" style="top:30px;margin-top: 20px; " />
				</a>
			</div>
			<!--网站Logo 结束-->
			<!--导航条 开始-->
			<div id="navigation">
				<ul class="navigationlist">
					<li><a id="showpageid" class="headpage" href="<%=basePath %>"  onmousemove="moveMenu('aid0','xiala1','menuxiala1');" >首页</a></li>
					<li><a id="aid1" class="subpage" onmousemove="moveMenu('aid1','xiala1','menuxiala1');"  onmouseout="outMenu('xiala1');" href=""  >关于远元</a></li>
					<li><a id="aid2"  class="subpage" onmousemove="moveMenu('aid2','xiala2','menuxiala2');" onmouseout="outMenu('xiala2');" href=""  >远元产业</a></li>
					<li><a id="aid3"  class="subpage" onmousemove="moveMenu('aid3','xiala3','menuxiala3');" onmouseout="outMenu('xiala3');" href=""  >新闻中心</a></li>
					<li><a id="aid4" class="subpage"  onmousemove="moveMenu('aid4','xiala4','menuxiala4');" onmouseout="outMenu('xiala4');" href=""  >远元文化</a></li>
					<li><a id="aid5"  class="subpage" onmousemove="moveMenu('aid5','xiala5','menuxiala5');" onmouseout="outMenu('xiala5');" href="" >远元基金会</a></li>
					<li><a id="aid6"  class="subpage" onmousemove="moveMenu('aid6','xiala6','menuxiala6');" onmouseout="outMenu('xiala6');" href=""  >联系我们</a></li>
				 
				</ul>
			</div>
			<div class="menuxiala" id="menuxiala1" style="width: 790px;" onmouseout="suboutMenu('menuxiala1');">
					<span id="xiala1" style="padding-left:14px;" onmousemove="submoveMenu('aid1','menuxiala1')" >
						<a onclick="openPage('<%=basePath %>newsData.do?CATALOG_NAME=关于远元&amp;SUBDIRECTORY_NAME=集团简介&amp;SUNCATALOGUE_NAME=')">集团简介</a>&nbsp;&nbsp; &nbsp;   
						<a onclick="openPage('<%=basePath %>newsData.do?CATALOG_NAME=关于远元&amp;SUBDIRECTORY_NAME=董事长&amp;SUNCATALOGUE_NAME=')">董事长</a>&nbsp; &nbsp; &nbsp; 
						<a onclick="openPage('<%=basePath %>newsData.do?CATALOG_NAME=关于远元&amp;SUBDIRECTORY_NAME=管理团队&amp;SUNCATALOGUE_NAME=')">管理团队</a>&nbsp; &nbsp; &nbsp; 
						<a onclick="openPage('<%=basePath %>newsData.do?CATALOG_NAME=关于远元&amp;SUBDIRECTORY_NAME=组织结构&amp;SUNCATALOGUE_NAME=')">组织结构</a>&nbsp; &nbsp; &nbsp; 
						<a onclick="openPage('<%=basePath %>newsData.do?CATALOG_NAME=关于远元&amp;SUBDIRECTORY_NAME=企业大事记&amp;SUNCATALOGUE_NAME=')">企业大事记</a>&nbsp;&nbsp; &nbsp; 
						<a onclick="openPage('<%=basePath %>newsData.do?CATALOG_NAME=关于远元&amp;SUBDIRECTORY_NAME=集团荣誉&amp;SUNCATALOGUE_NAME=')">集团荣誉</a>&nbsp; &nbsp; &nbsp; 
					</span>
		     </div>
		     <div class="menuxiala" id="menuxiala2" style="width: 694px;"  onmouseout="suboutMenu('menuxiala2');">
					<span id="xiala2" style="padding-left:14px;" onmousemove="submoveMenu('aid2','menuxiala2')" >
						<a onclick="openPage('<%=basePath %>newsData.do?CATALOG_NAME=远元产业&amp;SUBDIRECTORY_NAME=生物制药&amp;SUNCATALOGUE_NAME=药厂简介')">生物制药</a>&nbsp; &nbsp; &nbsp; 
						<a onclick="openPage('<%=basePath %>newsData.do?CATALOG_NAME=远元产业&amp;SUBDIRECTORY_NAME=培训学校&amp;SUNCATALOGUE_NAME=')">培训学校</a>&nbsp;&nbsp; &nbsp; 
						<a onclick="openPage('<%=basePath %>newsData.do?CATALOG_NAME=远元产业&amp;SUBDIRECTORY_NAME=远元传媒&amp;SUNCATALOGUE_NAME=')">远元传媒</a>&nbsp;&nbsp; &nbsp; 
						<a onclick="openPage('<%=basePath %>newsData.do?CATALOG_NAME=远元产业&amp;SUBDIRECTORY_NAME=足部护理&amp;SUNCATALOGUE_NAME=')">足部护理</a>&nbsp; &nbsp; &nbsp; 
						<a onclick="openPage('<%=basePath %>newsData.do?CATALOG_NAME=远元产业&amp;SUBDIRECTORY_NAME=商学院&amp;SUNCATALOGUE_NAME=')">商学院</a>&nbsp;&nbsp; &nbsp; 
					</span>
			  </div>
			  <div class="menuxiala" id="menuxiala3" style="width: 598px;"  onmouseout="suboutMenu('menuxiala3');">
					<span id="xiala3" style="padding-left:14px;" onmousemove="submoveMenu('aid3','menuxiala3')">
					    <a onclick="openPage('<%=basePath %>newsData.do?CATALOG_NAME=新闻中心&amp;SUBDIRECTORY_NAME=新闻中心&amp;SUNCATALOGUE_NAME=')">新闻中心</a>&nbsp; &nbsp; &nbsp; 
						<a onclick="openPage('<%=basePath %>newsData.do?CATALOG_NAME=新闻中心&amp;SUBDIRECTORY_NAME=聚焦媒体&amp;SUNCATALOGUE_NAME=')">聚焦媒体</a>&nbsp; &nbsp; &nbsp; 
					</span>
			  </div>
			  <div class="menuxiala" id="menuxiala4" style="width: 502px;"  onmouseout="suboutMenu('menuxiala4');">		
				
					<span id="xiala4" style="padding-left:14px;" onmousemove="submoveMenu('aid4','menuxiala4')">
						<a onclick="openPage('<%=basePath %>newsData.do?CATALOG_NAME=远元文化&amp;SUBDIRECTORY_NAME=远元文化&amp;SUNCATALOGUE_NAME=')">远元文化</a>&nbsp; &nbsp; &nbsp; 
						<a onclick="openPage('<%=basePath %>newsData.do?CATALOG_NAME=远元文化&amp;SUBDIRECTORY_NAME=员工风采&amp;SUNCATALOGUE_NAME=')">员工风采</a>&nbsp; &nbsp; &nbsp; 
						<a onclick="openPage('<%=basePath %>newsData.do?CATALOG_NAME=远元文化&amp;SUBDIRECTORY_NAME=培训服务&amp;SUNCATALOGUE_NAME=')">培训服务</a>&nbsp; &nbsp; &nbsp; 
						<a onclick="openPage('<%=basePath %>newsData.do?CATALOG_NAME=远元文化&amp;SUBDIRECTORY_NAME=公益活动&amp;SUNCATALOGUE_NAME=')">公益活动</a>&nbsp;&nbsp; &nbsp; 
					</span>
			  </div>
			   <div class="menuxiala" id="menuxiala5" style="width: 406px;"  onmouseout="suboutMenu('menuxiala5');">		
				
					<span id="xiala5" style="padding-left:14px;" onmousemove="submoveMenu('aid5','menuxiala5')">
						<a onclick="openPage('<%=basePath %>newsData.do?CATALOG_NAME=远元基金会&amp;SUBDIRECTORY_NAME=基金会简介&amp;SUNCATALOGUE_NAME=')">基金会简介</a>&nbsp; &nbsp; &nbsp; 
						<a onclick="openPage('<%=basePath %>newsData.do?CATALOG_NAME=远元基金会&amp;SUBDIRECTORY_NAME=救助申请&amp;SUNCATALOGUE_NAME=')">救助申请</a>&nbsp; &nbsp; &nbsp; 
						<a onclick="openPage('<%=basePath %>newsData.do?CATALOG_NAME=远元基金会&amp;SUBDIRECTORY_NAME=新闻中心&amp;SUNCATALOGUE_NAME=')">新闻中心</a>&nbsp; &nbsp; &nbsp; 
					</span>
			  </div>
			  <div class="menuxiala" id="menuxiala6" style="width: 310px;" onmouseout ="suboutMenu('menuxiala6');">
					<span id="xiala6" style="padding-left:8px;" onmousemove="submoveMenu('aid6','menuxiala6')" >
					    <a onclick="openPage('<%=basePath %>newsData.do?CATALOG_NAME=联系我们&amp;SUBDIRECTORY_NAME=客户服务&amp;SUNCATALOGUE_NAME=')">客户服务</a>&nbsp; &nbsp; &nbsp; 
						<a onclick="openPage('<%=basePath %>newsData.do?CATALOG_NAME=联系我们&amp;SUBDIRECTORY_NAME=人才招聘&amp;SUNCATALOGUE_NAME=')">人才招聘</a>&nbsp; &nbsp; &nbsp; 
						<a onclick="openPage('<%=basePath %>newsData.do?CATALOG_NAME=联系我们&amp;SUBDIRECTORY_NAME=客户留言&amp;SUNCATALOGUE_NAME=')">客户留言</a>&nbsp; &nbsp; &nbsp; 
					</span>
			  </div>
			<!--导航条 结束-->
		</div>
	</div>
	 
	 
	<!--JS幻灯片 开始-->
	<div id="banner_main">
		<!--幻灯片 开始-->
		<div id="banner" >
			<ul class="bannerlist">
				<li> 
					<a href="javascript:void(0)" ><img src="<%=basePath %>static/resource/images1/y-1.jpg"  style="width:100%;height:100%;"  /></a>
				</li>
				<li>
					<a href="javascript:void(0)" ><img src="<%=basePath %>static/resource/images1/y-2.jpg"  style="width:100%;height:100%;" /></a>
				</li>
				<li>
					<a href="javascript:void(0)" ><img src="<%=basePath %>static/resource/images1/y-3.jpg"  style="width:100%;height:100%;"  /></a>
				</li>
			</ul>
			
			<div id="bgnextid"  > 
				<img alt="上一图" style="cursor: pointer;" onclick="nextimg();" width="50" height="50" src="<%=basePath %>static/resource/images1/r-left.png" 
			 >  </div>
			<div id="bgfrontid"  > 
				<img alt="下一图" style="cursor: pointer;"  onclick="frontimg();" width="50" height="50" src="<%=basePath %>static/resource/images1/r-right.png" 
				 >  
			</div>
		</div>
		<div class="hd">
			<ul></ul>
		</div>
  	 
		<!--幻灯片 结束-->
	</div>
	<script>
		if ($(".bannerlist li").length > 0) {
	 $('#banner_main').slide({
			titCell: '.hd ul',
			mainCell: '#banner ul',
			autoPlay: true,
			autoPage: true,
			delayTime: 500,
			effect: 'left',
			prevCell:'#bgnextid',
			nextCell:'#bgfrontid',
			//vis:"auto",
			trigger:"click"
		}); 
		$(window).resize(function () {
			CenterBanner();
		});
		$(document).ready(function (e) {
			CenterBanner();
		});
	} else {
		$("#banner_main").hide();
	}
	
	function CenterBanner() {
		var imgWidth = parseInt($(".bannerlist li img:first").width());
		if (imgWidth <= 0)
			return;
		var winWidth = parseInt($(window).width());
		var offset = parseInt((winWidth - imgWidth) / 2);
		//$(".bannerlist li img").css("margin-left", offset + 'px');
	} 
/* 	$("#bgnextid").click(function(){
		CenterBanner();
	});
	
	$("#bgfrontid").click(function(){
		
	}); */
	</script>
 <div style="  clear: both;height: 20px;"></div>
	<!--主体内容 开始-->
	 <div class="mainContent">    
		<div id="aboutme" style="float:left;width: 750px;height: 290px;border:1px solid #ddd;"> 
		 	<div style="float: left;"  >
			 <img alt="下一图"  onclick="frontimg();" width="278" height="290" src="<%=basePath %>static/resource/images1/y-5.jpg"> 
			 </div>
			 	<div style="float: right;width:445px;"  >
			 			<table border="0" style="width: 96%;height: 100%;margin: 10px 5px 5px 10px;" >
			 				<tr>
			 					<td style="height: 30px;"><h1 style="height:60;font-weight: bold;" >关于我们</h1> </td>
			 				</tr>
			 				<tr>
			 					<td style="height: 200px;word-wrap:break-word;word-break:break-all;line-height: 36px;font-size: 16px;cursor: pointer; " 
			 					onclick="openPage('<%=basePath %>newsData.do?CATALOG_NAME=关于远元&amp;SUBDIRECTORY_NAME=集团简介&amp;SUNCATALOGUE_NAME=')">  
			 						        &nbsp; &nbsp;陕西郑远元专业修脚保健服务集团有限公司（简称远元集团），是由陕西省工商局核准成立的全国知名连锁性集团公司，
			 						        并由国家工商行政管理总局商标局批准“郑远元”为注册商标，2014年获得陕西省著名商标。
			 						        远元集团以 ...
			 					</td>
			 					</tr>
			 					<tr>
			 					<td  style="height: 40px;"> 
			 						<div   class="btn1" onclick="openPage('<%=basePath %>newsData.do?CATALOG_NAME=关于远元&amp;SUBDIRECTORY_NAME=集团简介&amp;SUNCATALOGUE_NAME=')"  >查看详情</div> 
			 					</td>
			 				</tr>
			 			</table> 
			 	</div>
		</div>
		<div  style="float: right;width:445px;height: 290px;border:1px solid #ddd;">
	 		 <ul id="tab" >
			        <li class="current" >新闻资讯</li>
			        <li style=" margin-bottom: 0px;">行业动态</li>
			        <li style=" margin-bottom: 0px;">店面分布</li>
			      	<li style=" margin-bottom: 0px;">在线视频</li>
			    </ul>
			    <div id="content">
			        <ul style="display:block;">
		           			<table border="0" style="width:410px; margin-left : -10px; margin-top : 15px;">
		           				<tr> 
		           					<td  rowspan="2" style="width: 130px;">
		           					 <img  id="newsimgid1"  width="113px"  height="76px" src=" "> 
		           					</td>
		           					<td height="35" style="font-size: 14px;font-weight: bold;cursor: pointer;" id="newstitleid1" onclick="openPage('<%=basePath %>newsData.do?CATALOG_NAME=新闻中心&amp;SUBDIRECTORY_NAME=新闻中心&amp;SUNCATALOGUE_NAME=')">
		           						 
		           					</td>
		           				</tr>
		           				<tr>
		           					<td height="60" style="font-size: 10px;text-indent:35px;cursor: pointer;" id="newsbriefid1" onclick="openPage('<%=basePath %>newsData.do?CATALOG_NAME=新闻中心&amp;SUBDIRECTORY_NAME=新闻中心&amp;SUNCATALOGUE_NAME=')">
		           						 
		           					</td>
		           				</tr>
		           				<tr height="20" >
		           					<td colspan="2" >
		           					</td>
		           				</tr>
		           				<tr>
		           					<td  rowspan="2">
		           					   <img  id="newsimgid2"  width="113px"  height="76px" src=" "> 
		           					</td>
		           					<td height="30" style="font-size: 14px;font-weight: bold;cursor: pointer;" id="newstitleid2" onclick="openPage('<%=basePath %>newsData.do?CATALOG_NAME=新闻中心&amp;SUBDIRECTORY_NAME=新闻中心&amp;SUNCATALOGUE_NAME=')">
		           					 
		           					</td>
		           				</tr>
		           				<tr>
		           					<td height="60" style="font-size: 10px;text-indent:35px;cursor: pointer;" id="newsbriefid2" onclick="openPage('<%=basePath %>newsData.do?CATALOG_NAME=新闻中心&amp;SUBDIRECTORY_NAME=新闻中心&amp;SUNCATALOGUE_NAME=')">
		           							 
		           					</td>
		           				</tr>
		           		 </table>	
			        </ul>
			         <ul style=" margin-bottom: 0px;">
			            	<table border="0" style="width:410px; margin-left : -10px; margin-top : 15px;">
		           				<tr> 
		           					<td  rowspan="2" style="width: 130px;">
		           					 <img id="media_img_id1" alt="下一图"  width="113px"  height="76px"  src=""> 
		           					</td>
		           					<td height="30" style="font-size: 14px;font-weight: bold;cursor: pointer; " id="media_title_id1" onclick="openPage('<%=basePath %>newsData.do?CATALOG_NAME=新闻中心&amp;SUBDIRECTORY_NAME=行业动态&amp;SUNCATALOGUE_NAME=')">
		           						
		           					</td>
		           				</tr>
		           				<tr>
		           					<td height="60" style="font-size: 10px;cursor: pointer;" id="media_brief_id1" onclick="openPage('<%=basePath %>newsData.do?CATALOG_NAME=新闻中心&amp;SUBDIRECTORY_NAME=行业动态&amp;SUNCATALOGUE_NAME=')">
		           						
		           					</td>
		           				</tr>
		           				<tr height="20" >
		           					<td colspan="2">
		           					</td>
		           				</tr>
		           				<tr>
		           					<td  rowspan="2">
		           					 <img id="media_img_id2"  width="113px"  height="76px" alt="下一图" src=""> 
		           					</td>
		           					<td height="30" style="font-size: 14px;font-weight: bold;cursor: pointer;" id="medi_title_id2">
		           					
		           					</td>
		           				</tr>
		           				<tr>
		           					<td height="60" style="font-size: 10px;cursor: pointer;" id="media_brief_id2">
		           						 
		           					</td>
		           				</tr>
		           		 </table>	
			        </ul>
			        <ul style=" margin-bottom: 0px;">   
						<img alt="下一图" style="width: 300px;height:190px;" src="<%=basePath %>static/resource/images1/y-23.png">
						<div   class="btn2" onclick="openStoreDistribution();" >查看详情</div> 
			        </ul>
			         <ul  id="onlineVideo" style=" margin-bttom: 0px;"> 
			         		
			         		<table border="0" style="width:430px; margin-left : -10px; margin-top : 10px;">
			         			<tr  height="35">
			         			<td style="width: 14px;">■</td><td style="font-size: 14px;cursor: pointer;" id="onlineVideo1" onclick="openPage('<%=basePath %>newsData.do?CATALOG_NAME=新闻中心&amp;SUBDIRECTORY_NAME=聚焦媒体&amp;SUNCATALOGUE_NAME=')"> </td>
			         			</tr>
			         			<tr>
			         			<td  height="35">■&nbsp; </td><td style="font-size: 14px;cursor: pointer;"  id="onlineVideo2" onclick="openPage('<%=basePath %>newsData.do?CATALOG_NAME=新闻中心&amp;SUBDIRECTORY_NAME=聚焦媒体&amp;SUNCATALOGUE_NAME=')"></td>
			         			</tr>
			         			<tr>
			         			<td  height="35">■&nbsp; </td><td style="font-size: 14px;cursor: pointer;"   id="onlineVideo3" onclick="openPage('<%=basePath %>newsData.do?CATALOG_NAME=新闻中心&amp;SUBDIRECTORY_NAME=聚焦媒体&amp;SUNCATALOGUE_NAME=')"></td>
			         			</tr>
			         			<tr>
			         			<td height="35">■&nbsp; </td><td style="font-size: 14px;cursor: pointer;"  id="onlineVideo4" onclick="openPage('<%=basePath %>newsData.do?CATALOG_NAME=新闻中心&amp;SUBDIRECTORY_NAME=聚焦媒体&amp;SUNCATALOGUE_NAME=')"></td>
			         			</tr>
			         			<tr>
			         			<td height="35">■&nbsp; </td><td style="font-size: 14px;cursor: pointer;" id="onlineVideo5" onclick="openPage('<%=basePath %>newsData.do?CATALOG_NAME=新闻中心&amp;SUBDIRECTORY_NAME=聚焦媒体&amp;SUNCATALOGUE_NAME=')"></td>
			         			</tr>
			         			<tr>
			         			<td height="35">■&nbsp; </td><td style="font-size: 14px;cursor: pointer;"  id="onlineVideo6" onclick="openPage('<%=basePath %>newsData.do?CATALOG_NAME=新闻中心&amp;SUBDIRECTORY_NAME=聚焦媒体&amp;SUNCATALOGUE_NAME=')"></td>
			         			</tr>
			         		
			         		</table>
			          
			        </ul>
		    </div>
		</div>
	</div>
    <div style="clear: both;height:15px;"></div>
     <div  style="width: 1440px;height:180px; margin:0 auto;">
		<ul class="vmcarousel-centered-infitine vmc-centered">
			<li  >
				<a href="#"  target="_blank">
					<img class="imgtitle" src="<%=basePath %>static/resource/images1/f-1.jpg" width="250" height="180" /></a>
				   <div class="centerImg" >
          				<img  class="shake" src="<%=basePath %>static/resource/images1/img1.png" width="90" height="90">
       		 		</div>
			</li>
			<li>
				<a href="#" target="_blank"><img class="imgtitle" src="<%=basePath %>static/resource/images1/f-2.jpg" width="250" height="180" /></a>
			 		<div class="centerImg" >
          				<img class="shake" src="<%=basePath %>static/resource/images1/img2.png" width="90" height="90">
       		 		</div>
			</li>
			<li><a href="#" target="_blank"><img  class="imgtitle" src="<%=basePath %>static/resource/images1/f-3.jpg" width="250" height="180" /></a>
					<div class="centerImg" >
          				<img class="shake" src="<%=basePath %>static/resource/images1/img3.png" width="90" height="90">
       		 		</div>
			
			</li>
			<li>
				<a href="#" target="_blank"><img class="imgtitle" src="<%=basePath %>static/resource/images1/f-4.jpg" width="250" height="180" /></a>
				<div class="centerImg" >
         				<img class="shake" src="<%=basePath %>static/resource/images1/img4.png" width="90" height="90">
      		 		</div>
			</li>
			<li>
				   <a href="#" target="_blank"><img  class="imgtitle" src="<%=basePath %>static/resource/images1/f-5.jpg" width="250" height="180" /></a>
					<div class="centerImg" >
          				<img class="shake" src="<%=basePath %>static/resource/images1/img5.png" width="90" height="90">
       		 		</div>
			</li>
            <li>
            	<a href="#" target="_blank"><img class="imgtitle" src="<%=basePath %>static/resource/images1/f-6.jpg" width="250" height="180" /></a>
          		  <div class="centerImg" >
          				<img class="shake" src="<%=basePath %>static/resource/images1/img6.png" width="90" height="90">
       		 		</div>
            
            </li>
		</ul>
    </div>
    
	<div style="  clear: both;height:30px;"></div>
	<!--主体内容 结束-->
	<!--foot-->
	<div id="floor_14_main">
	 <div class="footer">
	    <div class="in">
		        <div class="nag">
		            <div class="e e_first">
		                <label>全国服务热线:<span style="font-size: 14px;">工作时间：9:00-18:00</span> </label>
		                <br/>  
		                 <span style="font-size:40px;color:red;" >400-029-0303</span>
		                 <br/>  
		                  <br/>
		            </div>
		            <div  style="  float: left;width: 280px;line-height:30px; margin-right: 50px;margin-left: 50px;border-right : 1px solid #e6e6e6;  ">
		               
		              A:西安市和平路108号佳腾大厦13层C座</a><br>
		              T:86-029-8751 2455/8751 9238<br>
		                 F:029-8752 9245
		            </div>
		           
		           <div class="code c_first">
		            	<table border="0" >
		            		<tr style="width: 116px;">
		            			<td  rowspan="3" >
		            			  <img style="float: left;margin-right: 6px;" width="90" height="90" src="<%=basePath %>static/resource/images1/guanfang.png" alt="APP下载">
		            			</td>
		            			<td>
		            			  <img style="float: left;" width="26" height="26" src="<%=basePath %>static/resource/images1/weibo-1.png" alt="APP下载">
		            			</td>
		            		</tr>
		            			<tr>
		            			<td>官远方元</td>
		            			
		            		</tr>
		            		<tr>
		            		<td>微集博团</td>
		            		</tr>
		            	</table>
		            </div>
		            <div class="code c_first">
		               <table style="text-align:right;">
		            		<tr>
		            			<td   rowspan="3">
		            			  <img style="float: left;margin-right: 6px;" width="90" height="90" src="<%=basePath %>static/resource/images1/dingyue.jpg" alt="APP下载">
		            			</td>
		            			<td>
		            			  <img style="float: left;" width="26" height="26" src="<%=basePath %>static/resource/images1/weixin-1.png" alt="APP下载">
		            			</td>
		            		</tr>
		            		<tr>
		            			<td>订远阅元</td>
		            		</tr>
		            		<tr>
		            		<td>号集   团</td>
		            		</tr>
		            		
		            	
		            	 
		            	</table>
		            </div>
		            <div class="code c_first">
		                  <table style="text-align:right;">
		            		<tr>
		            			<td  rowspan="3">
		            			  <img style="float: left;margin-right: 6px;" width="90" height="90" src="<%=basePath %>static/resource/images1/fuwu.jpg" alt="APP下载">
		            			</td>
		            			<td>
		            			  <img style="float: left;" width="26" height="26" src="<%=basePath %>static/resource/images1/weixin-1.png" alt="APP下载">
		            			</td>
		            		</tr>
		            		<tr>
		            			<td>服远务元</td>
		            		</tr>
		            		<tr>
		            		<td>号集团</td>
		            		</tr>
		            		
		            		</tr>
		            	</table>
		            </div>
		            
		            <div class="clear"></div>
		        </div>
	      </div>
	   </div>
	</div>
	<!--第五行频道 结束-->
	<!-- 友情链接 开始-->
	<!--div id="link_main"></div-->
	<!-- 友情链接 结束-->
	<!-- 底部版权 开始-->
	<div id="copyright_main">
		<div id="copyright">
			<span><a href="http://www.zhengyuanyuan.com" target="_self">远元集团</a>&nbsp;版权所有&nbsp;2014-2019&nbsp;ICP备888888888号&nbsp;</span>
		</div>
	</div>
 	 <div id="panel" style="" >
		<ul class="icons">
			<li class="up" title="上一页"></li>
			<li class="qq"></li>
			<li class="tel"></li>
			<li class="wx"></li>
			<li class="down" title="下一页"></li>
		</ul> 
		<ul class="info"> 
			<li class="qq" style="display: none;">
			<p>在线沟通，请点我<a href="http://wpa.qq.com/msgrd?v=3&amp;uin=319147570&amp;site=qq&amp;menu=yes" target="_blank">在线咨询</a></p>
			</li>
			<li class="tel" style="display: list-item;">
			<p>咨询热线：<br>400-029-0303<br>客服qq：<br>319147570</p>
			</li>
			<li class="wx" style="display: none;"> 
			<div class="img">
				<img src="<%=basePath %>static/resource/images1/guanfang.png" width="120" height="120">
			</div> 
			
			</li>
		</ul>  
	</div>
<!-- 	 <div class="index_cy"></div> -->
	 <script src="<%=basePath %>static/resource/assert/js/bootstrap.min.js"></script>
	 <script src="<%=basePath %>static/resource/assert/js/jquery.vm-carousel.js"></script>
	 <script src="<%=basePath %>static/resource/assert/js/scolltop.js"></script>

	<script type="text/javascript">
		jQuery(function($){
			  $('.vmcarousel-centered-infitine').vmcarousel({
				 centered: true,
				 start_item: 1,
				 autoplay: true,
				 infinite: true
			  });
		   });
		
	</script>
 
</body>
</html>
