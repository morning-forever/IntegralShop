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
			<li class="active">主题深度游管理</li>
		</ul><!--.breadcrumb-->
	</div><!--#breadcrumbs-->
	<div class="row-fluid">
		<div class="table-header">新增/编辑主题深度游</div>
		<div id="div_content" class="row-fluid" style="padding-top: 10px;">
			<form id="myForm" class="form-horizontal" method="post" >
				<input type="hidden" name="pointId" value="${point.id }">
				<input type="hidden" id="summary" name="summary"/>
				<div class="control-group">
					<label class="control-label" for="name"><span class="red f12">* </span>精彩亮点名称:</label>
					<div class="controls">
						<div class="span12">
							<input type="text" id="pointName" name="pointName" value="${point.point_name }" notNull="请输入精彩亮点名称" style="width: 300px;" maxlength="120"/>
						</div>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="name"><span class="red f12">* </span>景点名称:</label>
					<div class="controls">
						<div class="span12">
							<input type="text" id="scenicName" name="scenicName" value="${point.scenic_name }" notNull="请输入景点名称" maxlength="120"/>
						</div>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="name"><span class="red f12">* </span>封面:</label>
					<div class="controls">
						<div class="span12">
							<div style="float: left;">
					    	<!-- 网页端图片 -->
					    	<img id="img1" style="width: 400px;height: 270px;z-index: 0;position: relative;" onclick="inputClick(this)" src="${point.picUrl }">
					    	<input type="file" name="img" id="input1" style="display: none;" onchange="ajaxFileUpload(this)">
					    	<input type="text" name="url" id="url1" value="${point.picUrl  }" style="display:none;">
					    	<img id="delete1" width="20" height="20" onclick="deleteUpload(this)" src="uploadFiles/uploadImgs/X.png" style="z-index: 10;position: relative;right: 17px;bottom: 134px">
					    	</div>
						</div>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="email"><span class="red f12">* </span>所在地:</label>
					<div class="controls">
						<span class="span12">
							<select id="province" notNull="请输入省">
	    					</select>省
	    					<select id="city" name="cityId" notNull="请输入市">
	    					</select>市
						</span>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="phone"><span class="red f12">* </span>具体地址:</label>
					<div class="controls">
						<div class="span3 input-prepend">
							<input type="text" id="addrDetail" name="addrDetail" value="${point.addr_detail }" notNull="请输入具体地址" style="width: 300px;" maxlength="120"/>
						</div>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="email" id="timeLbl"><span class="red f12">* </span>建议游览时长:</label>
					<div class="controls">
						<span class="span12" id="city">
							<select id="tourHour" name="tourHour">
	    					</select>小时
	    					<select id="tourMinute" name="tourMinute">
	    						<option value="0">0</option>
	    						<option value="15">15</option>
	    						<option value="30">30</option>
	    						<option value="45">45</option>
	    					</select>分钟
						</span>
					</div>
				</div>
				
				<div class="control-group">
					<label id="summaryLabel" class="control-label" for="email"><span class="red f12">* </span>概述:</label>
					<div class="controls">
						<span class="span12" id="city">
							<script id="editor" type="text/plain" name="summary">${point.summary}</script>
						</span>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="phone"><span class="red f12">* </span>小贴士</label>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="phone"><span class="red f12">* </span>注意事项:</label>
					<div class="controls">
						<div class="span12">
							1、<input type="text" id="attention1" name="attention1" value="${point.attention_1 }" notNull="请输入注意事项" style="width: 800px;" maxlength="120"/><br>
							2、<input type="text" name="attention2" value="${point.attention_2 }" style="width: 800px;" maxlength="120"/><br>
							3、<input type="text" name="attention3" value="${point.attention_3 }" style="width: 800px;" maxlength="120"/>
						</div>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="phone"><span class="red f12">* </span>交通情况:</label>
					<div class="controls">
						<div class="span12">
							<input type="text" name="traffic" value="${point.traffic }" style="width: 800px;" notNull="请输入交通情况" maxlength="120"/><br>
						</div>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="phone"><span class="red f12">* </span>特色推荐:</label>
					<div class="controls">
						<div class="span12">
							<input type="text" name="feature" value="${point.feature }" notNull="请输入特色推荐" style="width: 800px;" maxlength="120"/><br>
						</div>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="phone"><span class="red f12">* </span>其它:</label>
					<div class="controls">
						<div class="span12">
							1、<input type="text" name="other1" value="${point.other_1 }" notNull="请输入其它" style="width: 800px;" maxlength="120"/><br>
							2、<input type="text" name="other2" value="${point.other_2 }" style="width: 800px;" maxlength="120"/><br>
							3、<input type="text" name="other3" value="${point.other_3 }" style="width: 800px;" maxlength="120"/>
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
<script type="text/javascript">
var ue;
$(document).ready(function() {
	
	$('#otherInfoTab a:eq(0)').tab('show');
	$('#otherInfoTab a').click(function(e) {
		e.preventDefault();//阻止a链接的跳转行为
		$(this).tab('show');//显示当前选中的链接及关联的content
	});
	
	initTour();//初始化游览时长
	
	initProvinceList($("#province"));
	changeProvince($("#province"),$("#city"));
	
	ue = UE.getEditor('editor', {
		
		toolbars : [ [ "bold", "italic", "underline", "|", "fontfamily", "diyh3", "blockquote", "insertunorderedlist", "insertorderedlist", "|", "insertimage", "|", "removeformat" ] ],
		initialFrameWidth:820,
		initialFrameHeight:250,
		autoHeightEnabled:false
	});
	
});

