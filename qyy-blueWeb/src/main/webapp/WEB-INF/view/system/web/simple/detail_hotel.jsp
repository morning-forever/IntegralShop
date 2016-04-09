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
			<li class="active">酒店管理</li>
		</ul><!--.breadcrumb-->
	</div><!--#breadcrumbs-->
	<div class="row-fluid">
		<!-- <h3 class="header smaller lighter blue">会员管理</h3> -->
		<div class="table-header">
			编辑酒店信息
		</div>
		<div id="div_content" class="row-fluid" style="padding-top: 10px;">
			<form class="form-horizontal" id="validation-form" method="post" >
				<input value="${obj.id }" type="hidden" id="id" name="id"/>
				<div class="control-group">
					<label class="control-label" for="name">酒店名称:</label>
					<div class="controls">
						<div class="span12">
							<input value="${obj.names }" class="span4" type="text" id="names" name="names" placeholder="请输入酒店名称" />
						</div>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="email">所在地:</label>
					<div class="controls">
						<span class="span12">
							<select id="province" style="width: 110px;">
								<option value="">---请选择---</option>
							</select>
							<select id="city" style="width: 110px;">
								<option value="">---请选择---</option>
							</select>
							<select id="county" name="addrId"  style="width: 110px;">
								<option value="">---请选择---</option>
							</select>
						</span>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="phone">具体地址:</label>
					<div class="controls">
						<div class="span12">
							<input value="${obj.addrDetail }" class="span4" type="text" id="addrDetail" name="addrDetail" placeholder="请输入具体地址" />
						</div>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="loginName">酒店星级:</label>
					<div class="controls">
						<div class="span12">
							<select id="starId" name="starId" style="width: 110px;">
								<option value="">---请选择---</option>
								<c:forEach items="${allStar }" var="star">
									<option value="${star.id }" <c:if test="${star.id == obj.starId }">selected=selected</c:if>>${star.starDetail }</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="loginName">酒店价格:</label>
					<div class="controls">
						<div class="span12">
							<input value="${obj.prices }" type="text" name="prices" id="prices" class="span1" placeholder="请输入酒店价格" /> 元/间
						</div>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="loginName">酒店介绍:</label>
					<div class="controls">
						<div class="span12">
							<textarea class="span4" name="summary" id="summary" style="width: 600px; height: 200px;">${obj.summary }</textarea>
						</div>
					</div>
				</div>
				
				<div class="hr hr-dotted"></div>
				
				<div class="control-group">
					<label class="control-label" for="loginName">酒店图片:</label>
					<div class="controls">
						<div class="span12">
							<div style="float: left;">
						    	<img id="img0" style="width: 160px;height: 100px;z-index: 0;position: relative;" onclick="openClick(this)" src="uploadFiles/uploadImgs/zanwutupian.jpg">
						    	<input type="file" name="img" id="input0" style="display: none;" onchange="ajaxFileUpload(this)">
						    	<input type="text" name="url0" id="url0" style="display:none;">
						    	<img id="delete0" width="20" height="20" onclick="deleteUpload(this)" src="uploadFiles/uploadImgs/X.png" style="z-index: 10;position: relative;right: 18px;bottom: 48px;">
					    	</div>
					    	<div style="float: left;">
						    	<img id="img1" style="width: 160px;height: 100px;z-index: 0;position: relative;" onclick="openClick(this)" src="uploadFiles/uploadImgs/zanwutupian.jpg">
						    	<input type="file" name="img" id="input1" style="display: none;" onchange="ajaxFileUpload(this)">
						    	<input type="text" name="url1" id="url1" style="display:none;">
						    	<img id="delete1" width="20" height="20" onclick="deleteUpload(this)" src="uploadFiles/uploadImgs/X.png" style="z-index: 10;position: relative;right: 18px;bottom: 48px;">
					    	</div>
					    	<div style="float: left;">
						    	<img id="img2" style="width: 160px;height: 100px;z-index: 0;position: relative;" onclick="openClick(this)" src="uploadFiles/uploadImgs/zanwutupian.jpg">
						    	<input type="file" name="img" id="input2" style="display: none;" onchange="ajaxFileUpload(this)">
						    	<input type="text" name="url2" id="url2" style="display:none;">
						    	<img id="delete2" width="20" height="20" onclick="deleteUpload(this)" src="uploadFiles/uploadImgs/X.png" style="z-index: 10;position: relative;right: 18px;bottom: 48px;">
					    	</div>
						</div>
					</div>
				</div>
				
				<div class="hr hr-dotted"></div>
				
				<div class="control-group" style="text-align: center;">
					<button id="back-btn" type="button" class="btn btn-default">返回</button>
					<button id="save-btn" type="button" class="btn btn-primary">保存</button>
				</div>
				
		  	</form>
		</div>
	</div>
</div>
<!-- #main-content -->
<%@ include file="/static/foot.jsp" %>
</body>
<script type="text/javascript" src="static/js/ajaxfileupload.js"></script>
<script type="text/javascript">
//防止重复提交
var isSave = 1;

