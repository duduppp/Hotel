<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<base href="<%=basePath%>">
	<!-- 下拉框 -->
	<link rel="stylesheet" href="static/ace/css/chosen.css" />
	<!-- jsp文件头和头部 -->
	<%@ include file="../../system/index/top.jsp"%>
	<script type="text/javascript" src="static/ace/js/jquery.js"></script>
	<!-- 日期框 -->
	<link rel="stylesheet" href="static/ace/css/datepicker.css" />
	<!-- 上传插件 -->
	<script type="text/javascript">
		var jsessionid = "<%=session.getId()%>";  //勿删，uploadify兼容火狐用到
	</script>
	<link href="<%=basePath%>plugins/uploadify/uploadify.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="<%=basePath%>plugins/uploadify/swfobject.js"></script>
	<script type="text/javascript" src="<%=basePath%>plugins/uploadify/jquery.uploadify.v2.1.4.min.js"></script>
</head>
<body class="no-skin">
<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
	<!-- /section:basics/sidebar -->
	<div class="main-content">
		<div class="main-content-inner">
			<div class="page-content">
				<div class="row">
					<div class="col-xs-12" >					
					  
					  	<ul id="myTab" class="nav nav-tabs">
						   <li class="active">
						  	    <a href="#home" data-toggle="tab">第一步 加入待打印商品</a> 
						   </li>
						   <li>
						   		<a href="#second" data-toggle="tab">第二步 打印标签</a>
						   </li>
						 
						</ul>
						<div id="myTabContent"  class="tab-content"  >
						   <div class="tab-pane fade in active" id="home" style="height:450px;margin-top: 0px;">
						      	<div  style="float: left;width: 69% ;height: 100%;border: 1px solid #4c8fbd;">
						      	<table id="table_report" class="table table-bordered " style="margin-top:5px;">	
									<thead>
										<tr>
											<th class="center" style="width:35px;">
											<label class="pos-rel"><input type="checkbox" class="ace" id="zcheckbox" /><span class="lbl"></span></label>
											</th>
											<th class="center" style="width:50px;">序号</th>
													<th class="center">条码</th>
													<th class="center">名称</th>
													<th class="center">价格</th>
									    </tr>
								   </thead>
											<c:choose>
											<c:when test="${not empty pdList}">
												<c:forEach items="${pdList}" var="var" varStatus="vs">
													<tr height="30px">
														<td class='center'>
															<label class="pos-rel">  
																<input type='checkbox' name='ids' value="${var.WAREMESSAGE_ID}" class="ace" />
																<span class="lbl"></span>
															</label>
														</td>
														<td class='center' style="width: 30px;">${vs.index+1}</td>
														<td class='center'>${var.WARE_BARCODE}</td>
														<td class='center'>${var.WARENAME}</td>
														<td class='center'>${var.SHOPPINGPRICE}</td>
													</tr>
												</c:forEach>
											</c:when>
											</c:choose>
										</table>
						      	<table   class="table"  style="width: 100%;">	
						      		<tr>
						      			<td> 
					      					<a  style="width: 80px;  border-radius:5px;-moz-border-radius:5px;" class="btn btn-mini btn-success" onclick="clearPrintTable();" title="批量删除" >
											清空列表
											</a>
						      			 </td>
						      			 <td> 
					      					<a  style="width: 80px;  border-radius:5px;-moz-border-radius:5px;" class="btn btn-mini btn-success" onclick="delSelecedCheckbox();" title="批量删除" >
											 删除选中
											</a>
						      			 </td>
						      			 <td>
						      			 </td>
						      		<tr>
						      		</tr>
						      			 <td colspan="2" > 
						      			 	<input type="file"  name="File_name" id="uploadify1" keepDefaultStyle="true"/>
					      					
						      			 </td>						      			 
						      			 <td>
						      			 <a  style="width: 80px;  border-radius:5px;-moz-border-radius:5px;" class="btn btn-mini btn-success"  onclick="uploadExcel('uploadify1');">
											 	导入列表
											</a>
						      			 </td>
						      		
						      		</tr>
						      	</table>
						      	</div> 
						      	<div  style="float: right;width: 30%;height:450px;" >
						      		<table  style="float: right;width: 100%;height:100%;margin-top:1px;  border: 1px solid #4c8fbd;margin-left:0px;">
						      				<tr height="40px;">
						      					<td >&nbsp;</td>
						      					<td >条码</td>
						      				</tr>
						      				<tr>
						      					<td >&nbsp;</td>
						      					<td> 
						      						<input type="text" name="add_barcode" id="add_barcode" value="" maxlength="255" placeholder="这里输入进货价" title="进货价" style="width:80%;"/>
						      				    </td>
						      				</tr>
						      				<tr>
						      					<td >&nbsp;</td>
						      					<td>名称</td>
						      				</tr>
						      				<tr>
						      					<td >&nbsp;</td>
						      					<td>
						      						<input type="text" name="add_productname" id="add_productname" value="" maxlength="255" placeholder="这里输入进货价" title="进货价" style="width:80%;"/>
						      					</td>
						      				</tr>
						      				
						      				<tr>
						      					<td>&nbsp;</td>
						      					<td>价格</td>
						      				</tr> 
						      				<tr>
						      					<td >&nbsp;</td>
						      					<td>
						      						<input type="checkbox" checked="checked" />
						      						￥<input type="text" name="add_price" id="add_price" value="" maxlength="255" placeholder="这里输入进货价" title="进货价" style="width:68%;"/>
						      					</td>
						      				</tr>
						      				<tr>
						      					<td >&nbsp;</td>
						      					<td>打印数量</td>
						      				</tr>
						      				<tr>
						      					<td >&nbsp;</td>
						      					<td> 
						      						<input type="text" name="add_num" id="add_num" value="" maxlength="255" placeholder="这里输入进货价" title="进货价" style="width:80%;"/>
						      					</td>
						      				</tr>
						      				<tr>
						      					<td>&nbsp;</td>
						      					<td> 
						      						<a  style="width: 130px;  border-radius:5px;-moz-border-radius:5px;" class="btn btn-mini btn-success" onclick="addPrint();" title="批量删除" >
														<i class='ace-icon fa fa-print bigger-120'>加入待打印列表</i>
													</a>
						      					</td>
						      				</tr>
						      		</table>
						      	</div>
						   </div>
						   <div class="tab-pane fade" id="second">
						      	  <div class="tab-pane fade in active" id="home" style="height:450px;">
							      	<div id="printTestId"  style="float: left;width: 69% ;height: 100%;border: 1px solid #4c8fbd;">
							   				标签预览
							   		 <table id="barcode"  border="0">
					   					<tr style="height: 30px;">
					   						<td style="text-align: center;font-size: 18px;font-weight: bold;" >商品名称</td>	
					   					</tr>
					   					<tr style="height: 15px;">
					   						<td  style="padding-left:20px; font-family:'仿宋';font-style: italic;">￥19.80</td>
					   					</tr>
					   					<tr>
					   						<td>
					   							<div id="bcTarget" class="barcodeImg" style="margin: 0px 0px;"></div>
					   						</td>
					   					</tr>
					   					<tr style="height: 20px;">
					   						<td  style="text-align: center;">6914973600041</td>
					   					</tr>
							   		 </table>
							   		<!-- -------------隐藏式模板 --------------> 
							   		<div id="printTempTable" style="display: none;">
									   	 <table   border="0"   >
							   				 <tr style="height: 30px;">
							   					<td style="text-align: center;font-size: 18px;font-weight: bold;" >@productName</td>	
							   				 </tr>
							   				 <tr style="height: 15px;">
							   					<td  style="padding-left:20px; font-family:'仿宋';font-style: italic;">￥@productPrice</td>
							   				 </tr>
						   					 <tr>
						   						<td  id="bcTargetDIV">
						   							<div id="bcTargetImg" class="barcodeImg" style="margin: 0px; padding: 0px; overflow: auto; width: 174px;"></div>
						   						</td>
						   					 </tr>
							   				 <tr style="height: 20px;">
							   						<td  style="text-align: center;">@productCode</td>
							   				 </tr>
									   		 </table>
							   		 </div>
							      	   	<table   class="table"  style="width: 100%;">	
						      		    <tr>
						      			 <td> 
					      					  	&nbsp;&nbsp;
						      			 </td>
						      			 <td> 
					      				  	&nbsp;&nbsp;
						      			 </td>
						      			  <td> 
						      			  	&nbsp;&nbsp;
						      			  </td>
						      			  <td> 
					      					<a  style="width: 80px;  border-radius:5px;-moz-border-radius:5px;" class="btn btn-mini btn-danger" onclick="printTableData();" title="批量删除" >
											 		<i class='ace-icon fa fa-print bigger-120'> 打印</i>
											</a>
						      			 </td>
						      		
						      		</tr>
						      	</table>
							      </div>
						      	<div  style="float: right;width: 30%;height:450px;" >
						      		<table  style="width: 100%;height:100%;margin-top:1px;  border: 1px solid #4c8fbd;margin-left:0px;">
						      				<tr height="40px;">
						      					<td >&nbsp;</td>
						      					<td >标签大小</td>
						      				</tr>
						      				<tr>
						      					<td >&nbsp;</td>
						      					<td> 
						      					
						      					宽度	<input type="text" name="STOCKPRICE" id="STOCKPRICE" value="" maxlength="255"  style="width:30%;"/>
						      					
						      					高度  <input type="text" name="STOCKPRICE" id="STOCKPRICE" value="" maxlength="255" style="width:30%;"/>
						      				    </td>
						      				</tr>
						      				<tr>
						      					<td >&nbsp;</td>
						      					<td>名称位置</td>
						      				</tr>
						      				<tr>
						      					<td >&nbsp;</td>
						      					<td>
						      					左边	<input type="text" name="STOCKPRICE" id="STOCKPRICE" value="" maxlength="255"  style="width:30%;"/>
						      					
						      					顶边  <input type="text" name="STOCKPRICE" id="STOCKPRICE" value="" maxlength="255"  style="width:30%;"/>
						      					</td>
						      				</tr>
						      				 <tr>
						      					<td >&nbsp;</td>
						      					<td>字体 <input type="text" name="STOCKPRICE" id="STOCKPRICE" value="" maxlength="255"  style="width:80%;"/></td>
						      				</tr>
						      				<tr>
						      					<td>&nbsp;</td>
						      					<td>条码大小：</td>
						      				</tr> 
						      				<tr>
						      					<td >&nbsp;</td>
						      					<td>
						      						宽度	<input type="text" name="STOCKPRICE" id="STOCKPRICE" value="" maxlength="255"  style="width:30%;"/>
						      					
						      						高度  <input type="text" name="STOCKPRICE" id="STOCKPRICE" value="" maxlength="255" style="width:30%;"/>
						      					</td>
						      				</tr>
						      				<tr>
						      					<td >&nbsp;</td>
						      					<td>
						      					左边	<input type="text" name="STOCKPRICE" id="STOCKPRICE" value="" maxlength="255"  style="width:30%;"/>
						      					
						      					顶边  <input type="text" name="STOCKPRICE" id="STOCKPRICE" value="" maxlength="255"  style="width:30%;"/>
						      					</td>
						      				</tr>
						      			 
						      				<tr>
						      					<td >&nbsp;</td>
						      					<td> 
						      						<a  style="width: 130px;  border-radius:5px;-moz-border-radius:5px;" class="btn btn-mini btn-success" onclick="printdiv();" title="批量删除" >
														<i class='ace-icon fa fa-print bigger-120'>恢复默认设置</i>
													 
													</a>
						      					</td>
						      				</tr>
						      			</table>
						      	 	</div> 
						      	</div>
						   </div>
						</div>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.page-content -->
		</div>
	</div>
	<!-- /.main-content -->
