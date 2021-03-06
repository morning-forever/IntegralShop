﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transition al.dtd"><%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../../static/inc_web.jsp"%>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv = "X-UA-Compatible" content = "IE=edge,chrome=1 " /><meta charset="utf-8"> 
<title>提交订单-包车</title>
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
				<li >
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
		<div class="content">
			<div class="breadcrumb">当前位置：<a href="pc/home">首页</a><a href="pc/cart/home">快旅出行</a><a href="pc/cart/wrap/list">快旅包车</a><span>提交订单</span></div>
			<div class="whitebg pb20">
				<div class="detail_wrap clearfix">
					<div class="f18 bold borderbs1 pl10 pb20">基本信息</div>
				    <div class="fl detail_l"> 						
						<img src="${carWrap.picUrl }" width="454" height="256" />						
				    </div>
					<div class="fr detail_r rel" style="margin-top:30px;"><%-- ${carWrap.brand }${carWrap.sys }/${carWrap.carType }/${carWrap.car_configure } --%>
						<h3 class="detail-title">${carWrap.brand }/乘坐${carWrap.seating }人</h3>
						<div class="paramitem lesspace">
							<span class="carparam">
								<i class="i-icon1"></i>品牌：<span>${carWrap.brand }</span>
							</span>
						</div>
						<div class="paramitem lesspace">
							<span class="carparam">
								<i class="i-icon3"></i>年代：<span>${carWrap.car_year }</span>
							</span>
						</div>
						<div class="paramitem lesspace">
							<span class="carparam">
								<i class="i-icon5"></i>座位数：<span>${carWrap.seating }</span>
							</span>
						</div>
					</div>
				</div>
				<div class="pd20">
					<h4 class="orangeh4">包车出车信息<a href="pc/cart/wrap/list" class="abs"><i class="iicon i-edit" style="vertical-align:middle;"></i>修改</a></h4>
					<form id="wrapOrderForm">
					
					<input type="hidden" name="startTime" value="${cartWrapOrder.startTime }">
					<input type="hidden" name="endTime" value="${cartWrapOrder.endTime }">
					<input type="hidden" name="fromCityId" value="${cartWrapOrder.fromCityId }">
					<input type="hidden" name="fromAddrDetail" value="${cartWrapOrder.fromAddrDetail }">
					<input type="hidden" name="carId" value="${carWrap.id }">
					<input type="hidden" name="goodsCount" value="${cartWrapOrder.wrapNum }">
					<input type="hidden" name="realPrice" value="">
					<input type="hidden" name="isSafe" value="0">
					<input type="hidden" name="safePrice" value="">
					<input type="hidden" name="dayPrice" value="">
					
					<div class="paramitem lesspace mt20">
						<span class="carparam">
							<i class="i-icon26"></i>包车数量：<span>${cartWrapOrder.wrapNum }</span>
						</span>
						<span class="carparam">
							<i class="i-icon23"></i>出发时间：<span>${cartWrapOrder.startTime }</span>
						</span>
						<span class="carparam">
							<i class="i-icon23"></i>结束时间：<span>${cartWrapOrder.endTime }</span>
						</span>
					</div>
					<c:forEach items="${routeList }" var="route" varStatus="status">
						<div class="paramitem lesspace">
							
							<input type="hidden" name="endAddrId" value="${route.endAddrId }">
							<input type="hidden" name="rank" value="${status.count }">
							<c:choose>
								<c:when test="${status.index == 0 }">
									<span class="carparam">
										<i class="i-icon21"></i>出发地：<span>${cartWrapOrder.fromCityName }&nbsp;&nbsp;${cartWrapOrder.fromAddrDetail }</span>
										<input type="hidden" name="startAddrId" value="0">
									</span>
								</c:when>
								<c:otherwise>
									<span class="carparam">
										<i class="i-icon21"></i>出发地：<span>${route.startAddr }</span>
										<input type="hidden" name="startAddrId" value="${route.startAddrId }">
									</span>
								</c:otherwise>
							</c:choose>
							<span class="carparam">
								<i class="i-icon22"></i>目的地：<span>${route.endAddr }</span>
							</span>
						</div>
					</c:forEach>
					<h4 class="orangeh4">包车人信息</h4>
					
					<div class="form_box mt10 mb10 type2">
						<span class="inline f12 grey"><span class="red f12">* </span>姓名</span>
						<div class="form-item inline mr20" style="width:186px;">
							<input type="text" id="personName" name="personName" placeholder="请填写姓名" notNull="请填写姓名" value=""/>
						</div>
						<span class="inline f12 grey"><span class="red f12">* </span>电话：</span>
						<div class="form-item inline mr20" style="width:186px;">
							<input type="text" id="personPhone" name="personPhone" placeholder="请填写电话" notNull="请填写电话" value="${webUser.phone }"/>
						</div>
					</div>
					<h4 class="orangeh4">费用明细</h4>
					<div class="clearfix pt20 pb20 borderbs1">
					
						<span class="lorange fr inline pt20"><span class="grey mr10" id="wrapPrice"> xx元/辆 X xx辆=</span>￥<span class="f24" id="wrapPriceSum">xx</span></span>
						<span class="grey">包车费用</span>
						<!-- 可翻动列表 -->
						<div class="scroll_wrap rel">
							<span class="scroll_left iicon"></span>
							<span class="scroll_right iicon"></span>
							<div class="inner_wrap rel">
								<ul class="inner_list clearfix">
									<c:forEach items="${datePriceList }" var="datePrice">
										<li>
											<%-- <fmt:formatDate value="${datePrice.dt }" pattern="MM月dd日 EEEE" /> --%>
											<span class="initDate">${datePrice.dt  }</span>
											<Br />
											<span class="lorange">¥ <span class="f18">${datePrice.price }</span></span>					
										</li>
									</c:forEach>
								</ul>
							</div>
						</div>
					</div>
					<div class="clearfix pt20 pb20 mb20 borderbs1">
						<div class="fr"><span class="grey mr10"> ${webCarSafe.price } 元/天 X ${dayCount}天=</span>
						<span class="lorange">￥<span class="f24"><c:out value="${webCarSafe.price*dayCount }"></c:out></span></span></div>
						<span class="iicon checkbox checked mr10" id="isSafe"></span><span class="grey">保险（可选）</span><span class="tipinfowrap"><i class="iicon i-i ml10"></i><div class="tipbox">保险说明：${webCarSafe.remark } <i class="iicon i-arrow"></i></div></span>
					</div>					
					<div class="pb20">						
						<div class="fr"><span class="lorange"><span class="f18">￥</span><span class="f24">0</span></span></div>
						<span class="grey">手续费</span>						
					</div>
					<div class="pb20 pt20 borderttype2">
						<div class="fr"><span class="f16 mr10 grey9">订单总价</span><span class="lorange"><span class="f18">￥</span><span class="bold f30" id="orderPriceSum">2137</span></span></div>
						<span class="iicon checkbox mr10" id="isInvoice"></span><span class="grey9">是否需要发票（费用结算后为您寄出）</span>						
					</div>
					<div id="invoiceInfo" style="display: none;">
						<h4 class="orangeh4">发票信息</h4>
						<div class="form_box mt10 type2">
							<span class="inline f12 grey"><span class="red f12">* </span>发票抬头</span>
							<div class="form-item longer inline mr20">
								<input type="text" id="title" name="title" placeholder="请填写发票抬头(单位/个人)" notNull="发票抬头不能为空"/>
							</div>
						</div>
						<div class="form_box type2">
							<span class="inline f12 grey"><span class="red f12">* </span>收件人</span>
							<div class="form-item longer inline mr20">
								<input type="text" id="receiver" name="receiver" placeholder="请填写收件人" notNull="请填写收件人"/>
							</div>
						</div>
						<div class="form_box type2">
							<span class="inline f12 grey"><span class="red f12">* </span>电话号码</span>
							<div class="form-item longer inline mr20">
								<input type="text" id="phone" name="phone" placeholder="请填写电话号码" notNull="请填写电话号码"/>
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
								<!-- <select id="county" name="addrId" style="width: 110px;">
									<option value="">---请选择---</option>
								</select> -->
								<select name="addrId" id="county" notNull="请填写邮寄省市区位置">
								</select>
							</div>
						</div>
						<div class="form_box type2">
							<span class="inline f12 grey"><span class="red f12">* </span></span>
							<div class="form-item longer inline mr20">
								<input type="text" id="addrDetail" name="addrDetail" placeholder="请填写发票邮寄具体地址"  notNull="请填写发票邮寄具体地址" />
							</div>						
						</div>
						<div class="form_box type2">
							<span class="inline f12 grey"><span class="red f12">* </span></span>
							<div class="form-item longer inline mr20">
								<input type="text" id="postCode" name="postCode" placeholder="请填写邮政编码"  notNull="请填写邮政编码"/>
							</div>						
						</div>	
					</div>
					<div class="tr pt20">
						<input class="text mr10" type="text" id="code" placeholder="请输入验证码后提交" />
						<img class="mr20 vm" id="codeImg" src="static/web/img/code.jpg" height="32" width="96" alt="">
						<span class="underline pointer lorange mr20">刷新</span>
						<button class="btn lorgbtn ml10" style="vertical-align:bottom;" type="button" onclick="submitForm()">提交订单</button>
					</div>	
					</form>				
				</div>
				<div class="remarkbox">
					<h5>包车规则</h5>
					<p>${webCarRule.depict }</p>
				</div>
				<div class="remarkbox">
					<h5>退改规则</h5>
					<p>${webCarRule.backDepict }</p>
				</div>
				<div class="remarkbox">
					<h5>超时计费</h5>
					<p>${webCarRule.timeoutDepict }</p>
				</div>
				<div class="remarkbox">
					<h5>温馨提示</h5>
					<p>${webCarRule.reminder }</p>
				</div>		
			</div>
		</div>
						
	</div>

	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
