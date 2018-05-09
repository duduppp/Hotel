/**lert,confirm,prompt
	@autor mooshine;
	@date 03/03/2015;
	
**/
;
(function($){
	var mooWindow=$.mooshineWindow;
	 var moalert=function(msg,funarg){
		mooWindow({
			content:'<div style="padding:30px 20px;padding-right:40px;min-width:280px;font-size:14px;display:inline-block;border:1px solid #dadada;">'+msg+'</div>',
			title:'消息',
			autosize:true,
			ok:true,
			callback:funarg,
			marginTop:120,
			fixed:true,
			ontop:true
		});
	};
	var moconfirm=function(msg,yes,no){
		mooWindow({
			content:'<div style="padding:30px 20px;padding-right:40px;min-width:280px;font-size:14px;display:inline-block;">'+msg+'</div>',
			title:'确认',
			autosize:true,
			ok:true,
			cancel:true,
			okcall:yes,
			cancelcall:no,
			marginTop:120,
			fixed:true,
			ontop:true
		});
	};
	
	var motoast=function(msg,duration,icon){
		/*if(toastTimer){
			clearTimeout(toastTimer.timer);
			toastTimer.close();	
		}*/
		var _msg;
		if(icon=='ok'||icon=='error'||icon=='info'){
			_msg='<i class="mw-'+icon+'icon"></i>';
		}else{
			_msg='<i class="mw-noicon"></i>';
		}
		_msg+=msg;
		duration=duration||1500;
		toastTimer=mooWindow({
			content:'<div style="padding:18px 30px;font-size:14px;min-width:120px;background:rgba(2555,255,255,.5);display:inline-block;border:1px solid #dadada;">'+_msg+'</div>',
			head:false,
			autosize:true,
			fixed:true,
			marginTop:120,
			timeout:duration,
			modoler:false,
			ontop:true
		});
	};
	var scs=document.getElementsByTagName("script");
	var path;
	var patpath;
	for(var i=0;i<scs.length;i++){
		var src=scs[i].src;
		if(src.indexOf("mooshineWindowTool")!=-1){
			path=src.indexOf("/")!=-1?src.substring(0,src.lastIndexOf("/")):"";
			patpath=path.indexOf("/")!=-1?path.substring(0,path.lastIndexOf("/")):"";
			break;
		}
	}
	var mload=function(text,ontop){
		var text=text||"正在加载中...";
		return mooWindow({
			content:'<div style="padding:12px;background:rgb(0,0,0);font-size:14px;color:#fff;background:rgba(0,0,0,0.8);display:inline-block;">'+text+'</div>',
			head:false,
			autosize:true,
			fixed:true,
			marginTop:0,
			ontop:ontop?ontop:false
		});
	}
	var mopen=function(options){
		return mooWindow(options);
	};
	var toastTimer=null;
	window.malert=moalert;
	window.mconfirm=moconfirm;
	window.mtoast=motoast;
	window.mOpen=mopen;
	window.mLoad=mload;
}(jQuery));
