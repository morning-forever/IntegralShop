<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transition al.dtd"><%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../../static/inc_web.jsp" %>
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv = "X-UA-Compatible" content = "IE=edge,chrome=1 " /><meta charset="utf-8"> 
<title>发起拼车</title>
<!-- 日期时间控件 -->
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
			<div class="breadcrumb">当前位置：<a href="">首页</a><a href="">快旅漫游</a><a href="">快旅拼车</a><span>提交订单</span></div>
			<div class="whitebg pb20">				
				<div class="pd20">
					<div class="f18 bold borderbs1 pl10 pb20">我要拼车</div>
					<h4 class="orangeh4">出行信息</h4>					
					<div class="form_box mt10 type2">
						<span class="inline f12 grey"><span class="red f12">* </span>出发时间</span>
						<div class="form-item inline mr20" style="width:186px;">
							<i class="iicon i-date"></i>
							<input class="datetime form-control" id="poolStartTime" value="${detail.startTime }" readonly type="text" />
						</div>
					</div>
					<div class="fitemwrap" id="fromCitys">
						<span class="item-title">出发地</span>
						<div class="form-item select-item mr10" style="width:186px;">
							<span class="select-text">${detail.startCityName }</span>
							<i class="iicon i-select"></i>
							<select name="fromCity" id="fromCity">
							</select>
						</div>
						
						<div class="form-item select-item haspopbox" style="width:160px;">
							<span class="select-text">${detail.startStore }</span>
							<i class="iicon i-select"></i>
							<div class="popbox large r-pos"  id="fromC">
								<i class="iicon i-close"></i>
								<h4>所有门店</h4>
								<div id="county" class="spanwrap" style="border-bottom: 1px solid #ffb199;margin: 0 0 5 0;padding: 0 0 5 0;">
									<span class="current">区/县</span>
								</div>
								<input type="hidden" name="fromAddrId" value="${detail.startAddrId }" id="fromAddrId" />
								<div id="stroge" class="spanwrap showvalue">
									<span class="current">门店</span>
								</div>
								<div id="detail" class="desc lh2">
									地址：贵阳龙暴动机场长途换成站内（国内到达11号门右手边电梯至负  一楼，沿长途换乘站指示牌到达换乘站内）<br/>
	    							电话：0987-3564885<br/>
	    							营业时间：00：00-24：00
								</div>
							</div>
						</div>
					</div>
					
					<div class="fitemwrap clearfix" id="toCitys">
						<span class="item-title">目的地</span>
						<div class="form-item select-item mr10" style="width:186px;">
							<span class="select-text">${detail.endCityName } </span>
							<i class="iicon i-select"></i>
							<select name="toCity" id="toCity">
							</select>
						</div>
						<div class="form-item select-item haspopbox" style="width:160px;">
							<span class="select-text">${detail.endStore }</span>
							<i class="iicon i-select"></i>
							<div class="popbox large r-pos"  id="fromT">
								<i class="iicon i-close"></i>
								<h4>所有门店</h4>
								<div id="county" class="spanwrap" style="border-bottom: 1px solid #ffb199;margin: 0 0 5 0;padding: 0 0 5 0;">
									<span class="current">区/县</span>
								</div>
								<input type="hidden" value="${detail.endAddrId }" name="toAddrId" id="toAddrId" />
								<div id="stroge" class="spanwrap showvalue">
									<span class="current">门店</span>
								</div>
								<div id="detail" class="desc lh2">
									地址：贵阳龙暴动机场长途换成站内（国内到达11号门右手边电梯至负  一楼，沿长途换乘站指示牌到达换乘站内）<br/>
	    							电话：0987-3564885<br/>
	    							营业时间：00：00-24：00
								</div>
							</div>
						</div>
					</div>
									
					<h4 class="orangeh4">发起人信息</h4>
					<div class="form_box mt10 type2">
						<span class="inline f12 grey"><span class="red f12">* </span>姓名</span>
						<div class="form-item inline mr20" style="width:186px;">
							<input type="text" id="publishName" name="publishName" />
						</div>
						<span class="inline f12 grey"><span class="red f12">* </span>电话：</span>
						<div class="form-item inline mr20" style="width:186px;">
							<input type="text" placeholder="接收本次订单信息" id="publishPhone" name="publishPhone" />
						</div>
					</div>
					<div class="form_box type2">
						<span class="inline f12 grey"><span class="red f12">* </span>证件类型</span>
						<div class="form-item select-item inline" style="width:186px;">
							<span class="select-text">身份证</span>
							<i class="iicon i-select"></i>
							<select name="cardType" id="cardType">
								<option value="身份证">身份证</option>
								<option value="护照">护照</option>
								<option value="驾照">驾照</option>
							</select>
						</div>
						<span class="inline f12 grey"><span class="red f12">* </span>证件号码</span>
						<div class="form-item inline mr20" style="width:186px; margin-right:20px;">
							<input type="text" id="cardNo" name="cardNo"  />
						</div>
					</div>
					<div class="form_box type2">
						<span class="inline f12 grey"><span class="red f12">* </span>银行名称</span>
						<div class="longer inline mr20">
							<!-- <input type="text" id="bankName" name="bankName"  /> -->
							<select name="bankName" id="bankName" style="width: 467px;height: 40px;border: 1px solid #dedede">
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
							</select>
						</div>
					</div>
					<div class="form_box mb10 type2">
						<span class="inline f12 grey"><span class="red f12">* </span>银行帐号</span>
						<div class="form-item longer inline mr20">
							<input type="text" id="bankNo" name="bankNo"  />
						</div>
					</div>
					<p class="red f12 mb10 borderttype2 pt10">您取车时需核对以上信息，请认真填写！</p>
					<h4 class="orangeh4 mb20">拼车备注</h4>
					<div class="textarea_wrap">
						<textarea id="remark" name="remark" class="textarea" cols="30" rows="10"></textarea>
					</div>					
					<div class="pb20 pt20 tr lh2">
						<span class="f16 mr20">总价</span><span class="lorange"><span class="f18">￥</span><span class="bold f30"><fmt:formatNumber value="${detail.totalPrice }" maxFractionDigits="0" /></span></span><br/>
						<span class="f16 grey">最低价格：<fmt:formatNumber value="${detail.minPrice }" maxFractionDigits="0" />元</span><br/>
						<span class="f16 grey">最高价格：<span id="money"><fmt:formatNumber value="${detail.maxPrice }" maxFractionDigits="0" /></span>元</span>					
					</div>
					<div class="tr pt20">
						<input class="text mr10" id="vcode" name="vcode" type="text" placeholder="请输入验证码后提交" />
						<img id="vcodeImg" class="mr20 vm" src="static/web/img/code.jpg" height="32" width="96" alt=""><span onclick="loadVcode();" class="underline pointer lorange mr20">刷新</span>
						<button class="btn lorgbtn long ml10" style="vertical-align:bottom;" id="submitOrder">发布并提交订单</button>
					</div>	
				</div>
					
			</div>
		</div>
						
	</div>

	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	
