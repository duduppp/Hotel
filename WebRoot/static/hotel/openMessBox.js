/*
	title： 弹框标题；

	width: 弹框宽；

	Height: 弹框高；

	ishave_cancel： 
	判断是否需要取消按钮（0：不需要；1：需要）；

	ok_action_type：
	点击确定按钮执行操作类型（1：url self模式跳转；2、url top模式跳转；3：执行js函数）；

	ok_action：
	点击确定按钮后的操作（可以传入url【sysutem/userlist.aspx】，也可以传入js方法【adduser()】，如果传入空字符串不执行任何操作）；

	cancel_action_type： 
	点击确定按钮执行操作类型（1：url self模式跳转；2、url top模式跳转；3：执行js函数）；

	cancel _action： 
	点击取消按钮后的操作（可以传入url【sysutem/userlist.aspx】，也可以传入js方法【adduser()】，如果传入空字符串不执行任何操作）；

	Messinfo:
	窗体显示的内容（内容可以是纯文本，也要支持html）；

	
	备注：
	每一项都可以为空，有些参数需要有默认值：
	
	openMessBox({
		title ：“系统信息”
		width : 500
		height : 230
		ishave_cancel ：0
		ok_action_type ：1
		ok_action : “”
		cancel_action_type ：1 
		cancel_action : “”
		messinfo : “”
	});


*/

var okBtnSrc = '../images/btn_queding.png';
var cancelBtnSrc = '../images/btn_qx.png';

