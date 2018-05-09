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
<script type="text/javascript" src="<%=basePath %>static/resource/assert/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=basePath %>static/resource/assert/js/common.js"></script>
<script type="text/javascript" src="<%=basePath %>static/resource/assert/js/jquery.SuperSlide.js"></script>
<!--[if lte IE 6]>
	<script type="text/javascript" src="/App/Tpl/Home/Default/Public/js/minmax.js"></script>
	<script type="text/javascript" src="/App/Tpl/Home/Default/Public/js/pngfix.js"></script>
	<script language="javascript" type="text/javascript">EvPNG.fix("#logo img");</script>
	<![endif]
-->
<script>
	$(document).ready(
	function (e) {
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
		远元必胜</strong></span>
		
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
					<li><a class="ChannelName" href="/" target="_self"><img src="<%=basePath %>static/resource/images/icon-6.png">网站首页</a></li>
					<li><a class="ChannelName" href="/aboutus.html" target="_self">关于我们</a>
						<div class="info_wrap_main">
							<div class="info_wrap">
								<div class="Channel_wrap">
									<span class="ChannelName1">关于我们</span>
									<p>远元集团有限公司成立于2005年1月18日，是某某市委、市政府加快首都国有资本战略调整、做大做强少数关键企业，对某某（实业）集团有限公司、某某控股有限公司和某某市燃气集团有限责任公司进行联合重组而成立的国有独资公司，
										是某某市最大的国有企业之一，也是市委、市政府和市国...</p>
									<a class="more" href="/aboutus.html" target="_self">查看更多</a>
								</div>

								<ul class="subnavigationlist">
									<li><a href="/culture.html">企业文化</a></li>
									<li><a href="/fzzj.html">发展足迹</a></li>
									<li><a href="/honor.html">资质荣誉</a></li>
									<li><a href="/organization.html">组织机构</a></li>
								</ul>
								<div class="right_info">
									<img src="<%=basePath %>static/resource/images/1482544791.jpg" title="关于我们" alt="关于我们" />
									<p>集团发展已经驶入了快车道，连续多年保持着高速增长，引起社会各界的持续关注</p>
								</div>
							</div>
						</div></li>
					<li><a href="/product.html" target="_self"
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
									<li><a href="/class1.html">专业修脚连锁</a></li>
									<li><a href="/class2.html">生物制药</a></li>
									<li><a href="/class3.html">远元传媒</a></li>    
									<li><a href="/class4.html">地产公司</a></li> 
									<li><a href="/class4.html">远元商学院</a></li>
								</ul>    
								<div class="right_info">
									<img src="<%=basePath %>static/resource/images//1482545990.jpg" title="业务领域" alt="业务领域" />
									<p>某某公司致力于打造成为中国工程机械设备与重型车辆在海外的集产品、服务和技术支持于一体的全方位综合解决方案提供商。</p>
								</div>
							</div>
						</div></li>
					<li><a class="ChannelName" href="/wlyfw.html" target="_self">IC卡服务</a>
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
									<li><a href="/yxwl.html">营销网络</a></li>
									<li><a href="/jtfw.html">集团服务</a></li>
								</ul>
								<div class="right_info">
									<img src="<%=basePath %>static/resource/images//1482546174.jpg" title="网络与服务" alt="网络与服务" />
									<p>业务范围涉及全球多个国家，市场占有率，品牌影响力、贸易额增长速度、服务网络的覆盖范围、服务质量等方面已成为同行业的翘楚。</p>
								</div>
							</div>
						</div></li>
					<li><a class="ChannelName" href="/news.html" target="_self">新闻动态</a>
						<div class="info_wrap_main">
							<div class="info_wrap">
								<div class="Channel_wrap">
									<span class="ChannelName1">新闻动态</span>
									<p>聚焦集团新闻，熟悉行业动态，第一时间了解您身边的集团。</p>
									<a class="more" href="/news.html" target="_self">查看更多</a>
								</div>
								<ul class="subnavigationlist">
									<li><a href="/companynews.html">公司新闻</a></li>
									<li><a href="/industrytrends.html">行业动态</a></li>
									<li><a href="/jtyx.html">集团影像</a></li>
									<li><a href="/yxhd.html">营销活动</a></li>
								</ul>
								<div class="right_info">
									<img src="<%=basePath %>static/resource/images//1483001125.jpg" title="新闻动态" alt="新闻动态" />
									<p>集团坚持“合作创造财富、创新谋求发展”的经营理念，力求为社会、为企业、为员工创造和谐的氛围，走持续发展的道路。
									</p>
								</div>
							</div>
						</div></li>
					<li><a class="ChannelName" href="/case.html" target="_self">人力资源</a>
						<div class="info_wrap_main">
							<div class="info_wrap">
								<div class="Channel_wrap">
									<span class="ChannelName1">人力资源</span>
									<p>
										我们的团队拥有多元化的专业和文化背景，我们深刻理解中国及其他海外市场的商业环境，这是我们在国际化商业舞台成功运作的关键。同时，我们也认识到人才对于集团发展的重要性，
										因此，我们一直致力于为优秀人才创造最佳的工作与发展平台。通过多年的实践和发展，我们更加深刻认识到，骨干团队...</p>
									<a class="more" href="/case.html" target="_self">查看更多</a>
								</div>
								<ul class="subnavigationlist">
									<li><a href="/rczl.html">人才战略</a></li>
									<li><a href="/rcpx.html">人才培训</a></li>
									<li><a href="/job.html">人才招聘</a></li>
								</ul>

								<div class="right_info">
									<img src="<%=basePath %>static/resource/images/1482546361.jpg" title="人力资源" alt="人力资源" />
									<p>我们一直致力于为优秀人才创造最佳的工作与发展平台</p>
								</div>
							</div>
						</div></li>
					<li><a class="ChannelName" href="/guestbook.html"
						target="_self">在线留言</a></li>
					<li><a class="ChannelName" href="/contactus.html"
						target="_self">联系我们</a></li>
				</ul>
			</div>
			<!--导航条 结束-->
		</div>
	</div>
	 
	<!--Logo 结束-->
	<!--Flash幻灯片 开始-->
	<!--
			<div id="banner_main"><div id="banner"></div></div>-->
	<!--Flash幻灯片 结束-->
	<!--JS幻灯片 开始-->
	<div id="banner_main">
		<!--幻灯片 开始-->
		<div id="banner">
			<ul class="bannerlist">
				<li style="background:; ">
					<a href="https://www.baidu.com/" target="_blank"><img src="<%=basePath %>static/resource/images/1.jpg" /></a>
				</li>
				<li style="background:; ">
					<a href="https://www.baidu.com/" target="_blank"><img src="<%=basePath %>static/resource/images/2.jpg" /></a>
				</li>
				<li style="background:; ">
					<a href="https://www.baidu.com/" target="_blank"><img src="<%=basePath %>static/resource/images/3.jpg" /></a>
				</li>
				<li style="background:; ">
					<a href="https://www.baidu.com/" target="_blank"><img src="<%=basePath %>static/resource/images/4.jpg" /></a>
				</li>
				<li style="background:; ">
					<a href="https://www.baidu.com/" target="_blank"><img src="<%=basePath %>static/resource/images/6.jpg" /></a>
				</li>
			</ul>
		</div>
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
							<li> <a href="/show-6-1637.html ">【春节休假】关于远元集团春节休假通知</a><span> 2017-01-14</span></li>
							<li> <a href="/show-6-1524.html ">【5.1】关于远元集团 2016 国庆休假通知</a><span> 2016-09-30</span></li>
						</ul>
					</div>
					<div class="in_news_p_3">
						<a href="/list-6.html"></a>
					</div>
			 </div>
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
			effect: 'left'
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
		$(".bannerlist li img").css("margin-left", offset + 'px');
	}
	</script>
	<!--JS幻灯片 结束-->
	<div class="subchannel_main">
		<div class="subchannel">
			<ul class="subchannellist">

				<li class="depth1"><a href="/class1.html">专业修脚连锁</a></li>
				<li class="depth1"><a href="/class2.html">脚病修护</a></li>
				<li class="depth1"><a href="/class3.html">生物制药</a></li>
				<li class="depth1"><a href="/class4.html">地产公司</a></li>
				<li class="depth1"><a href="/class5.html">免费培训学校</a></li>
			</ul>

		</div>
	</div>
	<script>
		$(".subchannellist li").last().css("border-right", "none");
	</script>
	<!--主体内容 开始-->
		<div id="dnn_ContentTP2Pane" class="content_t_p2">
				
				<div class="DnnModule DnnModule-GTModulesCMS DnnModule-4142"><a id="4142" name="4142" class="module"></a>
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
		<div class="i-news-content"><table width="100%" cellpadding="0" cellspacing="0" border="0"><tbody><tr><td>

		<div class="i-news-item" style="display: none;">
		<div class="i-news-item-pic">

		<a href="http://www.sinochem.com/s/1375-4142-56129.html" target="_blank" title="宁高宁董事长出席APEC工商咨询理事会2017年第一次会议"><img border="0" alt="宁高宁董事长出席APEC工商咨询理事会2017年第一次会议" src="./中国中化集团公司 _ 中化集团 _ SINOCHEM_files/636239636041559169.jpg"></a></div>
		<div class="i-news-item-title"><a href="http://www.sinochem.com/s/1375-4142-56129.html" class="news-title" target="_blank" title="宁高宁董事长出席APEC工商咨询理事会2017年第一次会议">宁高宁董事长出席APEC工商咨询理事会2017年第一次会议
		</a></div>
		</div></td></tr><tr><td><div class="i-news-item  i-news-item-alt i-news-item-active" style="display: block;">
		<div class="i-news-item-pic"><a href="http://www.sinochem.com/s/1375-4142-56127.html" target="_blank" title="张伟总裁调研管理创新工程进展">
		<img border="0" alt="张伟总裁调研管理创新工程进展" src="./中国中化集团公司 _ 中化集团 _ SINOCHEM_files/636239642559105604.jpg"></a></div>
		<div class="i-news-item-title"><a href="http://www.sinochem.com/s/1375-4142-56127.html" class="news-title" target="_blank" title="张伟总裁调研管理创新工程进展">张伟总裁调研管理创新工程进展
		</a></div>
		</div></td></tr><tr><td><div class="i-news-item" style="display: none;">
		<div class="i-news-item-pic"><a href="http://www.sinochem.com/s/1375-4142-56130.html" target="_blank" title="宁高宁董事长赴中化爱农、德美行等中化在泰企业调研"><img border="0" alt="宁高宁董事长赴中化爱农、德美行等中化在泰企业调研" src="./中国中化集团公司 _ 中化集团 _ SINOCHEM_files/636239638922724411.jpg"></a></div>
		<div class="i-news-item-title"><a href="http://www.sinochem.com/s/1375-4142-56130.html" class="news-title" target="_blank" title="宁高宁董事长赴中化爱农、德美行等中化在泰企业调研">宁高宁董事长赴中化爱农、德美行等中化在泰企业调研
		</a></div>
		</div></td></tr><tr><td><div class="i-news-item  i-news-item-alt" style="display: none;">
		<div class="i-news-item-pic"><a href="http://www.sinochem.com/s/1375-4142-56128.html" target="_blank" title="张伟总裁会见道达尔公司营销与服务总裁Momar Nguer"><img border="0" alt="张伟总裁会见道达尔公司营销与服务总裁Momar Nguer" src="./中国中化集团公司 _ 中化集团 _ SINOCHEM_files/636239642748026788.JPG"></a></div>
		<div class="i-news-item-title"><a href="http://www.sinochem.com/s/1375-4142-56128.html" class="news-title" target="_blank" title="张伟总裁会见道达尔公司营销与服务总裁Momar Nguer">张伟总裁会见道达尔公司营销与服务总裁Momar Nguer
		</a></div>
		</div>

		</td>

		</tr>

		</tbody></table>

</div>

<div class="i-news-nav">


<span class="i-news-page" page="1">1</span><span class="i-news-page i-news-page-alt i-news-page-active" page="2">2</span><span class="i-news-page" page="3">3</span><span class="i-news-page i-news-page-alt" page="4">4</span>

</div>
</div></div><div id="Globalstech_AjaxLoadingPanel_4142" class="RadAjax RadAjax_Silk" style="display:none;">
		<div class="raDiv">

		</div><div class="raColor raTransp">

		</div>
	</div>
</div>


<!-- End_Module_4142 -->


</div>
</div></div></div>
	
	
	
	
	
	
	<!--主体内容 结束-->
	<!--第五行频道 结束-->
	<div id="floor_14_main">
		<div id="floor_14">
			<div id="floor_14_1">
				<div class="right_title2">
					<h2>关于我们</h2>
				</div>
				<div class="right_body2">
					<div class="ChannelSContent">
						远元集团有限公司成立于2005年1月18日，是某某市委、市政府加快首都国有资本战略调整、做大做强少数关键企业，对某某（实业）集团有限公司、某某控股有限公司和某某市燃气集团有限责任公司进行联合重组而成立的国有独资公司，是某某市最大的国有企业之一，也是市委、市政府和市国资委规划的首都基础设施和公用事业投融资平台。成立以来，某控集团实现利润总额始终名列某某市属国有企业首位，并入选&ldquo;中国最大500家企业集团&rdquo;、&ldquo;中国企业500强&rdquo;。
						某控集团的主要业务为城市基础设施和公用事业的投资、运营和管理。公司旗下的红筹股公司&mdash;&mdash;某某控股有限公司是某某市最大的海外上市企业，拥有某某燃气集团、首都机场高速路、某某第九水厂和燕京啤酒等众多优质企业。其中，某某燃气集团是全国最...<a href="/yxhd.html" target="_blank">【更多】</a>
					</div>
				</div>
				<div class="right_bottom2"></div>
			</div>
			<div id="floor_14_2">
				<div class="left_title3">
					<h2>联系我们</h2>
				</div>
				<div class="left_body3">
					<div class="contact_wrap1">
						<b class="ico2">电话：</b>010-83486998<br /> <b class="ico3">邮件：</b><a
							class="__cf_email__" href="/cdn-cgi/l/email-protection"
							data-cfemail="daebe8e9eeef9aababf4b9b5b7">[email&#160;protected]</a>
						<script data-cfhash='f9e31' type="text/javascript">
							/* <![CDATA[ */!function (t, e, r, n, c, a, p) {
								try {
									t = document.currentScript
										 || function () {
										for (
											t = document.getElementsByTagName('script'),e = t.length; e--; )
											if (t[e].getAttribute('data-cfhash'))
												return t[e]
									}();
									if (t && (c = t.previousSibling)) {
										p = t.parentNode;
										if (a = c.getAttribute('data-cfemail')) {
											for (e = '', r = '0x' + a.substr(0, 2) | 0, n = 2; a.length- n; n += 2)
												e += '%' + ('0' + ('0x'+ a.substr(n,2) ^ r).toString(16)).slice(-2);
											p.replaceChild(document.createTextNode(decodeURIComponent(e)),c)
										}
										p.removeChild(t)
									}
								} catch (u) {}
							}()
														
							/* ]]> */
						</script>
						<br /> <b class="ico4">地址：</b>西安市大差市佳腾大厦13楼F座<br />
					</div>
				</div>
				<div class="left_bottom3"></div>
			</div>
		</div>
	 <div class="footer">
	    <div class="in">
		        <div class="nag">
		            <div class="e e_first">
<!-- 		            <label>销售热线：</label> -->
<!-- 		                <br> -->
		                <label>客户热线：</label>
		                400-029-0303<br>029-87519238<br>
		                <label>Email：</label>
		                	<a href="mailto:club@51job.com">liyan@zhengyuanyuan.com</a>（个人）
		                <br>
		                	<a href="mailto:hr@51job.com">hr@zhengyuanyuan.com</a>（公司）
		            </div>
		            <div class="e">
		                <strong>简介</strong><br>
		                <a href="http://www.51job.com/bo/AboutUs.php" target="_blank">关于我们</a><br>
		                <a href="http://www.51job.com/bo/service.php" target="_blank">服务声明</a><br>
		                <a href="http://www.51job.com/bo/media/media.php" target="_blank">媒体报道</a><br>
		                <a href="http://ir.51job.com/" target="_blank">Investor Relations</a>
		            </div>
		            <div class="e">
		                <strong>合作</strong><br>
		                <a href="http://www.51job.com/bo/jobs/new_joinus.php" target="_blank">加入我们</a><br>
		                <a href="http://www.51job.com/bo/contact.php" target="_blank">联系我们</a><br>
		                <a href="http://www.51job.com/link.php" target="_blank">友情链接</a>
		            </div>
		            <div class="e">
		                <strong>帮助</strong><br>
		                <a href="http://www.51job.com/help/help.htm" target="_blank">帮助中心</a><br>
		                <a href="http://www.51job.com/help/help.htm" target="_blank">常见问题</a><br>
		                <a href="http://www.51job.com/help/help.htm" target="_blank">新手引导</a>
		            </div>
		            <div class="e">
		                <strong>导航</strong><br>
		                <a href="http://www.51job.com/bo/sitemap.php" target="_blank">网站地图</a><br>
		                <a href="http://search.51job.com/jobsearch/search_result.php" target="_blank">职位搜索</a><br>
		                <a href="http://my.51job.com/cv/CResume/CV_CResumeManage.php" target="_blank">简历中心</a>
		            </div>
		            <div class="code c_first">
		                <img width="80" height="80" src="<%=basePath %>static/resource/images/app_download.png" alt="APP下载">
		                <span><a href="http://www.51job.com/pm/app/index.html">APP下载</a></span>
		            </div>
		            <div class="code">
		                <img width="80" height="80" src="<%=basePath %>static/resource/images/app_download.png" alt="官方微信">
		                <span>官方微信</span>
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
	<!--gotop start-->
	<script type='text/javascript' src='/Public/jquery/common.js'></script>
	<script>
		scrolltotop.controlattrs = {
			offsetx : 20,
			offsety : 150
		};
		scrolltotop.controlHTML = '<img src="/Public/Images/gotop/6.gif" />';
		scrolltotop.anchorkeyword = '#gotop';
		scrolltotop.title = '回顶部';
		scrolltotop.init();
	</script>
	<!--gotop end-->
	<!-- 底部版权 结束-->
</body>
</html>
