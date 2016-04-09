<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transition al.dtd"><%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../../static/inc_web.jsp" %>
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv = "X-UA-Compatible" content = "IE=edge,chrome=1 " /><meta charset="utf-8"> 
<title>会员互动-个人主页</title>
<link rel="stylesheet" href="static/web/css/common.css" />
<link rel="stylesheet" href="static/web/css/inner.style.css" />
<link rel="stylesheet" href="static/web/css/personal.center.css" />
<link rel="stylesheet" href="static/web/css/member.css"/>
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
				<li>
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
				<li><a href="pc/depth/home">主题深度游</a></li>
				<li class="active">
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
		<div class="content">
		    <div class="breadcrumb">当前位置：<a href="">首页</a><a href="">个人主页</a><a href="">攻略游记 </a><span>预览</span></div>
			<div class="whitebg">
				<div class="detail_wrap2">
				   <div class="head_txt pb20">
				     <img src="static/web/img/avatar2.jpg"/>
					 <div class="product">
					   <h3>他说带我看世界 之 美国西海岸自驾游之旅~第十五篇 利弗莫尔</h3>
					   <div class="product_cent clearfix">
					     <div class="pro_le">
						   <p>Ssinz</p>
						   <div class="paramitem"><span class="grey9">等级</span>
						      <span class="orange">普通会员</span>
							  <span><i class="iicon i-medals"></i><i class="iicon i-medals"></i><i class="iicon i-medals"></i><i class="iicon i-medals"></i><i class="iicon i-medals"></i></span>
							  <span class="grey9">类型</span>
							  <span class="orange">精彩游记</span>
							  <span class="grey9">人气</span>
							  <span class="orange">14734</span>
							  <span class="carparam grey9"><i class="i-icon23"></i>2014-05-27 16:15</span>
							  <span class="grey9">价格</span>
							  <span class="orange">260元起</span>
						   </div>
						 </div>
					   </div>
					 </div>
				   </div>
				   <div class="head_cent borderno">
				     <p>他说带我看世界，于是我们来到了美国西海岸，开始我们的自驾之旅。我们都是爱旅游的人~我想看外面的世界。因为有了你，我的生活变得不同，因为有了我，你的生活变得更加精彩......如果说这是我们的婚后蜜月，那么我觉得我和你的每次出行都是我们的蜜月~这是我们婚后第二次旅行~</p>
					 <h3 class="h-title">行程计划</h3>
					 <p>这次的旅行已经接近尾声了，旅行的最后一天我们来到美国加利福尼亚州的中部城市利弗莫尔，来这里主要是因为我们有个朋友在这生活，来见个面，顺便逛逛尾货市场啊和大超市，采购点东西。利弗莫尔在圣弗朗西斯科（San Francisco）以东68公里。人口4.8万（1980）。建于1876年。距离旧金70公里，开车需要50分钟左右。</p>
					 <p>我们一路从蒙特雷开车开了两个小时，160公路的路程，来到了利弗莫尔，下面这张照片是途径的的葡萄园哦！非常漂亮呢！车速太快了我只能抓拍一张！</p>
					 <img src="static/web/img/banner2.jpg"/>
					 <h3 class="h-title">联系方式</h3>
					 <dl><dt>告诉一下大家Costco地址吧：</dt>
                         <dd>2800 Independence Drive</dd>
                         <dd>Livermore, CA 94550, United States</dd>
                         <dd>+1925-443-6306</dd>
					 </dl>
					 <dl><dt>我们住的酒店的名字：</dt>
                         <dd>2800 Independence Drive</dd>
                         <dd>利弗莫尔凯富酒店 Comfort Inn Livermore Hotel</dd>
					 </dl>
					 <dl><dt>酒店的地址：</dt>
                         <dd>2625 Constitution Drive</dd>
                         <dd>Livermore, CA 94551, United States</dd>
						 <dd>+1925-606-6200</dd>
					 </dl>
					 <div class="tr"><!-- <button class="btn">返回</button> --><a class="btn" href="pc/user/home">返回</a></div>
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
<div class="innerdiv pd20 tc">
	<p style="padding:50px 0; color:#333;">收藏成功</p>
	<button class="Btn" name="case-ok">确认</button>
</div>
</script>
<script type="text/javascript" src="static/web/jsbase.js"></script>
<script type="text/javascript" src="static/web/jsindex.js"></script>
<script type="text/javascript" src="static/web/jsperson.js"></script>
<script type="text/javascript">
$(function(){
	previewProDetailImg();
	selfDefineFormBtn();
	// 修改身份对话框
	var ruleDlg = new dialogBox({
		title : "提示",
		contentHtml : $("#rulepopup").html(),
		popupBoxW : 490,
		closeBtnshow : 0,
		initEvent : function($dom){
		}
	});
	$(".i-collect i").click(function(){
		ruleDlg.showDlg();
	});

});
</script>
</body>
</html>