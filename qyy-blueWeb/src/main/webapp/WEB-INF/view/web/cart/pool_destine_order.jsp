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
			<div class="breadcrumb">当前位置：<a href="pc/home">首页</a><a href="pc/cart/home">快旅出行</a><a href="pc/cart/pool/list">快旅拼车</a><span>提交订单</span></div>
			<div class="whitebg pb20">
				<div class="detail_wrap clearfix">
				    <!-- <div class="fl detail_l"> 						
						<img src="static/web/img/car_bigimg.jpg" width="454" height="256" />						
				    </div> -->
					<div class="fr detail_r rel" style="margin-top:70px; margin-right: 24%;">
						<h3 class="detail-title">${detail.startCity }-${detail.endCity }拼车</h3>
						<div class="pt20">										
							<span class="orange">¥<span class="f24 orange bold">${detail.minPrice }-${detail.maxPrice }</span></span>	
						</div>
					</div>
				</div>
				<div class="pd20">
					<h4 class="orangeh4">拼车信息<a href="javascript:;" class="abs" onclick="modInfo();"><i class="iicon i-edit" style="vertical-align:middle;"></i>修改</a></h4>
					<p class="pt20">实拼人数：<span class="grey9">${detail.poolDss } 位</span></p>
					<div class="paramitem" style="padding-bottom:10px;">
						<span class="carparam w320">
							<i class="i-icon23"></i>发车时间：<span>${detail.startTime }</span>
						</span>
						<span class="carparam">
							<i class="i-icon24"></i>发车地点：<span>${detail.stAddrDetail }</span>
						</span>
					</div>
					<div class="paramitem mb10" style="padding-top:10px;">
						<span class="carparam w320">
							<i class="i-icon23"></i>截止时间：<span>${detail.closeTime }</span>
						</span>
						<span class="carparam">
							<i class="i-icon25"></i>目的地：<span>${detail.edAddrDetail }</span>
						</span>
					</div>
					<h4 class="orangeh4">拼车乘坐人信息</h4>
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
					<h4 class="orangeh4">退款人信息</h4>
					<div class="form_box mt10 type2">
						<span class="inline f12 grey"><span class="red f12">* </span>银行名称</span>
						<div class="longer inline mr20">
							<!-- <input type="text" id="bankName" /> -->
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
							<input type="text" id="bankCard" />
						</div>
					</div>				
					<h4 class="orangeh4">发起人信息</h4>
					<div class="paramitem mt10 mb10">
						<span class="carparam">
							姓名：<span>${detail.publishName }</span>
						</span>
						<span class="carparam">
							手机号：<span>${detail.publishPhone }</span>
						</span>
					</div>
					<h4 class="orangeh4">费用明细</h4>
					<div class="clearfix pt20 pb20 borderbs1">
						<span class="lorange fr">￥<span class="f24" id="priceMoney">${detail.maxPrice }</span></span>
						<span class="grey">乘坐金额</span>
					</div>
					
					<div class="clearfix pt20 pb20 mb20 borderbs1">
						<div class="fr"><span class="grey mr10"> ${safe.price} 元 X <span id="safeCount">1</span>人=</span><span class="lorange">￥<span class="f24" id="safeMoney">${safe.price}</span></span></div>
						<span id="safeOK" class="iicon checkbox checked mr10"></span><span class="grey">保险（可选）</span><span class="tipinfowrap"><i class="iicon i-i ml10"></i><div class="tipbox">保险说明：${safe.remark } <i class="iicon i-arrow"></i></div></span>
					</div>
					
					<div class="pb20">
						<div class="fr"><span class="f16 mr10 grey9">订单总价</span><span class="lorange"><span class="f18">￥</span><span class="bold f30" id="money">${safe.price+detail.maxPrice}</span></span></div>
						<span class="iicon checkbox mr10" id="checkInvoice" onclick="checkInvoice(this);"></span><span class="grey9">是否需要发票（费用结算后为您寄出）</span>						
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
					
					<div class="tr pt20">
						<input class="text mr10" id="vcode" name="vcode" type="text" placeholder="请输入验证码后提交" />
						<img id="vcodeImg" class="mr20 vm" src="static/web/img/code.jpg" height="32" width="96" alt=""><span onclick="loadVcode();" class="underline pointer lorange mr20">刷新</span>
						<button onclick="submitOrder();" class="btn lorgbtn ml10" style="vertical-align:bottom;">提交订单</button>
					</div>					
				</div>
				<div class="remarkbox">
					<h5>拼车规则</h5>
					<p>${rule.depict }</p>
				</div>
				<div class="remarkbox">
					<h5>退改规则</h5>
					<p>${rule.backDepict }</p>
				</div>
				<div class="remarkbox">
					<h5>温馨提示</h5>
					<p>${rule.reminder }</p>
				</div>		
			</div>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