(function(w){

	function addEvent(obj, sEv, fn){
		obj.addEventListener ? obj.addEventListener(sEv, fn, false) : obj.attachEvent('on' + sEv, fn);
	}

	function delegate(json){
		if(typeof json != 'object') return false;
		addEvent(json.bindObj, json.eType, function(ev){
			var oEvent = ev || event,
				oTarget = oEvent.srcElement || oEvent.target;
			json.targetObj.replace(/\w+/ig, function(s){
				oTarget.tagName.toLowerCase() == s && json.eFn.call(oTarget, oEvent);
			});
		});
	}
	function getPos(obj){
		var l = 0;
		var t = 0;
		while(obj){
			l += obj.offsetLeft;
			t += obj.offsetTop;
			obj = obj.offsetParent;
		}
		return {left:l, top:t}
	}

	var openMessBox = function (json){
		return new openMessBox.prototype.init(json);
	}

	openMessBox.prototype.init = function (json){
       
		if(typeof json == 'String') {
		
		} else {
			var that = this;
            that.title = "系统信息";
            if(json.title!=null)
            {
                that.title = json.title;
            }
            
			that.messinfo = json.messinfo;
			that.width = json.width || 500;
			that.height = json.height || 220;
			that.ishave_cancel = typeof json.ishave_cancel == 'undefined' ? 0 : json.ishave_cancel;
			that.ok_action_type = typeof json.ok_action_type == 'undefined' ? 4 : json.ok_action_type;
            
			that.ok_action = json.ok_action;
			that.cancel_action_type = typeof json.cancel_action_type == 'undefined' ? 4 : json.cancel_action_type;
			that.cancel_action = json.cancel_action;
			that.close_action_type = json.close_action_type;
			that.close_action = json.close_action;

            that.ok_title =  typeof json.ok_title == 'undefined' ? "确定" : json.ok_title;
            that.cancel_title =  typeof json.cancel_title == 'undefined' ? "取消" : json.cancel_title;

            //是否需要下下方的按钮区域（1：需要 0：不需要）
            that.isbuttonDiv =  typeof json.isbuttonDiv == 'undefined' ? "1" : json.isbuttonDiv;

           


          
			that.alia = json.alia;
			
			that.create(json);
			
			that.mask();
			that.oMask.style.display = 'block';
			that.fixed();
			addEvent(window, 'resize', function(){
					that.mask();
				that.fixed()
			});
		}
	}
	
	openMessBox.prototype.constructor = openMessBox;
	openMessBox.prototype.init.prototype = openMessBox.prototype;
	openMessBox.prototype.init.prototype.constructor = openMessBox;
		
	openMessBox.prototype.create = function(json){
	  
		var that = this;
		var wrap = document.createElement('div');
		wrap.className = 'box';
		wrap.style.cssText = 'width:' + that.width + 'px';
	
       
	
		var head = document.createElement('div');
		head.className = 'box_title_bg';
		
        var boxTitle = document.createElement('div');
        boxTitle.className = 'box_title';
        boxTitle.innerHTML =  that.title;
       
        var boxClose = document.createElement('div');
        boxClose.className = 'box_close';
		
        var closeLink = document.createElement('a');
        closeLink.className = 'close';
        closeLink.innerHTML = '<img class="closeImg" src="../zc_resource/images/close_1.png" onmousedown="this.src=\'../zc_resource/images/close_2.png\';" onmousemove="this.src=\'../zc_resource/images/close_2.png\';" onmouseout="this.src=\'../zc_resource/images/close_1.png\';">'
     
     
     /*  
			close_action_type
			close_action
			close 动作
		*/
	
		if(that.close_action_type && that.close_action) {
			switch (that.close_action_type) {
				case 1: //url self模式跳转
					closeLink.target = '_self';
					closeLink.href = that.ok_action;
					break;
				case 2://url top模式跳转
					closeLink.target = '_top';
					closeLink.href = that.ok_action;
					break;
				case 3://执行js函数
					closeLink.href = 'javascript:;';
					closeLink.onclick = function(){
						that.close_action();
						that.remove();
					};
					break;
                case 4://执行js函数(带返回值)
				    closeLink.href = 'javascript:;';
				    closeLink.onclick = function(){
					    if(that.close_action())
                        {
						    that.remove();
                        }
				    };
                    break;                   
			}
		} else {
              closeLink.href = 'javascript:;';
			  closeLink.onclick = function(){
				   that.remove();
			    };
        }
     
     


		boxClose.appendChild(closeLink);
        head.appendChild(boxTitle);
        head.appendChild(boxClose);

		var content = document.createElement('table');
		var row = content.insertRow();//创建一行 
        var cell = row.insertCell(0);//创建一个单元 
        content.className = 'boxWrap';

        //不需要按钮框
        if(that.isbuttonDiv=="0")
        {
            content.style.height = (that.height) + 'px';
        }
        else
        {
            content.style.height = (that.height - 80) + 'px';
        }
        cell.className = 'boxConent';
        
		cell.innerHTML = that.messinfo;
		

		var btnWap = document.createElement('div');
		btnWap.className = 'tc1 oa-ft-tool-bar2';

        if(that.isbuttonDiv=="0")
        {
            btnWap.style.display = "none";
        }
        else
        {
            btnWap.style.display = "black";
        }
		
		that.okBtn = document.createElement('a');
        that.okBtn.setAttribute("id","ok_button");
        that.okBtn.className ='oa-pop-btn oa-pop-btn-red';
		that.okBtn.innerHTML = '<span class="oa-pop-btn-txt" style="text-decoration:none;">&nbsp;&nbsp;'+that.ok_title+'&nbsp;&nbsp;</span>';
        
		
		
		btnWap.appendChild(that.okBtn);
		
		
		/*  
			ok_action_type
			ok_action
			ok 动作
		*/
        if(that.ok_action_type==4)
        {
             that.okBtn.onclick = function(){
				that.remove();
                };
        }
		if(that.ok_action_type && that.ok_action) {
			switch (that.ok_action_type) {
				case 1: //url self模式跳转
					that.okBtn.target = '_self';
					that.okBtn.href = that.ok_action;
					break;
				case 2://url top模式跳转
					that.okBtn.target = '_top';
					that.okBtn.href = that.ok_action;
					break;
				case 3://执行js函数
					that.okBtn.href = 'javascript:;';
					that.okBtn.onclick = function(){
						that.ok_action();
						that.remove();
					};
                    break;
                case 4://执行js函数(带返回值)
					that.okBtn.href = 'javascript:;';
					that.okBtn.onclick = function(){
						if(that.ok_action())
                        {
						    that.remove();
                        }
					};
                    break;
                case 5://执行js函数
					that.okBtn.target = '_parent';
					that.okBtn.href = that.ok_action;
					break;
			}
		}
		
		
		/*  
			cancel_action_type
			cancel_action
			cancel 动作
		*/
		if(that.ishave_cancel == 1) {
			that.cancelBtn = document.createElement('a');
            that.cancelBtn.className ='oa-pop-btn oa-pop-btn-blue2';
		    that.cancelBtn.innerHTML = '<span class="oa-pop-btn-txt">&nbsp;&nbsp;'+that.cancel_title+'&nbsp;&nbsp;</span>';
            
			that.cancelBtn.style.marginLeft = '20px';
			
            if(that.cancel_action_type==4)
            {
                that.cancelBtn.onclick = function(){
					that.remove();
				};
            }
			if(that.cancel_action_type && that.cancel_action) {
				switch (that.cancel_action_type) {
					case 1: //url self模式跳转
						that.cancelBtn.target = '_self';
						that.cancelBtn.href = that.cancel_action;
						break;
					case 2://url top模式跳转
						that.cancelBtn.target = '_top';
						that.cancelBtn.href = that.cancel_action;
						break;
					case 3://执行js函数
						that.cancelBtn.href = 'javascript:;';
						that.cancelBtn.onclick = function(){
							that.cancel_action();
							that.remove();
						};
						break;
                    case 4://执行js函数(带返回值)
				        that.cancelBtn.href = 'javascript:;';
				        that.cancelBtn.onclick = function(){
					        if(that.cancel_action())
                            {
						        that.remove();
                            }
				        };
                        break;
				}
			}
			btnWap.appendChild(that.cancelBtn);
		}
		
		
		wrap.appendChild(head);
		wrap.appendChild(content);
		wrap.appendChild(btnWap);
		this.wrap = wrap;
		
		document.body.appendChild(wrap);
		
        head.onmousedown = function(ev){
              that.dragMe(ev);
        }

     
        


		/*
        delegate({
			bindObj : head,
			targetObj : 'img',
			eType : 'click',
			eFn : function(oEvent){
				this.className.replace(/closeImg/i, function(s){
					switch (s.toLowerCase()) {
						case 'closeimg':
							that.remove();
							break;
					}
				});
			}
		 });
        
        */
	
	}

	openMessBox.prototype.remove = function(){
		document.getElementById('bg').style.display = 'none';
		document.body.removeChild(this.wrap);
	};
	
	openMessBox.prototype.fixed = function(){
        var that = this;
        if(that.isbuttonDiv=="0")
        {
            that.wrap.style.top = (document.documentElement.clientHeight - this.height-40)/2 + 'px';
        }
        else
        {
           that.wrap.style.top = (document.documentElement.clientHeight - this.height)/2 + 'px';
        }
		that.wrap.style.left = (document.documentElement.clientWidth - this.width)/2 + 'px';
	};
	
	
	openMessBox.prototype.mask = function(){
     
		var that = this;
		that.oMask = document.getElementById('bg');
		
		if(!that.oMask) {
			/* 创建遮罩 */
			that.oMask = document.createElement('div');
			that.oMask.id = 'bg';
		}
	
		// 获取窗口宽度
		if (window.innerWidth)
		winWidth = window.innerWidth;
		else if ((document.body) && (document.body.clientWidth))
		winWidth = document.body.clientWidth;
		// 获取窗口高度
		if (window.innerHeight)
		winHeight = window.innerHeight;
		else if ((document.body) && (document.body.clientHeight))
		winHeight = document.body.clientHeight;
		// 通过深入 Document 内部对 body 进行检测，获取窗口大小
		if (document.documentElement && document.documentElement.clientHeight && document.documentElement.clientWidth)
		{
		winHeight = document.documentElement.clientHeight;
		winWidth = document.documentElement.clientWidth;
		}
		
		that.oMask.style.width = winWidth + 'px';
		that.oMask.style.height = winHeight + 'px';

		document.body.appendChild(that.oMask);
	
	}
    openMessBox.prototype.dragMe = function(ev){
		var that = this;
	
		var oDiv = that.wrap;
		var oDivP = getPos(oDiv);


		oDiv.style.top = oDivP.top + 'px';
		oDiv.style.left = oDivP.left + 'px';
		
		
		
		var oEvent = ev || w.event;
		var disX = oEvent.clientX - oDiv.offsetLeft;
		var disY = oEvent.clientY - oDiv.offsetTop;
		
		document.onmousemove = function(ev){
			var oEvent=ev || w.event;
			var l=oEvent.clientX-disX;
			var t=oEvent.clientY-disY;
			l<0 && (l=0);
			
			l>document.documentElement.clientWidth-oDiv.offsetWidth && (l=document.documentElement.clientWidth-oDiv.offsetWidth);
			
			t<0 && (t=0);
			
			t>document.documentElement.clientHeight-oDiv.offsetHeight && (t=document.documentElement.clientHeight-oDiv.offsetHeight);
			
			oDiv.style.left=l+'px';
			oDiv.style.top=t+'px';
			return false;
		}
		
		document.onmouseup = function(){
			document.onmousemove = null;
			document.onmouseup = null;
			return false;
		}
		return false;
		
	}


	w.openMessBox = openMessBox;
})(window);

