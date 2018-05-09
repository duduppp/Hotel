<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
   <title>首页</title>
<script type="text/javascript" src="js/jquery.min.js"></script>
<link rel="icon" href="<%=basePath%>view/images/favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="<%=basePath%>view/images/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="<%=basePath%>view/css/styles.css" type="text/css">
<script type="text/javascript" src="<%=basePath%>view/js/jquery.min.js"></script>
</head>
<body>
  <div class="wrap bc">
    <div class="title tc pr top">
	  <span class="back-btn"></span>用品店
	  <div class="nav-btn">
	    <ul class="pa">
	      <li><a href="content.html">关于我们</a></li>
		  <li><a href="content.html">店长推荐</a></li>
		  <li><a href="">系统展示</a></li>
		  <li><a href="news_list.html">新闻动态</a></li>
		  <li><a href="">成功案例</a></li>
	    </ul>
	  </div>
	</div>
	<div class="logo oh tc mt10">
	   <img src="<%=basePath%>view/uploads/logo.png" />
	</div>
	<ul class="nav title mt10">
	  <li><a href="<%=basePath%>view/content.html">关于我们</a></li>
	  <li><a href="<%=basePath%>view/content.html">店长推荐</a></li>
	  <li><a href="#">上传病历</a></li>
	  <li><a href="<%=basePath%>view/news_list.html">新闻动态</a></li>
      <li><a href="" class="last">成功案例</a></li>
	</ul>
	<div class="banner oh mt10 pr">
	  <ul class="pr">
	    <li><a href=""><img src="<%=basePath%>view/uploads/banner.gif"/></a></li>
		<li><a href=""><img src="<%=basePath%>view/uploads/banner.gif"/></a></li>
		<li><a href=""><img src="<%=basePath%>view/uploads/banner2.gif"/></a></li>
	  </ul>
	  <div class="focus pa">
	    <span class="pa"></span>
	  </div>
	</div>
	<div class="title mt10 pr">
	  <h2>今日特惠<a href="<%=basePath%>view/list.html" class="more pa"><span class="hidden">更多</span></a></h2>
	</div>
	<div class="products">
	  <ul>
	    <li>
		  <a href="<%=basePath%>view/pro_detail.html"><img src="<%=basePath%>view/uploads/product.gif"></a>
		  <h4>四倍蚕丝凝白柔肤</h4>
		  <h6><span>RMB</span>890</h6>
		</li>
		<li>
		  <a href="<%=basePath%>view/pro_detail.html"><img src="<%=basePath%>view/uploads/product.gif"></a>
		  <h4>xxxxx</h4>
		  <h6><span>RMB</span>891</h6>
		</li>
		<li>
		  <a href="<%=basePath%>view/pro_detail.html"><img src="<%=basePath%>view/uploads/product.gif"></a>
		  <h4>xxxxx</h4>
		  <h6><span>RMB</span>892</h6>
		</li>
		<li>
		  <a href="<%=basePath%>view/pro_detail.html"><img src="<%=basePath%>view/uploads/product.gif"></a>
		  <h4>xxxx</h4>
		  <h6><span>RMB</span>893</h6>
		</li>
		<li>
		  <a href="<%=basePath%>view/pro_detail.html"><img src="<%=basePath%>view/uploads/product.gif"></a>
		  <h4>xxxx</h4>
		  <h6><span>RMB</span>894</h6>
		</li>
		<li>
		  <a href="<%=basePath%>view/pro_detail.html"><img src="<%=basePath%>view/uploads/product.gif"></a>
		  <h4>xxxx</h4>
		  <h6><span>RMB</span>895</h6>
		</li>
	  </ul>
	</div>
	<div class="links mt10 oh cb">
	  <ul class="tc">
	    <li><a href="<%=basePath%>view/list.html">补水保养</a></li>
		<li><a href="<%=basePath%>view/list.html">身体洗护</a></li>
		<li><a href="<%=basePath%>view/list.html">彩妆香水</a></li>
		<li><a href="<%=basePath%>view/list.html">补水保养</a></li>
		<li><a href="<%=basePath%>view/list.html">身体洗护</a></li>
		<li><a href="<%=basePath%>view/list.html">彩妆香水</a></li>
	  </ul>
	</div>  
	<div class="footer mt10 tc">
	  <p class="support">技术支持：杜平</p>
	</div>
  </div> 
  <script type="text/javascript" src="<%=basePath%>view/js/script.js"></script>
<div style="display:none"></div>
</body>
</html>