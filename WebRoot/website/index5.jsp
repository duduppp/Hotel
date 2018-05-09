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
<meta name="author" content="某某公司">
<meta name="keywords" content="郑远元,远元集团">
<meta name="description" content="郑远元,远元集团 官网">
<link href="favicon.ico" type="image/x-icon" rel="icon">
<link href="favicon.ico" type="image/x-icon" rel="shortcut icon">
<link href="<%=basePath %>static/resource/assert/css/style.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath %>static/resource/assert/css/animate.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath %>static/resource/assert/css/video-js.css" rel="stylesheet" type="text/css">

<style type="text/css">
  
       
    </style>
<script type="text/javascript">var ctx='<%=basePath%>';</script>
<script type="text/javascript" src="<%=basePath %>static/resource/assert/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=basePath %>static/resource/assert/js/common.js"></script>
<script type="text/javascript" src="<%=basePath %>static/resource/assert/js/jquery.SuperSlide.js"></script>
<script type="text/javascript" src="<%=basePath %>static/resource/assert/js/html5zoo.js"></script>
<script type="text/javascript" src="<%=basePath %>static/resource/assert/js/script.js"></script>

<script type="text/javascript" src="<%=basePath %>static/resource/assert/js/video.js"></script>
<!--  [if lte IE 6]>
	<script type="text/javascript" src="/App/Tpl/Home/Default/Public/js/minmax.js"></script>
	<script type="text/javascript" src="/App/Tpl/Home/Default/Public/js/pngfix.js"></script>
	<script language="javascript" type="text/javascript">EvPNG.fix("#logo img");</script>
	<![endif]
	
	
	
	
-->
<script>
	$(document).ready(function (e) {
	 
			var b_name = navigator.appName; 
			var b_version = navigator.appVersion; 
			var version = b_version.split(";"); 
			var trim_version = version[1].replace(/[ ]/g, ""); 
			if (b_name == "Microsoft Internet Explorer") { 
			/*如果是IE6或者IE7*/ 
			if (trim_version == "MSIE7.0" || trim_version == "MSIE6.0" || trim_version == "MSIE8.0") { 
			alert("IE浏览器版本过低，请到指定网站去下载相关版本"); 
			//然后跳到需要连接的下载网站 
			window.location.href="http://jiaoxueyun.com/download.jsp"; 
			} 
		 } 
			 
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
		
	pageInit();
	function pageInit() {
		if ($("#top_1").length > 0) {
			if ("0" == 1) {
				$.get("/public/getJson/l/cn", null,
					function (data) {
					UpdateLoginStatus(
						data['MemberID'],
						data['MemberName'],
						data['EnableMember']);
				}, "json");
			} else {
				UpdateLoginStatus("", "", "1");
			}
		}
	}
	function UpdateLoginStatus(id, name, flag) {
		if (flag == 0)
			return;
		var html = "";
		if (id) {
			html += '<span class="MemberName">' + name+ '&nbsp;</span>';
			html += '<a href="/member/public/index" target="_blank">[会员中心]&nbsp;</a>';
			html += '<a href="/member/public/logout" target="_self">[退出登录]</a>';
		} else {
			html += '<a href="/public/login/l/cn" target="_self">[登录]&nbsp;</a>';
			html += '<a href="/public/reg/l/cn" target="_self">[注册]&nbsp;</a>';
		}
		$("#top_1").html(html);
	}
});
	function setHomePage(obj) {
        var aUrls = document.URL.split("/");
        var vDomainName = "http://" + aUrls[2] + "/";
        try {//IE
            obj.style.behavior = "url(#default#homepage)";
            obj.setHomePage(vDomainName);
        } catch (e) {//other
            if (window.netscape) {//Firefox
                try {
                    netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
                }
                catch (e) {
                    alert("此操作被浏览器拒绝！\n请在浏览器地址栏输入“about:config”并回车\n然后将[signed.applets.codebase_principal_support]设置为'true'");
                }
                var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components.interfaces.nsIPrefBranch);
                prefs.setCharPref('browser.startup.homepage', vDomainName);
            }
        }
        if (window.netscape) alert("设置首页成功！");
        return false; //阻止a标签继续执行
    }
    //加入收藏函数
    function addFavorite(obj) {
        var aUrls = document.URL.split("/");
        var vDomainName = "http://" + aUrls[2] + "/";
        var description = obj.title;
        try {//IE
            window.external.AddFavorite(vDomainName, description);
        } catch (e) {//Firefox
            window.sidebar.addPanel(description, vDomainName, "");
        }
        return false; //阻止a标签继续执行
    }
 
 

</script>

<script type="text/javascript" src="<%=basePath %>static/resource/assert/js/lovelygallery.js"></script>
</head>