function C_alertToLogin(str) {
    openMessBox({
        ok_action_type: 2,
        messinfo: '<p class="tc" style=\"font-size:12px;color:Black\">' + str + '</p>',
        ok_action: '../../Admin/aspx/login.aspx',
        close_action_type: 2,
        close_action : '../../Admin/aspx/login.aspx'
    });
    return false;
}

function C_alertToLogin_child(str) {
    openMessBox({
        ok_action_type: 2,
        messinfo: '<p class="tc" style=\"font-size:12px;color:Black\">' + str + '</p>',
        ok_action: 'login.aspx',
        close_action_type: 2,
        close_action : 'login.aspx'
    });
    return false;
}

function C_confirmToDelete(id,str) {
    var newUrl = ChangeURLParm(self.location.href, "pno", "1", "deleteNo");
    newUrl += "&deleteNo=" + id;

    openMessBox({
        messinfo: '<p class="tc"  style=\"font-size:12px;color:Black\">' + str + '删除不可恢复，你确定要删除' + str + '信息吗？</p>',
        ok_action_type: 1,
        ok_action: newUrl,
        ishave_cancel: 1
    });
}

function C_confirmToFinish(id,str) {
    var newUrl = ChangeURLParm(self.location.href, "pno", "1", "finishNo");
    newUrl += "&finishNo=" + id;

    openMessBox({
        messinfo: '<p class="tc" style=\"font-size:12px;color:Black\">' + str + '你确定要将这些订单完结吗？</p>',
        ok_action_type: 1,
        ok_action: newUrl,
        ishave_cancel: 1
    });
}

