<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transition al.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../../../../static/inc_web.jsp" %>
<html>
<head>
<base href="<%=basePath %>">
<title>订单管理-快旅出行</title>
<link rel="stylesheet" href="static/web/css/common.css" />
<link rel="stylesheet" href="static/web/css/inner.style.css" />
<link rel="stylesheet" href="static/web/css/member.css" />
<link rel="stylesheet" href="static/web/css/personal.center.css" />
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

.subtabs li{
	width: 50%;
}
</style>
</head>
<body>
<table id="Model" style="display: none">
<tr>
	<td colspan="4">
		<div class="clearfix mt10 pl10 pb10">
			<p class="dark fl">
				订单号：<span class="pl20"></span>
				<span class="pl20"></span>
			</p>
			<span class="orange fr orderState"></span>
		</div>
	</td>
</tr>
<tr class="borderline tc">
	<td>
		<img src="static/web/img/det1.png" width="145" height="103" class="vm">
			<span class="pl10 omission"><a href="javascript:;" class="dark"></a></span>
	</td>
	<td class="orange">
		￥
		<span class="f20 bold"></span>
	</td>
	<td>1</td>
	<td class="operation">
		<p>
			<a href="javascript:;" class="dark"></a>
		</p>
		<a href="javascript:;"></a>
	</td>
