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
<link href="<%=basePath %>static/resource/assert/css/subpage.css" rel="stylesheet" type="text/css">

<style type="text/css">
  
       
</style>


<script type="text/javascript">var ctx='<%=basePath%>';</script>
<script type="text/javascript" src="<%=basePath %>static/resource/assert/js/jquery-1.7.2.min.js"></script>
 <script type="text/javascript" src="<%=basePath %>static/resource/assert/js/html5zoo.js"></script>
 
 	<script type="text/javascript" src="<%=basePath %>static/resource/assert/js/chili-1.7.pack.js"></script>
	
	<script type="text/javascript" src="<%=basePath %>static/resource/assert/js/jquery.easing.js"></script>
	<script type="text/javascript" src="<%=basePath %>static/resource/assert/js/jquery.dimensions.js"></script>
	<script type="text/javascript" src="<%=basePath %>static/resource/assert/js/jquery.accordion.js"></script>

 
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
			 
			jQuery('#list1b').accordion({
				autoheight: false,
				active: false
				//animated: 'easeslide'
			});
			
		
	 
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
									<p>远元集团有限公司成立于2005年1月18日，是某某市委、市政府加快首都国有资本战略调整、做大做强少数关键企业，对某某（实业）集团有限公司、某某控股有限公司和某某市燃气集团有限责任公司进行联合重组而成立的国有独资公司，
										是某某市最大的国有企业之一，也是市委、市政府和市国...</p>
									<a class="more" href="#" target="_self">查看更多</a>
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
	 
	<!-- 图 -->
 <div class="topimg-news"></div>
    
	<!--主体内容 开始-->
	<div class="sinochem_content">
		<div id="dnn_LeftPane" class="content_left">
		<!-- 	<div class="l sideNav" id="menu">
					<h2>新闻中心</h2>
				 <ul class="r nav">
		             <li class="first"><a href="http://www.baidu.com" target="_blank">在线产品展厅</a></li>
		             <li><a href="javascript:void(0);"  id="menu_0" class="a" >电气</a></li>				
					 <li><a  href="javascript:void(0);"> 高压开关设备</a></li>
					 <li><a  href="javascript:void(0);"> 中压开关设备</a></li>
					 <li><a  href="javascript:void(0);"> 低压开关设备</a></li>
		             <li class="last" ><a href="javascript:void(0);" >服务网络</a></li>
		        </ul>
		        </div> -->
		        
		        <h2>在线产品展厅</h2>
				<div class="basic" style="margin-left: 2em;" id="list1b">
						<a>产品1</a>   
						<div style="display: none;">
							 
							<span class="menu_a"  >内容1</span>	 
						</div>
						<a>产品2</a>
						<div style="display: none;">
							
								<span class="menu_a"  >这是一个测试</span>
								 
						</div>
						<a>产品2</a>
						<div style="display: none;">
							
								<span class="menu_a"  >这是一个测试</span>
								 
						</div>
						<a>产品2</a>
						<div style="display: none;">
							
								<span class="menu_a"  >这是一个测试</span>
								 
						</div>
						<a>产品2</a>
						<div style="display: none;">
							
								<span class="menu_a"  >这是一个测试</span>
								 
						</div>
						 
					</div>
				 
			</div>
		<div id="dnn_LeftPane" class="content_right">
			<div class="content_right">
				<div class="content_r_breadcrumb">
					<span class="current_position">当前位置：</span>
						<a class="cecep-link-home" href="/">首页</a>><span id="dnn_zhdBREADCRUMB_lblBreadCrumb">
						<a href="" class="SkinObject">新闻中心</a>>
						<a href="" class="SkinObject">集团动态</a>
					</span>
				</div>
			<div class="content_1">
				<table class="normal" border="0" cellspacing="0" cellpadding="3"  align="center">
    <tbody>
        <tr>
            <td align="center" class="sinochem-detail-title">
            <h1 style="line-height:250%"><h1 id="Title">"一粒米的前世今生”网络名人走进科技中心"</h1></h1>
		<h2 style="line-height:250%"></h2>
		
            </td>
        </tr>
	<tr>
		<td align="center" class="news-info" style="position:relative;">
			时间：<span id="PublishTime">2015-03-17</span> &nbsp;&nbsp;&nbsp;&nbsp;
			来源：<span id="Source">远元集团-山西分公司</span>
				<div class="bhs-container"> 
				</div>
			</td>
	</tr>
	<tr>
       <td>
               <div id="article_content" style="margin-top:15px;">
            	   <div id="Content">
	            		<p class="indent">中国青年网北京3月17日电（记者　王洪泽）3月10日，由国家互联网信息办公室，国务院国有资产监督管理委员会联合组织的&ldquo;网络名人走进新国企&rdquo;系列活动&ldquo;一粒米的前世今生&rdquo;走进中化集团下属中国种子集团有限公司（简称&ldquo;中种公司&rdquo;）投资建设的中国种子生命科学技术中心（简称&ldquo;科技中心&rdquo;），主办方邀请的一批长期关注&ldquo;三农&rdquo;、与粮食领域密切相关的网络名人、网络记者和微博网友来到科技中心综合实验楼，与科技中心专家及育种研发人员沟通交流，并在实验室里切身感受了科技育种的前沿与创新，从而深度了解了种业国家队的责任担当以及一线研发人员扎根科研、敢于创新的激情和正能量。</p>
						<p class="indent" style="text-align: center"><img src="/Portals/0/BatchImages/2015/0318/635622734725174502.jpg" alt="" /></p>
						<p style="text-align: center"></p>
						<p class="indent" style="text-align: center"></p>
						<p class="indent" style="text-align: center">科技中心常务副主任黄广伟向网络名人作介绍科技中心基本情。中国青年网记者　王洪泽　摄</p>
						<p class="indent">在科技中心综合实验楼大厅，网络名人、网络记者和微博网友通过科技中心常务副主任黄广伟所作的介绍，全面了解了中种公司投资建设科技中心打造商业化育种平台的发展历程，科技中心团队建设情况、通过集成生物技术与常规育种技术取得的创新成果以及希望通过培育&ldquo;资源节约、环境友好&rdquo;绿色超级农作物新品种实现&ldquo;引领种业潮流，创造绿色价值&rdquo;的宏伟愿景。</p>
						<p class="indent" style="text-align: center"><img src="/Portals/0/BatchImages/2015/0318/635622734887853806.jpg" alt="" /></p>
						<p class="indent" style="text-align: center">科技中心周发松博士向网络名人作介育种芯片情况　。中国青年网记者　王洪泽　摄</p>
						<p class="indent">随后，网络名人、网络记者和微博网友来到基因组育种部，跟随国家&ldquo;千人计划&rdquo;专家获得者、基因组育种部总监周发松博士初步了解了该部门目前正在开展的研发工作、基因组育种技术的核心优势以及其将在商业化育种中发挥出的重要作用。走进实验室，大家立刻被整洁有序的实验室、精密尖端的实验仪器、摆放在实验台上一盆盆待取样的稻苗以及研发人员正在进行的不同环节的实验工作所吸引，大家饶有兴致地与研发人员交流并近距离观看了浸种、催芽、剪叶片（取样）、抽提DNA、利用全球首张水稻全基因组育种芯片进行基因检测等培育一粒种子所需要的一整套室内检测流程，最后，大家来到温室，观察改良后的材料在室内的生长及抗性情况。通过在基因组育种部参观，大家对于基因组育种技术能够将大田育种搬进实验室，实现精准、快速、高效改良育种材料有了更加直观和深刻的体会。</p>
						<p class="indent" style="text-align: center"><img src="/Portals/0/BatchImages/2015/0318/635622735027491793.jpg" alt="" /></p>
						<p class="indent" style="text-align: center">网络名人王克勤与科技中心讨论&ldquo;绿色&rdquo;水稻育种情况。中国青年网记者　王洪泽　摄</p>
						<p class="indent">在座谈交流环节，中种公司战略规划部经理马帅向网络名人、网络记者和微博网友介绍了中种公司根据近期开展的种业10年中长期规划研究进展、结合气候发展趋势、结合研判的国家水稻育种目标与育种策略完善的方向，部署提出的助力国家农业中长期发展的种业科技&ldquo;绿色战略&rdquo;；周发松博士通过生动形象的语言和极具创意的科普动画让大家对一粒稻米的前世今生、全球首张水稻全基因组育种芯片的研制及应用有了更加深入的认识。座谈会最后，网络名人、网络记者和微博网友就科技中心研发实力在国际上所处的水平、研发与市场的结合等问题与育种专家们做了热烈的讨论和交流，并祝愿中种公司能够充分发挥创新科技成果，早日培育出多抗、优质、高产的绿色超级作物新品种，为国家粮食安全做出积极和重要贡献！</p>
						<p></p>
						<p class="indent"></p>
						<p class="indent" style="text-align: center"><img src="/Portals/0/BatchImages/2015/0318/635622735182580664.jpg" alt="" /></p>
						<p class="indent" style="text-align: center">科技中心温室基地的一穗即将成熟&ldquo;绿色&rdquo;水稻。中国青年网记者　王洪泽　摄</p>
				
					</div>
				</div>
				 
            </td>
        </tr>
	<!--<tr>
		<td style="font-weight:bold;color:#017fbc;padding-top:25px;" colspan="3">相关新闻</td>
	</tr>
        <tr>
            <td colspan="3" class="news-xgxw">



<table border="0" cellpadding="0" cellspacing="0" class="relativeList">

</table></td>
        </tr>-->
    </tbody>
</table>

			
			
			</div>
			
		</div>
		
	
	</div>
	</div>
 
	
	
	
 
  
	<!--主体内容  结束-->
		 
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
		                <a href="#" target="_blank">职位搜索</a><br>
		                <a href="#" target="_blank">简历中心</a>
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
