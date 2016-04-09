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

table td,table th{
	padding: 5px;
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
					<th>订单信息</th>
				</tr>
				<tr>
					<td>
						用户账号：
					</td>
					<td>
						${map.email }/${map.phone }
					</td>
				</tr>
				<tr>
					<td>
						商品订单号:
					</td>
					<td>
						${map.order_code}
					</td>
					<td>
						订单时间:
					</td>
					<td class="createTime">
						${map.create_time.getTime()}
					</td>
				</tr>
				<tr>
					<td>
						订单金额:
					</td>
					<td>
						${map.real_price }
					</td>
				</tr>
			</table>
			<hr>
			<%-- <table>
				<tr>
					<th colspan="3">拼车基本信息</th>
				</tr>
				<tr>
					<td>品牌：${map.brand }</td>
					<td>车系：${map.sys }</td>
					<td>年代：${map.car_year }</td>
					<td>座位数：${map.seating }</td>
				</tr>
			</table> --%>
			<table>
				<tr>
					<th>拼车出车信息</th>
				</tr>
				<tr>
					<td>出发时间：<span class="createTime">${map.start_time.getTime() }</span></td>
					<td>截止时间：<span class="createTime">${map.end_time.getTime() }</span></td>
				</tr>
				<tr>
					<td>发车地点：<span>${map.startStore }</span></td>
					<td>目的地：<span>${map.endStore }</span></td>
				</tr>
			</table>
			<hr>
			<table>
				<tr>
					<th>拼车人信息</th>
				</tr>
				<c:forEach items="${list }" var="person" varStatus="index">
				<tr>
					<td>姓名：${person.person_name}</td>
					<td>电话：${person.person_phone }</td>
				</tr>
				<tr>
					<td>证件类型：${person.card_type}</td>
					<td>证件号码：${person.card_no }</td>
					<td>
						<c:if test="${person_type=='audlt' }">
							成人
						</c:if>
						<c:if test="${person_type=='children' }">
							儿童
						</c:if>
					</td>
				</tr>
				</c:forEach>
			</table>
			<hr>
			<table>
				<tr>
					<th colspan="2">费用明细</th>
				</tr>
				<tr>
					<td width="100px">车辆租金：</td>
					<td colspan="10">
						<div class="scroll_wrap rel">
							<span class="scroll_left iicon"></span>
							<span class="scroll_right iicon"></span>
							<div class="inner_wrap rel">
								<ul class="inner_list clearfix">
								</ul>
							</div>
						</div>
						总计:<span id="carPrice"></span>
					</td>
				</tr>
				<tr>
					<td>保险：</td>
					<td><span id="safePrice"></span></td>
				</tr>
				<tr>
					<td>手续费：</td>
					<td>0元</td>
				</tr>
				<tr>
					<td></td>
					<td>合计：${map.real_price }</td>
				</tr>
			</table>
			<c:if test="${map.is_invoice==0 }">
			<hr>
			<table>
				<tr>
					<th>发票信息</th>
				</tr>
				<tr>
					<td>发票抬头：${map.invoiceTitle}</td>
				</tr>
				<tr>
					<td>收件人：${map.invoiceReceiver }</td>
				</tr>
				<tr>
					<td>电话号码：${map.invoicePhone}</td>
				</tr>
				<tr>
					<td>收件地址：${map.invoiceAddr }</td>
				</tr>
			</table>
			</c:if>
			<c:if test="${map.order_state!='WAITPAY' }">
			<hr>
			<table>
				<tr>
					<th>支付单号：${map.pay_order_id }</th>
				</tr>
			</table>
			</c:if>
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
	
	
	
	var realPrice=parseFloat("${map.real_price}");
	var safePrice=parseFloat("${map.safe_price}");
	$("#carPrice").html(realPrice-safePrice);
	$("#safePrice").html(safePrice);
	
	
});

function doBack(){
	window.location.href="admin/order/cart/index";
}


</script>
</html>
