<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../../../../static/inc_web.jsp" %>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv = "X-UA-Compatible" content = "IE=edge,chrome=1 " /><meta charset="utf-8"> 
<title>订单管理-漫游商城-景区-未消费-退款1</title>
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
					<span class="haslogin hasdownlist"><img src="static/web/imgavatar.jpg" class="avatar vm mr10" height="28" width="28" alt="">Hi  Mary<span class="downlist"><a href="">我的主页</a><a href="">订单管理</a><a href="">个人资料</a><a href="">账户设置</a><a href="">退出登录</a></span></span>
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
			<div class="breadcrumb">当前位置：<a href="">首页</a><a href="">订单管理</a><a href="">漫游商城</a><a href="">订单详情</a><span>退款</span></div>
			<div class="whitebg pb20">
				<div class="clearfix">
					<div class="fl reason">
						<p class="f18 bold grey9"><i class="iicon i-reason"></i>请填写退款原因</p>
						<p class="orange f12 mt10">注意:退款将在7个工作日内推到您的银行卡账户</p>
					</div>
					<div class="fl choose">
						<p class="grey f16"><i class="iicon i-check checked"></i>不想去了</p>
						<p class="grey f16"><i class="iicon i-check checked"></i>家中有事</p>
						<p class="grey f16 rel"><i class="iicon i-check" style="vertical-align:top;"></i><span class="vt pr10">其他</span><textarea></textarea><span class="abs tips">20字</span></p>
					</div>
				</div>
				<div class="tc mb20" style="margin-top:50px;">
					<button class="btn lorgbtn mr10">提交</button>
					<button class="btn" style="background:#5d5547;">返回</button>
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
<script type="text/javascript" src="static/jsjquery-1.11.1.min.js"></script>
<script type="text/javascript" src="static/jsbase.js"></script>
<script type="text/javascript">
$(function(){
	selfDefineFormBtn();
	HorizontalList();
});
</script>
</body>
</html>