</tr>
</table>
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
		<div class="content pt20 clearfix">
			<div class="lpart">
				<div class="personal-info clearfix">
					<div class="head fl"><img src="${user.headImg }" width="80" height="80"></div>
					<div class="info fl">
						<span style="display:inline-block;width: 80px;">${user.nickname }</span>
						<p><span class="pr10 grey9">等级</span><span class="orange">${user.parentLevelDesc }</span></p>
						<p>
							<c:if test="${user.parentLevelName == 1 }">
								<c:if test="${user.levelName == 1}">
									<i class="iicon i-bronze"></i>
								</c:if>
								<c:if test="${user.levelName == 2}">
									<i class="iicon i-bronze"></i><i class="iicon i-bronze"></i>
								</c:if>
								<c:if test="${user.levelName == 3}">
									<i class="iicon i-bronze"></i><i class="iicon i-bronze"></i><i class="iicon i-bronze"></i>
								</c:if>
								<c:if test="${user.levelName == 4}">
									<i class="iicon i-bronze"></i><i class="iicon i-bronze"></i><i class="iicon i-bronze"></i><i class="iicon i-bronze"></i>
								</c:if>
								<c:if test="${user.levelName == 5}">
									<i class="iicon i-bronze"></i><i class="iicon i-bronze"></i><i class="iicon i-bronze"></i><i class="iicon i-bronze"></i><i class="iicon i-bronze"></i>
								</c:if>
							</c:if>
							<c:if test="${user.parentLevelName == 2 }">
								<c:if test="${user.levelName == 1}">
									<i class="iicon i-gold"></i>
								</c:if>
								<c:if test="${user.levelName == 2}">
									<i class="iicon i-gold"></i><i class="iicon i-gold"></i>
								</c:if>
								<c:if test="${user.levelName == 3}">
									<i class="iicon i-gold"></i><i class="iicon i-gold"></i><i class="iicon i-gold"></i>
								</c:if>
								<c:if test="${user.levelName == 4}">
									<i class="iicon i-gold"></i><i class="iicon i-gold"></i><i class="iicon i-gold"></i><i class="iicon i-gold"></i>
								</c:if>
								<c:if test="${user.levelName == 5}">
									<i class="iicon i-gold"></i><i class="iicon i-gold"></i><i class="iicon i-gold"></i><i class="iicon i-gold"></i><i class="iicon i-gold"></i>
								</c:if>
							</c:if>
							<c:if test="${user.parentLevelName == 3 }">
								<c:if test="${user.levelName == 1}">
									<i class="iicon i-diamod"></i>
								</c:if>
								<c:if test="${user.levelName == 2}">
									<i class="iicon i-diamod"></i><i class="iicon i-diamod"></i>
								</c:if>
								<c:if test="${user.levelName == 3}">
									<i class="iicon i-diamod"></i><i class="iicon i-diamod"></i><i class="iicon i-diamod"></i>
								</c:if>
								<c:if test="${user.levelName == 4}">
									<i class="iicon i-diamod"></i><i class="iicon i-diamod"></i><i class="iicon i-diamod"></i><i class="iicon i-diamod"></i>
								</c:if>
								<c:if test="${user.levelName == 5}">
									<i class="iicon i-diamod"></i><i class="iicon i-diamod"></i><i class="iicon i-diamod"></i><i class="iicon i-diamod"></i><i class="iicon i-diamod"></i>
								</c:if>
							</c:if>
						</p>
						<p class="fs12"><span class="pr10 grey9">桃子</span><span class="orange">${user.score }</span></p>
					</div>
				</div>
				<ul class="menu">
					<li><a href="pc/user/home">我的主页</a></li>
					<li><a href="pc/user/info" >个人资料</a></li>
					<li><a href="pc/user/account/detail" >账户明细</a></li>
					<li><a href="pc/user/order/depthList" class="current">订单管理</a>
						<ul class="submenu">
							<li ><a href="pc/user/order/depthList"><p><span class="iicon dot"></span>旅游</p></a></li>
							<li class="current"><a href="pc/user/order/rentList"><p><span class="iicon dot"></span>快旅出行</p></a></li>
						</ul>
					</li>
					<li><a href="pc/user/account/setting">账户设置</a></li>
					<li><a href="pc/user/message">消息中心</a></li>
				</ul>
			</div>
			<div class="rpart message-center">
				<ul class="tabs clearfix" id="carTabs">
					<li class="current">租车</li>
					<li>包车</li>
					<li>班车</li>
					<li>拼车</li>
				</ul>
				<div class="right-warp">
					<!-- 租车订单 -->
					<div class="tabs-cont" id="rent">
						<input type="hidden" name="evaluate" id="rentEvaluate">
						<input type="hidden" name="payType" id="rentPayType">
						<input type="hidden" name="pageNo" id="rentPageNo" value="1">
						<input type="hidden" name="totalPage" id="rentTotalPage">
						<ul class="subtabs">
							<li class="current" _value="normal"><a href="javascript:;" onclick="screening(this)">全部订单</a></li><li _value="payType"><a href="javascript:;" onclick="screening(this)">待付款</a></li><!-- <li _value="evaluate"><a href="javascript:;" onclick="screening(this)">待评价</a></li> -->
						</ul>
						<div class="order-cont">
							<table width="100%" border="0" class="ordertab2 mt10 f12" cellspacing="0" cellpadding="0">
								<tr><th width="350">订单信息</th><th>订单金额</th><th>数量</th><th>操作</th></tr>
								
							</table>
						</div>
						<div class="pagination">
						</div>
					</div>
					<!-- 包车订单 -->
					<div class="tabs-cont" id="wrap">
						<input type="hidden" name="evaluate" id="wrapEvaluate">
						<input type="hidden" name="payType" id="wrapPayType">
						<input type="hidden" name="pageNo" id="wrapPageNo" value="1">
						<input type="hidden" name="totalPage" id="wrapTotalPage">
						<ul class="subtabs">
							<li class="current" _value="normal"><a href="javascript:;" onclick="screening(this)">全部订单</a></li><li _value="payType"><a href="javascript:;" onclick="screening(this)">待付款</a></li><!-- <li _value="evaluate"><a href="javascript:;" onclick="screening(this)">待评价</a></li> -->
						</ul>
						<div class="order-cont">
							<table width="100%" border="0" class="ordertab2 mt10 f12" cellspacing="0" cellpadding="0">
								<tr><th width="350">订单信息</th><th>订单金额</th><th>数量</th><th>操作</th></tr>
								
							</table>
						</div>
						<div class="pagination">
						</div>
					</div>
					<!-- 班车订单 -->
					<div class="tabs-cont" id="bus">
						<input type="hidden" name="evaluate" id="busEvaluate">
						<input type="hidden" name="payType" id="busPayType">
						<input type="hidden" name="pageNo" id="busPageNo" value="1">
						<input type="hidden" name="totalPage" id="busTotalPage">
						<ul class="subtabs">
							<li class="current" _value="normal"><a href="javascript:;" onclick="screening(this)">全部订单</a></li><li _value="payType"><a href="javascript:;" onclick="screening(this)">待付款</a></li><!-- <li _value="evaluate"><a href="javascript:;" onclick="screening(this)">待评价</a></li> -->
						</ul>
						<div class="order-cont">
							<table width="100%" border="0" class="ordertab2 mt10 f12" cellspacing="0" cellpadding="0">
								<tr><th width="350">订单信息</th><th>订单金额</th><th>数量</th><th>操作</th></tr>
								
							</table>
						</div>
						<div class="pagination">
						</div>
					</div>
					<!-- 拼车订单 -->
					<div class="tabs-cont" id="carpool">
						<input type="hidden" name="evaluate" id="carpoolEvaluate">
						<input type="hidden" name="payType" id="carpoolPayType">
						<input type="hidden" name="pageNo" id="carpoolPageNo" value="1">
						<input type="hidden" name="totalPage" id="carpoolTotalPage">
						<ul class="subtabs">
							<li class="current" _value="normal"><a href="javascript:;" onclick="screening(this)">全部订单</a></li><li _value="payType"><a href="javascript:;" onclick="screening(this)">待付款</a></li><!-- <li _value="evaluate"><a href="javascript:;" onclick="screening(this)">待评价</a></li> -->
						</ul>
						<div class="order-cont">
							<table width="100%" border="0" class="ordertab2 mt10 f12" cellspacing="0" cellpadding="0">
								<tr><th width="350">订单信息</th><th>订单金额</th><th>数量</th><th>操作</th></tr>
								
							</table>
						</div>
						<div class="pagination">
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="additional">
			<div class="twovcode">
				<div class="cont">
					<img src="static/web/images/twovcode.jpg" width="70" height="65">
					<p>APP下载</p>
				</div>
				<span class="close"></span>
			</div>
			<div class="totop"></div>
			<div class="remark"></div>
		</div>		
	</div>

	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
