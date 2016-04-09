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
		<div class="table-header">新增横幅</div>
		<div id="div_content" class="row-fluid" style="padding-top: 10px;">
			<form id="bannerForm" class="form-horizontal" method="post" >
				<div class="control-group">
					<label class="control-label" for="name"><span class="red f12">* </span>横幅名称:</label>
					<div class="controls">
						<div class="span12">
							<input type="text" id="name" name="name"  style="width: 300px;"/>
						</div>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="name"><span class="red f12">* </span>横幅图片:</label>
					<div class="controls">
						<div class="span12">
							<div style="float: left;">
							<!-- banner图片 -->
					    	<img id="img" style="width: 400px;height: 200px;z-index: 0;position: relative;" onclick="inputClick(this)">
					    	<input type="file" name="img" id="input" style="display: none;" onchange="ajaxFileUpload(this)">
					    	<input type="text" name="url" id="url"  style="display:none;">
					    	<img id="delete" width="20" height="20" onclick="deleteUpload()" src="static/web/images/X.png" style="z-index: 10;position: relative;right: 20px;bottom: 100px">
					    	</div>
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

//删除图片
function deleteUpload() {
	var imgUrl=$("#url").val();
	alert("hello!");
	if(imgUrl!="" && imgUrl!=null){
		$.post('admin/integralShop/banner_manage/deleteByUrl/',{"imgUrl":imgUrl},function(res){
			if(res.status=="success"){
				valTips("img","成功删除服务器中的图片");
				$("#url").val("");
				$("#img").attr({
					src : "uploadFiles/uploadImgs/zanwutupian.jpg"
				});
			}else{
				valTips("img","删除失败！");
			}
			
		});
	}else{
		valTips("img","图片已删，暂无图片");
	}
}
//点击图片时
function inputClick(obj) {
	$("#input").click();
}

//文件上传
function ajaxFileUpload(obj) {
	//如果刚刚已经上传过图片，先删除刚上传的图片
	var imgUrl=$("#url").val();
	if(imgUrl!="" && imgUrl!=null && imgUrl!="uploadFiles/uploadImgs/zanwutupian.jpg"){
		$.post('admin/integralShop/banner_manage/deleteByUrl/',{"imgUrl":imgUrl});
	}
	
	//获取欲上传的文件路径  
	var fileId = $(obj).attr("id");
	$.ajaxFileUpload({
		url : 'admin/integralShop/banner_manage/bannerImgUpload', //需要链接到服务器地址
		secureuri : false,
		fileElementId : fileId, //文件选择框的id属性
		dataType : 'JSON', //服务器返回的格式，可以是json
		success : function(data) { //相当于java中try语句块的用法
			data = data.replace(/<[^>].*?>/g, "");//对返回的数据进行转换
			var json = eval("(" + data + ")");//对返回的数据进行转换
			$("#url").val(json.imgUrl);
			$("#img").attr({
				src : json.imgUrl
			});
			if(json.status == 'size_error'){
				valTips("img","图片大小不符合尺寸，建议更换");
			}
		}
	});
}
//保存
function save(){
		var formObj = serializeObject($("#bannerForm"));
		$.post('admin/integralShop/banner_manage/save', formObj , function(res) {
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
	location.href = "admin/integralShop/banner_manage/main";
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
