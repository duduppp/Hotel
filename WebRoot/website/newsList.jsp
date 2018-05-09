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
<link href="<%=basePath %>static/resource/assert/css/subpage.css" rel="stylesheet" type="text/css" />
 
 <script type="text/javascript" src="<%=basePath %>static/resource/assert/js/html5.js"></script>
 
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
.pagination {
  display: inline-block;
  padding-left: 0;
  margin: 20px 0;
  border-radius: 4px;
}
.pagination > li {
  display: inline;
}
.pagination > li > a,
.pagination > li > span {
  position: relative;
  float: left;
  padding: 6px 12px;
  line-height: 1.42857143;
  text-decoration: none;
  color: #337ab7;
  background-color: #ffffff;
  border: 1px solid #dddddd;
  margin-left: -1px;
}
.pagination > li:first-child > a,
.pagination > li:first-child > span {
  margin-left: 0;
  border-bottom-left-radius: 4px;
  border-top-left-radius: 4px;
}
.pagination > li:last-child > a,
.pagination > li:last-child > span {
  border-bottom-right-radius: 4px;
  border-top-right-radius: 4px;
}
.pagination > li > a:hover,
.pagination > li > span:hover,
.pagination > li > a:focus,
.pagination > li > span:focus {
  color: #23527c;
  background-color: #eeeeee;
  border-color: #dddddd;
}
.pagination > .active > a,
.pagination > .active > span,
.pagination > .active > a:hover,
.pagination > .active > span:hover,
.pagination > .active > a:focus,
.pagination > .active > span:focus {
  z-index: 2;
  color: #ffffff;
  background-color: #337ab7;
  border-color: #337ab7;
  cursor: default;
}
.pagination > .disabled > span,
.pagination > .disabled > span:hover,
.pagination > .disabled > span:focus,
.pagination > .disabled > a,
.pagination > .disabled > a:hover,
.pagination > .disabled > a:focus {
  color: #777777;
  background-color: #ffffff;
  border-color: #dddddd;
  cursor: not-allowed;
}
.pagination-lg > li > a,
.pagination-lg > li > span {
  padding: 10px 16px;
  font-size: 18px;
}
.pagination-lg > li:first-child > a,
.pagination-lg > li:first-child > span {
  border-bottom-left-radius: 6px;
  border-top-left-radius: 6px;
}
.pagination-lg > li:last-child > a,
.pagination-lg > li:last-child > span {
  border-bottom-right-radius: 6px;
  border-top-right-radius: 6px;
}
.pagination-sm > li > a,
.pagination-sm > li > span {
  padding: 5px 10px;
  font-size: 12px;
}
.pagination-sm > li:first-child > a,
.pagination-sm > li:first-child > span {
  border-bottom-left-radius: 3px;
  border-top-left-radius: 3px;
}
.pagination-sm > li:last-child > a,
.pagination-sm > li:last-child > span {
  border-bottom-right-radius: 3px;
  border-top-right-radius: 3px;
}
.pager {
  padding-left: 0;
  margin: 20px 0;
  list-style: none;
  text-align: center;
}
.pager li {
  display: inline;
}
.pager li > a,
.pager li > span {
  display: inline-block;
  padding: 5px 14px;
  background-color: #ffffff;
  border: 1px solid #dddddd;
  border-radius: 15px;
}
.pager li > a:hover,
.pager li > a:focus {
  text-decoration: none;
  background-color: #eeeeee;
}
.pager .next > a,
.pager .next > span {
  float: right;
}
.pager .previous > a,
.pager .previous > span {
  float: left;
}
.pager .disabled > a,
.pager .disabled > a:hover,
.pager .disabled > a:focus,
.pager .disabled > span {
  color: #777777;
  background-color: #ffffff;
  cursor: not-allowed;
}
.label {
  display: inline;
  padding: .2em .6em .3em;
  font-size: 75%;
  font-weight: bold;
  line-height: 1;
  color: #ffffff;
  text-align: center;
  white-space: nowrap;
  vertical-align: baseline;
  border-radius: .25em;
}
.pagination a.label:hover,
.pagination a.label:focus {
  color: #ffffff;
  text-decoration: none;
  cursor: pointer;
}
.label:empty {
  display: none;
}
.btn .label {
  position: relative;
  top: -1px;
}
.label-default {
  background-color: #777777;
}
.label-default[href]:hover,
.label-default[href]:focus {
  background-color: #5e5e5e;
}
.label-primary {
  background-color: #337ab7;
}
.label-primary[href]:hover,
.label-primary[href]:focus {
  background-color: #286090;
}
.label-success {
  background-color: #5cb85c;
}
.label-success[href]:hover,
.label-success[href]:focus {
  background-color: #449d44;
}
.label-info {
  background-color: #5bc0de;
}
.label-info[href]:hover,
.label-info[href]:focus {
  background-color: #31b0d5;
}
.label-warning {
  background-color: #f0ad4e;
}
.label-warning[href]:hover,
.label-warning[href]:focus {
  background-color: #ec971f;
}
.label-danger {
  background-color: #d9534f;
}
.label-danger[href]:hover,
.label-danger[href]:focus {
  background-color: #c9302c;
}
.badge {
  display: inline-block;
  min-width: 10px;
  padding: 3px 7px;
  font-size: 12px;
  font-weight: bold;
  color: #ffffff;
  line-height: 1;
  vertical-align: baseline;
  white-space: nowrap;
  text-align: center;
  background-color: #777777;
  border-radius: 10px;
}
.badge:empty {
  display: none;
}
 .btn .badge {
  position: relative;
  top: -1px;
}
 .btn-xs .badge {
  top: 0;
  padding: 1px 5px;
}
.pagination a.badge:hover,
.pagination a.badge:focus {
  color: #ffffff;
  text-decoration: none;
  cursor: pointer;
}
.list-group-item.active > .badge,
.nav-pills > .active > a > .badge {
  color: #337ab7;
  background-color: #ffffff;
}
.list-group-item > .badge {
  float: right;
}
.list-group-item > .badge + .badge {
  margin-right: 5px;
}
.nav-pills > li > a > .badge {
  margin-left: 3px;
}
.jumbotron {
  padding: 30px 15px;
  margin-bottom: 30px;
  color: inherit;
  background-color: #eeeeee;
}
.jumbotron h1,
.jumbotron .h1 {
  color: inherit;
}
.jumbotron p {
  margin-bottom: 15px;
  font-size: 21px;
  font-weight: 200;
}
.jumbotron > hr {
  border-top-color: #d5d5d5;
}
.container .jumbotron,
.container-fluid .jumbotron {
  border-radius: 6px;
}
.jumbotron .container {
  max-width: 100%;
}
@media screen and (min-width: 768px) {
  .jumbotron {
    padding: 48px 0;
  }
  .container .jumbotron,
  .container-fluid .jumbotron {
    padding-left: 60px;
    padding-right: 60px;
  }
  .jumbotron h1,
  .jumbotron .h1 {
    font-size: 63px;
  }
}
</style>

