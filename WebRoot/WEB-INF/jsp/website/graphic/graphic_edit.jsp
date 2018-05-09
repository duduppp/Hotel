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
	<link href="plugins/uploadify/uploadify.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="plugins/uploadify/swfobject.js"></script>
	<script type="text/javascript" src="plugins/uploadify/jquery.uploadify.v2.1.4.min.js"></script>
		<!-- 编辑框-->
	<link href="plugins/ueditor/themes/default/css/ueditor.css" rel="stylesheet" type="text/css">
	<style type="text/css">
/* 		.edui-default  .edui-for-button_leipi .edui-icon {background-position: -401px -40px;} */  
/* 		.edui-default  .edui-for-button_template .edui-icon {background-position: -339px -40px;} */
	</style>
	<script type="text/javascript" charset="utf-8">window.UMEDITOR_HOME_URL = "<%=path%>/plugins/ueditor/";</script>
	<script type="text/javascript" charset="utf-8" src="plugins/ueditor/ueditor.config.js"></script>
	<script type="text/javascript" charset="utf-8" src="plugins/ueditor/ueditor.all.js"></script>
	<script type="text/javascript" charset="utf-8" src="plugins/ueditor/lang/zh-cn/zh-cn.js"></script>

	<script type="text/javascript" charset="utf-8" src="plugins/ueditor/formdesign/leipi.formdesign.v4.js"></script>
	<script type="text/javascript" charset="utf-8" src="plugins/ueditor/ueditor.parse.min.js"></script>
	
	<!-- 上传插件 -->
	<script type="text/javascript">
	var jsessionid = "<%=session.getId()%>";  //勿删，uploadify兼容火狐用到
	</script>
	
	<script type="text/javascript">
	function setType(value){
		$("#SHOWSTATUS").val(value);
	}
	String.prototype.trim=function(){
	     return this.replace(/(^\s*)|(\s*$)/g,'');
	};

	</script>
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
					
					<form action="graphic/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="GRAPHIC_ID" id="GRAPHIC_ID" value="${pd.GRAPHIC_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">主目录:</td> 
								<td>
									<select name="CATALOG" id="CATALOG" style="width:98%;" onchange="change1(this.value);">
		                                <option>请选择</option>     					 
		                          	</select>
		                          	<input type="hidden" name="CATALOG_NAME" id="CATALOG_NAME" value="${pd.CATALOG_NAME}"  />
								</td>
								<td style="width:75px;text-align: right;padding-top: 13px;">子目录:</td>
								<td>
									<select name="SUBDIRECTORY" id="SUBDIRECTORY" style="width:98%;" onchange="change2(this.value)">
		                                <option>请选择</option>     					 
		                          	</select>
		                          	<input type="hidden" name="SUBDIRECTORY_NAME" id="SUBDIRECTORY_NAME" value="${pd.SUBDIRECTORY_NAME}" />
								</td>
								<td style="width:75px;text-align: right;padding-top: 13px;">孙子目录:</td>
								<td>
									<select id="SUNCATALOGUE" style="width:98%;" name="SUNCATALOGUE" onchange="change3(this.value)" >
                      			 	</select> 
                      			 	  	<input type="hidden" name="SUNCATALOGUE_NAME" id="SUNCATALOGUE_NAME" value="${pd.SUNCATALOGUE_NAME}" />
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">排序编号:</td>
								<td><input type="number" name="SORT_NO" id="SORT_NO" value="${pd.SORT_NO}" maxlength="32" placeholder="这里输入排序编号" title="排序编号" style="width:98%;"/></td>
								<td style="width:75px;text-align: right;padding-top: 13px;">录入时间:</td>
								<td><input class="span10 date-picker" name="INPUTDATE" id="INPUTDATE" value="${pd.INPUTDATE}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="录入时间" title="录入时间" style="width:98%;"/></td>
								<td id='AuditingNameId' style="width:75px;text-align: right;padding-top: 13px;">审核:</td>
								<td id='AuditingId' >
							<%-- 	<input type="number" name="SHOWSTATUS" id="SHOWSTATUS" value="${pd.SHOWSTATUS}" maxlength="32" placeholder="这里输入是否展示" title="是	否展示" style="width:98%;"/> --%>
								 	<label style="float:left;padding-left: 12px;">
								 	<input class="ace" name="form-field-radio" id="form-field-radio1" <c:if test="${pd.SHOWSTATUS == '1' }">checked="checked"</c:if> onclick="setType('1');"  type="radio" value="icon-edit">
								 	<span class="lbl">是</span></label>
								 	 
									<label style="float:left;padding-left: 5px;">
									<input class="ace" name="form-field-radio" id="form-field-radio2" <c:if test="${pd.SHOWSTATUS == '0' }">checked="checked"</c:if> onclick="setType('0');"  type="radio" value="icon-edit">
									<span class="lbl">否</span></label>
									
									<input type="hidden" name="SHOWSTATUS" id="SHOWSTATUS" value="${pd.SHOWSTATUS}"/>
								</td>
								
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">编辑人:</td>
								<td colspan="5"><input type="text" name="NAME" id="NAME" value="${pd.NAME}" maxlength="255" placeholder="这里输入编辑人" title="编辑人" style="width:98%;"/></td>
								 
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">标题:</td>
								<td colspan="5"><input type="text" name="TITLE" id="TITLE" value="${pd.TITLE}" maxlength="255" placeholder="这里输入标题" title="标题" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">简介:</td> 
								<td colspan="5" >
								<textarea style="width:95%;height:80px;" rows="10" cols="10" name="BRIEF_INTRODUCTION" id="BRIEF_INTRODUCTION" title="简介内容" maxlength="1000" placeholder="这里输入内容">${pd.BRIEF_INTRODUCTION}
								</textarea>
											<div><font color="#808080">请不要多于255字否则无法发送</font></div>
								
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">上传图片:</td>
								<td colspan="2">
								<input type="file" name="File_name" id="uploadify1" keepDefaultStyle = "true"/>
								</td>
									<td colspan="3">
										<a class="btn btn-mini btn-primary" onclick="uploadimg();">上传</a>
											<a class="btn btn-mini btn-primary" onclick="deleteimg();">删除</a>
										<input type="text" name="IMGPATH" id="IMGPATH" value="${pd.IMGPATH}"  style="width:80%;"/>
									</td>
							</tr>
							 <tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">内容:</td>
								<td colspan="5" >
									  <script id="CONTENT" name="CONTENT" type="text/plain" style="width:100%;height:300px;"></script>
								</td>  
							</tr>
						
							<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
								</td>
							</tr>
						</table>
						</div>
						<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/>
						<h4 class="lighter block green">提交中...</h4></div>
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
</div>
<!-- /.main-container -->


	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	
	
	
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script src="static/ace/js/bootstrap.js"></script>
	
	<!-- 编辑框-->
		<script type="text/javascript">
		$(top.hangge());
		
		function uploadimg(){
			$('#uploadify1').uploadifyUpload();
		}
		function deleteimg(){
			$("#IMGPATH").val("");
		}
		//保存
		function save(){
			if($("#CATALOG").val()==""){
				$("#CATALOG").tips({
					side:3,
		            msg:'请输入主目录',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CATALOG").focus();
			return false;
			}
		/* 	if($("#SUBDIRECTORY").val()==""){   
				$("#SUBDIRECTORY").tips({
					side:3,
		            msg:'请输入子目录',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SUBDIRECTORY").focus();
			return false;
			} */
			 
			if($("#INPUTDATE").val()==""){
				$("#INPUTDATE").tips({
					side:3,
		            msg:'请输入录入时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#INPUTDATE").focus();
			return false;
			}
			if($("#NAME").val()==""){
				$("#NAME").tips({
					side:3,
		            msg:'请输入编辑人',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#NAME").focus();
			return false;
			}
			if($("#SHOWSTATUS").val()==""){
				$("#SHOWSTATUS").tips({
					side:3,
		            msg:'请选择状体',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SHOWSTATUS").focus();
				return false;
			}
			 
			if($("#SORT_NO").val()==""){
				$("#SORT_NO").tips({
					side:3,
		            msg:'请输入排序编号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SORT_NO").focus();
			return false;
			}
			
			if($("#CATALOG_NAME").val()==""){
				$("#CATALOG_NAME").tips({
					side:3,
		            msg:'请输入主目录名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CATALOG_NAME").focus();
			return false;
			}
			
		/* 	if($("#SUBDIRECTORY_NAME").val()==""){
				$("#SUBDIRECTORY_NAME").tips({
					side:3,
		            msg:'请输入子目录名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SUBDIRECTORY_NAME").focus();
			return false;
			} */  
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		// UE.getEditor('CONTENT');
		 
		 var formEditor = UE.getEditor('CONTENT',{
			    toolleipi:true,//是否显示，设计器的 toolbars
			    textarea: 'design_content',   
			   // wordCount:false,  
			    //关闭elementPath
			    elementPathEnabled:false,   
			    initialFrameHeight:300,
			    iframeCssUrl:"plugins/ueditor/formdesign/bootstrap/css/bootstrap.css" 
			    //iframeCssUrl:"css/bootstrap/css/bootstrap.css" //引入自身 css使编辑器兼容你网站css
			    //更多其他参数，请参考ueditor.config.js中的配置项
			});
		 /**
		  * 
		  */

		 var formDesign = {
		     /*执行控件*/
		     exec : function (method) {
		     	formEditor.execCommand(method);
		     },
		     /*
		      Javascript 解析表单
		      template 表单设计器里的Html内容
		      fields 字段总数
		      */
		     parse_form:function(template,fields)
		     {
		         //正则  radios|checkboxs|select 匹配的边界 |--|  因为当使用 {} 时js报错 (plugins|fieldname|fieldflow)
		         var preg =  /(\|-<span(((?!<span).)*plugins=\"(radios|checkboxs|select)\".*?)>(.*?)<\/span>-\||<(img|input|textarea|select).*?(<\/select>|<\/textarea>|\/>))/gi,preg_attr =/(\w+)=\"(.?|.+?)\"/gi,preg_group =/<input.*?\/>/gi;
		         if(!fields) fields = 0;

		         var template_parse = template,template_data = new Array(),add_fields=new Object(),checkboxs=0;

		         var pno = 0;
		         template.replace(preg, function(plugin,p1,p2,p3,p4,p5,p6){
		             var parse_attr = new Array(),attr_arr_all = new Object(),name = '', select_dot = '' , is_new=false;
		             var p0 = plugin;
		             var tag = p6 ? p6 : p4;
		             //alert(tag + " \n- t1 - "+p1 +" \n-2- " +p2+" \n-3- " +p3+" \n-4- " +p4+" \n-5- " +p5+" \n-6- " +p6);

		             if(tag == 'radios' || tag == 'checkboxs')
		             {
		                 plugin = p2;
		             }else if(tag == 'select')
		             {
		                 plugin = plugin.replace('|-','');
		                 plugin = plugin.replace('-|','');
		             }
		             plugin.replace(preg_attr, function(str0,attr,val) {
		                 if(attr=='name')
		                 {
		                     if(val=='NEWFIELD')
		                     {
		                         is_new=true;
		                         fields++;
		                         val = 'data_'+fields;
		                     }
		                     name = val;
		                 }

		                 if(tag=='select' && attr=='value')
		                 {
		                     if(!attr_arr_all[attr]) attr_arr_all[attr] = '';
		                     attr_arr_all[attr] += select_dot + val;
		                     select_dot = ',';
		                 }else
		                 {
		                     attr_arr_all[attr] = val;
		                 }
		                 var oField = new Object();
		                 oField[attr] = val;
		                 parse_attr.push(oField);
		             })
		             /*alert(JSON.stringify(parse_attr));return;*/
		             if(tag =='checkboxs') /*复选组  多个字段 */
		             {
		                 plugin = p0;
		                 plugin = plugin.replace('|-','');
		                 plugin = plugin.replace('-|','');
		                 var name = 'checkboxs_'+checkboxs;
		                 attr_arr_all['parse_name'] = name;
		                 attr_arr_all['name'] = '';
		                 attr_arr_all['value'] = '';

		                 attr_arr_all['content'] = '<span plugins="checkboxs"  title="'+attr_arr_all['title']+'">';
		                 var dot_name ='', dot_value = '';
		                 p5.replace(preg_group, function(parse_group) {
		                     var is_new=false,option = new Object();
		                     parse_group.replace(preg_attr, function(str0,k,val) {
		                         if(k=='name')
		                         {
		                         	if(val=='NEWFIELD')
		                             {
		                                 is_new=true;
		                                 fields++;
		                                 val = 'data_'+fields;
		                             }

		                             attr_arr_all['name'] += dot_name + val;
		                             dot_name = ',';

		                         }
		                         else if(k=='value')
		                         {
		                             attr_arr_all['value'] += dot_value + val;
		                             dot_value = ',';

		                         }
		                         option[k] = val;
		                     });

		                     if(!attr_arr_all['options']) attr_arr_all['options'] = new Array();
		                     attr_arr_all['options'].push(option);
		                     if(!option['checked']) option['checked'] = '';
		                     var checked = option['checked'] ? 'checked="checked"' : '';
		                     attr_arr_all['content'] +='<input type="checkbox" name="'+option['name']+'" value="'+option['value']+'" fieldname="' + attr_arr_all['fieldname'] + option['fieldname'] + '" fieldflow="' + attr_arr_all['fieldflow'] + '" '+checked+'/>'+option['value']+'&nbsp;';

		                     if(is_new)
		                     {
		                         var arr = new Object();
		                         arr['name'] = option['name'];
		                         arr['plugins'] = attr_arr_all['plugins'];
		                         arr['fieldname'] = attr_arr_all['fieldname'] + option['fieldname'];
		                         arr['fieldflow'] = attr_arr_all['fieldflow'];
		                         add_fields[option['name']] = arr;
		                     }

		                 });
		                 attr_arr_all['content'] += '</span>';

		                 //parse
		                 template = template.replace(plugin,attr_arr_all['content']);
		                 template_parse = template_parse.replace(plugin,'{'+name+'}');
		                 template_parse = template_parse.replace('{|-','');
		                 template_parse = template_parse.replace('-|}','');
		                 template_data[pno] = attr_arr_all;
		                 checkboxs++;

		             }else if(name)
		             {
		                 if(tag =='radios') /*单选组  一个字段*/
		                 {
		                     plugin = p0;
		                     plugin = plugin.replace('|-','');
		                     plugin = plugin.replace('-|','');
		                     attr_arr_all['value'] = '';
		                     attr_arr_all['content'] = '<span plugins="radios" name="'+attr_arr_all['name']+'" title="'+attr_arr_all['title']+'">';
		                     var dot='';
		                     p5.replace(preg_group, function(parse_group) {
		                         var option = new Object();
		                         parse_group.replace(preg_attr, function(str0,k,val) {
		                             if(k=='value')
		                             {
		                                 attr_arr_all['value'] += dot + val;
		                                 dot = ',';
		                             }
		                             option[k] = val;
		                         });
		                         option['name'] = attr_arr_all['name'];
		                         if(!attr_arr_all['options']) attr_arr_all['options'] = new Array();
		                         attr_arr_all['options'].push(option);
		                         if(!option['checked']) option['checked'] = '';
		                         var checked = option['checked'] ? 'checked="checked"' : '';
		                         attr_arr_all['content'] +='<input type="radio" name="'+attr_arr_all['name']+'" value="'+option['value']+'"  '+checked+'/>'+option['value']+'&nbsp;';

		                     });
		                     attr_arr_all['content'] += '</span>';

		                 }else
		                 {
		                     attr_arr_all['content'] = is_new ? plugin.replace(/NEWFIELD/,name) : plugin;
		                 }
		                 //attr_arr_all['itemid'] = fields;
		                 //attr_arr_all['tag'] = tag;
		                 template = template.replace(plugin,attr_arr_all['content']);
		                 template_parse = template_parse.replace(plugin,'{'+name+'}');
		                 template_parse = template_parse.replace('{|-','');
		                 template_parse = template_parse.replace('-|}','');
		                 if(is_new)
		                 {
		                     var arr = new Object();
		                     arr['name'] = name;
		                     arr['plugins'] = attr_arr_all['plugins'];
		                     arr['title'] = attr_arr_all['title'];
		                     arr['orgtype'] = attr_arr_all['orgtype'];
		                     arr['fieldname'] = attr_arr_all['fieldname'];
		                     arr['fieldflow'] = attr_arr_all['fieldflow'];
		                     add_fields[arr['name']] = arr;
		                 }
		                 template_data[pno] = attr_arr_all;


		             }
		             pno++;
		         })
		         var view = template.replace(/{\|-/g,'');
		         view = view.replace(/-\|}/g,'');
		         var parse_form = new Object({
		             'fields':fields,//总字段数
		             'template':template,//完整html
		             'parse':view,
		             'data':template_data,//控件属性
		             'add_fields':add_fields//新增控件
		         });
		         return JSON.stringify(parse_form);
		     },
		     /*type  =  save 保存设计 versions 保存版本  close关闭 */
		     fnCheckForm : function ( type ) {
		         if(formEditor.queryCommandState( 'source' ))
		             formEditor.execCommand('source');//切换到编辑模式才提交，否则有bug

		         if(formEditor.hasContents()){
		             formEditor.sync();/*同步内容*/

		             //--------------以下仅参考-----------------------------------------------------------------------------------------------------
		             var type_value='',formid=0,fields=$("#fields").val(),formeditor='';

		             if( typeof type!=='undefined' ){
		                 type_value = type;
		             }
		             //获取表单设计器里的内容
		             formeditor=formEditor.getContent();
		             //解析表单设计器控件
		             var parse_form = this.parse_form(formeditor,fields);
		             //alert(parse_form);
		             //异步提交数据
		             $.ajax({
		                 type: 'POST',
		                 url : '${ctx}/config/form/processor',
		                 //dataType : 'json',
		                 data : {'type' : type_value,'formid':'${form.id}','parse_form':parse_form},
		                 success : function(data){
		 					if(data == true) {
		 						alert('表单保存成功');
		 						window.location.href='${ctx}/config/form';
		 					} else {
		 						alert('表单保存失败');
		 					}
		                 }
		             });

		         } else {
		             alert('表单内容不能为空！')
		             $('#submitbtn').button('reset');
		             return false;
		         }
		     } ,
		     /*预览表单*/
		     fnReview : function (){
		         if(formEditor.queryCommandState( 'source' ))
		             formEditor.execCommand('source');/*切换到编辑模式才提交，否则部分浏览器有bug*/

		         if(formEditor.hasContents()){
		             formEditor.sync();       /*同步内容*/

		             alert("你点击了预览,请自行处理....");
		             return false;
		             //--------------以下仅参考-------------------------------------------------------------------


		             /*设计form的target 然后提交至一个新的窗口进行预览*/
		             document.saveform.target="mywin";
		             window.open('','mywin',"menubar=0,toolbar=0,status=0,resizable=1,left=0,top=0,scrollbars=1,width=" +(screen.availWidth-10) + ",height=" + (screen.availHeight-50) + "\"");

		             document.saveform.action="";
		             document.saveform.submit(); //提交表单
		         } else {
		             alert('表单内容不能为空！');
		             return false;
		         }
		     }
		 };

		$(function() {
			
			var editNAME='${pd.NAME}';		
			
			var sessionName='${sessionScope.sessionUser.NAME}';
			
			var sessionUserName='${sessionScope.sessionUser.USERNAME}'; 
			if(sessionUserName=='admin'){
				
				
			}
			
			if(editNAME==''){
				$("#NAME").val(sessionName);  
			}
		    var ue = UE.getEditor('CONTENT');  
	        ue.ready(function() {//编辑器初始化完成再赋值  
	            ue.setContent('${pd.CONTENT}');  //赋值给UEditor  
	        });  
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
			var str='';
			$("#uploadify1").uploadify({
				'buttonImg'	: 	"<%=basePath%>static/images/fileup.png",
				'uploader'	:	"<%=basePath%>plugins/uploadify/uploadify.swf",
				'script'    :	"<%=basePath%>plugins/uploadify/uploadFile.jsp;jsessionid="+jsessionid,
				'cancelImg' :	"<%=basePath%>plugins/uploadify/cancel.png",
				'folder'	:	"<%=basePath%>uploadFiles/uploadFile",//上传文件存放的路径,请保持与uploadFile.jsp中PATH的值相同
				'queueId'	:	"fileQueue",
				'queueSizeLimit'	:	1,//限制上传文件的数量
				 'fileExt'	:	"*.jpg,*.png,*.gif",
				//'fileDesc'	:	"RAR *.rar",//限制文件类型
				'fileExt'     : '*.*;*.*;*.*',
				'fileDesc'    : 'Please choose(.*, .*, .*)',
				'auto'		:	false,
				'multi'		:	false,//是否允许多文件上传
				'simUploadLimit':	2,//同时运行上传的进程数量
				'buttonText':	"files",
				'scriptData':	{'uploadPath':'/uploadFiles/uploadFile/'},//这个参数用于传递用户自己的参数，此时'method' 必须设置为GET, 后台可以用request.getParameter('name')获取名字的值
				'method'	:	"GET",
				'onComplete':function(event,queueId,fileObj,response,data){
					str = response.trim();//单个上传完毕执行 
				},
				'onAllComplete' : function(event,data) {
					//alert(str);	//全部上传完毕执行
					$("#IMGPATH").val("uploadFiles/uploadFile/"+str); 
				 
		    	},
		    	'onSelect' : function(event, queueId, fileObj){
		    		$("#hasTp1").val("ok");
		    	}
			});
		//初始第一级
			$.ajax({
				type: "POST",
				url: '<%=basePath%>linkage/getLevels.do?tm='+new Date().getTime(),
		    	data: {},
				dataType:'json',
				cache: false,
				success: function(data){
					$("#CATALOG").html('<option>请选择</option>');
					 $.each(data.list, function(i, dvar){  
						
						 var name='${pd.CATALOG_NAME}';
						 if(dvar.NAME==name){
							$("#CATALOG").append("<option value="+dvar.DICTIONARIES_ID+" selected = 'selected'>"+dvar.NAME+"</option>");	 
						 }else{
							$("#CATALOG").append("<option value="+dvar.DICTIONARIES_ID+">"+dvar.NAME+"</option>");	 
						 } 
						
					 });
					  
					 if('${pd.SUBDIRECTORY_NAME}'!=''){
						 	$("#SUBDIRECTORY").append("<option selected='selected'>${pd.SUBDIRECTORY_NAME}</option>");
						}
						if('${pd.SUNCATALOGUE_NAME}'!=''){
							$("#SUNCATALOGUE").append("<option selected='selected' >${pd.SUNCATALOGUE_NAME}</option>"); 
						} 
				}
			});
		});
		
		//第一级值改变事件(初始第二级)
		function change1(value){
			$("#SUBDIRECTORY_NAME").val(""); 
			$("#CATALOG_NAME").val(	$("#CATALOG").find("option:selected").text()); 
			$.ajax({
				type: "POST",
				url: '<%=basePath%>linkage/getLevels.do?tm='+new Date().getTime(),
		    	data: {DICTIONARIES_ID:value},
				dataType:'json',
				cache: false,
				success: function(data){
					$("#SUBDIRECTORY").html('<option>请选择</option>');
					$("#SUNCATALOGUE").html('<option value="">请选择</option>');
					 $.each(data.list, function(i, dvar){
							$("#SUBDIRECTORY").append("<option value="+dvar.DICTIONARIES_ID+">"+dvar.NAME+"</option>");
					 });
				}
			});
		}
		
		//第二级值改变事件(初始第三级)
		function change2(value){  
			$("#SUNCATALOGUE_NAME").val(""); 
			$("#SUBDIRECTORY_NAME").val($("#SUBDIRECTORY").find("option:selected").text());
			$.ajax({
				type: "POST",
				url: '<%=basePath%>linkage/getLevels.do?tm='+new Date().getTime(),
		    	data: {DICTIONARIES_ID:value},
				dataType:'json',
				cache: false,
				success: function(data){
					$("#SUNCATALOGUE").html('<option value=""></option>');
					 $.each(data.list, function(i, dvar){
							$("#SUNCATALOGUE").append("<option value="+dvar.DICTIONARIES_ID+">"+dvar.NAME+"</option>");
					 });
				}
			});
		}
		function change3(value){  
			$("#SUNCATALOGUE_NAME").val($("#SUNCATALOGUE").find("option:selected").text());
		}
		 
		  
		</script>
<!-- 		<script src="plugins/ueditor/formdesign/formdesign.js"></script>  -->
</body>
</html>