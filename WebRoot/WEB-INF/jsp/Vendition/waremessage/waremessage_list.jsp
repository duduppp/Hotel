<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
<!-- jsp文件头和头部 -->
<%@ include file="../../system/index/top.jsp"%>

 
 
<!-- 日期框 -->
<link rel="stylesheet" href="static/ace/css/datepicker.css" />
<link rel="stylesheet" href="static/contextmenu/jquery.contextMenu.css" />
<link rel="stylesheet" href="static/tableui/jquery.tableui.css" />
<link rel="stylesheet" href="static/ace/css/datepicker.css" />
</head>
<body class="no-skin">

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">
							
						<!-- 检索  -->
						<form action="waremessage/list.do" method="post" name="Form" id="Form">
						<table   style="margin-top:5px;">
							<tr>
								<td>
									<span class="input-icon">
											<c:if test="${QX.add == 1 }">
												<a class="btn btn-mini btn-success" style="width: 100px;  border-radius:5px;-moz-border-radius:5px;" onclick="add();">
													<i class='ace-icon icon-plus bigger-120'>  新增</i></a>
											 </c:if>
									</span>
								</td>
									<td>
									<span class="input-icon">
											<c:if test="${QX.add == 1 }">
												<a class="btn btn-mini btn-success" style="width: 100px;  border-radius:5px;-moz-border-radius:5px;" onclick="add();">
													<i class='ace-icon icon-print bigger-120'>  打印条码</i></a>
											 </c:if>
									</span>
								</td>
								<td>
									<span class="input-icon">
											<c:if test="${QX.add == 1 }">
												<a class="btn btn-mini btn-success" style="width: 100px;  border-radius:5px;-moz-border-radius:5px;" onclick="add();">
													<i class='ace-icon icon-plus bigger-120'>  导入商品</i></a>
											 </c:if>
									</span>
								</td>
								<td style="padding-left:2px;">
										<c:if test="${QX.del == 1 }">
												<a  style="width: 100px;  border-radius:5px;-moz-border-radius:5px;" class="btn btn-mini btn-danger" onclick="makeAll('确定要删除选中的数据吗?');" title="批量删除" >
												<i class='ace-icon fa fa-trash-o bigger-120'>批量删除</i></a>
												</c:if>
								</td>
								<td style="padding-left:2px;">
									<select class="form-control" name="name" id="types" data-placeholder="请选择" style="vertical-align:top;width: 120px;">
									<option value="">全部分类</option>
									</select>
								</td>
							 	<td style="padding-left:2px;">
								<select class="form-control" name="name" id="supplay" data-placeholder="请选择" style="vertical-align:top;width: 120px;">
									<option value="">全部供货商</option>
									</select>
								</td>
								<td style="vertical-align:top;padding-left:2px;">
								 	<select class="form-control" name="queryName" id="queryName" data-placeholder="请选择" style="vertical-align:top;width: 120px;">
									<option value="">排序</option>
									<option value="STOCK">商品库存</option>
									<option value="WARESTYPES">商品分类</option>
									<option value="WARENAME">商品名称</option>
									<option value="SUPPLIER">供货商</option>
									<option value="WARE_BARCODE">商品id</option>
								  	</select>
								</td>
								<td style="padding-left:2px;">
									<span class="input-icon">
											<input type="text" placeholder="这里输入关键词" class="nav-search-input" id="nav-search-input" autocomplete="off" name="queryValue" value="${pd.queryValue }" placeholder="这里输入关键词"/>
											<i class="ace-icon fa fa-search nav-search-icon"></i>
										</span>
								</td>
								<c:if test="${QX.cha == 1 }">
								<td style="vertical-align:top;padding-left:2px">
								 
										<a class="btn btn-light btn-xs"  style="margin-top: 2px;" onclick="tosearch();"  title="检索">
										<i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"> 查找商品</i></a>
									 
								</td>
								</c:if>
								<c:if test="${QX.toExcel == 1 }"><td style="vertical-align:top;padding-left:2px;">
									<a  style="margin-top: 2px;" class="btn btn-light btn-xs" onclick="toExcel();" title="导出到EXCEL">
									<i id="nav-search-icon" class="ace-icon fa fa-download bigger-110 nav-search-icon blue"></i></a>
								</td>
							</c:if>
							</tr>
						</table>
						<!-- 检索  -->
					
						<table id="table_report" class="table table-bordered " style="margin-top:5px;">	
							<thead>
								<tr>
									<th class="center" style="width:35px;">
									<label class="pos-rel"><input type="checkbox" class="ace" id="zcheckbox" /><span class="lbl"></span></label>
									</th>
									<th class="center" style="width:50px;">序号</th>
											<th class="center">商品条码</th>
											<th class="center">商品名称</th> 
											<th class="center">商品原价</th>
											<th class="center">会员价</th>
											<th class="center">购物卷</th>
											<th class="center">库存</th>
											<th class="center">库存价值</th>
											<th class="center">单位</th>
											<th class="center">规格</th>
											<th class="center">货号</th>
											<th class="center">商品分类</th>
											<th class="center">供货商</th>
											<th class="center">生产日期</th>
											<th class="center">保质期</th>
									<th class="center">操作</th>
								</tr>
							</thead>
													
							<tbody>
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty varList}">
									<c:if test="${QX.cha == 1 }">
									<c:forEach items="${varList}" var="var" varStatus="vs">
										<tr>
											<td class='center'>
												<label class="pos-rel">
												<input type='checkbox' name='ids' value="${var.WAREMESSAGE_ID}" class="ace" /><span class="lbl"></span></label>
											</td>
											<td class='center' style="width: 30px;">${vs.index+1}</td>
											<td class='center'>${var.WARE_BARCODE}</td>
											<td class='center'>${var.WARENAME}</td>
											<td class='center'>${var.RATE}</td>
											<td class='center'>${var.VIPPRICE}</td>
											<td class='center'>${var.SHOPPINGPRICE}</td>
											<td class='center'>${var.STOCK}</td>			
											<td class='center'>${var.STOCKPRICE}</td>		
											<td class='center'>${var.UNIT}</td>			
											<td class='center'>${var.STANDARD}</td>
											<td class='center'>${var.ARTNO}</td>
											<td class='center'>${var.WARESTYPES}</td>
											<td class='center'>${var.SUPPLIER}</td>
											<td class='center'>${var.PRODUCTDATE}</td>
											<td class='center'>${var.QUALITYDATE}</td>
											<td class="center">
												<c:if test="${QX.edit != 1 && QX.del != 1 }">
												<span class="label label-large label-grey arrowed-in-right arrowed-in"><i class="ace-icon fa fa-lock" title="无权限"></i></span>
												</c:if>
												<div class="hidden-sm hidden-xs btn-group">
														<c:if test="${QX.edit == 1 }">
														<a class="btn btn-xs btn-success" title="编辑" onclick="edit('${var.WAREMESSAGE_ID}','0');">
															<i class="ace-icon fa fa-pencil-square-o bigger-120" title="编辑"></i>
														</a>
														</c:if>
														<c:if test="${QX.del == 1 }">
														<a class="btn btn-xs btn-danger" onclick="del('${var.WAREMESSAGE_ID}');">
															<i class="ace-icon fa fa-trash-o bigger-120" title="删除"></i>
														</a>
														</c:if>
												</div>
												<div class="hidden-md hidden-lg">
													<div class="inline pos-rel">
														<button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown" data-position="auto">
															<i class="ace-icon fa fa-cog icon-only bigger-110"></i>
														</button>
			
														<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
															<c:if test="${QX.edit == 1 }">
															<li>
																<a style="cursor:pointer;" onclick="edit('${var.WAREMESSAGE_ID}','0');" class="tooltip-success" data-rel="tooltip" title="修改">
																	<span class="green">
																		<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
																	</span>
																</a>
															</li>
															</c:if>
															<c:if test="${QX.del == 1 }">
															<li>
																<a style="cursor:pointer;" onclick="del('${var.WAREMESSAGE_ID}');" class="tooltip-error" data-rel="tooltip" title="删除">
																	<span class="red">
																		<i class="ace-icon fa fa-trash-o bigger-120"></i>
																	</span>
																</a>
															</li>
															</c:if>
														</ul>
													</div>
												</div>
											</td>
										</tr>
									
									</c:forEach>
									</c:if>
									<c:if test="${QX.cha == 0 }">
										<tr>
											<td colspan="100" class="center">您无权查看</td>
										</tr>
									</c:if>
								</c:when>
								<c:otherwise>
									<tr class="main_info">
										<td colspan="100" class="center" >没有相关数据</td>
									</tr>
								</c:otherwise>
							</c:choose>
							</tbody>
						</table>
						<div class="page-header position-relative">
						<table style="width:100%;border: 1px solid #B4D3D8; ">
						 <tr style="border: 1px solid #B4D3D8;">
								<td colspan="2" style="vertical-align:top;"><div class="pagination" style="padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
							</tr>
						 <tr style="border: 1px solid #B4D3D8;">
						    <td colspan="2" style="vertical-align:top;" >
								<span style="font-size: 26px;margin-left:100px;letter-spacing: 6px;"> 
								库存数量：24元  &nbsp;&nbsp;&nbsp;&nbsp;   
							         库存价值：0.0元   &nbsp;&nbsp;&nbsp;&nbsp;
							         预计销售：7878787.00元</span> 
						    </td>
						 </tr>
						 <tr style="border: 1px solid #B4D3D8;">
						 		<td style="vertical-align:top;height:60px;">
						 			<span style="margin-left:30px; text-indent: 2em;">
									  *录入时，按Tab键光标即可移动下一项目。<br/> 
									</span>
									<span style="margin-left:30px; text-indent: 2em;"> 
									  *商品入库可以扫码对现有商品快速补货。<br/> 
									</span>
									<span style="margin-left:30px; text-indent: 2em;"> 
									  *右键点击商品列表可以编辑或删除商品（按shift键批量选中）。<br/>
								 	</span>
								</td> 
								<td>
								  	 <span style="margin-left:30px; text-indent: 2em;">
								  	  *商品条码、名称、零售价格为必填项目。<br/>
								  	  </span>
								  	   <span style="margin-left:30px; text-indent: 2em;">
									  *条码不能重复，一个条码只能标识一种商品。
									  </span>
								</td>
						 </tr>
						</table>
						</div>
						</form>
					
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.page-content -->
			</div>
		</div>
		<!-- /.main-content -->

		<!-- 返回顶部 -->
		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
			<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>

	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 右键菜单 -->
	<script src="static/contextmenu/jquery.contextMenu.min.js" type="text/javascript"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript" src="static/jsp_js/common.js"></script>
	<script type="text/javascript">
		$(top.hangge());//关闭加载状态
		
		// 全局变量
		 var  selected_wareId="";   
		
		//检索
		function tosearch(){
			top.jzts();
			$("#Form").submit();
		}
		
		//查看历史批注
		function openListComment(processInstanceId){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="查看历史批注";
			 diag.URL = '<%=basePath%>workflow/online/listHistoryCommentWithProcessInstanceId.do?processInstanceId='+processInstanceId;
			 diag.Width = 650;
			 diag.Height =455;
			 diag.Modal = true;				//有无遮罩窗口
			 diag. ShowMaxButton = true;	//最大化按钮
		     diag.ShowMinButton = true;		//最小化按钮
			 diag.CancelEvent = function(){ //关闭事件
				diag.close();
			 };
			 diag.show();
		
		}
		
		//提交流程申请
		function startApply(Id){
		
			bootbox.confirm("确定要提交申请吗?", function(result) {
					if(result) {
						top.jzts();
						var url = "<%=basePath%>waremessage/startApply.do?WAREMESSAGE_ID="+Id+"&tm="+new Date().getTime();
						$.get(url,function(data){
						
							nextPage(${page.currentPage});
						}); 
					}
			 }); 
		}
	
		/**
		* checkbox 选中
		*/
	/* 	function selectChk(){
			$("#table_report").find("tr").bind("click",function(){
				$("#table_report").find("tr").removeClass("clickRow");
				$(this).addClass("clickRow");
				 var chkObj=$(this).find("input[type=checkbox]");
				 if($(chkObj).is(":checked")){  
					  $(chkObj).removeAttr("checked"); 
				 }else{
					  $(chkObj).prop("checked", true);  
					  //得到  行的编号，业务主键号码
					  selected_wareId= $(chkObj).val();
				 }
			});
		} */
	
		
		
		$(function() {
			
			selectChk("table_report",selected_wareId);
		
			$("#table_report tr").contextMenu({
				width: 120, 		// width
				itemHeight: 30, 	// 菜单项height
				bgColor: "#333", 	// 背景颜色
				color: "#fff", 		// 字体颜色
				fontSize: 12, 		// 字体大小
				hoverBgColor: "#99CC66", // hover背景颜色
				target: function(ele) { // 当前元素
					$("#table_report").find("tr").removeClass("clickRow");
			 		 ele.find("tr").addClass("clickRow");
					 ele.addClass("clickRow");
					 var chkObj=ele.find("input[type=checkbox]");
					 if($(chkObj).is(":checked")){  
						  $(chkObj).removeAttr("checked");
					 }else{
						  $(chkObj).prop("checked", true);  
						  //得到  行的编号，业务主键号码
						  selected_wareId= $(chkObj).val();
					 }
				},
				menu: [{ // 菜单项
						text: "快速补货",
						icon: "static/img/add.png", 
						callback: function() {
							fastImport(selected_wareId); 
						}
					},
					{
						text: "复制商品",
						icon: "static/img/copy.png",
						callback: function() {
							edit(selected_wareId,'1');
						}
					},
					{
						text: "批量设置",
						icon: "static/img/paste.png",
						callback: function() {
							alert("尽请期待");
						}
					},
					{
						text: "打印条码",
						icon: "static/img/copy.png",
						callback: function() {
							printCode();
						}
					},
					{
						text: "整件拆零",
						icon: "static/img/add.png",
						callback: function() {
							alert("尽请期待");
						}
					}
				]

			});
			
			//日期框
			$('.date-picker').datepicker({
				autoclose: true,
				todayHighlight: true
			});
			
			//下拉框
			if(!ace.vars['touch']) {
				$('.chosen-select').chosen({allow_single_deselect:true}); 
				$(window)
				.off('resize.chosen')
				.on('resize.chosen', function() {
					$('.chosen-select').each(function() {
						 var $this = $(this);
						 $this.next().css({'width': $this.parent().width()});
					});
				}).trigger('resize.chosen');
				$(document).on('settings.ace.chosen', function(e, event_name, event_val) {
					if(event_name != 'sidebar_collapsed') return;
					$('.chosen-select').each(function() {
						 var $this = $(this);
						 $this.next().css({'width': $this.parent().width()});
					});
				});
				$('#chosen-multiple-style .btn').on('click', function(e){
					var target = $(this).find('input[type=radio]');
					var which = parseInt(target.val());
					if(which == 2) $('#form-field-select-4').addClass('tag-input-style');
					 else $('#form-field-select-4').removeClass('tag-input-style');
				});
			}
			
			
			//复选框全选控制
			var active_class = 'active';
			$('#simple-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
				var th_checked = this.checked;//checkbox inside "TH" table header
				$(this).closest('table').find('tbody > tr').each(function(){
					var row = this;
					if(th_checked) $(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
					else $(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
				});
			});
		});
		
		//新增
		function add(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增";
			 diag.URL = '<%=basePath%>waremessage/goAdd.do';
			 diag.Width =650;
			 diag.Height = 600;
			 diag.Modal = true;				//有无遮罩窗口
			 diag. ShowMaxButton = true;	//最大化按钮
		     diag.ShowMinButton = true;		//最小化按钮
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 if('${page.currentPage}' == '0'){
						 top.jzts();
						 setTimeout("self.location=self.location",100);
					 }else{
						 nextPage(${page.currentPage});
					 }
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//删除
		function del(Id){
			bootbox.confirm("确定要删除吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>waremessage/delete.do?WAREMESSAGE_ID="+Id+"&tm="+new Date().getTime();
					$.get(url,function(data){
						nextPage(${page.currentPage});
					});
				}
			});
		}
		
		/**
		* 打印条形码
		*
		*/
		function printCode(){
			var str = '';
			for(var i=0;i < document.getElementsByName('ids').length;i++){
			  if(document.getElementsByName('ids')[i].checked){
			  	if(str=='') str += document.getElementsByName('ids')[i].value;
			  	else str += ',' + document.getElementsByName('ids')[i].value;
			  }
			} 
			if(str==''){ 
				bootbox.dialog({
					message: "<span class='bigger-110'>您没有选择任何内容!</span>",
					buttons: 			
					{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
				});
				$("#zcheckbox").tips({
					side:1,
		            msg:'点这里全选',
		            bg:'#AE81FF',
		            time:8
		        });
				return;
			}else{
				 
				 top.jzts();
				 var diag = new top.Dialog();   
				 diag.Drag=true;
				 diag.Title ="打印条形码";
				 diag.URL = '<%=basePath%>waremessage/goPrint.do?DATA_IDS='+str;  
				 diag.Width = 650;
				 diag.Height = 520;      
				 diag.Modal = true;				//有无遮罩窗口
				 diag.ShowMaxButton = true;	//最大化按钮
			     diag.ShowMinButton = false;		//最小化按钮 
				 diag.CancelEvent = function(){ //关闭事件
					diag.close();
				 };
				 diag.show();
			}
			
			
			
			
		}
		/**
		* 快速入库
		*/
		function fastImport(){ 
			var str = '';
			for(var i=0;i < document.getElementsByName('ids').length;i++){
			  if(document.getElementsByName('ids')[i].checked){
			   str = document.getElementsByName('ids')[i].value;
			    break;
			  }
			}
			if(str==''){
				bootbox.dialog({
					message: "<span class='bigger-110'>您没有选择任何内容!</span>",
					buttons: 			
					{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
				});
				$("#zcheckbox").tips({
					side:1,
		            msg:'点这里全选',
		            bg:'#AE81FF',
		            time:8
		        });
				return;
			}else{
				 
				 top.jzts();
				 var diag = new top.Dialog(); 
				 diag.Drag=true;
				 diag.Title ="商品入库";
				 diag.URL = '<%=basePath%>waremessage/goFast_warehouing.do?WAREMESSAGE_ID='+str;
				 diag.Width = 650;
				 diag.Height = 520;      
				 diag.Modal = true;				//有无遮罩窗口
				 diag.ShowMaxButton = true;	//最大化按钮
			     diag.ShowMinButton = false;		//最小化按钮 
				 diag.CancelEvent = function(){ //关闭事件
					 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
						 nextPage(${page.currentPage});
					}
					diag.close();
				 };
				 diag.show();
			}
		}
		
		
		//修改
		function edit(Id,status){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑";
			 diag.URL = '<%=basePath%>waremessage/goEdit.do?WAREMESSAGE_ID='+Id+'&status='+status;
			 diag.Width = 650;
			 diag.Height = 600;
			 diag.Modal = true;				//有无遮罩窗口
			 diag. ShowMaxButton = true;	//最大化按钮
		     diag.ShowMinButton = true;		//最小化按钮 
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 nextPage(${page.currentPage});
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//批量操作
		function makeAll(msg){
			bootbox.confirm(msg, function(result) {
				if(result) {
					var str = '';
					for(var i=0;i < document.getElementsByName('ids').length;i++){
					  if(document.getElementsByName('ids')[i].checked){
					  	if(str=='') str += document.getElementsByName('ids')[i].value;
					  	else str += ',' + document.getElementsByName('ids')[i].value;
					  }
					}
					if(str==''){
						bootbox.dialog({
							message: "<span class='bigger-110'>您没有选择任何内容!</span>",
							buttons: 			
							{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
						});
						$("#zcheckbox").tips({
							side:1,
				            msg:'点这里全选',
				            bg:'#AE81FF',
				            time:8
				        });
						return;
					}else{
						if(msg == '确定要删除选中的数据吗?'){
							top.jzts();
							$.ajax({
								type: "POST",
								url: '<%=basePath%>waremessage/deleteAll.do?tm='+new Date().getTime(),
						    	data: {DATA_IDS:str},
								dataType:'json',
								//beforeSend: validateData,
								cache: false,
								success: function(data){
									 $.each(data.list, function(i, list){
											nextPage(${page.currentPage});
									 });
								}
							});
						}
					}
				}
			});
		};
		
		//导出excel
		function toExcel(){
			window.location.href='<%=basePath%>waremessage/excel.do';
		}
	</script>


</body>
</html>