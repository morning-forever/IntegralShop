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
			<li class="active">主题深度游管理</li>
		</ul><!--.breadcrumb-->
	</div><!--#breadcrumbs-->
	<div class="row-fluid">
		<div class="table-header">新增/编辑主题深度游</div>
		<div id="div_content" class="row-fluid" style="padding-top: 10px;">
			<form id="depthForm" class="form-horizontal" method="post" >
				<input type="hidden" name="depthId" value="${depth.id }">
				<input type="hidden" name="label" value=""> 
				<div class="control-group">
					<label class="control-label" for="name"><span class="red f12">* </span>主题名称:</label>
					<div class="controls">
						<div class="span12">
							<input type="text" id="depthName" name="depthName" value="${depth.name }" style="width: 300px;"/>
						</div>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="name"><span class="red f12">* </span>封面:</label>
					<div class="controls">
						<div class="span12">
							<div style="float: left;">
					    	<!-- 网页端图片 -->
					    	<img id="img1" style="width: 400px;height: 200px;z-index: 0;position: relative;" onclick="inputClick(this)" src="${depth.webCoverUrl }">
					    	<input type="file" name="img" id="input1" style="display: none;" onchange="ajaxFileUpload(this)">
					    	<input type="text" name="url" id="url1" value="${depth.webCoverUrl }" style="display:none;">
					    	<input type="text" name="picType" value="webCover" style="display:none;">
					    	<img id="delete1" width="20" height="20" onclick="deleteUpload(this)" src="uploadFiles/uploadImgs/X.png" style="z-index: 10;position: relative;right: 20px;bottom: 100px">
					    	</div>
					    	<!-- 手机端图片 -->
					    	<div  style="float: left;">
					    	<img id="img2" style="width: 400px;height: 200px;z-index: 0;position: relative;" onclick="inputClick(this)" src="${depth.appCoverUrl }">
					    	<input type="file" name="img" id="input2" style="display: none;" onchange="ajaxFileUpload(this)">
					    	<input type="text" name="url" id="url2" value="${depth.appCoverUrl }" style="display:none;">
					    	<input type="text" name="picType" value="appCover" style="display:none;">
					    	<img id="delete2" width="20" height="20" onclick="deleteUpload(this)" src="uploadFiles/uploadImgs/X.png" style="z-index: 10;position: relative;right: 20px;bottom: 100px">
					    	</div>
						</div>
					</div>
				</div>
				
				<div class="control-group">
					<div class="controls">
						<div class="span12">
							<label class="control-label" for="name" style="width: 400px; margin-left: -150px;">网页端图片</label>
							<label class="control-label" for="name" style="width: 400px; margin-left: 30px;">手机端图片</label>
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
					<label class="control-label" id="cityLabel" for="email"><span class="red f12">* </span>所在地:</label>
					<div class="controls">
						<span class="span12" id="city">
						</span>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="phone"><span class="red f12">* </span>行程天数:</label>
					<div class="controls">
						<div class="span3 input-prepend">
							<select id="day" name="days">
	    					</select>
						</div>
	    				<c:if test="${depth.id != null }">
	    				<span class="red f12">(若改变行程天数，需重新维护详细行程) </span>
	    				</c:if>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="loginName"><span class="red f12">* </span>价格:</label>
					<div class="controls">
						<div class="span12">
							成人 <input value="${depth.adult_price }" type="text" name="adultPrice" id="adultPrice"/> 元/人<br>
							儿童 <input value="${depth.child_price }" type="text" name="childPrice" id="childPrice"/> 元/人
							<input type="button" class="btn btn-info" value="保存" onclick="saveThreePrice()">
							<span class="red f12">(点击保存可保存三个月内的价格)</span>
						</div>
					</div>
				</div>
				
				<div class="control-group">
					<div class="controls">
						<div class="span12">
							<div class="innerdiv pricequery pb10">
								<div id='calendar' style="margin: 0px"></div>
								<div class="clearfix pl20 pr20">
									<span class="fr f12 red">*价格为双人出行的每人基础均价，若您选择升级产品。实际价格与此价格会存在差价("缺"-此日期缺少商品，"惠"-此日期为优惠商品)</span>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="control-group">
					<label id="containLabel" class="control-label" for="loginName"><span class="red f12">* </span>价格包含:</label>
					<div class="controls">
						<div class="span12">
							<ul class="nav nav-tabs" id="otherInfoTab">
								<li class="active"><a href="#tab_1">交通</a></li>
								<li><a href="#tab_2">酒店</a></li>
								<li><a href="#tab_3">观光</a></li>
							</ul>
							<div class="tab-content">
								<div id="trafficDiv" style="display: none;">
									<input type="text" name="fromAddr">→<input type="text" name="toAddr">
									<i class="icon-plus" style="cursor: pointer;" onclick="addRow(this)"></i>
									<i class="icon-minus" style="cursor: pointer;" onclick="removeRow(this)"></i>
								</div>
								<div id="hotelDiv" style="display: none;">
									Day <input type="text" name="checkDay"style="width: 50px;"> 天，酒店名称 <input type="text" name="checkHotel" style="width: 300px;">
									<i class="icon-plus" style="cursor: pointer;" onclick="addRow(this)"></i>
									<i class="icon-minus" style="cursor: pointer;" onclick="removeRow(this)"></i>
								</div>
								<div id="visitDiv" style="display: none;">
									<input type="text" name="visit" style="width: 300px;">，备注<input type="text" name="remark" style="width: 250px;">
									<i class="icon-plus" style="cursor: pointer;" onclick="addRow(this)"></i>
									<i class="icon-minus" style="cursor: pointer;" onclick="removeRow(this)"></i>
								</div>
								
								<div class="tab-pane active" id="tab_1">
								</div>
								<div class="tab-pane" id="tab_2">
								</div>
								<div class="tab-pane" id="tab_3">
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="loginName"><span class="red f12">* </span>详细行程:</label>
					<div class="controls">
						<div class="span12">
							<c:choose>
								<c:when test="${depth.id == null }">
									<span class="red f12">请维护深度游后，再维护详细详细行程 </span>
								</c:when>
								<c:otherwise>
									<a title="维护详细行程" onclick="" href="javascript:toTrip();" target="mainFrame"
									class="btn btn-mini btn-info"><i class="icon-pencil"></i> 维护详细行程</a>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="loginName"><span class="red f12">* </span>精彩亮点:</label>
					<div class="controls">
						<div class="span12">
							<table id="table_report" class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th>序号</th>
									<th>亮点名称</th>
									<th>景点名称</th>
									<th>城市</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody></tbody>
							</table>
							<c:choose>
								<c:when test="${depth.id == null }">
									<span class="red f12">请维护深度游后，再维护精彩亮点 </span>
								</c:when>
								<c:otherwise>
									<a title="维护精彩亮点" onclick=""
									href="javascript:openModel('new');" target="mainFrame"
									class="btn btn-mini btn-info"><i class="icon-pencil"></i> 维护精彩亮点</a>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="loginName"><span class="red f12">* </span>标签:</label>
					<div class="controls">
						<div class="span12">
							<input type="text" id="depthLabel"> <a title="添加" onclick="addLabel()"
									href="javascript:;" target="mainFrame"
									class="btn btn-mini btn-info"><i class="icon-plus"></i> 添加</a>
						</div>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="loginName"></label>
					<div class="controls">
						<div id="labelModel" style="display: none; float: left; margin-right: 2%">
							<input class="btn btn-info" type="button" name="depthLabel" value="红色风光"> 
							<i class="icon-trash" onclick="removeLabel(this)" style="cursor: pointer;"></i>
						</div>  
						<div id="labelDiv" class="span12">
							
						</div>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="isBan"><span class="red f12">* </span>推荐指数:</label>
					<div class="controls">
						<span class="span12">
							<select id="expon" name="expon">
	    					</select>
						</span>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="isBan"><span class="red f12">* </span>方位:</label>
					<div class="controls">
						<span class="span12">
							<select name="azimuthId" style="width: 150px">
								<c:forEach items="${azimuthList }" var="azimuth">
									<c:choose>
										<c:when test="${azimuth.id == depth.azimuth_id }">
											<option selected="selected" value="${azimuth.id }">${azimuth.azimuth }</option>
										</c:when>
										<c:otherwise>
											<option value="${azimuth.id }">${azimuth.azimuth }</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
						</span>
					</div>
				</div>
				
				<div class="control-group">
					<label id="subjectLabel" class="control-label" for="isBan"><span class="red f12">* </span>主题:</label>
					<div class="controls">
						<span class="span12" id="subject">
						</span>
					</div>
				</div>
				<div class="hr hr-dotted"></div>
		  	</form>
		</div>
		
		<!-- Modal 精彩亮点-->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true"
			style="display: none;">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div>
							<form id="pointform">
								<input type="hidden" id="brandId" name="brandId" />
								<table class="mytable-detail">
									<tr>
										<th>精彩亮点名称：</th>
										<td><input type="text" class="form-control"
											maxlength="20" id="pointName" name="brandName"
											placeholder="请输入精彩亮点名称" style="width: 150px;"></td>
										<th>景点名称：</th>
										<td><input type="text" class="form-control"
											maxlength="20" id="scenicName" name="brandName"
											placeholder="请输入景点名称" style="width: 100px;"></td>
										<th>城市：</th>
										<td>
											<select id="ecity" style="width: 100px;">
											</select>
										</td>
										<td><a title="查询" onclick="" class="btn btn-mini btn-light"
											id="searchBtn"><i class="icon-search"></i>查询</a></td>
									</tr>
								</table>
								<table id="model_table" class="table table-striped table-bordered table-hover">
									<thead>
									<tr>
										<th>序号</th>
										<th>亮点名称</th>
										<th>景点名称</th>
										<th>城市</th>
									</tr>
									</thead>
									<tbody></tbody>
								</table>
							</form>
						</div>
					</div>
				</div>
				<div style="padding: 10px 350px;">
					<button type="button" class="btn btn-primary" id="save-btn"
						onclick="savePointCt();">保存</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
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
	
	initDay();//初始化行程天数
	initExpon();//初始化推荐指数
	initCity();//初始化所在地
	initSubject();//初始化主题
	initDatePrice();//初始化日期价格
	initContain();//初始化价格包含
	
	var depthId = "${depth.id}";
	 
	if(depthId != ""){
		initLabel();//初始化标签
		initPointList();//初始化亮点列表
		
		//若是编辑页面，则改变行程天数时，提醒用户慎重
		$("#day").change(function(){
			valTips("day","改变天数，则需要重新维护详细行程，请慎重选择");
		});
	}else{
		$("#table_report").hide();
	}
	
	
	
});