</div>
<!-- /.main-container -->
	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
 	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	
	<!-- 二维码的 生成 -->
	<script type="text/javascript" src="plugins/barcode/jquery-barcode.js"></script>
	
	<script type="text/javascript">
	
	function uploadExcel(upId){
		$('#'+upId).uploadifyUpload(); 
	}
	function setUploadBtn(upId,id,imgid){
		 var str=""; 
			$("#"+upId).uploadify({   
				'buttonImg'	: 	"<%=basePath%>static/images/fileup.png",
				'uploader'	:	"<%=basePath%>plugins/uploadify/uploadify.swf",
				'script'    :	"<%=basePath%>plugins/uploadify/uploadFile.jsp;jsessionid="+jsessionid,
				'cancelImg' :	"<%=basePath%>plugins/uploadify/cancel.png",    
				'folder'	:	"<%=basePath%>uploadFiles/product/",//上传文件存放的路径,请保持与uploadFile.jsp中PATH的值相同
				'queueId'	:	"fileQueue",  
				'displayData'    : 'speed',
				'queueSizeLimit'	:	1,//限制上传文件的数量 
				'fileExt'     : '*.xls;*.xlsx;',
				'fileDesc'    : '*.xls,*.xlsx', 
				'auto'		:	false,
				'multi'		:	false,//是否允许多文件上传
				'simUploadLimit':	1,//同时运行上传的进程数量
				'buttonText':	"files",
				 'removeCompleted': true,
				'scriptData':	{'uploadPath':'/uploadFiles/product/'},//这个参数用于传递用户自己的参数，此时'method' 必须设置为GET, 后台可以用request.getParameter('name')获取名字的值
				'method'	:	"GET",
				'onComplete':function(event,queueId,fileObj,response,data){  
					str = response.trim();//单个上传完毕执行  
				},
				'onAllComplete' : function(event,data) {
					//全部上传完毕执行
					var excelFile="uploadFiles/product/"+str;
					
	 
					$.ajax({
						type: "POST",
						url:'<%=basePath %>waremessage/getExcelData.do',
						data:{
							excelFilePath:excelFile
						},
						success: function(result){
						   if(null!=result){
							   for(var i in result){
								  
								   var len=$("input[name='ids']").length;
								   var data=result[i];
								   var appendStr="<tr height='30px'><td class='center'><label class='pos-rel'><input type='checkbox' name='ids' value='' class='ace' /><span class='lbl'></span></label></td>";
									appendStr+="<td class='center' style='width: 30px;'>"+(len+1)+"</td>";
									appendStr+="<td class='center'>"+data[1]+"</td>";	
									appendStr+="<td class='center'>"+data[0]+"</td>";
									appendStr+="<td class='center'>"+data[2]+"</td></tr>";
									$("#table_report").append(appendStr);
								  
							   }
						   }
						}
					});
		    	},
		    	 'onError': function(event, queueID, fileObj) {
		    	      alert("文件:" + fileObj.name + "上传失败");
		    	  },
		    	'onSelect' : function(event, queueId, fileObj){
		    		$("#hasTp1").val("ok");
		    	}
			});
		}
	
	
	function clearPrintTable(){
			
		$("#table_report tr").each(function (i) {
			if(i>0){
				$(this).remove();	
			}
		});
	}
	
	/***
	*  删除打印队列
	*/
	function delSelecedCheckbox(){
		
		var len=$("input[name='ids']").length;
	    for(var i=len;i>0;i--){
		    if(document.getElementsByName('ids')[i-1].checked==true){  
		    	$("#table_report tr").eq(i).remove();
		    }  
		}
	}
	/**
	 *  添加打印队列
	*/
	function addPrint(){
		var add_barcode=$("#add_barcode").val();
		var add_productname=$("#add_productname").val();
		var add_price=$("#add_price").val();
		var add_num=$("#add_num").val();
		
		if(""==add_barcode){
			
			$("#add_barcode").tips({
				side:1,
	            msg:'填写数据',
	            bg:'#AE81FF',
	            time:8
	        });
			return;
		}
		
		if(""==add_productname){
			
			$("#add_productname").tips({
				side:1,
	            msg:'填写数据',
	            bg:'#AE81FF',
	            time:8
	        });
			return;
		}
		
		if(""==add_price){
			
			$("#add_price").tips({
				side:1,
	            msg:'填写数据',
	            bg:'#AE81FF',
	            time:8
	        });
			return;
		}
		
		if(""==add_num){
			
			$("#add_num").tips({
				side:1,
	            msg:'填写数据',
	            bg:'#AE81FF',
	            time:8
	        });
			return;
		}
		var len=$("input[name='ids']").length;
		var appendStr="<tr height='30px'><td class='center'><label class='pos-rel'><input type='checkbox' name='ids' value='' class='ace' /><span class='lbl'></span></label></td>";
		appendStr+="<td class='center' style='width: 30px;'>@len</td>";
		appendStr+="<td class='center'>"+add_barcode+"</td>";	
		appendStr+="<td class='center'>"+add_productname+"</td>";
		appendStr+="<td class='center'>"+add_price+"</td></tr>";
		
		for(var i=0;i<add_num;i++){
			appendStr=appendStr.replace(/@len/g,++len); 
			$("#table_report").append(appendStr);
		}
	}
	/**
	*  打印队列列表
	*/
	function printTableData(){
		
	    var productHtml='<table id="barcode"  border="0">'+
			'<tr style="height: 30px;">'+
			'<td style="text-align: center;font-size: 18px;font-weight: bold;" >@productName</td>'+	
			'</tr>'+
			'<tr style="height: 15px;">'+
			'<td  style="padding-left:20px; font-family:\'仿宋\';font-style: italic;">￥@productPrice</td>'+
			'</tr>'+
			'<tr>'+
			'<td>'+
				'@img'+
			'</td>'+
			'</tr>'+
			'<tr style="height: 20px;">'+
			'<td  style="text-align: center;">@productCode</td>'+
			'</tr>'+    
	 		'</table>';
	    
	    var newhtml= $("#printTestId" ).html(); 
	 
		 
    	$("#table_report tr").each(function (i) {
    		  var headhtml = "<html><head><title></title></head><body>";
    		    var foothtml = "</body>";
    		if(i>0){
				var newhtml=productHtml;
				var barValue="";
				
			  $(this).find("td:gt(1)").each(function(j){
				  //这个可以优化代码。
				  if(j==0){
					  barValue= $(this).text();
					  newhtml=newhtml.replace(/@productCode/g, $(this).text());
				  }
				  if(j==1){
					  
					  newhtml= newhtml.replace(/@productName/g, $(this).text());
				  }
				  if(j==2){
					 //转成货币格式  
					 var price=parseFloat($(this).text()).toFixed(2);
					 newhtml=newhtml.replace(/@productPrice/g,price );
				  }
			  });
	 
			   $("#bcTargetImg").empty().barcode(barValue, "ean8",{barWidth:2, barHeight:65,showHRI:false});
			   newhtml=newhtml.replace(/@img/g,$("#bcTargetDIV").html());
			   var oldhtml = document.body.innerHTML; 
			   document.body.innerHTML = headhtml + newhtml + foothtml;
			   window.print();
			   document.body.innerHTML = oldhtml; 
			}
			
		});
    	//打印完成，删除打印列表
    	delSelecedCheckbox();
	}
	
	
	/**
	 * 打印当前页面
	 */
	function printpage() {
	    window.print();
	}

	function printdiv() {
	    var headhtml = "<html><head><title></title></head><body>";
	    var foothtml = "</body>";
	    var newhtml= $("#printTestId" ).html(); 
	    var oldhtml = document.body.innerHTML; 
	    document.body.innerHTML = headhtml + newhtml + foothtml;
	    window.print();
	    document.body.innerHTML = oldhtml; 
	    return false;
	    
	}
	
	
	
	$(top.hangge()); 
		$(function() {
			
			setUploadBtn('uploadify1','PICTURE1','img1'); 
			
			var barValue="6914973600041";
			$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
				// 获取已激活的标签页的名称
				var activeTab = $(e.target).text(); 
				// 获取前一个激活的标签页的名称
				var previousTab = $(e.relatedTarget).text(); 
				$(".active-tab span").html(activeTab);
				$(".previous-tab span").html(previousTab);
			});
			
			
		 //   $('#myTab li:eq(0) a').tab('show'); 
	 		
			$("#bcTarget").empty().barcode(barValue, "ean8",{barWidth:2, barHeight:65,showHRI:false});
	 		
	 		
		});
	</script>
</body>
</html>