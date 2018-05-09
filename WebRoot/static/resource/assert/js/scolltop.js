/**
 * 
 */

$("header nav .icon_menu").click(function(){
	$(this).siblings("ul").toggleClass("show");
});
$("#panel .icons li").not(".up,.down").mouseenter(function(){
	$("#panel .info").addClass('hover');
	$("#panel .info li").hide();
	$("#panel .info li."+$(this).attr('class')).show();
});
$("#panel").mouseleave(function(){
	$("#panel .info").removeClass('hover');
})
$(".icons .up").click(function(){
 	 $(document).scrollTop(0);
});
$(".icons .down").click(function(){
	var h = document.body.scrollTop+300;
	  $(document).scrollTop(h);
});
/* $(".index_cy").click(function(){
    $("#panel").toggle();
	$(".index_cy").addClass('index_cy2');
	$(".index_cy2").removeClass('index_cy');
});*/