<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transition al.dtd"><%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../../static/inc_web.jsp" %>
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv = "X-UA-Compatible" content = "IE=edge,chrome=1 " /><meta charset="utf-8"> 
<title>行程方案-行程明细</title>
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
				<li class="active"><a href="pc/simple/travelDetail">行程明细</a></li>
				<li><a href="pc/simple/budgetDetail">预算明细</a></li>
				<li><a href="pc/simple/equipList">装备清单</a></li>
				<li><a href="pc/simple/downlineActivity?op=scenic">线下活动</a></li>
			</ul>
			<div class="tab-content pd10 whitebg">
				<!-- 第1天 -->
				<p class="day-dot">第1天<span class="ml20">2015-6-11</span></p>
				<p class="f16 time-dot">上午</p>
				<div class="sectionlist">
					<div class="section clearfix">
						<i class="iicon i-dot"></i>
						<img class="fr section-img" src="static/web/img/det1.png" height="158" width="343" alt="">
						<h5><span class="spanbtn" name="view_detail">大峡谷</span></h5>
						<p class="f12 grey9 mb10">推荐游玩时间  <span class="lorange">1小时30分钟</span></p>
						<p class="desc">由市区出发前往大峡谷（车乘1.5小时左右），参观大峡谷，这里曾是抗日战争时期国民党军统设立
的规模最大、等级最高的一所秘密监狱 ,从1938年至1945年曾经关押过杨虎城、张露萍、小萝卜头
等爱国人士多达3000多人 </p>
					</div>
					<div class="section clearfix">
						<i class="iicon i-dot"></i>
						<img class="fr section-img" src="static/web/img/det2.jpg" height="158" width="343" alt="">
						<h5>大峡谷</h5>
						<p class="f12 grey9 mb10">推荐游玩时间  <span class="lorange">1小时30分钟</span></p>
						<p class="desc">由市区出发前往大峡谷（车乘1.5小时左右），参观大峡谷，这里曾是抗日战争时期国民党军统设立
的规模最大、等级最高的一所秘密监狱 ,从1938年至1945年曾经关押过杨虎城、张露萍、小萝卜头
等爱国人士多达3000多人 </p>
					</div>
					<div class="section clearfix">
						<i class="iicon i-dot"></i>
						<img class="fr section-img" src="static/web/img/det3.png" height="158" width="343" alt="">
						<h5><span class="spanbtn" name="hotal_detail">嘉华大酒店</span></h5>
						<p class="f12 grey9 mb10">推荐游玩时间  <span class="lorange">1小时30分钟</span></p>
						<p class="desc">由市区出发前往大峡谷（车乘1.5小时左右），参观大峡谷，这里曾是抗日战争时期国民党军统设立
的规模最大、等级最高的一所秘密监狱 ,从1938年至1945年曾经关押过杨虎城、张露萍、小萝卜头
等爱国人士多达3000多人 </p>
					</div>
				</div>
				<p class="f16 time-dot">下午</p>
				<div class="sectionlist">
					<div class="section clearfix">
						<i class="iicon i-dot"></i>
						<img class="fr section-img" src="static/web/img/det4.png" height="158" width="343" alt="">
						<h5>大峡谷</h5>
						<p class="f12 grey9 mb10">推荐游玩时间  <span class="lorange">1小时30分钟</span></p>
						<p class="desc">由市区出发前往大峡谷（车乘1.5小时左右），参观大峡谷，这里曾是抗日战争时期国民党军统设立
的规模最大、等级最高的一所秘密监狱 ,从1938年至1945年曾经关押过杨虎城、张露萍、小萝卜头
等爱国人士多达3000多人 </p>
					</div>
					<div class="section clearfix">
						<i class="iicon i-dot"></i>
						<img class="fr section-img" src="static/web/img/det5.png" height="158" width="343" alt="">
						<h5>大峡谷</h5>
						<p class="f12 grey9 mb10">推荐游玩时间  <span class="lorange">1小时30分钟</span></p>
						<p class="desc">由市区出发前往大峡谷（车乘1.5小时左右），参观大峡谷，这里曾是抗日战争时期国民党军统设立
的规模最大、等级最高的一所秘密监狱 ,从1938年至1945年曾经关押过杨虎城、张露萍、小萝卜头
等爱国人士多达3000多人 </p>
					</div>
					<div class="section clearfix">
						<i class="iicon i-dot"></i>
						<img class="fr section-img" src="static/web/img/det6.png" height="158" width="343" alt="">
						<h5>大峡谷</h5>
						<p class="f12 grey9 mb10">推荐游玩时间  <span class="lorange">1小时30分钟</span></p>
						<p class="desc">由市区出发前往大峡谷（车乘1.5小时左右），参观大峡谷，这里曾是抗日战争时期国民党军统设立
