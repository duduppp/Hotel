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
<!-- 右键css -->
<link rel="stylesheet" href="static/contextmenu/jquery.contextMenu.css" />
<!-- jsp文件头和头部 -->
<%@ include file="../../system/index/top.jsp"%>
<!-- 日期框 -->
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
						<form action="vipuser/list.do" method="post" name="Form" id="Form">
						<table style="margin-top:5px;">
							<tr>
								<td>
								   <span class="input-icon">
									 <c:if test="${QX.add == 1 }">
										<a class="btn btn-mini btn-success" style="width: 100px;  border-radius:5px;-moz-border-radius:5px;" onclick="vip_recharge();">
											<i class='ace-icon icon-plus bigger-120'> 会员充值</i>
										</a>
									 </c:if>
									</span>
								</td>
								<td>
									<span class="input-icon">
										<c:if test="${QX.add == 1 }">
											<a class="btn btn-mini btn-info2" style="width: 100px;  border-radius:5px;-moz-border-radius:5px;" onclick="vip_exchange();">
												<i class='ace-icon glyphicon glyphicon-refresh '> 积分兑换</i>
											</a>
										 </c:if>
									</span>
								</td>
								<td>
									<span class="input-icon">
										<c:if test="${QX.add == 1 }">
											<a class="btn btn-mini btn-danger" style="width: 100px;  border-radius:5px;-moz-border-radius:5px;" onclick="makeAll('确定要删除选中的数据吗?');">
												<i class='ace-icon glyphicon glyphicon-minus' > 删除会员</i></a>
										 </c:if>
									</span>
								</td>
								<td>
									<span class="input-icon">
										<c:if test="${QX.add == 1 }">
											<a class="btn btn-mini btn-warning" style="width: 100px;  border-radius:5px;-moz-border-radius:5px;" onclick="vip_brithday();">
												<i class='ace-icon glyphicon glyphicon-refresh '>生日提醒</i>
											<input  type="hidden" name="BRITHDAY" id="BRITHDAY" value=""  />
											</a>
										 </c:if>
									</span>
								</td>
								<td style="vertical-align:top;padding-left:2px;">
								 	<select class="chosen-select form-control" name="name" id="id" data-placeholder="请选择" style="vertical-align:top;width: 120px;">
									<option value="">所有会员</option>
									<option value="">1</option>
									<option value="">2</option>
								  	</select>
								</td>
								<td style="vertical-align:top;padding-left:2px;">
								 	<select class="chosen-select form-control" name="name" id="id" data-placeholder="请选择" style="vertical-align:top;width: 120px;">
									<option value="">排序</option>
									<option value="">会员ID</option>
									<option value="">会员生日</option>
									<option value="">会员等级</option>
								  	</select>
								</td>
								<td style="vertical-align:top;padding-left:2px;">
									<input type="text" class="nav-search-input" id="nav-search-input" autocomplete="on" name="keywords" value="${pd.keywords }" placeholder="会员卡号/电话/姓名"/>
								</td> 
									
								<c:if test="${QX.cha == 1 }">
								<td style="vertical-align:top;padding-left:2px">
									<a class="btn btn-light btn-xs" onclick="tosearch();"  title="检索">
								 	 <i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue">查找会员</i>
								 	</a>
								</td>
								</c:if>
								<c:if test="${QX.toExcel == 1 }"><td style="vertical-align:top;padding-left:2px;">
									<a class="btn btn-light btn-xs" onclick="toExcel();" title="导出到EXCEL">
									<i id="nav-search-icon" class="ace-icon fa fa-download bigger-110 nav-search-icon blue">导出Excel</i></a></td></c:if>
							</tr>
						</table>
						<!-- 检索  -->
					
						<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">	
							<thead>
								<tr>
									<th class="center" style="width:35px;">
									<label class="pos-rel"><input type="checkbox" class="ace" id="zcheckbox" /><span class="lbl"></span></label>
									</th>
									<th class="center" style="width:50px;">序号</th>
											<th class="center">会员卡号</th>
											
											<th class="center">会员分类</th>
											
											<th class="center">折扣(%)</th>
											
											<th class="center">姓名</th>
											
											<th class="center">电话</th>
											
											<th class="center">地址</th>
											
											<th class="center">生日</th>
											
											<th class="center">存储余额</th>
											
											<th class="center">存卷余额</th>
											
											<th class="center">积分</th>
											
											<th class="center">开卡时间 </th>
											
											<th class="center">过期日期</th>
											
											<th class="center">备注</th>
											
										 
											
										 
											
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
												<label class="pos-rel"><input type='checkbox' name='ids' value="${var.VIPUSER_ID}" class="ace" /><span class="lbl"></span></label>
											</td>
											<td class='center' style="width: 30px;">${vs.index+1}</td>
													<td class='center'>${var.CARDNO}</td>
													<td class='center'>${var.VIPTYPE}</td>
													<td class='center'>${var.DISCOUNT}</td>
													<td class='center'>${var.NAME}</td>
													<td class='center'>${var.TEL}</td>
													<td class='center'>${var.ADDRESS}</td>
													<td class='center'>${var.BRITHDAY}</td>
													<td class='center'>${var.STORAGEBALANCE}</td>
													<td class='center'>${var.INVENTORYBALANCE}</td>
													<td class='center'>${var.INTEGRAL}</td>
													<td class='center'>${var.OPENCARDTIME}</td>
													<td class='center'>${var.EXPIRATIONDATE}</td>
													<td class='center'>${var.REMARK}</td>
											<td class="center">
												<c:if test="${QX.edit != 1 && QX.del != 1 }">
												<span class="label label-large label-grey arrowed-in-right arrowed-in"><i class="ace-icon fa fa-lock" title="无权限"></i></span>
												</c:if>
												<div class="hidden-sm hidden-xs btn-group">
													
												
														<c:if test="${QX.edit == 1 }">
														<a class="btn btn-xs btn-success" title="编辑" onclick="edit('${var.VIPUSER_ID}');">
															<i class="ace-icon fa fa-pencil-square-o bigger-120" title="编辑"></i>
														</a>
														</c:if>
														<c:if test="${QX.del == 1 }">
														<a class="btn btn-xs btn-danger" onclick="del('${var.VIPUSER_ID}');">
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
																<a style="cursor:pointer;" onclick="edit('${var.VIPUSER_ID}');" class="tooltip-success" data-rel="tooltip" title="修改">
																	<span class="green">
																		<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
																	</span>
																</a>
															</li>
															</c:if>
															<c:if test="${QX.del == 1 }">
															<li>
																<a style="cursor:pointer;" onclick="del('${var.VIPUSER_ID}');" class="tooltip-error" data-rel="tooltip" title="删除">
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
						<table style="width:100%;">
							<tr>
								<td style="vertical-align:top;">
									
													<c:if test="${QX.add == 1 }">
													<a class="btn btn-mini btn-success" onclick="add();">新增</a>
													</c:if>
													
													<c:if test="${QX.del == 1 }">
													<a class="btn btn-mini btn-danger" onclick="makeAll('确定要删除选中的数据吗?');" title="批量删除" ><i class='ace-icon fa fa-trash-o bigger-120'></i></a>
													</c:if>
													
									
								</td>
								<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
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
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!-- 右键菜单 -->
	<script src="static/contextmenu/jquery.contextMenu.min.js" type="text/javascript"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	
	<script type="text/javascript" src="static/jsp_js/common.js"></script> 
	<script type="text/javascript">
		$(top.hangge());//关闭加载状态
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
			 diag.Height = 355;
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
						var url = "<%=basePath%>vipuser/startApply.do?VIPUSER_ID="+Id+"&tm="+new Date().getTime();
						$.get(url,function(data){
						
							nextPage(${page.currentPage});
							 
						}); 
					}
			 });
		}
	
		
		function contextMenu(){
			$("#simple-table tr").contextMenu({
				width: 120, 		// width
				itemHeight: 30, 	// 菜单项height
				bgColor: "#333", 	// 背景颜色
				color: "#fff", 		// 字体颜色
				fontSize: 12, 		// 字体大小
				hoverBgColor: "#99CC66", // hover背景颜色
				target: function(ele) { 
					// 当前元素
					$("#simple-table").find("tr").css("background-color","");  
			 		 ele.find("tr").css("background-color","#FAFAD2");
					 ele.css("background-color","#FAFAD2");
					 var chkObj=ele.find("input[type=checkbox]");
					 if($(chkObj).is(":checked")){  
						  $(chkObj).removeAttr("checked");
					 }else{
						  $(chkObj).prop("checked", true);  
						  //得到  行的编号，业务主键号码
						  selected_wareId= $(chkObj).val();
					 }
				 
				},
				menu: [{  
						text: "会员充值",
						icon: "static/img/add.png", 
						callback: function() {
							vip_recharge();
						}
					},
					{
						text: "积分兑换",
						icon: "static/img/copy.png",
						callback: function() {
							vip_exchange();
						}
					},{
						text: "删除会员",
						icon: "static/img/del.png",
						callback: function() {
							makeAll('确定要删除选中的数据吗?');
						}
					}
					,{
						text: "导入会员",
						icon: "static/img/copy.png",
						callback: function() {
						   vip_import();
						}
					}
				]

			});
		}
		
		function vip_import(){
			
			
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="会员充值";
			 diag.URL = "<%=basePath%>vipuser/goVipImport.do?VIPUSER_ID="+selected_wareId;
			 diag.Width =750;
			 diag.Height =650;
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
		
		//展示今天过生日的会员
		function  vip_brithday(){
			
			top.jzts(); 
			
			$("#BRITHDAY").val(formatDateTime(new Date()));
			$("#Form").submit(); 
			 
		}
		
		/**
		 * 打开积分兑换界面
		*/
		function vip_exchange(){
			
			for(var i=0;i < document.getElementsByName('ids').length;i++){
				  if(document.getElementsByName('ids')[i].checked){
					  selected_wareId= document.getElementsByName('ids')[i].value;
						break;	
					}
			 }
			if(""==selected_wareId){
				bootbox.confirm("选择一条数据");
				return ;
				
			}
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="会员充值";
			 diag.URL = "<%=basePath%>vipuser/goVipExchange.do?VIPUSER_ID="+selected_wareId;
			 diag.Width =450;
			 diag.Height =355;
			 diag.Modal = true;				//有无遮罩窗口
			 diag. ShowMaxButton = true;	//最大化按钮
		     diag.ShowMinButton = true;		//最小化按钮
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 if('${page.currentPage}' == '0'){
						
						 
						 bootbox.dialog({
								message: "<span class='bigger-110'>兑换成功</span>",
								buttons: 			
								{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
							}); 
							window.setTimeout(function(){
								  if('${page.currentPage}' == '0'){
									  top.jzts();
									 
									 setTimeout("self.location=self.location",100);
								 }else{
									 nextPage(${page.currentPage});
								 }  
							}, 1000);
					 }else{
						 nextPage(${page.currentPage});
					 }
				}
				diag.close();
			 };
			 diag.show();
		}
		
		
		
		 var  selected_wareId="";    
		$(function() {
			// 全局变量
			contextMenu();
			//日期框
			$('.date-picker').datepicker({
				autoclose: true,
				todayHighlight: true
			});
			
			
			selectChk("simple-table",selected_wareId);
			
		 
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
		
		function vip_recharge(){
			
			for(var i=0;i < document.getElementsByName('ids').length;i++){
				  if(document.getElementsByName('ids')[i].checked){
					  selected_wareId= document.getElementsByName('ids')[i].value;
						break;	
					}
			 }
			if(""==selected_wareId){
				bootbox.confirm("选择一条数据");
				return ;
				
			}
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="会员充值";
			 diag.URL = "<%=basePath%>vipuser/goVipRecharge.do?VIPUSER_ID="+selected_wareId;
			 diag.Width =450;
			 diag.Height =355;
			 diag.Modal = true;				//有无遮罩窗口
			 diag. ShowMaxButton = true;	//最大化按钮
		     diag.ShowMinButton = true;		//最小化按钮
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
						bootbox.dialog({
							message: "<span class='bigger-110'>成功</span>",
							buttons: 			
							{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
						}); 
						window.setTimeout(function(){
							  if('${page.currentPage}' == '0'){
								  top.jzts();
								 
								 setTimeout("self.location=self.location",100);
							 }else{
								 nextPage(${page.currentPage});
							 }  
						}, 1000);
						
						
						
					
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//新增
		function add(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增";
			 diag.URL = '<%=basePath%>vipuser/goAdd.do';
			 diag.Width = 750;
			 diag.Height = 555;
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
					var url = "<%=basePath%>vipuser/delete.do?VIPUSER_ID="+Id+"&tm="+new Date().getTime();
					$.get(url,function(data){
						nextPage(${page.currentPage});
					});
				}
			});
		}
		
		//修改
		function edit(Id){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑";
			 diag.URL = '<%=basePath%>vipuser/goEdit.do?VIPUSER_ID='+Id;
			 diag.Width = 750;
			 diag.Height = 555;
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
								url: '<%=basePath%>vipuser/deleteAll.do?tm='+new Date().getTime(),
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
			window.location.href='<%=basePath%>vipuser/excel.do';
		}
	</script>


</body>
</html>