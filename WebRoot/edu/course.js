/**
 * 分享到朋友圈
 * @param title
 * @param desc
 * @param link
 * @param imgUrl
 */
function weixinShareTimeline(title, desc, link, imgUrl) {
	WeixinJSBridge.invoke('shareTimeline', {
		"img_url": imgUrl,
		// "img_width":"640",
		// "img_height":"640",
		"link": link,
		"desc": desc,
		"title": title 
	}); 
}
/**
 * 发送给好友
 * @param title
 * @param desc
 * @param link
 * @param imgUrl
 */
function weixinSendAppMessage(title, desc, link, imgUrl) {
	WeixinJSBridge.invoke('sendAppMessage', {
		// "appid":appId,
		"img_url": imgUrl,
		// "img_width":"640",
		// "img_height":"640",
		"link": link,
		"desc": desc,
		"title": title
	});
}

/**
 * 分享到腾讯微博
 * @param title
 * @param link
 */
function weixinShareWeibo(title, link) {
	WeixinJSBridge.invoke('shareWeibo', {
		"content": title + link,
		"url": link
	});
}

/**
 * 关注指定的微信号
 * @param name
 */
function weixinAddContact(name) {
	WeixinJSBridge.invoke("addContact", {
		webtype: "1",
		username: name
	}, function (e) {
		WeixinJSBridge.log(e.err_msg);
		// e.err_msg:add_contact:added 已经添加
		// e.err_msg:add_contact:cancel 取消添加
		// e.err_msg:add_contact:ok 添加成功
		if (e.err_msg == 'add_contact:added' || e.err_msg == 'add_contact:ok') {
			//关注成功，或者已经关注过
		}
	})
}

function open_share(type,shareTitle, shareDesc, shareUrl, shareImg) {   
 //	var shareUrl = '< a rel = "nofollow" href = "http://www.baidu.com" target = "_blank" > http: //www.baidu.com</a>';
 	//var shareTitle = '自定义标题';
 	//var shareImg = 'http://s.jiathis.com/qrcode.php?url=' + shareUrl;  
 	//var shareDesc = '自定义内容'; 
 	//var openUrl = ''; 
	var openUrl='';
 	switch (type) {
 	case 'qzone':
 			openUrl = 'http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?url=' + shareUrl + '&title=' + shareTitle + '&pics=' + shareImg
 			break;
 	case 'weixin':
 			shareTimeline(shareTitle, shareDesc, shareUrl, shareImg) ; 
 		return false;
 		break;
 	case 'qq':
 		openUrl = 'http://connect.qq.com/widget/shareqq/index.html?url=' + shareUrl + '&desc=' + shareDesc 
 		+ '&summary=' + shareDesc + '&site=' + shareUrl + '&pics=' + shareImg;
 		break;
 	case 'tqq':
 		openUrl = 'http://v.t.qq.com/share/share.php?title=' + shareTitle + '&url=' + shareUrl + '&site=' 
 		+ shareUrl + '&pic=' + shareImg;
 		break;
 	case 'weibo':
 		openUrl = '=' + shareUrl + '&title=' + shareTitle + '&&source=' + shareUrl 
 		+ '&sourceUrl=' + shareUrl + '&content=' + shareDesc + '&pic=' + shareImg;
 		break;
 	}
 	window.open(openUrl);
 }