(function(mwin,window){
	
	var mtip=function(text,icon,duration){
		if(icon=='ok'||icon=='error'||icon=='info'){
			_msg='<i class="mw-'+icon+'icon"></i>';
		}else{
			_msg='<i class="mw-noicon"></i>';
		}
		var dura=duration||1500;
		var load="<div style='text-align:center;'><div style='background:rgba(255,255,255,.9);display:inline-block;line-height:42px;padding:3px 1.5em;border:1px solid #ccc;'>"+_msg+text+"</div></div>";
		var call=mwin({head:false,context:load,shade:false,shadeclose:false,wrapper:mtip.wrapper});
		 setTimeout(function(){
			 call.close();
		 },dura);
		};
		mtip.wrapper=null;
	window.moTip=mtip;
}(mWin,window));