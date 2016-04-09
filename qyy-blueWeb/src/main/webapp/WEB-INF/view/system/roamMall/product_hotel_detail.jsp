<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="${system.basePath }">
<%@ include file="/static/inc.jsp"%>

<link rel="stylesheet" href="static/css/daterangepicker.css" />
<link rel="stylesheet" href="static/css/bootstrap-timepicker.css" />
</head>
<style type="text/css">
form label {
	width: 220px;
}

#myform2 th {
	padding-left: 0px;
}

#myform5 th {
	padding-left: 0px;
}

#myform6 th {
	padding-left: 0px;
}
</style>
<body>
	<table style="display: none;">
		<tr class="telModel">
			<th></th>
			<td><input type="text" id="" name="" value="" tips="请输入商户联系电话">
				<a class="btn btn-small" onclick="addTel()"
				style="position: relative; bottom: 5px"><i class="icon-plus"></i></a>
				<a class="btn btn-small" onclick="deleteTel(this)"
				style="position: relative; bottom: 5px"><i class="icon-minus"></i></a>
			</td>
		</tr>
	</table>
	<div class="container-fluid" id="main-container">
		<div id="breadcrumbs">
			<ul class="breadcrumb">
				<li><i class="icon-home"></i> <a
					href="javascript:alert('index');">当前</a><span class="divider"><i
						class="icon-angle-right"></i></span></li>
				<li class="active">商品信息</li>
			</ul>
			<!--.breadcrumb-->
		</div>
		<!--#breadcrumbs-->
		<div class="row-fluid">
			<div class="table-header">酒店信息</div>
			<div style="height: 30px;"></div>
			<div class="tab-content">
				<!-- 基本信息 -->
				<div class="tab-pane active" id="tab_1">
					<table class="mytable-detail">
						<tbody>
							<tr>
								<th>商户名称：</th>
								<td>${merchUser.username }</td>
							</tr>
							<tr>
								<th>商品标题：</th>
								<td>${goods.title }</td>
							</tr>
							<tr>
								<th>商品副标题：</th>
								<td>${goods.subtitle }</td>
							</tr>
							<tr>
								<th>酒店所在地：</th>
								<td>${loc }</td>
							</tr>
							<tr>
								<th>酒店具体地址：</th>
								<td>${merchUser.addr_detail }</td>
							</tr>
							<tr>
								<th>酒店品牌：</th>
								<td>${merchUser.brand_name }</td>
							</tr>
							<tr>
								<th>酒店星级：</th>
								<td>${merchUser.star_name }</td>
							</tr>
							<tr>
								<th>酒店主题：</th>
								<td>${merchUser.theme_name }</td>
							</tr>
							<tr>
								<th>房型：</th>
								<td>${goodsHotel.roomName }</td>
							</tr>
							<tr>
								<th>数量：</th>
								<td>${goodsHotel.roomNumber }</td>
							</tr>
							<tr>
								<th>房间费用：</th>
								<td>原价   ${goodsHotel.originalPrice }元/人<br>
									现价   ${goodsHotel.currentPrice }元/人</td>
							</tr>
							<tr>
								<th>是否含早餐：</th>
								<td>
								<c:if test="${goodsHotel.isBreakfast == 0 }">是</c:if>
								<c:if test="${goodsHotel.isBreakfast == 1 }">否</c:if>
								</td>
							</tr>
							<tr>
								<th>房间图片：</th>
								<td><c:forEach items="${photoUrlList }" var="photo">
										<img src="${photo} " style="width: 170px; height: 130px"></img>
									</c:forEach></td>
							</tr>
							<tr>
								<th>商品介绍：</th>
								<td>${goods.detailedInfo }</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div>
			    	<input class="btn" style="margin-left: 10%" onclick="doBack()" type="button" value="返回">
			    </div>
			</div>
		</div>
	</div>
	<%@ include file="/static/foot.jsp"%>
</body>
<script type="text/javascript" charset="utf-8"
	src="plugins/ueditor1.4.3/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="plugins/ueditor1.4.3/ueditor.all.min.js"></script>
<script type="text/javascript" src="static/js/jquery.form.js"></script>
<script type="text/javascript" src="static/js/ajaxfileupload.js"></script>
<script type="text/javascript" src="static/js/daterangepicker.min.js"></script>
<script type="text/javascript"
	src="static/js/bootstrap-timepicker.min.js"></script>
<script type="text/javascript" src="static/js/fuelux.spinner.js"></script>
<!--定义操作列按钮模板-->
<script id="tpl" type="text/x-handlebars-template">
	{{#each func}}
	<a class="btn btn-mini btn-{{this.type}}" href="javascript:;" title="{{this.name}}" target="mainFrame" onclick="{{this.fn}}"><i class="icon-{{this.icon}}"></i></a>
	{{/each}}
</script>
<script type="text/javascript">
	var tpl = $("#tpl").html();
	var ue;
	//预编译模板
	var template = Handlebars.compile(tpl);
	function doBack(id){
		window.location.href="admin/roamMall/product/main?tab=1";
	}

</script>
</html>
