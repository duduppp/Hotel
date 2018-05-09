<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
	  <base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="<%=basePath %>static/edu/css/api.css"/>
    	<link rel="stylesheet" href="<%=basePath %>static/ace/css/bootstrap.css" />
		<link rel="stylesheet" href="<%=basePath %>static/ace/css/font-awesome.css" />
	<link rel="stylesheet" href="<%=basePath %>plugins/layer/mobile/need/layer.css" />	
	
    <script type="text/javascript" src="<%=basePath %>static/ace/js/jquery.js"></script>
    <script src="<%=basePath %>static/ace/js/bootstrap.js"></script>
    <script src="<%=basePath %>static/ace/js/bootbox.js"></script>
    	<script type="text/javascript" src="<%=basePath %>plugins/layer/layer.js"></script>
    <style>
    
   
        body, html {
            height: 100%;
        }

		        body {
            background-image: url(<%=basePath %>static/edu/images/bg.jpg);
            background-repeat: no-repeat;
            background-size: 100%;
        }

        header {
            display: -webkit-box;
        }

        .title {
            -webkit-box-flex: 1;
            text-align: center;
            line-height: 50px;
            font-size: 20px;
        }

        .btn {
            width: 50px;
            height: 50px;
        }

        .cancel {
            background-image: url("<%=basePath %>static/edu/images/ad_close_gray@2x.png");
            background-size: 40px;
            background-repeat: no-repeat no-repeat;
            background-position: center;
        }

        i {
            display: block;
            width: 30px;
            height: 30px;
            background-size: 30px;
            background-repeat: no-repeat no-repeat;
            background-position: center;
        }

        .user {
            background-image: url("<%=basePath %>static/edu/images/login_account@2x.png");
        }

        .password {
            background-image: url("<%=basePath %>static/edu/images/logn_password@2x.png");
        }

        .input-wrap { 
            padding: 10px 0;
            display: -webkit-box;
        }

        .input-wrap:first-child {
            border-bottom: 1px solid #d4d4d4;
        }

        .form {
            background-color: rgba(255, 255, 255, 0.8);
            margin: 40px 20px 0 20px;
            border-radius: 8px;
            padding: 0 10px;
            line-height: 30px;
        }

        .input-wrap input {
            display: block;
            -webkit-box-flex: 1;
            background-color: rgba(255, 255, 255, 0);
            outline: none;
            height: 30px;
        }

        .find-pwd {
            text-align: right;
            margin: 40px;
        }

        .button.green {
            background-color: #36b05e;
        }

        .button {
            display: block;
            color: white;
            margin: 0 40px;
            text-align: center;
            border-radius: 8px;
            height: 40px;
            line-height: 40px;
        }

        .button.yellow {
            background-color: #FF7800;
        }

        .margin-top-25 {
            margin-top: 25px;
        }
        
        .layui-layer-demo{background-color:#eee;}
		.layui-layer-demo .layui-layer-title{border:none; background-color:#333; color:#fff;}
    </style>
    
</head>
<body>
<header>
    <div class="btn cancel" tapmode="" onclick="closeWin()"></div>
    <div class="title">登陆</div>
    <div class="btn"></div>
</header>
<div class="content">
    <div class="form">
        <div class="input-wrap">
            <i class="user"></i>
            <input type="text" placeholder="用户名" class="txt" id="loginname" value=""/>

        </div>
        <div class="input-wrap">
            <i class="password"></i>
            <input type="password" placeholder="密码" class="txt" id="password" value=""/>

        </div>
    </div>
    <p class="find-pwd"><span>找回密码</span></p>

    <div class="button green" id="login" tapmode="" onclick="login();" style="cursor: pointer;" >登录</div>
    <div class="button yellow margin-top-25" style="cursor: pointer;" tapmode="" onclick="register();">注册新用户</div>
</div>
<div class="bootbox-container"></div>
<script src="<%=basePath %>static/edu/js/zepto.min.js"></script>  

<script type="text/javascript">
  
    
    function closeWin() {
       window.location.href="<%=basePath%>edu/"; 
    }
    
    function login(){
    	
		var loginname = $("#loginname").val();
		var password = $("#password").val();
    	var code = "dp1@"+loginname+",dp,"+password+"dp2@"+",dp,duping"; 
    	$.ajax({
			type: "POST",
			url: 'login_login',
	    	data: {KEYDATA:code,tm:new Date().getTime()}, 
			dataType:'json',
			cache: false,
			success: function(data){
			 
				if("success" == data.result){
					window.location.href="<%=basePath%>edu?userName="+loginname;
				}else if("usererror" == data.result){ 
					layer.open({
						 type: 1,
						  title: false,
						  closeBtn: 0,
						  shadeClose: true,
						  skin: 'layui-layer-demo	',
						  content: '<div style="padding:20px;">用户名或密码有误!</div>'
					});
			 
					//$("#loginname").focus();
				} else{
					layer.open({
						  type: 1,
						  title: false,
						  closeBtn: 0,
						  shadeClose: true,
						  skin: 'layui-layer-demo	',
						  content: '<div style="padding:20px;">用户名或密码有误!</div>'
					});
				}
			}
			 
		});
	}
 
 
    function register(){
       window.location.href="<%=basePath%>edu/win_register.jsp";
    }
</script>
</body>
</html>