<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="${system.basePath }">
<%@ include file="/static/inc.jsp" %>
<link rel="stylesheet" href="static/web/css/common.css" />
<link rel="stylesheet" href="static/web/css/inner.style.css" />
<link rel="stylesheet" href="static/web/css/personal.center.css" />
<link rel="stylesheet" href="static/web/css/member.css"/>
<style type="text/css">
input[type="button"]{
width: 70px;
}
.icon-pencil, .icon-trash, .icon-plus, .icon-minus{
cursor: pointer;
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
		<div class="table-header">新增/编辑 主题深度游详细行程</div>
		<div id="div_content" class="row-fluid" style="padding-top: 10px;">
			<form id="myForm" class="form-horizontal" method="post" >
				<div class="control-group">
					<label class="control-label" for="name"><span class="red f12">* </span>行程图片:</label>
					<div class="controls">
						<div class="span12">
							<div style="float: left;margin-top: 200px;">
					    	<!-- 网页端图片 -->
					    	<img id="img1" style="width: 400px;height: 200px;z-index: 0;position: relative;" onclick="inputClick(this)" src="${webTrip.picUrl }">
					    	<input type="file" name="img" id="input1" style="display: none;" onchange="ajaxFileUpload(this)">
					    	<input type="text" name="url" id="url1" value="${webTrip.picUrl }" style="display:none;">
<!-- 					    	<img id="delete1" width="20" height="20" onclick="deleteUpload(this)" src="uploadFiles/uploadImgs/X.png" style="z-index: 10;position: relative;right: 15px;bottom: 8px;">
 -->					    	</div>
					    	<!-- 图片2 -->
					    	<div  style="float: left;margin-left: 30px;">
					    	<img id="img2" style="width: 200px;height: 400px;z-index: 0;position: relative;" onclick="inputClick(this)" src="${appTrip.picUrl }">
					    	<input type="file" name="img" id="input2" style="display: none;" onchange="ajaxFileUpload(this)">
					    	<input type="text" name="url" id="url2" value="${appTrip.picUrl }" style="display:none;">
<!-- 					    	<img id="delete2" width="20" height="20" onclick="deleteUpload(this)" src="uploadFiles/uploadImgs/X.png" style="z-index: 10;position: relative;right: 15px;bottom: 8px;">
 -->					    	</div>
						</div>
					</div>
				</div>
				
				<div class="control-group">
					<div class="controls">
						<div class="span12">
							<label class="control-label" for="name" style="width: 400px; margin-left: -150px;">网页端图片</label>
							<label class="control-label" for="name" style="width: 200px; margin-left: 120px;">手机端图片</label>
						</div>
					</div>
				</div>
				
				<div id="tripModel" style="display: none;">
				<div class="control-group">
					<div class="controls">
						<input class="btn btn-info" type="button" name="dayType" value="启程">
						<input type="hidden" name="tripId" value=""> 
					    <div class="list_edit">
						  <div class="editing clearfix">
							<span class="fold i-person fl"></span>
							<div class="edit_menu fl" style="display:none;">
							  <span id="addAddr" class="addword"><i class="i-person"></i>添加行程</span>
							  <span id="addTraffic" class="addword"><i class="i-person"></i>添加交通</span>
							  <span id="addImg" class="addimg"><i class="i-person"></i>添加照片</span>
							</div>
						  </div>
					   </div>
					</div>
				</div>
				</div>
				
				<div id="tripDiv">
				</div>
				
				<div class="hr hr-dotted"></div>
		  	</form>
		</div>
		<div style="text-align: center;">
			<a title="保存" href="javascript:;" class="btn btn-mini btn-info" id="back-btn" onclick="save()" style="width: 100px;"><i class="icon-save"></i> 保存</a>
			<a title="返回" href="javascript:;" class="btn btn-mini btn-grey" id="back-btn" onclick="back()" style="width: 100px;"><i class="icon-reply"></i> 返回</a>
		</div>
		<div style="height: 50px;"></div>
	</div>
</div>
<!-- #main-content -->
<%@ include file="/static/foot.jsp" %>

<div id="addrModel" style="display: none;">
<div class="editTxt" name="addrDiv">
	<p class="ellips">
		行程：   <span></span>&nbsp;&nbsp;&nbsp;&nbsp;
		<i class="icon-pencil" onclick="editAddr(this)"></i>
		<i class="icon-trash"></i>
	</p>
	<div class="editText">
		行程 <span><input type="text" name="addr" style="width: 400px;"></span> <!-- <span>- <input type="text" name="addr"></span> -->
		<!-- <i class="icon-plus" onclick="addInput(this)"></i>
		<i class="icon-minus" onclick="removeInput(this)"></i> -->
		<div class="oBtn tc">
			<input type="button" class="btn btn-info" onclick="addrOk(this)" value="保存">
			<input type="button" class="btn btn-grey" onclick="addrCancel(this)" value="取消">
		</div>
	</div>
</div>
</div>

<div id="trafficModel" style="display: none;">
<div class="editTxt" name="trafficDiv">
	<p class="ellips">
		交通工具：   
		<input type="hidden" name="toolId">
		<input type="hidden" name="hidHour">
		<input type="hidden" name="hidMinute">
		<span></span>  乘坐时间    <span></span>&nbsp;&nbsp;&nbsp;&nbsp;
		<i class="icon-pencil" onclick="editTraffic(this)"></i>
		<i class="icon-trash"></i>
	</p>
	<div class="editText">
		交通工具 
		<select name="tool" style="width: 100px;">
		</select>
		乘坐时间
		<input type="text" name="hour">小时<input type="text" name="minute">分钟
		<div class="oBtn tc">
			<input type="button" class="btn btn-info" onclick="trafficOk(this)" value="保存">
			<input type="button" class="btn btn-grey" onclick="trafficCancel(this)" value="取消">
		</div>
	</div>
</div>
</div>

<div id="imgModel" style="display: none;">
	<div class="editTxt" name="imgDiv">
		<table class="ellips" style="width: 50%">
			<tr>
				<td rowspan="3" width="10%">图片类型</td>
				<td rowspan="3" width="50%"><img src="uploadFiles/uploadImgs/zanwutupian.jpg" style="width: 260px;height: 200px;"></td>
				<td width="40%">文字说明</td>
			</tr>
			<tr>
				<td>建议时长</td>
			</tr>
			<tr>
				<td>
					<i class="icon-pencil" onclick="editImg(this)"></i>
					<i class="icon-trash"></i>
					<input type="hidden" name="hidHour">
					<input type="hidden" name="hidMinute">
					<input type="hidden" name="imgType">
				</td>
			</tr>
		</table>
		<div class="editText">
			<table style="width: 50%">
				<tr>
					<td rowspan="3" width="10%">
						<select style="width: 100px;">
							<option value="hotel">酒店</option>
							<option value="cater">餐饮</option>
							<option value="scenic">景点</option>
						</select>
					</td>
					<td rowspan="3" width="50%">
						<img style="width: 260px;height: 200px;z-index: 0;position: relative;" onclick="inputClick(this)" src="uploadFiles/uploadImgs/zanwutupian.jpg">
						<input name="img" type="file" style="display: none;" onchange="ajaxFileUpload(this)">
						<input type="text" style="display:none;">
					</td>
					<td width="40%">文字说明<textarea name="remark" rows="4" cols="1"></textarea></td>
				</tr>
				<tr>
					<td>建议时长<input type="text" name="hour">小时<input type="text" name="minute">分钟</td>
				</tr>
			</table>
			<div class="oBtn tc">
				<input type="button" class="btn btn-info" onclick="imgOk(this)" value="保存">
				<input type="button" class="btn btn-grey" onclick="imgCancel(this)" value="取消">
			</div>
		</div>
	</div>
</div>

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
<script type="text/javascript">
$(document).ready(function() {
	
	initTrip();
	
});

//点击加号展开添加图标
$(document).on("click",".editing span.fold",function(){
	if($(this).hasClass("unfold")){
	   $(this).removeClass("unfold");
	   $(this).next(".edit_menu").css("display","none");
	}else{
	   $(this).addClass("unfold");	
	   $(this).next(".edit_menu").css("display","block");
	}
});

//删除
$(document).on("click",".editTxt i.icon-trash",function(){
	$(this).parents(".editTxt").remove();
});

//初始化交通工具列表
$(document).find("[name=tool]").empty();
$.post('admin/depth/toolList',null,function(res){
	if(res.status == 'success'){
		var list = res.toolList;
		for(var i in list){
			$(document).find("[name=tool]").append('<option value="'+list[i].id+'">'+list[i].name+'</option>');
		}
	}
});

//初始化行程
function initTrip(){
	$("#tripDiv").empty();
	$.post('admin/depth/tripList',{'depthId':'${depthId}'},function(res){
		if(res.status == 'success'){
			var list = res.tripList;
			for(var i in list){
				var tripModel = $("#tripModel").children().clone().removeAttr("id");
				tripModel.find("input[name=tripId]").val(list[i].id);//行程id
				
				//行程天数
				if(list[i].day_type == 'start'){
					tripModel.find("[name=dayType]").attr("value","启程");
				}else if(list[i].day_type == 'ing'){
					var day = parseInt(list[i].current_day)+1;
					tripModel.find("[name=dayType]").attr("value","第"+day+"天");
				}else if(list[i].day_type == 'end'){
					tripModel.find("[name=dayType]").attr("value","返程");
				}
				tripModel.show();
				
				//行程地址
				/* var addr = list[i].addrs;
				if(addr != null && addr != ""){
					var addrModel = $("#addrModel").children().clone();
					addrModel.find(".ellips span").addClass("contentValue");
					addrModel.find("p.ellips span.contentValue").html(addr);//显示文字
					addrModel.find(".ellips").show();
					addrModel.find(".editText").hide();
					addrModel.show();
					tripModel.find(".list_edit").append(addrModel);
				} */
				var addrList = list[i].addrList;
				for(var m in addrList){
					var addrModel = $("#addrModel").children().clone();
					addrModel.find(".ellips span").addClass("contentValue");
					addrModel.find("p.ellips span.contentValue").html(addrList[m].trip_addr);//行程
					
					addrModel.find(".ellips").show();
					addrModel.find(".editText").hide();
					addrModel.show();
					tripModel.find(".list_edit").append(addrModel);
				}
				
				
				//交通
				var trafficList = list[i].trafficList;
				for(var j in trafficList){
					var trafficModel = $("#trafficModel").children().clone();
					trafficModel.find(".ellips span").addClass("contentValue");
					trafficModel.find("p.ellips input[name=toolId]").val(trafficList[j].toolId);//交通工具id
					trafficModel.find("p.ellips input[name=hidHour]").val(trafficList[j].used_hour);//小时
					trafficModel.find("p.ellips input[name=hidMinute]").val(trafficList[j].used_minute);//分钟
					trafficModel.find("p.ellips span.contentValue:first").text(trafficList[j].toolName);//交通工具名称
					trafficModel.find("p.ellips span.contentValue:last").text( timeStr(trafficList[j].used_hour,trafficList[j].used_minute));//时长
					
					trafficModel.find("[name=hour]").ace_spinner({
						value : 0,
						min : 0,
						max : 20,
						step : 1,
						icon_up : 'icon-caret-up',
						icon_down : 'icon-caret-down'
					});

					trafficModel.find("[name=minute]").ace_spinner({
						value : 0,
						min : 0,
						max : 60,
						step : 1,
						icon_up : 'icon-caret-up',
						icon_down : 'icon-caret-down'
					});
					
					trafficModel.find(".ellips").show();
					trafficModel.find(".editText").hide();
					trafficModel.show();
					tripModel.find(".list_edit").append(trafficModel);
				}
				
				//图片
				var imgList = list[i].imgList;
				for(var k in imgList){
					var imgModel = $("#imgModel").children().clone();
					var typeDesc = "";
					if(imgList[k].pic_type == 'scenic'){
						typeDesc = "景点";
					}else if(imgList[k].pic_type == 'hotel'){
						typeDesc = "酒店";
					}else if(imgList[k].pic_type == 'cater'){
						typeDesc = "餐饮";
					}
					imgModel.find(".ellips tr:eq(0) td:eq(0)").text(typeDesc);//图片类型描述
					imgModel.find(".ellips tr:eq(0) td:eq(1)").find("img").attr("src",imgList[k].picUrl);//图片路径
					imgModel.find(".ellips tr:eq(0) td:eq(2)").text(imgList[k].remark);//文字说明
					imgModel.find(".ellips tr:eq(1) td:eq(0)").text("建议时长："+timeStr(imgList[k].used_hour, imgList[k].used_minute));//建议时长
					imgModel.find(".ellips input[name=hidHour]").val(imgList[k].used_hour);//小时
					imgModel.find(".ellips input[name=hidMinute]").val(imgList[k].used_minute);//分钟
					imgModel.find(".ellips input[name=imgType]").val(imgList[k].pic_type);//图片类型
					
					imgModel.find("[name=hour]").ace_spinner({
						value : 0,
						min : 0,
						max : 20,
						step : 1,
						icon_up : 'icon-caret-up',
						icon_down : 'icon-caret-down'
					});

					imgModel.find("[name=minute]").ace_spinner({
						value : 0,
						min : 0,
						max : 60,
						step : 1,
						icon_up : 'icon-caret-up',
						icon_down : 'icon-caret-down'
					});
					
					imgModel.find(".ellips").show();
					imgModel.find(".editText").hide();
					imgModel.show();
					tripModel.find(".list_edit").append(imgModel);
				}
				$("#tripDiv").append(tripModel);
			}
			//结尾
			var endModel = $("#tripModel").children().clone().removeAttr("id");
			endModel.find("input[type=button]").val("旅行结束");
			endModel.find("input[type=button]").attr("class","btn btn-grey");
			endModel.find(".list_edit").hide();
			$("#tripDiv").append(endModel);
		}
	});
}

//-----------------------行程 start-------------------------
//添加行程 弹出编辑框
$(document).on("click",".edit_menu #addAddr",function(){
   var model = $("#addrModel").children().clone();
   model.find(".ellips span").addClass("contentValue");
   model.find(".ellips span").attr("_type","word");
   /* if($(this).parents(".list_edit").find("[name=addrDiv]").length >= 1){
	   bootbox.alert("行程已存在，如需添加行程，请在编辑里继续添加");
   }else{ */
	   //$(this).parents(".list_edit").append(model);
	   //如果之前添加过交通和图片，在行程模块加在这之前
	   if($(this).parents(".list_edit").find("div[name=trafficDiv]").length >= 1){
			$(this).parents(".list_edit").find("div[name=trafficDiv]:first").before(model);
	   }else if($(this).parents(".list_edit").find("div[name=imgDiv]").length >= 1){
			$(this).parents(".list_edit").find("div[name=imgDiv]:first").before(model);
	   }else{
		   $(this).parents(".list_edit").append(model);
	   }
   //}
   $(this).parents(".editing").find("span.fold").click();
});

//添加行程  确定
function addrOk(obj){
	/* $(obj).parents(".editText").css("display","none");
    $(obj).parents(".editTxt").find('p.ellips').css("display","block");
	var addrs = "";
    $(obj).parents(".editText").find("input[name=addr]").each(function(){
    	if(this.value != ""){
	    	addrs += this.value + "-";
    	}
	});
    //若填写的内容不为空，则新增一行
    if(addrs.length < 1){
  	    $(obj).parents(".editTxt").remove();	
    }else{
	    addrs = addrs.substr(0,addrs.length-1);
		$(obj).parents(".editTxt").find("p.ellips span.contentValue").html(addrs);
    } */
    
    var addr = $(obj).parents(".editText").find("input[name=addr]").val();
    var flag = true;
    if(addr == ""){
    	valTips($(obj).parents(".editText").find("input[name=addr]"),"请输入行程");
    	flag = false;
    }
    if(flag){
    	$(obj).parents(".editTxt").find(".ellips span.contentValue").text(addr);
    	//隐藏文本区域，显示编辑区域
    	$(obj).parents(".editText").css("display","none");
        $(obj).parents(".editTxt").find('.ellips').css("display","block");
    }
}

//添加行程 取消
function addrCancel(obj){
	$(obj).parents(".editText").css("display","none");
    $(obj).parents(".editTxt").find('p.ellips').css("display","block");
	var oldAddr = $(obj).parents(".editTxt").find("p.ellips span.contentValue").text();
	if(oldAddr.length < 1){
	  $(obj).parents(".editTxt").remove();	
	}else{
	  $(obj).parents("editTxt").find("p.ellips  span.contentValue").html(oldAddr);
	}
}

//点击加号，新增一个行程输入框
/* function addInput(obj){
	$(obj).parents(".editText").find("span:last").after('<span> - <input type="text" name="addr"></span>');
	if($(obj).parents(".editText").find("span").length > 1){
		$(obj).parents(".editText").find("i.icon-minus").show();
	}
}

//点击减号，删除一个行程输入框
function removeInput(obj){
	$(obj).parents(".editText").find("span:last").remove();
	//如果只有一个文本框，则只有加号没有减号
	if($(obj).parents(".editText").find("span").length == 1){
		$(obj).parents(".editText").find("i.icon-minus").hide();
	}else{
		$(obj).parents(".editText").find("i.icon-minus").show();
	}
} */

//行程编辑
function editAddr(obj){
	/* $(obj).parent('p.ellips').css("display","none").next(".editText").css("display","block");
	var oldAddr = $(obj).parents(".editTxt").find("p.ellips span.contentValue").text();
	var addrArr = oldAddr.split("-");
	//先移除所有的input文本框
	$(obj).parent('p.ellips').css("display","none").next(".editText").find("span").remove();
	$(obj).parent('p.ellips').css("display","none").next(".editText").find("input[type=text]").remove();
	//然后依次添加文本框
	$(obj).parent('p.ellips').css("display","none").next(".editText").find("i.icon-plus").before('<input type="text" name="addr" value="'+addrArr[0]+'">');
	for(var i=1; i < addrArr.length; i++){
		$(obj).parent('p.ellips').css("display","none").next(".editText").find("input[type=text]:last").after('<span> - <input type="text" name="addr" value="'+addrArr[i]+'"></span>');
	} */
	
	$(obj).parent('p.ellips').css("display","none").next(".editText").css("display","block");
	var oldAddr = $(obj).parents(".editTxt").find("p.ellips span.contentValue").text();
	
	$(obj).parent('p.ellips').css("display","none").next(".editText").find("input[name=addr]").val(oldAddr);
}

//-----------------------行程 end-------------------------

//-----------------------交通 start-------------------------
//添加交通 弹出编辑框
$(document).on("click",".edit_menu #addTraffic",function(){
    var model = $("#trafficModel").children().clone();
    model.find(".ellips span").addClass("contentValue");
	//如果已经添加过交通，则再添加时，添加在最后一个交通的后面
    if($(this).parents(".list_edit").find("div[name=trafficDiv]").length >= 1){
		$(this).parents(".list_edit").find("div[name=trafficDiv]:last").after(model);
    }else{
    	//如果已经添加过图片，在再添加时，添加在第一个图片的前面
    	if($(this).parents(".list_edit").find("div[name=imgDiv]").length >= 1){
    		$(this).parents(".list_edit").find("div[name=imgDiv]:first").before(model);
    	}else{
    		$(this).parents(".list_edit").append(model);
    	}
    }
	$(this).parents(".editing").find("span.fold").click();
	
	model.find("[name=hour]").ace_spinner({
		value : 0,
		min : 0,
		max : 20,
		step : 1,
		icon_up : 'icon-caret-up',
		icon_down : 'icon-caret-down'
	});
	
	model.find("[name=minute]").ace_spinner({
		value : 0,
		min : 0,
		max : 60,
		step : 1,
		icon_up : 'icon-caret-up',
		icon_down : 'icon-caret-down'
	});
	
});

//添加交通  确定
function trafficOk(obj){
    var toolId = $(obj).parents(".editText").find("select").val();
    var toolName = $(obj).parents(".editText").find("select option:selected").text();
    var hour = $(obj).parents(".editText").find("[name=hour]").val();
    var minute = $(obj).parents(".editText").find("[name=minute]").val();
    
    var flag = true;
    if(isNaN(hour)){
    	valTips($($(obj).parents(".editText").find("[name=hour]")),"请输入数字");
    	flag = false;
    }
    if(isNaN(minute)){
    	valTips($($(obj).parents(".editText").find("[name=minute]")),"请输入数字");
    	flag = false;
    }
    if(hour == 0 && minute == 0){
    	valTips($($(obj).parents(".editText").find("[name=minute]")),"请输入时间");
    	flag = false;
    }
    if(flag){
    	//记录编辑内容
    	$(obj).parents(".editTxt").find("p.ellips input[name=toolId]").val(toolId);
    	$(obj).parents(".editTxt").find("p.ellips input[name=hidHour]").val(hour);
    	$(obj).parents(".editTxt").find("p.ellips input[name=hidMinute]").val(minute);
    	//显示文本内容
    	$(obj).parents(".editTxt").find("p.ellips span.contentValue:first").text(toolName);
    	$(obj).parents(".editTxt").find("p.ellips span.contentValue:last").text( timeStr(hour,minute));
    	//隐藏文本区域，显示编辑区域
    	$(obj).parents(".editText").css("display","none");
        $(obj).parents(".editTxt").find('p.ellips').css("display","block");
    }
}

//添加交通 取消
function trafficCancel(obj){
	$(obj).parents(".editText").css("display","none");
    $(obj).parents(".editTxt").find('p.ellips').css("display","block");
    
    var oldTool = $(obj).parents(".editTxt").find("p.ellips input[name=toolId]").val();
	//如果交通工具没选，则移除
	if(oldTool == ""){
	  $(obj).parents(".editTxt").remove();	
	}
}

//交通编辑
function editTraffic(obj){
	$(obj).parent('p.ellips').css("display","none").next(".editText").css("display","block");
	var oldTool = $(obj).parents(".editTxt").find("p.ellips input[name=toolId]").val();
	var oldHour = $(obj).parents(".editTxt").find("p.ellips input[name=hidHour]").val();
	var oldMinute = $(obj).parents(".editTxt").find("p.ellips input[name=hidMinute]").val();
	
	$(obj).parent('p.ellips').css("display","none").next(".editText").find("select").val(oldTool);
	$(obj).parent('p.ellips').css("display","none").next(".editText").find("input[name=hour]").val(oldHour);
	$(obj).parent('p.ellips').css("display","none").next(".editText").find("input[name=minute]").val(oldMinute);
	
}
//-----------------------交通 end-------------------------

//-----------------------图片 start-------------------------
//添加图片 弹出编辑框
$(document).on("click",".edit_menu #addImg",function(){
    var model = $("#imgModel").children().clone();
    model.find(".ellips").css("display","none");
	
  	//如果已经添加过图片，则再添加时，添加在最后一个图片的后面
    if($(this).parents(".list_edit").find("div[name=imgDiv]").length >= 1){
		$(this).parents(".list_edit").find("div[name=imgDiv]:last").after(model);
    }else{
    	$(this).parents(".list_edit").append(model);
    }
	$(this).parents(".editing").find("span.fold").click();
	
	model.find("[name=hour]").ace_spinner({
		value : 0,
		min : 0,
		max : 20,
		step : 1,
		icon_up : 'icon-caret-up',
		icon_down : 'icon-caret-down'
	});
	
	model.find("[name=minute]").ace_spinner({
		value : 0,
		min : 0,
		max : 60,
		step : 1,
		icon_up : 'icon-caret-up',
		icon_down : 'icon-caret-down'
	});
	
});

//添加图片  确定
function imgOk(obj){
    var imgType = $(obj).parents(".editText").find("select").val();//图片类型
    var imgTypeName = $(obj).parents(".editText").find("select option:selected").text();//图片类型名称
    var remark = $(obj).parents(".editText").find("[name=remark]").val();//文字说明
    var hour = $(obj).parents(".editText").find("[name=hour]").val();//小时
    var minute = $(obj).parents(".editText").find("[name=minute]").val();//分钟
    var url = $(obj).parents(".editText").find("img").attr("src");//图片路径
    var flag = true;
    if(isNaN(hour)){
    	valTips($($(obj).parents(".editText").find("[name=hour]")),"请输入数字");
    	flag = false;
    }
    if(isNaN(minute)){
    	valTips($($(obj).parents(".editText").find("[name=minute]")),"请输入数字");
    	flag = false;
    }
    if(hour == 0 && minute == 0){
    	valTips($($(obj).parents(".editText").find("[name=minute]")),"请输入时间");
    	flag = false;
    }
    if(url == "" || url.indexOf("zanwutupian") > -1){
    	valTips($($(obj).parents(".editText").find("img")),"请上传图片");
    	flag = false;
    }
    if(flag){
    	//记录编辑内容
    	$(obj).parents(".editTxt").find(".ellips input[name=imgType]").val(imgType);
    	$(obj).parents(".editTxt").find(".ellips input[name=hidHour]").val(hour);
    	$(obj).parents(".editTxt").find(".ellips input[name=hidMinute]").val(minute);
    	//显示文本内容
    	$(obj).parents(".editTxt").find(".ellips img").attr("src",url);//图片路径
    	$(obj).parents(".editTxt").find(".ellips tr:eq(0) td:eq(0)").text(imgTypeName);//图片类型
    	$(obj).parents(".editTxt").find(".ellips tr:eq(0) td:eq(2)").text(remark);//备注
    	$(obj).parents(".editTxt").find(".ellips tr:eq(1) td:eq(0)").text( timeStr(hour,minute));//建议时长
    	//隐藏文本区域，显示编辑区域
    	$(obj).parents(".editText").css("display","none");
        $(obj).parents(".editTxt").find('.ellips').css("display","block");
    }
}

//添加图片 取消
function imgCancel(obj){
	$(obj).parents(".editText").css("display","none");
    $(obj).parents(".editTxt").find('.ellips').css("display","block");
    
    var oldType = $(obj).parents(".editTxt").find(".ellips input[name=imgType]").val();
  	//如果交通工具没选，则移除
	if(oldType == ""){
	  $(obj).parents(".editTxt").remove();	
	}
}

//图片编辑
function editImg(obj){
	$(obj).parents('.ellips').css("display","none").next(".editText").css("display","block");
	var oldType = $(obj).parents(".editTxt").find(".ellips input[name=imgType]").val();
	var oldHour = $(obj).parents(".editTxt").find(".ellips input[name=hidHour]").val();
	var oldMinute = $(obj).parents(".editTxt").find(".ellips input[name=hidMinute]").val();
	var oldRemark = $(obj).parents(".editTxt").find(".ellips tr:eq(0) td:eq(2)").text();
	var oldUrl = $(obj).parents(".editTxt").find(".ellips tr:eq(0) td:eq(1) img").attr("src");
	
	$(obj).parents('.ellips').css("display","none").next(".editText").find("select").val(oldType);
	$(obj).parents('.ellips').css("display","none").next(".editText").find("input[name=hour]").val(oldHour);
	$(obj).parents('.ellips').css("display","none").next(".editText").find("input[name=minute]").val(oldMinute);
	$(obj).parents('.ellips').css("display","none").next(".editText").find("[name=remark]").val(oldRemark);
	$(obj).parents('.ellips').css("display","none").next(".editText").find("img").attr("src",oldUrl);
}
//-----------------------图片 end-------------------------

function inputClick(obj){
	$(obj).next("input").click();
}

var tempFileIdNumber = 1;
function ajaxFileUpload(obj) {
	//获取欲上传的文件路径  
	var obj=$(obj);
	var file = obj.val();
	var tempId="tempImgFileId"+tempFileIdNumber;
	tempFileIdNumber += 1;
	obj.attr("id",tempId);
	var input=obj.next("input[name=url]");
	var img=obj.prev("img");
	$.ajaxFileUpload({
		url : 'merchSystem/info/imgFileUpload', //需要链接到服务器地址
		secureuri : false,
		fileElementId : tempId, //文件选择框的id属性
		dataType : 'JSON', //服务器返回的格式，可以是json
		success : function(data) { //相当于java中try语句块的用法
			data = data.replace(/<[^>].*?>/g, "");//对返回的数据进行转换
			var json = eval("(" + data + ")");//对返回的数据进行转换
			input.val(json.imgUrl);
			img.attr({
				src:json.imgUrl
			});
			
		}
	});
}

//保存
function save(){
	var flag = true;
	if($("#tripDiv .editText:not(:hidden)").length > 0){
		bootbox.alert("请先保存所有的编辑框后再保存");
		flag = false;
	}
	if($("#url1").val() == "" || $("#url1").val().indexOf("zanwutupian") > -1){
		valTips('img1','请上传网页端行程图片');
		flag = false;
	}
	if($("#url2").val() == "" || $("#url2").val().indexOf("zanwutupian") > -1){
		valTips('img2','请上传手机端行程图片');
		flag = false;
	}
	if(flag){
		var json = {};
		json.depthId = "${depthId}";
		json.days = "${days}";
		json.webTripUrl = $("#url1").val();
		json.appTripUrl = $("#url2").val();
		
		var tripIds = "";
		var addrData = '{"data":[';//行程地址
		var trafficData = '{"data":[';//交通
		var imgData = '{"data":[';//图片
		//最后一个旅行结束的div不算
		var tripArr = $("#tripDiv .control-group");
		for(var i = 0; i < tripArr.length - 1; i++){
			var tripId = $(tripArr[i]).find("input[name=tripId]").val();//行程id
			tripIds += tripId+",";
			
			//行程地址
			/* var addrArr = $(tripArr[i]).find("div[name=addrDiv]").find("p.ellips span.contentValue").text().split("-");
			for(var j = 0; j < addrArr.length; j++){
				addrData += '{"tripId":'+tripId+',"tripAddr":"'+addrArr[j]+'","tripOrder":'+(j+1)+'}';
			} */
			var addrArr = $(tripArr[i]).find("div[name=addrDiv]");
			for(var j = 0; j < addrArr.length; j++){
				var addr = $(addrArr[j]).find(".ellips span.contentValue").text();
				addrData += '{"tripId":'+tripId+',"tripAddr":"'+addr+'","tripOrder":'+(j+1)+'}';
			}
			
			//交通
			var trafficArr = $(tripArr[i]).find("div[name=trafficDiv]");
			for(var k = 0; k < trafficArr.length; k++){
				var toolId = $(trafficArr[k]).find("[name=toolId]").val();
				var hour = $(trafficArr[k]).find("[name=hidHour]").val();
				var minute = $(trafficArr[k]).find("[name=hidMinute]").val();
				trafficData += '{"tripId":'+tripId+',"toolId":"'+toolId+'","usedHour":"'+hour+'","usedMinute":"'+minute+'","toolOrder":'+(k+1)+'}';
			}
			
			//图片
			var imgArr = $(tripArr[i]).find("div[name=imgDiv]");
			for(var m = 0; m < imgArr.length; m++){
				var imgType = $(imgArr[m]).find("[name=imgType]").val();
				var hour = $(imgArr[m]).find("[name=hidHour]").val();
				var minute = $(imgArr[m]).find("[name=hidMinute]").val();
				var remark = $(imgArr[m]).find(".ellips tr:eq(0) td:eq(2) ").text();
				var url = $(imgArr[m]).find(".ellips tr:eq(0) td:eq(1) img").attr("src");
				imgData += '{"tripId":'+tripId+',"imgType":"'+imgType+'","usedHour":"'+hour
					+'","usedMinute":"'+minute+'","remark":"'+remark
					+'","url":"'+url+'","imgOrder":'+(m+1)+'}';
			}
			
		}
		addrData += ']}';
		trafficData += ']}';
		imgData += ']}';
		
		json.addrData = addrData;
		json.trafficData = trafficData;
		json.imgData = imgData;
		json.tripIds = tripIds.substr(0,tripIds.length-1);//拼接后的tripId
		
		$.post('admin/depth/saveTrip',json,function(res){
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
	location.href = "admin/depth/detail/"+"${depthId}";
}

//返回时长字符串
function timeStr(hour, minute){
	var time = "";
	if(hour != 0){
		time += hour + "小时";
	}
	if(minute != 0){
		time += minute + "分钟";
	}
	return time;
}

function scroll(id){
	$("html,body").animate({scrollTop:$("#"+id).offset().top},250)
}

</script>
</html>
