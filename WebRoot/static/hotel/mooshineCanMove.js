/*
定义一个元素在一个容器中可移动
*/
;
(function($){
	$.fn.mooshineCanMove=function(containers,tgobj,funarg){
		var doc=this[0].ownerDocument;
		var cont=containers||$("body",doc);
		var isbody=false;
		if(containers==undefined||cont[0]==document.body||containers==''||containers=='body')
		{
			isbody=true;
		}
		var target=tgobj||this;
		var shortcut=this;
		var isclick=true;
		var zIn=(typeof funarg)==='function'?funarg():funarg;
		if(target.css('position')!='absolute'&&target.css('position')!='fixed'){
			target.css('position','absolute');
		}
		var fixed=target.css('position')=='fixed'?true:false;
		target.css({'z-Index':zIn});
		//cont.css({position:'relative'});
		shortcut.bind('dragstart',function(evt){//解决360浏览器的拖动问题
				evt.preventDefault();
			});
		shortcut.bind('selectstart',function(evt){
				evt.preventDefault();
			});
		var	canv=null;
		var canMove=false;
		shortcut.bind("mousedown",function(event){
					canMove=true;
					if(canv){
						return;
					}
					var mflag=true;//改变鼠标样式的标识符
					var event=event||window.event;
					var m2flag=true;
					
				   setTimeout(function(){
					   if(m2flag){
						 //console.log('aabb');
						isclick=false;
					   }
				   },500);
					if(event.button==1||event.button==0||event.which==1)//判断是不是鼠标左键按下
				  {
						if('setCapture' in doc.documentElement){
							target[0].setCapture();
						}else{

						}
						target.find('iframe').css('display','none');
						shortcut.css('cursor','move');
						//添加一个透明蒙板，则可移动div是在此蒙板上移动，就可以与固定元素脱离耦合。
						
						if(isbody){
							var mwidth=Math.max(doc.documentElement.scrollWidth,doc.documentElement.clientWidth);
							var mheight=Math.max(doc.documentElement.scrollHeight,doc.documentElement.clientHeight);
							//alert(document.documentElement.scrollHeight+':'+document.body.scrollHeight);
							canv=$('<div class="m-m-canvas"></div>',doc).css({width:mwidth,height:mheight,background:'#ffffff',opacity:'0',position:'absolute','z-Index':zIn-1,left:'0px',top:'0px',display:'block'});
						}else{
							canv=$('<div  class="m-m-canvas"></div>',doc).css({width:'100%',height:'100%',background:'#ffffff',opacity:'0',position:'absolute','z-Index':zIn-1,left:'0px',top:'0px',display:'block'});
						}
						canv.appendTo(cont);
						//canv.focus();
						canv.bind('dragstart',function(evt){//解决360浏览器的拖动问题
							evt.preventDefault();
							evt.stopPropagation();
						});
						canv.bind('selectstart',function(evt){
							evt.preventDefault();
							evt.stopPropagation();
						});
							//在事件内部添加doucument的移动事件，之后松开鼠标时再取消移动事件的绑定。
						$(doc).bind("mouseup",function(){
								canMove=false;
							    m2flag=false;
								//shortcut.unbind('mouseup');
								if(canv!=null){
								shortcut.css('cursor','default');
								shortcut.unbind('mousemove');
								canv.remove();
								canv=null;
								if(!isclick){
									setTimeout(function(){
										isclick=true;
									},200);
								}else{
									isclick=true;
								}
								var _w1_=cont.width();
								var _h1_=cont.height();
								if(!fixed){
								//var _left2=target.position().left/_w1_*100+'%';
								//var _top2=target.position().top/_h1_*100+'%';
								//console.log(_left2+':'+_top2);
								//target.css({left:_left2,top:_top2});
								}
								cont.find('iframe').css('display','block');
								if('setCapture' in document.documentElement){
									target[0].releaseCapture();
								}else{
									
								}
								}
								//$(doc).unbind('mousemove').unbind('mouseup');
							});
						 var dx,dy;
						 if(fixed){
								dx=(event.clientX==undefined)?event.pageX:event.clientX;
								dy=(event.clientY==undefined)?event.pageY:event.clientY;
							 }else{
								dx=((event.clientX==undefined)?event.pageX:event.clientX)+(doc.body.scrollLeft>doc.documentElement.scrollLeft?doc.body.scrollLeft:doc.documentElement.scrollLeft);//因为鼠标位置是相对于屏幕的，所以加上滚动条的值就可以相对整个容器了。
								 dy=((event.clientY==undefined)?event.pageY:event.clientY)+(doc.body.scrollTop>doc.documentElement.scrollTop?doc.body.scrollTop:doc.documentElement.scrollTop);
							}
							//console.log(dx+':'+event.pageX+':'+document.body.scrollLeft);
						//因为IE，chrome，火狐在不同模式下的scrollTOP，的值不同，IE在html5中document.body.scrollTop总为0，而document.documentElement.scrollTop有值
						//所以要判断取两个值中较大的值，才能在浏览器中兼容。
						var _left,_top;
						if(fixed){
							_left=parseInt(target.css('left'));
							_top=parseInt(target.css('top'));
						}else{
						  _left=target.position().left;
						  _top=target.position().top;
						}//保存按下时的坐标和移动div的位置值，
						// console.log(_left+':'+_top);
						var globleW,globeH;
						if(fixed){
							globleW=doc.documentElement.clientWidth;
							globleH=doc.documentElement.clientHeight;
						}else{
						  globleW=canv.width();
						  globleH=canv.height();//蒙板也就是容器的宽高
						}
						//console.log(globleW+':'+globleH);
						 var __w=target.outerWidth();//可移动元素的宽高
						 var __h=target.outerHeight();
						 canv.bind('selectstart',function(evt){//添加禁止选择的事件
							  evt.preventDefault(); 
							});
						/* shortcut.bind('mouseup',function(){//鼠标释放时接触绑定事件
							    m2flag=false;
								canv.remove();
								canv=null;
								shortcut.css('cursor','default');
								shortcut.unbind('mousemove');
								shortcut.unbind('mouseup');
								if(!isclick){
									setTimeout(function(){
										isclick=true;
									},200);
								}else{
									isclick=true;
								}
								var _w1_=cont.width();
								var _h1_=cont.height();
								var _left2=target.position().left/_w1_*100+'%';
								var _top2=target.position().top/_h1_*100+'%';
								//console.log(_left2+':'+_top2);
								target.css({left:_left2,top:_top2});
								//alert(target.position().left);
								cont.find('iframe').css('display','block');
								if('setCapture' in document.documentElement){
									target[0].releaseCapture();
								}else{
									
								}
							});
						 shortcut.bind('mousemove',function(evt){
							
								if(mflag){
									shortcut.css('cursor','move');
									mflag=false;
									}
								var xp=((evt.clientX==undefined)?evt.pageX:evt.clientX)+(document.body.scrollLeft>document.documentElement.scrollLeft?document.body.scrollLeft:document.documentElement.scrollLeft);
								var yp=((evt.clientY==undefined)?evt.pageY:evt.clientY)+(document.body.scrollTop>document.documentElement.scrollTop?document.body.scrollTop:document.documentElement.scrollTop);
								var ddx=parseInt(xp-dx+_left);
								var ddy=parseInt(yp-dy+_top);
								//console.log(ddx+':'+globleW+':'+__w+'鼠标的位置1:'+dx+'鼠标的现在位置'+xp+'左滚动'+document.body.scrollLeft+':左位置：'+_left+'屏幕宽:'+document.body.style.width);
								if(ddx<=0){//保证DIV不可移动出容器外
									ddx=0;
								}
								if(ddx+__w>=globleW){
									ddx=globleW-__w;
								}
								if(ddy<=0){
									ddy=0;
								}
								if(ddy+__h>=globleH){
									ddy=globleH-__h;
								}
								target.css({left:ddx+'px',top:ddy+'px'});//根据鼠标坐标的变化，在按下时的div位置值基础上更改为新的位置值。
								evt.stopPropagation();//组织事件冒泡
								evt.preventDefault();//组织浏览器默认行为
						 });*/
							$(doc).bind("mousemove",function(evt){
								if(!canMove){return;}
								if(mflag){
								shortcut.css('cursor','move');
								mflag=false;
								}
								var xp,yp,ddx,ddy;
								if(fixed){
									xp=(evt.clientX==undefined)?evt.pageX:evt.clientX;
									yp=(evt.clientY==undefined)?evt.pageY:evt.clientY;
								}else{
								 xp=((evt.clientX==undefined)?evt.pageX:evt.clientX)+(doc.body.scrollLeft>doc.documentElement.scrollLeft?doc.body.scrollLeft:doc.documentElement.scrollLeft);
								 yp=((evt.clientY==undefined)?evt.pageY:evt.clientY)+(doc.body.scrollTop>doc.documentElement.scrollTop?doc.body.scrollTop:doc.documentElement.scrollTop);
								}
								 ddx=parseInt(xp-dx+_left);
								 ddy=parseInt(yp-dy+_top);
								//console.log('aa');
								if(ddx<=0){
									ddx=0;
								}
								if(ddx+__w>=globleW){
									ddx=globleW-__w;
								}
								if(ddy<=0){
									ddy=0;
								}
								if(ddy+__h>=globleH){
									ddy=globleH-__h;
								}
								target.css({left:ddx+'px',top:ddy+'px'});
								//evt.stopPropagation();
								//evt.preventDefault();
							});
							//event.stopPropagation();
							
							
					}			
			});
	};
}(jQuery));