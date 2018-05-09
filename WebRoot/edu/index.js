/**
 *
 */
var mySwiper = new Swiper('.swiper-container', {
		pagination: '.pagination',
		loop: true,
		visibilityFullFit: true,
		autoplay: 5000,
		paginationClickable: true,
		preventClicks: false,
		noSwiping: true,
		effect: 'flip'
	});

function AutoScroll(obj) {
	$(obj).find("ul:first").animate({
		marginTop: "-16px"
	},
		500,
		function () {

		$(this).css({
			marginTop: "0px"
		}).find("li:first").appendTo(this);
		var txt = $(this).css({
				marginTop: "0px"
			}).find("li:first a").attr("txtid");
		$("#scrolldiv img").each(function (index) {
			$(this).attr("src", "static/edu/images/shouye/gun1.png");
		});
		$("img[txt='" + txt + "']").attr("src",
			"static/edu/images/shouye/gun2.png");
	});
}
$(document).ready(
	function () {
	setInterval('AutoScroll("#scrolldiv")', 5000);

	function mySideChange(front) {
		if (front) {
			$(this).css('background', 'none');
		} else {
			$(this).css('background', 'none');
		}
	}

	function myComplete() {
		$('#ex1,#ex2,#ex3,#ex4,#ex5,#ex6,#ex7,#ex8,#ex9,#ex10').css(
			'backgroundColor', 'none');
	}

	$('#ex1,#ex2,#ex3,#ex4,#ex5,#ex6,#ex7,#ex8,#ex9,#ex10').click(
		function () {
		$(this).rotate3Di('360', 500, {
			sideChange: mySideChange,
			complete: myComplete
		});
	});
	
	$('#searchId').bind('keypress', function(event) {  
        if (event.keyCode == "13") {              
            event.preventDefault();   
            //回车执行查询  
            queryTitle();
        }  
    });  
	
	
	
});

/**
 * 打开连接，判断否登录
 * @param url
 */
function openLink(url) {

	if ($.trim(userName).length > 0) {
		window.location.href = url;
	} else {
		window.location.href = "./edu/win_login.jsp";
	}
}

function clickMore() {

	layer.alert('尽情期待', {
		icon: 6
	});
}

function userProcess() {
	if ($.trim(userName).length > 0) {
		window.location.href = ctx+"edu/user.jsp";
	} else {
		window.location.href = ctx+"edu/win_login.jsp";
	}
}

/**
 * 搜索查询
 */ 
function queryCourse() {
	
	if (event.keyCode == 13){
		alert("---------------huiche-------------------");
		queryTitle();
	}
}
/**
 * 搜索查询
 */
function queryTitle(){
	var src="";
	if ($.trim(userName).length > 0) {
		  
		var searchText = $("#searchId").val(); 
		src = ctx+"edu/rankingList.jsp?COURSETITLE="+searchText;     
	 
	} else {
		src=ctx+"edu/win_login.jsp";  
	}
	window.location.href=src;
}

function goLecturerCoursePage(){
	
	if ($.trim(userName).length > 0) {
		var url="./goLecturerCoursePage";
		$.ajax({
			url:url,
			dataType:'json',
			success:function(data){
				if(data==1){
					 window.location.href = "./edu/lecturerCourse.jsp";  
				}else{
					layer.alert('没有权限', {
						icon: 6
					});
				}
			}
		});
	} else {
		window.location.href = "./edu/win_login.jsp";
	}	
	
}