</div>

<!-- 日期时间控件 -->
<script type="text/javascript" src="static/web/js/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="static/web/js/bootstrap-datetimepicker.js"></script>

<script type="text/javascript" src="static/web/js/base.js"></script>
<script type="text/javascript">
var orderData = orderData | {};
var startCityId = '${detail.startCityId}';
var endCityId = '${detail.endCityId}';

var loadVcode = function(){
	$("#vcodeImg").attr({"src":'admin/login?op=vcode&vt='+(new Date()).getTime()});
};
$(function(){
	loadVcode();
	selfDefineFormBtn();
	HorizontalList();
	
	/* $('.datetime').datetimepicker({
		autoclose:1,
		format:"yyyy-mm-dd hh:ii",
		//minView: 2,
		todayBtn: true
	}); */
	
	/* $('.datetime').change(function(){
		window.location.href='pc/cart/home';
	}); */
	$("#fromCity").change(function(){
		window.location.href='pc/cart/home';
	});
	
	//$(".popbox .spanwrap span").bind('click',function(){return false;});
	$(".form-item .select-text").bind('click',function(){return false;});
	$(".fitemwrap .haspopbox").bind('click',function(){return false;});
	$(".haspopbox .i-select").bind('click',function(){return false;});
	$(".fitemwrap .haspopbox").bind('click',function(){$("#fromC").hide();$("#fromT").hide();return false;});
	
});


