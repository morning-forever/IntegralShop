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
			<li class="active">积分规则管理</li>
		</ul><!--.breadcrumb-->
	</div><!--#breadcrumbs-->
	<div class="row-fluid">
		<!-- <h3 class="header smaller lighter blue">会员管理</h3> -->
		<div class="table-header">
			积分规则管理
		</div>
		<div style="margin-left: 40px;margin-top: 20px;">
			<form id="form_obtain">
				<input type="hidden" name="id" value="${data.id }" />
				<!-- 加载编辑器的容器 -->
    			<script id="container" name="content" type="text/plain">${data.details }</script>
			</form>
		</div>
		<div style="text-align: center;">
			<a title="保存" href="javascript:;" class="btn btn-mini btn-grey" id="save-btn"><i class="icon-save"></i> 保存</a>
		</div>
	</div>
</div>
<!-- #main-content -->
<script type="text/javascript" src="plugins/ueditor1.4.3/ueditor.config.js"></script>
<script type="text/javascript" src="plugins/ueditor1.4.3/ueditor.all.min.js"></script>



<%@ include file="/static/foot.jsp" %>

</body>
<script type="text/javascript">

var editorOption = {  
	toolbars : [ [ 'source',"bold", "italic", "underline", "|"
	               , "fontfamily", "diyh3", "blockquote", "insertunorderedlist", "insertorderedlist", "|"
	               , "insertimage", 'inserttable', "|", "removeformat" ] ]
	,initialFrameWidth:950  //初始化编辑器宽度,默认1000
	,initialFrameHeight:400  //初始化编辑器高度,默认320
}; 
var ue = UE.getEditor('container',editorOption);

//防止重复提交
var isSave = 1;

$(document).ready(function(){
	//保存
	$("#save-btn").click(function(){
		if(isSave==0)
			return;
		isSave = 0;
		$.post("admin/webscoremngr/saveDetail",$("#form_obtain").serialize(),function(req){
			if(req.status =='success'){
				bootbox.alert("保存成功！");
			}else{
				bootbox.alert("保存失败，请检查输入！");				
			}
			isSave = 1;
		},"JSON");
	});
});
</script>
</html>
