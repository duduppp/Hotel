<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8"> 
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
    <title>用户注册</title>
  	<link rel="stylesheet" type="text/css" href="plugins/layer/mobile/need/layer.css" />
    <link rel="stylesheet" type="text/css" href="static/edu/css/api.css"/>
    <link rel="stylesheet" type="text/css" href="static/ace/css/bootstrap.css" />
	<link rel="stylesheet" type="text/css" href="static/ace/css/font-awesome.css" />
    <script type="text/javascript" src="static/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="plugins/layer/layer.js"></script>
   
    <style type="text/css" >
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
            background-image: url("static/edu/images/ad_close_gray@2x.png");
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
            background-image: url("static/edu/images/login_account@2x.png");
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
    
<script type="text/javascript">

function sendCode(){
	
	var loginname = $("#USERNAME").val();
	var myreg = /^(((13[0-9]{1})|(14[0-9]{1})|(17[0]{1})|(15[0-3]{1})|(15[5-9]{1})|(18[0-9]{1}))+\d{8})$/;    
	var message="";
    if(loginname == ''){
        message = "手机号码不能为空！";
    }
    if(loginname.length !=11){
        message = "请输入有效的手机号码！";
    }if(!myreg.test(loginname)){
        message = "请输入有效的手机号码！";
    } 
    if(message.length>0){
  	  layer.open({
			  type: 1,
			  title: false,
			  closeBtn: 0,
			  shadeClose: true,
			  skin: 'layui-layer-demo',
			  content: '<div style="padding:20px;">'+message+'</div>'
		});  
		return false;   
    }
	
	$.ajax({
		type: "POST",
		url: '<%=basePath %>sendSMS.do',   
    	data: {phone:loginname,tm:new Date().getTime()},   
		dataType:'json',
		cache: false,
		success: function(data){
			$("#mycode").val(data); 
			//5分钟后清除验证码 
			setTimeout(function(){  
				$("#mycode").val("");  	
			},300000);
		}
	});
	timer(60); 
 }


	function timer(time) {
		 var btn = $("#sendCodeBtnId");
		 btn.attr("disabled", true);  //按钮禁止点击
		 btn.text(time <= 0 ? "发送短信" : ("" + (time) + "秒"));
		 var hander = setInterval(function() {
		  if (time <= 0) {
		   clearInterval(hander); //清除倒计时
		   btn.text("发送短信");
		   btn.attr("disabled", false);
		   return false;
		  }else {
		   btn.text("" + (time--) + "秒");
		  }
		 }, 1000);
		
	}
    
    function closeWin() {
       window.location.href="<%=basePath%>edu/"; 
    }
    
    function register(){
    	var mycode=$.trim($("#mycode").val());
    	var code=$.trim($("#code").val());
    	
    	var loginname =$.trim( $("#USERNAME").val());
		var password = $.trim($("#PASSWORD").val());
		var password2 =$.trim( $("#password2").val());
    	if(mycode!=code){
    		layer.open({
				 type: 1,
				  title: false,
				  closeBtn: 0,
				  shadeClose: true,
				  skin: 'layui-layer-demo',
				  content: '<div style="padding:20px;">验证码错误!</div>'
			});
    		return;
    	}
    	if(password!=password2){
    		
    		layer.open({
				 type: 1,
				  title: false,
				  closeBtn: 0,
				  shadeClose: true,
				  skin: 'layui-layer-demo',
				  content: '<div style="padding:20px;">两次输入密码不一致!</div>'
			});
   			return;
    	}
		if( code=="" || loginname=="" || password=="" ){
	   		layer.open({
				 type: 1,
				  title: false,
				  closeBtn: 0,
				  shadeClose: true,
				  skin: 'layui-layer-demo',
				  content: '<div style="padding:20px;">请填写完整信息</div>'
			});  
   			return; 
    	}
		
		  var myreg = /^(((13[0-9]{1})|(14[0-9]{1})|(17[0]{1})|(15[0-3]{1})|(15[5-9]{1})|(18[0-9]{1}))+\d{8})$/;    
		  var message="";
          if(loginname == ''){
              message = "手机号码不能为空！";
          }
          if(loginname.length !=11){
              message = "请输入有效的手机号码！";
          }if(!myreg.test(loginname)){
              message = "请输入有效的手机号码！";
          } 
          if(message.length>0){
        	  layer.open({
 				 type: 1,
 				  title: false,
 				  closeBtn: 0,
 				  shadeClose: true,
 				  skin: 'layui-layer-demo',
 				  content: '<div style="padding:20px;">'+message+'</div>'
 			});  
 			return ;   
          }

    	$.ajax({
			type: "POST",
			url: 'appSysUser/registerUser',
	    	data: {
	    		USERNAME:loginname,
	    		PASSWORD:password,
	    		tm:new Date().getTime()
	    	}, 
			dataType:'json',
			cache: false,
			success: function(data){ 
				if("1" ==data){

					layer.open({
						 type: 1,
						  title: false,
						  closeBtn: 0,
						  shadeClose: true,
						  skin: 'layui-layer-demo	',
						  content: '<div style="padding:20px;">注册成功!</div>'
					});
					window.location.href="<%=basePath%>edu/win_login.jsp"; 
					
					
				}else if("2" == data){  
					layer.open({
						 type: 1,
						  title: false,
						  closeBtn: 0,
						  shadeClose: true,
						  skin: 'layui-layer-demo	',
						  content: '<div style="padding:20px;">用户名已经存在!</div>'
					});
			 
					//$("#loginname").focus();
				} else{
					layer.open({
						 type: 1,
						  title: false,
						  closeBtn: 0,
						  shadeClose: true,
						  skin: 'layui-layer-demo	',
						  content: '<div style="padding:20px;">用户不能注册，请联系管理员!</div>'
					});
				}
			}
			 
		});
	}
    
 function backlogin(){
	
	 window.location.href="<%=basePath%>edu/win_login.jsp";
	 
	 
	 
 }
  
</script>
</head>
<body>
<header>
    <div class="btn cancel" tapmode="" onclick="closeWin()"></div>
    <div class="title">用户注册</div>
    <div class="btn"></div>
</header>
<div class="content">
    <div class="form">
        <div class="input-wrap">
            <i class="user"></i>
            <input type="text" placeholder="手机号" class="txt" name="USERNAME" id="USERNAME" value=""/>
			<input type="hidden" id="mycode" value=""> 
        </div>
        
          <div class="input-wrap" style=" border-bottom: 1px solid #d4d4d4;">
            <i class="icon-phone" style="font-size: 24px;padding-left: 4px;"></i>&nbsp;&nbsp;
            <input type="text" placeholder="输入验证码" class="txt"  id="code" value=""/>
 		 	 <button id="sendCodeBtnId" onclick="sendCode();" class="btn-success" style="width: 100px;height: 30px;">发送短信</button>  
        </div>
         <div class="input-wrap" style=" border-bottom: 1px solid #d4d4d4;">
            <i class="password"></i> 
            <input type="password" placeholder="密码" class="txt" id="PASSWORD" name="PASSWORD" value=""/>
        </div>
        <div class="input-wrap">
            <i class="password"></i>
            <input type="password" placeholder="确认密码" class="txt" id="password2" name="password2" value=""/>

        </div>
      
    </div>
    <p class="find-pwd">&nbsp;</p>

    <div class="button green" id="login" tapmode="" onclick="register();" style="cursor: pointer;" >注册</div>
    
      <div class="button yellow margin-top-25" style="cursor: pointer;" tapmode="" onclick="backlogin()">登录</div>
  
</div>
<div class="bootbox-container"></div>

</body>
</html>