<body class="body_picture">

	<!--顶部 开始-->
	
		<div class="head">
		<div class="mdhead">
		<div class="lhead">
		<span>
			<strong>
			<a href="javascript:void(0)" onclick="setHomePage(this);" style="margin-right:10px;" >设为首页</a>
		 
			<span style="width: 350px;">&nbsp;</span>
				&nbsp;&nbsp;
			<a class="pull-left" href="javascript:void(0)" onclick="addFavorite(this);">加入收藏</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				远元必胜</strong>
		</span>
		
	</div>

	<div class="rhead">
	<!--      <ul><li><a>关注我们</a></li><li><a>进度查询</a></li><li><a>售后工单</a></li></ul> -->
	<span>
		全国免费咨询热线 :&nbsp;&nbsp;&nbsp;&nbsp;
		<img src="<%=basePath %>static/resource/images/icophone.gif" height="23" width="20">400-029-0303
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<img src="<%=basePath %>static/resource/images/t2.png" height="23" width="20">029-87519238
		</span>
	</div></div></div>
	
	<div class="clr">
</div>

	<!--顶部 结束-->
	<!--Logo 开始-->

	<div id="logo_main">
		<div id="logo">
			<!--网站Logo 开始-->
			<div class="WebLogo">
				<a href="/" target="_self">
					<img src="<%=basePath %>static/resource/images/1483749412.png" title="某某公司" alt="某某公司" />
				</a>
			</div>
			<!--网站Logo 结束-->
			<!--导航条 开始-->
			<div id="navigation">
				<ul class="navigationlist">
					<li>
						<a class="ChannelName" href="#" target="_self">
							<img src="<%=basePath %>static/resource/images/icon-6.png">网站首页
						</a>
					</li>
					<li><a class="ChannelName" href="#" target="_self">关于我们</a>
						<div class="info_wrap_main">
							<div class="info_wrap">
								<div class="Channel_wrap">
									<span class="ChannelName1">关于我们</span>
									<p>
										陕西郑远元专业修脚保健服务集团有限公司（简称远元集团），是由陕西省工商局核准成立的全国知名连锁性集团公司，并由国家工商行政管理总局商标局批准“郑远元”为注册商标，
										2014年获得陕西省著名商标。远元集团以专业脚病修护、连锁加盟为主，业务涵盖了技师培训、生物制药、房地产开发、商务贸易等多个方面。
										集团位于西安市碑林区和平路108号佳腾大厦13楼C座，注册资本3000万元 ……
									</p>
									<a class="more" href="<%=basePath %>website/aboutYY.jsp" target="_self">查看更多</a>
								</div>
  
								<ul class="subnavigationlist">
									<li><a href="#">企业文化</a></li>
									<li><a href="#">发展足迹</a></li>
									<li><a href="#">资质荣誉</a></li>
									<li><a href="#">组织机构</a></li>
								</ul>
								<div class="right_info">
									<img src="<%=basePath %>static/resource/images/1482544791.jpg" title="关于我们" alt="关于我们" />
									<p>集团发展已经驶入了快车道，连续多年保持着高速增长，引起社会各界的持续关注</p>
								</div>
							</div>
						</div></li>
					<li><a href="#" target="_self"
						class="ChannelName current">业务领域</a>
						<div class="info_wrap_main">
							<div class="info_wrap">
								<div class="Channel_wrap">
									<span class="ChannelName1">业务领域</span>
									<p>集团业务覆盖零售、超市、百货、购物中心、银行金融、房地产开发、酒店及旅游休闲产业。其中，购物中心是集团业务的核心之一。目前集团已先后在厦门、晋江、成都、苏州、重庆、
										淄博等地建设购物中心44家，总建筑面积逾540万平方米， 并计划到2013年将名下购物商场数量增加一倍。...</p>
									<a class="more" href="/product.html" target="_self">查看更多</a>
								</div>
								<ul class="subnavigationlist">
									<li><a href="#">专业修脚连锁</a></li>
									<li><a href="#">生物制药</a></li>
									<li><a href="#">远元传媒</a></li>    
									<li><a href="#">地产公司</a></li> 
									<li><a  href="#">远元商学院</a></li>
								</ul>    
								<div class="right_info">
									<img src="<%=basePath %>static/resource/images/1482545990.jpg" title="业务领域" alt="业务领域" />
									<p>某某公司致力于打造成为中国工程机械设备与重型车辆在海外的集产品、服务和技术支持于一体的全方位综合解决方案提供商。</p>
								</div>
							</div>
						</div></li>
					<li><a class="ChannelName" href="#" target="_self">远元基金</a>
						<div class="info_wrap_main">
							<div class="info_wrap">
								<div class="Channel_wrap">
									<span class="ChannelName1">网络与服务</span>
										<p>
											集团秉承&ldquo;让服务永远物超所值，服务提升品质&rdquo;的服务理念，用完善的服务网络、娴熟的服务技术、真诚的服务态度来实现&ldquo;
											专业创造价值，服务感动客户&rdquo;的服务目标。我们秉持&ldquo;快速反应、畅快沟通、精准高效、合理周到&quot...
										</p>
									  <a class="more" href="/wlyfw.html" target="_self">查看更多</a>
								</div>   
								<ul class="subnavigationlist">
									<li><a href="#">营销网络</a></li>
									<li><a href="#">集团服务</a></li>
								</ul>
								<div class="right_info">
									<img src="<%=basePath %>static/resource/images//1482546174.jpg" title="网络与服务" alt="网络与服务" />
									<p>业务范围涉及全球多个国家，市场占有率，品牌影响力、贸易额增长速度、服务网络的覆盖范围、服务质量等方面已成为同行业的翘楚。</p>
								</div>
							</div>
						</div></li>
					<li><a class="ChannelName" href="#" target="_self">新闻动态</a>
						<div class="info_wrap_main">
							<div class="info_wrap">
								<div class="Channel_wrap">
									<span class="ChannelName1">新闻动态</span>
									<p>聚焦集团新闻，熟悉行业动态，第一时间了解您身边的集团。</p>
									<a class="more" href="#" target="_self">查看更多</a>
								</div>
								<ul class="subnavigationlist">
									<li><a href="#">公司新闻</a></li>
									<li><a href="#">行业动态</a></li>
									<li><a href="#">集团影像</a></li>
									<li><a href="#">营销活动</a></li>
								</ul>
								<div class="right_info">
									<img src="<%=basePath %>static/resource/images/1483001125.jpg" title="新闻动态" alt="新闻动态" />
									<p>集团坚持“合作创造财富、创新谋求发展”的经营理念，力求为社会、为企业、为员工创造和谐的氛围，走持续发展的道路。
									</p>
								</div>
							</div>
						</div></li>
					<li>
							<a class="ChannelName" href="#" target="_self">人力资源</a>
							<div class="info_wrap_main">
								<div class="info_wrap">
									<div class="Channel_wrap">
										<span class="ChannelName1">人才资源</span>
										<p>
											我们的团队拥有多元化的专业和文化背景，我们深刻理解中国及其他海外市场的商业环境，这是我们在国际化商业舞台成功运作的关键。同时，我们也认识到人才对于集团发展的重要性，
											因此，我们一直致力于为优秀人才创造最佳的工作与发展平台。通过多年的实践和发展，我们更加深刻认识到，骨干团队...</p>
										<a class="more" href="#" target="_self">查看更多</a>
									</div>
									<ul class="subnavigationlist">
										<li><a href="#">人才战略</a></li>
										<li><a href="#">人才培训</a></li>
										<li><a href="#">人才招聘</a></li>
									</ul>
	  
									<div class="right_info">
										<img src="<%=basePath %>static/resource/images/1482546361.jpg" title="人力资源" alt="人力资源" />
										<p>我们一直致力于为优秀人才创造最佳的工作与发展平台</p>
									</div>
								</div>
							</div>
					</li>
					<li>
							<a class="ChannelName" href="#" target="_self">在线留言</a>
							
					</li>
					<li><a class="ChannelName" href="#" target="_self">联系我们</a></li>
				</ul>
			</div>
			<!--导航条 结束-->
		</div>
	</div>
	 
	<!--Logo 结束-->
 
	<!--JS幻灯片 开始-->
 
		<!--幻灯片 开始-->
	<!-- 轮播图 -->
			 
			 <div class="pics_wrap">
				<div id="html5zoo-1">
					<ul class="html5zoo-slides" style="display: none;">
						<li><a href="#">
							<img src="<%=basePath %>static/resource/images/1.jpg" /></a></li>
						<li><a href="#">
							<img src="<%=basePath %>static/resource/images/2.jpg" /></a></li>
						<li><a href="#">
							<img src="<%=basePath %>static/resource/images/3.jpg" /></a></li>
						<li><a href="#">
							<img src="<%=basePath %>static/resource/images/4.jpg" /></a></li>
						<li><a href="#">
							<img src="<%=basePath %>static/resource/images/5.jpg" /></a></li>
					</ul>
				</div>
			 </div>
		<br><br><br><br><br><br><br><br>
		<div class="hd">
			<ul></ul>
		</div>
		<div class="in_news">
			<div class="in_news_p">
				<div class="in_news_p_1">
					最新公告：
				</div>
					<div class="in_news_p_2">
						<ul>
							<li> <a href="#">【春节休假】关于远元集团春节休假通知</a><span> 2017-01-14</span></li>
							<li> <a href="#">【5.1】关于远元集团 2016 国庆休假通知</a><span> 2016-09-30</span></li>
						</ul>
					</div>
					<div class="in_news_p_3">
						<a href="#"></a>
					</div>
			 </div>
		</div>
		<!--幻灯片 结束-->
 
 
	<!--JS幻灯片 结束-->
	<div class="subchannel_main">
		<div class="subchannel">
			<ul class="subchannellist">

				<li class="depth1"><a href="#">专业修脚连锁</a></li>
				<li class="depth1"><a href="#">脚病修护</a></li>
				<li class="depth1"><a href="#">生物制药</a></li>
				<li class="depth1"><a href="#">地产公司</a></li>
				<li class="depth1"><a href="#">免费培训学校</a></li>
			</ul>

		</div>
	</div>
	<script>
		$(".subchannellist li").last().css("border-right", "none");
	</script>
	<!--主体内容 开始-->
	
		<div class="sinochem_content">
			<div class="content_top">
			<div class="content_t_left">
			<div id="dnn_ContentTP2Pane" class="content_t_p2">
			<div class="DnnModule DnnModule-GTModulesCMS DnnModule-4142">
		  	 <a id="4142" name="4142" class="module"></a>
			  <div class="GoneContainer_without_title">
				<div id="dnn_ctr4142_ContentPane">
					<!-- Start_Module_4142 -->
					<div id="dnn_ctr4142_ModuleContent">
						<div>
							<div id="divPortal" portalid="4142"></div>
						</div>
						<div id="Content-4142">
							<div class="i-news i-news-xwzx" pagesize="1" timeout="5">
								<div class="i-news-title">新闻中心</div>
								 <div id="slide-holder">
									<div id="slide-runner">
									<a  href="#" target="_blank">
									<img width="100%" id="slide-img-1" src="<%=basePath %>static/resource/images/x1.jpg" class="slide" alt="" /></a>
									<a href="#" target="_blank">
									<img width="100%" id="slide-img-2" src="<%=basePath %>static/resource/images/x2.jpg" class="slide" alt="" /></a>
									<a href="#" target="_blank">
									<img  width="100%" id="slide-img-3" src="<%=basePath %>static/resource/images/x3.jpg" class="slide" alt="" /></a>
									<a href="#" target="_blank">
									<img width="100%" id="slide-img-4" src="<%=basePath %>static/resource/images/x4.jpg" class="slide" alt="" /></a>
									<a href="#" target="_blank">
									<img width="100%" id="slide-img-5" src="<%=basePath %>static/resource/images/x5.jpg" class="slide" alt="" /></a>
									
									<div id="slide-controls">
										<p id="slide-client" class="text"><strong></strong><span></span></p>
										<p id="slide-desc" class="text"></p>
										<p id="slide-nav"></p>
									</div>
								</div>
							</div>
								 
							</div>
						</div>
						 
					</div>
					<!-- End_Module_4142 -->
				</div>
			</div>
		</div>
		
		<!--  -->

	</div>
	
		<div id="dnn_ContentPane" class="content_t_p3">
		<div class="DnnModule DnnModule-DNN_HTML DnnModule-4175">
			<a id="4175" name="4175" class="module"></a>
			<div class="GoneContainer_without_title">
				<div id="dnn_ctr4175_ContentPane" >
				<div id="dnn_ctr4175_HtmlModule_lblContent" class="Normal">
					<!-- Start_Module_4175 -->
					<div class="i-tabs i-tabs-jtdt">
			 		 <ul id="tab">
					        <li class="current">行业新闻</li>
					        <li>下属企业动态</li>
					        <li>媒体聚焦</li>
					     
					    </ul>
					    <div id="content">
					        <ul style="display:block;">
					           <a href="http://www.lanrenzhijia.com/tab">行业新闻</a>  
					        </ul>
					         <ul>
					           <a href="http://www.lanrenzhijia.com/js/css3">下属企业动态</a>
					        </ul>
					        <ul>
					           <a href="http://www.lanrenzhijia.com/js/css3">媒体聚焦</a>
					        </ul>
					      
				    </div>
					<!-- End_Module_4175 -->
					</div>
					
					</div>
					
				</div>
			</div>
		</div>
		
	</div>
	
	</div>
	<div class="aboutCulture" >

		<a id="4182" name="4182" class="module"></a>
		<div class="index-266-mk">
			<div class="index-266-mk-title">
				<div class="index-266-mk-title-left"></div>
				<div class="index-266-mk-title-middle">
					<span id="dnn_ctr4182_zhdTITLE_titleLabel" class="Head">关于远元</span>


				</div>
				<div class="index-266-mk-title-right"></div>
				<div class="clearB"></div>
			</div>
			<div id="dnn_ctr4182_ContentPane" class="index-266-mk-content">
				<!-- Start_Module_4182 -->
				<div id="dnn_ctr4182_ModuleContent">
					<div>

						<div id="divPortal" portalid="4182"></div>

					</div>


					<div id="Content-4182">
						<div class="sinochem-index-qygk-module">
							<div class="sinochem-index-qygk-module-txt">
								<a target="_blank" href="#">
									远元集团  对境内外1000多家店远元集团  对境内外1000多家店远元集团  对境内外1000多家店远元集团  
									对境内外    对境内外1000多家店...</a>

							</div>
							<div class="sinochem-index-qygk-module-module">
								<table width="100%" cellpadding="0" cellspacing="0" border="0">
									<tbody>
										<tr>
											<td><div class="sinochem-index-qygk-item">
													<div class="sinochem-index-qygk-item-pic">
														<a  href="#"
															target="_blank" title="愿景使命"> <img border="0"
															alt="愿景使命"
															src="<%=basePath%>static/resource/images/yysm.jpg"></a>
													</div>
													<div class="sinochem-index-qygk-item-title">
														<a href="#"
															class="news-title" target="_blank" title="愿景使命">愿景使命
														</a>
													</div>
												</div></td>
											<td><div class="sinochem-index-qygk-item">
													<div class="sinochem-index-qygk-item-pic">
														<a  href="#"
															target="_blank" title="管理团队"> <img border="0"
															alt="管理团队"
															src="<%=basePath%>static/resource/images/gltd.jpg"></a>
													</div>
													<div class="sinochem-index-qygk-item-title">
														<a href="#"
															class="news-title" target="_blank" title="管理团队">管理团队
														</a>
													</div>
												</div></td>
											<td><div class="sinochem-index-qygk-item">
													<div class="sinochem-index-qygk-item-pic">
														<a href="#"
															target="_blank" title="组织机构"> <img border="0"
															alt="组织机构"
															src="<%=basePath%>static/resource/images/zzjg.jpg"></a>
													</div>
													<div class="sinochem-index-qygk-item-title">
														<a href="#"
															class="news-title" target="_blank" title="组织机构">组织机构
														</a>
													</div>
												</div></td>
											<td>
												 <div class="sinochem-index-qygk-item">
													<div class="sinochem-index-qygk-item-pic"> 
														<a href="#" target="_blank" title="资质荣誉"> 
															<img border="0" alt="资质荣誉" src="<%=basePath %>static/resource/images/zzry.jpg"></a>
													</div>
													<div class="sinochem-index-qygk-item-title">
														<a href="#"
															class="news-title" target="_blank" title="资质荣誉">资质荣誉
														</a>
													</div>
												</div></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div id="Globalstech_AjaxLoadingPanel_4182"
						class="RadAjax RadAjax_Silk" style="display:none;">
						<div class="raDiv"></div>
						<div class="raColor raTransp"></div>
					</div>
				</div>
				<!-- End_Module_4182 -->
			</div>
			<div class="index-266-mk-bottom">
				<div class="index-266-mk-bottom-left"></div>
				<div class="index-266-mk-bottom-middle"></div>
				<div class="index-266-mk-bottom-right"></div>
				<div class="clearB"></div>
			</div>
		</div>

	</div>
	
	</div>
	</div>
	
	<!-- 远元展厅 -->
	<div class="sinochem_content">
 			<div id="dnn_ContentTP2Pane" class="content_t_p2">
			 <div class="DnnModule DnnModule-DNN_HTML DnnModule-4190">
				<a id="4191" name="4191" class="module"></a>
				<div class="index-349-mk">
					<div class="index-349-mk-title">
						<div class="index-349-mk-title-left"></div>
						<div class="index-349-mk-title-middle">
							<span id="dnn_ctr4191_zhdTITLE_titleLabel" class="Head">远元展厅</span>
						</div>
						<div class="index-349-mk-title-right"></div>
						<div class="clearB"></div>
					</div>
					<div id="dnn_ctr4191_ContentPane" class="index-349-mk-content">
						<!-- Start_Module_4191 -->
						<div id="dnn_ctr4191_ModuleContent">
							<div>
								<div id="divPortal" portalid="4191"></div>
							</div>
							<div id="Content-4191">
								<div class="sinochem-index-wszt-module">
									<div class="sinochem-index-wszt-module-module">
										<table width="100%" cellpadding="0" cellspacing="0" border="0">
											<tbody>  
												<tr>
													<td>
														<div class="sinochem-index-wszt-item">
															<div class="sinochem-index-wszt-item-pic">
																<a href="#"
																	target="_blank" title="网上展厅">
																	
																	<img border="0" width="330" height="270"
																	alt="网上展厅" src="<%=basePath %>static/resource/images/gongsi.png">
																	</a>  
															</div>
														 </div> 
													 </td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
						<!-- End_Module_4191 -->
					</div>
					<div class="index-349-mk-bottom">
						<div class="index-349-mk-bottom-left"></div>
						<div class="index-349-mk-bottom-middle"></div>
						<div class="index-349-mk-bottom-right"></div>
						<div class="clearB"></div>
					</div>
			 	</div>
			 	</div>
			</div>
			
			<div id="dnn_ContentBP2Pane" class="content_b_p22">
				<a id="4192" name="4192" class="module"></a>
					<div class="index-349-mk">
						<div class="index-349-mk-title">
							<div class="index-349-mk-title-left"></div>
							<div class="index-349-mk-title-middle">
							<span id="dnn_ctr4192_zhdTITLE_titleLabel" class="Head">企业文化</span>
					</div>
							<div class="index-349-mk-title-right"></div>
							<div class="clearB"></div>
						</div>
						<div id="dnn_ctr4192_ContentPane" class="index-349-mk-content">
						
						
						<div id="dnn_ctr4192_ModuleContent">
						<div id="dnn_ctr4192_HtmlModule_lblContent" class="Normal">
							<div class="sinochem-index-download-module">
					<div class="sinochem-index-download-module-module">
			 
					
					
					</div>
					</div>
					
						</div>
					
					</div><!-- End_Module_4192 --></div>
						<div class="index-349-mk-bottom">
							<div class="index-349-mk-bottom-left"></div>
							<div class="index-349-mk-bottom-middle"></div>
							<div class="index-349-mk-bottom-right"></div>
							<div class="clearB"></div>
						</div>
					</div>

				</div>
			
	<div id="dnn_ContentBP2Pane" class="content_b_p23">
				<a id="4192" name="4192" class="module"></a>
					<div class="index-266-mk">
						<div class="index-266-mk-title">
							<div class="index-266-mk-title-left"></div>
							<div class="index-266-mk-title-middle">
							<span id="dnn_ctr4192_zhdTITLE_titleLabel" class="Head">远元商学院</span>
					</div>
							<div class="index-266-mk-title-right"></div>
							<div class="clearB"></div>
						</div>
						<div id="dnn_ctr4192_ContentPane" class="index-266-mk-content"><!-- Start_Module_4192 --><div id="dnn_ctr4192_ModuleContent">
						<div id="dnn_ctr4192_HtmlModule_lblContent" class="Normal">
							<div class="sinochem-index-download-module">
					<div class="sinochem-index-download-module-module">
				 		<!--  交流互动-->
				 			<div id="Content-4193">
		<div class="sinochem-index-hdjl-module">
		
		
			<div class="sinochem-index-hdjl-module-module">
	 
			</div>
		</div>
	</div>
	<div id="Globalstech_AjaxLoadingPanel_4193"
		class="RadAjax RadAjax_Silk" style="display:none;">
		<div class="raDiv"></div>
		<div class="raColor raTransp"></div>
	</div>
			 <!-- 交流互动end -->	
					</div>
					</div>
					
						</div>
					
					</div><!-- End_Module_4192 --></div>
						<div class="index-266-mk-bottom">
							<div class="index-266-mk-bottom-left"></div>
							<div class="index-266-mk-bottom-middle"></div>
							<div class="index-266-mk-bottom-right"></div>
							<div class="clearB"></div>
						</div>
					</div>

				</div>
		
		
		</div>
	 
	<!-- 第三 -->
	
	<div class="sinochem_content">
 			<div id="dnn_ContentTP2Pane" class="content_t_p2">
			 <div class="DnnModule DnnModule-DNN_HTML DnnModule-4190">
				<a id="4191" name="4191" class="module"></a>
				<div class="index-349-mk">
					<div class="index-349-mk-title">
						<div class="index-349-mk-title-left"></div>
						<div class="index-349-mk-title-middle">
							<span id="dnn_ctr4191_zhdTITLE_titleLabel" class="Head">远元传媒</span>
						</div>
						<div class="index-349-mk-title-right"></div>
						<div class="clearB"></div>
					</div>
					<div id="dnn_ctr4191_ContentPane" class="index-349-mk-content">
						<!-- Start_Module_4191 -->
						<div id="dnn_ctr4191_ModuleContent">
							<div>
								<div id="divPortal" portalid="4191"></div>
							</div>
							<div id="Content-4191">
								<div class="sinochem-index-wszt-module">
									<div class="sinochem-index-wszt-module-module">
									
								 
										  <video id="my-player" class="video-js vjs-default-skin vjs-big-play-centered"
										   controls preload="none"
										   width="350" height="264"
										      data-setup="{techOrder: ['flash','html5']}">  
										    <source src="<%=basePath %>static/resource/images/mz.mp4" type='video/mp4' />
											
											<!--
											 <source src="。。/static/resource/images/fangzi.mp4" type='video/mp4' />
										    <source src="http://vjs.zencdn.net/v/oceans.webm" type='video/webm' />
										    <source src="http://vjs.zencdn.net/v/oceans.ogv" type='video/ogg' /> -->
										   <!--  <track kind="captions" src="demo.captions.vtt" srclang="en" label="English"></track>Tracks need an ending tag thanks to IE9 -->
										   <!--  <track kind="subtitles" src="demo.captions.vtt" srclang="en" label="English"></track>  Tracks need an ending tag thanks to IE9 -->
										  </video>
									  
										 
									</div>
								</div>
							</div>
						</div>
						<!-- End_Module_4191 -->
					</div>
					<div class="index-349-mk-bottom">
						<div class="index-349-mk-bottom-left"></div>
						<div class="index-349-mk-bottom-middle"></div>
						<div class="index-349-mk-bottom-right"></div>
						<div class="clearB"></div>
					</div>
			 	</div>
			 	</div>
			</div>
			
			<div id="dnn_ContentBP2Pane" class="content_b_p22">
				<a id="4192" name="4192" class="module"></a>
					<div class="index-349-mk">
						<div class="index-349-mk-title">
							<div class="index-349-mk-title-left"></div>
							<div class="index-349-mk-title-middle">
							<span id="dnn_ctr4192_zhdTITLE_titleLabel" class="Head">下载中心</span>
					</div>
							<div class="index-349-mk-title-right"></div>
							<div class="clearB"></div>
						</div>
						<div id="dnn_ctr4192_ContentPane" class="index-349-mk-content">
						
						
						<div id="dnn_ctr4192_ModuleContent">
						<div id="dnn_ctr4192_HtmlModule_lblContent" class="Normal">
							<div class="sinochem-index-download-module">
					<div class="sinochem-index-download-module-module">
			 
					
					
					</div>
					</div>
					
						</div>
					
					</div><!-- End_Module_4192 --></div>
						<div class="index-349-mk-bottom">
							<div class="index-349-mk-bottom-left"></div>
							<div class="index-349-mk-bottom-middle"></div>
							<div class="index-349-mk-bottom-right"></div>
							<div class="clearB"></div>
						</div>
					</div>

				</div>
			
	<div id="dnn_ContentBP2Pane" class="content_b_p23">
				<a id="4192" name="4192" class="module"></a>
					<div class="index-266-mk">
						<div class="index-266-mk-title">
							<div class="index-266-mk-title-left"></div>
							<div class="index-266-mk-title-middle">
							<span id="dnn_ctr4192_zhdTITLE_titleLabel" class="Head">交流互动</span>
					</div>
							<div class="index-266-mk-title-right"></div>
							<div class="clearB"></div>
						</div>
						<div id="dnn_ctr4192_ContentPane" class="index-266-mk-content"><!-- Start_Module_4192 -->
						<div id="dnn_ctr4192_ModuleContent">
						<div id="dnn_ctr4192_HtmlModule_lblContent" class="Normal">
							<div class="sinochem-index-download-module">
					<div class="sinochem-index-download-module-module">
				 		<!--  交流互动-->
				 			<div id="Content-4193">
		<div class="sinochem-index-hdjl-module">
			<div class="sinochem-index-hdjl-module-module">
				<table width="100%" cellpadding="0" cellspacing="0" border="0">
					<tbody>
						<tr>
							<td><div class="sinochem-index-hdjl-item">
									<div class="sinochem-index-hdjl-item-pic">
										<a href="#" target="_blank"
											title="咨询建议"><img border="0" alt="咨询建议"
											src="<%=basePath %>static/resource/images/635926977172285156.jpg"></a>
									</div>
									<div class="sinochem-index-hdjl-item-title">
										<a href="#" class="news-title"
											target="_blank" title="咨询建议">咨询建议 </a>
									</div>
								</div></td>
							<td><div class="sinochem-index-hdjl-item">
									<div class="sinochem-index-hdjl-item-pic">
										<a href="#" target="_blank"
											title="网上调查"><img border="0" alt="网上调查"
											src="<%=basePath %>static/resource/images/635926977088300781.jpg"></a>
									</div>
									<div class="sinochem-index-hdjl-item-title">
										<a href="#" class="news-title"
											target="_blank" title="网上调查">网上调查 </a>
									</div>
								</div></td>
						</tr>
						<tr>
							<td><div class="sinochem-index-hdjl-item">
									<div class="sinochem-index-hdjl-item-pic">
										<a href="#" target="_blank"
											title="在线办公"><img border="0" alt="在线办公"
											src="<%=basePath %>static/resource/images/635926976884814453.jpg"></a>
									</div>
									<div class="sinochem-index-hdjl-item-title">
										<a href="#" class="news-title"
											target="_blank" title="在线办公">在线办公 </a>
									</div>
								</div></td>
							<td><div class="sinochem-index-hdjl-item">
									<div class="sinochem-index-hdjl-item-pic">
										<a href="#" target="_blank"
											title="常见问答"><img border="0" alt="常见问答"
											src="<%=basePath %>static/resource/images/635926976789814453.jpg"></a>
									</div>
									<div class="sinochem-index-hdjl-item-title">
										<a href="#" class="news-title"
											target="_blank" title="常见问答">常见问答 </a>
									</div>
								</div></td>
						</tr>
						<tr>
							<td><div class="sinochem-index-hdjl-item">
									<div class="sinochem-index-hdjl-item-pic">
										<a href="#" target="_blank"
											title="Email订阅"><img border="0" alt="Email订阅"
											src="<%=basePath %>static/resource/images/635926976537148437.jpg"></a>
									</div>
									<div class="sinochem-index-hdjl-item-title">
										<a href="#" class="news-title"
											target="_blank" title="Email订阅">Email订阅 </a>
									</div>
								</div></td>
								<td><div class="sinochem-index-hdjl-item">
									<div class="sinochem-index-hdjl-item-pic">
										<a href="#" target="_blank"
											title="监督热线"><img border="0" alt="监督热线"
											src="<%=basePath %>static/resource/images/635926976241269531.jpg"></a>
									</div>
									<div class="sinochem-index-hdjl-item-title">
										<a href="#" class="news-title"
											target="_blank" title="监督热线">监督热线 </a>
									</div>
								</div></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div id="Globalstech_AjaxLoadingPanel_4193"
		class="RadAjax RadAjax_Silk" style="display:none;">
		<div class="raDiv"></div>
		<div class="raColor raTransp"></div>
	</div>
			 <!-- 交流互动end -->	
					</div>
					</div>
					
						</div>
					
					</div><!-- End_Module_4192 --></div>
						<div class="index-266-mk-bottom">
							<div class="index-266-mk-bottom-left"></div>
							<div class="index-266-mk-bottom-middle"></div>
							<div class="index-266-mk-bottom-right"></div>
							<div class="clearB"></div>
						</div>
					</div>

				</div>
		
		
		</div>
			
	<!-- 下载中心  end-->
 
	<!-- 远元展厅 end -->
	
	
	
	<!--主体内容 结束-->
	<!--第五行频道 结束-->
		 
	 <div class="footer">
	    <div class="in">
		        <div class="nag">
		            <div class="e e_first">
