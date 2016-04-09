<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="${system.basePath }">
<%@ include file="/static/inc.jsp" %>

<link rel="stylesheet" href="static/css/daterangepicker.css" />
<link rel="stylesheet" href="static/css/bootstrap-timepicker.css" />
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

table{
	width: 80%;
}

td{
	width:200px;
}

</style>
<body>
<table style="display: none;">
 	<tr class="telModel">
		<th>
		</th>
		<td>
		<input type="text" id="" name="" value=""  tips="请输入商户联系电话">
		<a class="btn btn-small" onclick="addTel()" style="position: relative; bottom: 5px"><i class="icon-plus"></i></a>
		<a class="btn btn-small" onclick="deleteTel(this)" style="position: relative; bottom: 5px"><i class="icon-minus"></i></a>
		</td>
	</tr>
</table>
<div class="container-fluid" id="main-container">
	<div id="breadcrumbs">
		<ul class="breadcrumb">
			<li><i class="icon-home"></i> <a href="javascript:;">当前</a><span class="divider"><i class="icon-angle-right"></i></span></li>
			<li class="active">商品信息</li>
		</ul><!--.breadcrumb-->
	</div><!--#breadcrumbs-->
	<div class="row-fluid">
		<!-- <h3 class="header smaller lighter blue">会员管理</h3> -->
		<div class="table-header">
			商品信息
		</div>
		<div style="height: 30px;"></div>
		
		<fieldset>
			<legend>订单信息</legend>
			<table>
				<tr>
					<td>用户账号</td>
					<td>${order.email }</td>
				</tr>
				<tr>
					<td>商品订单号</td>
					<td>${order.order_code }</td>
					<td>订单时间</td>
					<td id="orderTime"></td>
					<td>订单状态</td>
					<td id="orderState"></td>
				</tr>
				<tr>
					<td>订单金额</td>
					<td id="countPrice"></td>
					<td>单价</td>
					<td id="unitPrice">${order.real_price }</td>
				</tr>
			</table>
		</fieldset>
		
		<hr>
		
		<fieldset>
			<legend>酒店信息</legend>
			<table>
				<tr>
					<td>商户名称</td>
					<td>${order.username }</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>商品名称</td>
					<td>${order.title }</td>
				</tr>
				<tr>
					<td>入住房型</td>
					<td>${order.room_name }</td>
				</tr>
				<tr>
					<td>预定间数</td>
					<td id="goodsCount">${order.goods_count }</td>
				</tr>
				<tr>
					<td>入住时间</td>
					<td>${order.stay_in_time }</td>
				</tr>
				<tr>
					<td>离店时间</td>
					<td>${order.leave_time }</td>
				</tr>
			</table>
		</fieldset>
		
		<hr>
		
		
		<fieldset>
			<legend>联系人信息</legend>
			<table>
				<tr>
					<td>姓名</td>
					<td>${order.nickname }</td>
					<td>电话</td>
					<td>${order.phone }</td>
					<td></td>
					<td></td>
				</tr>
			</table>
		</fieldset>
		
		<fieldset>
			<legend>支付信息</legend>
			<table>
				<tr>
					<td>支付单号</td>
					<td>${order.pay_order_id }</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</table>
		</fieldset>
		
	</div>
	
</div>


<%@ include file="/static/foot.jsp" %>
</body>
<script type="text/javascript" charset="utf-8" src="plugins/ueditor1.4.3/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="plugins/ueditor1.4.3/ueditor.all.min.js"></script>
<script type="text/javascript" src="static/js/jquery.form.js"></script>
<script type="text/javascript" src="static/js/ajaxfileupload.js"></script>
<script type="text/javascript" src="static/js/daterangepicker.min.js"></script>
<script type="text/javascript" src="static/js/bootstrap-timepicker.min.js"></script>
<script type="text/javascript" src="static/js/fuelux.spinner.js"></script>
<script type="text/javascript" src="static/web/js/base.js"></script>
<!--定义操作列按钮模板-->
<script type="text/javascript">
$(document).ready(function(){
	
	var orderTime="${order.create_time}";
	var orderState="${order.order_state}";
	var diffDays="${diffDays}";
	
	var orderStr="";
	if(orderState=='WAITPAY'){
		orderStr="等待付款";
	}else if(orderState=='CLOSED'){
		orderStr="交易关闭";
	}else if(orderState=='REFUNDING'){
		orderStr="退款中";
	}else if(orderState=='REFUNDED'){
		orderStr="退款完成";
	}else if(orderState=='CONSUME'){
		orderStr="已消费";
		$("#couponTitle").html("已使用");
		$("#couponNoFieldset").show();
		$("#couponNoFieldsetHr").show();
	}else if(orderState=='UNCONSUME'){
		orderStr="未消费";
		$("#couponNoFieldset").show();
		$("#couponNoFieldsetHr").show();
	}else{
		orderStr="-";
	}
	
	if(diffDays==""){
		diffDays="0";
	}
	
	$("#countPrice").html(parseInt($("#unitPrice").html())*parseInt(diffDays)*parseInt($("#goodsCount").html()));
	$("#orderTime").html(orderTime);
	
	
	$("#orderState").html(orderStr);
	$("#couponState").html(couponTime);
});



</script>
</html>
