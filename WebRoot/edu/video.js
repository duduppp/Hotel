/**
 * 
 */
function playVideo(opt) {
	if (typeof (opt) == "undefined") {
		alert("请传入必要参数！");
		return;
	}
	if (typeof (opt.elemt) == "undefined") {
		alert("请指定播放器要插入的对象！");
		return;
	}
	if (typeof (opt.src) == "undefined") {
		alert("请指定要播放视频的路径！");
		return;
	}
	var _this = this;
	_this.elemt = opt.elemt; //播放器要插入的对象
	_this.src = opt.src; //视频的URL(必设) 
	_this.width = opt.width > 0 ? opt.width + "px" : "100%"; //宽度(默认100%) 
	_this.height = opt.height > 0 ? opt.height + "px" : "100%"; //高度(默认100%)
	_this.autoplay = opt.autoplay == "true" ? "autoplay" : ""; //自动播放（true为自动播放）
	_this.poster = opt.poster; //视频封面，播放时的封面图片
	_this.preload = opt.preload == "true" ? "preload" : ""; //预加载(true时启动加载)
	_this.loop = opt.loop == "true" ? "loop" : ""; //循环播放(true时循环播放)
	var str = "<video id='playVideo' controls "; //根据设置的属性的值，拼写video控件
	str += " width='" + _this.width + "' height='" + _this.height + "' "
			+ _this.autoplay + " " + _this.preload + " " + _this.loop + " ";
	if (typeof (_this.poster) != "undefined") {
		str += " poster='" + _this.poster + "' >";
	} else {
		str += " > ";
	}
	str += " <source src='" + _this.src + ";codecs='avc1.42E01E, mp4a.40.2'   " +
			"webkit-playsinline='true' playsinline='true' x-webkit-airplay='true' " +
			"x5-video-player-type='h5' x5-video-player-fullscreen='true'x5-video-ignore-metadata='true' />";
	str += "</video>";
	this.elemt.innerHTML = str; //将str放到要插入的对象中
}