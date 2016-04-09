<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transition al.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../../../../static/inc_web.jsp" %>
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv = "X-UA-Compatible" content = "IE=edge,chrome=1 " /><meta charset="utf-8"> 
<title>订单管理-旅游-订单详情</title>
<link rel="stylesheet" href="static/web/css/common.css" />
<link rel="stylesheet" href="static/web/css/inner.style.css" />
<link rel="stylesheet" href="static/web/css/order.management.css" />
<style type="text/css">
.menu_cart{
	width:790px;
	left:100px;
}
</style>
</head>
<body>
<div class="wrapper inner">
	<!-- header -->
	<div class="header">
		<jsp:include page="../common/header.jsp"></jsp:include>	
		<div class="nav_ul_wrap">
			<ul class="nav clearfix">
				<li><a href="pc/home">首页</a></li>
				<!-- <li><a href="pc/simple/home">智易行</a></li> -->
				<li >
					<a href="pc/cart/home">快旅出行</a>
					<div class="level2_nav menu_cart" >
						<div class="oneline">
							<a href="pc/cart/rent/list">快旅租车</a>
							<a href="pc/cart/wrap/list">快旅包车</a>
							<a href="pc/cart/bus/list">快旅班车</a>
							<a href="pc/cart/pool/list">快旅拼车</a>
						</div>
					</div>
				</li>
				<li class="active"><a href="pc/depth/home">主题深度游</a></li>
				<li>
					<a href="pc/interact/home">互动社区</a>
					<div class="level2_nav">
						<div class="oneline">
							<a href="pc/travels/masterIndex">达人攻略</a>
							<a href="pc/travels/travel">精彩游记</a>
							<a href="pc/interact/frendEnlist">玩伴招募</a>
							<a href="pc/question/index">旅行问答</a>
							<a href="pc/complaint/index">吐槽专区</a>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</div>

	<!-- page content -->
	<div class="content_wrap pb90">
		<div class="content order-manage">
			<div class="breadcrumb">当前位置：<a href="pc/home">首页</a><a href="pc/user/order/depthList">订单管理</a><a href="pc/user/order/depthList">旅游</a><a href="pc/user/order/depthList">主题深度游</a><span>订单详情</span></div>
			<div class="whitebg pb20">
				<div class="f18 bold borderbs1 grey9 pb20">订单状态：<span class="grey">交易成功</span></div>
				<div class="order-info pt20 pb20 clearfix">
					<img src="${depthOrder.pic_url }" width="197" height="113" class="fl">
					<div class="ml10 fl">
						<p class="f16 dark">${depthOrder.name }</p>
						<p class="lorange" style="margin-top:68px;padding-left:5px;">￥<span class="f18 bold">${depthOrder.real_price }</span></p>
					</div>
					<div class="info-right fr rel">
						<span class="grey9">数量 ${depthOrder.goods_count }</span>
						<i class="iicon arrow abs" style="cursor: pointer;" onclick="toDetail()"></i>
					</div>
				</div>
				<h4 class="orangeh4">行程信息</h4>
				<div class="stroke spanstyle">
					<span class="item">起始日：<span>${depthOrder.start_time }</span></span>
					<span class="item">结束日：<span>${depthOrder.end_time }</span></span>
					<span class="item">合计：<span>${depthOrder.days }天</span></span>
					<span class="item">起始地：<span>${depthOrder.city }</span></span>
					<span class="item">目的地：<span>${depthOrder.trip_addr }</span></span>
					<span class="item" style="padding-right:0;">同行人数：<span>成人，1儿童</span></span>
				</div>
				<h4 class="orangeh4">个人信息</h4>
				<div class="personal-info spanstyle">
					<ul>
						<c:forEach items="${personList }" var="person">
						<c:choose>
							<c:when test="${person.person_type  == 'adult'}">
								<li>
									<span class="item" name="adult">姓名：<span>${person.person_name }</span></span>
									<span class="item">电话：<span>${person.person_phone }</span></span>
									<span class="item">证件类型：<span>${person.card_type }</span></span>
									<span class="item">证件号码：<span>${person.card_no }</span></span>
									<span class="item">成人</span>
								</li>
							</c:when>
							<c:when test="${person.person_type  == 'children'}">
								<li>
									<span class="item" name="child">姓名：<span>${person.person_name }</span></span>
									<span class="item">儿童</span>
								</li>
							</c:when>
						</c:choose>
						</c:forEach>
					</ul>
				</div>
				<h4 class="orangeh4">联系人信息</h4>
				<div class="personal-info spanstyle pt20 pb20 pl10">
					<span class="item">姓名：<span>${depthOrder.person_name }</span></span>
					<span class="item">联系电话：<span>${depthOrder.person_phone }</span></span>
				</div>
				<div class="borderttype2 spanstyle pl10 pt20">
					<p><span class="item">订单编号：<span>${depthOrder.order_code }</span></span></p>
					<c:if test="${depthOrder.order_state == 'PAY_OK' || depthOrder.order_state == 'REFUNDING' 
					|| depthOrder.order_state == 'REFUNDING_FAIL' || depthOrder.order_state == 'REFUNDED'}">
						<p><span class="item">支付宝单号：<span>${depthOrder.pay_order_id }</span></span></p>
					</c:if>
					<p><span class="item">成交时间：<span><fmt:formatDate value="${depthOrder.create_time }" pattern="yyyy-MM-dd HH:mm:ss"/></span></span></p>
					<c:if test="${depthOrder.order_state == 'REFUNDING' 
					|| depthOrder.order_state == 'REFUNDING_FAIL' || depthOrder.order_state == 'REFUNDED'}">
						<p><span class="item">提交退款时间：<span>${depthOrder.refundTime }</span></span></p>
						<p><span class="item">备注：<span>退款将在7个工作日内退回到您的银行卡账户，请注意查收</span></span></p>
						<p><span class="item">真实姓名：<span>${depthOrder.refundName }</span></span></p>
						<p><span class="item">退款银行名称：<span>${depthOrder.bank_name }</span></span></p>
						<p><span class="item">退款银行帐号：<span>${depthOrder.bank_no }</span></span></p>
					</c:if>
				</div>
				<div class="pb20 pt20 tr">
					<span class="f16 mr10 grey9">合计</span><span class="lorange f16">￥<span class="f30 bold">${depthOrder.real_price }</span></span>
				</div>
				<div id="btnDiv" class="tc mt20 mb20">
					<!-- <button class="btn lorgbtn">退款</button>
					<button class="btn ml20" style="background:#5d5547;">删除订单</button> -->
				</div>
			</div>
		</div>
						
	</div>

	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
