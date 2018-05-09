/**
 * 
 */

   var requestA = window.requestAnimationFrame || window.webkitRequestAnimationFrame || window.mozRequestAnimationFrame || window.oRequestAnimaitonFrame || function (callback) { return window.setTimeout(callback, 1000 / 60); };
    var tdoc = top.document;
    var isfull = tdoc.webkitIsFullScreen || tdoc.mozFullScreen;
    var barflag = '1' == '1' ? true : false;
    var u = navigator.userAgent;
    var ismobile = u.indexOf("Android") > -1 || u.indexOf("Linux") > -1 || u.indexOf("Mobile") > -1 || u.indexOf("iPad") > -1;
    function resize() {
        if (window == top) {
            var sx = document.documentElement.clientWidth / 1280;
            var sy = document.documentElement.clientHeight / 768;
            $(".content").css({ padding: 0, margin: 0, border: "none" }); 
            if (!isfullscreen() || ismobile) {
                $(".content").css({ "transform": "scale(" + sx + "," + sy + ")" });
            } else {
                $(".content").css({ "transform": "none" });
            }

        } else {
            var sx = document.documentElement.clientWidth / 1330;
            var sy = document.documentElement.clientHeight / 818;
            if (!isfullscreen() || ismobile) {
                $(".content").css({ "transform": "scale(" + sx + "," + sy + ")" });
            } else {
                $(".content").css({ "transform": "none" });
            }
        } 
    }
   
    //@Deprecated  
    function isfullscreen() {
    	
        var fullscreenEelement = document.fullscreenElement || document.mozFullScreenElement || document.webkitFullscreenElement || document.msFullscreenElement;
        if (fullscreenEelement != null) {
            return true;
        }
        return false;
    }
    
    function isSupportFlex() {
    	
        var style = document.documentElement.style;
        var flexarr = ["webkitBoxFlex", "MozBoxFlex", "msFlex", "obox"];
        for (var i = 0; i < flexarr.length; i++) { 
            if (flexarr[i] in style) {
                return true;
            }
        }
        return false;
    }

    var bartime;
    
    //弹幕功能
    function getbarrage() {
    	 
       if (barflag) {
        	bartime = setInterval(function () {
        		
                $.post($.ctx+"barrage/listData.do", {LOGINNAME: LoginName }, function (data) {
                    if (barflag) {
                        for (var i = 0; i < data.length; i++) {
                            if (i > 10) { break; }
                            barrage(data[i].CONTENT); 
                        }
                    }
                }, "json");

            }, 20000);
        }  
    }
    
    function FShandler() {
        if (isfullscreen() || ismobile) {
            if (adtime) {
                clearTimeout(adtime);
                $(".content-inner").find(".ads").stop().css({ left: "100%" });
            }
            adSlide();
            if (!ismobile) {
                $(".content").css({ "transform": "none" });
            }
            $("[contenteditable]").attr("contenteditable", "false");
            $("[contenteditable]").css({ "white-space": "normal" });
            setTimeout(function () {
                $("[contenteditable]").css({ "white-space": "nowrap" });
                $(".theme-tip").css({ display: "inline-block" });
                tipflag = true;
                tipscroll();
            }, 0);


        } else {
            if (adtime) {
                clearTimeout(adtime);
                $(".content-inner").find(".ads").stop().css({ left: "100%" });
            }
            if (!ismobile) {
                $(".todaytip-inner").stop();
                tipflag = false;
                $("[contenteditable]").attr("contenteditable", "true");
                $(".theme-tip[isclone]").remove();
                $(".theme-tip").css({ display: "block", "padding-right": "0px" });
                $(".todaytip-inner").css({ "left": "0px" });

            }
        }
    }
    
    var tipflag = false;
    var tipcanvas;
    var canvas2d;
    var tiptext = "";
    var textwidth;
    var wd;
    var mtm;
    
    //底部文字滚动方法 
    function tipscroll() {
    	
        var contw = $(".todaytip").innerWidth();
        var elew = $(".theme-tip").outerWidth();

        if (elew < contw) {
            return;
        }
        var clone = $(".theme-tip").clone();
        clone.attr("isclone", "true");
        clone.appendTo(".todaytip-inner");
        $(".theme-tip").css({ "padding-right": "120px" });
        $(".todaytip-inner").css({ "left": "0px" });
        wd = $(".theme-tip").outerWidth();
        mtm = (wd / $(".todaytip-out").width()) * 10000;
        if (tipflag) {
            tipscrollAni();
        }

    }
    
    function tipscrollAni() {
        if (!tipflag) { return; }
        $(".todaytip-inner").animate({ left: (-wd) + "px" }, mtm, "linear", function () {
            var first = $(this).children().first();
            first.remove();
            first.appendTo($(this));
            $(this).css({ left: "0px" });
            if (tipflag) {
                tipscrollAni();
            }
        });

    }
    
    //视频和图片展示方法
    function showPlay(playType){
    	
    	
    	if(playType==="图片"){
    		showSlidePic();
    	}
    	if(playType==="视频"){
    	
    		showVideos();
    	}
    	if(playType==="电视"){ 
    		showLiveTV();
    	}
    	
    	if(playType==="直播"){ 
    		showLiveCamera();
    	}
     
    }
    
    function showLiveCamera(){
  	  jwplayer("myElement").setup({
	        'flashplayer': $.ctx+'static/jwplayer/jwplayer.flash.swf',
	         playlist:[{
	        	 file:'http://www.zhengyuanyuan.com:8080/hls/dp.m3u8',
	        	 image:$.ctx+'static/hotel/images/zhibo.jpg'
	          }],
	        'width': '100%',
	        androidhls:"true",
	        'aspectratio':'16:10',
	        autostart:true,//自动播放 
	        allowfullscreen:false,
	    	stretching:"fill",
	    	repeat:"always", 
	        modes:[
	               { type:'flash' }
	           ]
	    }).setFullscreen(false);   
    	
    }
    
    function  showVideos(){
    	
   	 $.getJSON($.ctx+'playlist/getplayVidoes', function (data) {   
         if (data != undefined && data.length && data.length > 0) { 
        	 
        	 var playlist=new Array();
        	    for (var i = 0; i < data.length; i++) { 
        	    	var obj={};
        	    	obj.file=$.ctx+data[i].VIDEOPATH;  
        	    	obj.image=data[i].VIDEOIMG; 
        	    	playlist[i]=obj; 
        	    }
        	  jwplayer("myElement").setup({
        	        'flashplayer':$.ctx+'static/jwplayer/jwplayer.flash.swf',
        	         playlist:playlist,    
        	        'width': '100%',
        	        androidhls:"true",
        	        'aspectratio':'16:10',
        	        autostart:true,//自动播放 
        	        allowfullscreen:false,
        	    	stretching:"fill",
        	    	repeat:"always", 
        	        modes:[
        	               { type:'flash' }
        	           ]
        	    }).setFullscreen(false);   
            }
   	 });
    	  
    }
    
    function  showLiveTV(){ 
    	 $.getJSON($.ctx+'getliveTV', function (data) { 
             if (data != undefined && data.length && data.length > 0) {
             	var str="<embed name='PrismPlayer' id='PrismPlayer' src='http://g.alicdn.com/de/prismplayer-flash/1.2.16/PrismPlayer.swf?vurl="+data[0].SOURCEPATH+"'"+ 
    			"quality='best' allowscriptaccess='always' wmode='Opaque' allowfullscreen='false'"+ 
    			"bgcolor='#000000' type='application/x-shockwave-flash' pluginspage='http://www.macromedia.com/go/getflashplayer' height='100%' width='100%'>";
            	$('.slidecont').html(str); 
             }
    	 });
    }
    
    function showSlidePic(){
    	   //获得轮换图片
        $.getJSON($.ctx+'getHotelPicture?LOGINNAME='+LoginName, function (data) {
          if (data != undefined && data.length && data.length > 0) {
              var img = new Image();
              img.onload = function () {
                  var backsize = "";
                  if (img.width > img.height) {
                      backsize = "background-size:100% auto;"; 
                  }
                  var str = "";
                  for (var i = 0; i < data.length; i++) {  
                      str += "<div class='pic-item theme-picitem' style='background-image:url("+$.ctx+"uploadFiles/hotel/" + data[i].PICPATH + ");" + backsize + "'></div>";
                  }
                  $('.slidecont').html(str);
                  $('.slidecont').msSlide();
              };

              img.onerror = function () {

                  var str = "";
                  for (var i = 0; i < data.length; i++) {
                      str += "<div class='pic-item theme-picitem' style='background-image:url("+$.ctx+"uploadFiles/hotel/" + data[i].PICPATH + ");'></div>";
                  }
                  $('.slidecont').html(str);
                  $('.slidecont').msSlide();
              };
              img.src = data[0].url;
          }
      });
    }
    
    
    
    var index = 0;
    var adtime;
    var adautoflag =  false; 
    //广告滚动方法
    function adSlide() {
        var chd = $(".content-inner").find(".ads");
        chd.each(function (i) {
            $(this).css({ left: "100%" }).attr("index", i);
        });
        adtime = setTimeout(function () {
            if (chd.length > 0 && (isfullscreen() || ismobile)) {
                adtime = setTimeout(function () {
                    adauto();
                }, 18000);
            } else {

            }
        }, 0);

    }
   
   //这里广告的启动和关闭逻辑太复杂麻烦，进行改造。
    function adauto() {
        var chdi = $(".content-inner").find(".ads[index=" + index + "]");
        var chd = $(".content-inner").find(".ads");
        chdi.css({ left: "100%" });
        chdi.animate({ left: "0%" }, function () {
            adtime = setTimeout(function () {
                chdi.animate({ left: "-100%" }, function () {
                    index++;
                    if (index > chd.length - 1) {
                        index = 0;
                    }
                    adtime = setTimeout(function () {
                        adauto();

                    }, 18000);
                });
            }, 5000);
        });

    }
    
    var roomflag = false; //房型滚动标识符。
    function roomtypeScrollinit() {
        var cul = $(".content-cont").find("ul");
        if (cul.length < 2) {
            return;
        } else {
            roomflag = true;
            setTimeout(function () {
                rmScroll();
            }, 7000);
        }
    }
    
    function rmScroll() {
        if (roomflag) {
            var inner = $(".content-cont-inner");
            inner.animate({ top: "-100%" }, function () {
                var felem = $(this).find("ul").first();
                felem.remove();
                felem.appendTo($(this));
                inner.css({ top: "0%" });
                setTimeout(function () {
                    if (roomflag) {
                        rmScroll();
                    }
                }, 7000);
            });
        }
    }
    
    var classarr = ["barrage", "barrage2", "barrage3", "barrage4"];
    function getRandom() {
        var num = Math.floor(Math.random() * 4);
        return num;
    }
    
    function getTop() {
        var num = Math.floor(Math.random() * 35);
        return num + "%";
    }
    
    //弹幕方法。
    function barrage(text) {
        var bar = $("<div class='" + classarr[getRandom()] + "'></div>");
        bar.text(text);
        bar.appendTo($(".content-inner"));
        bar.css({ left: "100%", top: getTop() });
        var lastt = Math.floor(Math.random() * 5000) + 8000;
        bar.animate({ left: -bar.outerWidth() }, lastt, function () {
            bar.remove();
        });
    }


    function exitscreen() {
        var doc = document;
        var exit = doc.exitFullscreen || doc.mozCancelFullScreen || doc.webkitExitFullscreen || doc.msExitFullscreen;
        if (exit) {
            exit.call(doc);

        } else if (typeof window.ActiveXObject !== "undefined") {
            var wscript = new ActiveXObject("WScript.Shell");
            if (wscript !== null) {
                wscript.SendKeys("{F11}");
            }
        }
    }

    function fullscreenPage() {
    	 var element = $(".content")[0];
    	 screenfull && screenfull.request(element);
    }
    
    function showfilter(evt, th) {
        var evt = window.event || evt;
        if (evt.stopPropagation) {
            evt.stopPropagation();
        } else {
            evt.cancelBubble = true;
        }
        var sd = $(th).find(".filter-inner");
        sd.stop();
        sd.slideDown();
    }
    
    function hidefilter(th) {
        var sd = $(th).find(".filter-inner");
        sd.stop();
        sd.slideUp();
    }

    var initFilterstr = '1,2,3';
    var comesource = '2';
    
    function initFilter() {
        var farr = initFilterstr.split(",");
        if (comesource == 1) {
            var wlen = (100 / (farr.length + 1)).toFixed("6") + "%";
            $(".p-fixed").css({ width: wlen });
            $(".p-ftype").find("span[data-index]").css({ display: "none" });
            $(".p-ftype").find("span[data-index]").each(function () {
                var flag = false;
                for (var i = 0; i < farr.length; i++) {
                    if ($(this).attr("data-index") == farr[i]) {
                        flag = true; break;
                    }
                }
                if (flag) {
                    $(this).css({ display: "inline-block", width: wlen });
                }
            });
        } else {
            var width = (100 / $(".phead").find("span").length).toFixed(6) + "%";
            $(".price-item,.ptype").css({ width: width });
        }
        $(".filter-inner").find("input[type='checkbox']").each(function () {
            var level = $(this).parent().attr("data-index");
            for (var i = 0; i < farr.length; i++) {
                if (level == farr[i]) {
                    this.checked = true;
                    break;
                }
            }
        });

    }
    
    function stopPro(evt) {
    	
        if (evt.stopPropagation) {
            evt.stopPropagation();
        } else {
            evt.cancelBubble = true;
        }
        
    }