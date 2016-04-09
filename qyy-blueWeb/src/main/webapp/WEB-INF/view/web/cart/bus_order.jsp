﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transition al.dtd"><%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../../static/inc_web.jsp" %>
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv = "X-UA-Compatible" content = "IE=edge,chrome=1 " /><meta charset="utf-8"> 
<title>提交订单-班车</title>
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
			<div class="breadcrumb">当前位置：<a href="pc/home">首页</a><a href="pc/cart/home">快旅出行</a><a href="pc/cart/bus/list">快旅班车</a><span>提交订单</span></div>
			<div class="whitebg pb20">
				<div class="detail_wrap clearfix">
					<div class="f18 bold borderbs1 pl10 pb20">基本信息</div>
				    <div class="fl detail_l"> 						
						<img src="${bus.pic_url }" width="454" height="256" />						
				    </div>
					<div class="fr detail_r rel" style="margin-top:30px;">
						<h3 class="detail-title">${bus.from_addr }-${bus.to_addr }</h3>
						<div class="paramitem lesspace">
							<span class="carparam">
								<i class="i-icon1"></i>品牌：<span>${bus.brand }</span>
							</span>
						</div>
						<div class="paramitem lesspace">
							<span class="carparam">
								<i class="i-icon3"></i>年代：<span>${bus.car_year }</span>
							</span>
						</div>
						<div class="paramitem lesspace">
							<span class="carparam">
								<i class="i-icon5"></i>座位数：<span>${bus.seating }</span><span class="ml20">余：<span class="f20" style="color:#ffb126">${bus.seating-bus.use_count}</span>位</span>
							</span>
						</div>
					</div>
				</div>
				<div class="pd20">
					<h4 class="orangeh4">班车出车信息<a href="pc/cart/bus/list" class="abs"><i class="iicon i-edit" style="vertical-align:middle;"></i>修改</a></h4>
					<div class="paramitem lesspace mt10">
						<span class="carparam">
							<i class="i-icon23"></i>发车时间：<span><span class="from_date"></span>${bus.from_time }</span>
						</span>
					</div>
					<div class="paramitem lesspace">
						<span class="carparam">
							<i class="i-icon23"></i>预计到达时间：<span><!-- <span class="from_date"></span> -->${bus.to_time }</span>
						</span>						
					</div>
					<div class="paramitem lesspace">
						<span class="carparam">
							<i class="i-icon24"></i>发车地点：<span>${bus.from_store }</span>
						</span>
					</div>
					<div class="paramitem lesspace mb10">
						<span class="carparam">
							<i class="i-icon25"></i>目的地：<span>${bus.to_store }</span>
						</span>
					</div>
					<h4 class="orangeh4">乘坐人信息</h4>
					<div name="people">
						<div class="form_box mt10 type2">
							<span class="inline f12 grey"><span class="red f12">* </span>姓名</span>
							<div class="form-item inline mr20" style="width:186px;">
								<input type="text" name="name"/>
							</div>
							<span class="inline f12 grey"><span class="red f12">* </span>电话：</span>
							<div class="form-item inline mr20" style="width:186px;">
								<input type="text" name="phone"/>
							</div>
							<div class="form-item select-item inline" style="width:85px; margin-right:20px;">
								<span class="select-text">成人</span>
								<i class="iicon i-select"></i>
								<select name="personType" onchange="changePersonType(this);">
									<option value="adult">成人</option>
									<option value="children">儿童</option>
								</select>
							</div>
							<i class="addbtn iicon" onclick="addPeople(this);"></i>
						</div>
						<div class="form_box mb10 type2">
							<span class="inline f12 grey"><span class="red f12">* </span>证件类型</span>
							<div class="form-item select-item inline" style="width:186px;">
								<span class="select-text">身份证</span>
								<i class="iicon i-select"></i>
								<select name="cardType">
									<option value="身份证">身份证</option>
									<option value="护照">护照</option>
									<option value="驾照">驾照</option>
								</select>
							</div>
							<span class="inline f12 grey"><span class="red f12">* </span>证件号码</span>
							<div class="form-item inline mr20" style="width:186px; margin-right:20px;">
								<input type="text" name="cardNo"/>
							</div>
						</div>
					</div>
					<p class="red f12 mb10 borderttype2 pt10">您取车时需核对以上信息，请认真填写！</p>
					<h4 class="orangeh4">费用明细</h4>
					<div class="clearfix pt20 pb20 borderbs1">
						<div class="fr"><span class="grey mr10"> ${bus.price }元/人 X <span id="priceCount">1</span>人=</span><span class="lorange">￥<span class="f24" id="priceMoney">${bus.price}</span></span></div>
						<span class="grey">乘坐金额</span>
					</div>
					<div class="clearfix pt20 pb20 mb20 borderbs1">
						<div class="fr"><span class="grey mr10"> ${bus.safe_price} 元 X <span id="safeCount">1</span>人=</span><span class="lorange">￥<span class="f24" id="safeMoney">${bus.safe_price}</span></span></div>
						<span class="iicon checkbox checked mr10" id="safeOK"></span><span class="grey">保险（可选）</span><span class="tipinfowrap"><i class="iicon i-i ml10"></i><div class="tipbox">保险说明：${bus.remark} <i class="iicon i-arrow"></i></div></span>
					</div>
					
					<div class="pb20 tr">
						<span class="f16 mr10 grey9">订单总价</span><span class="lorange"><span class="f18">￥</span><span class="bold f30" id="money">${bus.price+bus.safe_price }</span></span>					
					</div>
					<div class="tr pt20">
						<input class="text mr10" id="code" type="text" placeholder="请输入验证码后提交" /><img class="mr20 vm" id="codeImg" src="img/code.jpg" height="32" width="96" alt=""><span class="underline pointer lorange mr20" onclick="changeCode();">刷新</span>
						<button class="btn lorgbtn ml10" onclick="submitOrder();" style="vertical-align:bottom;">提交订单</button>
					</div>					
				</div>
				<div class="remarkbox">
					<h5>班车规则</h5>
					<p>${bus.depict }</p>
				</div>
				<div class="remarkbox">
					<h5>退改规则</h5>
					<p>${bus.backDepict }</p>
				</div>
				<div class="remarkbox">
					<h5>温馨提示</h5>
					<p>${bus.reminder }</p>
				</div>		
			</div>
		</div>
						
	</div>
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
</div>


