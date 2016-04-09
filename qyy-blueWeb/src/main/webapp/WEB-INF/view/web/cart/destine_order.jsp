<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transition al.dtd"><%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../../static/inc_web.jsp" %>
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv = "X-UA-Compatible" content = "IE=edge,chrome=1 " /><meta charset="utf-8"> 
<title>提交订单-租车</title>
<link rel="stylesheet" href="static/web/css/common.css" />
<link rel="stylesheet" href="static/web/css/inner.style.css" />
<link rel="stylesheet" href="static/web/css/quick.travel.css" />
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
				<li class="active">
					<a href="pc/cart/home">快旅出行</a>
					<div class="level2_nav menu_cart">
						<div class="oneline">
							<a href="pc/cart/rent/list">快旅租车</a>
							<a href="pc/cart/wrap/list">快旅包车</a>
							<a href="pc/cart/bus/list">快旅班车</a>
							<a href="pc/cart/pool/list">快旅拼车</a>
						</div>
					</div>
				</li>
				<li><a href="pc/depth/home">主题深度游</a></li>
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
	<form action="">
		<input type="hidden" name="goodsId" id="goodsId" value="${car.id }">
		<input type="hidden" name="getStoreId" id="getStoreId" value="${getStore.id }">
		<input type="hidden" name="loseStoreId" id="loseStoreId" value="${loseStore.id }">
		<input type="hidden" name="startDateStr" id="startDateStr" value="${startTime }">
		<input type="hidden" name="endDateStr" id="endDateStr" value="${endTime }">
		<input type="hidden" name="safePrice" id="safePrice" value="${safeCount }">
		<input type="hidden" name="realPrice" id="price" value="${safeCount+countPrice }">
	<!-- page content -->
	<div class="content_wrap pb90">
		<div class="content">
			<div class="breadcrumb">当前位置：<a href="pc/home">首页</a><a href="pc/cart/home">快旅出行</a><a href="pc/cart/rent/list">快旅租车</a><span>提交订单</span></div>
			<div class="whitebg pb20">
				<div class="detail_wrap clearfix">
					<div class="f18 bold borderbs1 pl10 pb20">基本信息</div>
				    <div class="fl detail_l"> 						
						<img src="${car.pic_url }" width="454" height="256" />						
				    </div>
					<div class="fr detail_r rel" style="margin-top:30px;">
						<h3 class="detail-title">${car.brand }${car.sys }/${car.car_type }/${car.output }${car.gearbox }</h3>
						<div class="paramitem lesspace">
							<span class="carparam">
								<i class="i-icon1"></i>品牌：<span>${car.brand }</span>
							</span>
						</div>
						<div class="paramitem lesspace">
							<span class="carparam">
								<i class="i-icon3"></i>年代：<span>${car.car_year }</span>
							</span>
						</div>
						<div class="paramitem lesspace">
							<span class="carparam">
								<i class="i-icon5"></i>座位数：<span>${car.seating }</span>
							</span>
						</div>
					</div>
				</div>
				<div class="pd20">
					<h4 class="orangeh4">租车信息<a href="pc/cart/rent/list" class="abs"><i class="iicon i-edit" style="vertical-align:middle;"></i>修改</a></h4>					
					<div class="paramitem lesspace mt20">
						<span class="carparam w320">
							<i class="i-icon21"></i>出发地：<span>${getStore.addr_detail }</span>
						</span>
						<span class="carparam">
							<i class="i-icon22"></i>目的地：<span>${loseStore.addr_detail }</span>
						</span>
					</div>
					<div class="paramitem lesspace mb20">
						<span class="carparam w320">
							<i class="i-icon23"></i>出发时间：<span>${startTime }</span>
						</span>
						<span class="carparam">
							<i class="i-icon23"></i>结束时间：<span>${endTime }</span>
						</span>
					</div>					
					<h4 class="orangeh4">租车人信息</h4>
					<div class="form_box mt10 type2">
						<span class="inline f12 grey"><span class="red f12">* </span>姓名</span>
						<div class="form-item inline mr20" style="width:186px;">
							<input type="text" name="personName" id="personName" placeholder="租车人姓名" tips="请输入租车人姓名"/>
						</div>
						<span class="inline f12 grey"><span class="red f12">* </span>电话：</span>
						<div class="form-item inline mr20" style="width:186px;">
							<input type="text" name="personPhone" id="personPhone" placeholder="租车人电话"  tips="请输入租车人电话"/>
						</div>
					</div>
					<div class="form_box mb10 type2">
						<span class="inline f12 grey"><span class="red f12">* </span>证件类型</span>
						<div class="form-item select-item inline" style="width:186px;">
							<span class="select-text">身份证</span>
							<i class="iicon i-select"></i>
							<select name="cardType" id="cardType">
								<option value="身份证">身份证</option>
								<option value="驾照">驾照</option>
								<option value="护照">护 照</option>
							</select>
						</div>
						<span class="inline f12 grey"><span class="red f12">* </span>证件号码</span>
						<div class="form-item inline mr20" style="width:186px; margin-right:20px;">
							<input type="text" name="cardNo" id="cardNo"  tips="请输入证件号码"/>
						</div>
					</div>
					<p class="red f12 mb10 borderttype2 pt10">您取车时需核对以上信息，请认真填写！</p>
					<h4 class="orangeh4">费用明细</h4>
					<div class="clearfix pt20 pb20 borderbs1">
						<span class="lorange fr inline pt20">￥<span class="f24">${countPrice }</span></span>
						<span class="grey">车辆租金</span>
						<!-- 可翻动列表 -->
						<div class="scroll_wrap rel">
							<span class="scroll_left iicon"></span>
							<span class="scroll_right iicon"></span>
							<div class="inner_wrap rel" style="width: auto;">
								<ul class="inner_list clearfix" style="margin: 0px">
								<c:forEach var="price" items="${priceList }">
									<li>
										${price.date }<Br />
										<span class="lorange">¥ <span class="f18">${price.price }</span></span>					
									</li>
								</c:forEach>
								</ul>
							</div>
						</div>
					</div>
					<div class="clearfix pt20 pb20 mb20 borderbs1">
						<div class="fr"><span class="grey mr10"> ${safe.price } 元 X ${days }天=</span><span class="lorange">￥<span class="f24">${safeCount }</span></span></div>
						<span class="grey">基本保险（必选）</span><span class="tipinfowrap"><i class="iicon i-i ml10"></i><div class="tipbox" style="width:470px;">必购产品：如车辆租赁期间出险，保险理赔范围内损失，客户仅需承担1500