的规模最大、等级最高的一所秘密监狱 ,从1938年至1945年曾经关押过杨虎城、张露萍、小萝卜头
等爱国人士多达3000多人 </p>
					</div>
				</div>

				<!-- 第2天 -->
				<p class="day-dot">第2天<span class="ml20">2015-6-12</span></p>
				<p class="f16 time-dot">上午</p>
				<div class="sectionlist">
					<div class="section clearfix">
						<i class="iicon i-dot"></i>
						<img class="fr section-img" src="static/web/img/det1.png" height="158" width="343" alt="">
						<h5>大峡谷</h5>
						<p class="f12 grey9 mb10">推荐游玩时间  <span class="lorange">1小时30分钟</span></p>
						<p class="desc">由市区出发前往大峡谷（车乘1.5小时左右），参观大峡谷，这里曾是抗日战争时期国民党军统设立
的规模最大、等级最高的一所秘密监狱 ,从1938年至1945年曾经关押过杨虎城、张露萍、小萝卜头
等爱国人士多达3000多人 </p>
					</div>
					<div class="section clearfix">
						<i class="iicon i-dot"></i>
						<img class="fr section-img" src="static/web/img/det2.jpg" height="158" width="343" alt="">
						<h5>大峡谷</h5>
						<p class="f12 grey9 mb10">推荐游玩时间  <span class="lorange">1小时30分钟</span></p>
						<p class="desc">由市区出发前往大峡谷（车乘1.5小时左右），参观大峡谷，这里曾是抗日战争时期国民党军统设立
的规模最大、等级最高的一所秘密监狱 ,从1938年至1945年曾经关押过杨虎城、张露萍、小萝卜头
等爱国人士多达3000多人 </p>
					</div>
					<div class="section clearfix">
						<i class="iicon i-dot"></i>
						<img class="fr section-img" src="static/web/img/det3.png" height="158" width="343" alt="">
						<h5>大峡谷</h5>
						<p class="f12 grey9 mb10">推荐游玩时间  <span class="lorange">1小时30分钟</span></p>
						<p class="desc">由市区出发前往大峡谷（车乘1.5小时左右），参观大峡谷，这里曾是抗日战争时期国民党军统设立
的规模最大、等级最高的一所秘密监狱 ,从1938年至1945年曾经关押过杨虎城、张露萍、小萝卜头
等爱国人士多达3000多人 </p>
					</div>
				</div>
				<p class="f16 time-dot">下午</p>
				<div class="sectionlist">
					<div class="section clearfix">
						<i class="iicon i-dot"></i>
						<img class="fr section-img" src="static/web/img/det4.png" height="158" width="343" alt="">
						<h5>大峡谷</h5>
						<p class="f12 grey9 mb10">推荐游玩时间  <span class="lorange">1小时30分钟</span></p>
						<p class="desc">由市区出发前往大峡谷（车乘1.5小时左右），参观大峡谷，这里曾是抗日战争时期国民党军统设立
的规模最大、等级最高的一所秘密监狱 ,从1938年至1945年曾经关押过杨虎城、张露萍、小萝卜头
等爱国人士多达3000多人 </p>
					</div>
					<div class="section clearfix">
						<i class="iicon i-dot"></i>
						<img class="fr section-img" src="static/web/img/det5.png" height="158" width="343" alt="">
						<h5>大峡谷</h5>
						<p class="f12 grey9 mb10">推荐游玩时间  <span class="lorange">1小时30分钟</span></p>
						<p class="desc">由市区出发前往大峡谷（车乘1.5小时左右），参观大峡谷，这里曾是抗日战争时期国民党军统设立
的规模最大、等级最高的一所秘密监狱 ,从1938年至1945年曾经关押过杨虎城、张露萍、小萝卜头
等爱国人士多达3000多人 </p>
					</div>
					<div class="section clearfix">
						<i class="iicon i-dot"></i>
						<img class="fr section-img" src="static/web/img/det6.png" height="158" width="343" alt="">
						<h5>大峡谷</h5>
						<p class="f12 grey9 mb10">推荐游玩时间  <span class="lorange">1小时30分钟</span></p>
						<p class="desc">由市区出发前往大峡谷（车乘1.5小时左右），参观大峡谷，这里曾是抗日战争时期国民党军统设立
