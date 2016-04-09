﻿<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="${system.basePath }">
<!-- jsp文件头和头部 -->
<%@ include file="/static/inc.jsp"%>
<style type="text/css">
#btnmenu tr td{
	margin: 5px 5px;
	padding: 5px 5px;
}
</style>
</head>
<body style="margin: 0 0;padding: 0 0;" >
<div class="container-fluid" id="main-container">
<div id="breadcrumbs">
	<ul class="breadcrumb">
		<li><i class="icon-home"></i> <a href="javascript:;">当前</a><span class="divider"><i class="icon-angle-right"></i></span></li>
		<li class="active">首页</li>
	</ul><!--.breadcrumb-->
</div><!--#breadcrumbs-->

<!-- table start -->	
<!-- <div class="row-fluid">
<h3 class="header smaller lighter blue">数据统计表</h3> -->
<div class="table-header">
	首页
</div>
<form id="searchForm" action="admin/home/defaults" method="post">
<div>
	欢迎使用黔易游后台管理系统
</div>
</form>
<!-- table end -->
<!-- #main-content -->

<!-- basic scripts -->
<script src="static/1.9.1/jquery.min.js"></script>
<script type="text/javascript">
window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");
</script>
<script src="static/js/bootstrap.min.js"></script>
<script type="text/javascript" src="static/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="static/js/jquery.dataTables.bootstrap.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#searchBtn").click(function(){
		top.jzts();
		$("#searchForm").submit();
	});
	
	$("#addBtn").click(function(){
		top.jzts();
	});
	$("#editBtn").click(function(){
		top.jzts();
	});
	$("#trashBtn").click(function(){
		top.jzts();
	});
	$("#excelBtn").click(function(){
		top.jzts();
	});
});


$(function() {
	$('table th input:checkbox').on('click' , function(){
		var that = this;
		$(this).closest('table').find('tr > td:first-child input:checkbox')
		.each(function(){
			this.checked = that.checked;
			$(this).closest('tr').toggleClass('selected');
		});
			
	});
	$('[data-rel=tooltip]').tooltip();
});
</script>


</body>
</html>