元以内的车辆损失部分，不用承担其他损失。<br />
承保范围：车辆损失险（1500元以内的损失由客户方承担）；第三者责任险
20万元；车上人员责任险（驾驶员）5万元；全车盗抢险；玻璃单独爆裂险；
自燃损失险。<br />
本服务按天计费，超过4小时以上按1天计费，超时4小时以内不另计费。   <i class="iicon i-arrow"></i></div></span>
					</div>					
					<div class="pb20">						
						<div class="fr"><span class="lorange"><span class="f18">￥</span><span class="f24">0</span></span></div>
						<span class="grey">手续费</span>						
					</div>
					<div class="pb20 pt20 borderttype2">						
						<span class="iicon checkbox mr10" onclick="isInvoice()"></span><span class="grey9">是否需要发票（费用结算后为您寄出）</span>						
					</div>		
					<div id="invoice">		
					<h4 class="orangeh4">发票信息</h4>
					<div class="form_box mt10 type2">
						<span class="inline f12 grey"><span class="red f12">* </span>发票抬头</span>
						<div class="form-item longer inline mr20">
							<input type="text" name="title" id="title" placeholder="请填写发票抬头"  tips="请输入发票抬头"/>
						</div>
					</div>
					<div class="form_box type2">
						<span class="inline f12 grey"><span class="red f12">* </span>收件人</span>
						<div class="form-item longer inline mr20">
							<input type="text" name="receiver" id="receiver" placeholder="请填写发票邮寄收件人"  tips="请输入发票邮寄收件人" />
						</div>
					</div>
					<div class="form_box type2">
						<span class="inline f12 grey"><span class="red f12">* </span>电话号码</span>
						<div class="form-item longer inline mr20">
							<input type="text" name="phone" id="phone" placeholder="请填写发票邮寄收件人电话号码"   tips="请输入收件人电话号码"/>
						</div>
					</div>
					<div class="form_box type2">
						<span class="inline f12 grey"><span class="red f12">* </span>收件地址</span>
						<div class="form-item select-item inline" style="width:186px; margin-right:10px;">
							<span class="select-text">请选择省</span>
							<i class="iicon i-select"></i>
							<select id="province" onchange="getCity()">
								<option value="">请选择</option>
								<c:forEach var="area" items="${areaList }">
									<option value="${area.id }">${area.name }</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-item select-item inline" style="width:186px; margin-right:10px;">
							<span class="select-text">请选择市</span>
							<i class="iicon i-select"></i>
							<select id="city" onchange="getCounty()">
							</select>
						</div>
						<div class="form-item select-item inline" style="width:186px; margin-right:10px;">
							<span class="select-text">请选择区/县</span>
							<i class="iicon i-select"></i>
							<select name="addrId" id="county">
							</select>
						</div>
					</div>
					<div class="form_box type2">
						<span class="inline f12 grey"></span>
						<div class="form-item longer inline mr20">
							<input type="text" name="addrDetial" id="addrDetial" placeholder="请填写发票邮寄具体地址"   tips="请输入发票邮寄具体地址"/>
						</div>						
					</div>
					<div class="form_box type2">
						<span class="inline f12 grey"></span>
						<div class="form-item longer inline mr20">
							<input type="text" name="postCode" id="postCode" placeholder="邮政编码"   tips="请输入邮政编码"/>
						</div>						
					</div>
					</div>	
					<div class="pb20 pt20 tr">
						<span class="f16 mr10 grey9">订单总价</span><span class="lorange"><span class="f18">￥</span><span class="bold f30">${safeCount+countPrice }</span></span>					
					</div>
					<div class="tr pt20">
						<input maxlength="4" name="code" class="text mr10" type="text" placeholder="请输入验证码后提交" /><img class="mr20 vm" id="codeImg" src="static/web/img/code.jpg" height="32" width="96" alt=""><span id="codeRefresh" class="underline pointer lorange mr20">刷新</span>
						<button onclick="doSubmit()" class="btn lorgbtn ml10" style="vertical-align:bottom;">提交订单</button>
					</div>	
				</div>
				<div class="remarkbox">
					<h5>租车规则</h5>
					<p>${rule.depict }</p>
				</div>
				<div class="remarkbox">
					<h5>退改规则</h5>
					<p>${rule.backDepict }</p>
				</div>
				<div class="remarkbox">
					<h5>超时计费</h5>
					<p>${rule.timeoutDepict }</p>
				</div>
				<div class="remarkbox">
					<h5>温馨提示</h5>
					<p>${rule.reminder }</p>
				</div>		
			</div>
		</div>
						
	</div>
	</form>
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
</div>


