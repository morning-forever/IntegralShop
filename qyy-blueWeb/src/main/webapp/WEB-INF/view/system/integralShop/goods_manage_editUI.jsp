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
		<div class="table-header">编辑商品</div>
		<div id="div_content" class="row-fluid" style="padding-top: 10px;">
			<form id="goodsForm" class="form-horizontal" method="post" >
				<input type="hidden" name="id" value="${goodsView.id}">
				<div class="control-group">
					<label class="control-label" for="name"><span class="red f12">* </span>商品名称:</label>
					<div class="controls">
						<div class="span12">
							<input type="text" id="name" name="name" value="${goodsView.name }" notNull="请填写商品名称！" style="width: 300px;"/>
						</div>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="name"><span class="red f12">* </span>网页端图片:</label>
					<div class="controls">
						<div class="span12">
							<div style="float: left;">
						    	<img id="img0" style="width: 350px;height: 200px;z-index: 0;position: relative;" onclick="inputClick(this)" src="${goodsView.goodsImages[0].imgUrl}">
						    	<input type="file" name="img" id="input0" style="display: none;" dest="uploadFiles/uploadImgs/goodsImage/" onchange="ajaxFileUpload(this)">
						    	<input type="text" name="goodsImages[0].imgUrl" id="url0" value="${goodsView.goodsImages[0].imgUrl}" style="display:none;">
						    	<input type="hidden" name="goodsImages[0].id" value="${goodsView.goodsImages[0].id}">
						    	<img id="delete0" width="20" height="20" onclick="deleteUpload(this)" src="static/web/images/X.png" style="z-index: 10;position: relative;right: 20px;bottom: 100px">
					    	</div>
					    	<div  style="float: left;">
						    	<img id="img1" style="width: 350px;height: 200px;z-index: 0;position: relative;" onclick="inputClick(this)" src="${goodsView.goodsImages[1].imgUrl}">
						    	<input type="file" name="img" id="input1" style="display: none;" dest="uploadFiles/uploadImgs/goodsImage/" onchange="ajaxFileUpload(this)">
						    	<input type="text" name="goodsImages[1].imgUrl" id="url1" value="${goodsView.goodsImages[1].imgUrl}" style="display:none;">
						    	<input type="hidden" name="goodsImages[1].id" value="${goodsView.goodsImages[1].id}">
						    	<img id="delete1" width="20" height="20" onclick="deleteUpload(this)" src="static/web/images/X.png" style="z-index: 10;position: relative;right: 20px;bottom: 100px">
					    	</div>
					    	<div  style="float: left;">
						    	<img id="img2" style="width: 350px;height: 200px;z-index: 0;position: relative;" onclick="inputClick(this)" src="${goodsView.goodsImages[2].imgUrl}">
						    	<input type="file" name="img" id="input2" style="display: none;" dest="uploadFiles/uploadImgs/goodsImage/" onchange="ajaxFileUpload(this)">
						    	<input type="text" name="goodsImages[2].imgUrl" id="url2" value="${goodsView.goodsImages[2].imgUrl}" style="display:none;">
						    	<input type="hidden" name="goodsImages[2].id" value="${goodsView.goodsImages[2].id}">
						    	<img id="delete2" width="20" height="20" onclick="deleteUpload(this)" src="static/web/images/X.png" style="z-index: 10;position: relative;right: 20px;bottom: 100px">
					    	</div>
					    	<div  style="float: left;">
						    	<img id="img3" style="width: 350px;height: 200px;z-index: 0;position: relative;" onclick="inputClick(this)" src="${goodsView.goodsImages[3].imgUrl}">
						    	<input type="file" name="img" id="input3" style="display: none;" dest="uploadFiles/uploadImgs/goodsImage/" onchange="ajaxFileUpload(this)">
						    	<input type="text" name="goodsImages[3].imgUrl" id="url3" value="${goodsView.goodsImages[3].imgUrl}" style="display:none;">
						    	<input type="hidden" name="goodsImages[3].id" value="${goodsView.goodsImages[3].id}">
						    	<img id="delete3" width="20" height="20" onclick="deleteUpload(this)" src="static/web/images/X.png" style="z-index: 10;position: relative;right: 20px;bottom: 100px">
					    	</div>
					    	<div  style="float: left; margin-top: 20px;">
						    	<img id="img4" style="width: 350px;height: 200px;z-index: 0;position: relative;" onclick="inputClick(this)" src="${goodsView.goodsImages[4].imgUrl}">
						    	<input type="file" name="img" id="input4" style="display: none;" dest="uploadFiles/uploadImgs/goodsImage/" onchange="ajaxFileUpload(this)">
						    	<input type="text" name="goodsImages[4].imgUrl" id="url4" value="${goodsView.goodsImages[4].imgUrl}" style="display:none;">
						    	<input type="hidden" name="goodsImages[4].id" value="${goodsView.goodsImages[4].id}">
						    	<img id="delete4" width="20" height="20" onclick="deleteUpload(this)" src="static/web/images/X.png" style="z-index: 10;position: relative;right: 20px;bottom: 100px">
					    	</div>
					    	
						</div>
					</div>
				</div>
				
				<div class="control-group">
					<div class="controls">
						<div class="span12">
							<label class="control-label" for="name" style="width: 400px; margin-left: -150px;">图片1</label>
							<label class="control-label" for="name" style="width: 400px; margin-left: 30px;">图片2</label>
						</div>
					</div>
				</div>
				
				<div class="control-group">
					<div class="controls">
						<div class="span12" style="margin-top: -30px;margin-left: 50px;">
							<label class="control-label" for="name" style="width: 400px; margin-left: -70px;font-size: 13px;">
							(建议上传比例大约为1440:670，长宽比1.5至2.5之间即可)</label>
							<label class="control-label" for="name" style="width: 400px; margin-left: 30px;font-size: 13px;">
							(建议上传比例大约为330:190，长宽比1.5至2.5之间即可)</label>
						</div>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="name"><span class="red f12">* </span>详情图片:</label>
					<div class="controls">
						<div class="span12">
							<div style="float: left;">
					    	<!-- 详情图片 -->
					    	<img id="imgDetail" style="width: 460px;height: 650px;z-index: 0;position: relative;" onclick="inputClick(this)" src="${goodsView.detailImage }" >
					    	<input type="file" name="img" id="inputDetail" style="display: none;" dest="uploadFiles/uploadImgs/DetailImages/" onchange="ajaxFileUpload(this)">
					    	<input type="text" name="detailImage" id="urlDetail"  style="display:none;">
					    	<img id="deleteDetail" width="20" height="20" onclick="deleteUpload(this)" src="static/web/images/X.png" style="z-index: 10;position: relative;right: 20px;bottom: 325px">
					    	</div>
						</div>
					</div>
				</div>
				<div class="control-group">
					<label id="summaryLabel" class="control-label" for="email"><span class="red f12">* </span>概述:</label>
					<div class="controls">
						<span class="span12">
							<!-- <script id="editor" type="text/plain" name="summary">${point.summary}</script> -->
							<textarea style="width:800px;height:90px;" form="goodsForm" name="summary" notNull="请填写商品描述">${goodsView.summary}</textarea>
						</span>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="name"><span class="red f12">* </span>原价:</label>
					<div class="controls">
						<div class="span12">
							<input type="text" id="originalPrice" name="originalPrice" value="${goodsView.originalPrice }" notNull="请填写原价" style="width: 200px;"/>桃子
						</div>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="name"><span class="red f12">* </span>现价:</label>
					<div class="controls">
						<div class="span12">
							<input type="text" id="currentPrice" name="currentPrice" value="${goodsView.currentPrice }" notNull="请填写原价" style="width: 200px;"/>桃子
						</div>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="name"><span class="red f12">* </span>库存:</label>
					<div class="controls">
						<div class="span12">
							<input type="text" id="allNumber" name="allNumber" value="${goodsView.allNumber }" notNull="请填写库存" style="width: 200px;"/>件
						</div>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="name"><span class="red f12">* </span>剩余:</label>
					<div class="controls">
						<div class="span12">
							<input type="text" id="residueNumber" name="residueNumber" value="${goodsView.residueNumber }" notNull="请填写剩余" style="width: 200px;"/>件
						</div>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="phone"><span class="red f12">* </span>商品类型:</label>
					<div class="controls">
						<div class="span3 input-prepend">
							<select id="goodsTypes" name="goodsType.id">
	    					</select>
						</div>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="phone"><span class="red f12">* </span>热度:</label>
					<div class="controls">
						<div class="span3 input-prepend">
							<select id="hotLevels" name="hotLevel.id">
	    					</select>
						</div>
					</div>
				</div>
				<div class="hr hr-dotted"></div>
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
var calendar;
var cityList = '${cityList}';//城市列表
var subjectList = '${subjectList}';//主题列表
var containList = '${containList}';//价格包含列表