</div>
</body>
<script type="text/javascript" src="static/web/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="static/web/js/base.js"></script>
<script type="text/javascript" src="static/web/js/index.js"></script>
<script type="text/javascript">
$(function(){
	selfDefineFormBtn();
	HorizontalList();
	
	//初始化订单状态
	initState();
	
	//初始化成人和儿童人数
	$(".stroke .item:last span").text($("span[name=adult]").length+"成人，"+$("span[name=child]").length+"儿童");
});


var depthOrder = '${depthOrderJson}';//深度游订单对象
depthOrder = eval('('+depthOrder+')');

//初始化状态
function initState(){
	
	var stateObj = getState(depthOrder);
	$("div.borderbs1 span").text(stateObj.desc);
	$("#btnDiv").empty();
	$("#btnDiv").append(stateObj.btn);
}

//跳转至明细页面
function toDetail(){
	location.href = "<%=basePath %>pc/depth/detail/"+"${depthOrder.goodsId }";
}

//得到订单状态
function getState(obj){
	var stateObj = {};
	var btn = '<button class="btn ml20" style="background:#5d5547;" onclick="operOrder(\'delete\','+obj.id+')">删除订单</button>';
	var orderState = obj.order_state;
	var d = new Date();
	d.setTime(obj.start_time);
	var startTime = d.format("yyyy-MM-dd");
	//待付款
	if(orderState == 'WAITPAY'){
		stateObj.desc = '待付款';//支付状态描述
		stateObj.btn = '<button class="btn lorgbtn" onclick="toPay('+obj.id+','+obj.real_price
				+')">支付</button><button class="btn ml20" style="background:#5d5547;" onclick="operOrder(\'close\','+obj.id+')">取消订单</button>';
	}
	//交易关闭
	else if(orderState == 'CLOSED'){
		stateObj.desc = '交易关闭';
		stateObj.btn = '<button class="btn lorgbtn " onclick="toDepthHome()">重新购买</button>' + btn;
	}
	//交易成功
	else if(orderState == 'PAY_OK'){
		stateObj.desc = '交易成功';
		stateObj.btn = btn;
		var now = new Date();
		//若当前登录人未评论过，才出现评论按钮
		if(obj.is_evaluate == 1){
			//出行当天，评价按钮出现
			if(now.format("yyyy-MM-dd") >= startTime){
				stateObj.btn = '<button class="btn lorgbtn" onclick="toEvaluate(${depthOrder.id})">评价</button>'+btn;
			}
		}
		now.setDate(now.getDate()+1); 
		//在出行时间的前两天，退款按钮才可见，前一天消失
		if(now.format("yyyy-MM-dd") <= startTime){
			stateObj.btn = '<button class="btn lorgbtn" onclick="toRefund(${depthOrder.id})">退款</button>'+btn;
		}
	}
	//退款中
	else if(orderState == 'REFUNDING'){
		stateObj.desc = '退款中';
		stateObj.btn = btn;
	}
	//退款完成
	else if(orderState == 'REFUNDED'){
		stateObj.desc = '退款完成';
		stateObj.btn = btn;
	}
	//退款失败
	else if(orderState == 'REFUNDING_FAIL'){
		stateObj.desc = '退款失败';
		stateObj.btn = '<button class="btn lorgbtn" onclick="toRefund(${depthOrder.id})">退款</button>'+btn;
	}
	return stateObj;
}

