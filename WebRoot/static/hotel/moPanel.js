/**
 * 动画封装
 * **/
(function(_){
	var requestA=window.requestAnimationFrame||window.webkitRequestAnimationFrame||window.mozRequestAnimationFrame||window.oRequestAnimaitonFrame||function(callback){return window.setTimeout(callback,1000/60);};
	function moAnimate(elm,tm,funarg){
		if(typeof elm === 'string'){
			elm=document.getElementById(elm);
		}
		tm=tm||300;
		var startTime=0;
		if(window.performance&&window.performance.now){
			startTime=window.performance.now();
		}else{
			startTime=Date.now();
		}
		funarg=funarg||function(){};
		requestA(function(){
			moRequest(elm,startTime,tm,funarg);
		});
	}
	
	function moRequest(elm,startTime,tm,funarg){
		var currTime=0,name="";
		if(window.performance&&window.performance.now){
			currTime=window.performance.now();
		}else{
			currTime=Date.now();
		}
		if(!startTime){
			startTime=currTime;
			id=requestA(function(){moRequest(elm,startTime,tm,funarg);});
			return ;
		}
		var percent=(currTime-startTime)/tm;
		percent=percent>1?1:percent;
		if(percent>=1){
			funarg.call(elm,percent);
		}else{
			funarg.call(elm,percent);
			id=requestA(function(){moRequest(elm,startTime,tm,funarg);});
		}
		
	}
	_.moAm=moAnimate;
}(window));
/**
 * DOM元素操作的简便封装,只支持手机端或者现代浏览器。
 * **/