function C_confirmToDeleteParent(id, str) {
    var newUrl = ChangeURLParm(self.location.href, "pno", "1", "deleteNo");
    newUrl += "&deleteNo=" + id;

    openMessBox({
        messinfo: '<p class="tc" style=\"font-size:12px;color:Black\">' + str + '删除不可恢复，你确定要删除' + str + '信息吗？</p>',
        ok_action_type: 5,
        ok_action: newUrl,
        ishave_cancel: 1,
    });
}

function C_alertToUrl(str, url) {
    openMessBox({
        ok_action_type: 1,
        messinfo:  '<p class="tc" style=\"font-size:12px;color:Black\">' + str + '</p>',
        ok_action: url,
        close_action_type: 1,
        close_action : url
    });
    return false;
}
function C_alertToParent(str, url) {
    openMessBox({
        ok_action_type: 5,
        messinfo:  '<p class="tc" style=\"font-size:12px;color:Black\">' + str + '</p>',
        ok_action: url,
        close_action_type: 5,
        close_action : url
    });
    return false;
}

function C_alertToFun(str) {
    openMessBox({
        ok_action_type: 3,
        messinfo:  '<p class="tc" style=\"font-size:12px;color:Black\">' + str + '</p>',
        ok_action: function(){
				self.location=document.referrer;
			},
        close_action_type: 3,
        close_action : function(){
				self.location=document.referrer;
			}
    });
    return false;
}