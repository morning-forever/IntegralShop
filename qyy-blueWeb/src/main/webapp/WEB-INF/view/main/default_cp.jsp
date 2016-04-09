﻿<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="${system.basePath }">
<!-- jsp文件头和头部 -->
<%@ include file="top.jsp"%>
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
		<li><i class="icon-home"></i> <a href="#">当前</a><span class="divider"><i class="icon-angle-right"></i></span></li>
		<li class="active">首页</li>
	</ul><!--.breadcrumb-->
</div><!--#breadcrumbs-->

<!-- table start -->	
<div class="row-fluid">
<h3 class="header smaller lighter blue">数据统计表</h3>
<div class="table-header">
	当前域名列表
</div>
<form id="searchForm" action="admin/home/defaults" method="post">
<div>
	<table id="btnmenu">
		<tr>
			<td>
				<span class="input-icon" style="margin-top: 7px;">
					<input autocomplete="off" id="nav-search-input" type="text" name="keyword" value="${pageData.keyword}" placeholder="这里输入关键词" /><i id="nav-search-icon" class="icon-search"></i>
				</span>
			</td>
			<td>
				<a id="searchBtn" class="btn btn-mini btn-light" onclick="" title="查询"><i class="icon-search"></i>查询</a>
			</td>
			<td>
				<a id="addBtn" class="btn btn-mini btn-success" onclick="" title="添加"><i class="icon-pencil"></i></a>
			</td>
			<td>
				<a id="editBtn" class="btn btn-mini btn-purple" onclick="" title="编辑"><i class="icon-edit"></i></a>
			</td>
			<td>
				<a id="trashBtn" class="btn btn-mini btn-danger" onclick="" title="删除" ><i class='icon-trash'></i></a>
			</td>
			<td>
				<a id="excelBtn" class="btn btn-mini btn-grey" onclick="" title="导出到EXCEL"><i class="icon-download-alt"></i></a>
			</td>
		</tr>
	</table>
</div>
	<table id="table_report" class="table table-striped table-bordered table-hover">
		<thead>
			<tr>
				<th class="center">
					<label><input type="checkbox" /><span class="lbl"></span></label>
				</th>
				<th>序号</th>
				<th>是否禁用</th>
				<th class="hidden-480">登录名</th>
				<th class="hidden-480">密码</th>
				<th class="hidden-phone">状态</th>
			</tr>
		</thead>
									
		<tbody>
			<c:forEach items="${pageData.varList }" var="obj" varStatus="st">
			<tr>
				<td class='center'>
					<label><input type='checkbox' /><span class="lbl"></span></label>
				</td>
				<td>${st.index+1 }</td>
				<td>${obj.is_ban }</td>
				<td>${obj.login_name }</td>
				<td>${obj.login_pwd }</td>
				<td>${obj.stutas }</td>
			</tr>
			</c:forEach>
			
			<tr>
				<td colspan="7">
					<div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div>
				
					<!-- <div class="pagination" style="text-align: right;">
					  <ul>
					    <li class="disabled"><a href="#"><i class="icon-double-angle-left"></i></a></li>
					    <li class="active"><a href="#">1</a></li>
					    <li><a href="#">2</a></li>
					    <li><a href="#">3</a></li>
					    <li><a href="#">4</a></li>
					    <li><a href="#">5</a></li>
					    <li><a href="#"><i class="icon-double-angle-right"></i></a></li>
					  </ul>
					</div> -->
				</td>
			</tr>
		</tbody>
	</table>
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
