/**
 * 
 */

// 城市
var auth_city = "";
// 酒店电话
var auth_phone = "";
// 酒店名称
var auth_hotelName = "";
// 模板
var auth_temp = "";
// 背景图片
var auth_backgroupImg = "";

var auth_logoImg = "";

var auth_screenLayout = "全屏";
// 播放类型
var auth_playtype = "图片";

function getHotelInfo() {
	$.ajax({
		url : $.ctx + "getHotelinfo",
		data : {
			LOGINNAME : LoginName
		},
		dataType : "json",
		success : function(dat) {
			if (dat != undefined && dat.length > 0) {
				auth_hotelName = dat[0].NAME;
				$("title").html(auth_hotelName);
				$("div[data-key='hotelname']").html("").append(auth_hotelName);
				auth_phone = dat[0].PHONE;
				$("div[data-key='tel']").html("").append(auth_phone);

				auth_city = dat[0].CITY;

				getWeather();
				auth_temp = dat[0].CURRENTTEMP;
				auth_backgroupImg = dat[0].BACKGROUDIMG;
				auth_logoImg = dat[0].LOGOIMG;
				auth_screenLayout = dat[0].SCREENLAYOUT;
				auth_playtype = dat[0].PLAYTYPE;

				if (auth_screenLayout === "全屏图文") {
					$(".price-cont").width("100%");
					$(".pic-cont").width("0%");
				}
				if (auth_screenLayout === "二分之一") {
					$(".price-cont").width("50%");
					$(".pic-cont").width("50%");
				}
				if (auth_screenLayout === "三分之一") {
					$(".price-cont").width("35%");
					$(".pic-cont").width("65%");
				}
				if (auth_screenLayout === "全屏视频") {
					$(".price-cont").width("0%");
					$(".pic-cont").width("100%");
				}

				$(".logo").css(
						"background-image",
						"url(" + $.ctx + "uploadFiles/hotel/" + auth_logoImg
								+ ")");
				$(".blurbg").css(
						"background-image",
						"url(" + $.ctx + "uploadFiles/hotel/"
								+ auth_backgroupImg + ")");

				$("div[data-key='remark']").html("").attr("data-val",
						dat[0].CONTENT).append(dat[0].CONTENT);
				$("<link>").attr({
					rel : "stylesheet",
					type : "text/css",
					href : $.ctx + "static/hotel/linkskin" + auth_temp + ".css"
				}).appendTo("head");

				showPlay(auth_playtype);
			}
		}
	});
}
var issun = true;
var xhr, xhr2;
var u = navigator.userAgent;
var ismobile = u.indexOf("Android") > -1 || u.indexOf("Linux") > -1
		|| u.indexOf("Mobile") > -1 || u.indexOf("iPad") > -1;
var hasSession = false;

function showPIC(evt, th) {
	if (ismobile || !hasSession || isfullscreen()) {
		return;
	}
	$(th).find(".hoverimg").css({
		display : "block"
	});
}

function hidePIC(evt, th) {
	if (ismobile || !hasSession || isfullscreen()) {
		return;
	}
	$(th).find(".hoverimg").css({
		display : "none"
	});
}

function editCalendar(th) {
	var td = $(th).parents("td");
	var specialprice = td.attr("date-specialprice");
	var weekp = [];
	var datep = [];
	if (specialprice && specialprice.replace(/\s+/, "") != "") {
		var specialjson = JSON.parse(specialprice);
		if (specialjson.weekprice) {
			weekp = specialjson.weekprice;
		}
		if (specialjson.dateprice) {
			datep = specialjson.dateprice;
		}
	}
	DateEditor({
		startDt : (new Date()),
		weekPrice : weekp,
		seledDt : datep,
		closeCall : function(weekprice, dateprice) {
			var nowy = nowdt.getFullYear(), nowm = (nowdt.getMonth() + 1), nowd = nowdt
					.getDate();
			for (var i = 0; i < dateprice.length;) {
				var pricedt = dateprice[i].date.split("-");
				if (pricedt[0] < nowy
						|| (pricedt[0] == nowy && pricedt[1] < nowm)
						|| (pricedt[0] == nowy && pricedt[1] == nowm && pricedt[2] < nowd)) {
					dateprice.splice(i);
				} else {
					i++;
				}
			}
			var json = {
				weekprice : weekprice,
				dateprice : dateprice
			};
			// console.log(weekprice);
			var jsonstr = JSON.stringify(json);
			if ((weekprice != undefined && weekprice.length > 0)
					|| (dateprice != undefined && dateprice.length > 0)) {
				td.attr("date-specialprice", jsonstr);
				var calen = td.find(".calendar")[0];
				if (calen != undefined) {
					calen.className = 'calendar2';
					calen.style.display = 'block';
				}
			} else {
				td.removeAttr("date-specialprice");
				var elem = td.find(".calendar2")[0];
				if (elem != undefined) {
					elem.className = 'calendar';
				}
			}
			// console.log(jsonstr);
		}
	});
}

