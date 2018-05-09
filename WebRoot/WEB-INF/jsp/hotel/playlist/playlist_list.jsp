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
<style type="text/css">

.panel {
  margin-bottom: 20px;
  background-color: white;
  -webkit-border-radius: 2px;
  -moz-border-radius: 2px;
  border-radius: 2px;
  -webkit-box-shadow: none;
  box-shadow: none;
  border: 1px solid #cee3f0; }

.panel-body {
  padding: 15px;
  position: relative;
  border: none; }

.panel-heading {
  position: relative;
  padding: 12px 15px;
  border: none;
  border-bottom: 0;
  border-bottom: 1px solid #cae1ef !important;
  background: linear-gradient(#fdfefe, #f5f9fc);
  -webkit-border-radius: 0px;
  -moz-border-radius: 0px;
  border-radius: 0px; }
  .panel-heading .custom-icon {
    position: absolute;
    right: 0;
    top: 0;
    padding: 10px;
    color: #333333;
    font-size: 14px; }
  .panel-heading h4 {
    margin: 0;
    display: inline;
    color: #398ab9;
    font-size: 15px;
    font-weight: 600; }
  .panel-heading ul.links {
    margin: 0;
    padding: 0;
    float: right;
    list-style-type: none; }
    .panel-heading ul.links li {
      display: inline-block;
      margin-left: 10px; }
      .panel-heading ul.links li a {
        display: block;
        color: #59a2cc;
        font-size: 14px;
        padding: 2px 6px; }
        .panel-heading ul.links li a:hover {
          color: #398ab9;
          background: rgba(0, 0, 0, 0.07);
          -webkit-border-radius: 2px;
          -moz-border-radius: 2px;
          border-radius: 2px; }

.panel-sub-heading {
  padding: 6px 20px;
  background-color: #f5f9fc;
  border-bottom: 1px solid #e2eef6;
  font-size: 11px;
  text-align: right; }
  .panel-sub-heading a {
    color: #4697c6; }
    .panel-sub-heading a:hover {
      color: #398ab9; }

h4.panel-title {
  font-size: 14px;
  font-weight: 600;
  color: #333333; }
  h4.panel-title .fa {
    margin-right: 4px;
    font-size: 14px;
    width: 20px; }

h3.panel-title {
  text-align: center;
  font-size: 16px;
  font-weight: 600;
  text-transform: uppercase;
  color: #333333; }

.panel-footer {
  padding: 0;
  border: 0;
  margin-top: -1px;
  background: transparent;
  border: 1px solid #ededed;
  border-top: 0;
  -webkit-border-radius: 0 0 2px 2px;
  -moz-border-radius: 0 0 2px 2px;
  border-radius: 0 0 2px 2px; }
  .panel-footer ul {
    margin: 0;
    padding: 0;
    list-style-type: none; }
    .panel-footer ul li {
      width: 25%;
      text-align: center;
      padding: 10px 0;
      float: left;
      height: 60px;
      background: transparent; }
      .panel-footer ul li h4 {
        font-size: 18px;
        margin: 2px 0 0 0;
        padding: 0;
        text-align: center; }
        .panel-footer ul li h4 small {
          color: inherit; }
      .panel-footer ul li p {
        color: gray;
        font-size: 12px;
        margin: 0;
        padding: 0;
        text-align: center; }
</style>
</head>
<body class="no-skin">
<form action="playlist/list.do" method="post" name="Form" id="Form">
	<table style="margin-top:5px;">
						 
							<tr>
 	<c:if test="${sessionScope.sessionUser.USERNAME=='admin'}">
								<td>
									<div class="nav-search">
										<span class="input-icon">
											<input type="text" placeholder="选择用户" class="nav-search-input" id="nav-search-input" 
											 name="LOGINNAME"   onclick="userBinding(this)" />
											<i class="ace-icon fa fa-search nav-search-icon"></i>
										</span>
									</div>
									</td>
									<td>
							
									<td style="vertical-align:top;padding-left:2px"><a class="btn btn-light btn-xs" onclick="tosearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"> 查询</i></a></td>
								
									</td>
									</c:if>
									</tr>
									</table>
								
<div class="row" id="videoSetting" style="height: 1000px">
    <div class="col-sm-6">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4>下次播放列表</h4>
                <ul class="links">
                    <li>
                        <a id="btn-clear" class="btn btn-lg btn-transparent btn-danger" @click="clearOldPlayList()">
                            &nbsp;清空&nbsp;
                        </a>
                    </li>
                    <li>
                        <a id="btn-create" class="btn btn-lg btn-transparent btn-success" @click="savePlayVideo()">
                            &nbsp;保存&nbsp;
                        </a>
                    </li>
                </ul>
            </div>
            <div class="panel-body">
                <div v-for="(item, index) in playList" >
                    <div class="row">
                        <div class="col-sm-6">
                            <img :src="item.screenshot" style="height: 100px; width: 100%; display: block;" alt="">
                        </div>
                        <div class="col-sm-6">
                            <input type="hidden" class="item-url" :value="item.src">
                            <p class="title"><b></b>标题：<span data-toggle="tooltip">{{item.title}}</span></p>
                            <p><b>影片时长：</b>{{item.playtime}}</p>
                            <div class="btn-group">
                                <button v-show="index!=0"  class="btn btn-primary video-remove" @click="upIndex(index)">
                                    <i class="fa fa-chevron-circle-up"></i> 上移</button>
                                <button v-show="index+1 != playList.length" class="btn btn-info video-remove" @click="downIndex(index)">
                                    <i class="fa fa-chevron-circle-down"></i> 下移</button>
                                <button class="btn btn-danger video-remove" @click="removePlayList(item,index)">
                                    <i class="fa fa-times"></i> 移除</button>
                            </div>
                        </div>
                    </div>
                    <p></p>
                    <p></p>
                </div>
            </div>
        </div>
    </div>
    <div class="col-sm-6">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4>选择视频</h4>
            </div>
            <div class="panel-body">
                <div class="text-left">
                    <div class="row">
                        <div v-for="(item, index) in videoList" class="col-xs-6">
                            <div href="#" class="thumbnail" >
                                <img :src="item.screenshot" style="height: 100px; width: 100%; display: block;" alt="">
                            </div>
                            <div class="thumbnail-info">
                                <input type="hidden" class="item-url" :value="item.src">
                                <p class="title"><b>标题：</b><span  data-toggle="tooltip">{{item.title}}</span></p>
                                <p><b>影片时长：</b>{{item.playtime}}</p>
                               
                                <p>
                                    <button class="btn btn-warning btn-sm dropdown-toggle video-remove" @click="addPlayList(item,index)">添加</button>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                <ul class="pagination">
                    <li :class="{disabled:backPage==false}" @click="addRow(-1,page,'jian')">
                        <span aria-hidden="true">上一页</span>
                    </li>
                    <li class="active"><a class="video-pageNum">{{page}}</a></li>
                    <li :class="{disabled:nextPage==false}">
                        <a class="next-page" @click="addRow(-1,page,'jia')">下一页</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
	</form>
<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>	
	<!-- ace scripts -->
 	<script src="static/ace/js/ace/ace.js"></script>  
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<script type="text/javascript">
		 jQuery.ctx = "<%=basePath%>"; //在js中可以直接通过$.ctx来获取应用程序上下文
	</script>
	<!--提示框-->
	<script type="text/javascript" src="static/hotel/vue-2.0.6.js"></script>
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
 	<script type="text/javascript" src="static/hotel/videoSetting.js"></script>
 	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript">
		$(top.hangge());//关闭加载状态
		//检索
			//打开绑定用户窗口
	function userBinding(obj){
		 top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="绑定用户";
		 diag.URL = '<%=basePath%>user/listUsersForWindow.do';
		 diag.Width = 700;
		 diag.Height = 545;
		 diag.Modal = true;				//有无遮罩窗口
		 diag.ShowMaxButton = true;	//最大化按钮
	     diag.ShowMinButton = true;		//最小化按钮
		 diag.CancelEvent = function(){ //关闭事件
			if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
				var USERNAME = diag.innerFrame.contentWindow.document.getElementById('USERNAME').value;
				$(obj).val(USERNAME);
		 
			 }
			diag.close();
		 };
		 diag.show();
	}
	
	 </script>
</body>
</html>