(function(_){
	var domReg=/^<$/i;
	var flagment;
	var mDom=function(){
			return mDom.fn.init();
		};
	mDom.fn=mDom.prototype={
			varsion:1.0,
			find:function(str,context){
				var doc=context||document;
				var domArr=doc.querySelectorAll(str);
				return domArr;
			},
			init:function(){
					return this;
				},
			//对象括展方法，用于给一个对象添加新的属性
			extend:function(){
				var option,src,copy,
				target={},
				length=arguments.length,
				i=0;
				for(;i<length;i++){
					if((option=arguments[i])!=null){
						for(name in option){
							src=target[name];
							copy=option[name];
							if(src!==copy&&copy!=undefined){
								target[name]=copy;
							}
						}
						
					}
				}
				return target;
			},
			//给一个DOM元素绑定事件，
			bind:function(el,evt,funarg){
					if(window.attachEvent){
						el.attachEvent('on'+evt,funarg);
					}else{
						el.addEventListener(evt,funarg,false);
					}
				},
			//给一个DOM元素解除绑定的事件
			unbind:function(el,evt,funarg){
				if(window.attachEvent){
						el.detachEvent('on'+evt,funarg);
					}else{
						
						el.removeEventListener(evt,funarg,false);
					}
				},
			prefix:['Webkit','Moz','ms','O'],
			supportCss3:function(style){
				var hm=document.documentElement.style;
				allstyle=[];
				for(name in this.prefix){
					allstyle.push((this.prefix[name]+'-'+style).replace(/-(\w)/g,function($0,$1){return $1.toUpperCase();}));
				}
				for(nm in allstyle){
					if(allstyle[nm] in hm){
						return true;
					}	
				}
				return false;
			},
			firstToUpperCase:function(str){
				if(str!==""){
					var f=str.substring(0,1);
					var o=str.substring(1,str.length);
					return f.toUpperCase()+o;
				}
				return null;
			},
			getStyle:function(el,name){
				if(window.getComputedStyle){
					var val= window.getComputedStyle(el,null).getPropertyValue(name);
					if(val==null){
						val=0;
					}
					return val;
				}else{
					var curr=el.currentStyle;
					var val=curr[name];
					var sty=el.style;
					if(val==null&&sty&&sty[name]){
						val=sty[name];
					}
					if(val==null){
						val=0;
					}
					if(val=='auto'&&(name=='width'||name=='height')){
						if(name=='width'){
							val=el.offsetWidth;
						}else{
							val=el.offsetHeight;
						}
					}
					return val;
				}
			},
			mcss:function(nodes,style){
			if(nodes.length){
				for(var i=0;i<nodes.length;i++){
					for(var st in style){
						st=st.replace(/-(\w)/g,function($0,$1){return $1.toUpperCase();});
					if(/^-?\d+[.]?\d+$/.test(style[st])&&(st!='zIndex'&&st!='opacity')){
						nodes[i].style[st]=style[st]+'px';
					}else{
					
						nodes[i].style[st]=style[st];
					}
				}
			}
			}else{
		
				for(var st in style){
					st=st.replace(/-(\w)/g,function($0,$1){return $1.toUpperCase();});
					if(/^-?\d+[.]?\d+$/.test(style[st])&&(st!='zIndex'&&st!='opacity')){
							nodes.style[st]=style[st]+'px';
					}else{
						nodes.style[st]=style[st];
					}
					}
				}		
			},
			cssText:function(el,json){//设置css的属性，样式后面要带分号才好使，没做多余处理。
				if(el===null||typeof el !=='object'){
					return;
				}
				var cssText=el.style.cssText;
				if(typeof json==='object'){
					for(name in json){
						var reg=new RegExp(name.replace(/\s+/,'')+"\\s*:\\s*\\w+\\s*;?","i");
					
						if(reg.test(cssText)){
							
							cssText=cssText.replace(reg,name+':'+json[name]+";");
						
						}else{
							cssText+=name+':'+json[name]+";";
							
						}
					}
				
					el.style.cssText=cssText;
				}
			},
			//如果传入的是
			createDom:function(tagName){
				tagName=this.trim(tagName);
				if(tagName.charAt(0)=="<"&&tagName.charAt(tagName.length-1)==">"&&tagName.length>=3){
					if(flagment==null||flagment==undefined){
						flagment=document.createElement("div");
					}
					flagment.innerHTML=tagName;
					return flagment.children;	
				}else{
					var dom=document.createElement(tagName);
					return dom;
				}
			},
			append:function(dom,context){
				context.appendChild(dom);
			},
			preappend:function(dom,context){
				var ch=context.children;
				if(ch.length==0){
					this.append(dom,context);
				}else{
					var fch=ch[0];
					context.insertBefore(dom,fch);
				}
			},
			getNext:function(dom){
				return dom.nextSibling;
			},
			getPre:function(dom){
				return dom.previousSibling;
			},
			getProperty:function(dom,pname){
				return dom.getAttribute(pname);
			},
			setProperty:function(dom,json){
				for(var name in json){
					dom.setAttribute(name,json[name]);
				}
			},
			remove:function(dom){
				var pat=dom.parentNode?dom.parentNode:dom.parentElement;
				pat.removeChild(dom);
			},
			addClass:function(dom,cname){
				dom.className=dom.className+" "+cname;
			},
			removeClass:function(dom,cname){
				dom.className=this.trim(dom.className.replace(cname,""));
			},
			hasClass:function(dom,cname){
				var csn=dom.className;
				var csnarr=csn.split(/\s+/);
				for(var i=0;i<csnarr.length;i++){
					if(this.trim(csnarr[i])==cname){
						return true;
					}
				}
				return false;
			},
			trim:function(str){
					return str.replace(/^\s+/,'').replace(/\s+$/,'');
				}
			
			};
		
		_.m$=mDom();
}(window));
/**
 * window对象的加载完成后的回调函数，
 * mLoad(function(){});
 * 通过mLoad实现页面加载完成后的回调函数调用，在IE9以下是通过定时器的形式来判断是否加载完成的，所以不能保证IE9以下的执行顺序一定和书写顺序相同。
 * **/
(function(_){
	var canRun=false,//是否页面加载完成的标识。
		eventQueue=[];//可执行函数的数组
	var execFn=function(){
		if(!canRun){
			canRun=true;
			while(eventQueue.length){
				eventQueue[0].call(_);
				eventQueue.shift();
			}
		}
	};
	var isReady=function(fn){
		if(canRun){
			fn.call(_);
		}else{
			eventQueue.push(fn);
		}
	};
	var doScroll=function(){
		try{
			document.documentElement.doScroll('left');
			execFn();
		}catch(e){
			setTimeout(function(){
				doScorll();
			},20);
		}
	};
	if(document.addEventListener){
		document.addEventListener("DOMContentLoaded",function(){
			execFn();
		},false);
	}else{
		doScorll();
	}
	_.mLoad=isReady;
}(window));