//跳转至深度游列表页
function toDepthHome(){
	location.href = "<%=basePath %>pc/depth/home";
}

//删除或取消订单
function operOrder(oper,orderId){
	var tip = "";
	if(oper == 'delete'){
		tip = "删除";
	}else if(oper == 'close'){
		tip = "取消";
	}
	popMesConfirm("确定"+tip+"该订单吗？",function(){
		$.post('<%=basePath %>pc/user/order/operOrder', {'oper':oper,'orderId':orderId} , function(res) {
			if(res.status == 'success'){
				//doSearch();
				location.href = "<%=basePath %>pc/user/order/depthList";
			}else{
				popMesTip("系统忙，请稍后重试");
			}
		});
	});
}

//跳转至评价页面
function toEvaluate(orderId){
	location.href = "<%=basePath %>pc/user/order/evaluate?orderId="+orderId;
}

//跳转到支付页面
function toPay(orderId, realPrice){
	var json = {
		"orderId" : orderId,
		"orderType" : "depth",
		"realPrice" : realPrice
	};
	subWebForm("<%=basePath %>allowAccess/orders/toPay",json);
}

Date.prototype.format = function(format) {
    var date = {
           "M+": this.getMonth() + 1,
           "d+": this.getDate(),
           "h+": this.getHours(),
           "m+": this.getMinutes(),
           "s+": this.getSeconds(),
           "q+": Math.floor((this.getMonth() + 3) / 3),
           "S+": this.getMilliseconds()
    };
    if (/(y+)/i.test(format)) {
           format = format.replace(RegExp.$1, (this.getFullYear() + '').substr(4 - RegExp.$1.length));
    }
    for (var k in date) {
           if (new RegExp("(" + k + ")").test(format)) {
                  format = format.replace(RegExp.$1, RegExp.$1.length == 1
                         ? date[k] : ("00" + date[k]).substr(("" + date[k]).length));
           }
    }
    return format;
}

//王冠中更新

function toRefund(orderId){
	location.href = "<%=basePath %>pc/user/order/refund/"+orderId;
	/* var json = {
		"orderId" : orderId,
		"orderType" : "depth",
	};
	subWebForm("pc/user/order/refund",json); */
}


</script>
</html>