</div>

<!-- 日期时间控件 -->
<!-- <script type="text/javascript" src="static/web/js/bootstrap/js/bootstrap.min.js"></script> -->
<!-- <script type="text/javascript" src="static/web/js/bootstrap-datetimepicker.js"></script> -->
<script type="text/javascript" src="static/web/js/base.js"></script>
<script type="text/javascript">
$(function(){
	$("#invoice").hide();
	selfDefineFormBtn();
	$("#safeOK").click(function(){setValue();});
	loadVcode();
	$("#safeOK").click(function(){setValue();});
	
});

$(document).ready(function(){
	
});


var loadVcode = function(){
	$("#vcodeImg").attr({"src":'<%=basePath %>admin/login?op=vcode&vt='+(new Date()).getTime()});
};

var modInfo = function(){
	window.location.href="<%=basePath %>pc/cart/pool/list";
}

var checkInvoice = function(obj){
	if(obj.className.indexOf('checked')>0)
		$("#invoice").hide();
	else
		$("#invoice").show();
}

var peopleCount = 1;
var card='<div class="form_box mb10 type2">'+
	'<span class="inline f12 grey"><span class="red f12">* </span>证件类型</span>'+
	'<div class="form-item select-item inline" style="width:186px;">'+
	'<span class="select-text">身份证</span>'+
	'<i class="iicon i-select"></i>'+
	'<select name="cardType">'+
	'<option value="身份证">身份证</option>'+
	'<option value="护照">护照</option>'+
	'<option value="驾照">驾照</option>'+
	'</select>'+
	'</div>'+
	'<span class="inline f12 grey"><span class="red f12">* </span>证件号码</span>'+
	'<div class="form-item inline mr20" style="width:186px; margin-right:20px;">'+
	'<input type="text" name="cardNo"/>'+
	'</div>'+
	'</div>';

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

function genTimestamp() {
	var time = new Date();
	return time.getTime();
}
function changeCode() {
	$("#codeImg").attr("src", "<%=basePath %>admin/login?op=vcode&t=" + genTimestamp());
}

var price = '${detail.maxPrice}';
var safePrice = '${safe.price}';
var peopleCount = 1;
var poolId = '${detail.id}';