$(document).ready(function(){
	initAllCitys();
	initSelects();
	var imgList = '${obj.picList}';
	console.info(imgList);
	if(imgList != '[]'){
		var imgArr = imgList.replace("[", "").replace("]", "").split(",");
		for(var i in imgArr){
			$("#img"+i).attr("src",imgArr[i]);
			$("#url"+i).val(imgArr[i]);
		}
	}
	//保存
	$("#save-btn").click(function(){
		if(isSave==0)
			return;
		if($("#names").val()==""){
			valTips("names", "酒店名称不能为空！");
			return ;
		}
		
		if($("#county").val()==""){
			valTips("county", "请选择酒店所在地区！");
			return ;
		}
		if($("#addrDetail").val()==""){
			valTips("addrDetail", "酒店详细地址不能为空！");
			return ;
		}
		if($("#starId").val()==""){
			valTips("starId", "请选择酒店的星级！");
			return ;
		}
		if($("#prices").val()==""){
			valTips("prices", "酒店房间的价格不能为空！");
			return ;
		}
		if($("#summary").val()==""){
			valTips("summary", "酒店的介绍不能为空！");
			return ;
		}
		
		if($("#url0").val()==""){
			valTips("img0", "酒店的图片1不能为空！");
			return ;
		}
		if($("#url1").val()==""){
			valTips("img1", "酒店的图片2不能为空！");
			return ;
		}
		if($("#url2").val()==""){
			valTips("img2", "酒店的图片3不能为空！");
			return ;
		}
		isSave = 0;
		$.post("admin/simplehotelmngr/save",$("#validation-form").serialize(),function(req){
			if(req.status =='success'){
				bootbox.alert("保存成功！",function(){
					window.location.href="admin/simplehotelmngr/main";
				});
			}else{
				bootbox.alert("保存失败，请检查输入！");			
			}
			isSave = 1;
		},"JSON");
	});
	//返回单击事件
	$("#back-btn").click(function(){
		window.location.href="admin/simplehotelmngr/main";
	});
	
});

var initSelects = function(){
	//initProvinceList();
	changeProvince();
	changeCity();
};

//根据一个区域id获取所有的关联地址
var initAllCitys = function(){
	$.post('admin/webcitymngr/initAddrList',{'addrId':'${obj.addrId}'},function(res){
		if(res.status=='success'){
			
			var province = $("#province");
			province.empty();
			province.append("<option value=''>---请选择---</option>");
			var provinceList = res.provinceList;
			for(var i in provinceList){
				var item = provinceList[i];
				
				if(item.isSelect == 1)
					province.append("<option value='"+item.id+"' selected=selected>"+item.name+"</option>");
				else
					province.append("<option value='"+item.id+"'>"+item.name+"</option>");
			}
			
			var city = $("#city");
			city.empty();
			city.append("<option value=''>---请选择---</option>");
			var cityList = res.cityList;
			for(var i in cityList){
				var item = cityList[i];
				if(item.isSelect == 1)
					city.append("<option value='"+item.id+"' selected=selected>"+item.name+"</option>");
				else
					city.append("<option value='"+item.id+"'>"+item.name+"</option>");
			}
			
			var county = $("#county");
			county.empty();
			county.append("<option value=''>---请选择---</option>");
			var countyList = res.countyList;
			for(var i in countyList){
				var item = countyList[i];
				if(item.isSelect == 1)
					county.append("<option value='"+item.id+"' selected=selected>"+item.name+"</option>");
				else 
					county.append("<option value='"+item.id+"'>"+item.name+"</option>");
			}
		}else{
			initProvinceList();
		}
	},"JSON");
	
};


//初始化省
var initProvinceList =function(){
	var province = $("#province");
	$.post('admin/webcitymngr/provinceList',null,function(res){
		if(res.status=='success'){
			province.empty();
			province.append("<option value=''>---请选择---</option>");
			var list = res.list;
			for(var i in list){
				var item = list[i];
				province.append("<option value='"+item.id+"'>"+item.province+"</option>");
			}
		}
	},"JSON");
};

//获取市
var changeProvince = function(){
	$("#province").change(function(){
		var provinceId = this.value;
		var city = $("#city");
		city.empty();
		city.append("<option value=''>---请选择---</option>");
		var county = $("#county");
		county.empty();
		county.append("<option value=''>---请选择---</option>");
		$.post('admin/webcitymngr/cityList',{'provinceId':provinceId},function(res){
			if(res.status=='success'){
				var list = res.list;
				for(var i in list){
					var item = list[i];
					city.append("<option value='"+item.id+"'>"+item.city+"</option>");
				}
			}
		},"JSON");
	});
};
//获取区域
var changeCity = function(){
	$("#city").change(function(){
		var cityId = this.value;
		var county = $("#county");
		county.empty();
		county.append("<option value=''>---请选择---</option>");
		$.post('admin/webcitymngr/countyList',{'cityId':cityId},function(res){
			if(res.status=='success'){
				var list = res.data;
				for(var i in list){
					var item = list[i];
					county.append("<option value='"+item.id+"'>"+item.county+"</option>");
				}
			}
		},"JSON");
	});
};

//打开上传界面
var openClick = function(obj){
	var imgId =$(obj).attr("id");
	var inx =imgId.substring(3,imgId.length);
	$("#input"+inx).click();
	
};

//删除一张图片
var deleteUpload = function(obj){
	
	
};

//上传操作
var ajaxFileUpload = function(obj) {
	//获取欲上传的文件路径  
	var file = $(obj).val();
	var fileId=$(obj).attr("id");
	$.ajaxFileUpload({
		url : 'allowAccess/upload', //需要链接到服务器地址
		secureuri : false,
		fileElementId : fileId, //文件选择框的id属性
		data : {'type':'hotel',"inputName":$(obj).attr("name")},
		dataType : 'JSON', //服务器返回的格式，可以是json
		success : function(data) { //相当于java中try语句块的用法
			data = data.replace(/<[^>].*?>/g, "");//对返回的数据进行转换
			var json = eval("(" + data + ")");//对返回的数据进行转换
			var number=fileId.substring(5,fileId.length);
			console.info(number+"  "+fileId+" "+json.src);
			$("#url"+number).val(json.src);
			$("#img"+number).attr({src:json.src});
		}
	});
};

</script>
</html>
