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
			编辑版本信息
		</div>
		<div id="div_content" class="row-fluid" style="padding-top: 10px;">
			<form class="form-horizontal" id="validation-form" method="post" >
				<input id="id" name="id" value="${detail.id }" type="hidden">
				<div class="control-group">
					<label class="control-label" for="name">手机系统:</label>
					<div class="controls">
						<div class="span4">
							<select id="appSys" name="appSys" class="span4">
								<option value="android" <c:if test="${detail.appSys eq 'android' }">selected=selected</c:if>>Android</option>
								<option value="ios" <c:if test="${detail.appSys eq 'ios' }">selected=selected</c:if>>IOS</option>
							</select>
						</div>
					</div>
					<label class="control-label" for="name">客户端版本号:</label>
					<div class="controls">
						<div class="span4">
							<input type="text" class="span4" value="${detail.issueVersion}" id="issueVersion" name="issueVersion" />
						</div>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="email">app文件:</label>
					<div class="controls">
						<span class="span4">
							<input type="hidden" class="span4" value="${detail.clientUrl }" id="clientUrl" name="clientUrl" />
							<c:if test="${detail.clientUrl eq '' || detail.clientUrl == null }">
								<input type="button" class="span8" value="上传app" id="uploadOpen" />
							</c:if>
							<c:if test="${detail.clientUrl != '' && detail.clientUrl != null }">
								<input type="button" class="span8" value="已上传app" id="uploadOpen"/>
							</c:if>
							<input onchange="ajaxFileUpload(this);" type="file" class="span8" id="uploadApp" name="uploadApp" style="display: none;" />
						</span>
					</div>
					<label class="control-label" for="email">app大小:</label>
					<div class="controls">
						<span class="span4">
							<input type="text" class="span4" value="${detail.clientSize}" id="clientSize" name="clientSize" />
						</span>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="email">应用描述:</label>
					<div class="controls">
						<span class="span4">
						<textarea id="appDesc" name="appDesc" rows="" cols="" style="width: 400px;height: 80px;">${detail.appDesc }</textarea>
						</span>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="email">更新描述:</label>
					<div class="controls">
						<span class="span4">
						<textarea id="updateDesc" name="updateDesc" rows="" cols="" style="width: 400px;height: 80px;">${detail.updateDesc }</textarea>
						</span>
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
	
	//保存
	$("#save-btn").click(function(){
		if($("#clientSize").val()==""){
			valTips("clientSize", "请输入app大小！");
			return ;
		}
		if($("#clientUrl").val()==""){
			valTips("clientUrl", "请上传app文件！");
			return ;
		}
		if($("#appDesc").val()==""){
			valTips("appDesc", "请输入app应用描述！");
			return ;
		}
		if($("#updateDesc").val()==""){
			valTips("updateDesc", "请输入更新描述！");
			return ;
		}
		$.post("admin/version/save",$("#validation-form").serialize(),function(req){
			if(req.status =='success'){
				bootbox.alert("保存成功！",function(){
					window.location.href="admin/version/main";
				});
			}else{
				bootbox.alert("保存失败，请检查输入！");			
			}
		},"JSON");
	});
});

//上传操作
var ajaxFileUpload = function(obj) {
	//获取欲上传的文件路径  
	var file = $(obj).val();
	var fileId=$(obj).attr("id");
	$("#save-btn").html("上传中..");
	$("#save-btn").attr({"disabled":"disabled"});
	$.ajaxFileUpload({
		url : 'admin/version/upload', //需要链接到服务器地址
		secureuri : false,
		fileElementId : fileId, //文件选择框的id属性
		data : {'type':$("#appSys").val(),"inputName":obj.name},
		dataType : 'JSON', //服务器返回的格式，可以是json
		success : function(data) { //相当于java中try语句块的用法
			$("#save-btn").html("保存");
			$("#save-btn").removeAttr("disabled");
			data = data.replace(/<[^>].*?>/g, "");//对返回的数据进行转换
			var json = eval("(" + data + ")");//对返回的数据进行转换
			//alert(json +"  "+data);
			if(json.status == 'check_type_error'){
				valTips("uploadOpen", "上传app文件格式不正确！");
			}else if(json.status == 'success'){
				$("#clientUrl").val(json.src);
			}else{
				valTips("uploadOpen", "上传app文件出错！");
			}
		}
	});
};
</script>
</html>
