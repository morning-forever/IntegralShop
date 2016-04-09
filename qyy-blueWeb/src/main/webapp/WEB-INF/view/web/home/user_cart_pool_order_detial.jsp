<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transition al.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../../../static/inc_web.jsp" %>
<html>
<head>
<title>快旅出行-订单详情（租车）</title>
<base href="<%=basePath %>">
<title>订单管理-快旅出行</title>
<link rel="stylesheet" href="static/web/css/common.css" />
<link rel="stylesheet" href="static/web/css/member.css" />
<link rel="stylesheet" href="static/web/css/inner.style.css" />
<link rel="stylesheet" href="static/web/css/quick.travel.css" />
<link rel="stylesheet" type="text/css" href="static/web/css/order.management.css">
<style type="text/css">
.menu_cart{
	width:790px;
	left:100px;
}
.cannel{
	background:#999999;
}

.dinput{
    width: 170px;
	border-bottom: 1px solid #999999;
}
textarea{
	resize: none;
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
				<li>
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
				<li ><a href="pc/depth/home">主题深度游</a></li>
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
			<div class="breadcrumb">当前位置：<a href="pc/home">首页</a><a href="pc/user/order/depthList">订单管理</a><a href="pc/user/order/rentList">快旅出行</a><a href="pc/user/order/rentList?tabIndex=3">拼车</a><span>订单详情</span></div>
			<div class="whitebg pb20">
				<div class="f18 bold borderbs1 grey9 pb20">订单状态：<span class="grey" id="orderType">交易关闭</span></div>
				<div class="order-info pt20 pb20 clearfix">
					<!-- <img src="static/web/img/pic2.jpg" width="197" height="113" class="fl"> -->
					<div class="ml10 fl">
						<p class="f16 dark" style="line-height:113px;">${map.carpool.startStore }-${map.carpool.endStore }拼车</p>
					</div>
					<div class="info-right fr rel">
						<i class="iicon arrow abs"></i>
					</div>
				</div>
				<h4 class="orangeh4">拼车信息</h4>
				<div class="paramitem lesspace mt10">
					<span class="carparam">
						实拼人数：<span>${map.carpool.pool_dss } 位</span>
					</span>
				</div>
				<div class="paramitem lesspace">
					<span class="carparam">
						<i class="i-icon23"></i>发车时间：<span>${map.carpool.start_time }</span>
					</span>
				</div>
				<div class="paramitem lesspace">
					<span class="carparam">
						<i class="i-icon23"></i>截止时间：<span>${map.carpool.end_time }</span>
					</span>						
				</div>
				<div class="paramitem lesspace">
					<span class="carparam">
						<i class="i-icon24"></i>发车地点：<span>${map.carpool.startStore }</span>
					</span>
				</div>
				<div class="paramitem lesspace mb10">
					<span class="carparam">
						<i class="i-icon25"></i>目的地：<span>${map.carpool.endStore }</span>
					</span>
				</div>
				<h4 class="orangeh4">拼车人信息</h4>
				<div class="personal-info spanstyle">
					<ul>
						<c:forEach items="${map.personList }" var="person">
						<li>
							<span class="item">姓名：<span>${person.person_name }</span></span>
							<span class="item">电话：<span>${person.person_phone }</span></span>
							<span class="item">证件类型：<span>${person.card_type }</span></span>
							<span class="item">证件号码：<span>${person.card_no }</span></span>
							<span class="item personType">${person.person_type}</span>
						</li>
						</c:forEach>
					</ul>
				</div>
				<h4 class="orangeh4">费用明细</h4>
				<div class="clearfix pt20 pb20 borderbs1">
					<div class="fr"><span class="lorange">￥<span class="f24 bold" id="carPrice">556</span></span></div>
					<span class="grey">乘坐金额</span>
				</div>
				<div class="clearfix pt20 mb20">
					<div class="fr"><span class="grey mr10" id="safeDetial"> 40 元 X 4人=</span><span class="lorange">￥<span class="f24 bold" id="safePrice">556</span></span></div>
					<span class="grey">保险（可选）</span><span class="tipinfowrap"><i class="iicon i-i ml10"></i><div class="tipbox">保险说明：必购产品：如车辆租赁期间出险，保险理赔范围内损失，客户仅需承担1500
元以内的车辆损失部分，不用承担其他损失。<br />
承保范围：车辆损失险（1500元以内的损失由客户方承担）；第三者责任险
20万元；车上人员责任险（驾驶员）5万元；全车盗抢险；玻璃单独爆裂险；
自燃损失险。<br />
本服务按天计费，超过4小时以上按1天计费，超时4小时以内不另计费。  <i class="iicon i-arrow"></i></div></span>
				</div>
				<c:if test="${map.carpool.is_invoice == 0}">
				<h4 class="orangeh4">发票信息</h4>
				<div class="spanstyle pt20 pb20 pl10">
					<p><span class="item inline" style="width:40%">发票抬头：<span>${map.carpool.invoiceTitle }</span></span><span class="item">收件人：<span>${map.carpool.invoiceReceiver }</span></span></p>
					<p><span class="item inline" style="width:40%">电话号码：<span>${map.carpool.invoicePhone }</span></span><span class="item">收件地址：<span>${map.carpool.invoiceAddr }   ${map.carpool.post_code }</span></span></p>
				</div>
				</c:if>
				<div class="borderttype2 spanstyle pl10 pt20">
					<p><span class="item">订单编号：<span>${map.carpool.order_code }</span></span></p>
					<p id="payId"><span class="item">支付宝单号：<span>${map.carpool.pay_order_id }</span></span></p>
					<p><span class="item">成交时间：<span id="createTime">${map.carpool.create_time.getTime() }</span></span></p>
					
					<div id="refundDiv">
						<p><span class="item">退款时间：<span id="refundTime">${map.carpool.refund_time.getTime() }</span></span></p>
						<p><span class="item">备注：<span>${map.carpool.refund_reamrk }</span></span></p>
						<p><span class="item">真实姓名：<span>${map.carpool.person_name }</span></span></p>
						<p><span class="item">退款银行名称：<span>${map.carpool.bank_name }</span></span></p>
						<p><span class="item">退款银行卡号：<span>${map.carpool.bank_card }</span></span></p>
					</div>
				</div>
				<div class="pb20 pt20 tr">
					<span class="f16 mr10 grey9">合计</span><span class="lorange f16">￥<span class="f30 bold">${map.carpool.real_price }</span></span>
				</div>
				<div class="tc mt20 mb20" id="operationDiv">
					<button class="btn lorgbtn" id="payBtn">支付</button>
					<button class="btn ml20" id="canelBtn" style="background:#5d5547;" >取消订单</button>
					<button class="btn lorgbtn" id="refundBtn">退款</button>
					<button class="btn ml20" id="deleteBtn" style="background:#5d5547;" >删除订单</button>
				</div>
			</div>
		</div>		
	</div>

	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
</div>
<div id="titlepopup" style="display: none;">
<div class="innerdiv pd20 tc">
	<p style="padding:50px 0; color:#333;">smg</p>
	<button class="Btn ok" name="case-ok" >确认</button>
</div>
</div>

<div id="confirmDialog" style="display: none;">
<div class="innerdiv pd20 tc">
	<p style="padding:50px 0; color:#333;">确认删除？</p>
	<button class="Btn ok" name="case-ok">确认</button>
	<button class="Btn" name=".btn-close" onclick="closeConfirmDialog()">取消</button>
</div>
</div>

<div id="refundDialog" style="display: none;">
<div class="innerdiv pd20 tc refundDiv">
	<form action="" id="refundForm">
	<table>
		<tr>
			<th>退款银行名称：</th>
			<td><select name="bank_name" class="dinput">
				<option value="">请选择</option>
				<option value="中国建设银行">中国建设银行</option>
				<option value="中国银行">中国银行</option>
				<option value="中国交通银行">中国交通银行</option>
				<option value="中国工商银行">中国工商银行</option>
				<option value="中国邮政储蓄银行">中国邮政储蓄银行</option>
				<option value="中国招商银行">中国招商银行</option>
				<option value="民生银行">民生银行</option>
				<option value="兴业银行">兴业银行</option>
				<option value="中国农业银行">中国农业银行</option>
				<option value="中信银行">中信银行</option>
				<option value="中国光大银行">中国光大银行</option>
			</select></td>
		</tr>
		<tr>
			<th>退款银行卡号：</th>
			<td><input name="bank_card" class="dinput" onkeyup="checkCarNo(this)"></td>
		</tr>
		<tr>
			<th>退款原因：</th>
			<td><textarea name="reason" style="width: 200px;height: 100px"></textarea></td>
		</tr>
	</table>
	<button class="Btn ok">确认</button>
	<button class="Btn cannel" onclick="closeRefundDialog()">取消</button>
	</form>
</div>
</div>
<script type="text/javascript" src="static/web/js/base.js"></script>
<script type="text/javascript" src="static/web/js/index.js"></script>
<script type="text/javascript">
$(function(){
	
	$("#operationDiv button").hide();
	$("#refundDiv").hide();
	
	
	//初始化租车详细价格
	var startDate=new Date();
	startDate.setTime(parseInt("${map.carpool.start_time.getTime()}"));
	
	//初始化订单状态
	var orderType="${map.carpool.order_state}";
	var orderState="";
	if(orderType=="WAITPAY"){
		orderState="等待付款";
		$("#payBtn").show()
		$("#canelBtn").show()
	}else if(orderType=="PAY_OK"){
		orderState="交易成功";
		if((startDate.getTime()-new Date().getTime())<(1000*60*30)){
			$("#deleteBtn").show();
		}else{
			$("#refundBtn").show();
		}
	}else if(orderType=="CLOSED"){
		orderState="交易关闭";
		$("#orderType").removeClass("grey").addClass("red");
		$("#deleteBtn").show();
	}else if(orderType=="REFUNDING"){
		orderState="退款中";
	}else if(orderType=="REFUNDING_UNPOOL"){
		orderState="退款中-拼单失败";
		$("#refundBtn").show();
	}else if(orderType=="REFUNDING_FAIL"){
		orderState="退款失败";
		$("#refundBtn").show();
		$("#refundDiv").show();
		var time=getTimeTxt(parseInt($("#refundTime").html()),19);
		$("#refundTime").html(time);
	}else if(orderType=="REFUNDED"){
		orderState="退款完成";
		$("#refundDiv").show();
		$("#deleteBtn").show();
		var time=getTimeTxt(parseInt($("#refundTime").html()),19);
		$("#refundTime").html(time);
	}
	$("#orderType").html(orderState);
	
	if("${map.pay_order_id}"==""){
		$("#payId").hide();
	}
	
	//初始化订单价格
	//var day=parseInt("${map.day}");
	var peopleNumber=parseInt("${map.carpool.goods_count}");
	var realPrice=parseFloat("${map.carpool.real_price}");
	var safePrice=parseFloat("${map.carpool.safe_price}");
	var safeDetial=(safePrice/peopleNumber)+" X "+peopleNumber+"人= ";
	var carPriceDetial=((realPrice.sub(safePrice))/peopleNumber)+" X "+peopleNumber+"人= ";
	$("#carPrice").html(realPrice.sub(safePrice));
	$("#safePrice").html(safePrice);
	$("#safeDetial").html(safeDetial);
	$("#carPriceDetial").html(carPriceDetial);
	
	var initStr="createTime".split(",");
	for(var i=0;i<initStr.length;i++){
		var timestamp=parseInt($("#"+initStr[i]).html());
		$("#"+initStr[i]).html(getTimeTxt(timestamp,19));
	}
	
	$(".personType").each(function(){
		var temp=$(this).html();
		if(temp=='adult'){
			$(this).html("成人");
		}else if(temp=='children'){
			$(this).html("儿童");
			console.info($(this).parents("li"));
			$(this).parents("li").find(".item:eq(2)").hide();
			$(this).parents("li").find(".item:eq(3)").hide();
		}
	});


	selfDefineFormBtn();
	var id=parseInt("${map.carpool.id}");
	
	$("#canelBtn").click(function(){
		canleOrder(id);
	});
	$("#payBtn").click(function(){
		payOrder(id,orderType,realPrice);
	});
	$("#refundBtn").click(function(){
		refund(id);
	});
	$("#deleteBtn").click(function(){
		deleteOrder(id);
	});
	$(document).on("click",".ok,.cannel",function(){
		return false;
	})
});


function refund(id,type){
	refundDialog("确定申请退款？");
	$(".refundDiv .ok").one("click",function(){
		doRefund(this,id,type);
	});
}

function doRefund(obj,id,type){
	$(".popup-case .ok").unbind();
	var obj=$(obj);
	var form=obj.parents("form");
	var data=serializeObject(form);
	data.id=id;
	var bankName=form.find("select").val();
	var bankNo=form.find("input").val();
	console.info($(".popup-case:last input"));
	if(bankName==""){
		valTips($(".popup-case:last select"), '请选择银行类型');
		$(".popup-case .ok").bind("click",function(){
			doRefund(this,id,type);
		});
		return;
	}
	if(checkBankNo(bankName, bankNo)){
		$.post("<%=basePath %>pc/user/order/refund",data,function(data){
			console.info(data);
			if(data.status=="success"){
				alertDialog("申请成功");
				closeRefundDialog();
				$(".popup-case .ok").one("click",function(){
					window.location.href="<%=basePath %>pc/user/order/rentList";
				});
			}else if(data.status=="error"){
				alertDialog("退款失败，请确认订单状态");
				$(".popup-case .ok").bind("click",function(){
					doRefund(this,id,type);
				});
			}else{
				alertDialog("服务器异常，请稍后重试");
				$(".popup-case .ok").bind("click",function(){
					doRefund(this,id,type);
				});
			}
		});
	}else{
		valTips($(".popup-case:last input"), '请输入正确的银行卡号');
		$(".popup-case .ok").bind("click",function(){
			doRefund(this,id,type);
		});
	}
}

function canleOrder(id){
	confirmDialog("确定取消？");
	$(".popup-case .ok").one("click",function(){
		doCanleOrder(id);
	});
	
}

function doCanleOrder(id,type){
	$.post("<%=basePath %>pc/user/order/canelOrder",{id:id},function(data){
		if(data.status=="success"){
			alertDialog("取消成功");
			$(".popup-case .ok").one("click",function(){
				alertReload()
			});
		}else if(data.status=="error"){
			alertDialog("取消失败，请确认订单状态");
		}else{
			alertDialog("服务器异常，请稍后重试");
		}
	});
}


function deleteOrder(id){
	confirmDialog("确定删除？");
	$(".popup-case .ok").one("click",function(){
		doDeleteOrder(id);
	});
	
}

function doDeleteOrder(id){
	$.post("<%=basePath %>pc/user/order/deleteOrder",{id:id},function(data){
		if(data.status=="success"){
			alertDialog("删除成功");
			$(".popup-case .ok").one("click",function(){
				window.location.href="<%=basePath %>pc/user/order/rentList"
			});
		}else if(data.status=="error"){
			alertDialog("删除失败，请确认订单状态");
		}else{
			alertDialog("服务器异常，请稍后重试");
		}
	});
}

function payOrder(id,order_type,real_price){
	window.location.href="<%=basePath %>allowAccess/orders/toPay?orderId="+id+"&orderType="+order_type+"&realPrice="+real_price;
}

function alertDialog(str){
	$("#titlepopup p").html(str);
	titleDlg = new dialogBox({
		title : "提示",
		contentHtml : $("#titlepopup").html(),
		popupBoxW : 490,
		closeBtnshow : 0,
		initEvent : function($dom){
		}
	});
	titleDlg.showDlg();
}

function confirmDialog(str){
	$("#confirmDialog p").html(str);
	confirmDlg = new dialogBox({
		title : "提示",
		contentHtml : $("#confirmDialog").html(),
		popupBoxW : 490,
		closeBtnshow : 0,
		initEvent : function($dom){
		}
	});
	confirmDlg.showDlg();
}

function closeConfirmDialog(){
	confirmDlg.hideDlg();
}

function alertReload(){
	window.location.reload();
};

function refundDialog(str){
	$("#refundDialog p").html(str);
	refundDlg = new dialogBox({
		title : "提示",
		contentHtml : $("#refundDialog").html(),
		popupBoxW : 490,
		closeBtnshow : 0,
		initEvent : function($dom){
		}
	});
	refundDlg.showDlg();
}


function closeRefundDialog(){
	refundDlg.hideDlg();
}

function checkCarNo(obj){
	$(obj).val($(obj).val().replace(/\D/g,""));
}
</script>
</body>
</html>