<script type="text/javascript" src="static/web/js/base.js"></script>
<script type="text/javascript">
var card='<div class="form_box mb10 type2">'+
'							<span class="inline f12 grey"><span class="red f12">* </span>证件类型</span>'+
'							<div class="form-item select-item inline" style="width:186px;">'+
'								<span class="select-text">身份证</span>'+
'								<i class="iicon i-select"></i>'+
'								<select name="cardType">'+
'									<option value="身份证">身份证</option>'+
'									<option value="护照">护照</option>'+
'									<option value="驾照">驾照</option>'+
'								</select>'+
'							</div>'+
'							<span class="inline f12 grey"><span class="red f12">* </span>证件号码</span>'+
'							<div class="form-item inline mr20" style="width:186px; margin-right:20px;">'+
'								<input type="text" name="cardNo"/>'+
'							</div>'+
'						</div>';

var price = '${bus.price}';
var safePrice = '${bus.safe_price}';
var busId = '${bus.id}';
var useCount = '${bus.use_count}';

var from_time="${bus.from_time }";

var peopleCount = 1;

$(document).ready(function(){
		
	selfDefineFormBtn();
	changeCode();
	
	$("#safeOK").click(function(){setValue();});
	
	$("div[name=people]").find("select[name=personType]").val("adult");
	$("div[name=people]").find("select[name=cardType]").val("身份证");
	
	var timeArr=from_time.split(":");
	var fromDate=new Date();
	var nowDate=new Date();
	fromDate.setHours(timeArr[0]);
	fromDate.setMinutes(timeArr[1]);
	if((fromDate.getTime()-30*60*1000)<nowDate.getTime()){
		nowDate.setTime(nowDate.getTime()+24*60*60*1000);
		$(".from_date").html(getTimeTxt(nowDate.getTime(),10)+" ");
	}else{
		$(".from_date").html(getTimeTxt(nowDate.getTime(),10)+" ");
	}
	
});