</div>
<div id="titlepopup" style="display: none;">
<div class="innerdiv pd20 tc">
	<p style="padding:50px 0; color:#333;">smg</p>
	<button class="Btn" name="case-ok">确认</button>
</div>
</div>

<div id="confirmDialog" style="display: none;">
<div class="innerdiv pd20 tc">
	<p style="padding:50px 0; color:#333;">确认删除？</p>
	<button class="Btn ok" name="case-ok">确认</button>
	<button class="Btn" name=".btn-close" onclick="closeConfirmDialog(this)">取消</button>
</div>
</div>

<div id="refundDialog" style="display: none;">
<div class="innerdiv pd20 tc refundDiv">
	<form action="" id="refundForm">
	<table>
		<tr>
			<th>退款银行名称：</th>
			<td><!-- <input name="bank_name" class="dinput"> -->
			<select name="bank_name" class="dinput">
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

//var totalPage=0;//总页数
//var pageNo=0;//当前页

var evaluate="";
var payType="";
var refundDlg;

$(function(){
	pageNo=1;
	$("#carTabs li").click();
	//$("#carTabs li:first").click();
	var tabIndex = "${tabIndex}";
	if(tabIndex != null){
		$("#carTabs li:eq("+tabIndex+")").click();
	}else{
		$("#carTabs li:first").click();
	}
	initList("rent");
	initList("wrap");
	initList("carpool");
	initList("bus");
	$(document).on("click",".ok,.cannel",function(){
		return false;
	})
})

function checkCarNo(obj){
	$(obj).val($(obj).val().replace(/\D/g,""));
}

function initList(id){
	var data={};
	data.pageNo=$("#"+id+"PageNo").val();
	data.evaluate=$("#"+id+"Evaluate").val();
	data.payType=$("#"+id+"PayType").val();
	data.type=id;
	//console.info("执行初始化，参数："+data.evaluate+","+data.payType);
	$.post("<%=basePath %>pc/user/order/data",data,function(result){
		var list=result.list;
		var table=$("#"+id+" .ordertab2").empty();
		//console.info(table);
		for(var i=0;i<list.length;i++){
			var item=list[i];
			var model=createModel(id,item);
			table.append(model);
		}
		$("#"+id+"TotalPage").val(result.totalPage);
		initPage(id);
	});
	
}

function gotoPage(goNo,id){
	$("#"+id+"PageNo").val(parseInt(goNo));
	//pageNo=parseInt(goNo);
	initList(id);
}

function goPage(id){
	$("#"+id+"PageNo").val($("#gotopage").val());
	//pageNo=$("#gotopage").val();
	initList(id);
}

