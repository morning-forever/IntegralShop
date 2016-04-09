<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transition al.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../../../../static/inc_web.jsp" %>
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv = "X-UA-Compatible" content = "IE=edge,chrome=1 " /><meta charset="utf-8"> 
<title>订单管理-旅游</title>
<link rel="stylesheet" href="static/web/css/common.css" />
<link rel="stylesheet" href="static/web/css/inner.style.css" />
<link rel="stylesheet" href="static/web/css/personal.center.css" />
<link rel="stylesheet" type="text/css" href="static/web/css/order.management.css">
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
							<li class="current"><a href="pc/user/order/depthList"><p><span class="iicon dot"></span>旅游</p></a></li>
							<li><a href="pc/user/order/rentList"><p><span class="iicon dot"></span>快旅出行</p></a></li>
						</ul>
					</li>
					<li><a href="pc/user/account/setting">账户设置</a></li>
					<li><a href="pc/user/message">消息中心</a></li>
				</ul>
			</div>
			<div class="rpart message-center">
				<ul class="tabs clearfix">
					<!-- <li><a href="pc/order/scenic">智易行</a></li> -->
					<li class="current">主题深度游</li>
				</ul>
				<div class="right-warp">
					<div class="tabs-cont">
						<ul class="subtabs">
							<li class="current"><a href="javascript:;" onclick="showOrderList()">全部订单</a></li><li><a href="javascript:;" onclick="showOrderList('WAITPAY','')">待付款</a></li><li><a href="javascript:;" onclick="showOrderList('PAY_OK',1)">待评价</a></li>
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
<table id="template" style="display: none;">
	<tr><td colspan="4">
		<div class="clearfix mt10 pl10 pb10">
			<p class="dark fl">订单号：168586249624<span class="pl20">2015-05-12  12:00:00</span></p>
			<span class="cgreen fr">交易成功</span>
		</div>
	</td></tr>
	<tr class="borderline tc">
		<td><a href="pc/mall/scenicGoodsDetialOfIntroduce"><img src="static/web/img/det1.png" width="145" height="103" class="vm"></a><span class="pl10 omission">如家酒店(苹果园地铁站店)-特别</span></td>
		<td class="orange">￥<span class="f20 bold">774</span></td>
		<td>1</td>
		<td></td>
	</tr>
</table>
</body>
<script type="text/javascript" src="static/web/js/base.js"></script>
<script type="text/javascript" src="static/web/js/index.js"></script>
<script type="text/javascript">
$(function(){
	
	doSearch();//查询
	
	//几个订单tab切换
	$(".subtabs li").bind("click",function(){
		$(".subtabs li").removeClass("current");
		$(this).addClass("current");
	});
	
});

var totalPage=0;//总页数
var pageNo=1;//当前页
var payState = '';//支付状态
var isEvaluate = '';//评价状态

//查询
function doSearch(){
	
	var json = {
			'pageNo': pageNo,//页码
			'payState' : payState,//支付状态
			'isEvaluate' : isEvaluate//评价状态
		};
	$.post("<%=basePath %>pc/user/order/depth/search",json,function(res){
		if(res.status == 'success'){
			$(".ordertab2").empty();
			$(".ordertab2").append('<tr><th width="350">订单信息</th><th>订单金额</th><th>数量</th><th>操作</th></tr>');//标题
			var list = res.list;
			for(var i=0; i<list.length; i++){
				var template = $("#template").children().clone();
				template.find("p.dark").text("订单号："+list[i].order_code);//订单号
				template.find("p span").text(list[i].order_code);//订单时间
				var stateObj = getState(list[i]);//交易状态对象
				template.find("span.fr").attr("class",stateObj.style);//订单状态样式
				template.find("span.fr").text(stateObj.desc);//订单状态描述
				template.find("img").attr("src",list[i].pic_url);//图片路径
				template.find("a").attr("href","pc/depth/detail/"+list[i].goodsId);//名称
				template.find(".borderline td:eq(0) span").text(list[i].name);//名称
				template.find(".borderline td:eq(1) span").text(list[i].real_price);//价格
				template.find(".borderline td:eq(2)").text(list[i].goods_count);//商品数量
				template.find(".borderline td:eq(3)").append(stateObj.btn);//操作按钮
				
				//template.find("tr:last").attr('onclick','toOrderDetail('+list[i].id+')');//查看订单详情
				template.show();
				$(".ordertab2").append(template);
			}
			/* $("tr.borderline").hover( function(event){
			    $(this).css("border-color", "orange");    
			}, function(event){
			    $(this).css("border-color","gray");  
			}); */
		}
		totalPage = res.totalPage;
		pageNo = res.pageNo;
		initPage();
	});
}

//显示订单list
function showOrderList(stateValue, evaluateValue){
	payState = stateValue;
	isEvaluate = evaluateValue;
	doSearch();
}

//显示订单详情
function toOrderDetail(orderId){
	location.href = "<%=basePath %>pc/user/order/detail/"+orderId;
}