//初始化行程天数
function initDay(){
	var day = "${depth.days}";
	$("#day").empty();
	for(var i = 1; i <= 15; i++){
		if(day == i){
			$("#day").append('<option selected="selected" value="'+i+'">'+i+'</option>');
		}else{
			$("#day").append('<option value="'+i+'">'+i+'</option>');
		}
	}
}

//初始化推荐指数
function initExpon(){
	var expon = "${depth.expon}";
	$("#expon").empty();
	for(var i = 1; i <= 5; i++){
		if(expon == i){
			$("#expon").append('<option selected="selected" value="'+i+'">'+i+'</option>');
		}else{
			$("#expon").append('<option value="'+i+'">'+i+'</option>');
		}
	}
}

//初始化所在地列表
function initCity(){
	var addrIds = "${depth.addrIds}";//该深度游所在的城市
	//所有城市
	if(cityList != ''){
		cityList = eval('('+cityList+')');
	}else{
		cityList = [];
	}
	$("#city").empty();//所在地
	$("#ecity").empty();//弹出框的城市下拉框
	$("#ecity").append('<option value="">--请选择--</option>');
	for(var i in cityList){
		if(addrIds.indexOf(','+cityList[i].id+',') > -1){
			$("#city").append('<input type="checkbox" checked="checked" name="city" val="'+cityList[i].id+'"/><span class="lbl"></span>'+cityList[i].city);
		}else{
			$("#city").append('<input type="checkbox" name="city" val="'+cityList[i].id+'"/><span class="lbl"></span>'+cityList[i].city);
		}
		$("#ecity").append('<option value="'+cityList[i].id+'">'+cityList[i].city+'</option>');
	}
	
}