function addOnetr(th) {
	var str = "<tr>";
	for (var i = 0; i < 6; i++) {
		if (i == 0) {
			str += "<td onmouseenter='showDel(this)' onmouseleave='hideDel(this)'><div class='pricedel' onclick='delonetrprice(this)'></div>";
		} else {
			str += "<td onmouseenter='showCanlendar(this)' onmouseleave='hideCanlendar(this)'>";
		}
		if (i != 0) {
			str += "<div class='calendar' onclick='editCalendar(this)'></div>";
		}
		str += "<div class='priceitem' contenteditable='true'></div></td>";
	}
	str += "</tr>";
	var tr = $(th).parents("tr");
	$(str).insertBefore(tr);
	var stop = $(".price-setcont")[0].scrollTop;
	var endtop = $(".price-setcont")[0].scrollHeight
			- $(".price-setcont")[0].clientHeight;

	moAm($(".price-setcont")[0], 300, function(per) {
		var nowtop = (endtop - stop) * per + stop;
		$(".price-setcont")[0].scrollTop = nowtop;
	});
	// $(".price-setcont")[0].scrollTop=$(".price-setcont")[0].scrollHeight-$(".price-setcont")[0].clientHeight;
}

function delonetrprice(th) {
	$(th).parents("tr").remove();
}

//价格表更新
var selfsetwin;
function updateRoomprice(type) {
	var str = "<div class='roomloading'><img src='' class='loadingimg'></div>";
	$(".content-cont-inner").html(str);
	$(".content-cont-inner").stop();
	$(".content-cont-inner").css({
		top : "0%"
	});
	roomflag = false;

	$.ajax({    url : $.ctx + "hotelPrice",
				type : "get",
				data : {
					OTHER_PRICE : LoginName
				},
				dataType : "json",
				success : function(dat) {
					
					var rmheadstr = "<span class='ptype p-fixed theme-headname'>房型</span>";
					var pricestr = "";
					var width = "20%";
					var filterspan = "";
					var liheight = "20%";
					var membertypecount = 4;
					var housetypecount = 4;
					if (dat != undefined && dat.length > 0) {
						var hstyle = "style='font-size:24px;'";
						// 样式
						var membertypecountStr = dat[dat.length - 1].TYPESORT
								.split("_")[0];
						var housetypecountStr = dat[dat.length - 1].TYPESORT
								.split("_")[1];

						membertypecount = parseInt(membertypecountStr);
						housetypecount = parseInt(housetypecountStr);

						// 计算列的宽度
						width = ((100 / (housetypecount + 1)) + "%");

						if (dat.length >= ((housetypecount + 1) * 7)) {
							liheight = "16.666666%";
						}

						var rmheadstr = "";
						var pricestr = "<ul>";
						var wrapCss = 0;
						for (var int = 0; int < dat.length; int++) {

							if (int == (housetypecount + 1) * 7) {
								pricestr += "</li></ul><ul>";
							}
							var memberName = dat[int].MEMBERTYPE;
							var houseName = dat[int].HOUSETYPE;
							var mc = dat[int].TYPESORT.split("_")[0];
							var hc = dat[int].TYPESORT.split("_")[1];

							var wrap = 0;

							var price = dat[int].PRICE;
							if (price == "0") {
								price = "--";
							}

							if (mc == "0" && hc == "0") {

								rmheadstr += "<span class='ptype p-fixed theme-headname' "
										+ hstyle + " >" + houseName + "</span>";
							} else {
								if (hc != "0" && mc == "0") {
									rmheadstr += "<span class='ptype theme-headitem' "
											+ hstyle
											+ " >"
											+ memberName
											+ "</span>";
								} else {

									if (hc == "0") {
										pricestr += "<li class='"
												+ (wrapCss % 2 === 0 ? "odd"
														: "even")
												+ " p-ftype'  "
												+ "   onmouseenter='showPIC(event,this)' onmouseleave='hidePIC(event,this)'>";

										pricestr += "<span class='price-item p-fixed theme-pricename' "
												+ hstyle
												+ ">"
												+ houseName
												+ "</span>";
										wrapCss += 1;
									} else {
										wrap += 1;
										pricestr += "<span class='price-item theme-priceitem'   data-index="
												+ int
												+ " >"
												+ price
												+ "</span>";
										if (membertypecount == wrap) {
											pricestr += "</li>";
											wrap = 0;
										}
									}

								}
							}
						}

						backsize = "100% 40%";
						liheight = "20%";
						contheight = "83.333333%";
						ulheight = "20%";

						if (dat.length >= (housetypecount + 1) * 6) {

							pricestr += "</li></ul>";
						} else {
							pricestr += "</li>";
						}
						if (dat.length >= ((housetypecount + 1) * 7)) {
							backsize = "100% 33.3%";
							liheight = "16.666666%";
						}

						$(".theme-rmtype").css({
							"background-size" : backsize
						});

						$(".content-cont").css({
							height : contheight
						});
						$(".price-cont>ul").css({
							height : ulheight
						});

						$(".phead").html(rmheadstr);
						$(".content-cont-inner").html(pricestr);
						$(".price-item,.ptype").css({
							width : width
						});

						if (dat != undefined && dat.length > 0) {
							$(".content-cont ul li").css({
								height : liheight
							});
						}

						var len = $(".content-cont-inner").find("ul").length;

						if (len >= 2 && !roomflag) {
							roomtypeScrollinit();
						} else {
							if (len < 2 && roomflag) {
								roomflag = false;
								$(".content-cont-inner").stop();
								$(".content-cont-inner").css({
									top : "0%"
								});
							}
						}

					}
				}

			});
}

