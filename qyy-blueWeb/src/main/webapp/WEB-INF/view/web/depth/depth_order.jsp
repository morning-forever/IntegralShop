<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transition al.dtd"><%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../../static/inc_web.jsp" %>
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv = "X-UA-Compatible" content = "IE=edge,chrome=1 " /><meta charset="utf-8"> 
<title>主题深度游-提交订单</title>
<link rel="stylesheet" href="static/web/css/common.css" />
<link rel="stylesheet" href="static/web/css/inner.style.css" />
<link rel="stylesheet" href="static/web/css/topic.deeptravel.css" />
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
	<div class="content_wrap pb90" style="padding-top:25px;">
		<div class="content whitebg">
			<div class="pd20">
				<div class="clearfix mb20">
					<img class="fl mr20" src="${depth.picUrl }" height="113" width="197" alt="">
					<h4 class="f16">${depth.name }</h4>
				</div>	
				<h4 class="orangeh4 mb20">行程信息</h4>				
				<p class="mb10 pl20">
					<span class="grey w100">出发日期: </span><span class="grey9">${inputInfo.startTime }</span>
					<span style="margin-left:120px;" class="grey ml20 w100">同行人数: </span><span class="grey9">${inputInfo.adultNum }成人，${inputInfo.childNum }儿童</span><br />					
				</p>
				<p class="mb20 pl20"><span class="grey w100">出发城市: </span><span class="grey9">${city.name }</span></p>
				<h4 class="orangeh4">个人信息</h4>
				<div class="form_box type2" style="padding:15px;">
					<c:if test="${inputInfo.adultNum > 0 }">
					<c:forEach begin="0" end="${inputInfo.adultNum - 1 }">
					<div class="form_box_inner_section">
						<input type="hidden" name="personType" value="adult">
						<div class="form_box type2">
							<span class="inline grey"><span class="red">* </span>姓名</span>
							<div class="form-item inline mr20" style="width:186px;">
								<input type="text" name="personName" placeholder="请填写真实姓名" />
							</div>
							<span class="inline grey"><span class="red">* </span>电话：</span>
							<div class="form-item inline mr20" style="width:186px;">
								<input type="text" name="personPhone" placeholder="请填写电话" />
							</div>
						</div>
						<div class="form_box type2">
							<span class="inline grey"><span class="red">* </span>证件类型：</span>
							<div class="form-item select-item inline" style="width:186px;">
								<span class="select-text">身份证</span>
								<i class="iicon i-select"></i>
								<select name="cardType" id="">
									<option value="身份证">身份证</option>
									<option value="护照">护照</option>
								</select>
							</div>
							<span class="inline grey"><span class="red">* </span>证件号码：</span>
							<div class="form-item inline mr10" style="width:186px; margin-right:10px;">
								<input type="text" placeholder="" name="cardNo"/>
							</div>
							<span class="inline grey spantag">成人</span>
						</div>
					</div>
					</c:forEach>
					</c:if>
					<c:if test="${inputInfo.childNum > 0 }">
					<c:forEach begin="0" end="${inputInfo.childNum - 1 }">
					<div class="form_box_inner_section">
						<input type="hidden" name="personType" value="children">
						<div class="form_box type2">					
							<span class="inline grey"><span class="red">* </span>姓名</span>
							<div class="form-item inline mr20" style="width:186px;">
								<input type="text" name="personName" placeholder="请填写真实姓名" />
							</div>
							<span class="inline grey spantag">儿童</span>							
						</div>
					</div>		
					</c:forEach>	
					</c:if>	
				</div>
				<p class="red f12 mb10 pl10">请确认以上信息正确无误，若因填写信息错误造成的一切损失由您个人承担  </p>
				<h4 class="orangeh4">联系人信息</h4>
				<div class="form_box" style="margin-bottom:50px;">
					<span class="inline grey"><span class="red">* </span>姓名</span>
					<div class="form-item inline mr20" style="width:186px;">
						<input type="text" id="linkName" placeholder="" />
					</div>
					<span class="inline grey"><span class="red">* </span>手机号：</span>
					<div class="form-item inline mr20" style="width:186px;">
						<input type="text" id="linkPhone" placeholder=" " value="${webUser.phone }"/>
					</div>
				</div>

				<!-- 青铜三星会员以上免验证码  levelId = 4时，级别为青铜三星-->
				<c:if test="${webUser.levelId <= 4 }">
				<div class="tr pb20">
					<input class="text mr10" id="code" type="text" placeholder="请输入验证码后提交" />
					<img class="mr20 vm" id="codeImg" src="static/web/img/code.jpg" height="32" width="96" alt="">
					<span class="underline pointer lorange mr20" onclick="changeCode()">刷新</span>
				</div>
				</c:if>
				<div class="tr pt20"><span class="f16 mr10 grey9">订单总价</span><span class="lorange">
				<span class="f18">￥</span><span class="bold f30 mr20">${inputInfo.realPrice }</span></span>
					<button onclick="submitOrder()" class="btn lorgbtn ml10" style="vertical-align:bottom;">提交订单</button>
				</div>
				
			</div>
					
			
		</div>		
	</div>

	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
