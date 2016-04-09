<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transition al.dtd"><%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../../static/inc_web.jsp" %>
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv = "X-UA-Compatible" content = "IE=edge,chrome=1 " /><meta charset="utf-8"> 
<title>支付</title>
<link rel="stylesheet" href="static/web/css/common.css" />
<link rel="stylesheet" href="static/web/css/inner.style.css" />
<link rel="stylesheet" href="static/web/css/personal.center.css" />
<link rel="stylesheet" href="static/web/css/member.css"/>
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
				<li class="car">
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
				<li class="depth"><a href="pc/depth/home">主题深度游</a></li>
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
	<div class=" content_wrap pb90">
		<div class="content">
		  <div class="whitebg box-show mt20">
		    <div class="list_pay">
			  <div class="list1">
			    <!-- <p><i class="iicon checkbox checkd"></i><span class="paystyle"></span><span>支付宝</span></p>
				<p><i class="iicon checkbox"></i><span class="paystyle paystyle2"></span><span>银联支付</span></p> -->
				
				<p>你需要支付：<span class="f24">${detail.realPrice }元</span></p>
				
			  </div>
			  <div class="tc">
			    <%-- <span class="vm inline-block">总价<span class="orange ml20 mr20">￥<span class="f24">${detail.realPrice }元</span></span></span> --%>
				<button class="Btn" id="pay">支付</button>
			  </div>
			</div>
		  </div>  
		</div>				
	</div>

	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
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
<script id="rulepopup" type="text/template">
<div class="innerdiv  pd20">
    <div class="searchdiv">
	  <div class="search_wrap"><i class="iicon i-search"></i><input class="search-text" type="text" placeholder="搜索人" /></div>
	  <ul class="list_sear">
	    <li><i class="icon tick"></i>qina819</li>
		<li><i class="icon tick"></i>qina819</li>
		<li><i class="icon tick"></i>qina819</li>
	  </ul>
	</div>
	<div class="listbtn"><button class="Btn" name="case-ok">确认</button></div>
</div>
</script>

<script type="text/javascript" src="static/web/js/base.js"></script>
<script type="text/javascript" src="static/web/js/index.js"></script>
<script type="text/javascript" src="static/web/js/person.js"></script>
<script type="text/javascript">
$(function(){
	scrollBannerInit($(".banner-ul"),$(".banner-btn"));
	previewProDetailImg();
	selfDefineFormBtn();
	// 修改身份对话框
	var ruleDlg = new dialogBox({
		selfClass : "type2",
		title : "",
		contentHtml : $("#rulepopup").html(),
		popupBoxW : 816,
		//closeBtnshow : 0,
		initEvent : function($dom){
		}
	});
	$(".add").click(function(){
		ruleDlg.showDlg();
	});
	
	$("#pay").click(function(){
		var data = {
			"orderId":'${detail.orderId}',
			"orderType":'${detail.orderType}'
		};
		subWebForm("<%=basePath %>allowAccess/orders/pay",data);
		
		/* $.post('allowAccess/orders/pay',data,function(req){
			window.location.href='allowAccess/orders/payResult?resultType='+req.status;
		},"JSON"); */
	});
	
	if("${detail.orderType}"=="depth"){
		$(".depth").addClass("active");
	}else{
		$(".car").addClass("active");
	}
});
</script>
</body>
</html>