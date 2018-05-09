﻿
// 导航下拉开始
$(document).ready(function(){
	  $('.navigationlist li').mousemove(function(){
	  		// $(this).find('ul').fadeIn(280); //you can give it a speed
			$(this).find('.info_wrap_main').fadeIn(380);
	  });
	  $('.navigationlist li').mouseleave(function(){
	  		$(this).find('.info_wrap_main').fadeOut(380);
			// $(this).find('ul').fadeOut(280);
	  });
	  
	// 头部滚动跟随
	$(window).scroll(function () {
		if ($(window).scrollTop() >120) {
			$("#logo_main").addClass("fixed");
		} else {
			$("#logo_main").removeClass("fixed");
		}
	});		  
	
	// 页面滚动加载动画
	var gIsAnimate = 0;
	SetCurrentNavigation();
	SetInfomation();
	$(window).scroll(function () { SetCurrentNavigation(); SetInfomation(); });
	function SetCurrentNavigation(){
		if( gIsAnimate == 1 ) return;
		$("div[id^='floor_']").each(function(){
			var top = $(this).offset().top  -  $(window).scrollTop()-160; 
			if( top >= 0 ){
				var id = $(this).attr("class");
				$(this).find(".animated").addClass("fadeInUp");
				$("#floor_1 li").removeClass("fadeInUp");
				$("#floor_1 li").addClass("zoomIn");
				return false;
			}
	   });	
     }
    // 内页滚动加载动
	function SetInfomation(){
		if( gIsAnimate == 1 ) return;
		$("div[class^='right_body']").each(function(){
			var top1 = $(this).offset().top  -  $(window).scrollTop()-270; 
			if( top1 >= 0 ){
				var id = $(this).attr("class");
				$(this).find(".animated").addClass("fadeInUp");
				return false;
			}
	   });	
     }
	
});

	// 导航下拉结束
	// 导航追加选中状态标签
   $(window).load(function(){
		$("#navigation").append('<i class="line"></i>');
		$("#navigation li .ChannelName").bind("mouseenter",function() {
		   var line = $("#navigation .line");
     
		    if (line.css("display") == "none") line.show();
		    line.stop().animate({
			   width: $(this).width() + 10,
			   left: parseInt($(this).position().left) + 35 + "px"
		   }, 300)
		})
		$("#navigation").bind("mouseleave", function() {
		   $("#navigation li .current").trigger("mouseenter");
		   $('.info_wrap_main').stop().slideUp('400');
	
		  // 没有当前状态时，离开导航，跟随线消失
		   if($('#navigation li .current').length==0){
			   $("#navigation .line").hide();
		   }
		}).trigger("mouseleave");
  })
  
  function openPage(url){
 	   var newurl = encodeURI(encodeURI(url)); 
 	   window.location.href=newurl;
 		
 	}

