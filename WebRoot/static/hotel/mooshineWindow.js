;(function($,_){
top.mooshinezIndex=top.mooshinezIndex||1000;//弹窗的zIndex高度，其背后的蒙版在他的zIndex上减1，下一个弹窗在此zIndex上加10，
top.mooshinezCount=top.mooshinezCount||0;//同一个页面打开的弹窗，每打开一个加1，每关闭一个减1，当减为0时充值zIndex变量为10000；
_.moowindow={version:'1'};
$.mooshineWindow=function(options){
var settings=$.extend({
content:'',
move:true,
resize:true,
title:'住哲系统',
close:true,
mode:true,
width:'400px',
height:'300px',
minWidth:'150px',
minHeight:'180px',
url:'',
marginTop:30,
modoler:true,
autosize:false,
callback:null,
ok:null,
fixed:false,
cancel:null,
okcall:null,
cancelcall:null,
head:true,
timeout:0,
vmiddle:true,
init:function(){},
ontop:false
},options);

var _top =function () {
	/*var top = window,
	test = function (name) {
		try {
			var doc = window[name].document;	// 跨域|无权限
			doc.getElementsByTagName; 			// chrome 本地安全限制
		} catch (e) {
			return false;
		};
		
		return window[name].moowindow
		// 框架集无法显示第三方元素
		&& doc.getElementsByTagName('frameset').length === 0;
	};
	
	if (test('top')) {
		mtop = window.top;
	} else {if (test('parent')) {
		mtop = window.parent;
	}}*/
	var pt=window.self;
	var mtop=self;
	while(pt!=window.top){
		if(pt.parent.moowindow&&pt.parent.document.getElementsByTagName('frameset').length===0){
			mtop=pt.parent;
		}
		pt=pt.parent;
	}
	var ftop=settings.ontop?mtop:self;
	return ftop;
}();
var container=$("<div class='mw-container'></div>",_top.document).css({width:settings.minWidth,height:settings.minHeight});
if(settings.head){
var tlt=$("<div class='mw-tlt'></div>",_top.document);
var tlt_context=$("<div class='mw-tltcon'></div>",_top.document).html(settings.title);
tlt_context.appendTo(tlt);
tlt.appendTo(container);
/*阻止选中事件*/
tlt.bind('selectstart',function(evt){
evt.preventDefault();
});
if(settings.head&&settings.close){
var cls=$("<div class='mw-cls'></div>",_top.document).html("&times;");
cls.appendTo(tlt);
cls.bind('mousedown',function(evt){
evt.stopPropagation();
});
cls.bind('click',function(evt){
	
closer();
evt.preventDefault();
});
}
}
var context=$("<div class='mw-content'></div>",_top.document);

context.appendTo(container);
var inframe=null;
if(settings.url!='undefined'&&settings.url!=''){
inframe=$("<iframe src="+settings.url+" frameborder=0 width=100% height=100%></iframe>",_top.document);
context.html(inframe);
}else{	
context.html(settings.content);
var btcon;
if(settings.ok||settings.cancel){
btcon=$('<div class="mw-btn-cont"></div>',_top.document);
btcon.appendTo(context);
}

if(settings.ok){	
	var myok=$('<input type="button" value="确定" class="mw-ok-btn button button-sm button-success" />',_top.document);
	myok.appendTo(btcon);
	if(!settings.cancel){
		myok.css({'margin-right':'0px'});
	}
	myok.bind('click',function(){
		closer();
		if(settings.okcall){
			settings.okcall();
		}
	});
}
if(settings.cancel){
	var mycancel=$('<input type="button" value="取消" class="mw-cancel-btn button button-sm button-default" />',_top.document);
	mycancel.appendTo(btcon);
	mycancel.bind('click',function(){
		closer();
		if(settings.cancelcall){
			settings.cancelcall();
		}
	});
}
}
if(settings.fixed){
	
	container.css({position:'fixed'});
}
var mbody=$('body',_top.document);
var modediv;
if(settings.modoler){
	var mwidth=Math.max(_top.document.documentElement.scrollWidth,_top.document.documentElement.clientWidth);
	var mheight=Math.max(_top.document.documentElement.scrollHeight,_top.document.documentElement.clientHeight);
	var mzz=top.mooshinezIndex-3;
	modediv=$('<div></div>',_top.document).css({width:mwidth,height:mheight,background:'#666',opacity:'0.4',position:'absolute','z-Index':mzz,left:'0px',top:'0px'});
	modediv.appendTo(mbody);
}
container.appendTo(mbody);
container.css({left:0,top:0});
if(settings.url!='undefined'&&settings.url!=''){
	inframe.css({display:'none'});
}
	

//context.css({height:(container.innerHeight()-(tlt==undefined?0:tlt.outerHeight()))});
var mp=Math.max(_top.document.documentElement.scrollTop,_top.document.body.scrollTop);
var ml=Math.max(_top.document.documentElement.scrollLeft,_top.document.body.scrollLeft);
var cw=_top.document.documentElement.clientWidth;
var ch=_top.document.documentElement.clientHeight;

if(settings.autosize){
	
	if(settings.url!='undefined'&&settings.url!=''){
		//在自动大小的时候，在iframe加载完内容后设置其大小
		context.children('iframe').bind('load',function(){
			
		});
	}else{
		//自动大小时，当页面内容不是iframe时,设置弹窗宽高为auto，绝对定位的div会根据内容自适应大小。
		var ms_W=container.outerWidth();
		container.css({width:'auto',height:'auto'});
		context.css({height:'auto',width:'auto'});
	}
}else{
	container.css({width:settings.width,height:settings.height});
	if(settings.width!='auto'){
	context.css({height:(container.innerHeight()-(tlt==undefined?0:tlt.outerHeight()))});
	}
}
//alert(context.height());

//alert(mp+':'+ml);
//container.css({'margin-left':ml-container.outerWidth()/2,'margin-top':mp-container.outerHeight()/2});
//margin值导致定位不准确，故而改成下面的算法。
//屏幕小时伸展不开div会导致定位不居中

if(settings.url!='undefined'&&settings.url!=''){

	var lod=$('<img src="images/loading.gif"/>',_top.document).css({position:'absolute',left:'50%',top:'50%','margin-left':'-8px','margin-right':'-8px','z-Index':'100'});
	lod.appendTo(context);
	context.children('iframe').bind('load',function(){
		lod.remove();
		context.children('iframe')[0].contentWindow.$.moo=moo;
		inframe.css({display:'block'});
		if(settings.autosize){
		var _w=0,_h=0;
		
		_w=Math.max(this.contentWindow.document.documentElement.scrollWidth,this.contentWindow.document.body.scrollWidth);
		_h=Math.max(this.contentWindow.document.documentElement.scrollHeight,this.contentWindow.document.body.scrollHeight);
		
		
		context.css({height:_h,width:_w});
		container.css({width:_w,height:(_h+(tlt==undefined?0:tlt.outerHeight()))});
		//在重新设置大小后，再重新设置弹框的位置
		if(settings.fixed){
			var m_top=(settings.vmiddle?(ch-container.outerHeight())/2:settings.marginTop);
			m_top=m_top<0?0:m_top;
			container.css({left:(cw-container.outerWidth())/2,top:m_top});
		}else{
			var m_top2=(settings.vmiddle?(ch-container.outerHeight())/2:(mp+settings.marginTop));
			m_top2=m_top2<0?0:m_top2;
			container.css({left:ml+(cw-container.outerWidth())/2,top:m_top2});
		}
		}
		settings.init(this.contentWindow);
		
		
	});
	}else{
		settings.init(context);
	}
container.css({left:0,top:0});
if(settings.fixed){
	var m_tp=(settings.vmiddle?(ch-container.outerHeight())/2:settings.marginTop);
	m_tp=m_tp<0?0:m_tp;
	container.css({left:(cw-container.outerWidth())/2,top:m_tp});
}else{
	var m_tp2=(settings.vmiddle?(ch-container.outerHeight())/2:(mp+settings.marginTop));
	m_tp2=m_tp2<0?0:m_tp2;
	container.css({left:ml+(cw-container.outerWidth())/2,top:m_tp2});
}
if(settings.move&&tlt!=null){
tlt.mooshineCanMove('',container,top.mooshinezIndex);
}
top.mooshinezIndex+=10;
top.mooshinezCount+=1;//创建一个窗口改变全局变量的值
var WindowValue=0;
function closer(){
	if(settings.url!='undefined'&&settings.url!=''){
		context.children('iframe').attr("src","");
	}
	var pats=container[0].parentElement||container[0].parentNode;
		pats.removeChild(container[0]);
		if(modediv!=null&&modediv!=undefined){
			modediv.remove();
		}
		top.mooshinezCount-=1;
		top.mooshinezIndex-=10;
		if(top.mooshinezCount<=0){
			top.mooshinezIndex=1000;
		}
		if(settings.callback){
			settings.callback();
		}
		moo=null;
}
var Timers;
if(parseInt(settings.timeout)>0){
	Timers=setTimeout(function(){closer();},settings.timeout);
}
var moo={
		close:closer,
		getValue:function(){
			return WindowValue;
		},
		setValue:function(val){
			WindowValue=val;
		},
		timer:Timers?Timers:null,
		refresh:function(){
			if(settings.url!='undefined'&&settings.url!=''){
				var inframe="<iframe src="+settings.url+" frameborder=0 width=100% height=100%></iframe>";
				context.html(inframe);
				}else{
				context.html(settings.content);
				}
			if(settings.url!='undefined'&&settings.url!=''){
				var lod=$('<img src="../images/loading.gif"/>',_top.document).css({position:'absolute',left:'50%',top:'50%','margin-left':'-8px','margin-top':'-8px','z-Index':'100'});
				lod.appendTo(context);
				context.children('iframe').bind('load',function(){
					lod.remove();
					context.children('iframe')[0].contentWindow.$.moo=moo;
					inframe.css({display:'block'});
					if(settings.autosize){
					var _w=0,_h=0;
					
					_w=Math.max(this.contentWindow.document.documentElement.scrollWidth,this.contentWindow.document.body.scrollWidth);
					_h=Math.max(this.contentWindow.document.documentElement.scrollHeight,this.contentWindow.document.body.scrollHeight);
					
					
					context.css({height:_h,width:_w});
					container.css({width:_w,height:(_h+(tlt==undefined?0:tlt.outerHeight()))});
					//在重新设置大小后，再重新设置弹框的位置
					if(settings.fixed){
						container.css({left:(cw-container.outerWidth())/2,top:(settings.vmiddle?(ch-container.outerHeight())/2:settings.marginTop)});
					}else{
						container.css({left:ml+(cw-container.outerWidth())/2,top:(settings.vmiddle?(ch-container.outerHeight())/2:(mp+settings.marginTop))});
					}
					}
					settings.init(this.contentWindow);
	              
				});
				}else{
					settings.init(context);
				}
		},
		relayout:function(){
			container.css({left:0,top:0});//屏幕小时伸展不开div会导致定位不居中
			if(settings.fixed){
				container.css({left:(cw-container.outerWidth())/2,top:(settings.vmiddle?(ch-container.outerHeight())/2:settings.marginTop)});
			}else{
				container.css({left:ml+(cw-container.outerWidth())/2,top:(settings.vmiddle?(ch-container.outerHeight())/2:(mp+settings.marginTop))});
			}
		}
	};
return moo;
};
}(jQuery,this)); 
$(function(){
	var link = document.createElement('link');
	link.rel = 'stylesheet';
	link.href = $.ctx+'static/hotel/mooshineWindow.css';//根据具体项目更改样式地址；
	var hd=document.getElementsByTagName('head'); 
	hd[0].appendChild(link);
});