的规模最大、等级最高的一所秘密监狱 ,从1938年至1945年曾经关押过杨虎城、张露萍、小萝卜头
等爱国人士多达3000多人 </p>
					</div>
				</div>

			</div> 

			
			

		</div>			
	</div>

	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
</div>

<!-- 查看酒店介绍详情 -->
<script id="detail_popup" type="text/template">
<div class="innerdiv detail_popup" style="width:640px; margin:0 auto;">
	<i class="iicon i-hotel l-icon"></i>
	<div class="r-content">
		<h5>酒店介绍</h5>
		<div class="desc">
			<p>遵义嘉华酒店位于遵义市红花岗区解放路57号，遵义市中级人民法院旁边，毗邻红军烈士陵园，距遵义会议会址约100米，是距遵义市旅游景点最近的一家新型商务酒店。酒店地理位置优越，交通十分便捷。遵义华雅酒店拥有客房共99间（套），客房内电视、宽带高速上网、独立卫生间等设施齐全，温馨别致。是您商务出行、休闲度假的理想之选。</p>
			<p>酒店开业时间2007年7月，新近装修时间2012年5月，局部装修，主楼高8层，附楼高2层，客房总数99间（套）。</p>
		</div>		
		<h5><i class="iicon i-addr"></i>酒店地址</h5>
		<p class="f12">贵州省遵义乌江镇乌江渡风</p>
		<h5><i class="iicon i-price"></i>酒店价格</h5>
		<p class="f12"><span class="f16 lorange">358</span>元人民币</p>
		<h5><i class="iicon i-star"></i>星级</h5>
		<p class="f12">四星级酒店</p>
		<h5 class="mb10"><i class="iicon i-pic"></i>酒店图片</h5>
		<div class="pb20 pic-wrap">
			<img src="static/web/img/hotalpic.jpg" width="180" />
			<img src="static/web/img/hotalpic.jpg" width="180" />
			<img src="static/web/img/hotalpic.jpg" width="180" />
		</div>
	</div>
</div>
</script>

<!-- 查看景区介绍详情 -->
<script id="detail_popup2" type="text/template">
<div class="innerdiv detail_popup" style="width:640px; margin:0 auto;">
	<i class="iicon i-p l-icon"></i>
	<div class="r-content">
		<h5>酒店介绍</h5>
		<div class="desc">
			<p>遵义嘉华酒店位于遵义市红花岗区解放路57号，遵义市中级人民法院旁边，毗邻红军烈士陵园，距遵义会议会址约100米，是距遵义市旅游景点最近的一家新型商务酒店。酒店地理位置优越，交通十分便捷。遵义华雅酒店拥有客房共99间（套），客房内电视、宽带高速上网、独立卫生间等设施齐全，温馨别致。是您商务出行、休闲度假的理想之选。</p>
			<p>酒店开业时间2007年7月，新近装修时间2012年5月，局部装修，主楼高8层，附楼高2层，客房总数99间（套）。</p>
		</div>
		<h5><i class="iicon i-star"></i>景区星级</h5>
		<p class="f12"><span class="lorange">AAAA</span></p>		
		<h5><i class="iicon i-addr"></i>景区地址</h5>
		<p class="f12">贵州省遵义乌江镇乌江渡风</p>
		<h5><i class="iicon i-price"></i>景区费用</h5>
		<p class="f12">成人：<span class="lorange">40</span><span class="mr20">元</span>儿童：<span class="lorange">20</span>元</p>		
		<h5 class="mb10"><i class="iicon i-pic"></i>景区图片</h5>
		<div class="pb20 pic-wrap">
			<img src="static/web/img/viewpic.png" width="180" />
			<img src="static/web/img/viewpic.png" width="180" />
			<img src="static/web/img/viewpic.png" width="180" />
		</div>
	</div>
</div>
</script>


<script type="text/javascript" src="static/web/js/base.js"></script>
<script type="text/javascript">
$(function(){
	// 酒店介绍对话框
	var detailpopupDlg = new dialogBox({
		title : '嘉华大酒店',
		selfClass : "type2",
		contentHtml : $("#detail_popup").html(),
		popupBoxW : 830,
		initEvent : function($dom){
		}
	});
	$("[name=hotal_detail]").click(function(){
		detailpopupDlg.showDlg();
	});
	// 景区介绍对话框
	var detailpopupDlg2 = new dialogBox({
		title : '大峡谷',
		selfClass : "type2",
		contentHtml : $("#detail_popup2").html(),
		popupBoxW : 830,
		initEvent : function($dom){
		}
	});
	$("[name=view_detail]").click(function(){
		detailpopupDlg2.showDlg();
	});
});
</script>
</body>
</html>