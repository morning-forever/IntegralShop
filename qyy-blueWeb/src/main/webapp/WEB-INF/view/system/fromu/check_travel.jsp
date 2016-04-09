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
						<a title="审核记录" href="javascript:scroll('examine');" class="btn btn-mini btn-info" >
						<i class="icon-search"></i> 审核记录(${examineList.size() })</a>
						</td>
						<td>
						<a title="查看评论" onclick="checkReply()" href="javascript:;" target="mainFrame" class="btn btn-mini btn-info" >
						<i class="icon-search"></i> 查看评论(${map.countReply })</a>
						</td>
					</tr>
					<tr>
						<td colspan="5">${map.title }</td>
					</tr>
					<tr>
						<td>
							类型：
							<c:if test="${map.travel_type==1 }">精彩游记</c:if>
							<c:if test="${map.travel_type==2 }">达人攻略</c:if>
							<c:if test="${map.travel_type==3 }">玩伴招募</c:if>
						</td>
						<td>
							浏览:
							${map.browse }
						</td>
						<td>
							点赞:
							${map.praise }
						</td>
						<td>
							评论:
							${map.countReply }
						</td>
						<td>
							收藏:
							${map.collectionCount }
						</td>
						<td class="createTime">
							${map.create_time.getTime() }
						</td>
					</tr>
					</table>
					<hr>
					<table>
					<c:forEach items="${itemList }" var="item">
						<tr>
							<td colspan="5">
							<c:if test="${item.item_type=='word' }">
					     		<p>${item.context }</p>
					     	</c:if>
					     	<c:if test="${item.item_type=='imgs' }">
					     		<img style="width: 400px;height: 400px;" src="${item.context }"/>
					     	</c:if>
					     	<c:if test="${item.item_type=='stage' }">
					     		<h3 class="h-title">${item.context }</h3>
					     	</c:if>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<hr>
			<table>
				<tr>
					<th style="font-size: 18px"><a  id="examine"></a>审核结果(${examineList.size() })</th>
				</tr>
				<c:forEach items="${examineList }" var="examine">
					<tr>
						<td>
						<p class="createTime">${examine.create_time.getTime() }</p>
						<c:if test="${examine.result==0 }"><p>通过</p></c:if>
						<c:if test="${examine.result==1 }"><p>未通过</p>${examine.reason }</c:if>
						</td>
					</tr>
				</c:forEach>
			</table>
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
	data.travelsType="${map.travel_type}";
	data.browse="${map.browse}";
	data.praise="${map.praise}";
	data.countReply="${map.countReply}";
	data.collectionCount="${map.collectionCount}";
	data.create_time="${map.create_time.getTime()}";
	data.type="${map.travel_type}";
	subWebForm("admin/fromuOperation/replyIndex",data);
}

function scroll(id){
	$("html,body").animate({scrollTop:$("#"+id).offset().top},1000)
}

</script>
</html>
