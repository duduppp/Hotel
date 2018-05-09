<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<html>
  <head>
    <title>商学院</title>
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />  
	<meta content="yes" name="apple-mobile-web-app-capable" />  
	<meta content="black" name="apple-mobile-web-app-status-bar-style" />  
	<meta content="telephone=no" name="format-detection" />
	
	<link rel="stylesheet" href="<%=basePath %>static/ace/css/bootstrap.css" />
	<link rel="stylesheet" href="<%=basePath %>static/ace/css/font-awesome.css" />
    <link rel="stylesheet" href="<%=basePath %>static/ace/css/ace-fonts.css" />
	<link rel="stylesheet" href="<%=basePath %>static/ace/css/ace.css" class="ace-main-stylesheet" id="main-ace-style" />
	<link href="<%=basePath %>plugins/mobileLayer/need/layer.css" type="text/css" rel="stylesheet">
   	<link href="<%=basePath%>static/edu/css/mobiscroll.custom-2.5.0.min.css" rel="stylesheet" type="text/css" />
 	<link rel="stylesheet" href="<%=basePath %>static/edu/css/style.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath %>plugins/uploadify/Huploadify.css"/>
	<script type="text/javascript">
	  var jsessionid = "<%=session.getId()%>";  //勿删，uploadify兼容火狐用到
    </script>
    <c:import url="username.jsp"></c:import>  
   
	<script type="text/javascript" src="<%=basePath%>static/js/jquery-1.9.1.min.js"></script>  
	<script type="text/javascript" src="<%=basePath%>static/edu/js/tzCheckbox.js"></script>
	<script type="text/javascript" src="<%=basePath %>plugins/layer/layer.js"></script>
	<script type="text/javascript" src="<%=basePath %>plugins/uploadify/jquery.Huploadify.js"></script> 
   <script type="text/javascript" src="<%=basePath%>static/edu/js/jquery.mobile-1.3.0.min.js" ></script>
      <script type="text/javascript" src="<%=basePath%>static/edu/js/mobiscroll.js" ></script>
 <script type="text/javascript" src="<%=basePath%>static/ace/js/ace-extra.js"></script>  
	<script type="text/javascript">
	/**
	   * 打开连接，判断否登录
	   * @param url
	   */
	  function openLink(url){ 
		  
		  if($.trim(userName).length>0){
			  window.location.href=url; 
		  }else{
			  window.location.href="./edu/win_login.jsp";  
		  }
	  } 
		
	 var newjavascript = {
				plugdatetime: function ($dateTxt, type) {
					//var curr = new Date().getFullYear();
		 	var opt = {
					}
					opt.time = {
						preset: 'time'
					};
					opt.date = {
						preset: 'date'
					};
					 
					opt.datetime = { 
						preset: type,
						dateFormat: 'yyyy-mm-dd', // 日期格式
						minDate: new Date(2010, 1, 01, 00, 00),
						maxDate: new Date(2020, 12, 31, 24, 59),
						stepMinute: 1
					}
	 
 
 				
 		$dateTxt.val('').scroller('destroy').scroller(
						$.extend(opt[type], {
							theme: "sense-ui", //android-ics light , sense-ui ,jqm
							mode: "scroller",
							display: "modal",
							lang: "english",
							dateOrder : 'yyyymmdd', 
							yearText: "年",
							monthText: "月",
							dayText: "日",
							hourText: "时",
							minuteText: "分",
						 	ampmText: "上午/下午",
							setText: '确定',
							cancelText: '取消',
							dateFormat: 'yy-mm-dd',
							 
								onSelect:function(valueText,inst){
									editMediaUserByREMINDSTATUS();
							 }
					})); 
				}
			};  
 
	  $(document).ready(function(){
		
		var url="<%=basePath%>getMediaUserCurrent";
		$.ajax({
 			url:url,
 			
 			dataType:'json',
 			success:function(data){ 
 				
  				var userData=data["userData"];
  				
  				$("#userh3id").text(userData.USERNAME);    
 				$("#REMINDLEARNINGid").text(userData.REMINDLEARNING); 
 				$("#SIGNid").text(userData.SIGN);
 				$("#INTEGRALid").text(userData.INTEGRAL+" 分");
 				$("#DONATIONid").text(userData.DONATION+" 元");
 				$("#COUPONid").text(userData.COUPON);
 				var picpath1=userData.PICPATH;
 				if(null==picpath1||$.trim(picpath1)<1){
 					picpath1="<%=basePath%>static/edu/images/user/user01.png";
 				}
 				$("#PICPATHid").attr("src",picpath1); 
 				$("#MEDIAUSER_IDid").val(userData.MEDIAUSER_ID);
 				if(userData.REMINDSTATUS==1){
 					$("#REMINDSTATUSid").attr("checked",userData.REMINDSTATUS);	
 				}
 				$("input[type=checkbox]").tzCheckbox({labels:['开','关']});
 				$("#REMINDLEARNINGid").val(userData.REMINDLEARNING);
 				$("#REMINDSTATUSid").click(); 
 			}
		});
			//时间选择插件
			newjavascript.plugdatetime($("#REMINDLEARNINGid"), "datetime");
			initFile();
	  });
	  
	  var i=0;
	  function showREMINDLEARNING(){
		  
		 var remindstatus=	$("#REMINDSTATUSid").attr("checked");
		 var remindstatusValue=0;
		 if(remindstatus=="checked"){
			 
			 remindstatusValue=1;
		 }
		 var REMINDLEARNING= $('#REMINDLEARNINGid').val();
		 if(remindstatus=="checked"&&""==REMINDLEARNING){
				//展示时间控件
			   $('#REMINDLEARNINGid').mobiscroll('show');   
		 }else{
			  //保存关闭  和有时间并且开启的状态，  如果开启，但没有时间的，则在设定时间后保存
			  if(i>1){
				 
				  editMediaUserByREMINDSTATUS();  
			  }
			i++;
		 }
	  }
		
	  /**
	   * 保存提醒状态    
	   */
	  function editMediaUserByREMINDSTATUS(){
		  
			 var url="<%=basePath%>editMediaUserByREMINDSTATUS";
			 var MEDIAUSER_ID=$("#MEDIAUSER_IDid").val();
			 var REMINDLEARNING= $("#REMINDLEARNINGid").val();
		 	 var REMINDSTATUS=0;
		 	 if($("#REMINDSTATUSid").attr("checked")=="checked"){
		 		REMINDSTATUS=1 
		 	 }
			 $.ajax({
		 			url:url, 
		 			data:{
		 				MEDIAUSER_ID:MEDIAUSER_ID,
		 				REMINDLEARNING:REMINDLEARNING,
		 				REMINDSTATUS:REMINDSTATUS
		 			},
		 			dataType:'json',
		 			success:function(data){ 
		 				
		  				var msg=data["msg"];
		  				var status=data["success"];
		  				if(!!status&&REMINDSTATUS==1){     					 
		  			 
		  					layer.alert("注意学习时间哦！",{
		  						icon: 6,
		  						shadeClose :true,
		  						skin: 'layer-ext-moon',
		  						closeBtn:0,
		  						shift :2,
		  						btn:[]
		  					}); 
		  				}
		 			}
		    });
	  }
	  
	/**
	*
	*选择项
	*/
	function statusClick(){	
		
		if($("#checksta").is(':checked')){
			 $("#checksta").attr("value",1); 
			 $("#STATUS").attr("value",1);
		}else{
			 $("#checksta").attr("value",0); 
			 $("#STATUS").attr("value",0);
		}
		
	}
	
	/**
	*  签到
	*/

	function signMediaUser(){
		
		var url="<%=basePath%>signMediaUser";
		var sign=$("#SIGNid").text();
		var signValue=parseInt(sign)+1; 
		
		var MEDIAUSER_ID=$("#MEDIAUSER_IDid").val();
		$.ajax({
 			url:url,
 			data:{
 				MEDIAUSER_ID:MEDIAUSER_ID, 
 				SIGN:signValue
 			},
 			dataType:'json',
 			success:function(data){ 
 				
  				var msg=data["msg"];
  				var status=data["success"];
  				if(!!status){   					 
  					$("#SIGNid").text(signValue); 
  				}else{
  					layer.alert(msg,{
  						icon: 1,
  						shadeClose :true,
  						skin: 'layer-ext-moon',
  						closeBtn:0,
  						shift :2,
  						btn:[]
  					}); 
  				}
 			}
		}); 
	}
	
	function chatQQ(){  
		var ua = window.navigator.userAgent.toLowerCase();
		var url=""; 
		   var u = navigator.userAgent, app = navigator.appVersion;
		   var mobile=!!u.match(/AppleWebKit.*Mobile.*/); //是否为移动终端
		   if (mobile) { 
			
				layer.open({
					  type: 1,
					  title: '在线客服',
					  closeBtn: 0,
					  shadeClose: true,
					  skin: 'layui-layer-demo',
					  content: '<div >请拨打400-029-0303。</div>'  
				});  
           } else {
                //否则就是PC浏览器打开
                var url="http://wpa.qq.com/msgrd?v=3&uin=1271876110&site=oicqzone.com&menu=yes";   
				window.open(url);     
           }
	} 
	
	function open2Code(){
		
		layer.open({
			  type: 1,
			  title: '二维码',
			  closeBtn: 0,
			  shadeClose: true,
			  skin: 'layui-layer-demo	',
			  content: '<div style="padding:20px;z-index:99999;"><img width="200px" height="170" src="<%=basePath%>static/edu/code2.png" ></div>'
		});  
	}
 function uploadimg(){  
		//先删除 
		 $("#select_btn_1").click();
	}
	
	
 function initFile(){
		<%-- $('#upload').Huploadify({
	        auto:true,
	        fileTypeExts:'image/*,*.gif; *.jpg;*.jpeg; *.png', 
	        multi:false,
	        method: 'post',
	        formData:{"fileNmae":"/uploadFiles/edu/user/"+userName+"/","uploadPath":"/uploadFiles/edu/user/"+userName+"/"},
	        fileSizeLimit:3072,  
	        showUploadedPercent:false,     
	        showUploadedSize:false,
	        removeTimout:9999999,
	        uploader:"<%=basePath%>plugins/uploadify/uploadFile.jsp;jsessionid="+jsessionid+"?folder=/uploadFiles/edu/user/"+userName+"/&uploadPath=/uploadFiles/edu/user/"+userName+"/",
	        onUploadSuccess(file,responseText){ 
	        	  
	        	 updateUserImage(responseText);
	        }
	        
	    });
 --%>
	}
		
	function updateUserImage(imgpath){
		var url="<%=basePath%>updateUserImage";
		var MEDIAUSER_ID=$("#MEDIAUSER_IDid").val(); 
		$.ajax({
 			url:url,
 			data:{
 				MEDIAUSER_ID:MEDIAUSER_ID,  
 				PICPATH:'<%=basePath%>uploadFiles/edu/user/'+userName+'/'+imgpath   
 			},
 			dataType:'json',
 			success:function(data){  
 				$("#PICPATHid").attr("src",'<%=basePath%>uploadFiles/edu/user/'+userName+'/'+imgpath); 
 			}
		});
	}
	
	<%--

	function showFile(){
		
		var ss=$("#uploadify1").val();
		
		 $('#uploadify1').uploadifyUpload(); 
		
	}   --%>

	
	</script>
  </head>
  <body> 
   <div id="title2">
		<a  href="javascript:void(0);" onclick="openLink('<%=basePath%>edu');">
			<span style="text-align: left;float: left;padding-left: 10px;font-size: 22px;cursor:pointer; font-weight: bold;">
		&lt; </span></a>
		<span id="ftitle" style="text-align: center;width: 80%;margin-top: 5px;" >用户中心</span>
	</div>
	
        <div class="maincont">
        	<form action="coursemanager/${msg }.do" name="Form" id="Form" method="post">
	     <div class="userName">
	       	<dl class="names"> 
	       		<dt><img id="PICPATHid" style="cursor: pointer;" onclick="uploadimg();" src="<%=basePath%>static/edu/images/user/user01.png" />
	       		
	       		</dt>
	       		<dd> <h3 id="userh3id"></h3></dd>
	       		<div></div>
 	   		</dl>
	     <div class="shouyi">
		    <dl style="cursor: pointer;" onclick="open2Code();">
		        <dt><a href="javascript:void(0);" >我的捐赠</a></dt>
		        <dd id="DONATIONid">0.00元</dd>
		    </dl>
		    <dl>
		        <dt>我的积分</dt>
		        <dd id="INTEGRALid">0</dd>
		    </dl>
		       <div class="clearfix"></div>
		  </div><!--shouyi/-->
	  </div><!--userName/-->
     </form>
     <ul class="userNav">
      <li>	
      	 <span class="glyphicon-list-alt span1"></span>
      		<a href="javascript:void(0);">我的学习</a>
      </li>
      <div class="height2"></div>
      <div class="state">
         <dl>
          	<dt><a href="javascript:void(0);"  onclick="openLink('./studyRecord.jsp');" ><img src="<%=basePath%>static/edu/images/user/user4.png" /></a></dt>
          	<dd><a href="javascript:void(0);"  onclick="openLink('./studyRecord.jsp');"  >学习记录</a></dd>
         </dl>
         <dl>
          	<dt><a href="javascript:void(0);"  onclick="openLink('myFavorites');"><img src="<%=basePath%>static/edu/images/user/user2.png" /></a></dt>
          	<dd><a href="javascript:void(0);"  onclick="openLink('myFavorites');">我的收藏</a></dd>
         </dl>
         <dl>
          	<dt><a href="javascript:void(0);" ><img src="<%=basePath%>static/edu/images/user/user3.png" /></a></dt>
          	<dd><a href="javascript:void(0);" onclick="openLink('../goShareRecord');" >我的分享</a></dd>   
         </dl>
         <dl>
          	<dt><a href="javascript:void(0);" onclick="signMediaUser();" ><img src="<%=basePath%>static/edu/images/user/user1.png" /></a></dt>
          	<dd><a href="javascript:void(0);" onclick="signMediaUser();" >签到(<span id="SIGNid">0</span>)</a></dd>
         </dl>
         <div class="clearfix"></div> 
      </div><!--state/-->
      <li>
      		<span class="glyphicon-usd span1"></span>
      		<a href="quan.html">我的优惠券 (<span id="COUPONid">0</span>)</a>
      </li>
      <li>
      		<span class="span2 menu-icon fa fa-film"></span>
      		<a  href="javascript:void(0);"  onclick="openLink('./studyRecord.jsp');">浏览历史</a>
      </li>
      <li >
      		<span class="span2 menu-icon fa fa-gavel "></span>
      		 
      			<table stle="width:100%;height:35px;"  >
      				<tr>
      					<td class="lifont" id="showRemaidDateid" style="cursor: pointer;line-height: 35px; ">学习提醒</td>
      					<td class="lifont" style="width: 20%;text-align: center;" >
      						<input type="text" style="width: 150px;" value="2017-12-12 12:12" id="REMINDLEARNINGid">
      					 </td>
      					<td style="width: 35%;line-height: 35px;text-align: center;">
      				  
      					 	<input type="checkbox" class="REMINDSTATUSid"   id="REMINDSTATUSid"  name="ch_effects" data-on="开" data-off="关" />
				   			<input type="hidden" name="STATUS" id="STATUS" value="0" />  
      						<input type="hidden" name="MEDIAUSER_IDid" id="MEDIAUSER_IDid" value="" />
      					</td>
      				</tr>  
      			</table>
      </li>
      <li>
      	  <span class="span2 icon-user-md"></span>
      	  <a  href="javascript:void(0);" onclick="chatQQ();">在线客服</a> 
      </li>
        
	 </ul> 
	 <div id="upload" style="display: none;" >
	  </div> 
     <div class="lrSub"> 
        	<a href="javascript:void(0);" onclick="openLink('<%=basePath%>applogout');" >退出登录</a>
     </div>
     
     <div class="height1"></div>
 
   
    
       
  </body>
</html>
