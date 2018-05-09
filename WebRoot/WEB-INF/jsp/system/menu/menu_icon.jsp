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

<!-- jsp文件头和头部 -->
<%@ include file="../index/top.jsp"%>
<style type="text/css">
	label {
		cursor:pointer;
		font-size: 24px !important;
}
</style>
</head>
<body>
	
	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">

					<div class="row">
						<div class="col-xs-12">
						
						<div id="zhongxin">
						
						<form action="menu/editicon.do" name="menuForm" id="menuForm" method="post">
						<input type="hidden" name="MENU_ID" id="menuId" value="${pd.MENU_ID}"/>
						<input type="hidden" name="MENU_ICON" id="MENU_ICON" value=""/>
						<input type="hidden" name="MENU_ICONColor" id="MENU_ICONColor" value="black"/>
						<br/>
						
						<table id="dynamic-table" class="table table-striped table-bordered">
							<tr class="center" style="cursor:pointer;">
								<td bgcolor="black"><label onclick="setcolor('black');"><input name="form-field-radioc" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td bgcolor="red"><label onclick="setcolor('red');"><input name="form-field-radioc" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td bgcolor="green"><label onclick="setcolor('green');"><input name="form-field-radioc" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td bgcolor="orange"><label onclick="setcolor('orange');"><input name="form-field-radioc" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td bgcolor="purple"><label onclick="setcolor('purple');"><input name="form-field-radioc" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td bgcolor="pink"><label onclick="setcolor('pink');"><input name="form-field-radioc" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td bgcolor="blue"><label onclick="setcolor('blue');"><input name="form-field-radioc" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td bgcolor="grey"><label onclick="setcolor('grey');"><input name="form-field-radioc" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td bgcolor="brown"><label onclick="setcolor('brown');"><input name="form-field-radioc" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td bgcolor="white"><label onclick="setcolor('white');"><input name="form-field-radioc" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
							</tr>
						</table>
						
						<table id="dynamic-table" class="table table-striped table-bordered">
						
							<tr class="center" style="cursor:pointer;">
								<td><label onclick="seticon('menu-icon fa fa-adjust ');"><i class="menu-icon fa fa-adjust "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa fa-asterisk ');"><i class="menu-icon fa fa-asterisk "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa fa-ban');"><i class="menu-icon fa fa-ban"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa fa-bar-chart-o ');"><i class="menu-icon fa fa-bar-chart-o "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa fa-barcode ');"><i class="menu-icon fa fa-barcode "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa fa-flask ');"><i class="menu-icon fa fa-flask "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa fa-beer ');"><i class="menu-icon fa fa-beer "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa fa-bell-o ');"><i class="menu-icon fa fa-bell-o "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa fa-bell ');"><i class="menu-icon fa fa-bell "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa fa-bolt ');"><i class="menu-icon fa fa-bolt "></i>&nbsp;&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa fa-book ');"><i class="menu-icon fa fa-book "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa fa-bookmark ');"><i class="menu-icon fa fa-bookmark "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa  fa-bookmark-o ');"><i class="menu-icon fa  fa-bookmark-o "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa fa-briefcase ');"><i class="menu-icon fa fa-briefcase "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa fa-bullhorn ');"><i class="menu-icon fa fa-bullhorn "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa fa-calendar ');"><i class="menu-icon fa fa-calendar "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa fa-camera ');"><i class="menu-icon fa fa-camera "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa fa-camera-retro ');"><i class="menu-icon fa fa-camera-retro "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa fa-certificate ');"><i class="menu-icon fa fa-certificate "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
							</tr>
							<tr class="center" style="cursor:pointer;">
								<td><label onclick="seticon('menu-icon fa fa-check-square-o ');"><i class="menu-icon fa fa-check-square-o "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa fa-square-o ');"><i class="menu-icon fa fa-square-o "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa fa-circle ');"><i class="menu-icon fa fa-circle "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa fa-circle-o ');"><i class="menu-icon fa fa-circle-o "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa fa-cloud ');"><i class="menu-icon fa fa-cloud "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa fa-cloud-download ');"><i class="menu-icon fa fa-cloud-download "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa fa-cloud-upload ');"><i class="menu-icon fa fa-cloud-upload "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa  fa-coffee ');"><i class="menu-icon fa  fa-coffee "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa fa-cog ');"><i class="menu-icon fa fa-cog "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa fa-cogs ');"><i class="menu-icon fa fa-cogs "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa fa-comment ');"><i class="menu-icon fa fa-comment "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa fa-comment-o ');"><i class="menu-icon fa fa-comment-o "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa fa-comments ');"><i class="menu-icon fa fa-comments "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa fa-comments-o ');"><i class="menu-icon fa fa-comments-o "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa fa-credit-card ');"><i class="menu-icon fa fa-credit-card "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa fa-tachometer ');"><i class="menu-icon fa fa-tachometer "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa fa-desktop ');"><i class="menu-icon fa fa-desktop "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa fa-arrow-circle-o-down ');"><i class="menu-icon fa fa-arrow-circle-o-down "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa fa-download ');"><i class="menu-icon fa fa-download "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
							</tr>
							<tr class="center" style="cursor:pointer;">
								<td><label onclick="seticon('menu-icon fa fa-pencil-square-o ');"><i class="menu-icon fa fa-pencil-square-o "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa fa-envelope ');"><i class="menu-icon fa fa-envelope "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa fa-envelope-o ');"><i class="menu-icon fa fa-envelope-o "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa fa-exchange ');"><i class="menu-icon fa fa-exchange "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa fa-exclamation-circle ');"><i class="menu-icon fa fa-exclamation-circle "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa fa-external-link ');"><i class="menu-icon fa fa-external-link "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa fa-eye-slash ');"><i class="menu-icon fa fa-eye-slash "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa fa-eye ');"><i class="menu-icon fa fa-eye"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa fa-video-camera ');"><i class="menu-icon fa fa-video-camera "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa fa-fighter-jet ');"><i class="menu-icon fa fa-fighter-jet "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa fa-film ');"><i class="menu-icon fa fa-film "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa fa-filter ');"><i class="menu-icon fa fa-filter "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa fa-fire ');"><i class="menu-icon fa fa-fire "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa fa-flag ');"><i class="menu-icon fa fa-flag "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa fa-folder ');"><i class="menu-icon fa fa-folder "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa fa-folder-open ');"><i class="menu-icon fa fa-folder-open "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa fa-folder-o ');"><i class="menu-icon fa fa-folder-o "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa fa-folder-open-o ');"><i class="menu-icon fa fa-folder-open-o "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa fa-cutlery ');"><i class="menu-icon fa fa-cutlery "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
							</tr>
							<tr class="center" style="cursor:pointer;">
								<td><label onclick="seticon('menu-icon fa fa-gift ');"><i class="menu-icon fa fa-gift "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa fa-glass ');"><i class="menu-icon fa fa-glass "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa fa-globe ');"><i class="menu-icon fa fa-globe "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa fa-users ');"><i class="menu-icon fa 	fa-users "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa fa-hdd-o ');"><i class="menu-icon fa fa-hdd-o "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa fa-headphones ');"><i class="menu-icon fa fa-headphones "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa fa-heart ');"><i class="menu-icon fa fa-heart "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa fa-heart-o ');"><i class="menu-icon fa fa-heart-o "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa fa-home ');"><i class="menu-icon fa fa-home "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa fa-inbox ');"><i class="menu-icon fa  fa-inbox "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa fa-info-circle ');"><i class="menu-icon fa fa-info-circle "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa fa-key ');"><i class="menu-icon fa fa-key "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa fa-leaf ');"><i class="menu-icon fa fa-leaf "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa fa-laptop ');"><i class="menu-icon fa fa-laptop "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa fa-gavel ');"><i class="menu-icon fa fa-gavel "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa fa-lemon-o ');"><i class="menu-icon fa fa-lemon-o "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa fa-lightbulb-o ');"><i class="menu-icon fa fa-lightbulb-o "></i>&nbsp;&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa fa-lock ');"><i class="menu-icon fa fa-lock "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
								<td><label onclick="seticon('menu-icon fa fa-unlock ');"><i class="menu-icon fa fa-unlock "></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
							</tr>
							<tr>
							<td colspan="19" >&nbsp;</td> </tr>
								<tr class="center"  style="cursor:pointer;">
									<td>
										<label onclick="seticon('icon-plus-sign');">
											<i class="icon-plus-sign"></i>&nbsp;
											<input name="form-field-radio" type="radio" value="icon-edit">
											<span class="lbl"></span>
										</label>
									</td>
									<td><label onclick="seticon('menu-icon icon-remove-sign ');"> <i class="icon-remove-sign"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
									<td><label onclick="seticon('menu-icon icon-trash ');">       <i class="icon-trash"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
									<td><label onclick="seticon('menu-icon icon-edit ');">		<i class="icon-edit"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
									<td><label onclick="seticon('menu-icon icon-zoom-in ');">		<i class="icon-zoom-in"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
									<td><label onclick="seticon('menu-icon icon-glass ');">		<i class="icon-glass"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
									<td><label onclick="seticon('menu-icon icon-music ');">		<i class="icon-music"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
									<td><label onclick="seticon('menu-icon icon-search ');">		<i class="icon-search"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
									<td><label onclick="seticon('menu-icon icon-envelope-alt ');"><i class="icon-envelope-alt"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
									<td><label onclick="seticon('menu-icon icon-heart ');">		<i class="icon-heart"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
									<td><label onclick="seticon('menu-icon icon-star ');">		<i class="icon-star"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
									<td><label onclick="seticon('menu-icon icon-star-empty ');">	<i class="icon-star-empty"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
									<td><label onclick="seticon('menu-icon icon-user ');">		<i class="icon-user"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
									<td><label onclick="seticon('menu-icon icon-film ');">		<i class="icon-film"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
									<td><label onclick="seticon('menu-icon icon-th-large ');">	<i class="icon-th-large"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
									<td><label onclick="seticon('menu-icon icon-th ');">			<i class="icon-th"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>
									<td><label onclick="seticon('menu-icon icon-th-list ');">		<i class="icon-th-list"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-ok ');">				<i class="icon-ok"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-remove	 ');">		<i class="icon-remove	"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								   </tr>
							<tr>
								   
								    <td><label onclick="seticon('menu-icon icon-zoom-out ');">		<i class="icon-zoom-out"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-off ');">				<i class="icon-off"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-signal ');">			<i class="icon-signal"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-cog ');">				<i class="icon-cog"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-home ');">			<i class="icon-home"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-file-alt ');">		<i class="icon-file-alt"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-time ');">			<i class="icon-time"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-road ');">			<i class="icon-road"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-download-alt ');">	<i class="icon-download-alt"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-download ');">		<i class="icon-download"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-upload ');">			<i class="icon-upload"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-inbox ');">			<i class="icon-inbox"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-play-circle ');">		<i class="icon-play-circle"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-repeat ');">			<i class="icon-repeat"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-refresh ');">			<i class="icon-refresh"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-list-alt ');">		<i class="icon-list-alt"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-lock ');">			<i class="icon-lock"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-flag ');">			<i class="icon-flag"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-headphones ');">		<i class="icon-headphones"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								
							 </tr>
							<tr>
								    <td><label onclick="seticon('menu-icon icon-volume-off ');">		<i class="icon-volume-off"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-volume-down ');">		<i class="icon-volume-down"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-volume-up ');">		<i class="icon-volume-up"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-qrcode ');">			<i class="icon-qrcode"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-barcode ');">			<i class="icon-barcode"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-tag ');">				<i class="icon-tag"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-tags ');">			<i class="icon-tags"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-book ');">			<i class="icon-book"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-bookmark ');">		<i class="icon-bookmark"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-print ');">			<i class="icon-print"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-camera ');">			<i class="icon-camera"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-font ');">			<i class="icon-font"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-bold ');">			<i class="icon-bold"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-italic ');">			<i class="icon-italic"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-text-height ');">		<i class="icon-text-height"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								 	<td><label onclick="seticon('menu-icon icon-text-width ');">		<i class="icon-text-width"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-align-left ');">		<i class="icon-align-left"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-align-center ');">	<i class="icon-align-center"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-align-right ');">		<i class="icon-align-right"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								   
								</tr>
							<tr>
								    <td><label onclick="seticon('menu-icon icon-align-justify ');">	<i class="icon-align-justify"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-list ');">			<i class="icon-list"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-indent-left ');">		<i class="icon-indent-left"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-indent-right ');">	<i class="icon-indent-right"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-facetime-video ');">	<i class="icon-facetime-video"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-picture ');">			<i class="icon-picture"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-pencil ');">			<i class="icon-pencil"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-map-marker ');">		<i class="icon-map-marker"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-adjust ');">			<i class="icon-adjust"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-tint ');">			<i class="icon-tint"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-share ');">			<i class="icon-share"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-check ');">			<i class="icon-check"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-move ');">			<i class="icon-move"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-step-backward ');">	<i class="icon-step-backward"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
									<td><label onclick="seticon('menu-icon icon-fast-backward ');">	<i class="icon-fast-backward"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-backward ');">		<i class="icon-backward"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-play ');">			<i class="icon-play"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-pause ');">			<i class="icon-pause"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-stop ');">			<i class="icon-stop"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								  
								</tr>
							<tr>
								    <td><label onclick="seticon('menu-icon icon-forward ');">			<i class="icon-forward"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-fast-forward ');">	<i class="icon-fast-forward"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-step-forward ');">	<i class="icon-step-forward"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-eject ');">			<i class="icon-eject"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-chevron-left ');">	<i class="icon-chevron-left"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-chevron-right ');">	<i class="icon-chevron-right"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-minus-sign ');">		<i class="icon-minus-sign"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-ok-sign ');">			<i class="icon-ok-sign"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-question-sign ');">	<i class="icon-question-sign"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-info-sign ');">		<i class="icon-info-sign"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-screenshot ');">		<i class="icon-screenshot"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-remove-circle ');">	<i class="icon-remove-circle"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-ok-circle ');">		<i class="icon-ok-circle"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
									<td><label onclick="seticon('menu-icon icon-ban-circle ');">		<i class="icon-ban-circle"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-arrow-left ');">		<i class="icon-arrow-left"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-arrow-right ');">		<i class="icon-arrow-right"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-arrow-up ');">		<i class="icon-arrow-up"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-arrow-down ');">		<i class="icon-arrow-down"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-share-alt ');">		<i class="icon-share-alt"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								   
								</tr>
							<tr>   
									<td><label onclick="seticon('menu-icon icon-resize-full ');">		<i class="icon-resize-full"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-resize-small ');">	<i class="icon-resize-small"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-plus ');">			<i class="icon-plus"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-minus ');">			<i class="icon-minus"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-asterisk ');">		<i class="icon-asterisk"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-exclamation-sign ');"><i class="icon-exclamation-sign"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-gift ');">			<i class="icon-gift"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-leaf ');">			<i class="icon-leaf"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-fire ');">			<i class="icon-fire"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-eye-open ');">		<i class="icon-eye-open"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-eye-close ');">		<i class="icon-eye-close"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-warning-sign ');">	<i class="icon-warning-sign"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-plane ');">			<i class="icon-plane"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
									<td><label onclick="seticon('menu-icon icon-calendar ');">		<i class="icon-calendar"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-random ');">			<i class="icon-random"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-comment ');">			<i class="icon-comment"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-magnet ');">			<i class="icon-magnet"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-chevron-up ');">		<i class="icon-chevron-up"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-chevron-down ');">	<i class="icon-chevron-down"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								  
								</tr>
							<tr>
									<td><label onclick="seticon('menu-icon icon-retweet ');">			<i class="icon-retweet"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-shopping-cart ');">	<i class="icon-shopping-cart"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-folder-close ');">	<i class="icon-folder-close"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-folder-open ');">		<i class="icon-folder-open"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-resize-vertical ');">	<i class="icon-resize-vertical"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-resize-horizontal');"><i class="icon-resize-horizontal"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-bar-chart ');">		<i class="icon-bar-chart"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-twitter-sign ');">	<i class="icon-twitter-sign"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-facebook-sign ');">	<i class="icon-facebook-sign"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-camera-retro ');">	<i class="icon-camera-retro"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-key ');">				<i class="icon-key"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-cogs ');">			<i class="icon-cogs"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
									<td><label onclick="seticon('menu-icon icon-comments ');">		<i class="icon-comments"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-thumbs-up-alt ');">	<i class="icon-thumbs-up-alt"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-thumbs-down-alt ');">	<i class="icon-thumbs-down-alt"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-star-half ');">		<i class="icon-star-half"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-heart-empty ');">		<i class="icon-heart-empty"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-signout ');">			<i class="icon-signout"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-linkedin-sign ');">	<i class="icon-linkedin-sign"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								   
							
							
							</tr>
							<tr>
									<td><label onclick="seticon('menu-icon icon-pushpin ');">			<i class="icon-pushpin"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-external-link ');">	<i class="icon-external-link"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-signin ');">			<i class="icon-signin"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-trophy ');">			<i class="icon-trophy"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-github-sign ');">		<i class="icon-github-sign"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-upload-alt ');">		<i class="icon-upload-alt"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-lemon ');">			<i class="icon-lemon"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-phone ');">			<i class="icon-phone"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-check-empty ');">		<i class="icon-check-empty"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-bookmark-empty ');">	<i class="icon-bookmark-empty"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-phone-sign ');">		<i class="icon-phone-sign"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
									<td><label onclick="seticon('menu-icon icon-tasks ');">			<i class="icon-tasks"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-filter ');">			<i class="icon-filter"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-briefcase ');">		<i class="icon-briefcase"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-fullscreen ');">		<i class="icon-fullscreen"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-group ');">			<i class="icon-group"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-link ');">			<i class="icon-link"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-cloud ');">			<i class="icon-cloud"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-beaker ');">			<i class="icon-beaker"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								  
								</tr>
							<tr>
								    <td><label onclick="seticon('menu-icon icon-twitter ');">			<i class="icon-twitter"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-facebook ');">		<i class="icon-facebook"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-github ');">			<i class="icon-github"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-unlock ');">			<i class="icon-unlock"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-credit-card ');">		<i class="icon-credit-card"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-rss ');">				<i class="icon-rss"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-hdd ');">				<i class="icon-hdd"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-bullhorn ');">		<i class="icon-bullhorn"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-bell ');">			<i class="icon-bell"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-certificate ');">		<i class="icon-certificate"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-hand-right ');">		<i class="icon-hand-right"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-hand-left ');">		<i class="icon-hand-left"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-hand-up ');">			<i class="icon-hand-up"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-hand-down ');">		<i class="icon-hand-down"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-circle-arrow-left');"><i class="icon-circle-arrow-left"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-circle-arrow-right');"><i class="icon-circle-arrow-right"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-circle-arrow-up');">	<i class="icon-circle-arrow-up"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-circle-arrow-down ');"><i class="icon-circle-arrow-down"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-globe ');">			<i class="icon-globe"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    
								</tr>
								<tr>  
									<td><label onclick="seticon('menu-icon icon-wrench ');">			<i class="icon-wrench"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								  	<td><label onclick="seticon('menu-icon icon-cut ');">				<i class="icon-cut"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-copy ');">			<i class="icon-copy"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-paper-clip ');">		<i class="icon-paper-clip"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-save ');">			<i class="icon-save"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-sign-blank ');">		<i class="icon-sign-blank"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-reorder ');">			<i class="icon-reorder"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-list-ul ');">			<i class="icon-list-ul"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-list-ol ');">			<i class="icon-list-ol"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-strikethrough ');">	<i class="icon-strikethrough"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-underline ');">		<i class="icon-underline"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-table ');">			<i class="icon-table"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-magic ');">			<i class="icon-magic"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-truck ');">			<i class="icon-truck"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-pinterest ');">		<i class="icon-pinterest"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-pinterest-sign ');">	<i class="icon-pinterest-sign"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-google-plus-sign ');"><i class="icon-google-plus-sign"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-google-plus ');">		<i class="icon-google-plus"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-money ');">			<i class="icon-money"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
						   		</tr>
						   		<tr>
								    <td><label onclick="seticon('menu-icon icon-caret-down ');">		<i class="icon-caret-down"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-caret-up ');">		<i class="icon-caret-up"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-caret-left ');">		<i class="icon-caret-left"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-caret-right ');">		<i class="icon-caret-right"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-columns ');">			<i class="icon-columns"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-sort ');">			<i class="icon-sort"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-sort-down ');">		<i class="icon-sort-down"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-sort-up ');">			<i class="icon-sort-up"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-envelope ');">		<i class="icon-envelope"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-linkedin ');">		<i class="icon-linkedin"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-undo ');">			<i class="icon-undo"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-legal ');">			<i class="icon-legal"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-dashboard ');">		<i class="icon-dashboard"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-comment-alt ');">		<i class="icon-comment-alt"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-comments-alt ');">	<i class="icon-comments-alt"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-bolt ');">			<i class="icon-bolt"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-sitemap ');">			<i class="icon-sitemap"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-umbrella ');">		<i class="icon-umbrella"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-paste ');">			<i class="icon-paste"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								     </tr>
								    <tr>
								    <td><label onclick="seticon('menu-icon icon-lightbulb ');">		<i class="icon-lightbulb"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-exchange ');">		<i class="icon-exchange"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-cloud-download ');">	<i class="icon-cloud-download"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-cloud-upload ');">	<i class="icon-cloud-upload"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-user-md ');">			<i class="icon-user-md"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-stethoscope ');">		<i class="icon-stethoscope"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-suitcase ');">		<i class="icon-suitcase"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-bell-alt ');">		<i class="icon-bell-alt"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-coffee ');">			<i class="icon-coffee"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-food ');">			<i class="icon-food"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-file-text-alt ');">	<i class="icon-file-text-alt"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-building ');">		<i class="icon-building"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-hospital ');">		<i class="icon-hospital"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-ambulance ');">		<i class="icon-ambulance"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-medkit ');">			<i class="icon-medkit"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-fighter-jet ');">		<i class="icon-fighter-jet"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-beer ');">			<i class="icon-beer"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-h-sign ');">			<i class="icon-h-sign"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-plus-sign-alt ');">	<i class="icon-plus-sign-alt"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								     </tr>
								    <tr>
								    <td><label onclick="seticon('menu-icon icon-double-angle-left');"><i class="icon-double-angle-left"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								   <td><label onclick="seticon('menu-icon icon-double-angle-right');"><i class="icon-double-angle-right"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-double-angle-up ');">	<i class="icon-double-angle-up"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								   <td><label onclick="seticon('menu-icon icon-double-angle-down ');"><i class="icon-double-angle-down"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-angle-left ');">		<i class="icon-angle-left"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-angle-right ');">		<i class="icon-angle-right"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-angle-up ');">		<i class="icon-angle-up"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-angle-down ');">		<i class="icon-angle-down"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-desktop ');">			<i class="icon-desktop"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-laptop ');">			<i class="icon-laptop"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-tablet ');">			<i class="icon-tablet"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-mobile-phone ');">	<i class="icon-mobile-phone"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-circle-blank ');">	<i class="icon-circle-blank"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-quote-left ');">		<i class="icon-quote-left"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-quote-right ');">		<i class="icon-quote-right"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-spinner ');">			<i class="icon-spinner"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-circle ');">			<i class="icon-circle"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-reply ');">			<i class="icon-reply"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-github-alt ');">		<i class="icon-github-alt"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								     </tr>
								    <tr>
								    <td><label onclick="seticon('menu-icon icon-folder-close-alt ');"><i class="icon-folder-close-alt"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-folder-open-alt ');">	<i class="icon-folder-open-alt"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-expand-alt ');">		<i class="icon-expand-alt"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-collapse-alt ');">	<i class="icon-collapse-alt"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-smile ');">			<i class="icon-smile"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-frown ');">			<i class="icon-frown"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-meh ');">				<i class="icon-meh"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-gamepad ');">			<i class="icon-gamepad"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-keyboard ');">		<i class="icon-keyboard"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-flag-alt ');">		<i class="icon-flag-alt"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-flag-checkered ');">	<i class="icon-flag-checkered"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-terminal ');">		<i class="icon-terminal"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-code ');">			<i class="icon-code"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-reply-all ');">		<i class="icon-reply-all"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-mail-reply-all ');">	<i class="icon-mail-reply-all"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-star-half-empty ');">	<i class="icon-star-half-empty"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-location-arrow ');">	<i class="icon-location-arrow"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-crop ');">			<i class="icon-crop"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-code-fork ');">		<i class="icon-code-fork"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								   </tr>
								    <tr>
								    <td><label onclick="seticon('menu-icon icon-unlink ');">			<i class="icon-unlink"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-question ');">		<i class="icon-question"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-info ');">			<i class="icon-info"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-exclamation ');">		<i class="icon-exclamation"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-superscript ');">		<i class="icon-superscript"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-subscript ');">		<i class="icon-subscript"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-eraser ');">			<i class="icon-eraser"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-puzzle-piece ');">	<i class="icon-puzzle-piece"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-microphone ');">		<i class="icon-microphone"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-microphone-off ');">	<i class="icon-microphone-off"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-shield ');">			<i class="icon-shield"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-calendar-empty ');">	<i class="icon-calendar-empty"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-fire-extinguisher');"><i class="icon-fire-extinguisher"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-rocket ');">			<i class="icon-rocket"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-maxcdn ');">			<i class="icon-maxcdn"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-chevron-sign-left');"><i class="icon-chevron-sign-left"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								   <td><label onclick="seticon('menu-icon icon-chevron-sign-right');"><i class="icon-chevron-sign-right"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-chevron-sign-up ');">	<i class="icon-chevron-sign-up"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								   <td><label onclick="seticon('menu-icon icon-sort-by-order-alt');"><i class="icon-sort-by-order-alt"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								     
								  	</tr>
								    <tr>
								    <td><label onclick="seticon('menu-icon icon-chevron-sign-down');"> <i class="icon-chevron-sign-down"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-html5 ');">			<i class="icon-html5"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-css3 ');">			<i class="icon-css3"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-anchor ');">			<i class="icon-anchor"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-unlock-alt ');">		<i class="icon-unlock-alt"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-bullseye ');">		<i class="icon-bullseye"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								 	<td><label onclick="seticon('menu-icon icon-ellipsis-horizontal');"><i class="icon-ellipsis-horizontal"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-ellipsis-vertical');"><i class="icon-ellipsis-vertical"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-rss-sign ');">		<i class="icon-rss-sign"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-play-sign ');">		<i class="icon-play-sign"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-ticket ');">			<i class="icon-ticket"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-minus-sign-alt ');">	<i class="icon-minus-sign-alt"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-check-minus ');">		<i class="icon-check-minus"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-level-up ');">		<i class="icon-level-up"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-level-down ');">		<i class="icon-level-down"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-check-sign ');">		<i class="icon-check-sign"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-edit-sign ');">		<i class="icon-edit-sign"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								   <td><label onclick="seticon('menu-icon icon-external-link-sign');"><i class="icon-external-link-sign"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-share-sign ');">		<i class="icon-share-sign"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								   </tr>
								    <tr>
								    <td><label onclick="seticon('menu-icon icon-compass ');">			<i class="icon-compass"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-collapse ');">		<i class="icon-collapse"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-collapse-top ');">	<i class="icon-collapse-top"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-expand ');">			<i class="icon-expand"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-eur ');">				<i class="icon-eur"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-gbp ');">				<i class="icon-gbp"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-usd ');">				<i class="icon-usd"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-inr ');">				<i class="icon-inr"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-jpy ');">				<i class="icon-jpy"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-cny ');">				<i class="icon-cny"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-krw ');">				<i class="icon-krw"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-btc ');">				<i class="icon-btc"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-file ');">			<i class="icon-file"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-file-text ');">		<i class="icon-file-text"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-sort-by-alphabet ');"><i class="icon-sort-by-alphabet"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								 <td><label onclick="seticon('menu-icon icon-sort-by-alphabet-alt');"><i class="icon-sort-by-alphabet-alt"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								   <td><label onclick="seticon('menu-icon icon-sort-by-attributes');"><i class="icon-sort-by-attributes"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								<td><label onclick="seticon('menu-icon icon-sort-by-attributes-alt')"><i class="icon-sort-by-attributes-alt"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-sort-by-order ');">	<i class="icon-sort-by-order"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								   
								    </tr>
								    <tr>
								    <td><label onclick="seticon('menu-icon icon-thumbs-down ');">		<i class="icon-thumbs-down"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-youtube-sign ');">	<i class="icon-youtube-sign"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-youtube ');">		    <i class="icon-youtube"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-xing ');">		    <i class="icon-xing"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-xing-sign ');">		<i class="icon-xing-sign"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-youtube-play ');">	<i class="icon-youtube-play"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-dropbox ');">			<i class="icon-dropbox"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-stackexchange ');">   <i class="icon-stackexchange"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-instagram ');">		<i class="icon-instagram"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-flickr ');">		    <i class="icon-flickr"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-adn ');">				<i class="icon-adn"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-bitbucket ');">		<i class="icon-bitbucket"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-bitbucket-sign ');">	<i class="icon-bitbucket-sign"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-tumblr ');">			<i class="icon-tumblr"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-tumblr-sign ');">		<i class="icon-tumblr-sign"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-long-arrow-down ');">	<i class="icon-long-arrow-down"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-long-arrow-up ');">	<i class="icon-long-arrow-up"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-long-arrow-left ');">	<i class="icon-long-arrow-left"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-long-arrow-right ');"><i class="icon-long-arrow-right"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    </tr>
								    <tr>
								    <td><label onclick="seticon('menu-icon icon-windows ');">			<i class="icon-windows"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-android ');">			<i class="icon-android"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-linux ');">			<i class="icon-linux"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-dribbble ');">		<i class="icon-dribbble"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-skype ');">			<i class="icon-skype"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-foursquare ');">		<i class="icon-foursquare"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-trello ');">			<i class="icon-trello"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-female ');">			<i class="icon-female"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-male ');">			<i class="icon-male"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-gittip ');">			<i class="icon-gittip"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-sun ');">				<i class="icon-sun"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-moon ');">			<i class="icon-moon"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-archive ');">			<i class="icon-archive"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-bug ');">				<i class="icon-bug"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-vk ');">				<i class="icon-vk"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-weibo ');">			<i class="icon-weibo"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								    <td><label onclick="seticon('menu-icon icon-renren ');">			<i class="icon-renren"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								     <td><label onclick="seticon('menu-icon icon-apple ');">			<i class="icon-apple"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								     <td><label onclick="seticon('menu-icon icon-thumbs-up ');">		<i class="icon-thumbs-up"></i>&nbsp;<input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl"></span></label></td>	
								 
							<tr>
								<td style="text-align: center;" colspan="100">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
								</td>
							</tr>
						</table>
						 
		
						</form>
						
						</div>
						
						<div id="zhongxin2" class="center" style="display:none"><img src="static/images/jzx.gif" /></div>
						
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
	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../index/foot.jsp"%>
	<script type="text/javascript">
		$(top.hangge());
		//保存
		function save(){
			if($("#MENU_ICON").val()==""){
				alert('请选择图标');
				return false;
			}
			$("#MENU_ICON").val($("#MENU_ICON").val()+$("#MENU_ICONColor").val());
			$("#menuForm").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		function seticon(icon){
			$("#MENU_ICON").val(icon);
		}
		function setcolor(iconColor){
			$("#MENU_ICONColor").val(iconColor);
		}
	</script>


</body>
</html>