//初始化主题列表
function initSubject(){
	var subjectIds = "${depth.subjectIds}";//该深度游所包含的主题
	//所有城市
	if(subjectList != ''){
		subjectList = eval('('+subjectList+')');
	}else{
		subjectList = [];
	}
	$("#subject").empty();
	for(var i in subjectList){
		if(subjectIds.indexOf(','+subjectList[i].id+',') > -1){
			$("#subject").append('<input type="checkbox" checked="checked" name="subject" val="'+subjectList[i].id+'"/><span class="lbl"></span>'+subjectList[i].subject);
		}else{
			$("#subject").append('<input type="checkbox" name="subject" val="'+subjectList[i].id+'"/><span class="lbl"></span>'+subjectList[i].subject);
		}
	}
}

//初始化价格包含
function initContain(){
	if(containList != ''){
		containList = eval('('+containList+')');
	}else{
		containList = [];
	}
	//containList = [];
	for(var i in containList){
		//交通
		if(containList[i].contain_type == 'traffic'){
			var traffic = $("#trafficDiv").clone().removeAttr("id");
			traffic.find("[name=fromAddr]").val(containList[i].from_addr);//出发地
			traffic.find("[name=toAddr]").val(containList[i].to_addr);//到达地
			traffic.find("i").hide();
			traffic.show();
			$("#tab_1").append(traffic);
		}
		else if(containList[i].contain_type == 'hotel'){
			var hotel = $("#hotelDiv").clone().removeAttr("id");
			hotel.find("[name=checkDay]").val(containList[i].check_day);//出发地
			hotel.find("[name=checkHotel]").val(containList[i].check_hotel);//到达地
			hotel.find("i").hide();
			hotel.show();
			$("#tab_2").append(hotel);
		}
		else if(containList[i].contain_type == 'visit'){
			var visit = $("#visitDiv").clone().removeAttr("id");
			visit.find("[name=visit]").val(containList[i].visit);//出发地
			visit.find("[name=remark]").val(containList[i].remark);//到达地
			visit.find("i").hide();
			visit.show();
			$("#tab_3").append(visit);
		}
	}
	$("#tab_1").find("div:last i").show();
	$("#tab_2").find("div:last i").show();
	$("#tab_3").find("div:last i").show();
	//如果没有数据，则默认新增一行
	if($("#tab_1 div").length == 0){
		var traffic = $("#trafficDiv").clone().removeAttr("id");
		traffic.show();
		$("#tab_1").append(traffic);
	}
	if($("#tab_2 div").length == 0){
		var hotel = $("#hotelDiv").clone().removeAttr("id");
		hotel.show();
		$("#tab_2").append(hotel);
	}
	if($("#tab_3 div").length == 0){
		var visit = $("#visitDiv").clone().removeAttr("id");
		visit.show();
		$("#tab_3").append(visit);
	}
	//如果只有一行，则隐藏删除行按钮，因为至少有一行
	if($("#tab_1 div").length == 1){
		$("#tab_1 .icon-minus").hide();
	}
	if($("#tab_2 div").length == 1){
		$("#tab_2 .icon-minus").hide();
	}
	if($("#tab_3 div").length == 1){
		$("#tab_3 .icon-minus").hide();
	}
	
}

