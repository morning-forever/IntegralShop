<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transition al.dtd"><%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../../static/inc_web.jsp" %>
<html>
<head>
<base href="<%=basePath %>">
<title>关于我们</title>
<link rel="stylesheet" href="static/web/css/common.css" />
<link rel="stylesheet" href="static/web/css/inner.style.css" />
<link rel="stylesheet" href="static/web/css/personal.center.css" />
<style type="text/css">
.menu_cart{
	width:790px;
	left:100px;
}

.grey9 p{
	color:#999;
	text-indent:24px
}
.grey9 img{
	padding:20px;
	width: 710px;
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
		<div class="content pt20 clearfix">
			<div class="lpart">
				<ul class="menu">
					<li><a href="pc/helpMain">帮助中心</a></li>
					<li><a href="pc/aboutWe" class="current">关于我们</a></li>
					<li><a href="pc/contactWe">联系我们</a></li>
					<li><a href="pc/protocol">用户协议</a></li>
				</ul>
			</div>
			<div class="rpart">
				<div class="right-warp user-agreement">
					<div class="grey9">
						<p style="font: 24px bold bolder;border-bottom: 1px solid #999;">关于我们</p>
						<img src="static/web/img/aboutus.png"  width="100%">
						<p>北访遵义旧会址，南赏七孔好风光，西观草海鸟翩跹，东游苗家寨千户。春杜鹃，夏瀑布，秋红枫，冬温泉，要风景有喀斯特奇观任你探险，要人文有少数民族风情为你绽放，你说贵州好玩不好玩？</p>
						<p>好玩。怎么玩？找黔易游啊。</p>
						<p>贵州省智慧旅游门户网站，为你解决游玩贵州的一切交通问题，带你体验贵州最特色的主题深度游。黔易游成立于2015年，系贵州龙行神洲集团旗下子公司。主营两大核心板块，“快旅”——租车、包车、班车、拼车，贵州客运行业龙头企业的信誉保障你随时去到贵州每一个景区，体验最优质的乘车服务；”主题深度游“——各条贵州游玩经典线路，以及只此一家的最新开发的主题深度旅行路线，最棒的旅行者要配最美的路。此外，这里有一个互动社区，你可以展示自己对旅游的一切热爱与癫狂，高山流水遇知音，答疑解难吐个槽，你想怎样就怎样，你的地盘你是王。创始人李礼说，“我要让来贵州的人都爱上贵州，将来我也要让全贵州的人去玩好全世界！”</p>
						<p>没错，就是这么简单，玩好贵州，玩好全世界。旅行，就是这么简单！</p>
						<p>不服？来辩。</p>
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
	<jsp:include page="../common/footer.jsp"></jsp:include>
</div>

<script type="text/javascript" src="static/web/js/base.js"></script>
<script type="text/javascript" src="static/web/js/index.js"></script>
</body>
</html>