function submitOrder(){
	
	var flag = 1;
	
	var json = '{"data":[';
	
	$("div[name=people]").each(function(i,c){
		var $this = $(this);
		var personName = $this.find("input[name=name]").val();
		var personPhone = $this.find("input[name=phone]").val();
		var cardType = $this.find("select[name=cardType]").val();
		var cardNo = $this.find("input[name=cardNo]").val();
		var personType = $this.find("select[name=personType]").val();
		
		if(cardType == null){
			cardType = "";
			cardNo = "";
		}
		
		if(personName == null || personName == ''){
			valTips($this.find("input[name=name]"),"请输入姓名！");
			flag = 2;
		}
		
		if(!checkField(personPhone, 10, 64, new RegExp("^\\d{3}-\\d{8}|\\d{4}-\\d{7}|\\d{4}-\\d{4}-\\d{2}|\\d{11}$"))){
			valTips($this.find("input[name=phone]"),"请提供有效联系电话！");
			flag = 2;
		}
		
		if(personType == "adult"){
			if(cardType == "身份证"){
				if(!checkField(cardNo, 10, 64, new RegExp("^(^\\d{15}$)|(^\\d{18}$)|(^\\d{17}(\\d|X|x)$)$"))){
					valTips($this.find("input[name=cardNo]"), '请提供有效的身份证.');
					flag = 2;
				}
			}else if(cardType == "护照"){
				if(!checkField(cardNo, 5, 64, new RegExp("^(^P\\d{7}$)|(^G\\d{8}$)|(^S\\d{7,8}$)|(^D\\d+$)|(^1[4,5]\\d{7}$)$"))){
					valTips($this.find("input[name=cardNo]"), '请提供有效的护照.');
					flag = 2;
				}
			}else if(cardType == "驾照"){
				if(!checkField(cardNo, 10, 64, new RegExp("^(^\\d{15}$)|(^\\d{18}$)|(^\\d{17}(\\d|X|x)$)$"))){
					valTips($this.find("input[name=cardNo]"), '请提供有效的驾照.');
					flag = 2;
				}
			}
		}
		
		json+='{"personName":"'+personName+'","personPhone":"'+personPhone+'","cardType":"'+cardType+'","cardNo":"'+cardNo+'","personType":"'+personType+'"},';
		
	});
	
	json = json.substring(0,json.length-1);
	
	json+=']}';
	
	var isSafe = 0;
	if(!$("#safeOK").hasClass("checked")){
		isSafe = 1;
	}
	
	if(flag == 1){
		
		$.ajax({
			url:"<%=basePath %>pc/cart/bus/order/submit",
			type:"post",
			data:{
				"param":json,
				"goodsId":busId,
				"goodsCount":peopleCount,
				"isSafe":isSafe,
				"code":$("#code").val()
			},
			success:function(req){
				
				var status=req.status;

				if(status=='v_code_error'){
					alert("验证码错误");
					changeCode();
				}else if(status =="remainnot"){
					alert("剩余座位不足！");
					changeCode();
				}else if(status =="unlogin"){
					location.href="pc/login?op=toLogin"
				}else if(status=="error"){
					alert("服务器忙，请稍后重试");
					changeCode();
				}else if(status=="success"){
					alert("提交成功");
					
					var json = {
						"orderId":req.orderId,
						"orderType":"bus",
						"realPrice":$("#money").text()
					};
					subWebForm("<%=basePath %>allowAccess/orders/toPay",json);
				}
			}
		});
	}
}

function changePersonType(temp){
	var $this = $(temp);
	var $personType = $this.parent();
	
	var personType = $this.val();
	
	if("children" == personType){
		$personType.parent().parent().children("div:eq(1)").remove();
	}
	if("adult" == personType){
		$personType.parent().parent().append(card);
	}
}

function addPeople(temp){
	var $this = $(temp);
	var clone = $this.parent().parent().clone();
	var personType = $this.parent().find("select").val();
	
	if(!clone.has(".resbtn").length){
		clone.find(".form_box:eq(0)").append('<i class="resbtn iicon" onclick="resProple(this);"></i>');
	}
	clone.find("select[name=personType]").val(personType);
	clone.find("select[name=cardType]").val("身份证");
	
	clone.find("select").bind("click",function(){
		var _val = $(this).find("option:selected").text();
		$(this).parent(".select-item").find(".select-text").text(_val);
	});
	
	clone.find("input").val("");
	peopleCount++;
	setValue();
	$this.parent().parent().after(clone);
	
}
function resProple(temp){
	var $this = $(temp);
	$this.parent().parent().remove();
	peopleCount--;
	setValue();
}

function setValue(){
	var money = parseInt(safePrice).add(price).mul(peopleCount);
	if(!$("#safeOK").hasClass("checked")){
		money = peopleCount.mul(price);
	}
	$("#priceCount").text(peopleCount);
	$("#safeCount").text(peopleCount);
	$("#priceMoney").text(peopleCount*price);
	$("#safeMoney").text(peopleCount*safePrice);
	$("#money").text(money);
}

function genTimestamp() {
	var time = new Date();
	return time.getTime();
}
function changeCode() {
	$("#codeImg").attr("src", "<%=basePath %>admin/login?op=vcode&t=" + genTimestamp());
}
</script>
</body>
</html>