//初始化标签
function initLabel(){
	var label = "${depth.label}";
	if(label != null && label != ""){
		var lableArr = label.split(",");
		for(var i in lableArr){
			addLabel(lableArr[i]);
		}
	}
}

//添加标签
function addLabel(value){
	//不传值时，取输入的文本框的值
	if(value == undefined){
		value = $("#depthLabel").val();
	}
	var model = $("#labelModel").clone().removeAttr("id");
	model.find("input").val(value);
	model.show();
	$("#labelDiv").append(model);
	//给input框设置值保存
	var labels = "";
	$("#labelDiv input").each(function(){
		labels += $(this).val()+",";
	});
	$("[name=label]").val(labels.substr(0,labels.length-1));
}

//删除标签
function removeLabel(obj){
	$(obj).parent("div").remove();
	//给input框设置值保存
	var labels = "";
	$("#labelDiv input").each(function(){
		labels += $(this).val()+",";
	});
	$("[name=label]").val(labels.substr(0,labels.length-1));
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
		url : 'admin/depth/imgFileUpload', //需要链接到服务器地址
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
			if(json.status == 'size_error'){
				valTips("img"+number,"图片大小不符合尺寸，建议更换");
			}
		}
	});
}

//新增一行
function addRow(obj){
	var model = $(obj).parent("div").clone();
	model.find("input").val("");
	model.find("i.icon-minus").show();//显示减号
	$(obj).parent("div").find("i").hide();
	$(obj).parent("div").parent("div").append(model);
}

//删除一行
function removeRow(obj){
	$(obj).parent("div").prev("div").find("i").show();
	//删到最后一行时，减号隐藏
	if($(obj).parent("div").parent("div").find("div").length == 2){
		$(obj).parent("div").prev("div").find("i.icon-minus").hide();	
	}
	$(obj).parent("div").remove();
}