<script type="text/javascript" src="static/web/js/base.js"></script>
<script type="text/javascript">
$(function(){
	selfDefineFormBtn();
	HorizontalList();
	
	changeCode();
	
	$("#invoice").hide();
	
	$("form").bind("submit",function(){
		return false;
	});
	
	$("#codeRefresh").click(function(){
		$("#codeImg").attr("src", "<%=basePath %>admin/login?op=vcode&t=" + genTimestamp());
	});
	
});

function genTimestamp() {
	var time = new Date();
	return time.getTime();
}

function changeCode() {
	$("#codeImg").attr("src", "<%=basePath %>admin/login?op=vcode&t=" + genTimestamp());
}

//
function isInvoice(){
	if($(".checkbox:first").hasClass("checked")){
		$("#invoice").hide();
	}else{
		$("#invoice").show();
	}
}

function getCity(){
	var id=$("#province").val();
	$.post("<%=basePath %>pc/areaAll/getChildren",{id:id},function(data){
		var list=data.list;
		if(id==1||id==18||id==792||id==2240){//4个直辖市
			$("#city").parents("div:first").hide();
			$("#county").html("");
			$("#county").append('<option value="">请选择</option>');
			for(var i=0;i<list.length;i++){
				$("#county").append('<option value="'+list[i].id+'">'+list[i].name+'</option>');
			}
			$("#county").val("");
			$("#county").prevAll(".select-text").html("请选择区/县");
		}else{
			$("#city").parents("div:first").show();
			$("#city").html("");
			$("#city").append('<option value="">请选择</option>');
			for(var i=0;i<list.length;i++){
				$("#city").append('<option value="'+list[i].id+'">'+list[i].name+'</option>');
			}
			$("#city").val("");
			$("#city").prevAll(".select-text").html("请选择市");
		}
	});
}