</div>


<!-- <script type="text/javascript" src="static/js/target/frame-target.js"></script> -->
<script type="text/javascript" src="static/web/js/base.js"></script>
<script type="text/javascript">
$(function(){
	selfDefineFormBtn();
	HorizontalList();
	
	var wrapNum = ${cartWrapOrder.wrapNum };//包车数量
	var safePrice = ${webCarSafe.price };//保险价格
	var dayCount = ${dayCount};//包车天数
	var priceCountPerCar = 0;//每辆车的价格总价
	var dayPrice="";
	$(".inner_list span span").each(function(){
		priceCountPerCar += parseFloat($(this).text());
		dayPrice+=$(this).text()+",";
	});
	$("#wrapPrice").text(priceCountPerCar+"元/辆 X "+wrapNum+"辆=");//1辆包车费用
	$("#wrapPriceSum").text(priceCountPerCar.mul(wrapNum));//多辆车包车费用
	var orderPriceSum = priceCountPerCar.mul(wrapNum) .add( safePrice.mul(dayCount)) .add( 0);
	$("#orderPriceSum").text(orderPriceSum);//不加手续费的费用
	//给订单总价赋值，提交订单时用
	$("input[name=realPrice]").val(orderPriceSum);
	$("input[name=safePrice]").val(safePrice.mul(dayCount));
	$("input[name=dayPrice]").val(dayPrice);
	
	//是否需要保险
	$("#isSafe").click(function(){
		if($(this).hasClass("checked")){
			$("#orderPriceSum").text(orderPriceSum);
			$("input[name=isSafe]").val(0);
			$("input[name=safePrice]").val(safePrice.mul(dayCount));
			$("input[name=realPrice]").val(orderPriceSum);
		}else{
			$("#orderPriceSum").text(orderPriceSum .sub( safePrice.mul(dayCount)));
			$("input[name=realPrice]").val(orderPriceSum .sub( safePrice.mul(dayCount)));
			$("input[name=safePrice]").val(0);
			$("input[name=isSafe]").val(1);
		}
	});
	
	//是否需要发票
	$("#isInvoice").click(function(){
		if($(this).hasClass("checked")){
			$("#invoiceInfo").show();
		}else{
			$("#invoiceInfo").hide();
		}
	});
	
	//初始化form表单不能提交
	$("form").bind("submit",function(){
		return false;
	});
	
	changeCode();
	//绑定刷新按钮改变验证码
	$("span.underline").bind("click",changeCode);
	$(".initDate").each(function(){
		var timestamp=parseInt($(this).html())*1000;
		var date=new Date();
		date.setTime(timestamp);
		var str=(date.getMonth()+1)+"月"+date.getDate()+"日  星期"+(date.getDay()+1);
		$(this).html(str);
	});
});