/**
 *AJAX的支持插件 
 *用法majax.request(url,param,method,success,error,type);
 *url:访问的地址
 *param:参数{name:'joiy',age:28}
 *method:post或者get
 *success:function(){},成功后的回调
 *error:function(){},错误后的回调
 *type:json或者text,返回的数据类型，
 *majax.post(url,param,success,type);
 *majax.get(url,param,success,type);
 *分别为post和get方法请求ajax,参数含义同上解释.
 ***/
(function(_){
	//创建AJAX的对象
	var myajax = function(){this.createXhrObject();};
	myajax.prototype = {
		//设定AJAX的传送数据，URL等，
	    request: function(url, postVars, method,success,error,type) {
			var success=success||function(){},
				error=error||function(){};
	       var xhr = this.createXhrObject();
			
	        xhr.onreadystatechange = function() {
	            if (xhr.readyState !== 4) return;
	            (xhr.status === 200) ?
	                success(type&&type.toUpperCase()=='JSON'?JSON.parse(xhr.responseText):xhr.responseText, xhr.responseXML) :
	                error(xhr);
	        };
	        if (method.toUpperCase() != "POST") {
	        	var paraVars=this.JSONStringify(postVars);
	        	if(paraVars!=""){
	        		url += "?" + this.JSONStringify(postVars);
	        	}
	            postVars = null;
	        }
	        xhr.open(method, url, true);
	        if(method.toUpperCase()=='POST'){
	        	//POST传输方式的头信息设定
				xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
				xhr.send(this.JSONPost(postVars));
			}else{
	        xhr.send(null);
			}
	    },
	    //用try-catch的方式创建AJAX Object
	    createXhrObject: function() {
	        var methods = [
	            function() { return new XMLHttpRequest(); },
	            function() { return new ActiveXObject("Msxml2.XMLHTTP"); },
	            function() { return new ActiveXObject("Microsoft.XMLHTTP"); }
	        ],
	        i = 0,
	        len = methods.length;
	        for (; i < len; i++) {
	            try {
	                methods[i];
	            } catch(e) {
	                continue;
	            }
	            this.createXhrObject = methods[i];
	            return methods[i];
	        }
	        throw new Error("ajax created failure");
	    },
	    //将数据转换成get方式所需要的数据
	    JSONStringify: function(obj) {
	        return JSON.stringify(obj).replace(/"|{|}/g, "")
	                    .replace(/b:b/g, "=")
	                    .replace(/b,b/g, "&");
	    },
	    //将数据转换成post方式所需要的数据
	    JSONPost:function(obj){
	    	var str="";
	    	for(var name in obj){
	    		str+=name+'='+obj[name]+'&';
	    	}
	    	str=str.substring(0,(str.length-1));
	    	return str;
	    },
	    //post和get的简便AJAX调用方式封装
	    post:function(url,param,success,type){
	    	var type=type||"text";
	    	this.request(url, param, "post", success, function(){},type);
	    },
	    get:function(url,param,success,type){
	    	var type=type||"text";
	    	this.request(url, param, "get", success, function(){}, type);
	    }
	};
	_.majax=function(){return new myajax();}();
}(window));

/**
 *手机端弹框插件，可以设置弹出位置：顶部、底部、居中、跟随元素等，可以设置是否有显示过渡，以及是否有蒙层等。手机端不内置iframe元素，所以不考虑子页面的元素，
 *但是需要添加AJAX的处理和回调。
 *为了适应性更广，所以要设置动态改变或者设置弹框DIV的宽、高、位置等基本元素，
 *还有就是相应的回调函数，如初始化完成后的初始化回调函数、关闭时的关闭回调函数、
 *采用fixed定位方式，应因手机端的浏览器都支持fixed定位方式。
 *提供定时关闭功能，以便实现Tip类的提示功能。
 *提供样式动态切换功能，可以随时在你需要的时候将弹框切换为另外一种样式。
 *弹框涉及的相关动画采用CSS3的硬件加速实现。
 *提供弹框中多页页面显示，以及多种多页面切换效果，各相关的切换延时加载
 *提供弹框出现的效果动画，采用CSS3的硬件加速和tansitionend事件监听处理。
 ***/
(function(_,undefined){
			var set={
			 width:'90%',
			 height:'',
			 showEffect:'',
			 hideEffect:'',
			 place:'middle middle',
			 close:function(){return true;},
			 init:function(){},
			 title:'测试',
			 head:true,
			 skin:'blank',
			 closeicon:true,
			 shade:true,
			 context:'',
			 url:'',
			 loaded:function(){},
			 shadeclose:true,
			 wrapper:null
			};
			var DomIndex=500;
			var istouch=!!(("ontouchstart" in window) || window.navigator && window.navigator.msPointerEnabled && window.MSGesture || window.DocumentTouch && document instanceof DocumentTouch);
			var touchstart=istouch?'touchstart':'mousedown',
				touchmove=istouch?'touchmove':'mousemove',
				touchend=istouch?'touchend':'mouseup';
	var mWin=function(options){
				var mset=m$.extend(set,options);
				
				return new mWin.fn.init(mset);
				};
	 mWin.fn=mWin.prototype={
	     			version:'1.0.0.0',
	     			init:function(mset){
	     						var outer=m$.createDom("<div class='mwin-outer'><table style='width:100%;height:100%;table-layout:fixed;' cellspacing=0 cellpadding=0><tr><td class='mwin-outer-td'></td></tr></table></div>")[0];
		 					 	var conts=m$.createDom("<div class='mwin-container'></div>")[0];
		 					 	this.mset=mset;
		 					 	this.outer=outer;
		 					 	this.mwintd=m$.find(".mwin-outer-td",outer)[0];
		 					 	m$.append(m$.createDom("<div class='mwin-inner'></div>")[0],conts);
		 					 	var wrap=this.mset.wrapper==null?m$.find("body")[0]:this.mset.wrapper;
		 					 	var inner=m$.find(".mwin-inner",conts)[0];
		 		 					m$.append(outer,wrap);
		 		 					m$.append(conts,this.mwintd);
		 		 					this.DOM=conts;
		 		 			 		this.initShade();
		 		 			 		m$.mcss(outer,{'zIndex':++DomIndex});
		 		 			 		m$.mcss(conts,{width:mset.width});
		 		 			 		this.initHead();
		 		 			 		this.initContext();
		 		 			 		this.show();
		 		 			 		var th=this;
		 		 			 		if(th.mset.init){
		 		 			 			th.mset.init(th.mwintd);
		 		 			 		}
		 		 			 		return this;
	     			},
	     			show:function(){
	     				var that=this,
	     						DOM=that.DOM,
	     						td=that.mwintd;
	     						var height=parseInt(m$.getStyle(DOM,'height'));
	     						var place=this.mset.place.split(" ");
	     						
	     						//m$.mcss(that.outer,{background:'rgba(128,128,128,.6)'});
	     						m$.bind(DOM,"click",function(evt){
	     							evt.stopPropagation();
	     						});
	     						if(place[0]=="middle"&&place[1]=="middle"){
	     						m$.mcss(td,{'verticalAlign':'middle'});
	     						m$.mcss(DOM,{'opacity':0.3});
	     						setTimeout(function(){
	     							m$.mcss(DOM,{"webkitTransition":"all .2s ease"});
	     							m$.mcss(DOM,{"MozTransition":"all .2s ease"});
	     							m$.mcss(DOM,{"msTransition":"all .2s ease"});
	     							m$.mcss(DOM,{opacity:1});
	     						},20);
	     						}
	     						if(place[0]=="middle"&&place[1]=="bottom"){
	     						m$.mcss(td,{'verticalAlign':'bottom'});
	     						
	     						m$.mcss(DOM,{'webkitTransform':'translateY('+(height)+'px)'});
	     						m$.mcss(DOM,{'MozTransform':'translateY('+(height)+'px)'});
	     						m$.mcss(DOM,{'msTransform':'translateY('+(height)+'px)'});
	     						setTimeout(function(){
	     						m$.mcss(DOM,{"webkitTransition":"all .4s ease-in-out",'webkitTransform':'translateY(0px)'});
	     						m$.mcss(DOM,{"MozTransition":"all .4s ease-in-out",'MozTransform':'translateY(0px)'});
	     						m$.mcss(DOM,{"msTransition":"all .4s ease-in-out",'msTransform':'translateY(0px)'});
	     						},20);
	     						
	     						}
	     			},
	     			loadimg:function(){
	     				var that=this,
	     					DOM=that.DOM;
	     			},
	     			initContext:function(){
	     				var that=this,
	     						DOM=that.DOM,  						
	     						inner=m$.find(".mwin-inner",DOM)[0];
	     						m$.bind(DOM,touchend,function(evt){
	     							//evt.stopPropagation();
	     						});
	     						var context=m$.createDom("<div class='mwin-context'></div>")[0];
	     						m$.append(context,inner);
	     						
	     						if(m$.trim(this.mset.url)==''){
	     							 context.innerHTML=this.mset.context;
	     						}
	     						
	     			},
	     			reContext:function(context){
	     				var context=context||"";
	     				var that=this,
	     						DOM=that.DOM;
	     						mwincontext=m$.find(".mwin-context",DOM)[0];
	     						mwincontext.innerHTML=context;
	     			},
	     			getDom:function(){
	     				return m$.find(".mwin-context",this.DOM)[0];
	     			},
	     			closeEff:function(callfn){
	     				var that=this;
	     				var DOM=this.DOM;
	     				var place=this.mset.place.split(" ");
	     				var height=parseInt(m$.getStyle(DOM,'height'));
	     				//if(that.mset.shade){
	     				 //m$.mcss(that.outer,{background:'rgba(128,128,128,.1'});
	     				//}
	     				if(place[0]=="middle"&&place[1]=="bottom"){

	     					m$.bind(DOM,"webkitTransitionEnd",function(){	
	     						 m$.remove(that.outer);	 
	     						 callfn.call(that);
	     						});
	     					m$.mcss(DOM,{'webkitTransform':'translateY('+(height)+'px)'});
	     					m$.mcss(DOM,{'MozTransform':'translateY('+(height)+'px)'});
	     					m$.mcss(DOM,{'msTransform':'translateY('+(height)+'px)'});
	     				}
	     				if(place[0]=="middle"&&place[1]=="middle"){
	     					moAm(that.outer,200,function(per){
	     						var op=1-per;
	     						m$.mcss(this,{opacity:op});
	     						if(per==1){
	     							m$.remove(that.outer);
	    	     					
	     							callfn.call(that);
	     						}
	     					});
	     							
	     			     }
	     			},
	     			close:function(){
	     						var that=this,
	     						DOM=that.DOM;
	     						
	     						that.closeEff(function(){
	     							if(this.closefn){
	     							this.closefn();
	     							}
	     							this.mset.close();	
	     						});		
	     						
	     			},
	     			initHead:function(){
							 if(this.mset.head){
							 		var that=this,
							 				DOM=that.DOM,
							 				inner=m$.find(".mwin-inner",DOM)[0];
							 				
		 	 						var hd=m$.createDom("<div class='mwin-head'></div>")[0];
		 							var tit=m$.createDom("<div class='mwin-title'>"+that.mset.title+" </div>")[0];
		 									m$.append(tit,hd);
		 							if(this.mset.closeicon){
		 	 							var cls=m$.createDom("<div class='mwin-close'>&times;</div>")[0];
		 								m$.append(cls,hd);
		 								m$.bind(cls,touchstart,function(){that.close();});
		 	 							}
		 								 m$.append(hd,inner);
									}
						},
					  initShade:function(){
		 						var closefn;
								if(this.mset.shade){
									var tdp= this.mwintd;
									var that=this;
									m$.mcss(tdp,{background:"rgba(0,0,0,.6)"});
									var out=that.outer;
									m$.bind(out,touchmove,function(evt){
										evt.preventDefault();
									});
									if(this.mset.shadeclose){
										m$.bind(tdp,touchend,function(evt){
											var tg=evt.target||evt.srcElement;
											if(tg==this){
											setTimeout(function(){
												that.close();
											},500);
											}
											
										});
									}
									this.closefn=function(){
									};
								}else{
									
									var outer=this.outer;
									m$.mcss(outer,{"pointerEvents":"none"});
									
									this.closefn=function(){};
								}
								
						}

	     	};
	mWin.fn.init.prototype=mWin.fn;
	mLoad(function(){//根据script的路径加载相应的css文件，要求script名称不变更的情况下
					var script=document.getElementsByTagName("script");
					var _thscript;
					for(var i=0;i<script.length;i++){
						if(script[i].src&&script[i].src.indexOf("moPanel")!=-1){
							_thscript=script[i].src;
						}
					}
				
					var me=_thscript.lastIndexOf("/")<0?".":_thscript.substring(0,_thscript.lastIndexOf("/"));	
					var link=m$.createDom("<link rel='stylesheet' type='text/css' href='"+me+"/"+set.skin+".css'>")[0];
				 
					m$.preappend(link,m$.find("head")[0]);
				});
	_.mWin=mWin;
}(window,undefined));
/**
*js加载相关的CSS文件。 
**/

