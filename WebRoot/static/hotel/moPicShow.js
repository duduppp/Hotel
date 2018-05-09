/**
 *手机端图片放大展现插件。 
 ***/
(function(mwin,window){
	var defaults={
			skin:'blank',
			wrapper:null,
			cont:null,
			title:"",
			closeicon:true,
			hasbtn:true,
			close:function(){},
			imgs:[]//imgs数组格式{src:urls,cur:true/false},
		};
	var istouch=!!(("ontouchstart" in window) || window.navigator && window.navigator.msPointerEnabled && window.MSGesture || window.DocumentTouch && document instanceof DocumentTouch);
	var touchstart=istouch?'touchstart':'mousedown',
		touchmove=istouch?'touchmove':'mousemove',
		touchend=istouch?'touchend':'mouseup';
	
	var picShow=function(options){
			return new picShow.fn.init(options);
		};
		picShow.fn=picShow.prototype={
				version:'1.0.0.0',
				init:function(config){
					this.config=m$.extend(defaults,config);
					this.loadimg();
					/*var imgstr=this.crimgstr();
					var dotstr=this.initbottom();
					var _h=document.documentElement.clientHeight;
					var str="<div class='mw-picshow-shade' style='height:"+_h+"px;'></div>";
						str+="<div class='mw-picshow-inner' style='height:"+_h+"px;'>";
						str+=imgstr;
						str+=dotstr;
						str+="</div>";
					var picwin=mwin({head:false,context:str,width:'100%'});
					this.mwin=picwin;
					this.DOM=picwin.getDom();
					this.bindevent();*/
				},
				loadimg:function(){
					var con=this.config;
					var imgs=con.imgs;
					var len=imgs.length;
					if(len==0){
						this.showTop();
						return;
					}
					var that=this;
					that.count=0;
					that.canimgs=[];
					//改成递归，保证图片顺序不会因为加载速度而改变
					//for(var i=0;i<imgs.length;i++){
					that.perload(imgs[that.count], len);
					//}
				},
				perload:function(imgobj,len){
					var that=this;
					var con=that.config;
					var im=new Image();
					im.onload=function(){
						that.canimgs.push(imgobj);
						that.count++;
						if(that.count==len){
							con.imgs=that.canimgs;
							delete that.canimgs;
							if(con.imgs.length==0){
								that.showTop();
								return ;
							}
							that.loadCall();
						}else{
							that.perload(con.imgs[that.count], len);
						}
					};
					im.onerror=function(){
						that.count++;
						if(that.count==len){
							con.imgs=that.canimgs;
							delete that.canimgs;
							if(con.imgs.length==0){
								that.showTop();
								return ;
							}
							that.loadCall();
						}else{
							that.perload(con.imgs[that.count], len);
						}
					};
					im.src=imgobj.src;
				},
				checkCur:function(){
					var con=this.config;
					var imgs=con.imgs;
					var flag=false;
					for(var i=0;i<imgs.length;i++){
						if(imgs[i].cur&&!flag){
							flag=true;
						}else{
							if(imgs[i].cur&&flag){
								imgs[i].cur=false;
							}
						}
					}
					if(!flag){
						imgs[0].cur=true;
					}
				},
				showTop:function(){
					var str="<div style='text-align:center;'><div style='display:inline-block;background:rgba(0,0,0,.5);font-size:12px;color:#fff;padding:.4em 1.2em;'>无更多图片</div></div>";
					var mtip=mwin({context:str,head:false,shade:false,wrapper:this.config.wrapper});
					setTimeout(function(){
						mtip.close();
					},1500);
				},
				isfullscreen:function() {
				    var fullscreenEelement = document.fullscreenElement || document.mozFullScreenElement || document.webkitFullscreenElement||document.msFullscreenElement;
					if(fullscreenEelement!=null){
						return true;
					}
					return false;
				},
				loadCall:function(){
					var imgstr=this.crimgstr();
					var dotstr=this.initbottom();
					var con=this.config;
					var _h;
					if(con.cont!=null){
						_h="100%";
					}else{
						if(this.isfullscreen()){
							_h=document.documentElement.clientHeight+"px";
						}else{
					        _h="768px";
						}
					}
					var str=con.cont==null?"<div class='mw-picshow-shade' style='height:"+_h+";'></div>":"";
						str+="<div class='mw-picshow-inner' style='height:"+_h+";'>";
						str+=imgstr;
						str+=dotstr;
						str+=this.initTitle();
						str+=this.initClose();
						str+=this.initBtn();
						str+="</div>";
					if(con.cont!=null){
						con.cont.innerHTML=str;
						this.DOM=con.cont;
					}else{
						var picwin=mwin({head:false,context:str,width:'100%',wrapper:this.config.wrapper,close:this.config.close});
						this.mwin=picwin;
						this.DOM=picwin.getDom();
					}
					this.bindevent();
				},
				crimgstr:function(){
					this.checkCur();
					var con=this.config;
					var imgs=con.imgs;
					var str="";
					if(imgs.length>0){
						for(var i=0;i<imgs.length;i++){
							str+="<div class='mw-picshow-item' data-index='"+(i+1)+"' style='background-image:url("+imgs[i].src+");";
							if(imgs[i].cur){
								str+="left:0%;top:0px;'>";
								this.config.curindex=(i+1);
							}else{
								str+="left:100%;top:0px;display:none;'>";
							}
							str+="</div>";
						}
						return str;
					}else{
						return str;
					}
				},
				initTitle:function(){
					var cont=this.config;
					if(cont.title==undefined||cont.title==''){
						return "";
					}
					var str="<div class='mw-picshow-title'>"+cont.title+"</div>";
					return str;
				},
				initClose:function(){
					if(!this.config.closeicon){
						return "";
					}
					var str="<div class='mw-picshow-close'></div>";
					return str;
				},
				initBtn:function(){
					if(!this.config.hasbtn||this.config.imgs.length<=1){
						return "";
					}
					var str="<div class='mw-picshow-left'></div><div class='mw-picshow-right'></div>";
					return str;
				},
				initbottom:function(){
					var con=this.config;
					var imgs=con.imgs;
					var str="";
					if(imgs.length>1){
						str+="<div class='mw-picshow-dotcont'>";
					for(var i=0;i<imgs.length;i++){
						if(imgs[i].cur){
							str+="<i class='picshow-dot mw-picshow-doted' data-dindex='"+(i+1)+"'></i>";
						}else{
							str+="<i class='picshow-dot mw-picshow-dot' data-dindex='"+(i+1)+"'></i>";
						}
					}
						str+="</div>";
					}
					return str;
				},
				bindevent:function(){
					var that=this,
						DOM=that.DOM;
						that.ismove=false;
						that.startX=0;
						that.endX=0;
						that.eventstart=false;
					var items=m$.find('.mw-picshow-item',DOM);
					for(var i=0;i<items.length;i++){
						m$.bind(items[i],touchstart,function(event){
							that.event_start(this,event);
						});
						m$.bind(items[i],touchmove,function(event){
							that.event_move(this,event);
						});
						m$.bind(items[i],touchend,function(event){
							that.event_end(this);
						});
					}
					if(that.config.closeicon){
					var cls=m$.find(".mw-picshow-close",DOM);
					m$.bind(cls[0],"click",function(){
						 that.animate=false;
						 that.mwin.close();
					});
					}
					if(that.config.imgs.length>1){
					var left=m$.find(".mw-picshow-left",DOM)[0];
					var right=m$.find(".mw-picshow-right",DOM)[0];
					that.refreshbtn();
					m$.bind(left,"click",function(){
						var old=that.config.curindex;
						var preindex=old-1;
						if(preindex<1){
							return ;
						}
						that.config.curindex=preindex;
						that.refreshbtn();
						var items=m$.find('.mw-picshow-item',DOM);
						var afdom,th;
						for(var i=0;i<items.length;i++){
							var aindex=m$.getProperty(items[i],"data-index");
							if(parseInt(aindex)==preindex){
								afdom=items[i];
							}
							if(parseInt(aindex)==old){
								th=items[i];
							}
						}
						if(afdom!=undefined){
						m$.mcss(afdom,{"webkitTransition":"all 0s ease"});
						m$.mcss(afdom,{"MozTransition":"all 0s ease"});
						m$.mcss(afdom,{"msTransition":"all 0s ease"});
						setTimeout(function(){
							m$.mcss(afdom,{left:'100%',display:'block'});
							setTimeout(function(){
								
									that.sycnrodot(preindex);
									//m$.mcss({display:'none'});
									that.animate=false;
							
								m$.mcss(afdom,{"webkitTransition":"all .4s ease",left:'0%'});
								m$.mcss(afdom,{"MozTransition":"all .4s ease",left:'0%'});
								m$.mcss(afdom,{"msTransition":"all .4s ease",left:'0%'});
								m$.mcss(th,{"webkitTransition":"all .4s ease",left:'-100%'});
								m$.mcss(th,{"MozTransition":"all .4s ease",left:'-100%'});
								m$.mcss(th,{"msTransition":"all .4s ease",left:'-100%'});
							},20);
						},20);
						}
					});
					
					m$.bind(right,"click",function(){
						var old=that.config.curindex;
						var preindex=old+1;
						var items=m$.find('.mw-picshow-item',DOM);
						if(preindex>items.length){
							return ;
						}
						that.config.curindex=preindex;
						that.refreshbtn();
						var predom,th;
						for(var i=0;i<items.length;i++){
							var aindex=m$.getProperty(items[i],"data-index");
							if(parseInt(aindex)==preindex){
								predom=items[i];
							}
							if(parseInt(aindex)==old){
								th=items[i];
							}
						}
						if(predom!=undefined){
						m$.mcss(predom,{"webkitTransition":"all 0s ease"});
						m$.mcss(predom,{"MozTransition":"all 0s ease"});
						m$.mcss(predom,{"msTransition":"all 0s ease"});
						setTimeout(function(){
							m$.mcss(predom,{left:'-100%',display:'block'});
							setTimeout(function(){
								
									that.sycnrodot(preindex);
									//m$.mcss(predom,{display:'none'});
									that.animate=false;
								
								
								m$.mcss(predom,{"webkitTransition":"all .4s ease",left:'0%'});
								m$.mcss(predom,{"MozTransition":"all .4s ease",left:'0%'});
								m$.mcss(predom,{"msTransition":"all .4s ease",left:'0%'});
								m$.mcss(th,{"webkitTransition":"all .4s ease",left:'100%'});
								m$.mcss(th,{"MozTransition":"all .4s ease",left:'100%'});
								m$.mcss(th,{"msTransition":"all .4s ease",left:'100%'});
							},20);
						},20);
						}
						
					});
					}
				},
				refreshbtn:function(){
					if(this.config.imgs.length>1){
					var nindex=this.config.curindex;
					var that=this;
					var DOM=that.DOM;
					var items=m$.find('.mw-picshow-item',DOM);
					var left=m$.find(".mw-picshow-left",DOM)[0];
					var right=m$.find(".mw-picshow-right",DOM)[0];
					if(nindex==1){
						m$.addClass(left,"mw-picshow-disabled");
					}else{
						m$.removeClass(left,"mw-picshow-disabled");
					}
					if(nindex==items.length){
						m$.addClass(right,"mw-picshow-disabled");
					}else{
						m$.removeClass(right,"mw-picshow-disabled");
					}
					}
				},
				event_start:function(tg,evt){
					
					var that=this;
					
					var evt=evt||window.event;
					if(evt.preventDefault){
						evt.preventDefault();
					}else{
						evt.cancelBubble=true;
					}
					var ee=('ontouchend' in document)?evt.touches[0]:evt;
					that.startX=that.endX=(ee.clientX==undefined)?ee.screenX:ee.clientX;
					that.ismove=false;
					that.animate=false;
					that.eventstart=true;
				},
				event_move:function(tg,evt){
					var that=this;
					if(!that.eventstart){
						return;
					}
					var evt=evt||window.event;
					var ee=('ontouchend' in document)?evt.touches[0]:evt;
					that.endX=(ee.clientX==undefined)?ee.screenX:ee.clientX;
					that.ismove=true;
				},
				event_end:function(th,evt){
					var evt=evt||window.event;
					
					var that=this,
						DOM=that.DOM;
						if(that.animate){
							return ;
						}
						that.animate=true;
					if(that.ismove){
						var index=m$.getProperty(th,"data-index");
						if(index<=1&&index>=that.config.imgs.length){
							return;
						}
						if(that.endX>that.startX){
							var preindex=parseInt(index)-1;
							this.config.curindex=preindex;
							var items=m$.find('.mw-picshow-item',DOM);
							var predom;
							for(var i=0;i<items.length;i++){
								var aindex=m$.getProperty(items[i],"data-index");
								if(parseInt(aindex)==preindex){
									predom=items[i];
								}
							}
							if(predom!=undefined){
							m$.mcss(predom,{"webkitTransition":"all 0s ease"});
							m$.mcss(predom,{"MozTransition":"all 0s ease"});
							m$.mcss(predom,{"msTransition":"all 0s ease"});
							setTimeout(function(){
								m$.mcss(predom,{left:'-100%',display:'block'});
								setTimeout(function(){
									
										that.sycnrodot(preindex);
										//m$.mcss(predom,{display:'none'});
										that.animate=false;
									
									
									m$.mcss(predom,{"webkitTransition":"all .4s ease",left:'0%'});
									m$.mcss(predom,{"MozTransition":"all .4s ease",left:'0%'});
									m$.mcss(predom,{"msTransition":"all .4s ease",left:'0%'});
									m$.mcss(th,{"webkitTransition":"all .4s ease",left:'100%'});
									m$.mcss(th,{"MozTransition":"all .4s ease",left:'100%'});
									m$.mcss(th,{"msTransition":"all .4s ease",left:'100%'});
								},20);
							},20);
							}
						}else{
							var preindex=parseInt(index)+1;
							this.config.curindex=preindex;
							var items=m$.find('.mw-picshow-item',DOM);
							var afdom;
							for(var i=0;i<items.length;i++){
								var aindex=m$.getProperty(items[i],"data-index");
								if(parseInt(aindex)==preindex){
									afdom=items[i];
								}
							}
							if(afdom!=undefined){
							m$.mcss(afdom,{"webkitTransition":"all 0s ease"});
							m$.mcss(afdom,{"MozTransition":"all 0s ease"});
							m$.mcss(afdom,{"msTransition":"all 0s ease"});
							setTimeout(function(){
								m$.mcss(afdom,{left:'100%',display:'block'});
								setTimeout(function(){
									
										that.sycnrodot(preindex);
										//m$.mcss({display:'none'});
										that.animate=false;
								
									m$.mcss(afdom,{"webkitTransition":"all .4s ease",left:'0%'});
									m$.mcss(afdom,{"MozTransition":"all .4s ease",left:'0%'});
									m$.mcss(afdom,{"msTransition":"all .4s ease",left:'0%'});
									m$.mcss(th,{"webkitTransition":"all .4s ease",left:'-100%'});
									m$.mcss(th,{"MozTransition":"all .4s ease",left:'-100%'});
									m$.mcss(th,{"msTransition":"all .4s ease",left:'-100%'});
								},20);
							},20);
							}
						}
						
					}else{
						if(that.config.cont){
							
						}else{
						  that.animate=false;
						  that.mwin.close();
						}
					}
				},
				sycnrodot:function(dindex){
					var that=this,
						DOM=that.DOM;
						dindex=parseInt(dindex);
					var dots=m$.find(".picshow-dot",DOM);
					for(var i=0;i<dots.length;i++){
						var idx=parseInt(m$.getProperty(dots[i],'data-dindex'));
						if(idx!=dindex&&m$.hasClass(dots[i],"mw-picshow-doted")){
							m$.removeClass(dots[i],"mw-picshow-doted");
							m$.addClass(dots[i],"mw-picshow-dot");
						}
						if(idx==dindex&&!m$.hasClass(dots[i],"mw-picshow-doted")){
							m$.removeClass(dots[i],"mw-picshow-dot");
							m$.addClass(dots[i],"mw-picshow-doted");
						}
							
						
					}
				}
				
		};
		picShow.fn.init.prototype=picShow.fn;
		window.picShow=picShow;
	/**
	 * 加载图片展示插件相关的皮肤Css文件。
	 * **/
	mLoad(function(){
			var script=document.getElementsByTagName("script");
			var _thscript;
			for(var i=0;i<script.length;i++){
				if(script[i].src&&script[i].src.indexOf("moPicShow")!=-1){
					_thscript=script[i].src;
				}
			}
			var me=_thscript.lastIndexOf("/")<0?".":_thscript.substring(0,_thscript.lastIndexOf("/"));	
			var link=m$.createDom("<link rel='stylesheet' type='text/css' href='"+me+"/"+defaults.skin+"_picshow.css'>")[0];
			m$.preappend(link,m$.find("head")[0]);
		});
}(mWin,window));