function initPage(id){
	//console.info("pageNo:"+pageNo);
	//console.info("totalPage:"+totalPage);
	var pageNo=parseInt($("#"+id+"PageNo").val());
	var totalPage=parseInt($("#"+id+"TotalPage").val());
	var pageDiv=$("#"+id+" .pagination");
	pageDiv.html("");
	if(pageNo<=1){
		pageDiv.append('<a class="disabled" href="javascript:;">上一页</a>');
	}else{
		pageDiv.append('<a href="javascript:;" onclick="gotoPage('+(pageNo-1)+',\''+id+'\')">上一页</a>');
	}
	if(pageNo>3){
		pageDiv.append('<a href="javascript:;" onclick="gotoPage(1,\''+id+'\')">1</a>');
		pageDiv.append('<span class="p_text">...</span>');
	}
	for(var i=-2;i<3;i++){
		var thisNo=pageNo+i;
		if(thisNo>0&&thisNo<=totalPage){
			if(i==0){
				pageDiv.append('<a href="javascript:;" class="current" onclick="gotoPage('+thisNo+',\''+id+'\')">'+thisNo+'</a>');			
			}else{
				pageDiv.append('<a href="javascript:;" onclick="gotoPage('+thisNo+',\''+id+'\')">'+thisNo+'</a>');
			}
		}
	}
	if((totalPage-pageNo)>2){
		pageDiv.append('<span class="p_text">...</span>');
		pageDiv.append('<a href="javascript:;" onclick="gotoPage('+totalPage+',\''+id+'\')">'+totalPage+'</a>');
	}
	if(pageNo>=totalPage){
		pageDiv.append('<a class="disabled" href="javascript:;">下一页</a>');
	}else{
		pageDiv.append('<a href="javascript:;" onclick="gotoPage('+(pageNo+1)+',\''+id+'\')">下一页</a>');
	}
	pageDiv.append('<input id="gotopage" class="gotopage" type="text" value="'+pageNo+'" /> 页');
	pageDiv.append('<input onclick="goPage(\''+id+'\')" type="button" value="确定" />');
}

function screening(obj){
	$(obj).parents("ul").find("li").removeClass("current");
	$(obj).parents("li").addClass("current");
	var id=$(obj).parents(".tabs-cont").attr("id");
	var screening=$("#"+id+" .subtabs .current").attr("_value");
	pageNo=1;
	console.info("screening:"+screening);
	if(screening=="normal"){
		$("#"+id+"Evaluate").val("");
		$("#"+id+"PayType").val("");
		initList(id);
	}else if(screening=="evaluate"){
		$("#"+id+"Evaluate").val("evaluate");
		$("#"+id+"PayType").val("");
		initList(id);
	}else if(screening=="payType"){
		$("#"+id+"Evaluate").val("");
		$("#"+id+"PayType").val("payType");
		initList(id);
	}
}

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
				initList(type);
				closeRefundDialog();
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

function canleOrder(id,type){
	confirmDialog("确定取消？");
	$(".popup-case .ok").bind("click",function(){
		doCanleOrder(id,type);
	});
	
}

function doCanleOrder(id,type){
	$.post("<%=basePath %>pc/user/order/canelOrder",{id:id},function(data){
		if(data.status=="success"){
			alertDialog("取消成功");
			initList(type);
		}else if(data.status=="error"){
			alertDialog("取消失败，请确认订单状态");
		}else{
			alertDialog("服务器异常，请稍后重试");
		}
	});
}


function deleteOrder(id,type){
	confirmDialog("确定删除？");
	$(".popup-case .ok").one("click",function(){
		doDeleteOrder(id,type);
	});
	
}

function doDeleteOrder(id,type){
	$.post("<%=basePath %>pc/user/order/deleteOrder",{id:id},function(data){
		if(data.status=="success"){
			alertDialog("删除成功");
			initList(type);
		}else if(data.status=="error"){
			alertDialog("删除失败，请确认订单状态");
		}else{
			alertDialog("服务器异常，请稍后重试");
		}
	});
}

function goOrderDetial(id,type){
	window.location.href="<%=basePath %>pc/user/order/orderDetial/"+id;
}

function payOrder(id,order_type,real_price){
	window.location.href="<%=basePath %>allowAccess/orders/toPay?orderId="+id+"&orderType="+order_type+"&realPrice="+real_price;
}

