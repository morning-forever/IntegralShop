<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="${system.basePath }">
<%@ include file="/static/inc.jsp" %>
<style type="text/css">
.dataTables_wrapper {
position: relative;
clear: both;
zoom: 1;
width: 700px;
}
</style>
</head>
<body>
<div class="container-fluid" id="main-container">
	<div id="breadcrumbs">
		<ul class="breadcrumb">
			<li><i class="icon-home"></i> <a href="javascript:;">当前</a><span class="divider"><i class="icon-angle-right"></i></span></li>
			<li class="active">积分商城</li>
		</ul><!--.breadcrumb-->
	</div><!--#breadcrumbs-->
	<div class="row-fluid">
		<div class="table-header">编辑商品类型</div>
		<div id="div_content" class="row-fluid" style="padding-top: 10px;">
			<form id="form" class="form-horizontal" method="post" >
				<div class="control-group">
					<label class="control-label" for="name"><span class="red f12">* </span>商品类型名:</label>
					<div class="controls">
						<div class="span12">
							<input type="text" id="name" name="goodsType"  value="${goodsType.goodsType }" style="width: 300px;"/>
							<input type="hidden" name="id" value="${goodsType.id }"/>
						</div>
					</div>
				</div>
		  	</form>
		</div>
		<div style="text-align: center;">
			<a title="保存" href="javascript:;" class="btn btn-info" id="back-btn" onclick="save()"><i class="icon-save"></i> 保存</a>
			<a title="返回" href="javascript:;" class="btn btn-grey" id="back-btn" onclick="back()"><i class="icon-reply"></i> 返回</a>
		</div>
	</div>
</div>
<!-- #main-content -->
<%@ include file="/static/foot.jsp" %>
</body>
<script type="text/javascript" charset="utf-8"
	src="plugins/ueditor1.4.3/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="plugins/ueditor1.4.3/ueditor.all.min.js"></script>
<script type="text/javascript" src="static/js/jquery.form.js"></script>
<script type="text/javascript" src="static/js/ajaxfileupload.js"></script>
<script type="text/javascript" src="static/js/daterangepicker.min.js"></script>
<script type="text/javascript" src="static/js/bootstrap-timepicker.min.js"></script>
<script type="text/javascript" src="static/js/fuelux.spinner.js"></script>
<script type="text/javascript" src="static/web/js/base.js"></script>
<!-- 日历控件 -->
<script src='static/web/js/fullcalendar/moment.min.js'></script>
<script type="text/javascript" src="static/js/fullcalendar.min.js"></script>
<!--定义操作列按钮模板-->
<script id="tpl" type="text/x-handlebars-template">
	{{#each func}}
	<a class="btn btn-mini btn-{{this.type}}" href="javascript:;" title="{{this.name}}" target="mainFrame" onclick="{{this.fn}}"><i class="icon-{{this.icon}}"></i></a>
	{{/each}}
</script>
<script type="text/javascript">
var tpl = $("#tpl").html();
//预编译模板
var template = Handlebars.compile(tpl);

$(document).ready(function() {
	$('#otherInfoTab a:eq(0)').tab('show');
	$('#otherInfoTab a').click(function(e) {
		e.preventDefault();//阻止a链接的跳转行为
		$(this).tab('show');//显示当前选中的链接及关联的content
	});
});

//保存
function save(){
		var formObj = serializeObject($("#form"));
		var id=
		$.post('admin/integralShop/goods_type_manage/update', formObj , function(res) {
			if (res.status == 'success') {
				bootbox.alert("提交成功", function() {
					back();
				});
			} else {
				bootbox.alert("提交失败，请重试");
			}
		}, "JSON");
}
//返回
function back(){
	location.href = "admin/integralShop/goods_type_manage/main";
}
//表单序列化
var serializeObject = function(form) {
	var o = {};
	$.each(form.serializeArray(), function(index) {
		if (o[this["name"]]) {
			o[this["name"]] = o[this["name"]] + "," + this["value"];
		} else {
			o[this["name"]] = this["value"];
		}
	});
	return o;
};
</script>
</html>
