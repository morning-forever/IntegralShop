<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="${system.basePath }">
<%@ include file="/static/inc.jsp"%>

<link rel="stylesheet" href="static/css/daterangepicker.css" />
<link rel="stylesheet" href="static/css/bootstrap-timepicker.css" />
</head>
<style type="text/css">
form label {
	width: 220px;
}

#myform2 th {
	padding-left: 0px;
}

#myform5 th {
	padding-left: 0px;
}

#myform6 th {
	padding-left: 0px;
}
</style>
<body>
	<table style="display: none;">
		<tr class="telModel">
			<th></th>
			<td><input type="text" id="" name="" value="" tips="请输入商户联系电话">
				<a class="btn btn-small" onclick="addTel()"
				style="position: relative; bottom: 5px"><i class="icon-plus"></i></a>
				<a class="btn btn-small" onclick="deleteTel(this)"
				style="position: relative; bottom: 5px"><i class="icon-minus"></i></a>
			</td>
		</tr>
	</table>
	<div class="container-fluid" id="main-container">
		<div id="breadcrumbs">
			<ul class="breadcrumb">
				<li><i class="icon-home"></i> <a
					href="javascript:alert('index');">当前</a><span class="divider"><i
						class="icon-angle-right"></i></span></li>
				<li class="active">商户信息</li>
			</ul>
			<!--.breadcrumb-->
		</div>
		<!--#breadcrumbs-->
		<div class="row-fluid">
			<div class="table-header">装备信息</div>
			<div style="height: 30px;"></div>

			<ul class="nav nav-tabs" id="otherInfoTab">
				<li class="active"><a href="#tab_1">基本信息</a></li>
				<li><a href="#tab_2">联系方式</a></li>
			</ul>
			<div class="tab-content">
				<!-- 基本信息 -->
				<div class="tab-pane active" id="tab_1">
					<table class="mytable-detail">
						<tbody>
							<tr>
								<th>商户Logo：</th>
								<td>${merchUser.logo }</td>
							</tr>
							<tr>
								<th>商户名称：</th>
								<td>${merchUser.username }</td>
							</tr>
							<tr>
								<th>所在地：</th>
								<td>${loc }</td>
							</tr>
							<tr>
								<th>具体地址：</th>
								<td>${merchUser.addr_detail }</td>
							</tr>
							<tr>
								<th>装备分类：</th>
								<td>${merchUser.equip_name }</td>
							</tr>
							<tr>
								<th>商户介绍：</th>
								<td>${merchUser.summary }</td>
							</tr>
							<tr>
								<th>商户图片：</th>
								<td><c:forEach items="${photoUrlList }" var="photo">
										<img src="${photo.picUrl} " style="width: 170px; height: 130px"></img>
									</c:forEach></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="tab-pane" id="tab_2">
					<table class="mytable-detail">
						<tbody>
							<tr>
								<th>联系人：</th>
								<td>${merchUser.link_name }</td>
							</tr>
							<tr>
								<th>联系人手机号：</th>
								<td>${merchUser.link_phone }</td>
							</tr>
							<tr>
								<th>联系人邮箱：</th>
								<td>${merchUser.link_email }</td>
							</tr>
							<tr>
								<th>商户电话：</th>
								<td>${merchUser.link_merch_tel }</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div>
				<input class="btn" style="margin-left: 10%" onclick="doBack()"
					type="button" value="返回">
			</div>
		</div>
	</div>
	<%@ include file="/static/foot.jsp"%>
</body>
<script type="text/javascript" charset="utf-8"
	src="plugins/ueditor1.4.3/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="plugins/ueditor1.4.3/ueditor.all.min.js"></script>
<script type="text/javascript" src="static/js/jquery.form.js"></script>
<script type="text/javascript" src="static/js/ajaxfileupload.js"></script>
<script type="text/javascript" src="static/js/daterangepicker.min.js"></script>
<script type="text/javascript"
	src="static/js/bootstrap-timepicker.min.js"></script>
<script type="text/javascript" src="static/js/fuelux.spinner.js"></script>
<!--定义操作列按钮模板-->
<script id="tpl" type="text/x-handlebars-template">
	{{#each func}}
	<a class="btn btn-mini btn-{{this.type}}" href="javascript:;" title="{{this.name}}" target="mainFrame" onclick="{{this.fn}}"><i class="icon-{{this.icon}}"></i></a>
	{{/each}}
</script>
<script type="text/javascript">
	var tpl = $("#tpl").html();
	var ue;
	//预编译模板
	var template = Handlebars.compile(tpl);

	//tab页
	$(function() {
		$('#otherInfoTab a:first').tab('show');//初始化显示哪个tab
		$("#createTimeTh").hide();
		$("#createTimeCt").hide();

		$('#otherInfoTab a').click(function(e) {
			e.preventDefault();//阻止a链接的跳转行为
			$(this).tab('show');//显示当前选中的链接及关联的content
		})
	})

	function doBack(id) {
		window.location.href = "admin/roamMall/merchant/main?tab=3";
	}
</script>
</html>