function createModel(id,item){
	var model=$("#Model tbody").children().clone();
	var title="";
	var url=item.pic_url;
	
	
	var orderState="";
	if(item.order_state=="WAITPAY"){
		orderState="等待付款";
		if(id!="carpool"){
			$(model).find(".operation a:first").html("取消订单");
			$(model).find(".operation a:first").bind("click",function(){
				canleOrder(item.id,id);
			});
		}
		$(model).find(".operation a:last").html("支付");
		$(model).find(".operation a:last").bind("click",function(){
			payOrder(item.id,item.order_type,item.real_price);
		});
		
	}else if(item.order_state=="PAY_OK"){
		orderState="交易成功";
		console.info(item.start_date);
		if(id!="carpool"){
			var startDate=new Date();
			startDate.setTime(item.start_date);
			if((item.start_date-new Date().getTime())<(1000*60*30)){
				$(model).find(".operation a:first").html("删除订单");
				$(model).find(".operation a:first").bind("click",function(){
					deleteOrder(item.id,id);
				});
			}else{
				$(model).find(".operation a:first").html("退款");
				$(model).find(".operation a:first").bind("click",function(){
					refund(item.id,id);
				});
			}
		}else{
			var startDate=new Date();
			startDate.setTime(item.start_date);
			if((item.start_date-new Date().getTime())<0){
				$(model).find(".operation a:first").html("删除订单");
				$(model).find(".operation a:first").bind("click",function(){
					deleteOrder(item.id,id);
				});
			}else{
				$(model).find(".operation a:first").html("退款");
				$(model).find(".operation a:first").bind("click",function(){
					refund(item.id,id);
				});
			}
		}
		var listUrl="";
		if(id=="rent"){
			listUrl="pc/cart/rent/list";
		}else if(id=="wrap"){
			listUrl="pc/cart/wrap/list";
		}else if(id=="carpool"){
			listUrl="pc/cart/pool/list";
		}else if(id=="bus"){
			listUrl="pc/cart/bus/list";
		}
		$(model).append('<a href="javascript:;"></a>');
		$(model).find(".operation a:last").html("重新购买");
		$(model).find(".operation a:last").bind("click",function(){
			window.location.href=listUrl;
		});
	}else if(item.order_state=="CLOSED"){
		orderState="交易关闭";
		$(model).find(".operation a:first").html("删除订单");
		$(model).find(".operation a:first").bind("click",function(){
			deleteOrder(item.id,id);
		});
	}else if(item.order_state=="REFUNDING"){
		orderState="退款中";
	}else if(item.order_state=="REFUNDING_UNPOOL"){
		orderState="退款中-拼单失败";
	}else if(item.order_state=="REFUNDING_FAIL"){
		orderState="退款失败";
		$(model).find(".operation a:first").html("退款");
		$(model).find(".operation a:first").bind("click",function(){
			refund(item.id,id);
		});
	}else if(item.order_state=="REFUNDED"){
		orderState="退款完成";
		$(model).find(".operation a:first").html("删除订单");
		$(model).find(".operation a:first").bind("click",function(){
			deleteOrder(item.id,id);
		});
	}
	$(model).find(".orderState").html(orderState);
	
	
	if(id=="rent"){
		title=item.brand+item.sys+"/"+item.car_type+"/"+item.outputs+item.gearbox;
	}else if(id=="wrap"){
		var brand=item.brand;
		var seating=item.seating;
		if(!brand){
			brand="";
		}
		if(!seating){
			seating="0";
		}
		title+=brand;
		title+="/乘坐";
		title+=seating;
		title+="人";
	}else if(id=="carpool"){
		title=item.startCity+"-"+item.endCity;
		//url="<%=basePath %>static/web/img/car_bigimg.jpg";
		url = "";
	}else if(id="bus"){
		title=item.fromAddr+"-"+item.toAddr;
		//url="static/web/img/car_bigimg.jpg";
		url = "";
	}
	$(model).find(".fl span:first").html(item.order_code);
	$(model).find(".fl span:last").html(getTimeTxt(item.create_time,19));
	$(model).find("img").attr("src",url);
	//如果市班车和拼接，没有图片
	if(id=="carpool" || id=="bus"){
		$(model).find("img").remove();
	}
	$(model).find(".orange span").html(item.real_price);
	$(model).find(".omission a").html(title);
	//查看订单
	$(model).find(".operation").append('<p><a href="javascript:;" class="dark">查看订单</a></p>');
	$(model).find(".operation a:last").bind("click",function(){
		goOrderDetial(item.id,id);
	});
	
	//$(model).find("a").html("删除订单");
	return model;
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

</script>
</body>
</html>