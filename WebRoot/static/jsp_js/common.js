
/**
 * checkbox 选中
 * 
 * background-color: #FAFAD2;
 */
function selectChk(tableId, backVar) {
	$("#" + tableId).find("tr").bind("click", function() {
		$("#" + tableId).find("tr").css("background-color","");  
		$(this).css("background-color","#FAFAD2");
		var chkObj = $(this).find("input[type=checkbox]");
		if ($(chkObj).is(":checked")) {
			$(chkObj).removeAttr("checked");
		} else {
			$(chkObj).prop("checked", true);
			//得到  行的编号，业务主键号码
			backVar = $(chkObj).val();  
	 
		}
	}); 
}

//格式化时间
var formatDateTime = function (date) {  
    var y = date.getFullYear();  
    var m = date.getMonth() + 1;  
    m = m < 10 ? ('0' + m) : m;  
    var d = date.getDate();  
    d = d < 10 ? ('0' + d) : d;  
  
    return y + '-' + m + '-' + d;  
}; 