function getCounty(){
	var id=$("#city").val();
	$.post("<%=basePath %>pc/areaAll/getChildren",{id:id},function(data){
		var list=data.list;
		$("#county").html("");
		$("#county").append('<option value="">请选择</option>');
		for(var i=0;i<list.length;i++){
			$("#county").append('<option value="'+list[i].id+'">'+list[i].name+'</option>');
		}
		$("#county").val("");
		$("#county").prevAll(".select-text").html("请选择区/县");
	});
}

function doSubmit(){
	var o=serializeObject($("form"));
	var cardNo=$("#cardNo").val();
	if(cardNo.length!=15&&cardNo.length!=18){
		valTips("cardNo", "请输入正确的身份证号");
		return;
	}
	var personPhone=$("#personPhone").val();
	if(!checkPhone(personPhone)){
		valTips("personPhone", "请输入正确的手机号");
		return;
	}
	if(checkData("personName,personPhone,cardNo")){
		return false;
	}
	if($(".checkbox:first").hasClass("checked")){
		o.isInvoice=0;
		if(checkData("title,receiver,phone,addrDetial,postCode")){
			return false
		}
		if($("#county").val()==""||$("#county").val()==null){
			alert("请选择邮寄省市区位置");
			return false;
		}
	}else{
		o.isInvoice=1;
	}
	$.post("<%=basePath %>pc/cart/rent/submitOrder",o,function(data){
		var status=data.status;
		if(status=='v_code_error'){
			alert("验证码错误");
		}else if(status=="error"){
			alert("服务器出错，请稍后重试");
		}else if(status=="success"){
			console.info("跳转待定");
			var json = {
				"orderId":data.orderId,
				"orderType":"carRent",
				"realPrice":$("#price").val()
			};
			subWebForm("<%=basePath %>allowAccess/orders/toPay",json);
		}
	});
}

//验证指定ID的输入框是否为空，ID以逗号分隔
function checkData(ids){
	var idArr=ids.split(",");
	for(var i=0;i<idArr.length;i++){
		if($("#"+idArr[i]).val()==''||$("#"+idArr[i]).val()==null){
			//$("#"+idArr[i]).focus();
			//console.info(idArr[i]);
			//alert($("#"+idArr[i]).attr("tips"));
			valTips(idArr[i], $("#"+idArr[i]).attr("tips"));
			return true;
		}
	}
}

var serializeObject = function(form) {
	var o = {};
	$.each(form.serializeArray(), function(index) {
		if (o[this["name"]]) {
			o[this["name"]] = o[this["name"]] + "," + this["value"];
		} else {
			o[this["name"]] = this["value"];
		}
	});
	return o;
};



</script>
</body>
</html>