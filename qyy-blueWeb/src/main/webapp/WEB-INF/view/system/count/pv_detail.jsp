<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="${system.basePath }">
<%@ include file="/static/inc.jsp" %>

</head>
<body>
<div class="container-fluid" id="main-container">
	<div id="breadcrumbs">
		<ul class="breadcrumb">
			<li><i class="icon-home"></i> <a href="javascript:;">当前</a><span class="divider"><i class="icon-angle-right"></i></span></li>
			<li class="active">系统管理</li>
		</ul><!--.breadcrumb-->
	</div><!--#breadcrumbs-->
	<div class="row-fluid">
		<!-- <h3 class="header smaller lighter blue">会员管理</h3> -->
		<div class="table-header">
			PV,UV详情
		</div>
		<div id="div_content" class="row-fluid" style="padding-top: 10px;">
			<form class="form-horizontal" id="validation-form" method="post" >
				
				<div class="control-group">
					<label class="control-label" for="email">日期：</label>
					<div class="controls">
						<span class="span4">
							<input value="${pvuv.accessTime }" disabled="disabled"/>
						</span>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="email">PV量：</label>
					<div class="controls">
						<span class="span4">
							<input value="${pvuv.pvTotalCount }" disabled="disabled"/>
						</span>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="email">UV量：</label>
					<div class="controls">
						<span class="span4">
							<input value="${pvuv.uvTotalCount }" disabled="disabled"/>
						</span>
					</div>
				</div>
				
				<div class="hr hr-dotted"></div>
				
				<div class="control-group">
					<label class="control-label" for="email">查询URL:</label>
					<div class="controls">
						<span class="span4">
							<input id="accessUrl" name="accessUrl" placeholder="请输入要查询的url" />&nbsp;<button id="search-btn" type="button" class="btn btn-default">查询</button>
							<br><span style="color: red;">请尽量的详细,格式(pc/travels/detial/1_110)</span>
						</span>
					</div>
				</div>
				
				<div class="hr hr-dotted"></div>
				<div class="control-group">
					<label class="control-label" for="email">查询结果:</label>
					<div class="controls">
						<span class="span12">
								URL:<span style="color: blue; margin-left: 10px;" id="accessUrlShow">暂无</span>
							<br>P V:<span style="color: blue; margin-left: 10px;margin-right: 200px;" id="accessCount">暂无</span><span style="color: red; margin-left: 10px;">这里是获取访问的ip数(单页面的pv量)</span>
						</span>
					</div>
				</div>
				
				<div class="control-group" style="text-align: center;">
					<button id="back-btn" type="button" class="btn btn-default">返回</button>
				</div>
				
		  	</form>
		</div>
	</div>
</div>
<!-- #main-content -->
<%@ include file="/static/foot.jsp" %>
</body>

<script type="text/javascript" src="static/js/ajaxfileupload.js"></script>
<script type="text/javascript" src="static/js/jquery.form.js"></script>
<script type="text/javascript" src="static/js/daterangepicker.min.js"></script>

<script type="text/javascript">


/* var oReq = new XMLHttpRequest();

oReq.addEventListener("progress", updateProgress);

function updateProgress (oEvent) {
if (oEvent.lengthComputable) {
	var percentComplete = oEvent.loaded / oEvent.total;
	console.info(percentComplete);
} else {
	// Unable to compute progress information since the total size is unknown
}
} */

$(document).ready(function(){
	$("#uploadOpen").click(function(){
		$("#uploadApp").click();
	});
	
	$("#back-btn").click(function(){
		window.location.href='admin/version/main';
	});
	
	$("#search-btn").click(function(){
		var accessTime = '${pvuv.accessTime}';
		var accessUrl = $("#accessUrl").val();
		var param = {
			'accessTime':accessTime,
			'accessUrl':accessUrl
		};
		$.post('admin/puvcount/search',param,function(res){
			if(res.status == 'success' && res.accessUrl != 'null' && res.accessUrl != '' && res.accessUrl != null ){
				$("#accessUrlShow").text(res.accessUrl);
				$("#accessCount").text(res.pvTotalCount);
			}else{
				valTips($("#accessUrl"), "当前url没有访问信息");
			}
		},"JSON");
	});
});
</script>
</html>
