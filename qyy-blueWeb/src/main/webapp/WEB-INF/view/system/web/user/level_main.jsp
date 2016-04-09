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
			<li class="active">会员等级管理</li>
		</ul><!--.breadcrumb-->
	</div><!--#breadcrumbs-->
	<div class="row-fluid">
		<!-- <h3 class="header smaller lighter blue">会员管理</h3> -->
		<div class="table-header">
			会员等级管理
		</div>
		<form id="form_1">
			<div style="margin-left: 40px;">
				<c:forEach items="${data.parentList }" var="pd">
					<div class="control-group">
						<c:if test="${pd.levelName == 1 }">
							<input style="display:none;" name="score_st_${pd.id }" value="${pd.requireStart }" type="text" class="span1" />
							<label class="control-label" for="password2">${pd.levelDesc }
							&nbsp;年消费 &nbsp;&nbsp;≤&nbsp;&nbsp; 
							<input title="${pd.levelDesc }" id="inp_${pd.id }" name="score_${pd.id }" value="${pd.requireEnd }" type="text" class="span1" />&nbsp;桃子</label> 
						</c:if>
						<c:if test="${pd.levelName == 2 }">
							<label class="control-label" for="password2">${pd.levelDesc } 
							<input title="${pd.levelDesc }" id="inp_${pd.id }" name="score_st_${pd.id }" value="${pd.requireStart }" type="text" class="span1" />
							&nbsp;&nbsp;≤&nbsp;&nbsp; 年消费 
							&nbsp;&nbsp;≤&nbsp;&nbsp; 
							<input title="${pd.levelDesc }" id="inp_${pd.id }" name="score_${pd.id }" value="${pd.requireEnd }" type="text" class="span1" />&nbsp;桃子</label> 
						</c:if>
						<c:if test="${pd.levelName == 3 }">
							<label class="control-label" for="password2">${pd.levelDesc } 
							&nbsp;年消费 &nbsp;&nbsp;≥&nbsp;&nbsp; 
							<input title="${pd.levelDesc }" id="inp_${pd.id }" name="score_st_${pd.id }" value="${pd.requireStart }" type="text" class="span1" />&nbsp;桃子</label> 
							<input style="display:none;" name="score_${pd.id }" value="${pd.requireEnd }" type="text" class="span1" />
						</c:if>
						<div class="span12">
							<c:forEach items="${data[pd.id] }" var="sub">
								<label class="control-label" for="password2">${sub.levelDesc }
								<input title="${sub.levelDesc }" id="inp_${sub.id }" name="score_st_${sub.id }" value="${sub.requireStart }" type="text" class="span1" />
								&nbsp;~&nbsp;
								<input title="${sub.levelDesc }" id="inp_${sub.id }" name="score_${sub.id }" value="${sub.requireEnd }" type="text" class="span1" />&nbsp;桃子</label> 
							</c:forEach>
						</div>
					</div>
				</c:forEach>
			</div>
		</form>
		<div style="text-align: center;">
			<a title="保存" href="javascript:;" class="btn btn-mini btn-grey" id="save-btn"><i class="icon-save"></i> 保存</a>
		</div>
	</div>
</div>
<!-- #main-content -->

<%@ include file="/static/foot.jsp" %>
</body>
<script type="text/javascript">
//防止重复提交
var isSave = 1;

$(document).ready(function(){
	//保存
	$("#save-btn").click(function(){
		if(checkParam()!=1){
			return;
		}
		if(isSave==0)
			return;
		isSave = 0;
		$.post("admin/userlevelmngr/save",$("#form_1").serialize(),function(req){
			if(req.status =='success'){
				bootbox.alert("保存成功！");
			}else{
				bootbox.alert("保存失败，请检查输入！");				
			}
			isSave = 1;
		},"JSON");
	});
});

//检查输入
var checkParam =function(){
	var inputArr = document.getElementsByTagName("input");
	for(var i in inputArr){
		var inp = inputArr[i];
		var inpName = inp.name;
		if(typeof(inp)!='undefined' && typeof(inp.name)!='undefined' && inp.name.indexOf('score_') >= 0){
			var val = inp.value;
			if(!checkField(val, new RegExp('^\\d+$')) ){
				valTips(inp, "不能输入小数");
				return 0;
			}
			
			if(val>=0){
			}else{
				bootbox.alert(inp.title+" 范围的输入有误！");
				return 0;
			}
		}
	}
	return 1;
};


</script>
</html>