</div>

<script type="text/javascript" src="static/web/js/base.js"></script>
<script type="text/javascript">
$(function(){
	selfDefineFormBtn();
	InitPronum();
	previewProDetailImg();
	
	$("[name=cardType]").change();//初始化证件类型下拉框
	
	changeCode();
	//绑定刷新按钮改变验证码
	$("span.underline").bind("click",changeCode);
});

//提交订单
function submitOrder(){
	var flag = true;
	var jsonData = '{"data":[';
	//游客信息，成人和儿童
	$(".form_box_inner_section").each(function(){
		var personName = $(this).find("[name=personName]").val();//姓名
		var personPhone = $(this).find("[name=personPhone]").val();//电话
		var cardType = $(this).find("[name=cardType]").val();//证件类型
		var cardNo = $(this).find("[name=cardNo]").val();//证件号码
		var personType = $(this).find("[name=personType]").val();//游客类型：成人和儿童
		
		if(personName == null || personName == ''){
			valTips($(this).find("[name=personName]"),"请输入姓名！");
			flag = false;
		}
		if(personType == "adult"){
			if(!checkField(personPhone, 10, 64, new RegExp("^[1][34578][0-9]{9}$"))){
				valTips($(this).find("[name=personPhone]"),"请提供有效联系电话！");
				flag = false;
			}
		}
		//如果是成人，则需要验证证件号码，如果是儿童，则不用
		if(personType == "adult"){
			if(cardType == "身份证"){
				if(!checkField(cardNo, 10, 64, new RegExp("^(^\\d{15}$)|(^\\d{18}$)|(^\\d{17}(\\d|X|x)$)$"))){
					valTips($(this).find("[name=cardNo]"), '请提供有效的身份证.');
					flag = false;
				}
			}else if(cardType == "护照"){
				if(!checkField(cardNo, 5, 64, new RegExp("^(^P\\d{7}$)|(^G\\d{8}$)|(^S\\d{7,8}$)|(^D\\d+$)|(^1[4,5]\\d{7}$)$"))){
					valTips($(this).find("[name=cardNo]"), '请提供有效的护照.');
					flag = false;
				}
			}
		}else{
			personPhone = '';
			cardType = '';
			cardNo = '';
		}
		jsonData += '{"personName":"'+personName+'","personPhone":"'+personPhone+'","cardType":"'+cardType+'","cardNo":"'+cardNo+'","personType":"'+personType+'"},';
	});
	
	jsonData = jsonData.substring(0,jsonData.length-1);
	jsonData += ']}';
	
	//联系人信息
	var linkName = $("#linkName").val();
	var linkPhone = $("#linkPhone").val();
	if(linkName == null || linkName == ''){
		valTips("linkName","请输入联系人姓名！");
		flag = false;
	}
	if(linkPhone == null || linkPhone == ''){
		valTips("linkPhone","请输入联系人电话！");
		flag = false;
	}
	
	var json = {
		'goodsId' : "${depth.id}",//深度游id
		'startTime' : "${inputInfo.startTime}",//出发时间
		'adultPrice' : "${depth.adult_price}",//当前成人价
		'childPrice' : "${depth.child_price}",//当前儿童价
		'startAddrId' : "${city.id}",//出发城市id
		'personName' : $("#linkName").val(),//联系人姓名
		'personPhone' : $("#linkPhone").val(),//联系人电话
		'realPrice': "${inputInfo.realPrice }",//订单总价
		'jsonData' : jsonData,//游客信息
		'code' : $("#code").val()//验证码
	};
	
	if(flag){
		$.post("<%=basePath %>pc/depth/submitOrder", json ,function(res){
			if(res.status == 'v_code_error'){
				$("#code").tips({
					side : 1,
					msg : "验证码输入有误",
					bg : '#AE81FF',
					time : 15
				});
				$("#code").focus();
				changeCode();//刷新验证码
			}else if(res.status == 'exception'){
				popMesTip("服务器忙，请稍后重试");
				changeCode();
			}else if(res.status == 'success'){
				var jsonObj = {
					"orderId" : res.orderId,
					"orderType" : "depth",
					"realPrice" : "${inputInfo.realPrice }"
				};
				subWebForm("<%=basePath %>allowAccess/orders/toPay",jsonObj);
			}
		});
	}
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