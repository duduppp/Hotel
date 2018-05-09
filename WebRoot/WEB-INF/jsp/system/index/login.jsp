<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>${pd.SYSNAME}</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

 
<link rel="stylesheet" href="static/login/css/style.css" />
	<script src="static/js/jquery-1.7.2.js"></script>
 <script type="text/javascript" src="static/login/js/cloud.js"></script>

<!-- 软键盘控件start -->
<link href="static/login/keypad/css/framework/form.css" rel="stylesheet" type="text/css"/>
<!-- 软键盘控件end -->
 <style type="text/css">
    /*
   body{
    -webkit-transform: rotate(-3deg);
    -moz-transform: rotate(-3deg);
    -o-transform: rotate(-3deg);
	padding-top:20px;
    }
    */
      .cavs{
    	z-index:1;
    	position: fixed;
    	width:95%;
    	margin-left: 20px;
    	margin-right: 20px;
    }
  </style>
 <script language="javascript">
	$(function(){
		$('#code').keydown(function(e){
			if(e.keyCode==13){
				severCheck(); //处理事件
			}
		 });	
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
	$(window).resize(function(){  
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
    })  
});  
</script> 
</head>
<body style="background-color:#1c77ac; background-image:url(static/login/images/light.png); background-repeat:no-repeat; background-position:center top; overflow:hidden;">

	<c:if test="${pd.isMusic == 'yes' }">
	<div style="display: none">
	    <audio src="static/login/music/fh1.mp3" autoplay=""></audio>
	</div>	
	</c:if>
 
    <div id="mainBody">
      <div id="cloud1" class="cloud"></div>
      <div id="cloud2" class="cloud"></div>
    </div>  


<div class="logintop">    
    <span>欢迎登录后台管理界面平台</span>    
	    <ul>
		    <li></li>
		    <li><a href="#">帮助</a></li>
		    <li></li>
		    </ul>    
		    </div>
		    
		    <div class="loginbody">		    
		    	<span class="systemlogo"></span> 		       
		    <div class="loginbox loginbox1">		    
		    <ul>
		    	<li><input  name="loginname" autocomplete="off" id="loginname" type="text" placeholder="请输入用户名" class="loginuser" value="" /></li>
		    	<li><input type="password" autocomplete="off" name="password" id="password"  placeholder="请输入密码"  class="loginpwd"   value=""/></li>
		    	<li class="yzm">
			    	<span>
			    		<input name="code" id="code" type="text" value="验证码" onclick="JavaScript:this.value=''"/>
			    	</span>
		    		<img style="height:37px;" id="codeImg" alt="点击更换" title="点击更换" src="" />
		    	</li>
		    	<li>
		    		<input name="" type="button" class="loginbtn" value="登录" onclick="severCheck();" />
		    		<label><input name="" type="checkbox" value=""   onclick="savePaw();"  />记住密码</label>
		    		<label><a href="#">忘记密码？</a></label>
		    	</li>
	    </ul>
    </div>
    
    </div>
    
    
    <div class="loginbm">版权所有  2017  <a href="">远元集团 信息化管理中心</a> </div>
	
    
</body>




	 

	<script type="text/javascript">
	function showfh(){
		 
	  
	};
		//服务器校验
		function severCheck(){
		 
			if(check()){
				 
				var loginname = $("#loginname").val();
				var password = $("#password").val();
				var code = "dp1@"+loginname+",dp,"+password+"dp2@"+",dp,"+$("#code").val();
				$.ajax({
					type: "POST",
					url: 'login_login',
			    	data: {KEYDATA:code,tm:new Date().getTime()},
					dataType:'json',
					cache: false,
					success: function(data){
						if("success" == data.result){
							saveCookie();
							window.location.href="main/index";
						}else if("usererror" == data.result){
							$("#loginname").tips({
								side : 1,
								msg : "用户名或密码有误",
								bg : '#FF5080',
								time : 15
							});
							showfh();
							$("#loginname").focus();
						}else if("codeerror" == data.result){
							$("#code").tips({
								side : 1,
								msg : "验证码输入有误",
								bg : '#FF5080',
								time : 15
							});
							showfh();
							$("#code").focus();
						}else{
							$("#loginname").tips({
								side : 1,
								msg : "缺少参数",
								bg : '#FF5080',
								time : 15
							});
							showfh();
							$("#loginname").focus();
						}
					}
				});
			}
		}
	
		$(document).ready(function() {
			changeCode1();
			$("#codeImg").bind("click", changeCode1);
			$("#zcodeImg").bind("click", changeCode2);
		});

		$(document).keyup(function(event) {
			if (event.keyCode == 13) {
				$("#to-recover").trigger("click");
			}
		});

		function genTimestamp() {
			var time = new Date();
			return time.getTime();
		}

		function changeCode1() {
			$("#codeImg").attr("src", "code.do?t=" + genTimestamp());
		}
		function changeCode2() {
			$("#zcodeImg").attr("src", "code.do?t=" + genTimestamp());
		}

		//客户端校验
		function check() {

			if ($("#loginname").val() == "") {
				$("#loginname").tips({
					side : 2,
					msg : '用户名不得为空',
					bg : '#AE81FF',
					time : 3
				});
				showfh();
				$("#loginname").focus();
				return false;
			} else {
				$("#loginname").val(jQuery.trim($('#loginname').val()));
			}
			if ($("#password").val() == "") {
				$("#password").tips({
					side : 2,
					msg : '密码不得为空',
					bg : '#AE81FF',
					time : 3
				});
				showfh();
				$("#password").focus();
				return false;
			}
			if ($("#code").val() == "") {
				$("#code").tips({
					side : 1,
					msg : '验证码不得为空',
					bg : '#AE81FF',
					time : 3
				});
				showfh();
				$("#code").focus();
				return false;
			}
			$("#loginbox").tips({
				side : 1,
				msg : '正在登录 , 请稍后 ...',
				bg : '#68B500',
				time : 10
			});

			return true;
		}

		function savePaw() {
			if (!$("#saveid").attr("checked")) {
				$.cookie('loginname', '', {
					expires : -1
				});
				$.cookie('password', '', {
					expires : -1
				});
				$("#loginname").val('');
				$("#password").val('');
			}
		}

		function saveCookie() {
			if ($("#saveid").attr("checked")) {
				$.cookie('loginname', $("#loginname").val(), {
					expires : 7
				});
				$.cookie('password', $("#password").val(), {
					expires : 7
				});
			}
		}
		
		jQuery(function() {
			var loginname = $.cookie('loginname');
			var password = $.cookie('password');
			if (typeof(loginname) != "undefined"
					&& typeof(password) != "undefined") {
				$("#loginname").val(loginname);
				$("#password").val(password);
				$("#saveid").attr("checked", true);
				$("#code").focus();
			}
		});
		
	 
	</script>
	<script>
		//TOCMAT重启之后 点击左侧列表跳转登录首页 
		if (window != top) {
			top.location.href = location.href;
		}
	</script>
	<c:if test="${'1' == pd.msg}">
		<script type="text/javascript">
		$(tsMsg());
		function tsMsg(){
			alert('此用户在其它终端已经早于您登录,您暂时无法登录');
		}
		</script>
	</c:if>
	<c:if test="${'2' == pd.msg}">
		<script type="text/javascript">
			$(tsMsg());
			function tsMsg(){
				alert('您被系统管理员强制下线');
			}
		</script>
	</c:if>
	 
	<script type="text/javascript" src="static/js/jQuery.md5.js"></script>
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript" src="static/js/jquery.cookie.js"></script>
 
</body>

</html>