$(document).ready(function(){
	//初始化开始城市
	var fromCitysDiv = $("#fromCitys");
	var toCitysDiv = $("#toCitys");
	initC(fromCitysDiv,toCitysDiv);
	var fromCity = fromCitysDiv.find("select:eq(0)");
	var toCity = toCitysDiv.find("select:eq(0)");
	fromCity.attr({onchange:"changeCity(this)"});
	$.post("<%=basePath %>pc/cart/pool/fromCitys",{},function(req){
		fromCity.empty();
		fromCity.append('<option value="0" >------请选择------</option>');
		var list = req.fromCitys;
		for(var i in list){
			var item = '<option value="'+list[i].id+'" val="'+list[i].name+'">'+list[i].name+'</option>';
			fromCity.append(item);
		}
	},"JSON");
	
	$("#submitOrder").click(function(){
		var isOk = confirm("请确定输入无误，点击确定提交订单.");
		if(isOk){
			var checks = checkForms();
			if(typeof(checks) == 'boolean'){
				return ;
			}
			$.post('<%=basePath %>pc/cart/pool/submitOrder',orderData,function(req){
				if("success" == req.status){
					alert('提交订单成功，点击确定去支付.');
					debugger
					var json = {
						"orderId":req.data.orderId,
						"orderType":"carpool",
						"realPrice":$("#money").text()
					};
					subWebForm("<%=basePath %>allowAccess/orders/toPay",json);
				}else{
					alert("输入有误，请检查后重试.");
				}
			},"JSON");
		}
	});
});

var checkForms = function(){
	if(!checkField($("#poolStartTime").val())){
		valTips("startTime","时间输入有误.");
		return false;
	}	
	
	if(!checkField($("#fromAddrId").val()) && $("#fromAddrId").val() != 0){
		valTips("fromAddrId","出发地点有误.");
		return false;
	}
	
	if(!checkField($("#toAddrId").val()) && $("#toAddrId").val() != 0){
		valTips("fromAddrId","到达地点有误.");
		return false;
	}
	
	if(!checkField($("#publishName").val())){
		valTips("publishName","发布人名字有误.");
		return false;
	}
	
	if(!checkField($("#publishPhone").val(),new RegExp("^\\d{3}-\\d{8}|\\d{4}-\\d{7}|\\d{4}-\\d{4}-\\d{2}|\\d{11}$"))){
		valTips("publishPhone","发布人电话有误.");
		return false;
	}
	
	var cardType = $("#cardType").val();
	var cardNo = $("#cardNo").val();
	if('身份证'==cardType){
		if(!checkField(cardNo, 10, 64, new RegExp("^(^\\d{15}$)|(^\\d{18}$)|(^\\d{17}(\\d|X|x)$)$"))){
			valTips('cardNo', '请提供有效的身份证.');
			return false;
		}
	}else if('护照'==cardType){
		 if(!checkField(cardNo, 5, 64, new RegExp("^(^P\\d{7}$)|(^G\\d{8}$)|(^S\\d{7,8}$)|(^D\\d+$)|(^1[4,5]\\d{7}$)$"))){
			valTips('cardNo', '请提供有效的护照.');
			return false;
		}
	}else{
		if(!checkField(cardNo, 10, 64, new RegExp("^(^\\d{15}$)|(^\\d{18}$)|(^\\d{17}(\\d|X|x)$)$"))){
			valTips('cardNo', '请提供有效的驾照.');
			return false;
		}
	}
	
	if(!checkField($("#bankName").val())){
		valTips("bankName","请选择银行卡类型.");
		return false;
	}
	
	var bankNo = $("#bankNo").val().replace(/\s+/g,"");
	if(!checkBankNo($("#bankName").val(), bankNo)){
		valTips("bankNo","银行账号有误.");
		return false;
	}
	
	orderData = {
		"code":$("#vcode").val(),
		'startTime': $("#poolStartTime").val(),
		'startAddrId': $("#fromAddrId").val(),
		'endAddrsId': $("#toAddrId").val(),
		'publishName': $("#publishName").val(),
		'publishPhone': $("#publishPhone").val(),
		'publishCardType': $("#cardType").val(),
		'publishCard': $("#cardNo").val(),
		'bankName': $("#bankName").val(),
		'bankCard': $("#bankNo").val(),
		'remark': $("#remark").val(),
		'startCityId':startCityId,
		'endCityId':endCityId
	};
	
	return 0;
};

var initC = function(fromCitysDiv,toCitysDiv){
	fromCitysDiv.find("#county").html('暂无');
	fromCitysDiv.find("#stroge").html('暂无');
	fromCitysDiv.find("#detail").html('暂无');
	toCitysDiv.find("#county").html('暂无');
	toCitysDiv.find("#stroge").html('暂无');
	toCitysDiv.find("#detail").html('暂无');
};
$(".datetimepicker-days").css({"display":"none"});
$("div[class^='datetimepicker-']").hide();
</script>
</body>
</html>