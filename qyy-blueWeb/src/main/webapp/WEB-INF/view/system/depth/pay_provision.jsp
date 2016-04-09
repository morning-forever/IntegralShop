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
			<li class="active">购买须知管理</li>
		</ul><!--.breadcrumb-->
	</div><!--#breadcrumbs-->
	<div class="row-fluid">
		<div class="table-header">
			编辑购买须知信息
		</div>
		<div id="div_content" class="row-fluid" style="padding-top: 10px;">
			<form class="form-horizontal" id="validation-form" method="post" >
				<div class="control-group">
					<label class="control-label" for="email">购买须知内容:</label>
					<div class="controls">
						<input id="context" name="context" type="hidden">
						<script id="editor" type="text/plain" name="uecontext">${provision}</script>
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
<script type="text/javascript" charset="utf-8" src="plugins/ueditor1.4.3/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="plugins/ueditor1.4.3/ueditor.all.min.js"></script>
<script type="text/javascript" src="static/js/jquery.form.js"></script>
<script type="text/javascript" src="static/js/daterangepicker.min.js"></script>

<script type="text/javascript">
//防止重复提交
var isSave = 1;
var ue;
$(document).ready(function(){
	ue = UE.getEditor('editor', {
		toolbars : [ [ "bold", "italic", "underline", "|", "fontfamily", "diyh3", "blockquote", "insertunorderedlist", "insertorderedlist", "|", "insertimage", "|", "removeformat" ] ],
		initialFrameWidth:820,
		initialFrameHeight:250,
		autoHeightEnabled:false
	});
	//初始化时间插件
	$('.mydate-picker').datepicker();
	
	//保存
	$("#save-btn").click(function(){
		if(isSave==0)
			return;
		
		$("#context").val(ue.getContent());
		if($("#context").val()==""){
			valTips("uecontext", "购买须知内容不能为空");
			return ;
		}
		$.post("admin/depth/saveProvision",{content:ue.getContent()},function(req){
			if(req.status =='success'){
				bootbox.alert("保存成功！",function(){
					window.location.reload();
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