var firstflag = true;
function getBuyStatus() {
	/*
	 * $.getJSON("../isbuy?loginName=xxxxx", function (data) { if (data.code ==
	 * 1) { openBuy(data.msg); } else { buyflag = true; } });
	 */

	// openBuy("您没有购买");
}
var nowdt = new Date();
var buyflag = false;
var buytime;

function openBuy(msg) {
	C_alertToUrl(msg, location);
}
var datetimestr = "0,0,0";

function getWeather() {
	$.ajax({
		url : "http://api.map.baidu.com/telematics/v3/weather",
		type : "get",
		data : {
			location : auth_city,
			output : 'json',
			ak : '6tYzTvGZSOpYB5Oc2YGGOKt8'
		},
		/* 预期服务器端返回的数据类型，假设我现在跨域了，我就改成jsonp 就可以了 */
		dataType : "jsonp",
		success : function(data) {
			if (data.error == 0) {
				var rst = data.results[0].weather_data;
				var str = "";
				for (var i = 0; i < rst.length; i++) {
					if (i >= 3) {
						break;
					}
					var iurl = issun ? rst[i].dayPictureUrl
							: rst[i].nightPictureUrl;
					// iurl = iurl.substring(iurl.lastIndexOf(""), iurl.length);
					// iurl = "ms/fjp/weather/" + (issun ? "images-day" :
					// "images-night") + "" + iurl;
					if (i == 0) {
						var pms = data.results[0].pm25;
						var color = getColorbypm(pms);
						str += "<div class='weather-air'>";
						str += "<div class='air-text'>空气状况</div>";
						str += "<div><span class='air-pm' style='background:"
								+ color + "'>PM2.5</span>"
								+ data.results[0].pm25 + "</div>";
						str += "</div>";
					}

					str += "<div class='weather-item'>";
					str += "<div>" + (i == 0 ? '今天' : rst[i].date) + "</div>";
					str += "<div><img src='" + iurl + "'></div>";
					str += "<div>" + rst[i].weather + "</div>";
					str += "<div>" + rst[i].temperature + "</div>";
					str += "</div>";
				}
				$(".weather-cont").html(str);
			}
		}
	});
}
function advertisement(){
	
	// 投放广告
	$.getJSON($.ctx + 'advertisement/listData?LOGINNAME=' + LoginName,
			function(data) {

				var str = "";
				if (data.length) {

					for (var i = 0; i < data.length; i++) {

						var url = data[i].ADVIMG;
						str += "<div class='adcont2 ads' data-id='"
								+ data[i].id + "'><img src='" + $.ctx
								+ "uploadFiles/hotel/" + url + "'></div>";
					}
					$(".content-inner").append(
							"<div class='adcont2 ads' data-id='1'><img src='"
									+ $.ctx + "uploadFiles/hotel/" + url
									+ "'></div>");
					$(".content-inner").append(str);
					if (adtime) {
						clearTimeout(adtime);
						$(".content-inner").find(".ads").stop().css({
							left : "100%"
						});
					}

					adSlide();
				}
			});
	
}

