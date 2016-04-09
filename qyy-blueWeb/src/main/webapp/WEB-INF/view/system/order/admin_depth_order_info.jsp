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
			<li class="active">订单管理</li>
		</ul><!--.breadcrumb-->
	</div><!--#breadcrumbs-->
	<div class="row-fluid">
		<div class="table-header">订单详情</div>
		<div id="div_content" class="row-fluid" style="padding-top: 10px;">
			<form id="myForm" class="form-horizontal" method="post" >
				
				<div class="control-group">
					<label class="control-label" for="name">订单信息</label>
					<div class="controls">
						<table style="width: 70%">
							<tr>
								<td style="font-weight: bold;">用户账号：</td>
								<td>${nickName }</td>
							</tr>
							<tr>
								<td style="font-weight: bold;">商品订单号：</td>
								<td>${depthOrder.order_code }</td>
								<td style="font-weight: bold;">订单时间：</td>
								<td><fmt:formatDate value="${depthOrder.create_time }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								<td style="font-weight: bold;">订单状态：</td>
								<td>${depthOrder.order_state }</td>
							</tr>
							<tr>
								<td style="font-weight: bold;">订单金额：</td>
								<td>${depthOrder.real_price }元</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="hr hr-dotted"></div>
				
				<div class="control-group">
					<label class="control-label" for="name">行程信息</label>
					<div class="controls">
						<table style="width: 70%">
							<tr>
								<td style="font-weight: bold;">路线名称：</td>
								<td>${depthOrder.name }</td>
							</tr>
							<tr>
								<td style="font-weight: bold;">起始日：</td>
								<td><fmt:formatDate value="${depthOrder.start_time }" pattern="yyyy-MM-dd"/></td>
								<td style="font-weight: bold;">结束日：</td>
								<td><fmt:formatDate value="${depthOrder.end_time }" pattern="yyyy-MM-dd"/></td>
								<td style="font-weight: bold;">合计：</td>
								<td>${depthOrder.days }天</td>
							</tr>
							<tr>
								<td style="font-weight: bold;">起始地：</td>
								<td>${depthOrder.city }</td>
								<td style="font-weight: bold;">目的地：</td>
								<td>${depthOrder.trip_addr }</td>
								<td style="font-weight: bold;">同行人数：</td>
								<td></td>
							</tr>
						</table>
					</div>
				</div>
				<div class="hr hr-dotted"></div>
				
				<div class="control-group">
					<label class="control-label" for="name">个人信息</label>
					<div class="controls">
						<table style="width: 70%">
							<c:forEach items="${personList}" var="person">
								<c:choose>
									<c:when test="${person.person_type == 'adult' }">
									<tr name="adult">
										<td style="font-weight: bold;">姓名：</td>
										<td>${person.person_name }</td>
										<td style="font-weight: bold;">电话：</td>
										<td>${person.person_phone }</td>
									</tr>
									<tr>
										<td style="font-weight: bold;">证件类型：</td>
										<td>${person.card_type }</td>
										<td style="font-weight: bold;">证件号码：</td>
										<td>${person.card_no }</td>
										<td>成人</td>
									</tr>
									</c:when>
									<c:when test="${person.person_type == 'children' }">
									<tr name="child">
										<td style="font-weight: bold;">姓名：</td>
										<td>${person.person_name }</td>
										<td style="font-weight: bold;">电话：</td>
										<td>${person.person_phone }</td>
										<td>儿童</td>
									</tr>
									</c:when>
								</c:choose>
							</c:forEach>
						</table>
					</div>
				</div>
				<div class="hr hr-dotted"></div>
				
				<div class="control-group">
					<label class="control-label" for="name">联系人信息</label>
					<div class="controls">
						<table style="width: 70%">
							<tr>
								<td style="font-weight: bold;">姓名：</td>
								<td>${depthOrder.person_name }</td>
								<td style="font-weight: bold;">电话：</td>
								<td>${depthOrder.person_phone }</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="hr hr-dotted"></div>
				
				
				<div class="control-group">
					<label class="control-label" for="name">支付信息</label>
					<div class="controls">
						<table style="width: 70%">
							<c:if test="${depthOrder.order_state == 'PAY_OK' || depthOrder.order_state == 'REFUNDING' 
							|| depthOrder.order_state == 'REFUNDING_FAIL' || depthOrder.order_state == 'REFUNDED'}">
							<tr>
								<td style="font-weight: bold;">支付宝单号：</td>
								<td>${depthOrder.pay_order_id }</td>
							</tr>
							</c:if>
							<tr>
								<td style="font-weight: bold;">成交时间：</td>
								<td><fmt:formatDate value="${depthOrder.create_time }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							</tr>
							<c:if test="${depthOrder.order_state == 'REFUNDING' 
							|| depthOrder.order_state == 'REFUNDING_FAIL' || depthOrder.order_state == 'REFUNDED'}">
							<tr>
								<td style="font-weight: bold;">提交退款时间：</td>
								<td>${depthOrder.refundTime }</td>
							</tr>
							<tr>
								<td style="font-weight: bold;">备注：</td>
								<td>审核成功后退款将在7个工作日内退回到您的银行卡账户，请注意查收</td>
							</tr>
							<tr>
								<td style="font-weight: bold;">真实姓名：</td>
								<td>${depthOrder.refundName }</td>
							</tr>
							<tr>
								<td style="font-weight: bold;">退款银行名称：</td>
								<td>${depthOrder.bank_name }</td>
							</tr>
							<tr>
								<td style="font-weight: bold;">退款银行帐号：</td>
								<td>${depthOrder.bank_no }</td>
							</tr>
							</c:if>
						</table>
					</div>
				</div>
				
				<div class="hr hr-dotted"></div>
				
		  	</form>
		</div>
		<div style="text-align: center;">
			<a title="返回" href="javascript:;" class="btn btn-grey" id="back-btn" onclick="back()"><i class="icon-reply"></i> 返回</a>
		</div>
	</div>