function setValue(){
	/* var money = peopleCount*safePrice+peopleCount*price;
	if(!$("#safeOK").hasClass("checked")){
		money = peopleCount*price;
	} */
	var money = parseInt(price).add(safePrice).mul(peopleCount);
	if(!$("#safeOK").hasClass("checked")){
		money = peopleCount.mul(price);
	}
	$("#priceCount").text(peopleCount);
	$("#safeCount").text(peopleCount);
	$("#priceMoney").text(peopleCount*price);
	$("#safeMoney").text(peopleCount*safePrice);
	$("#money").text(money);
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
			valTips($this.find("input[name=name]"),"请输入姓名.");
			flag = 2;
		}
		
		if(!checkField(personPhone, 10, 64, new RegExp("^\\d{3}-\\d{8}|\\d{4}-\\d{7}|\\d{4}-\\d{4}-\\d{2}|\\d{11}$"))){
			valTips($this.find("input[name=phone]"),"请提供有效联系电话.");
			flag = 2;
		}
		
		if(personType == "adult"){
			if(cardType == "身份证"){
				if(cardNo == null || cardNo == ""){
					valTips($this.find("input[name=cardNo]"),"请提供有效的身份证.");
					flag = 2;
				}else if(!checkField(cardNo, 10, 64, new RegExp("^(^\\d{15}$)|(^\\d{18}$)|(^\\d{17}(\\d|X|x)$)$"))){
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
	var isInvoice = 0;
	if(!$("#checkInvoice").hasClass("checked")){
		isInvoice = 1;
	}
	if(isInvoice==0){
		var title = $("#title").val();
		if(!checkField(title)){
			valTips($("#title"), '请填写正确的抬头.');
			flag = 2;
		}
		var receiver = $("#receiver").val();
		if(!checkField(receiver)){
			valTips($("#receiver"), '请输入正确的收件人.');
			flag = 2;
		}
		var phone = $("#phone").val();
		if(!checkField(phone)){
			valTips($("#phone"), '请输入正确的收件人电话.');
			flag = 2;
		}
		var addrId = $("#county").val();
		if(!checkField(addrId)){
			valTips($("#county"), '请选择正确的收件人地址.');
			flag = 2;
		}
		var addrDetial = $("#addrDetial").val();
		if(!checkField(addrDetial)){
			valTips($("#addrDetial"), '请填写的收件人详细地址.');
			flag = 2;
		}
		var postCode = $("#postCode").val();
		if(!checkField(postCode)){
			valTips($($("#postCode")), '请填写的收件人的邮编.');
			flag = 2;
		}
	}
	
	var bankCard = $("#bankCard").val();
	var bankName = $("#bankName").val();
	if(!checkField(bankName)){
		valTips($($("#bankName")), '请选择退款银行名称.');
		flag = 2;
	}
	
	if(!checkBankNo(bankName, bankCard)){
		valTips($($("#bankCard")), '请填写正确的银行卡号.');
		flag = 2;
	}
	
	if(flag == 1){
		var isOk = confirm("您确认填写信息无误，点击确定提交订单。");
		if(isOk){
			$.ajax({
				url:"<%=basePath %>pc/cart/pool/submitOrder",
				type:"post",
				data:{
					"id":poolId,
					"param":json,
					"goodsId":poolId,
					"goodsCount":peopleCount,
					"realPrice":$("#money").text(),
					"isSafe":isSafe,
					"safePrice":$("#safeMoney").text(),
					"code":$("#vcode").val(),
					'isInvoice':isInvoice,
					'title': $("#title").val(),
					'receiver':$("#receiver").val(),
					'phone':$("#phone").val(),
					'addrId':$("#county").val(),
					'addrDetial':$("#addrDetial").val(),
					'postCode':$("#postCode").val(),
					'bankCard':bankCard,
					'bankName':bankName
				},
				success:function(req){
					var status=req.status;
					if(status=='v_code_error'){
						alert("验证码错误");
						changeCode();
					}else if(status=="fail"){
						alert("输入的信息有误，请修改后重试");
					}else if(status=="seat_no"){
						alert("本次拼车人数已达到上限，请重新尝试其他拼车");
					}else if(status=="pool_no"){
						alert("当前时间内不允许提交拼车订单");
					}else if(status=="404"){
						alert("当前拼车丢失或者不存在");
					}else if(status=="success"){
						alert("提交成功");
						
						var json = {
							"orderId":req.data.orderId,
							"orderType":"carpool",
							"realPrice":$("#money").text()
						};
						subWebForm("<%=basePath %>allowAccess/orders/toPay",json);
					}
				}
			});
		}
	}
}
</script>
</body>
</html>