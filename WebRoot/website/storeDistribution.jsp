<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>店面分布</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="author" content="远元集团">
<meta name="keywords" content="郑远元,远元集团">
<meta name="description" content="郑远元,远元集团 官网">
<link href="favicon.ico" type="image/x-icon" rel="icon">
<link href="favicon.ico" type="image/x-icon" rel="shortcut icon">
<script type="text/javascript" src="<%=basePath %>static/resource/assert/js/html5.js"></script>
<link href="<%=basePath %>static/resource/assert/css/style.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath %>static/resource/assert/css/subpage.css" rel="stylesheet" type="text/css" />
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
	pre{margin-top:10px; padding:6px; background:#f7f7f7}
	select{background-color: #fff; background-position: right center; background-repeat: no-repeat; border: 1px solid #888; 
	border-radius: 3px; box-sizing: border-box; font: 12px/1.5 Tahoma,Arial,sans-serif; height: 30px; padding: 0 4px;}
	.per{border-bottom: 1px dotted #ddd; padding: 20px 0}
	.per h3{margin-bottom: 6px; font-size: 14px}
	.per p{margin: 3px 0}
	</style>

 <script type="text/javascript">
 	var weburl="<%=basePath %>";      
 </script>
<script type="text/javascript" src="<%=basePath %>static/resource/assert/js/html5.js"></script>
<!-- <script type="text/javascript" src="<%=basePath %>static/resource/assert/js/jquery-1.7.2.min.js"></script> -->
 <script type="text/javascript" src="<%=basePath %>static/resource/assert/js/jquery.min.js"></script>  
<script type="text/javascript" src="<%=basePath %>static/resource/assert/js/common.js"></script>
<script type="text/javascript" src="<%=basePath %>static/resource/assert/js/jquery.SuperSlide.js"></script>
<script src="<%=basePath %>static/resource/assert/js/modernizr.js"></script>

<script type="text/javascript" src="<%=basePath %>static/resource/assert/js/jquery.cityselect.js"></script>
 
   
 
<script>

	var CATALOG_NAME='${yyNews.CATALOG_NAME}';
	var  SUBDIRECTORY_NAME='${yyNews.SUBDIRECTORY_NAME }';
	//孙子目录
	var  SUNCATALOGUE_NAME='${yyNews.SUNCATALOGUE_NAME }';
	$(document).ready(function () {
	
		 $("#city_4").citySelect({
			 nodata: "none", 
			 required: false, 
             prov: "",
             city: "",
             dist: "",
         });

		var str='${NavigatList}';
	//	var NavigatList = $.parseJSON(str); 
		if(str.length>0){
			
		
		var NavigatList =JSON.parse(str); 
		var url='';
		var nagdivStr="";
	 
		nagdivStr="<span style='color:#f00;font-size:16px;'>"+CATALOG_NAME+"><a style='cursor:pointer;' onclick=\"";
		nagdivStr+="openPage('"+weburl+"newsData.do?CATALOG_NAME="+
					CATALOG_NAME+"&SUBDIRECTORY_NAME="+SUBDIRECTORY_NAME+"&SUNCATALOGUE_NAME="+SUNCATALOGUE_NAME+"')\" >"+SUBDIRECTORY_NAME+"</a> ";
		
		 if(SUNCATALOGUE_NAME!=''){
			 nagdivStr+=" <a style='cursor:pointer;' onclick=\"openPage('"+weburl+"newsData.do?CATALOG_NAME="+
				CATALOG_NAME+"&SUBDIRECTORY_NAME="+SUBDIRECTORY_NAME+"&SUNCATALOGUE_NAME="+SUNCATALOGUE_NAME+"')\" > >"+SUNCATALOGUE_NAME+"</a> ";
		 }
		 nagdivStr+="</span>";
		$("#nagdivID").append(nagdivStr); 
		for(var i in NavigatList){
			
			if(SUNCATALOGUE_NAME==''){
				if(NavigatList[i].NAME==SUBDIRECTORY_NAME){
					 url+='<a style="color:white;background-color: white;background-color: #f00;" ';
				}else{
					 url+='<a ';
				}
				
				if(NavigatList[i].NAME==""){
					 url+=' href="javascript:void(0);">'+NavigatList[i].NAME+'</a>';
				}else{
					  url+='onclick="openPage(\''+weburl+'newsData.do?CATALOG_NAME='+CATALOG_NAME+'&SUBDIRECTORY_NAME='+NavigatList[i].NAME+'&SUNCATALOGUE_NAME='+SUNCATALOGUE_NAME+'\')">'+NavigatList[i].NAME+'</a>';
				}
			}else{
				
				if(NavigatList[i].NAME==SUNCATALOGUE_NAME){
					 url+='<a style="color:white;background-color: white;background-color: #f00;" ';
				}else{
					 url+='<a ';
				}
				
				if(NavigatList[i].NAME==""){
					 url+=' href="javascript:void(0);">'+NavigatList[i].NAME+'</a>';
				}else{
					  url+='onclick="openPage(\''+weburl+'newsData.do?CATALOG_NAME='+CATALOG_NAME+'&SUBDIRECTORY_NAME='+SUBDIRECTORY_NAME+'&SUNCATALOGUE_NAME='+NavigatList[i].NAME+'\')">'+NavigatList[i].NAME+'</a>';
				}
			}
		  } 
		}
		
		$("#rightMenua").append(url); 
		var $li = $('#tab li');
		var $ul = $('#content ul');
		$li.mouseover(function(){
			var $this = $(this);
			var $t = $this.index();
			$li.removeClass();
			$this.addClass('current');
			$ul.css('display','none');
			$ul.eq($t).css('display','block');
		});	
	});
	
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
 
     
     function showStoreData(provinceName){
    	
		 $("#city_4").citySelect({
			 nodata: "none", 
             prov: provinceName
         });      
     }
     function showStorePage(){
    	 
    	var PROVINCE_NAME= $("#city_4 .prov").val();
    	var CITY_NAME= $("#city_4 .city").val();
    	var DIST_NAME= $("#city_4 .dist").val(); 
    	 
    	$.ajax({
			type: "POST",
			url:weburl+ 'storelist.do?tm='+new Date().getTime(),
	    	data: {
	    		PROVINCE_NAME:PROVINCE_NAME,
	    		CITY_NAME:CITY_NAME, 
	    		DIST_NAME:DIST_NAME
	    	},
			dataType:'json',
			success: function(obj){
				 $(".knrTable tr:gt(1)").remove(); 
				var storeData="";
				for ( var i in obj) {
					var data=obj[i];
					var CITY_NAME=data["CITY_NAME"];
					var DIST_NAME=data["DIST_NAME"];
					var NAME	=data["NAME"];
					var PROVINCE_NAME=data["PROVINCE_NAME"];
					var STORE_NAME=data["STORE_NAME"];
					var TEL=data["TEL"];
				
					storeData+=" <tr> <td> <strong><a>"+STORE_NAME+"</a></strong></td>";
					storeData+=" <td>"+TEL+"</td>";   
					storeData+=" <td></td></tr>"; 
					
				}
				$(".knrTable").append(storeData); 
			 	 
			}
    	});
    	 
    	 
     }
     

</script>
</head>

<body >

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
			
			<a href="http://wpa.qq.com/msgrd?v=3&amp;uin=1271876110&amp;site=qq&amp;menu=yes"  style="margin-right:10px;cursor: pointer;" >在线咨询 </a> 
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
					<img src="<%=basePath %>static/resource/images1/LOGO.png" height="58"  title="某某公司" alt="某某公司" style="top:30px;margin-top: 20px;" />
				</a>
			</div>
			<!--网站Logo 结束-->
			<!--导航条 开始-->
			<div id="navigation">
				<ul class="navigationlist">
					<li><a id="showpageid" class="headpage" href="<%=basePath %>"  onmousemove="moveMenu('aid0','xiala1','menuxiala1');" >首页</a></li>
					<li><a id="aid1" class="subpage" onmousemove="moveMenu('aid1','xiala1','menuxiala1');"  href=""  >关于远元</a></li>
					<li><a id="aid2"  class="subpage" onmousemove="moveMenu('aid2','xiala2','menuxiala2');"   href=""  >远元产业</a></li>
					<li><a id="aid3"  class="subpage" onmousemove="moveMenu('aid3','xiala3','menuxiala3');"   href=""  >新闻中心</a></li>
					<li><a id="aid4" class="subpage"  onmousemove="moveMenu('aid4','xiala4','menuxiala4');"  href=""  >远元文化</a></li>
					<li><a id="aid5"  class="subpage" onmousemove="moveMenu('aid5','xiala5','menuxiala5');"  href="" >远元基金会</a></li>
					<li><a id="aid6"  class="subpage" onmousemove="moveMenu('aid6','xiala6','menuxiala6');"   href=""  >联系我们</a></li>
				</ul>
			</div>
			<div class="menuxiala" id="menuxiala1" style="width: 760px;" onmouseout="suboutMenu('menuxiala1');">
					<span id="xiala1" style="padding-left:14px;" onmousemove="submoveMenu('aid1','menuxiala1')" >
						<a onclick="openPage('<%=basePath %>newsData.do?CATALOG_NAME=关于远元&amp;SUBDIRECTORY_NAME=集团简介&amp;SUNCATALOGUE_NAME=')">集团简介</a>&nbsp;&nbsp; &nbsp;   
						<a onclick="openPage('<%=basePath %>newsData.do?CATALOG_NAME=关于远元&amp;SUBDIRECTORY_NAME=董事长&amp;SUNCATALOGUE_NAME=')">董事长</a>&nbsp; &nbsp; &nbsp; 
						<a onclick="openPage('<%=basePath %>newsData.do?CATALOG_NAME=关于远元&amp;SUBDIRECTORY_NAME=管理团队&amp;SUNCATALOGUE_NAME=')">管理团队</a>&nbsp; &nbsp; &nbsp; 
						<a onclick="openPage('<%=basePath %>newsData.do?CATALOG_NAME=关于远元&amp;SUBDIRECTORY_NAME=组织结构&amp;SUNCATALOGUE_NAME=')">组织结构</a>&nbsp; &nbsp; &nbsp; 
						<a onclick="openPage('<%=basePath %>newsData.do?CATALOG_NAME=关于远元&amp;SUBDIRECTORY_NAME=企业大事记&amp;SUNCATALOGUE_NAME=')">企业大事记</a>&nbsp;&nbsp; &nbsp; 
						<a onclick="openPage('<%=basePath %>newsData.do?CATALOG_NAME=关于远元&amp;SUBDIRECTORY_NAME=集团荣誉&amp;SUNCATALOGUE_NAME=')">集团荣誉</a>&nbsp; &nbsp; &nbsp; 
					</span>
		     </div>
		     <div class="menuxiala" id="menuxiala2" style="width: 664px;"  onmouseout="suboutMenu('menuxiala2');">
					<span id="xiala2" style="padding-left:14px;" onmousemove="submoveMenu('aid2','menuxiala2')" >
						<a onclick="openPage('<%=basePath %>newsData.do?CATALOG_NAME=远元产业&amp;SUBDIRECTORY_NAME=生物制药&amp;SUNCATALOGUE_NAME=药厂简介')">生物制药</a>&nbsp; &nbsp; &nbsp; 
						<a onclick="openPage('<%=basePath %>newsData.do?CATALOG_NAME=远元产业&amp;SUBDIRECTORY_NAME=培训学校&amp;SUNCATALOGUE_NAME=')">培训学校</a>&nbsp;&nbsp; &nbsp; 
						<a onclick="openPage('<%=basePath %>newsData.do?CATALOG_NAME=远元产业&amp;SUBDIRECTORY_NAME=远元传媒&amp;SUNCATALOGUE_NAME=')">远元传媒</a>&nbsp;&nbsp; &nbsp; 
						<a onclick="openPage('<%=basePath %>newsData.do?CATALOG_NAME=远元产业&amp;SUBDIRECTORY_NAME=足部护理&amp;SUNCATALOGUE_NAME=')">足部护理</a>&nbsp; &nbsp; &nbsp; 
						<a onclick="openPage('<%=basePath %>newsData.do?CATALOG_NAME=远元产业&amp;SUBDIRECTORY_NAME=商学院&amp;SUNCATALOGUE_NAME=')">商学院</a>&nbsp;&nbsp; &nbsp; 
						
					</span>
			  </div>
			  <div class="menuxiala" id="menuxiala3" style="width: 568px;"  onmouseout="suboutMenu('menuxiala3');">
					<span id="xiala3" style="padding-left:14px;" onmousemove="submoveMenu('aid3','menuxiala3')">
					    <a onclick="openPage('<%=basePath %>newsData.do?CATALOG_NAME=新闻中心&amp;SUBDIRECTORY_NAME=新闻中心&amp;SUNCATALOGUE_NAME=')">新闻中心</a>&nbsp; &nbsp; &nbsp; 
						<a onclick="openPage('<%=basePath %>newsData.do?CATALOG_NAME=新闻中心&amp;SUBDIRECTORY_NAME=聚焦媒体&amp;SUNCATALOGUE_NAME=')">聚焦媒体</a>&nbsp; &nbsp; &nbsp; 
					</span>
			  </div>
			  <div class="menuxiala" id="menuxiala4" style="width: 472px;"  onmouseout="suboutMenu('menuxiala4');">		
				
					<span id="xiala4" style="padding-left:14px;" onmousemove="submoveMenu('aid4','menuxiala4')">
						<a onclick="openPage('<%=basePath %>newsData.do?CATALOG_NAME=远元文化&amp;SUBDIRECTORY_NAME=远元文化&amp;SUNCATALOGUE_NAME=')">远元文化</a>&nbsp; &nbsp; &nbsp; 
						<a onclick="openPage('<%=basePath %>newsData.do?CATALOG_NAME=远元文化&amp;SUBDIRECTORY_NAME=员工风采&amp;SUNCATALOGUE_NAME=')">员工风采</a>&nbsp; &nbsp; &nbsp; 
						<a onclick="openPage('<%=basePath %>newsData.do?CATALOG_NAME=远元文化&amp;SUBDIRECTORY_NAME=培训服务&amp;SUNCATALOGUE_NAME=')">培训服务</a>&nbsp; &nbsp; &nbsp; 
						<a onclick="openPage('<%=basePath %>newsData.do?CATALOG_NAME=远元文化&amp;SUBDIRECTORY_NAME=公益活动&amp;SUNCATALOGUE_NAME=')">公益活动</a>&nbsp;&nbsp; &nbsp; 
					</span>
			  </div>
			   <div class="menuxiala" id="menuxiala5" style="width: 376px;"  onmouseout="suboutMenu('menuxiala5');">		
				
					<span id="xiala5" style="padding-left:14px;" onmousemove="submoveMenu('aid5','menuxiala5')">
						<a onclick="openPage('<%=basePath %>newsData.do?CATALOG_NAME=远元基金会&amp;SUBDIRECTORY_NAME=基金会简介&amp;SUNCATALOGUE_NAME=')">基金会简介</a>&nbsp; &nbsp; &nbsp; 
						<a onclick="openPage('<%=basePath %>newsData.do?CATALOG_NAME=远元基金会&amp;SUBDIRECTORY_NAME=救助申请&amp;SUNCATALOGUE_NAME=')">救助申请</a>&nbsp; &nbsp; &nbsp; 
						<a onclick="openPage('<%=basePath %>newsData.do?CATALOG_NAME=远元基金会&amp;SUBDIRECTORY_NAME=新闻中心&amp;SUNCATALOGUE_NAME=')">新闻中心</a>&nbsp; &nbsp; &nbsp; 
					</span>
			  </div>
			  <div class="menuxiala" id="menuxiala6" style="width: 280px;" onmouseout ="suboutMenu('menuxiala6');">
					<span id="xiala6" style="padding-left:5px;" onmousemove="submoveMenu('aid6','menuxiala6')" >
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
		   <a href="javascript:void(0);" ><img src="<%=basePath %>static/resource/images1/aboutyy.jpg" width="100%"  /></a>
		<!--幻灯片 结束-->
	</div> 
	   <div class="banner_guide">
			<div id="nagdivID" style="width:1200px;margin:0 auto;    height:40px; line-height:40px;  ">
						
			</div>
			
			<div style="clear: both;height:1px;"></div>
	 
			<div style="margin: 0 auto; width: 1200px;"> 
			
			<div id="dnn_LeftPane" class="content_left">
				<div class="content_left">
			  		<table class="normal" border="0" cellspacing="0" cellpadding="3"  align="center">
					    <tbody>
						<tr>
							<td align="center" class="news-info" style="position:relative;">
									<div class="bhs-container"> 
									</div>
							</td>
						</tr>
						<tr>
					       <td>
				               <div id="article_content" style="margin-top:15px;">
				            	   <div id="Content" style="width:950px;">
											<div style="height:5px;"></div>
											<div class="w950">
											  <div class="head4">
											    <div class="Ico_aBox">
											      <div class="Ico_aBox_icon INico83"></div>
												  <div class="Ico_aBox_tit">店面查询</div>
												  <div class="Ico_aBox_intro">全国店面查询</div>
												  
											    </div>   
											  </div>  
											  <div class="knr">
												<img src="<%=basePath %>static/resource/images/chepai_map.gif" border="0" usemap="#Map">
											
											       <div id="city_4"  style="">
											    	   选择店面所在地：
										                    <select class="prov"></select> 
										                    <select class="city" disabled="disabled"></select>
										                    <select class="dist" disabled="disabled"></select>
										                    	<input class="ssbtn" id="imgso" onclick="showStorePage('')" name="imgso" type="button" value="搜索" />
										                     	
										           </div>
										           
										           <table class="knrTable">
													   <tr class="knrtr">
														 <th class="knrth" colspan='3'>郑远元店面信息表</th>
													   </tr>
													   <tr>
															<td width='40%'><strong class="red">店面名称</strong></td>
															<td width='40%'><strong><a  class="red" target="_blank" title="查看更多>>">联系电话</a></strong></td>
															<td width='20%'><strong><a  class="red" target="_blank" title="查看更多>>"></a></strong></td>
													   </tr>
													 
													</table>
											<br>
											<iframe name="postFrm" id="postFm" width="100%" height="551" frameborder="0" scrolling="no" 
											onload="this.height=postFrm.document.body.scrollHeight" ></iframe>
												<map name="Map">
												  <area shape="rect" coords="341,134,373,154" onclick="showStoreData('北京');" target="postFrm" alt="北京">
												  <area shape="rect" coords="364,155,390,170" onclick="showStoreData('天津');" target="postFrm" alt="天津">
												  <area shape="rect" coords="413,237,440,250" onclick="showStoreData('上海');" target="postFrm" alt="上海">
												  <area shape="rect" coords="250,262,285,282" onclick="showStoreData('重庆');" target="postFrm" alt="重庆">
												  <area shape="rect" coords="320,164,356,181" onclick="showStoreData('河北');" target="postFrm" alt="河北">
												  <area shape="rect" coords="302,181,330,202" onclick="showStoreData('山西');" target="postFrm" alt="山西">
												  <area shape="rect" coords="383,122,418,139" onclick="showStoreData('辽宁');" target="postFrm" alt="辽宁">
												  <area shape="rect" coords="407,95,438,114"  onclick="showStoreData('吉林');" target="postFrm" alt="吉林">
												  <area shape="rect" coords="403,58,450,77"   onclick="showStoreData('黑龙江');" target="postFrm" alt="黑龙江">
												  <area shape="rect" coords="267,141,311,156" onclick="showStoreData('内蒙古');" target="postFrm" alt="内蒙古">
												  <area shape="rect" coords="384,257,417,273" onclick="showStoreData('浙江');" target="postFrm" alt="浙江">
												  <area shape="rect" coords="355,234,384,248" onclick="showStoreData('安徽');" target="postFrm" alt="安徽">
												  <area shape="rect" coords="369,291,398,310" onclick="showStoreData('福建');" target="postFrm" alt="福建">
												  <area shape="rect" coords="379,208,406,224" onclick="showStoreData('江苏');" target="postFrm" alt="江苏">
												  <area shape="rect" coords="351,184,380,198" onclick="showStoreData('山东');" target="postFrm" alt="山东">
												  <area shape="rect" coords="313,215,343,232" onclick="showStoreData('河南');" target="postFrm" alt="河南">
												  <area shape="rect" coords="311,244,342,262" onclick="showStoreData('湖北');" target="postFrm" alt="湖北">
												  <area shape="rect" coords="345,271,373,287" onclick="showStoreData('江西');" target="postFrm" alt="江西">
												  <area shape="rect" coords="332,317,362,339" onclick="showStoreData('广东');" target="postFrm" alt="广东">
												  <area shape="rect" coords="281,323,312,346" onclick="showStoreData('广西');" target="postFrm" alt="广西">
												  <area shape="rect" coords="279,373,309,395" onclick="showStoreData('海南');" target="postFrm" alt="海南">
												  <area shape="rect" coords="306,277,336,297" onclick="showStoreData('湖南');" target="postFrm" alt="湖南">
												  <area shape="rect" coords="211,249,246,273" onclick="showStoreData('四川');" target="postFrm" alt="四川">
												  <area shape="rect" coords="264,292,292,312" onclick="showStoreData('贵州');" target="postFrm" alt="贵州">
												  <area shape="rect" coords="209,320,239,339" onclick="showStoreData('云南');" target="postFrm" alt="云南">
												  <area shape="rect" coords="273,212,303,231" onclick="showStoreData('陕西');" target="postFrm" alt="陕西"> 
												  <area shape="rect" coords="168,151,198,168" onclick="showStoreData('甘肃');" target="postFrm" alt="甘肃">
												  <area shape="rect" coords="165,195,195,214" onclick="showStoreData('青海');" target="postFrm" alt="青海">
												  <area shape="rect" coords="239,181,274,200" onclick="showStoreData('宁夏');" target="postFrm" alt="宁夏">
												  <area shape="rect" coords="85,127,122,150" onclick="showStoreData('新疆');" target="postFrm" alt="新疆">
												  <area shape="rect" coords="358,341,386,360"   alt="香港">
												  <area shape="rect" coords="91,234,133,256" onclick="showStoreData('西藏');" target="postFrm" alt="西藏">
												  <area shape="rect" coords="387,318,426,334"  alt="台湾">
												  <area shape="rect" coords="318,356,352,375"   alt="澳门">
												</map>
												   
											  </div>
											  <div class="head3">
											  		  
											  
											  
											  </div>
										 
										 			

											 
											</div>
									</div> 
								</div>
					    	</td>
					        </tr>
					      </tbody>
					  </table>
				</div>
			</div>
				<div id="dnn_LeftPane" class="content_right">
		        	<div class="about">
		        		<table   style="width: 210px;height: 127px;"  >
		        		  <tr  style="height: 60px;">
			        		  <td style="text-align: center;font-weight:lighter; vertical-align:bottom; font-size: 24px; letter-spacing: 2px; " >
			        			店面分布 
			        		  </td>
		        		  </tr>
		        			 <tr><td style="height: 15px;" ></td></tr>
		        		  <tr>
		        		  	<td style="text-align: center;vertical-align:top;color: #ae9462;font-weight:lighter;">${NAME_EN }</td>
		        		  </tr> 	
		        		</table>   
		        		  
		        	</div>
					<div class="basic"  id="list1b">
						<div id="rightMenua">
						</div>
						 <div style="height: 60px;width: 200px;"></div>
						 <table style="width: 200px;height:60px;border: 1px solid #d1d2d3;"  >
						 	<tr>
						 		<td rowspan="2" style="text-align: center;" ><img alt="" src="<%=basePath %>/static/resource/images1/icophone.gif"></td>
						 		<td style="line-height: 20px;display:table-cell;vertical-align:bottom;" >客户热线</td>
						 	</tr>
						 	<tr>
						 		<td style="font-size: 18px;color: #f00;font-weight: bold;"> 400-029-0303</td>
						 	</tr>
						  
						 </table>
						 
					</div>
				</div>
			</div>
			
	 	</div>
	 	</div>
 
	<div style="clear: both;height:30px;"></div>
 
	<!--foot-->
	<div id="floor_14_main">
	 <div class="footer">
	    <div class="in">
		        <div class="nag">
		            <div class="e e_first">
		                <label>全国服务热线:<span style="font-size: 14px;">工作时间：9:00-18:00</span> </label>
		                <br/> <br/>
		                 <span style="font-size:40px;color:red;" >400-029-0303</span>
		                
		            </div>
		            <div  style="float: left;width: 280px;line-height:30px; margin-right: 50px;margin-left: 50px;border-right : 1px solid #e6e6e6;  ">
		               
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
		            				<td>远官元方</td>
		            		    </tr>
		            		<tr>
		            		<td>集微团信</td>
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
			<p>咨询热线：<br>400-029-0303<br>客服qq：<br>1271876110</p>
			</li>
			<li class="wx" style="display: none;"> <div class="img">
				<img src="<%=basePath %>static/resource/images1/guanfang.png" width="120" height="120">
			</div> 
			
			</li>
		</ul>  
	</div>
	 <script src="<%=basePath %>static/resource/assert/js/bootstrap.min.js"></script>
	 <script src="<%=basePath %>static/resource/assert/js/jquery.vm-carousel.js"></script>
	 <script src="<%=basePath %>static/resource/assert/js/scolltop.js"></script>

<script type="text/javascript">
	jQuery(function($){
		//alert($(window).width()*0.95);
		//$(".banner_guide").width($(window).width()*0.9);
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