</div>
<!-- #main-content -->
<%@ include file="/static/foot.jsp" %>
</body>
<script type="text/javascript" charset="utf-8"
	src="plugins/ueditor1.4.3/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="plugins/ueditor1.4.3/ueditor.all.min.js"></script>
<script type="text/javascript" src="static/js/jquery.form.js"></script>
<script type="text/javascript" src="static/js/ajaxfileupload.js"></script>
<script type="text/javascript" src="static/js/daterangepicker.min.js"></script>
<script type="text/javascript" src="static/js/bootstrap-timepicker.min.js"></script>
<script type="text/javascript" src="static/js/fuelux.spinner.js"></script>
<script type="text/javascript" src="static/web/js/base.js"></script>
<!-- 日历控件 -->
<script src='static/web/js/fullcalendar/moment.min.js'></script>
<script type="text/javascript" src="static/js/fullcalendar.min.js"></script>
<script type="text/javascript">
var ue;
$(document).ready(function() {
	
	//初始化状态
	var desc = getStateDesc("${depthOrder.order_state}");
	$(".control-group:first").find("tr:eq(1) td:last").text(desc);	
	
	//初始化成人和儿童人数
	$("table:eq(1) tr:last td:last").text($("tr[name=adult]").length+"成人，"+$("tr[name=child]").length+"儿童");
	
});

//获取订单状态描述
function getStateDesc(orderState){
	var desc = "";
	if(orderState == 'WAITPAY'){
		desc = '待付款';
	}else if(orderState == 'PAY_OK'){
		desc = '交易成功';
	}else if(orderState == 'CLOSED'){
		desc = '交易关闭';
	}else if(orderState == 'REFUNDING'){
		desc = '退款中';
	}else if(orderState == 'REFUNDING_FAIL'){
		desc = '退款失败';
	}else if(orderState == 'REFUNDED'){
		desc = '退款完成';
	}
	return desc;
}

//返回
function back(){
	location.href = "admin/order/depth/main";
}

</script>
</html>