<script type="text/javascript" src="<%=basePath %>static/resource/assert/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=basePath %>static/resource/assert/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath %>static/resource/assert/js/common.js"></script>
<script type="text/javascript" src="<%=basePath %>static/resource/assert/js/jquery.SuperSlide.js"></script>
<script src="<%=basePath %>static/resource/assert/js/modernizr.js"></script>
   
 
<script>
	
	//yyNews
	$(document).ready(function (e) {
		var yyNewsJson = ${yyNews}; 
		console.info(yyNewsJson);
		var CATALOG_NAME="",SUBDIRECTORY_NAME="",SUNCATALOGUE_NAME="",tableStr="<table style='width:780px;margin-left:30px;'>";
		for ( var i in yyNewsJson) {
			if(i==0){
				
				CATALOG_NAME=yyNewsJson[i].CATALOG_NAME; 
				SUBDIRECTORY_NAME=yyNewsJson[i].SUBDIRECTORY_NAME;
				SUNCATALOGUE_NAME=yyNewsJson[i].SUNCATALOGUE_NAME;
				var nagdivStr="<span style='color:#f00;font-size:16px;'>"+CATALOG_NAME+"><a style='cursor:pointer;' onclick=\"";
				nagdivStr+="openPage('<%=basePath %>newsData.do?CATALOG_NAME="+CATALOG_NAME+"&SUBDIRECTORY_NAME="+SUBDIRECTORY_NAME+"&SUNCATALOGUE_NAME="+SUNCATALOGUE_NAME+"')\" >"+SUBDIRECTORY_NAME+"</a> <span>";
				$("#nagdivID").append(nagdivStr);
				$("#CATALOG_NAME").append(CATALOG_NAME);   
			}
			 
			tableStr+="<tr style='border-bottom: 1px dotted #000;' ><td style='width:85%;height:36px;text-indent:2em;'>";
			var newtitle=yyNewsJson[i].TITLE;
			if(newtitle.length>40){
				newtitle=newtitle.substring(0,40)+"……";
			}
			tableStr+="★ <a style='cursor:pointer;' onclick=\"openPage('<%=basePath %>newsShow.do?GRAPHIC_ID="+yyNewsJson[i].GRAPHIC_ID+"')\">"+newtitle+"</a></td>";
			tableStr+="<td style='text-align: right;'>"+yyNewsJson[i].INPUTDATE+"</td></tr>";
			 
			console.info(yyNewsJson[i].TITLE);
		}
		tableStr+="</table>";
		$("#Content").append(tableStr);
		var str='${NavigatList}';
		var NavigatList = $.parseJSON(str); 
		var url='';
		for(var i in NavigatList){
			if(NavigatList[i].NAME==SUBDIRECTORY_NAME){
				 url+='<a style="color:white;background-color: white;background-color: #f00;" ';
			}else{
				 url+='<a ';
			}
			
			if(NavigatList[i].NAME==""){
				 url+=' href="javascript:void(0);">'+NavigatList[i].NAME+'</a>';
			}else{
				  url+='onclick="openPage(\'<%=basePath %>newsData.do?CATALOG_NAME='+CATALOG_NAME+'&SUBDIRECTORY_NAME='+NavigatList[i].NAME+'&SUNCATALOGUE_NAME=\')">'+NavigatList[i].NAME+'</a>';
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
					<img src="<%=basePath %>static/resource/images1/LOGO.png" height="58"  title="远元集团" alt="远元集团" style="top:30px;margin-top: 20px;" />
				</a>
			</div>
			<!--网站Logo 结束-->  
			<!--导航条 开始-->
			<div id="navigation">
				<ul class="navigationlist">
					<li><a id="showpageid" class="headpage" href="<%=basePath %>"  onmousemove="moveMenu('aid0','xiala1','menuxiala1');" >首页</a></li>
					<li><a id="aid1" class="subpage" onmousemove="moveMenu('aid1','xiala1','menuxiala1');" onmouseout="outMenu('xiala1');" href=""  >关于远元</a></li>
					<li><a id="aid2" class="subpage" onmousemove="moveMenu('aid2','xiala2','menuxiala2');" onmouseout="outMenu('xiala2');" href=""  >远元产业</a></li>
					<li><a id="aid3" class="subpage" onmousemove="moveMenu('aid3','xiala3','menuxiala3');" onmouseout="outMenu('xiala3');" href=""  >新闻中心</a></li>
					<li><a id="aid4" class="subpage"  onmousemove="moveMenu('aid4','xiala4','menuxiala4');" onmouseout="outMenu('xiala4');" href=""  >远元文化</a></li>
					<li><a id="aid5" class="subpage" onmousemove="moveMenu('aid5','xiala5','menuxiala5');" onmouseout="outMenu('xiala5');" href="" >远元基金会</a></li>
					<li><a id="aid6" class="subpage" onmousemove="moveMenu('aid6','xiala6','menuxiala6');" onmouseout="outMenu('xiala6');" href=""  >联系我们</a></li>
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
						<a onclick="openPage('<%=basePath %>newsData.do?CATALOG_NAME=远元产业&amp;SUBDIRECTORY_NAME=生物制药&amp;SUNCATALOGUE_NAME=')">生物制药</a>&nbsp; &nbsp; &nbsp; 
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
		   <a href="javascript:void(0)" ><img src="<%=basePath %>static/resource/images1/aboutyy.jpg" width="100%"  /></a>
		<!--幻灯片 结束-->
		 
	</div>
	   <div class="banner_guide">
			<div id="nagdivID"  style="width:1200px;margin:0 auto;height:40px; line-height:40px;">
					 
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
				            	   <div id="Content" style="width:780px;">
								   </div>
									<table style="width:780px;" >
									<tbody>
										<tr><td sty;e="vertical-align:top;"></td>
										<td>
											<div class='pagination' style='padding-top: 0px;margin-top: 0px;float: right;'>${page.pageStr}</div>
										
										</td>
										  </tr>
									</tbody>
									
									</table>
									
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
		        		  	  <td id="CATALOG_NAME" style="text-align: center;font-weight:lighter; vertical-align:bottom; font-size: 24px; letter-spacing: 2px; " >
							  </td>
						    </tr>
		        			 <tr><td style="height: 15px;" ></td></tr>
		        		  <tr><td style="text-align: center;vertical-align:top;color: #ae9462;font-weight:lighter;">${NAME_EN }</td></tr>
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
			<p>在线沟通，请点我<a href="http://wpa.qq.com/msgrd?v=3&amp;uin=1271876110&amp;site=qq&amp;menu=yes" target="_blank">在线咨询</a></p>
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
