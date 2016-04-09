<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../../../static/inc_web.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath %>">
<title>漫游商城－景区详情－商家介绍</title>
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
						<img src="static/web/img/bigimg.jpg" width="454" height="256" />
						<img src="static/web/img/bigimg.jpg" width="454" height="256" />
						<img src="static/web/img/bigimg.jpg" width="454" height="256" class="current" />
						<img src="static/web/img/bigimg.jpg" width="454" height="256" />
					</div>
					<div class="thumbs">
						<div class="thumbs_list clearfix">
							<img src="static/web/img/thumb1.jpg" width="97" height="55" />
							<img src="static/web/img/thumb2.jpg" width="97" height="55" />
							<img src="static/web/img/thumb3.jpg" width="97" height="55" class="current" />
							<img src="static/web/img/thumb4.jpg" width="97" height="55" />
						</div>
					</div>
			    </div>
				<div class="fr detail_r rel">
					<h3 class="detail-title">【贵阳欢乐谷】贵阳欢乐谷-夜场狂欢半价票价</h3>
					<p class="mb20 pro-desc"><span class="lorange">仅售97元！</span>最高价值247元，贵阳欢乐谷-夜场狂欢半价票【半价特惠】</p>
					<div class="detail_item mb10">
						<span class="l_title">价格</span>
						<div class="r-content">
							<span class="orange">¥<span class="f24 orange bold">237.00</span></span>
							<span class="grey9 ml20 throughline">¥<span class="f20 bold">337.00</span></span>
						</div>
						<span class="grey9 hassale">已售：23</span>
					</div>
					<div class="detail_item pronum_section mb20">
						<span class="l_title">数量</span>
						<div class="r-content">
							<span class="pronum_unit" style="margin-right:40px;"><button class="des_btn disabled">-</button><input type="text" /><button class="res_btn">+</button></span>				
							<a href="pc/mall/scenicGoodsDetialBeforePay" class="btn lorgbtn">立即预定</a>
						</div>
					</div>
					<div><span class="pointer favorite grey9"><i class="iicon i-fav"></i>&nbsp;收藏（110）</span></div>
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
						<span class="col1"><a href="">【贵阳欢乐谷】贵阳欢乐谷-夜场狂欢半价票【半价特惠】</a></span>
						<span class="col2 orange">￥<span class="f20 bold">237.00</span></span>
						<span class="col3">¥320.00</span>
						<span class="col4">53210</span>
					</li>
					<li>
						<span class="col1"><a href="">【贵阳欢乐谷】贵阳欢乐谷-夜场狂欢半价票【半价特惠】</a></span>
						<span class="col2 orange">￥<span class="f20 bold">237.00</span></span>
						<span class="col3">¥320.00</span>
						<span class="col4">53210</span>
					</li>	
					<li>
						<span class="col1"><a href="">【贵阳欢乐谷】贵阳欢乐谷-夜场狂欢半价票【半价特惠】</a></span>
						<span class="col2 orange">￥<span class="f20 bold">237.00</span></span>
						<span class="col3">¥320.00</span>
						<span class="col4">53210</span>
					</li>	
					<li>
						<span class="col1"><a href="">【贵阳欢乐谷】贵阳欢乐谷-夜场狂欢半价票【半价特惠】</a></span>
						<span class="col2 orange">￥<span class="f20 bold">237.00</span></span>
						<span class="col3">¥320.00</span>
						<span class="col4">53210</span>
					</li>					
				</ul>
				<span class="expandall">展开剩余1个</span>
			</div>
			
			<!-- 其他信息 -->
			<ul class="atab clearfix">
				<li class="active"><a href="pc/mall/scenicGoodsDetialOfIntroduce">商家介绍</a></li>
				<li><a href="pc/mall/scenicGoodsDetialOfDetial">商品详情</a></li>
				<li><a href="pc/mall/scenicGoodsDetialOfComment">用户评价(<span class="f12">2</span>)</a></li>
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
					<span class="l-title"><i class="iicon i-intro"></i>商家介绍：</span>
					<div class="r-content">
						<p>贵州万美优旅行社有限公司，是由贵州省旅游局、贵阳市旅游局批准成立，经贵州省贵阳市南明区工商行政管理局登记注册，并足额缴纳质量保证金的一家具有独立法人资质的旅游企业。旅行社业务经营许可证号：L-GZ00395。经营范围包括入境及国内旅游业务；会务服务；展览展示服务；票务代理；广告策划、设计。</p>
						<p>公司和全贵州的旅游酒店、宾馆、景区、车队、餐厅等旅游相关接待单位建立了友好合作关系，和全国各地旅行社建立了友好业务往来。公司已拥有训练有素、经验丰富、服务热忱、热爱“万美优”的核心操作团队和高素质的导游队伍。在全国旅游市场转型升级的大环境下，公司将重点致力于“万”（提供多元化旅游服务）、“美”（让游客感悟旅游之美“优”（充分整合旅游资源让游客真正得到实惠），这就是我们“万美优”旅行社存在的价值，也是我们的使命！公司以“服务广”、“质量高”、“价格优”为发展目标，以全心服务、悉心策划、注重品质特色为经营核心，在满足顾客需求的基础上继续精益求精、追求卓越</p>
					</div>
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