//初始化某深度游的亮点列表
function initPointList(){
	$('#table_report').DataTable( {
		"bDestroy": true,
        "ajax": {
        	url:"admin/depth/point/list",
        	data: { depthId : "${depth.id}"},
        	type: "POST"
        },
		"columns": [
            { "data": null },//序号
            { "data": "point_name" },//亮点名称
            { "data": "scenic_name" },//景点名称
            { "data": "city" },//城市
            { "data": null }//操作
        ],
        "columnDefs": [
			{
				"targets": 0,
				render: function (a, b, c, d) {
	                return d.row+1;
				}
			},
			{
				"targets" : 4,
				render : function(a, b, c, d) {
					var context = {
						func : [ {"name" : "删除","fn" : "deletePointCt(\'" + c.pointCtId + "'\)","type" : "danger","icon" : "trash"} ]
					};
					return template(context);
				}
			}
   		]
    });
}

//初始化所有亮点列表
function initModelPointList(){
	$('#model_table').DataTable( {
		"bDestroy": true,
        "ajax": {
        	url:"admin/depth/point/list",
        	type: "POST"
        },
		"columns": [
            { "data": null },//序号
            { "data": "point_name" },//亮点名称
            { "data": "scenic_name" },//景点名称
            { "data": "city" },//城市
        ],
        "columnDefs": [
			{
				"targets": 0,
				render : function(data, type, row, meta) {
					var str = "<label><input type='checkbox'  flag='row' value='"+row.id+"' /><span class='lbl'></span></label>&nbsp;";
					return str + (meta.row + 1);
				}
			}
   		]
    });
}

//打开亮点编辑对话框
function openModel(){
	//初始化弹出框，显示所有的亮点
	initModelPointList();
	$("#myModal").modal("show");
	//查询
	var table = $("#model_table").DataTable();
	$("#searchBtn").click(function() {
		var json = '{"pointName" : "'+$("#pointName").val()
			+'","scenicName" : "'+$("#scenicName").val()
			+'","cityId" : "'+$("#ecity").val()+'"}';
		table.search(json).draw();
	});
}

//保存亮点
function savePointCt(){
	var pointIds = "";
	$("input[flag=row]").each(function() {
		if (this.checked) {
			pointIds += this.value + ",";
		}
	});
	if(pointIds == ""){
		bootbox.alert("请选择亮点");
		return ;
	}else{
		pointIds = pointIds.substr(0,pointIds.length-1);
	}
	$.post('admin/depth/point/savePointCt',{'depthId':"${depth.id}",'pointIds':pointIds},function(res){
		if(res.status == 'success'){
			bootbox.alert("提交成功", function() {
				$("#myModal").modal("hide");
				$('#table_report').DataTable().clear();
				$('#table_report').DataTable().draw();
			});
		}else if(res.status == 'exists'){
			bootbox.alert("您选中的亮点已存在，请重新选择");
		}else{
			bootbox.alert("保存失败");
		}
	});
}

//删除深度游对应的订单
function deletePointCt(pointCtId){
	bootbox.confirm("确定要删除吗?", function(result) {
		if (result) {
			$.ajax({
				url : "admin/depth/point/deletePointCt",
				post : "post",
				data : {
					"pointCtId" : pointCtId
				},
				success : function(data) {
					if (data.status == "success") {
						bootbox.alert("删除成功！");
						$('#table_report').DataTable().clear();
						$('#table_report').DataTable().draw();
					} else {
						bootbox.alert("服务器异常！");
					}
				}
			});
		}
	});
}


//初始化包车价格
var eventArr = [];

function initDatePrice(){
	$.post("admin/depth/pricesList",{'depthId':"${depth.id}"},function(res){
		if(res.status == 'success'){
			var list = res.pricesList;
			for(var i = 0; i < list.length; i++){
				var eventItem = {};
				eventItem.start = new Date().setTime(list[i].price_time);//价格时间
				eventItem.val1 = list[i].adult_price;//成人价
				eventItem.val2 = list[i].child_price;//儿童价
				var title = "";
				if(list[i].is_odds == 1){
					title = "惠";
				}
				eventItem.title = title;//标题（显示优惠状态）
				eventItem.isOdds = list[i].is_odds;//优惠状态
				var date1 = new Date(list[i].price_time*1000) ;
				var date2 = new Date();
				if(date1.format("yyyy-MM-dd") >= date2.format("yyyy-MM-dd")){
					eventItem.className = "label-success";//设置样式
				}
				eventArr[i] = eventItem;
			}
			initCalendar();
		}
	});
}

