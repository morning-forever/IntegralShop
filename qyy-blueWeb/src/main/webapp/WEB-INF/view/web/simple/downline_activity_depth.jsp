<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transition al.dtd"><%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../../static/inc_web.jsp" %>
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv = "X-UA-Compatible" content = "IE=edge,chrome=1 " /><meta charset="utf-8"> 
<title>行程方案－线下活动（主题深度游）</title>
<link rel="stylesheet" href="static/web/css/common.css" />
<link rel="stylesheet" href="static/web/css/inner.style.css" />
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
	<div class="content_wrap pt20 pb90">
		<div class="content clearfix">
			<div class="topbox whitebg mb20">
				<div class="pl20"><span class="tagspan">行程方案</span></div>
				<div class="itemwrap">
					<span class="item"><span class="item-l">行程日期</span>2015-6-11至2015-6-14</span>
					<span class="item"><span class="item-l">原始预算</span>无具体预算/1000元</span>
					<span class="item"><span class="item-l">原始总费用 </span><span class="orange">￥<span class="f24">774</span></span></span>
					<span class="item"><span class="item-l">同行人数</span>2成人，0儿童</span>
					<span class="item"><span class="item-l">起始地</span>贵州</span>
					<span class="item"><span class="item-l">目的地</span>贵阳</span>
				</div>
				<div class="clearfix pl20 pr20 pb20">
					<a href="pc/simple/destine" class="btn lorgbtn fr"><i class="iicon i-order mr10"></i>我要预定</a>
					<a href="" class="btn lwhitebtn mr20">收藏我的行程</a>
					<a href="" class="btn lwhitebtn mr20">重新运算行程</a>
					<a href="" class="btn lwhitebtn">建新行程</a>
				</div>
			</div>

			<ul class="atab clearfix">
				<li><a href="pc/simple/home">行程计划</a></li>
				<li><a href="pc/simple/travelDetail">行程明细</a></li>
				<li><a href="pc/simple/budgetDetail">预算明细</a></li>
				<li><a href="pc/simple/equipList">装备清单</a></li>
				<li class="active"><a href="pc/simple/downlineActivity?op=scenic">线下活动</a></li>
			</ul>
			<div class="tab-content whitebg">
				<div class="tablinks three-cols bordert1">
					<a href="pc/simple/downlineActivity?op=scenic" >景 区</a><span class="divid-line"></span><a href="pc/simple/downlineActivity?op=hotel">酒 店</a><span class="divid-line"></span><a href="pc/simple/downlineActivity?op=depth"  class="active">主题深度游</a>
				</div>
				<div class="listwrap type2 topic_list">
					<ul class="list_ul clearfix">
						<li>
							<a href=""><img src="static/web/img/topic1.jpg" height="169" width="228" alt=""></a>
							<div class="incont">
								<h4><a href="">夏威夷岛五日游</a></h4>
								<div class="price"><span class="f14">￥</span><span class="bold">9980</span><span class="salenum">已售：561</span></div>							
								<div class="star-level"><span class="mr10">推荐指数：</span><span class="star_wrap iicon"><span class="star_value iicon" style="width:80%;"></span></span></div>
							</div>							
						</li>
						<li>
							<a href=""><img src="static/web/img/topic2.jpg" height="169" width="228" alt=""></a>
							<div class="incont">
								<h4><a href="">夏威夷岛五日游</a></h4>
								<div class="price"><span class="f14">￥</span><span class="bold">9980</span><span class="salenum">已售：561</span></div>
								<div class="star-level"><span class="mr10">推荐指数：</span><span class="star_wrap iicon"><span class="star_value iicon" style="width:80%;"></span></span></div>							
							</div>							
						</li>
						<li>
							<a href=""><img src="static/web/img/topic1.jpg" height="169" width="228" alt=""></a>
							<div class="incont">
								<h4><a href="">夏威夷岛五日游</a></h4>
								<div class="price"><span class="f14">￥</span><span class="bold">9980</span><span class="salenum">已售：561</span></div>							
								<div class="star-level"><span class="mr10">推荐指数：</span><span class="star_wrap iicon"><span class="star_value iicon" style="width:80%;"></span></span></div>
							</div>							
						</li>
						<li>
							<a href=""><img src="static/web/img/topic2.jpg" height="169" width="228" alt=""></a>
							<div class="incont">
								<h4><a href="">夏威夷岛五日游</a></h4>
								<div class="price"><span class="f14">￥</span><span class="bold">9980</span><span class="salenum">已售：561</span></div>
								<div class="star-level"><span class="mr10">推荐指数：</span><span class="star_wrap iicon"><span class="star_value iicon" style="width:80%;"></span></span></div>							
							</div>							
						</li>
						<li>
							<a href=""><img src="static/web/img/topic1.jpg" height="169" width="228" alt=""></a>
							<div class="incont">
								<h4><a href="">夏威夷岛五日游</a></h4>
								<div class="price"><span class="f14">￥</span><span class="bold">9980</span><span class="salenum">已售：561</span></div>							
								<div class="star-level"><span class="mr10">推荐指数：</span><span class="star_wrap iicon"><span class="star_value iicon" style="width:80%;"></span></span></div>
							</div>							
						</li>
						<li>
							<a href=""><img src="static/web/img/topic2.jpg" height="169" width="228" alt=""></a>
							<div class="incont">
								<h4><a href="">夏威夷岛五日游</a></h4>
								<div class="price"><span class="f14">￥</span><span class="bold">9980</span><span class="salenum">已售：561</span></div>
								<div class="star-level"><span class="mr10">推荐指数：</span><span class="star_wrap iicon"><span class="star_value iicon" style="width:80%;"></span></span></div>							
							</div>							
						</li>
						<li>
							<a href=""><img src="static/web/img/topic1.jpg" height="169" width="228" alt=""></a>
							<div class="incont">
								<h4><a href="">夏威夷岛五日游</a></h4>
								<div class="price"><span class="f14">￥</span><span class="bold">9980</span><span class="salenum">已售：561</span></div>							
								<div class="star-level"><span class="mr10">推荐指数：</span><span class="star_wrap iicon"><span class="star_value iicon" style="width:80%;"></span></span></div>
							</div>							
						</li>
						<li>
							<a href=""><img src="static/web/img/topic2.jpg" height="169" width="228" alt=""></a>
							<div class="incont">
								<h4><a href="">夏威夷岛五日游</a></h4>
								<div class="price"><span class="f14">￥</span><span class="bold">9980</span><span class="salenum">已售：561</span></div>
								<div class="star-level"><span class="mr10">推荐指数：</span><span class="star_wrap iicon"><span class="star_value iicon" style="width:80%;"></span></span></div>							
							</div>							
						</li>						
					</ul>

				</div>
			</div>
		</div>			
	</div>

	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
</div>

<script type="text/javascript" src="static/web/js/index.js"></script>
<script type="text/javascript">
$(function(){
	scrollBannerInit($(".banner-ul"),$(".banner-btn"));
});
</script>
</body>
</html>