var tpl = $("#tpl").html();
//预编译模板
var template = Handlebars.compile(tpl);

$(document).ready(function() {
	
	$('#otherInfoTab a:eq(0)').tab('show');
	$('#otherInfoTab a').click(function(e) {
		e.preventDefault();//阻止a链接的跳转行为
		$(this).tab('show');//显示当前选中的链接及关联的content
	});
	
	initGoodsTypes();//初始化商品类型
	initHotLevels();//初始化热度下拉列表
});

function initGoodsTypes(){
	
	var goodsTypes =${goodsTypes};
	
	for(var i in goodsTypes){
		$("#goodsTypes").append("<option value="+goodsTypes[i].id+">"+goodsTypes[i].goods_type+"</option>");
	}
	
		$("#goodsTypes").val("${goodsView.goodsType.id }");
	
}

function initHotLevels(){
	var hotLevels = ${hotLevels};
	for(var i in hotLevels){
		$("#hotLevels").append("<option value="+hotLevels[i].id+">"+hotLevels[i].level+"</option>");
	}
	
	
	$("#hotLevels").val("${goodsView.hotLevel.id}");
}
//删除图片
function deleteUpload(obj) {
	var id = $(obj).attr("id");
	var number = id.substring(6, id.length);
	$("#url" + number).val("");
	$("#img" + number).attr({
		src : "uploadFiles/uploadImgs/zanwutupian.jpg"
	});
}



