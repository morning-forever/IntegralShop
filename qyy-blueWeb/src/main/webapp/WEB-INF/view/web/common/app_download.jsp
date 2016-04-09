<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transition al.dtd"><%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../../static/inc_web.jsp" %>
<html>
<head>
<base href="<%=basePath %>">
<title>APP下载</title>
<link rel="stylesheet" href="static/web/css/common.css" />
<link rel="stylesheet" href="static/web/css/inner.style.css" />
<link rel="stylesheet" href="static/web/css/personal.center.css" />
<style type="text/css">
.menu_cart{
	width:790px;
	left:100px;
}
.links{
	color: blue;
}
.preview{
	height: 600px;
}
.bodyDiv{
	width: 70%;
	margin:100px auto ;
	display: block;
}
table{
	width: 100%;
}
h3{
	font-size: 25px;
	font-family: "黑体";
	margin-bottom: 15px;
}
.indent{
	margin-left: 23px;
}

.apple_btn, .android_btn {
	width: 254px;
	height: 79px;
	display: block;
	margin-bottom: 21px;
}

.android_btn {
	background: url('static/img/android_btn.png') center top no-repeat;
}

.apple_btn {
	background: url('static/img/apple_btn.png') center top no-repeat;
}
.downloadContent{
	margin-left: 150px;
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
	<div class="bodyDiv">
		<table>
			<tr>
				<td rowspan="2" style="width: 350px">
					<img src="static/img/preview.png" alt="" class="preview" />
				</td>
				<td>
					<div class="content">
						<h3>黔易游手机客户端</h3>
						<p class="">黔易游在手，贵州你有</p>
						<p>1、快旅出行</p>
						<p class="indent">享受美景的自驾，诉说故事的合乘</p>
						<p>2、主题深度游</p>
						<p class="indent">搜索与发现，让你和对的人挑选合心旅程</p>
						<p>3、互动社区</p>
						<p class="indent">分享你的旅行，换积分，兑礼品</p>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="downloadContent">
					<a class="apple_btn" href="http://itunes.apple.com/cn/app/id1068109230?mt=8"></a>
					<a class="android_btn" href="${android.data.version.clientUrl }"></a>
					</div>
				</td>
			</tr>
		</table>
	</div>

	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
</div>

<script type="text/javascript" src="static/web/js/base.js"></script>
<script type="text/javascript" src="static/web/js/index.js"></script>
</body>
</html>