//得到订单状态
function getState(obj){
	var stateObj = {};
	var queryBtn = '<p><a href="javascript:;" onclick="toOrderDetail('+obj.id+')" class="dark underline">查看订单</a></p>';
	var delBtn = '<p><a href="javascript:;" onclick="operOrder(\'delete\','+obj.id+')" class="dark underline">删除订单</a></p>';
	stateObj.btn = queryBtn;//默认都有查看订单
	var orderState = obj.order_state;
	var startTime = obj.start_time;
	//待付款（查看订单，取消订单，支付）
	if(orderState == 'WAITPAY'){
		stateObj.desc = '待付款';//支付状态描述
		stateObj.style = "orange fr";//支付状态文字样式
		stateObj.btn = '<p><a href="javascript:;" onclick="operOrder(\'close\','+obj.id+')" class="dark">取消订单</a></p><a href="javascript:;" onclick="toPay('+obj.id+','+obj.real_price+')">支付</a>';
	}
	//交易关闭（查看订单，删除订单）
	else if(orderState == 'CLOSED'){
		stateObj.desc = '交易关闭';
		stateObj.style = "grey9 fr";
		stateObj.btn += delBtn + '<p><a href="<%=basePath %>pc/depth/home" class="orange">重新购买</a></p>';
	}
	//交易成功
	else if(orderState == 'PAY_OK'){
		stateObj.desc = '交易成功';
		stateObj.style = "cgreen fr";
		var now = new Date();
		//若当前登录人未评论过，才出现评论按钮（查看订单，删除订单， 评论）
		if(obj.is_evaluate == 1){
			//出行当天，评价按钮出现
			if(now.format("yyyy-MM-dd") >= startTime){
				stateObj.btn += delBtn + '<a href="<%=basePath %>pc/user/order/evaluate?orderId='+obj.id+'">评价</a>';
			}
		}else{
			stateObj.btn += delBtn;
		}
		now.setDate(now.getDate()+1); 
		//在出行时间的前一天，退款按钮才可见，前一天消失（查看订单）
		if(now.format("yyyy-MM-dd") <= startTime){
			stateObj.btn += '<a href="javascript:;" onclick="toRefund('+obj.id+')" class="cred">退款</a>';
		}
	}
	//退款中
	else if(orderState == 'REFUNDING'){
		stateObj.desc = '退款中';
		stateObj.style = "orange fr";
	}
	//退款完成
	else if(orderState == 'REFUNDED'){
		stateObj.desc = '退款完成';
		stateObj.style = "grey9 fr";
		stateObj.btn += delBtn;
	}
	//退款失败
	else if(orderState == 'REFUNDING_FAIL'){
		stateObj.desc = '退款失败';
		stateObj.style = "cred fr";
		stateObj.btn += '<a href="javascript:;" onclick="toRefund('+obj.id+')" class="cred">退款</a>';
	}
	return stateObj;
}

//跳转至退款页面
function toRefund(orderId){
	location.href = "<%=basePath %>pc/user/order/refund/"+orderId;
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

//删除或取消订单
function operOrder(oper,orderId){
	console.info(oper);
	var tip = "";
	if(oper == 'delete'){
		tip = "删除";
	}else if(oper == 'close'){
		tip = "取消";
	}
	popMesConfirm("确定"+tip+"该订单吗？",function(){
		$.post('<%=basePath %>pc/user/order/operOrder', {'oper':oper,'orderId':orderId} , function(res) {
			if(res.status == 'success'){
				doSearch();
			}else{
				popMesTip("系统忙，请稍后重试");
			}
		});
	});
}

function gotoPage(goNo){
	pageNo = goNo;
	doSearch();
}

function goPage(){
	pageNo = $("#gotopage").val();
	if(parseInt(pageNo)>totalPage){
		$("#gotopage").val(totalPage);
		valTips("gotopage", "输入页数大于当前最大页数");
	}else{
		doSearch();
	}
}

function initPage(){
	$(".pagination").empty();
	if(pageNo<=1){
		$(".pagination").append('<a class="disabled" href="javascript:;">上一页</a>');
	}else{
		$(".pagination").append('<a href="javascript:;" onclick="gotoPage('+(pageNo-1)+')">上一页</a>');
	}
	if(pageNo>3){
		$(".pagination").append('<a href="javascript:;" onclick="gotoPage(1)">1</a>');
		$(".pagination").append('<span class="p_text">...</span>');
	}
	for(var i=-2;i<3;i++){
		var thisNo=pageNo+i;
		if(thisNo>0&&thisNo<=totalPage){
			if(i==0){
				$(".pagination").append('<a href="javascript:;" class="current" onclick="gotoPage('+thisNo+')">'+thisNo+'</a>');			
			}else{
				$(".pagination").append('<a href="javascript:;" onclick="gotoPage('+thisNo+')">'+thisNo+'</a>');
			}
		}
	}
	if((totalPage-pageNo)>2){
		$(".pagination").append('<span class="p_text">...</span>');
		$(".pagination").append('<a href="javascript:;" onclick="gotoPage('+totalPage+')">'+totalPage+'</a>');
	}
	if(pageNo>=totalPage){
		$(".pagination").append('<a class="disabled" href="javascript:;">下一页</a>');
	}else{
		$(".pagination").append('<a href="javascript:;" onclick="gotoPage('+(pageNo+1)+')">下一页</a>');
	}
	$(".pagination").append('<input id="gotopage" class="gotopage" type="text" value="'+pageNo+'" /> 页');
	$(".pagination").append('<input onclick="goPage()" type="button" value="确定" />');
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

</script>
</html>