//保存三个月的价格
function saveThreePrice(){
	var adultPrice = $("#adultPrice").val();//成人价
	var childPrice = $("#childPrice").val();//儿童价
	var flag = true;
	if(isNaN(adultPrice)){
		valTips($("#adultPrice"),"请输入数字");
		flag = false;
	}
	if(isNaN(childPrice)){
		valTips($("#childPrice"),"请输入数字");
		flag = false;
	}
	if(flag){
		var date = new Date();
		date.setTime(date.getTime()-date.getTime()%(24*60*60*1000)-8*60*60*1000);
		var currentDate = new Date();
		var o=[];
		for(var i=0;i<93;i++){
			if((date.getMonth()-currentDate.getMonth())<3){
				var itemDate = new Date();
				itemDate.setTime(date.getTime());
				o[i]={	
						title: "",//优惠状态
						start: itemDate,
						allDay: true,
						className: 'label-success',
						val1 : adultPrice,
						val2 : childPrice,
						isOdds : 0
				};
				$('#calendar').fullCalendar('removeEvents' , function(ev){
					return (ev._start.getTime()==itemDate.getTime());
				});
				$('#calendar').fullCalendar('renderEvent',o[i],true);
				date.setTime(date.getTime()+24*60*60*1000);
			}
		} 
	}
}

