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
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${pd.SYSNAME}</title>
<meta name="viewport" content="width=device-width,height=device-height,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta name="format-detection" content="telephone=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
<link type="text/css" href="<%=basePath %>static/hotel/common.css" rel="stylesheet" />
<link rel="stylesheet" href="<%=basePath %>static/hotel/mooshineWindow.css" type="text/css" />
<link type="text/css" href="<%=basePath %>static/hotel/hotel.css" rel="stylesheet" />
<script type="text/javascript" src="<%=basePath %>static/resource/assert/js/jquery-1.7.2.min.js"></script>
<script src='static/hotel/msSlide.js'></script>
<script src='static/hotel/mooshineCanMove.js'></script>
<script src='static/hotel/mooshineWindow.js'></script>
<script src='static/hotel/mooshineWindowTool.js'></script>
<script src='static/hotel/DateEditor.js'></script>
<script src='static/hotel/moPanel.js'></script>
<script src='static/hotel/moPicShow.js'></script>
<script src='static/hotel/moTip.js'></script>
<script src="static/hotel/openMessBox.js"></script>
<script src="static/hotel/hotelscreenfull.js"></script>  
<script type="text/javascript" src="static/jwplayer/jwplayer.js" ></script>
 <script type="text/javascript">
 jwplayer.key="lbsSyNB1/qkm0mFfgr0/h4+4QEne4zfCMN0n0GDc1OOK9dJiaD+zWP5fLJQ=";
 var LoginName='${sessionScope.sessionUser.USERNAME}';
 jQuery.ctx='<%=basePath%>';
 </script>
<script  src="static/hotel/head.js" ></script> 

</head> 
<body>  
<div class='portrait'>
	<div class='portrait-tip'>
		为了更好的体验，请在横屏下体验
	</div>
</div>
<div class="content" data-status="1">
	<div class='content-inner'>
		<div class='adcont2'>
			<div class='container' id='fulls' >
				<div class='blurbg'></div>
				<div class='cont'>
					<div class='inner'>
						<div class='inner-rel'>
							<div class='top clearfix'>
								<div class='title'><div class='title-inner'>
								<div class='hname e_edit theme-hname' style="color: #5D138A;"  data-key="hotelname">XX快捷酒店</div>
								<div class='telphone theme-telphone e_edit' style="color: #5D138A;" data-key="tel" style="min-width: 170px" > 
								全国预订热线:15802912094</div>
								</div></div> 
								<div class='logo theme-logo'></div>
								<div class='weather-cont'>
									<div><span id='p-city' class='theme-city'>西安</span></div>
									<div><span id='weather-ani' class='theme-weather'>晴</span></div>
									<div><span id='pm25' class='theme-pm25'></span></div>
								</div>
							</div>
						 <div class='tips'><span>&nbsp;</span></div> 
							<div class='main '>
								<div class='clearfix main-inner'>
									<div class='price-cont'>
										
										<ul>
											<li class='phead p-ftype theme-headtype'>
											 
												<!---->
											</li>
										</ul>
										<div class='content-cont theme-rmtype'>
										<div class='content-cont-inner'>
									 
										<div class='roomloading'></div>
										</div>
										</div>
										
									</div>
									<div class='pic-cont'>
										<div class='pic-cont-inner'>
											<div class='pic-show'>
												<div class='pic-inner slidecont theme-picbg'>
											 
												 <div id="myElement" style="width: 100%;height: 100%;" >Loading the player...</div>
											 
											 	</div>
											</div>
											<div class='p-time theme-timebg'>
												<div class='p-date'><span id='time-ani' class='theme-hour'><span class='hournum'>15</span>
												<span class='seconddot'><span id='dotcont'>:</span></span><span class='minutenum'>25</span>
												</span>&nbsp;&nbsp;&nbsp;<span class='theme-week' id='p-week'>星期三</span>
												&nbsp;&nbsp;&nbsp;<span class='p-weather theme-date'><span id='date-ani'>2017<br/>06/25</span></span>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class='todaytip' style="margin-top:5px;"><div class='todaytip-out'><div class='todaytip-inner'>
				<div class='e_edit theme-tip'  data-key="remark" style="color:#5D138A;background-color:#fff" 
				data-val=''>
				此价格为当日房价，如需咨询远期房价，请咨询前台。
				</div>
				</div></div></div>
				<div class='bottom' >
					<div class='b-inner clearfix'>
						<ul class='f-left' style="display:none">
							
							<li>天气 <input type='text' data-val='陕西'  value='西安' class='b-text i_edit' data-key="city" id="city" readonly="readonly"></li>
						</ul>
						<ul class='f-right'>
							
							<li class='fullbtn'><a class='b-btn' id="btn-bg" onclick='fullscreenPage()' href="javascript:void(0)">全屏</a></li>
						</ul>
					</div>
				</div>
			</div>  
		</div>
	</div>
</div>

<script type="text/javascript"  src="static/hotel/bottom.js" ></script>
 

 
</body>
</html>