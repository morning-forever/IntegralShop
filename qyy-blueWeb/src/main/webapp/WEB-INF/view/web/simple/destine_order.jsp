<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transition al.dtd"><%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../../static/inc_web.jsp" %>
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv = "X-UA-Compatible" content = "IE=edge,chrome=1 " /><meta charset="utf-8"> 
<title>行程方案-提交订单</title>
<link rel="stylesheet" href="static/web/css/common.css" />
<link rel="stylesheet" href="static/web/css/inner.style.css" />
<link rel="stylesheet" href="static/web/css/quick.travel.css" />
<link rel="stylesheet" href="static/web/css/travel.plan.css" />
</head>
<body>
<div class="wrapper inner">
	<!-- header -->
	<div class="header">
		<jsp:include page="../common/header.jsp"></jsp:include>		
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
				<li class="active"><a href="pc/simple/home">智易行</a></li>
				<li><a href="pc/cart/home">快旅▪漫游</a></li>
				<li><a href="pc/depth/home">主题深度游</a></li>
				<li><a href="pc/interact/home">互动社区</a></li>
			</ul>
		</div>
	</div>

	<!-- page content -->
	<div class="content_wrap pb90">
		<div class="content">
			<div class="breadcrumb">当前位置：<a href="">首页</a><a href="">智能定制</a><span>提交订单</span></div>
			<div class="whitebg pb20">				
				<div class="pd20">
					<div class="f18 grey9 bold borderbs1 pl10 pb20 mb20">智能定制-贵阳游</div>
					<div class="mb20">
						<img src="static/web/img/pic2.jpg" height="113" width="197" alt="">
					</div>
					<h4 class="orangeh4 mb10">行程简介</h4>
					<div class="tab-content submit-order">
						<!-- 第1天 -->
						<p class="day-dot">第1天<span class="ml20">2015-6-11</span></p>
						<div class="sectionlist">
							<div class="section">
								<i class="iicon i-dot"></i>
								<p class="desc">07:55    大峡谷<br />
									08:00    金边<br />
									10:00    塔山寺<br />
									11:30    乌那隆寺<br />
									13:30    桃源呵漂流<br />
									15:30    息烽温泉<br />
									16:30    贵阳野生动物园<br />
									17:55    四季美酒店</p>
							</div>
						</div>
						<div class="tc mb20">							
							<span class="expandbtn">收起&nbsp;&nbsp;<i class="iicon i-up"></i></span>							
						</div>
					</div>
					<h4 class="orangeh4 mb20">行程信息</h4>				
					<p class="mb20 pl20 f12">
						<span class="grey w70">起始日</span><span class="grey9">2015-12-03</span>
						<span style="margin-left:120px;" class="grey ml20 w70">起始地</span><span class="grey9">贵州</span><span style="margin-left:120px;" class="grey ml20 w70">同行人数</span><span class="grey9">2成人，0儿童</span><span style="margin-left:120px;" class="grey ml20 w70">房间数</span><span class="grey9">2</span><br />
						<span class="grey w70">结束日</span><span class="grey9">2015-12-30</span>
						<span style="margin-left:120px;" class="grey ml20 w70">目的地</span><span class="grey9">贵州</span><span style="margin-left:120px;" class="grey ml20 w70">合计</span><span class="grey9">3天</span>				
					</p>
					<h4 class="orangeh4">拼车乘坐人信息</h4>
					<div class="form_box mt10 type2">
						<span class="inline f12 grey"><span class="red f12">* </span>姓名</span>
						<div class="form-item inline mr20" style="width:186px;">
							<input type="text" />
						</div>
						<span class="inline f12 grey"><span class="red f12">* </span>电话：</span>
						<div class="form-item inline mr20" style="width:186px;">
							<input type="text" placeholder="接收本次订单信息" />
						</div>
					</div>
					<div class="form_box mb10 type2">
						<span class="inline f12 grey"><span class="red f12">* </span>证件类型</span>
						<div class="form-item select-item inline" style="width:186px;">
							<span class="select-text">全部</span>
							<i class="iicon i-select"></i>
							<select name="" id="">
								<option value="">全部</option>
								<option value="">类型2</option>
							</select>
						</div>
						<span class="inline f12 grey"><span class="red f12">* </span>证件号码</span>
						<div class="form-item inline mr20" style="width:186px; margin-right:20px;">
							<input type="text" />
						</div>
						<div class="form-item select-item inline" style="width:85px; margin-right:20px;">
							<span class="select-text">成人</span>
							<i class="iicon i-select"></i>
							<select name="" id="">
								<option value="">全部</option>
								<option value="">类型2</option>
							</select>
						</div>
						<i class="addbtn iicon"></i>
					</div>
					<div class="form_box mt10 type2" style="border-top:1px dashed #cfcfcf;">
						<span class="inline f12 grey"><span class="red f12">* </span>姓名</span>
						<div class="form-item inline mr20" style="width:186px;">
							<input type="text" />
						</div>
						<span class="inline f12 grey"><span class="red f12">* </span>电话：</span>
						<div class="form-item inline mr20" style="width:186px;">
							<input type="text" placeholder="接收本次订单信息" />
						</div>
					</div>
					<div class="form_box mb10 type2">
						<span class="inline f12 grey"><span class="red f12">* </span>证件类型</span>
						<div class="form-item select-item inline" style="width:186px;">
							<span class="select-text">全部</span>
							<i class="iicon i-select"></i>
							<select name="" id="">
								<option value="">全部</option>
								<option value="">类型2</option>
							</select>
						</div>
						<span class="inline f12 grey"><span class="red f12">* </span>证件号码</span>
						<div class="form-item inline mr20" style="width:186px; margin-right:20px;">
							<input type="text" />
						</div>
					</div>
					<p class="red f12 mb10 borderttype2 pt10">您取车时需核对以上信息，请认真填写！</p>

					<h4 class="orangeh4">联系人信息</h4>
					<div class="form_box mt10 mb10 type2">
						<span class="inline f12 grey"><span class="red f12">* </span>姓名</span>
						<div class="form-item inline mr20" style="width:186px;">
							<input type="text" />
						</div>
						<span class="inline f12 grey"><span class="red f12">* </span>电话：</span>
						<div class="form-item inline mr20" style="width:186px;">
							<input type="text" placeholder="接收本次订单信息" />
						</div>
					</div>				
					<div class="pb20 pt20 borderttype2 tr">
						<span class="f16 mr10 grey9">订单总价</span><span class="lorange"><span class="f18">￥</span><span class="bold f30">2137</span></span>					
					</div>
					<div class="tr pt20">
						<input class="text mr10" type="text" placeholder="请输入验证码后提交" /><img class="mr20 vm" src="static/web/img/code.jpg" height="32" width="96" alt=""><span class="underline pointer lorange mr20">刷新</span>
						<button onclick="javascript:window.location='pc/simple/payment';" class="btn lorgbtn ml10" style="vertical-align:bottom;">提交订单</button>
					</div>					
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
});
</script>
</body>
</html>