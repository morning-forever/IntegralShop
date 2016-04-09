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
			<li class="active">会员积分管理</li>
		</ul><!--.breadcrumb-->
	</div><!--#breadcrumbs-->
	<div class="row-fluid">
		<!-- <h3 class="header smaller lighter blue">会员管理</h3> -->
		<div class="table-header">
			会员积分管理
		</div>
		<div style="margin-left: 40px;margin-top: 20px;">
			<form id="form_ex">
				<c:forEach items="${exList }" var="rl">
					<div class="control-group">
						<label class="control-label" for="password2">${rl.ruleDesc }
						<input id="ex_rmb_${rl.id }"  name="ex_rmb_${rl.id }" value="${rl.exRmb }" type="text" class="span1" />元  &nbsp;= 
						<input id="ex_score_${rl.id }" name="ex_score_${rl.id }"  value="${rl.ruleScore }" type="text" class="span1" />桃子
						<a title="保存" href="javascript:;" style="margin-left: 100px;" class="btn btn-mini btn-grey" id="save-btn-ex"><i class="icon-save"></i> 保存</a>
						</label>
					</div>
				</c:forEach>
			</form>
			<hr style="height: 1px;">
			
			<form id="form_obtain">
				<c:forEach items="${obtainList }" var="rl">
					<div class="control-group">
						<table style="width: 100%;" border="0">
							<tr align="left">
								<td width="180">${rl.ruleDesc } </td>
								<td><input id="obtain_${rl.id }" name="obtain_${rl.id }" value="${rl.ruleScore }" type="text" class="span1" />桃子</td>
							</tr>
						</table>
					</div>
				</c:forEach>
				
				<c:forEach items="${tremList }" var="trem">
					<div class="control-group">
						<table style="width: 100%;" border="0">
							<tr align="left">
								<td width="180">${trem.ruleDesc } </td>
								<td><input id="trem_${trem.id }" name="trem_${trem.id }" value="${trem.exTrem }" type="text" class="span1" />年</td>
							</tr>
						</table>
					</div>
				</c:forEach>
			</form>
		</div>
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
		$.post("admin/webscoremngr/saveObtainAndTrem",$("#form_obtain").serialize(),function(req){
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
