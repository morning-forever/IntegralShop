<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../../../../static/inc_web.jsp" %>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv = "X-UA-Compatible" content = "IE=edge,chrome=1 " /><meta charset="utf-8"> 
<title>订单管理-漫游商城-酒店-交易关闭</title>
<link rel="stylesheet" href="static/web/css/common.css" />
<link rel="stylesheet" href="static/web/css/inner.style.css" />
<link rel="stylesheet" href="static/web/css/order.management.css" />
</head>
<body>
<div class="wrapper inner">
	<!-- header -->
	<div class="header">
		<div class="topbar">
			<div class="content clearfix">
				<div class="fl">
					<span class="haslogin hasdownlist"><img src="static/web/img/avatar.jpg" class="avatar vm mr10" height="28" width="28" alt="">Hi  Mary<span class="downlist"><a href="">我的主页</a><a href="">订单管理</a><a href="">个人资料</a><a href="">账户设置</a><a href="">退出登录</a></span></span>
					<span class="userMsg hasdownlist"><i class="iicon i-news"></i>消息<span class="downlist"><a href="">评论消息(3)</a><a href="">通知消息(2)</a></span></span>
				</div>
				<div class="fr">
					<span class="appdown hasdownlist"><i class="iicon i-app"></i>APP下载<span class="appcode"><img src="static/web/images/twovcode.jpg" height="128" width="128" alt=""></span></span><span class="span-spc"><i class="iicon i-about"></i><a href="">关于我们</a></span><span class="social-span"><a href="" class="iicon i-weixin"></a><a href="" class="iicon i-qq"></a><a href="" class="iicon i-weibo"></a></span>
				</div>
			</div>
		</div>		
		<div class="inner_nav_wrap rel">
			<div class="content rel">
				<a href="#"><img src="static/web/images/logo.png" height="59" width="176" alt="" class="logo"></a>	
				<div class="search_wrapper abs"><i class="iicon i-search"></i><input class="search-text" type="text" placeholder="请输入关键词" /><button class="search-btn">搜 索</button></div>
				<div class="contact400">
					<span class="i-contact"></span>
					<span class="f18 bold">400-820-8820</span>
				</div>
			</div>										
		</div>				
		<div class="nav_ul_wrap">
			<ul class="nav clearfix">
				<li><a href="pc/home">首页</a></li>
				<li><a href="pc/simple/home">智易行</a></li>
				<li class="active"><a href="pc/cart/home">快旅▪漫游</a></li>
				<li><a href="pc/depth/home">主题深度游</a></li>
				<li><a href="pc/interact/home">互动社区</a></li>
			</ul>
		</div>
	</div>

	<!-- page content -->
	<div class="content_wrap pb90">
		<div class="content order-manage">
			<div class="breadcrumb">当前位置：<a href="">首页</a><a href="">订单管理</a><a href="">漫游商城</a><span>订单详情</span></div>
			<div class="whitebg pb20">
				<div class="f18 bold borderbs1 grey9 pb20">订单状态：<span class="red">交易关闭</span></div>
				<div class="order-info pt20 pb20 clearfix">
					<img src="static/web/img/pic2.jpg" width="197" height="113" class="fl">
					<div class="ml10 fl">
						<p class="f16 dark">如家酒店(苹果园地铁站店)-特惠商务房</p>
						<p class="lorange" style="margin-top:68px;padding-left:5px;">￥<span class="f18 bold">576</span><span class="grey9 pl10" style="text-decoration:line-through;">￥237</span></p>
					</div>
					<div class="info-right fr rel">
						<span class="grey9">数量 1</span>
						<i class="iicon arrow abs"></i>
					</div>
				</div>
				<h4 class="orangeh4">入住信息</h4>
				<div class="personal-info spanstyle">
					<ul>
						<li class="clearfix">
							<div class="fr">
								<span class="item" style="padding:0;">价格：<span class="orange">￥<span class="f24 bold orange">237</span></span></span>
							</div>
							<span class="item">入住时间：<span>2015-6-1</span></span>
							<span class="item">离店时间：<span>2015-6-3</span></span>
							<span class="item">合计 : <span> 2晚</span></span>							
						</li>
						<li>
							<span class="item">入住房型：<span>特惠商务房</span></span>
							<span class="item">预定间数：<span>1间</span></span>
						</li>
						<li>
							<span class="item">地址：<span>武汉市洪山区光谷软件园软件园中路</span></span>
						</li>
					</ul>
				</div>
				<h4 class="orangeh4">入住人信息</h4>
				<div class="personal-info spanstyle pt20 pb20 pl10">
					<span class="item">姓名：<span>陈西</span></span>
					<span class="item">联系电话：<span>17689008877</span></span>
				</div>
				<div class="borderttype2 spanstyle pl10 pt20">
					<p><span class="item">订单编号：<span>12345566</span></span></p>
					<p><span class="item">成交时间：<span>2015-05-10 12:00:00</span></span></p>
				</div>
				<div class="pb20 pt20 tr">
					<span class="f16 mr10 grey9">合计</span><span class="lorange f16">￥<span class="f30 bold">237</span></span>
				</div>
				<div class="tc mt20 mb20">
					<!-- <button class="btn ml20" style="background:#5d5547;">删除订单</button> -->
					<a class="btn ml20" href="pc/order/hotel">删除订单</a>
				</div>
			</div>
		</div>
						
	</div>

	<!-- footer -->
	<div class="indexfooter footer">
		<div class="content tc">
			<div class="olinks_wrap">
				<h3>合作伙伴<br/>Partner</h3>
				<div class="olinks">
					<a href="">加拿大旅游局</a>
					<a href="">加拿大旅游局</a>
					<a href="">加拿大旅游局</a>
					<a href="">加拿大旅游局</a>
					<a href="">加拿大旅游局</a>
					<a href="">加拿大旅游局</a>
					<a href="">加拿大旅游局</a>
					<a href="">加拿大旅游局</a>
					<a href="">加拿大旅游局</a>
					<a href="">加拿大旅游局</a>
				</div>
			</div>
			<p class="mb20 fourlinks"><a href="">关于我们</a><span class="divid-line"></span><a href="">联系我们</a><span class="divid-line"></span><a href="">帮助中心</a><span class="divid-line"></span><a href="">用户协议</a></p>
			<p class="copyright">Copyright 2015 贵州正礼服务有限公司。 著作权所有，并保留一切权利。 黔ICP备05049XXXX</p>
		</div>
	</div>
</div>
<script type="text/javascript" src="static/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="static/js/base.js"></script>
<script type="text/javascript">
$(function(){
	selfDefineFormBtn();
	HorizontalList();
});
</script>
</body>
</html>