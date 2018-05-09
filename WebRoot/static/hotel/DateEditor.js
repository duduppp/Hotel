/**
 *房价规则编辑日历插件
 * 
 **/
(function($,mopen,win){
	var globals={
			btncancolor:'#039AE7',
			btndisabedcolor:'#68ACCE'
		};
	var defaults={
			 startDt:null,
			 endDt:null,
			 datePick:function(){},
			 dateInfo:[],
			 selCall:function(){},
			 selDate:new Date(),
			 curDt:null,
			 skin:'blank',
			 title:"日历",
			 seledDt:[],//{date:2015-11-12,price:150}
			 weekPrice:[],
			 closeCall:function(){}
			};
	var months=[31,28,31,30,31,30,31,31,30,31,30,31];
	var months2=[31,29,31,30,31,30,31,31,30,31,30,31];
	var months_china=["一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一","十二"];
	var week_china=["周日","周一","周二","周三","周四","周五","周六"];
	var numReg=/\d+/g;
	var DateEditor=function(options){
		var mset=$.extend({},defaults,options);
		return new DateEditor.fn.init(mset);
	};
	DateEditor.fn=DateEditor.prototype={
			version:'1.0.0',
			init:function(config){
				this.set=config;
				this.set.startDt=this.set.startDt||new Date();
				this.set.endDt=this.set.endDt||this.addDays(this.set.startDt, "month",10);
				this.set.curDt=this.set.curDt||new Date();
				if(typeof this.set.curDt =='string'){
					this.set.curDt=this.stringToDt(this.set.curDt);
				}
				this.panelSelDt=this.set.curDt;
				var headstr=this.drawDthead(this.set.curDt);
				var jsonstr=this.drawDtByJson(this.set.curDt);
				var jsonstrhide=this.drawDtByJson(this.set.curDt,true);
				
				var initstr=jsonstrhide+jsonstr;
				
				var contstr="<div class='panel-out'>"+headstr;
					contstr+="<div class='mwin-date-dt-outer'><div class='mwin-date-dt-inner'>";
					contstr+=initstr;
					contstr+="</div></div></div>";
				var th=this;
				var openDt=mopen({title:"周末-特殊房价设置",content:contstr,width:600,height:'auto',head:true,init:function(Dom){
					th.dtDom=Dom;
				},callback:function(){
					th.addOrupdateWeekprice();
					var weekprice=th.set.weekPrice;
					//console.log(weekprice);
					th.seledDtformatDt();
					var dateprice=th.set.seledDt;
					//console.log(dateprice);
					th.set.closeCall(weekprice,dateprice);
				}});
				this.panel=openDt;
				//th.bindClose();
				th.bindLeft_Right();
				th.upDatebtn();
				th.bindtdevent();
				
				return this;
				
			},
			seledDtformatDt:function(){
				for(var i=0;i<this.set.seledDt.length;i++){
					var dt=this.set.seledDt[i].date;
					if(dt instanceof Date){
						this.set.seledDt[i].date=this.DtToString(dt);
					}
				}
			},
			bindClose:function(){
				var DOM=this.dtDom;
				var panel=this.panel;
				var cls=DOM.find(".mwin-date-cls");
				cls.bind("click",function(){
					panel.close();
				});
			},
			close:function(){
				var panel=this.panel;
				panel.close();
			},
			bindLeft_Right:function(){
				var DOM=this.dtDom;
				var that=this;
				var left=DOM.find(".mwin-date-btn-left");
				var right=DOM.find(".mwin-date-btn-right");
				left.bind("click",function(){
						 that.scrollRight();
							
					 		
				});
				right.bind("click",function(){
						that.scrollLeft();
				});
				
			},
			bindtdevent:function(){
				var DOM=this.dtDom;
				var that=this;
				/*var dts=m$.find(".mwin-date-canclick",DOM);
				for(var i=0;i<dts.length;i++){
					m$.bind(dts[i],'click',function(){
						var dtval=m$.getProperty(this,"data-pick");
						that.set.datePick.call(that,dtval,this);
					});
				}*/
				DOM.find(".price-show").bind("blur",function(){
					var datestr=$(this).parents("td").attr("data-pick");
					var price=$(this).text();
					that.addOrupdateDateprice(datestr,price);
				});
			},
			upDatetitle:function(){
				var DOM=this.dtDom;
				var selDt=this.panelSelDt;
				var yy=selDt.getFullYear();
				var mm=selDt.getMonth();
				var title=DOM.find(".mwin-date-headdt")[0];
					  title.innerHTML=yy+"年"+this.formatDouble((mm+1))+"月";
				
			},
			upDatebtn:function(){
				var DOM=this.dtDom;
				var selDt=this.panelSelDt;
				var yy=selDt.getFullYear();
				var mm=selDt.getMonth();
				var left=DOM.find(".mwin-date-btn-left");
				var right=DOM.find(".mwin-date-btn-right");
				var start=this.set.startDt;
				var end=this.set.endDt;
				var syy=start.getFullYear(),
						smm=start.getMonth(),
						eyy=end.getFullYear(),
						emm=end.getMonth();

				if(yy==syy&&mm==smm){
					left.css({color:globals.btndisabedcolor});
				}else{
					left.css({color:globals.btncancolor});
				}
				if(yy==eyy&&mm==emm){
					right.css({color:globals.btndisabedcolor});
				}else{
					right.css({color:globals.btncancolor});
				}
			},
			addPanel:function(newDt,left){
				var yy=newDt.getFullYear();
				var mm=newDt.getMonth();
				var str=this.drawDtByJson(newDt);
				var DOM=this.dtDom;
				var inner=DOM.find('.mwin-date-dt-inner');
				var Olddom=inner.find('.mwin-date-dt-cont');
				var Dtdom=$(str);
				if(left){
					Dtdom.css({left:'100%'});
					Dtdom.appendTo(inner);
				}else{
					Dtdom.css({left:'-100%'});
					Dtdom.prependTo(inner);
				}
				return {oldp:Olddom,newp:Dtdom};
				
			},
			scrollRight:function(){
				var selDt=this.panelSelDt;
				var newDt=this.reduceDays(selDt,'month',1);
				if(!this.isValidDt(newDt)){
					return ;
				}
				var pobj=this.addPanel(newDt,false);
				var that=this;
				/*pobj.oldp.bind('webkitTransitionEnd',function(){
						that.panelSelDt=newDt;
						that.upDatetitle();
						that.upDatebtn();
						//m$.remove(pobj.oldp);
						pobj.oldp.remove();
						that.bindtdevent();
					});
				pobj.oldp.bind('mozTransitionEnd',function(){
					that.panelSelDt=newDt;
					that.upDatetitle();
					that.upDatebtn();
					//m$.remove(pobj.oldp);
					pobj.oldp.remove();
					that.bindtdevent();
				});
				pobj.oldp.bind('MSTransitionEnd',function(){
					that.panelSelDt=newDt;
					that.upDatetitle();
					that.upDatebtn();
					//m$.remove(pobj.oldp);
					pobj.oldp.remove();
					that.bindtdevent();
				});
				pobj.oldp.bind('transitionend',function(){
					that.panelSelDt=newDt;
					that.upDatetitle();
					that.upDatebtn();
					//m$.remove(pobj.oldp);
					pobj.oldp.remove();
					that.bindtdevent();
				});
				setTimeout(function(){
						pobj.oldp.css({left:'100%'});
						pobj.newp.css({left:'0px'});
				},0);*/
				pobj.oldp.animate({left:'100%'},function(){
					
				});
				pobj.newp.animate({left:'0px'},function(){
					that.panelSelDt=newDt;
					that.upDatetitle();
					that.upDatebtn();
					//m$.remove(pobj.oldp);
					pobj.oldp.remove();
					that.bindtdevent();
				});
			},
			scrollLeft:function(){
				var selDt=this.panelSelDt;
				var newDt=this.addDays(selDt,'month',1);
				if(!this.isValidDt(newDt)){
					return ;
				}
				var pobj=this.addPanel(newDt,true);
				var that=this;
				/*pobj.oldp.bind('webkitTransitionEnd',function(){
						that.panelSelDt=newDt;
						that.upDatetitle();
						that.upDatebtn();
						//m$.remove(pobj.oldp);
						pobj.oldp.remove();
						that.bindtdevent();
					});
				pobj.oldp.bind('mozTransitionEnd',function(){
					that.panelSelDt=newDt;
					that.upDatetitle();
					that.upDatebtn();
					//m$.remove(pobj.oldp);
					pobj.oldp.remove();
					that.bindtdevent();
				});
				pobj.oldp.bind('MSTransitionEnd',function(){
					that.panelSelDt=newDt;
					that.upDatetitle();
					that.upDatebtn();
					//m$.remove(pobj.oldp);
					pobj.oldp.remove();
					that.bindtdevent();
				});
				pobj.oldp.bind('transitionend',function(){
					that.panelSelDt=newDt;
					that.upDatetitle();
					that.upDatebtn();
					//m$.remove(pobj.oldp);
					pobj.oldp.remove();
					that.bindtdevent();
				});
				setTimeout(function(){
						pobj.oldp.css({left:'-100%'});
						pobj.newp.css({left:'0px'});
				},0);*/
				pobj.oldp.animate({left:'-100%'},function(){});
				pobj.newp.animate({left:'0px'},function(){
					that.panelSelDt=newDt;
					that.upDatetitle();
					that.upDatebtn();
					//m$.remove(pobj.oldp);
					pobj.oldp.remove();
					that.bindtdevent();
				});
			
			},
			drawDthead:function(drawDt){
				var drawDt=drawDt||new Date();
				var yy=drawDt.getFullYear();
				var mm=drawDt.getMonth()+1;
				//var str="<div class='mwin-date-title'><div class='mwin-data-title-text'>"+this.set.title+"</div><div class='mwin-date-cls'>&times;</div></div>";
				var str="";
				str+="<div class='mwin-date-week'><table cellapcing='0.3%' class='mwin-date'><tr>";
				for(var i=0;i<week_china.length;i++){
					str+="<td><div class='week-show'>"+week_china[i]+"</div><div class='week-price-show' contenteditable='true'>"+this.getWeekprice(i)+"</div></td>";
					}
				str+="</tr></table></div>";
				  str+="<div class='mwin-date-head'><div class='mwin-date-btn-left'>&lt;</div>";
					str+="<div class='mwin-date-headdt'>"+yy+"年"+this.formatDouble(mm)+"月</div>";
					str+="<div class='mwin-date-btn-right'>&gt;</div></div>";
					
				return str;
			},
			getWeekprice:function(i){
				if(this.set.weekPrice&&this.set.weekPrice.length&&this.set.weekPrice.length>i){
					return this.set.weekPrice[i]==0?"":this.set.weekPrice[i];
				}
				return "";
			},
			getDateprice:function(year,month,date){
				for(var i=0;i<this.set.seledDt.length;i++){
					var dt=this.stringToDt(this.set.seledDt[i].date);
					var yy=dt.getFullYear();
					var mm=dt.getMonth();
					var dd=dt.getDate();
					if(yy==year&&mm==month&&dd==date){
						return this.set.seledDt[i].price;
					}
				}
				return "";
			},
			addOrupdateWeekprice:function(){
				var DOM=this.dtDom;
				var weekarr=[];
				var hasweek=false;
				DOM.find(".week-price-show").each(function(){
					var val=$(this).text().replace(/\s+/,"");
					if(isNaN(val)||val==""){
						weekarr.push(0);
					}else{
						hasweek=true;
						weekarr.push(parseInt(val));
					}
				});
				if(hasweek){
				this.set.weekPrice=weekarr;
				}else{
					this.set.weekPrice=[];
				}
			},
			addOrupdateDateprice:function(datestr,price){
				var ndate=this.stringToDt(datestr);
				var year=ndate.getFullYear();
				var month=ndate.getMonth();
				var date=ndate.getDate();
				price=price.replace(/\s+/,"");
				for(var i=0;i<this.set.seledDt.length;i++){
					var dt=this.stringToDt(this.set.seledDt[i].date)
					
					var yy=dt.getFullYear();
					var mm=dt.getMonth();
					var dd=dt.getDate();
					if(yy==year&&mm==month&&dd==date){
						if(isNaN(price)||price==""){
							this.set.seledDt.splice(i);
							return ;
						}
						this.set.seledDt[i].price=parseInt(price);
						return ;
					}
				}
				if(isNaN(price)||price==""){
					return ;
				}
				//console.log("price:"+price);
				this.set.seledDt.push({date:ndate,price:parseInt(price)});
			},
			drawDtByJson:function(drawDt,flag){
				var flag=flag||false;
				var drawDt=drawDt||new Date();
				var jarr=this.getMonthJson(drawDt);
				var str="<div class='"+(flag?"mwin-date-dt-cont-hidden":"mwin-date-dt-cont")+"' ><table cellapcing='0.3%' class='mwin-date'>";
				for(var i=0;i<jarr.length;i++){
					str+="<tr>";
					var itemarr=jarr[i];
					for(var j=0;j<itemarr.length;j++){
						var dtstr=itemarr[j].year+"-"+(itemarr[j].month+1)+"-"+itemarr[j].date;
						var selflag=this.isSeledDt(itemarr[j].year,itemarr[j].month,itemarr[j].date);
						var classn=itemarr[j].place=='cur'?'mwin-date-cur':'mwin-date-old';
							classn+=(itemarr[j].valid?' mwin-date-canclick':'');
							classn+=(selflag?' mwin-date-selected':'');
						var pricestr=this.getDateprice(itemarr[j].year,itemarr[j].month,itemarr[j].date);
						var editstr=itemarr[j].valid?"<div class='price-show' contenteditable='true' >"+pricestr+"</div>":"";
						str+="<td class='"+classn+"' data-pick='"+dtstr+"'><div class='date-innercont'><div class='"+(itemarr[j].valid?"date-show":"date-oldshow")+"'>"+itemarr[j].date+"</div>"+editstr+"</div></td>";
					}
					str+="</tr>";
				}
					str+="</table></div>";
					return str;
			},
			prevent:function(evt){
				if(evt.preventDefault){
					evt.preventDefault();
				}else{
					evt.cancelBubble=true;
				}
			},
			isleap:function(yy){
				var mrun=yy%100==0&&yy%400==0?true:(yy%4==0?true:false);
				return mrun;
			},
			isSeledDt:function(yy,month,dd){
				var that=this;
				yy=parseInt(yy,'10');
				month=parseInt(month,'10');
				dd=parseInt(dd,'10');
				var seledDt=that.set.seledDt;
				for(var i=0;i<seledDt.length;i++){
					var seleditem=this.stringToDt(seledDt[i].date);
					var YY=seleditem.getFullYear();
					var MM=seleditem.getMonth();
					var DD=seleditem.getDate();
					if(yy==YY&&month==MM&&dd==DD){
						return true;
					}
				}
				return false;
			},
			isValidDt:function(dt){
				var set=this.set;
				var start=this.set.startDt;
				var end=this.set.endDt;
				var sflag=this.iscompareMin(start,dt);
				var eflag=this.iscompareMin(dt,end);
				if(sflag&&eflag){
					return true;
				}else{
					return false;
				}
					
			},
			iscompareMin:function(dt,compare){
				var yy=dt.getFullYear();
				var mm=dt.getMonth();
				var YY=compare.getFullYear();
				var MM=compare.getMonth();
				if(yy<YY||(yy==YY&&mm<=MM)){
					return true;
				}else{
					return false;
				}
			},
			reduceDays:function(dt,year,num){
				if(typeof num=='string'){
					num=parseInt(num,'10');
				}
				var yy=dt.getFullYear(),
						mm=dt.getMonth(),
						dd=dt.getDate();
				/**减去N年后的日期。
				**/
				if(year=='year'){
					yy-=num;
					var mon=this.isleap(yy)?months2:months;
					if(mon[mm]<dd){
						dd=mon[mm];
					}
				}
				if(year=='month'){
					mm-=num;
					while(mm<0){
						mm+=12;
						yy-=1;
					}
					var mon=this.isleap(yy)?months2:months;
					if(mon[mm]<dd){
						dd=mon[mm];
					}
				}
				if(year=='day'){
						dd-=num;
						var mon=this.isleap(yy)?months2:months;
						while(dd<0){
							dd+=mon[mm];
							mm-=1;
							if(mm<0){
								mm=11;
								yy-=1;
								mon=this.isleap(yy)?months2:months;
							}
						}
				}
				return new Date(yy,mm,dd);
			},
			addDays:function(dt,year,num){
					if(typeof num == 'string'){
						num=parseInt(num,'10');
					}
					var yy=dt.getFullYear(),
						mm=dt.getMonth(),
						dd=dt.getDate();
					/**添加N年后的日期
					 * **/
					if(year=='year'){
						yy+=num;
						var mon=this.isleap(yy)?months2:months;
						if(mon[mm]<dd){
							dd=mon[mm];
						}
					}
					/**
					 * 添加N个月后的日期
					 * **/
					if(year=='month'){
						mm+=num;
						while(mm>11){
							mm-=12;
							yy+=1;
						}
						var mon=this.isleap(yy)?months2:months;
						if(mon[mm]<dd){
							dd=mon[mm];
						}
						
					}
					/**
					 * 添加N天后的日期
					 * **/
					if(year=='day'){
						dd+=num;
						var mon=this.isleap(yy)?months2:months;
						while(dd>mon[mm]){
							dd-=mon[mm];
							mm+=1;
							if(mm>11){
								mm=0;
								yy+=1;
								mon=this.isleap(yy)?months2:months;
							}
						}
					}
				return new Date(yy,mm,dd);
			},
			formatDouble:function(mm){
				if(mm>=10){
					return mm;
				}
				return "0"+mm;
			},
			DtToString:function(date){
				var year=date.getFullYear();
				var month=date.getMonth();
				var day=date.getDate();
				return year+"-"+this.formatDouble((month+1))+"-"+this.formatDouble(day);
			},
			stringToDt:function(str){
				if(str instanceof Date){
					return str;
				}
				var numarr=[];
				var num;
				while((num=numReg.exec(str))!=null){
					numarr.push(num[0]);
				}
				var dtarr=[2015,11,27];
				for(var i=0;i<numarr.length;i++){
					if(i>=3){break;}
					dtarr[i]=numarr[i];
				}
				return new Date(dtarr[0],(dtarr[1]-1),dtarr[2]);
			},
			/**
			 * 根据开始日期，结束日期，当前日期，
			 *调用isleap：是否闰月，
			 *addDays:多少日子后的日期，
			 *返回一个json格式的7行6列数组。
			 **/
			getMonthJson:function(drawDt){
				var that=this,
					set=that.set;
				var start=set.startDt||new Date();
				var end=set.endDt||this.addDays(start, "month", 5);
				var curDt=that.set.curDt,curYY,curMM,curDD,curWW;
				var drawDt=drawDt||start;
				if(curDt!=undefined){
					curYY=curDt.getFullYear();
					curMM=curDt.getMonth();
					curDD=curDt.getDate();
					curWW=curDt.getDay();
				}
				var	drawYY=drawDt.getFullYear(),
					drawMM=drawDt.getMonth(),
					drawLeap=this.isleap(drawYY),
					sameMonth=false,
					preflag=false,
					afterflag=false,
					preYY=drawYY,//绘制月份的上一个月的信息。
					afterYY=drawYY,//绘制月份的下一个月的信息。
					preMM=drawMM,
					afterMM=drawMM;
				if(curDt&&drawYY==curYY&&drawMM==curMM){
					sameMonth=true;//渲染的年月份是否和选中的日期的年月份相同。
				}
					if(preMM==0){
						preYY-=1;
					}
					preMM=preMM-1<0?11:(preMM-1);//上一个月的月份。
					preNum=this.isleap(preYY)?months2[preMM]:months[preMM];
					if(afterMM==11){
						afterYY+=1;
					}
					afterMM=afterMM+1>11?0:(afterMM+1);//下一个月的月份。
					afterNum=this.isleap(afterYY)?months2[afterMM]:months[afterMM];
					var startYY=start.getFullYear(),
						startMM=start.getMonth(),
						startDD=start.getDate(),
						endYY=end.getFullYear(),
						endMM=end.getMonth(),
						endDD=end.getDate();
					if(drawYY==startYY&&drawMM==startMM){
						preflag=true;//判断绘制的月份是否在日期范围的开始位置。
					}
					if(drawYY==endYY&&drawMM==endMM){
						afterflag=true;//判断绘制的月份是否在日期范围的结束位置。因为内部适用方法，绘制的月份不可能大于结束日期月份或小于开始日期月份的，故不做超出的判断。
					}
					var date_panel_arr=[];
					var hoarr;
					var arrcount=0;//二维数组中的一维中的维数。
					var next_day=1;//下个月的初始日期
					var len=drawLeap?months2[drawMM]:months[drawMM];
					for(var i=1;i<=len;i++){
						var newdt=new Date(drawYY,drawMM,i);
						var week=newdt.getDay();
						if(i==1||week==0){
						  if(hoarr&&hoarr.length==7){
							  date_panel_arr.push(hoarr); 
						  }
						  arrcount++;
						  hoarr=[];
						}
						if(i==1){
							if(week>0){
							for(var k=0;k<week;k++){
								var dtobj={year:preYY,month:preMM,date:preNum-(week-k-1),valid:!preflag,place:'pre'};
								hoarr.push(dtobj);
							}
							}
						}
						if((preflag&&i<startDD)||(afterflag&&i>endDD)){
							var dtobj={year:drawYY,month:drawMM,date:i,valid:false,place:'cur'};//cur当前绘制的月份，
							hoarr.push(dtobj);//pre上一个月份，after下一个月份。valid是否是在有效日期范围中的日期.
						}else{	
							var dtobj={year:drawYY,month:drawMM,date:i,valid:true,place:'cur'};
							hoarr.push(dtobj);	
						}
						if(i==len){
							if(week<6){//最后一个日期如果不是周六的话，则补齐剩余的元素日期。
								for(var k=week;k<6;k++){
									var afterdt=new Date(afterYY,afterMM,next_day);
									var dtobj={year:afterYY,month:afterMM,date:next_day,valid:!afterflag,place:'after'};
									hoarr.push(dtobj);
									next_day++;
								}
								
							}
							date_panel_arr.push(hoarr);
						}
					}
					//如果不足6行数组，则补齐6行数组。
					if(arrcount<6){
						for(i=arrcount;i<6;i++){
							var lastarr=[];
							for(var j=0;j<=6;j++){
								var dtobj={year:afterYY,month:afterMM,date:next_day,valid:!afterflag,place:'after'};
								lastarr.push(dtobj);
								next_day++;
							}
							date_panel_arr.push(lastarr);
						}
					}
					return date_panel_arr;
			}
	};
	DateEditor.fn.init.prototype=DateEditor.fn;
	win.DateEditor=DateEditor;
}(jQuery,mOpen,window));