<!-- 		            <label>销售热线：</label> -->
<!-- 		                <br> -->
		                <label>客户热线：</label>
		                400-029-0303<br>029-87519238<br>
		                <label>Email：</label>
		                	<a href="#" >liyan@zhengyuanyuan.com</a>（个人）
		                <br>
		                	<a href="mailto:duping205418@126.com">hr@zhengyuanyuan.com</a>（公司）
		            </div>
		            <div class="e">
		                <strong>简介</strong><br>
		                <a  href="#"  target="_blank">关于我们</a><br>
		                <a href="#"  target="_blank">服务声明</a><br>
		                <a href="#"  target="_blank">媒体报道</a><br>
		                <a href="#"  target="_blank">Investor Relations</a>
		            </div>
		            <div class="e">
		                <strong>合作</strong><br>
		                <a href="#"  target="_blank">加入我们</a><br> 
		                <a href="#"  target="_blank">联系我们</a><br>
		                <a href="#" target="_blank">友情链接</a>
		            </div>
		            <div class="e">
		                <strong>帮助</strong><br>
		                <a href="#" target="_blank">帮助中心</a><br>
		                <a href="#" target="_blank">常见问题</a><br>
		                <a href="#" target="_blank">新手引导</a>
		            </div>
		            <div class="e">
		                <strong>导航</strong><br>
		                <a href="#" target="_blank">网站地图</a><br>
		                <a href="#" target="_blank">相关搜索</a><br>
		                <a href="#" target="_blank">下载中心</a>
		            </div>
		            <div class="code c_first">
		                <img width="80" height="80" src="<%=basePath %>static/resource/images/app_download.png" alt="APP下载">
		                <span><a href="#">APP下载</a></span>
		            </div>
		            <div class="code">
		                <img width="80" height="80" src="<%=basePath %>static/resource/images/app_download.png" alt="官方微信">
		                <span>官方微信</span>
		            </div>
		            
		            <div class="clear"></div>
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
			<span><a href="#" target="_self">远元集团</a>&nbsp;版权所有&nbsp;2014-2019&nbsp;ICP备888888888号&nbsp;</span>
		</div>
	</div>
	<!--右侧导航-->
	 <div id="panel" style="display: none;" >
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
			<img src=".<%=basePath %>static/resource/images/1441951067.png">
			</div> 
			
			</li>
		</ul>  
	</div>
	 <div class="index_cy"></div>
	<!--gotop end-->  
	<!-- 底部版权 结束-->
	
	<script type="text/javascript">
 
      
      if(!window.slider) {
    		var slider={};
    	}

    		slider.data= [
    		{
    			"id":"slide-img-1", // 与slide-runner中的img标签id对应
    			"client":"",
    			"desc":"" //这里修改描述
    		},
    		{
    			"id":"slide-img-2",
    			"client":"",
    			"desc":""
    		},
    		{
    			"id":"slide-img-3",
    			"client":"",
    			"desc":""
    		},
    		{
    			"id":"slide-img-4",
    			"client":"",
    			"desc":""
    		},
    		{
    			"id":"slide-img-5",
    			"client":"",
    			"desc":""
    		} 
    		];
 
	  
	  var myPlayer =  videojs("my-player",{  
		  // techOrder: ["flash","html5"],
			  "autoplay":true,
			  controlBar: {
				    muteToggle: false,
				    FullscreenToggle:false,
				    captionsButton: false,
			        chaptersButton : false,
			        liveDisplay:true,
			        playbackRateMenuButton: false,
			        subtitlesButton:false
				  }
		  }).ready(function(){  
	         var myPlayer = this;
	         myPlayer.play(); 
	    });

	
	$("header nav .icon_menu").click(function(){
		$(this).siblings("ul").toggleClass("show");
	});
	
	$("#panel .icons li").not(".up,.down").mouseenter(function(){
		$("#panel .info").addClass('hover');
		$("#panel .info li").hide();
		$("#panel .info li."+$(this).attr('class')).show();
	});
	$("#panel").mouseleave(function(){
		$("#panel .info").removeClass('hover');
	})
	$(".icons .up").click(function(){
		$.fn.ronbongpage.moveSectionUp(); 
	});
	$(".icons .down").click(function(){
		$.fn.ronbongpage.moveSectionDown(); 
	});
	 $(".index_cy").click(function(){
	    $("#panel").toggle();
		$(".index_cy").addClass('index_cy2');
		$(".index_cy2").removeClass('index_cy');
	});

</script>
	
</body>
</html>