$(function() {

	if (!isSupportFlex()) {
		$(".container").css({
			display : "none"
		});
		malert("此页面只支持chrome，火狐，IE10+浏览器展示");
		return;
	}
	resize();
	moTip.wrapper = $(".content")[0];
	if (window == top) {
		$("#openlink").css({
			display : "none"
		});
	}
	if (ismobile && window == top) {
		$(".help").css({
			display : "none"
		});
		$(".bottom").css({
			display : "none"
		});
		$("#file_upload_logo").css({
			display : "none"
		});
		$("[contenteditable]").attr("contenteditable", "false");
	}

	$(window).bind("resize", resize);
	

	

	if (!ismobile) {
		document.addEventListener("fullscreenchange", FShandler);
		document.addEventListener("webkitfullscreenchange", FShandler);
		document.addEventListener("mozfullscreenchange", FShandler);
		document.addEventListener("MSFullscreenChange", FShandler);
	}
	getHotelInfo();
	advertisement();
	updateRoomprice('2');
	
	window.setInterval(function(){
		getHotelInfo();
		advertisement();
		updateRoomprice('2');
	}, 60000);
	

	roomtypeScrollinit();
	getbarrage();
	FShandler();
	if (!ismobile) {
		$(document).bind("click", function() {
			hidefilter($(".filter")[0]);
		});
		initFilter();
		$(".pptype").bind("click", function() {
			var pats = $(this).parents(".filter-inner");
			var len = pats.find(".pptype:checked").length;
			if (len > 5 && this.checked == true) {
				this.checked = false;
				mtoast("最多只能显示5个会员级别", 1200, "info");
			} else {
				if (len == 0 && this.checked == false) {
					this.checked = true;
					mtoast("最少要显示一个会员级别", 1200, "info");

				}
			}
		});
	}
	

	$("#skin").val('1');
	$("#source").val("2");
	var orientation = $("#skin").find("option:selected").attr(
			"data-orientation");
	// 购买状态查询
	getBuyStatus();
//	paint();
	if (!ismobile) {
		var nowpage = 1;
		var canload = true;
	}
	getinitVer();
	// getServerTime();

});
function formate(str) {
	var str = parseInt(str);
	if (str < 10) {
		return "0" + str;
	} else {
		return str;
	}
}
var months = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ];
var months2 = [ 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ];
var week_china = [ "星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六" ];
function isleap(yy) {
	var mrun = yy % 100 == 0 && yy % 400 == 0 ? true : (yy % 4 == 0 ? true
			: false);
	return mrun;
}
var daycount = 0;
var openYY, openMM, openDD;
var reqcount = 0;
var reqnum = 0;
function animate_time() {

	var date = new Date();
	var yyyy = date.getFullYear();
	var mm = formate(date.getMonth() + 1);
	var dd = formate(date.getDate());
	var HH = formate(date.getHours());
	var MM = formate(date.getMinutes());
	var SS = date.getMilliseconds();
	var week = date.getDay();
	$("#date-ani").html(yyyy + "年" + mm + "月" + dd + "日");
	$("#p-week").html(week_china[week]);
	$(".hournum").text(HH);
	$(".minutenum").text(MM);
	if (SS < 500) {
		$("#dotcont").text(" ");
	} else {
		$("#dotcont").text(":");
	}
	if (openYY == undefined) {
		openYY = yyyy;
		openMM = mm;
		openDD = dd;
	}
	if (!(openYY == yyyy && openMM == mm && openDD == dd)) {
		openYY = yyyy;
		openMM = mm;
		openDD = dd;
		var sc = $("#source").val();
		if (sc != undefined && sc != "") {
			updateRoomprice(sc);
		} else {
			updateRoomprice('2');
		}
		getWeather();
		getBuyStatus();
	}

}
function getColorbypm(pm) {
	if (pm <= 50) {
		return "#43CE17";
	}
	if (pm > 50 && pm <= 100) {
		return "#EFDC31";
	}
	if (pm > 100 && pm <= 150) {
		return "#FFAA00";
	}
	if (pm > 150 && pm <= 200) {
		return "#FF401A";
	}
	if (pm > 200 && pm <= 300) {
		return "#D20040";
	}
	if (pm > 300) {
		return "#9C0A4E";
	}
}
function paint() {
	requestA(paint);
	animate_time();
}
var over;
function getinitVer() {
	getPriceVer();
}
function getPriceVer() {
	updateRoomprice('2');
}