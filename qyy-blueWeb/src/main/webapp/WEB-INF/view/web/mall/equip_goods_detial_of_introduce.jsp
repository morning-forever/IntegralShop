<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../../../static/inc_web.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath %>">
<title>漫游商城-装备详情-商家介绍</title>
<link rel="stylesheet" href="static/web/css/common.css" />
<link rel="stylesheet" href="static/web/css/inner.style.css" />
<link rel="stylesheet" href="static/web/css/inner.page.css" />
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
				<li><a href="#">首页</a></li>
				<li><a href="#">智能定制</a></li>
				<li class="active">
				<a href="pc/cart/home">快旅▪漫游</a>
					<div class="level2_nav">
						<div class="fl">
							<h3>快旅出行</h3>
							<div><a href="#">快旅租车</a><a href="#">快旅包车</a><a href="#">快旅班车</a><a href="#">快旅拼车</a></div>
						</div>
						<div class="fl">
							<h3>漫游商城</h3>
							<div>
							<a href="pc/mall/scenicGoodsList">景区</a>
							<a href="pc/mall/hotelGoodsList">酒店</a>
							<a href="pc/mall/caterGoodsList">餐饮</a>
							<a href="pc/mall/equipGoodsList">装备</a>
							</div>
						</div>
					</div>
				</li>
				<li><a href="#">主题深度游</a></li>
				<li><a href="#">互动社区</a></li>
			</ul>
		</div>
	</div>

	<!-- page content -->
	<div class="content_wrap pb90" style="padding-top:25px;">
		<div class="content whitebg">		
			<div class="detail_wrap clearfix">
			    <div class="fl detail_l">			    	
					<div class="bigimg_wrap rel">
						<img src="static/web/img/eqm_bigimg.jpg" width="454" height="256" />
						<img src="static/web/img/eqm_bigimg.jpg" width="454" height="256" />
						<img src="static/web/img/eqm_bigimg.jpg" width="454" height="256" class="current" />
						<img src="static/web/img/eqm_bigimg.jpg" width="454" height="256" />
					</div>
					<div class="thumbs">
						<div class="thumbs_list clearfix">
							<img src="static/web/img/eqm_thumb1.jpg" width="97" height="55" />
							<img src="static/web/img/eqm_thumb2.jpg" width="97" height="55" class="current"  />
							<img src="static/web/img/eqm_thumb3.jpg" width="97" height="55" />
							<img src="static/web/img/eqm_thumb4.jpg" width="97" height="55" />
						</div>
					</div>
			    </div>
				<div class="fr detail_r rel">
					<h3 class="detail-title">公狼帐篷户外</h3>
					<p class="mb20 pro-desc"><span class="lorange">仅售97元！</span>价值232元的超值帐篷，您居家旅行的必需品</p>
					<div class="detail_item mb10">
						<span class="l_title">规格</span>
						<div class="r-content">
							<span class="s-value ss_value">大</span><span class="s-value ss_value selected">中</span><span class="s-value ss_value">小</span>
						</div>
					</div>
					<div class="detail_item mb10">
						<span class="l_title">颜色</span>
						<div class="r-content">
							<span class="s-value ss_value">红色</span><span class="s-value ss_value selected">黄色</span><span class="s-value ss_value">蓝色</span>
						</div>
					</div>
					<div class="detail_item mb10">
						<span class="l_title">价格</span>
						<div class="r-content">
							<span class="orange">¥<span class="f24 orange bold">237.00</span></span>
							<span class="grey9 ml20 throughline">¥<span class="f20 bold">337.00</span></span>
						</div>
					</div>
					<div style="margin-top:65px;"><span class="pointer favorite grey9"><i class="iicon i-fav"></i>&nbsp;收藏（110）</span></div>
				</div>
			</div>
			<!-- 该商家其他商品 -->
			<div class="hotalunit">				
				<ul class="horizontal_ul type2">
					<li class="ulheader">
						<span class="col1">该商家其他商品</span>
						<span class="col2">活动价</span>
						<span class="col3">门店价</span>
						<span class="col4">已售</span>
					</li>
					<li>
						<span class="col1"><a href="">高大上帐篷、遮风挡雨 仅售97元！价值232元的超值帐篷品</a></span>
						<span class="col2 orange">￥<span class="f20 bold">237.00</span></span>
						<span class="col3">¥320.00</span>
						<span class="col4">53210</span>
					</li>
					<li>
						<span class="col1"><a href="">高大上帐篷、遮风挡雨 仅售97元！价值232元的超值帐篷品</a></span>
						<span class="col2 orange">￥<span class="f20 bold">237.00</span></span>
						<span class="col3">¥320.00</span>
						<span class="col4">53210</span>
					</li>	
					<li>
						<span class="col1"><a href="">高大上帐篷、遮风挡雨 仅售97元！价值232元的超值帐篷品</a></span>
						<span class="col2 orange">￥<span class="f20 bold">237.00</span></span>
						<span class="col3">¥320.00</span>
						<span class="col4">53210</span>
					</li>	
					<li>
						<span class="col1"><a href="">高大上帐篷、遮风挡雨 仅售97元！价值232元的超值帐篷品</a></span>
						<span class="col2 orange">￥<span class="f20 bold">237.00</span></span>
						<span class="col3">¥320.00</span>
						<span class="col4">53210</span>
					</li>					
				</ul>
				<span class="expandall">展开剩余1个</span>
			</div>
			
			<!-- 其他信息 -->
			<ul class="atab clearfix">
				<li class="active"><a href="pc/mall/equipGoodsDetialOfIntroduce">商家介绍</a></li>
				<li><a href="pc/mall/equipGoodsDetialOfDetial">商品详情</a></li>
			</ul>
			<div class="detail-content">
				<div class="listitem">
					<span class="l-title"><i class="iicon i-seller"></i>商家名称：</span>
					<div class="r-content">贵州万美优旅行社有限公司</div>
				</div>
				<div class="listitem">
					<span class="l-title"><i class="iicon i-addr"></i>商家地址：</span>
					<div class="r-content">贵阳南京南路西123号</div>
				</div>
				<div class="listitem">
					<span class="l-title"><i class="iicon i-contactnum"></i>商家电话：</span>
					<div class="r-content"><span class="green">0851-67854345</span></div>
				</div>
				<div class="listitem">
					<span class="l-title"><i class="iicon i-install2"></i>店内设施：</span>
					<div class="r-content"><i class="iicon i-wifi"></i>免费WIFI<span class="ml20">P 免费泊车</span></div>
				</div>
				<div class="listitem">
					<span class="l-title"><i class="iicon i-intro"></i>商家介绍：</span>
					<div class="r-content">
						优美装备有限公司贵阳分公司，是一家专业运动装备公司
					</div>
				</div>
				<div class="img-text">
					<img src="static/web/img/eqm_detail1.jpg" alt="">
					<img src="static/web/img/eqm_detail2.jpg" alt="">
					<img src="static/web/img/eqm_detail3.jpg" alt="">
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

<script type="text/javascript" src="static/web/js/base.js"></script>
<script type="text/javascript">
$(function(){
	selfDefineFormBtn();
	InitPronum();
	previewProDetailImg();
});
</script>
</body>
</html>