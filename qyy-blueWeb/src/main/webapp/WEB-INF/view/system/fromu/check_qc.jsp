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
		
		<form action="" id="form" method="post">
			<input type="hidden" value="${type }" name="type">
            <input type="hidden" value="${map.id }" id="id" name="id">
			<table class="mytable-detail" >
				<tbody>
					<tr>
						<td>
							<img alt="" src="${map.head_img }" style="width: 50px;height: 50px">
						</td>
						<td>
							${map.nickname }
						</td>
						<td class="createTime">${map.create_time.getTime() }</td>
						<td>
						<a title="查看评论" onclick="checkReply()" href="javascript:;" target="mainFrame" class="btn btn-mini btn-info" >
						<i class="icon-search"></i> 查看评论(${map.replyCount })</a>
						</td>
					</tr>
					<tr>
						<td colspan="5">${map.title }</td>
					</tr>
					<tr>
						<td>
							类型：
							<c:if test="${type==4 }">旅行问答</c:if>
							<c:if test="${type==5 }">达人攻略</c:if>
						</td>
						<td>
							浏览:
							${map.browse }
						</td>
						<td>
							<c:if test="${type==4 }">解答</c:if>
							<c:if test="${type==5 }">评论</c:if>
							${map.replyCount }
						</td>
						<td class="createTime">
							${map.create_time.getTime() }
						</td>
					</tr>
					</table>
					<hr>
					<table>
						<tr>
							<td colspan="5">
								${map.content }
							</td>
						</tr>
				</tbody>
			</table>
			<hr>
		</form>
	</div>
<div>
	<input class="btn" style="margin-left: 10%" onclick="doBack()" type="button" value="返回">
</div>
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
	

	$(".createTime").each(function(){
		var stamp=parseInt($(this).html());
		$(this).html(getTimeTxt(stamp,16));
	});
	
});

function doBack(){
	window.location.href="admin/fromuOperation/index";
}

function checkReply(){
	var data={};
	data.travelsId="${map.id}";
	data.title="${map.title}";
	data.browse="${map.browse}";
	data.praise="${map.praise}";
	data.countReply="${map.replyCount}";
	data.collectionCount="${map.collectionCount}";
	data.create_time="${map.create_time.getTime()}";
	data.type="${type}";
	subWebForm("admin/fromuOperation/replyIndex",data);
}

</script>
</html>