//初始化游览时长
function initTour(){
	var tour_hour = "${point.tour_hour}";
	$("#tourHour").empty();
	//小时
	for(var i = 0; i <= 6; i++){
		if(tour_hour == i){
			$("#tourHour").append('<option selected="selected" value="'+i+'">'+i+'</option>');
		}else{
			$("#tourHour").append('<option value="'+i+'">'+i+'</option>');
		}
	}
	$("#tourMinute").val("${point.tour_minute}");//分钟
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
		url : 'merchSystem/info/imgFileUpload', //需要链接到服务器地址
		secureuri : false,
		fileElementId : fileId, //文件选择框的id属性
		dataType : 'JSON', //服务器返回的格式，可以是json
		success : function(data) { //相当于java中try语句块的用法
			data = data.replace(/<[^>].*?>/g, "");//对返回的数据进行转换
			var json = eval("(" + data + ")");//对返回的数据进行转换
			var number = fileId.substring(5, fileId.length);
			$("#url" + number).val(json.imgUrl);
			$("#img" + number).attr({
				src : json.imgUrl
			});
		}
	});
}

//保存
function save(){
	$("#summary").val(ue.getContent());//概述的内容
	var flag = true;
	$("#myForm [notNull]").each(function(){
		if(this.value == ""){
			valTips($(this), $(this).attr("notNull"));
			flag = false;
		}
	});
	//概述
	if($("#summary").val() == ""){
		valTips('summaryLabel', $(this).attr("notNull"));
		flag = false;
	}
	//封面
	if($("#url1").val() == "" || $("#url1").val().indexOf("zanwutupian") > -1){
		valTips('img1','请上传图片');
		flag = false;
	}
	if($("#tourHour").val() == 0 && $("#tourMinute").val() == 0){
		valTips('timeLbl','请选择时长');
		flag = false;
	}
	if(flag){
		$.post('admin/depth/point/savePoint',$("#myForm").serialize(),function(res){
			if (res.status == 'success') {
				bootbox.alert("提交成功", function() {
					back();
				});
			} else {
				bootbox.alert("提交失败，请重试");
			}
		});
	}
}

//返回
function back(){
	location.href = "admin/depth/point/main";
}

var lprovinceId = "${point.provinceId}";
var lcityId = "${point.cityId}";
	
//初始化省
function initProvinceList(proObj) {
	$.post('admin/webcitymngr/provinceList', null, function(res) {
		if (res.status == 'success') {
			proObj.empty();
			proObj.append("<option value=''>---请选择---</option>");
			var list = res.list;
			for ( var i in list) {
				var item = list[i];
				if(lprovinceId == item.id){
					proObj.append("<option selected='selected' value='"+item.id+"'>"
							+ item.province + "</option>");
				}else{
					proObj.append("<option value='"+item.id+"'>"
							+ item.province + "</option>");
				}
			}
			proObj.change();
		}
	}, "JSON");
};

//获取市
function changeProvince(proObj, cityObj) {
	proObj.change(function() {
		var provinceId = this.value;
		cityObj.empty();
		cityObj.append("<option value=''>---请选择---</option>");
		$.ajax({
			url : 'admin/webcitymngr/cityList',
			post : "post",
			async : false,
			data : {
				'provinceId' : provinceId
			},
			success : function(res) {
				if (res.status == 'success') {
					var list = res.list;
					for ( var i in list) {
						var item = list[i];
						if(lcityId == item.id){
							cityObj.append("<option selected='selected' value='"+item.id+"'>"
									+ item.city + "</option>");
						}else{
							cityObj.append("<option value='"+item.id+"'>"
									+ item.city + "</option>");
						}
					}
					lcityId = 0;
				}
			}
		});
	});
};

</script>
</html>
