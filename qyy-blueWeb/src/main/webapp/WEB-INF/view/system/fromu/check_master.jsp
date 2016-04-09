<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<base href="${system.basePath }">
	<%@ include file="/static/inc.jsp" %>

</head>
<style type="text/css">
form label{
	width: 220px;
}
#myform2 th{
	padding-left: 0px;
}
#myform5 th{
	padding-left: 0px;
}
#myform6 th{
	padding-left: 0px;
}

</style>
<body>
<div class="container-fluid" id="main-container">
	<div id="breadcrumbs">
		<ul class="breadcrumb">
			<li><i class="icon-home"></i> <a href="javascript:;">当前</a><span class="divider"><i class="icon-angle-right"></i></span></li>
			<li class="active"></li>
		</ul><!--.breadcrumb-->
	</div><!--#breadcrumbs-->
	<div class="row-fluid">
		<div class="table-header">
			
		</div>
		<div style="height: 30px;"></div>
		
			<table class="mytable-detail" >
				<tbody>
				<tr>
					<td>头像:</td>
					<td>
						<img alt="头像" style="width: 100px;height: 100px" src="${map.real_head_img }">
					</td>
				</tr>
				<tr>
					<td>申请账号:</td>
					<td>
						${map.phone }/${map.email }
					</td>
				</tr>
				<tr>
					<td>昵称:</td>
					<td>
						${map.nickname }
					</td>
				</tr>
				<tr>
					<td>会员等级:</td>
					<td>
						${map.level }
					</td>
				</tr>
				<tr>
					<td>真实姓名:</td>
					<td>
						${map.real_name }
					</td>
				</tr>
				<tr>
					<td>性别:</td>
					<td>
						<c:if test="${map.sex==1 }">男</c:if>
						<c:if test="${map.sex==0 }">女</c:if>
					</td>
				</tr>
				<tr>
					<td>现居住地:</td>
					<td>
						${map.nowlive }
					</td>
				</tr>
				<tr>
					<td>精通地区:</td>
					<td>
						${map.area }
					</td>
				</tr>
				<tr>
					<td>职业:</td>
					<td>
						${map.occupation }
					</td>
				</tr>
				<tr>
					<td>个人介绍:</td>
					<td>
						<textarea readonly="readonly" rows="4" cols="30">${map.summary }</textarea>
					</td>
				</tr>
				</tbody>
			</table>
	</div>
	<hr>
	<table>
		<tr>
			<td>手机</td>
			<td>${map.phone }</td>
		</tr>
		<tr>
			<td>邮箱</td>
			<td>${map.email }</td>
		</tr>
		<tr>
			<td>QQ</td>
			<td>${map.qq_num }</td>
		</tr>
		<tr>
			<td>微信号</td>
			<td>${map.wechat }</td>
		</tr>
	</table>
	<hr>
	<table>
	<c:forEach items="${list }" var="item" >
		<tr>
			<td class="createTime">${item.create_time.getTime() }</td>
			</tr><tr>
			<td>
			<c:if test="${item.result=='OK' }">通过</c:if>
			<c:if test="${item.result=='NO' }">未通过</c:if>
			</td>
			</tr>
		<c:if test="${map.result=='NO' }">
		<tr>
			<td>未通过原因:</td>
			<td>${item.reason }</td>
		</tr>
		</c:if>	
	</c:forEach>
	</table>
</div>




<%@ include file="/static/foot.jsp" %>
</body>
<script type="text/javascript" src="static/js/jquery.form.js"></script>
<script type="text/javascript" src="static/js/ajaxfileupload.js"></script>
<script type="text/javascript" src="static/web/js/base.js"></script>
<!--定义操作列按钮模板-->
<script id="tpl" type="text/x-handlebars-template">
{{#each func}}
<a class="btn btn-mini btn-{{this.type}}" href="javascript:;" title="{{this.name}}" target="mainFrame" onclick="{{this.fn}}"><i class="icon-{{this.icon}}"></i></a>
{{/each}}
</script>
<script type="text/javascript">
var tpl = $("#tpl").html();
//预编译模板
var template = Handlebars.compile(tpl);
var facilities="${facilities}";
//var countyId="${city.id}";
//var cityId="${city.parentId}";

$(document).ready(function(){
	

	$('#otherInfoTab a:first').tab('show');//初始化显示哪个tab

	/*tab页点击初始化*/
	$('.mydate-picker').datepicker();
	
	$(".createTime").each(function(){
		var timestamp=parseInt($(this).html());
		$(this).html(getTimeTxt(timestamp,16));
	});
	
});




</script>
</html>