//保存
function save(){
	var flag = true;
	var formObj = serializeObject($("#depthForm"));
	//所在地
	var cityIds = "";
	$("[name=city]:checked").each(function(){
		cityIds += $(this).attr("val") + ",";
	});
	//主题
	var subjectIds = "";
	$("[name=subject]:checked").each(function(){
		subjectIds += $(this).attr("val") + ",";
	});
	//验证不为空
	if($("#depthName").val() == ""){
		valTips('depthName','请输入主题名称');
		flag = false;
	}
	if($("#url1").val() == "" || $("#url1").val().indexOf("zanwutupian") > -1){
		valTips('img1','请上传网页端图片');
		scroll('img1');
		flag = false;
	}
	if($("#url2").val() == "" || $("#url2").val().indexOf("zanwutupian") > -1){
		valTips('img2','请上传手机端图片');
		scroll('img2');
		flag = false;
	}
	if(cityIds == ""){
		valTips('cityLabel','请选择所在地');
		scroll('cityLabel');
		flag = false;
	}
	if($("#adultPrice").val() == "" || isNaN($("#adultPrice").val())){
		valTips('adultPrice','请输入正确的数字');
		scroll('adultPrice');
		flag = false;
	}
	if($("#childPrice").val() == "" || isNaN($("#childPrice").val())){
		valTips('childPrice','请输入正确的数字');
		scroll('childPrice');
		flag = false;
	}
	if(subjectIds == ""){
		valTips('subjectLabel','请选择主题');
		flag = false;
	}
	if($("[name=label]").val() == ""){
		valTips('depthLabel','请添加标签');
		flag = false;
	}
	//价格包含
	for(var i = 1; i <= 3; i++){
		var tip = "";
		if(i == 1){
			tip = "请输入交通";
		}else if(i == 2){
			tip = "请输入酒店";
		}else if(i == 3){
			tip = "请输入观光";
		}
		$("#tab_"+i+" input[type=text]").each(function(){
			if(this.value == ""){
				valTips('containLabel',tip);
				flag = false;
			}
		});
	}
	if(flag){
		var date = $('#calendar').fullCalendar("clientEvents");
		var adultPrices = "";
		var childPrices = "";
		var priceTimes = "";
		var isOdds = "";
		for(var i=0; i<date.length; i++){
			if(i!=0){
				adultPrices += ",";
				childPrices += ",";
				priceTimes += ",";
				isOdds += ",";
			}
			adultPrices += date[i].val1;//成人价
			childPrices += date[i].val2;//儿童价
			isOdds += date[i].isOdds;//是否优惠（1-是，0-否）
			priceTimes += date[i]._start.getTime();
		}
		
		//价格包含
		//交通
		var trafficData = '{"data":[';
		var trafficArr = $("#tab_1 div");
		for(var m = 0; m < trafficArr.length; m++){
			var fromAddr = $(trafficArr[m]).find("[name=fromAddr]").val();
			var toAddr = $(trafficArr[m]).find("[name=toAddr]").val();
			trafficData += '{"fromAddr":"'+fromAddr+'","toAddr":"'+toAddr+'"},';
		}
		trafficData = trafficData.substr(0,trafficData.length-1);
		trafficData += ']}';
		//酒店
		var hotelData = '{"data":[';
		var hotelArr = $("#tab_2 div");
		for(var n = 0; n < hotelArr.length; n++){
			var checkDay = $(hotelArr[n]).find("[name=checkDay]").val();
			var checkHotel = $(hotelArr[n]).find("[name=checkHotel]").val();
			hotelData += '{"checkDay":"'+checkDay+'","checkHotel":"'+checkHotel+'"},';
		}
		hotelData = hotelData.substr(0,hotelData.length-1);
		hotelData += ']}';
		//观光
		var visitData = '{"data":[';
		var visitArr = $("#tab_3 div");
		for(var k = 0; k < visitArr.length; k++){
			var visit = $(visitArr[k]).find("[name=visit]").val();
			var remark = $(visitArr[k]).find("[name=remark]").val();
			visitData += '{"visit":"'+visit+'","remark":"'+remark+'"},';
		}
		visitData = visitData.substr(0,visitData.length-1);
		visitData += ']}';
		
		formObj.adultPrices = adultPrices;//成人价
		formObj.childPrices = childPrices;//儿童价
		formObj.priceTimes = priceTimes;//价格时间
		formObj.isOdds = isOdds;//价格是否优惠
		formObj.cityIds = cityIds.substr(0,cityIds.length-1);//所在地
		formObj.subjectIds = subjectIds.substr(0,subjectIds.length-1);//主题
		formObj.trafficData = trafficData;//价格包含-交通
		formObj.hotelData = hotelData;//价格包含-酒店
		formObj.visitData = visitData;//价格包含-观光
		
		$.post('admin/depth/saveDepth', formObj , function(res) {
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

//跳转至行程页面
function toTrip(){
	var json = {
		'depthId' : "${depth.id}", 
		'day' : $("#day").val() 
	};
	subWebForm('admin/depth/trip',json);
}

//返回
function back(){
	location.href = "admin/depth/main";
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

//初始化日历
function initCalendar(){
	var date = new Date();
	var d = date.getDate();
	var m = date.getMonth();
	var y = date.getFullYear();
	
	calendar = $('#calendar').fullCalendar({
		height:400,
		events:eventArr,
		header: {
			left: 'prev',
			center: 'title',
			right: 'next'
		},
		monthNames : ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'],
		dayNamesShort : ['周日', '周一', '周二', '周三', '周四', '周五', '周六'],
		buttonText:{
			prev: '上月', // ‹
			next: '下月', // ›
			prevYear: '«', // «
			nextYear: '»', // »
			today: '今天',
			month: '月',
			week: '周',
			day: '日'
			},
		editable: true,
		/* droppable: true, // this allows things to be dropped onto the calendar !!!
		drop: function(date, allDay) { // this function is called when something is dropped
		
			// retrieve the dropped element's stored Event Object
			var originalEventObject = $(this).data('eventObject');
			var $extraEventClass = $(this).attr('data-class');
			
			
			// we need to copy it, so that multiple events don't have a reference to the same object
			var copiedEventObject = $.extend({}, originalEventObject);
			
			// assign it the date that was reported
			copiedEventObject.start = date;
			copiedEventObject.allDay = allDay;
			if($extraEventClass) copiedEventObject['className'] = [$extraEventClass];
			
			// render the event on the calendar
			// the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
			$('#calendar').fullCalendar('renderEvent', copiedEventObject, true);
			
			// is the "remove after drop" checkbox checked?
			if ($('#drop-remove').is(':checked')) {
				// if so, remove the element from the "Draggable Events" list
				$(this).remove();
			}
			
		}, */
		dayClick: function(date, allDay, jsEvent, view) {
			//只能设置今天之后的日期价格
			if(date.format("yyyy-MM-dd") >= new Date().format("yyyy-MM-dd")){
				var form = $("<form class='form-inline'><label>设置价格</label></form>");
				form.append("<br>日期："+date.format("yyyy-MM-dd"));
				form.append("<br>成人：<input autocomplete=off type=text name='val1' value='' />元/人");
				form.append("<br>儿童：<input autocomplete=off type=text name='val2' value='' />元/人 ");
				form.append("<br><input type='checkbox' name='isOdds' /><span class='lbl'></span>&nbsp;特惠 ");
				form.append("<button type='submit' class='btn btn-small btn-success'><i class='icon-ok'></i> 保存</button>");
				var div = bootbox.dialog(form,
					[{
						"label" : "<i class='icon-remove'></i> 关闭",
						"class" : "btn-small"
					}],
					{
						// prompts need a few extra options
						"onEscape": function(){div.modal("hide");}
					}
				);
				//保存
				form.on('submit', function(){
					var flag = true;
					var val1 = form.find("[name=val1]").val();
					var val2 = form.find("[name=val2]").val();
					var title = "";//标题显示优惠状态
					var isOdds = 0;
					if(isNaN(val1)){
						valTips($("[name=val1]"),"请输入数字");
						flag = false;
					}
					if(isNaN(val2)){
						valTips($("[name=val2]"),"请输入数字");
						flag = false;
					}
					if(form.find("[name=isOdds]")[0].checked){
						title = "惠";//优惠
						isOdds = 1;
					}
					if(flag){
						//判断当天是否价格，如果，则删除
						//该方法为遍历，查询所事件事件，如果相同，则删除
						calendar.fullCalendar('removeEvents' , function(ev){
							return (ev._start.getTime()==date.getTime());
						});
						var obj = {
								title: title,//优惠状态
								start: date,
								allDay: allDay,
								className: 'label-success',
								val1 : val1,
								val2 : val2,
								isOdds : isOdds
							};
						calendar.fullCalendar('renderEvent',obj,true);
						div.modal("hide");
					}
					return false;
				});
			}
		},
		eventRender: function(event, element) {
			var _html = "<span>成人¥</span>"+event.val1+"<br/><span>儿童¥"+event.val2+"</span>";
			element.append( _html );
	    },
		eventClick: function(calEvent, jsEvent, view) {
			//只能修改今天之后的日期价格
			if(calEvent.start.format("yyyy-MM-dd") >= new Date().format("yyyy-MM-dd")){
				
				var form = $("<form class='form-inline'><label>修改价格</label></form>");
				form.append("<br>日期："+date.format("yyyy-MM-dd"));
				form.append("<br>成人：<input autocomplete=off type=text name='val1' value='" + calEvent.val1 + "' />元/人");
				form.append("<br>儿童：<input autocomplete=off type=text name='val2' value='" + calEvent.val2 + "' />元/人 ");
				if(calEvent.isOdds == 1){
					form.append("<br><input type='checkbox' checked='checked' name='isOdds' /><span class='lbl'></span>&nbsp;特惠 ");
				}else{
					form.append("<br><input type='checkbox' name='isOdds' /><span class='lbl'></span>&nbsp;特惠 ");
				}
				form.append("<button type='submit' class='btn btn-small btn-success'><i class='icon-ok'></i> 保存</button>");
				var div = bootbox.dialog(form,
					[
					{
						"label" : "<i class='icon-trash'></i> 删除价格",
						"class" : "btn-small btn-danger",
						"callback": function() {
							calendar.fullCalendar('removeEvents' , function(ev){
								return (ev._id == calEvent._id);
							})
						}
					}
					,
					{
						"label" : "<i class='icon-remove'></i> 关闭",
						"class" : "btn-small"
					}
					]
					,
					{
						// prompts need a few extra options
						"onEscape": function(){div.modal("hide");}
					}
				);
				
				form.on('submit', function(){
					calEvent.val1 = form.find("input[name=val1]").val();
					calEvent.val2 = form.find("input[name=val2]").val();
					if(form.find("[name=isOdds]")[0].checked){
						calEvent.isOdds = 1;
						calEvent.title = "惠";
					}else{
						calEvent.isOdds = 0;
					}
					var flag = true;
					if(isNaN(calEvent.val1)){
						valTips($("[name=val1]"),"请输入数字");
						flag = false;
					}if(isNaN(calEvent.val2)){
						valTips($("[name=val2]"),"请输入数字");
						flag = false;
					}
					if(flag){
						calendar.fullCalendar('updateEvent', calEvent);
						div.modal("hide");
					}
					return false;
				});
				
			}
			
		}
		
	});
}

Date.prototype.format = function(format) {
	var date = {
	       "M+": this.getMonth() + 1,
	       "d+": this.getDate(),
	       "h+": this.getHours(),
	       "m+": this.getMinutes(),
	       "s+": this.getSeconds(),
	       "q+": Math.floor((this.getMonth() + 3) / 3),
	       "S+": this.getMilliseconds()
	};
	if (/(y+)/i.test(format)) {
	       format = format.replace(RegExp.$1, (this.getFullYear() + '').substr(4 - RegExp.$1.length));
	}
	for (var k in date) {
	       if (new RegExp("(" + k + ")").test(format)) {
	              format = format.replace(RegExp.$1, RegExp.$1.length == 1
	                     ? date[k] : ("00" + date[k]).substr(("" + date[k]).length));
	       }
	}
	return format;
}

function scroll(id){
	$("html,body").animate({scrollTop:$("#"+id).offset().top},200)
}
	
</script>
</html>
