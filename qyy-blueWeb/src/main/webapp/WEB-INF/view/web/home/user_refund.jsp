<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transition al.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../../../../static/inc_web.jsp" %>
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv = "X-UA-Compatible" content = "IE=edge,chrome=1 " /><meta charset="utf-8"> 
<title>订单管理-申请退款</title>
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
				<li ><a href="pc/depth/home">主题深度游</a></li>
				<li class="active">
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
			<div class="breadcrumb">当前位置：<a href="pc/home">首页</a><a href="pc/user/order/depthList">订单管理</a>
			<a href="pc/user/order/depthList">旅游</a><a href="pc/user/order/depthList">主题深度游/租车/包车/班车/快旅拼车</a>
			<a href="">订单详情</a><span>退款</span></div>
			<div class="whitebg pb20" style="box-shadow: 0 1px 2px #ddd;">
				<div class="f16 borderbs1 pd20">申请退款</div>
				<div class="refund-cont">
					<h4 class="orangeh4">退款信息</h4>
					<form id="form">
					<input type="hidden" name="formId" value="${orderId }">
					<div class="info pd20">
						<p class="mb20"><label><span class="red f12">* </span>真实姓名</label><input type="text" id="personName" name="personName" notNull="请输入真实姓名"/></p>
<!-- 						<p class="mb20"><label><span class="red f12">* </span>退款银行名称</label><input type="text" id="bankName" name="bankName" notNull="请输入退款银行名称"/></p>
 -->						<div class="fitemwrap">
								<label><span class="item-title"><span class="red f12">* </span>退款银行名称</span></label>
								<div class="form-item select-item mr10" style="width: 200px;margin-left: -86px;">
									<span class="select-text">中国建设银行</span>
									<i class="iicon i-select"></i>
									<select name="bankName" id="bankName">
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
						<p class="mb10"><label><span class="red f12">* </span>退款银行帐号</label><input type="text" id="bankNo" name="bankNo" notNull="请输入退款银行账号"/></p>
						<p class="red f12 mb10">注意：为避免影响您的退款，请务必保证以上信息正确。审核成功后退款将在7个工作日内退到您的银行卡账户</p>
					</div>
					<h4 class="orangeh4">退款原因</h4>
					<div class="pd20">
						<p class="mb10"><span class="iicon checkbox mr10 checked"></span><span class="f16 grey">不想去了</span>
						<input type="hidden" name="reason" value="不想去了">
						</p>
						<p class="mb10"><span class="iicon checkbox mr10"></span><span class="f16 grey">家中有事</span>
						<input type="hidden" value="家中有事">
						</p>
						<p class="other rel">
							<span class="iicon checkbox mr10" style="vertical-align:top;"></span><span class="f16 grey" style="vertical-align:top;">其他</span>
							<textarea maxlength="20"></textarea>
							<span class="limit abs">20字</span>
						</p>
					</div>
					</form>
					<div class="tc mt20">
						<button class="btn lorgbtn" onclick="save()">提交</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
</div>
<script type="text/javascript" src="static/web/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="static/js/jquery.tips.js"></script>
<script type="text/javascript" src="static/web/js/base.js"></script>
<script type="text/javascript">
$(function(){
	selfDefineFormBtn();
	HorizontalList();
	
	//复选框单选事件
	$("div.pd20 .checkbox").click(function(){
		$("div.pd20 .checkbox").removeClass("checked");
		$("div.pd20 .checkbox").removeAttr("name");
		$(this).addClass("checked");
		$(this).attr("name","reason");
	});
	
	//银行卡键盘按下事件
	$('#bankNo').keyup(function(){  
        var value = $(this).val().replace(/\s/g,'').replace(/(\d{4})(?=\d)/g,"$1 ");
        value=value.replace(/\D/g,'');
        $(this).val(value);  
    });  
	
	$("#bankName").change();
});

//保存
function save(){
	var flag = true;
	//验证不为空
	$("#form [notNull]").each(function(){
		if(!checkField(this.value)){
			valTips(this.id, $(this).attr("notNull"));
			flag = false;
		}
	});
	//验证银行卡号格式
	var bankNo = $("#bankNo").val().replace(/\s+/g,"");
	if(!checkBankNo($("#bankName").val(), bankNo)){
		valTips('bankNo', '请填写正确的银行卡号.');
		flag = false;
	}
	/* if(!checkField(bankNo, new RegExp('^(\\d{16}|\\d{19})$'))){
		valTips('bankNo', '请填写正确的银行卡号.');
		flag = false;
	} */
	//提交订单
	if(flag){
		$.post('<%=basePath %>pc/user/order/saveRefund',$("#form").serialize(),function(res){
			if(res.status == 'success'){
				popMesTip("申请退款成功",function(){
					location.href = "pc/user/order/depthList";
				});
			}else if(res.status == 'error'){
				popMesTip("申请退款失败");
			}else{
				popMesTip("系统忙，请稍后重试");
			}
		});
	}
}
</script>
</body>
</html>