//点击图片时
function inputClick(obj) {
	var id = $(obj).attr("id");
	var input = "input" + id.substring(3, id.length);
	$("#" + input).click();
}

//文件上传
function ajaxFileUpload(obj) {
	
	//获取欲上传的文件路径  
	var file = $(obj).val();
	var fileId = $(obj).attr("id");
	$.ajaxFileUpload({
		url : 'admin/integralShop/imgUpload', //需要链接到服务器地址
		secureuri : false,
		fileElementId : fileId, //文件选择框的id属性
		data:{"destination":$(obj).attr("dest")},
		dataType : 'JSON', //服务器返回的格式，可以是json
		success : function(data) { //相当于java中try语句块的用法
			data = data.replace(/<[^>].*?>/g, "");//对返回的数据进行转换
			var json = eval("(" + data + ")");//对返回的数据进行转换
			var number = fileId.substring(5, fileId.length);
			$("#url" + number).val(json.imgUrl);
			$("#img" + number).attr({
				src : json.imgUrl
			});
			if(json.status == 'size_error'){
				valTips("img"+number,"图片大小不符合尺寸，建议更换");
			}
		}
	});
}

//保存
function save(){
	var flag=true;
	$("#goodsForm [notNull]").each(function(){
		if(this.value==""||this.value==null){
			valTips($(this),$(this).attr("notNull"));
			flag=false;
		}
	});
	if(flag){
		var formObj = serializeObject($("#goodsForm"));
		$.post('admin/integralShop/goods_manage/updateGoods', formObj , function(res) {
			if (res.status == 'success') {
				bootbox.alert("提交成功", function() {
					back();
				});
			} else {
				bootbox.alert("提交失败，请重试");
			}
		}, "JSON");
	}
	
}

//返回
function back(){
	location.href = "admin/integralShop/goods_manage/main";
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



function scroll(id){
	$("html,body").animate({scrollTop:$("#"+id).offset().top},200);
}
	
</script>
</html>
