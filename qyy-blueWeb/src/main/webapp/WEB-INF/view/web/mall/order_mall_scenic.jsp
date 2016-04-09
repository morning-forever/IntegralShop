<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../../../../static/inc_web.jsp" %>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv = "X-UA-Compatible" content = "IE=edge,chrome=1 " /><meta charset="utf-8"> 
<title>订单管理-漫游商城（景区）</title>
<link rel="stylesheet" href="static/web/css/common.css" />
<link rel="stylesheet" href="static/web/css/inner.style.css" />
<link rel="stylesheet" href="static/web/css/personal.center.css" />
<link rel="stylesheet" type="text/css" href="static/web/css/order.management.css">


</head>
<body>
<div class="wrapper inner">
	<!-- header -->
	<div class="header">
		<jsp:include page="../common/header.jsp"></jsp:include>
		<!-- <div class="topbar">
			<div class="content clearfix">
				<div class="fl">
					<span class="haslogin hasdownlist"><img src="static/web/img/avatar.jpg" class="avatar vm mr10" height="28" width="28" alt="">Hi  Mary<span class="downlist"><a href="">我的主页</a><a href="">订单管理</a><a href="">个人资料</a><a href="">账户设置</a><a href="">退出登录</a></span></span>
					<span class="userMsg hasdownlist"><i class="iicon i-news"></i>消息<span class="downlist"><a href="">评论消息(3)</a><a href="">通知消息(2)</a></span></span>
				</div>
				<div class="fr">
					<span class="appdown hasdownlist"><i class="iicon i-app"></i>APP下载<span class="appcode"><img src="static/web/images/twovcode.jpg" height="128" width="128" alt=""></span></span><span class="span-spc"><i class="iicon i-about"></i><a href="">关于我们</a></span><span class="social-span"><a href="" class="iicon i-weixin"></a><a href="" class="iicon i-qq"></a><a href="" class="iicon i-weibo"></a></span>
				</div>
			</div>
		</div>		 -->
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
		<div class="content pt20 clearfix">
			<div class="lpart">
				<div class="personal-info clearfix">
					<div class="head fl"><img src="static/web/img/avatar2.jpg" width="80" height="80"></div>
					<div class="info fl">
						<p>Ssinz</p>
						<p><span class="pr10 grey9">等级</span><span class="orange">普通会员</span></p>
						<p><i class="iicon i-medals"></i><i class="iicon i-medals"></i><i class="iicon i-medals"></i><i class="iicon i-medals"></i><i class="iicon i-medals"></i></p>
						<p class="fs12"><span class="pr10 grey9"><i class="iicon i-fruit"></i>桃子</span><span class="orange">100</span></p>
					</div>
				</div>
				<ul class="menu">
					<li><a href="">我的主页</a></li>
					<li><a href="">个人资料</a></li>
					<li><a href="">账户明细</a></li>
					<li>
						<a href="" class="current">订单管理</a>
						<ul class="submenu">
							<li><p><span class="iicon dot"></span>旅游</p></li>
							<li><p><span class="iicon dot"></span>快旅出行</p></li>
							<li class="current"><p><span class="iicon dot "></span>漫游商城</p></li>
						</ul>
					</li>
					<li><a href="">账户设置</a></li>
					<li><a href="">消息中心</a></li>
				</ul>
			</div>
			<div class="rpart message-center">
				<ul class="tabs clearfix">
					<li class="current">景区</li>
					<li><a href="pc/order/hotel">酒店</a></li>
				</ul>
				<div class="right-warp">
					<div class="tabs-cont">
						<ul class="subtabs four">
							<li class="current"><a href="pc/order/scenic">全部订单</a></li><li><a href="pc/order/scenic">待付款</a></li><li><a href="pc/order/scenic">未消费</a></li><li><a href="pc/order/scenic">待评价</a></li>
						</ul>
						<div class="order-cont">
							<table width="100%" border="0" class="ordertab2 mt10 f12" cellspacing="0" cellpadding="0">
								<tr><th width="350">订单信息</th><th>订单金额</th><th>数量</th><th>操作</th></tr>
								<tr><td colspan="4">
									<div class="clearfix mt10 pl10 pb10">
										<p class="dark fl">订单号：168586249624<span class="pl20">2015-05-12  12:00:00</span></p>
										<span class="orange fr">待付款</span>
									</div>
								</td></tr>
								<tr class="borderline tc">
									<td><a href="pc/mall/scenicGoodsDetialOfIntroduce"><img src="static/web/img/det1.png" width="145" height="103" class="vm"></a><span class="pl10 omission">如家酒店(苹果园地铁站店)-特别</span></td>
									<td class="orange">￥<span class="f20 bold">774</span></td>
									<td>1</td>
									<td><p><a href="pc/order/scenic/payClose" class="dark">取消订单</a></p><p class="mt20"><a href="pc/order/scenic/pay">待付款</a></p></td>
								</tr>
								<tr><td colspan="4">
									<div class="clearfix mt10 pl10 pb10">
										<p class="dark fl">订单号：168586249624<span class="pl20">2015-05-12  12:00:00</span></p>
										<span class="grey9 fr">未消费</span>
									</div>
								</td></tr>
								<tr class="borderline tc">
									<td><a href="pc/mall/scenicGoodsDetialOfIntroduce"><img src="static/web/img/det1.png" width="145" height="103" class="vm"></a><span class="pl10 omission">如家酒店(苹果园地铁站店)-特别</span></td>
									<td class="orange">￥<span class="f20 bold">774</span></td>
									<td>1</td>
									<td><a href="pc/order/scenic" class="dark">删除订单</a></td>
								</tr>
								<tr><td colspan="4">
									<div class="clearfix mt10 pl10 pb10">
										<p class="dark fl">订单号：168586249624<span class="pl20">2015-05-12  12:00:00</span></p>
										<span class="grey9 fr">未消费</span>
									</div>
								</td></tr>
								<tr class="borderline tc">
									<td><a href="pc/mall/scenicGoodsDetialOfIntroduce"><img src="static/web/img/det1.png" width="145" height="103" class="vm"></a><span class="pl10 omission">如家酒店(苹果园地铁站店)-特别</span></td>
									<td class="orange">￥<span class="f20 bold">774</span></td>
									<td>1</td>
									<td><a href="pc/order/scenic" class="dark">删除订单</a></td>
								</tr>
								<tr><td colspan="4">
									<div class="clearfix mt10 pl10 pb10">
										<p class="dark fl">订单号：168586249624<span class="pl20">2015-05-12  12:00:00</span></p>
										<span class="grey9 fr">未消费</span>
									</div>
								</td></tr>
								<tr class="borderline tc">
									<td><a href="pc/mall/scenicGoodsDetialOfIntroduce"><img src="static/web/img/det1.png" width="145" height="103" class="vm"></a><span class="pl10 omission">如家酒店(苹果园地铁站店)-特别</span></td>
									<td class="orange">￥<span class="f20 bold">774</span></td>
									<td>1</td>
									<td><a href="pc/order/scenic" class="dark">删除订单</a></td>
								</tr>
								<tr><td colspan="4">
									<div class="clearfix mt10 pl10 pb10">
										<p class="dark fl">订单号：168586249624<span class="pl20">2015-05-12  12:00:00</span></p>
										<span class="grey9 fr">未消费</span>
									</div>
								</td></tr>
								<tr class="borderline tc">
									<td><a href="pc/mall/scenicGoodsDetialOfIntroduce"><img src="static/web/img/det1.png" width="145" height="103" class="vm"></a><span class="pl10 omission">如家酒店(苹果园地铁站店)-特别</span></td>
									<td class="orange">￥<span class="f20 bold">774</span></td>
									<td>1</td>
									<td><a href="pc/order/hotel" class="dark underline">删除订单</a></td>								</tr>
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
									<td><p class="mb20"><span class="operate optcancel"><a href="pc/order/scenic/evaluateNo">待评价</a></span></p><a href="pc/order/hotel" class="dark underline">删除订单</a></td>
									
								</tr>
							</table>
						</div>
						<div class="pagination">
							<a class="disabled" href="#">上一页</a>
							<a class="current" href="#">1</a>
							<a href="#">2</a>
							<a href="#">3</a>
							<span class="p_text">...</span>
							<a href="#">8</a>
							<a href="#">下一页</a>
							<span class="p_text">共8页，到第</span>
							<input class="gotopage" type="text" value="1" /> 页
							<input type="button" value="确定" />
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
<script type="text/javascript" src="static/js/index.js"></script>
</body>
</html>