//提交表单
function submitForm(){
	var j = 0;
	$("#personName,#personPhone").each(function(){
		if($(this).val().trim() == ""){
			valTips(this.id, $(this).attr("notNull"));
			$("#"+this.id).focus();
			j++;
			return false;
		}else{
			if(this.id == "personPhone"){
				if(!checkField($(this).val().trim(),/^[1][34578][0-9]{9}$/)){
					valTips("personPhone","请输入正确的手机号码");
					$("#"+this.id).focus();
					j++;
					return false;
				}
			}
		}
	});
	if(j != 0){
		return;
	}
	//如果勾选了需要发票，则下列信息不能为空
	if($("#isInvoice").hasClass("checked")){
		var i = 0;
		$("#invoiceInfo input[notNull]").each(function(){
			if($(this).val().trim() == ""){
				valTips(this.id, $(this).attr("notNull"));
				$("#"+this.id).focus();
				i++;
				return false;
			}else{
				if(this.id == "phone"){
					if(!checkField($(this).val().trim(),/^[1][34578][0-9]{9}$/)){
						valTips("phone","请输入正确的手机号码");
						$("#"+this.id).focus();
						i++;
						return false;	
					}
				}
				if(this.id == "postCode"){
					if(!checkField($(this).val().trim(),/^[1-9]\d{5}$/)){
						valTips("postCode","请输入正确的邮政编码");
						$("#"+this.id).focus();
						i++;
						return false;	
					}
				}
				
			}
		});
		if(i != 0){
			return;
		}
		if(null == $("#county").val()){
			valTips("county", $("#county").attr("notNull"));
			$("#county").focus();
			return ;
		}
	}
	
	//验证码校验
	var o = serializeObject($("#wrapOrderForm"));
	$.post("<%=basePath %>pc/cart/wrap/validateCode",{code:$("#code").val()},function(res){
		if(res.status == 'success'){
			subWebForm("<%=basePath %>pc/cart/wrap/order/pay",o);
		}else if("v_code_error" == res.status){
			$("#code").tips({
				side : 1,
				msg : "验证码输入有误",
				bg : '#AE81FF',
				time : 15
			});
			$("#code").focus();
			changeCode();//刷新验证码
		}
	});
}
//序列化表单，把name相同的值以逗号拼接
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

function genTimestamp() {
	var time = new Date();
	return time.getTime();
}

//刷新验证码
function changeCode() {
	$("#codeImg").attr("src", "<%=basePath %>admin/login?op=vcode&t=" + genTimestamp());
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
</script>
</body>
</html>