<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transition al.dtd"><%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../../static/inc_web.jsp" %>
<html>
<head>
<base href="<%=basePath %>">
<title>联系我们</title>
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
.smollImg{
	position: relative;
	top: 6px;
	width: 16px;
	height: 16px;
	margin:0px 3px 0px 15px;
}
.user-agreementgrey9{
	padding: 10px 25px;
}

.user-agreementgrey9 *{
	color:#999;
}

.weChat{
	margin-left: 35px;
}

.contentP *{
	line-height: 28px;
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
					<li><a href="pc/aboutWe">关于我们</a></li>
					<li><a href="pc/contactWe" class="current">联系我们</a></li>
					<li><a href="pc/protocol">用户协议</a></li>
				</ul>
			</div>
			<div class="rpart">
				<div class="user-agreementgrey9">
						<p style="font: 24px bold bolder; text-align:left;padding: 10px 25px;">联系我们</p>
						<hr></hr>
						<p>如果您在黔易游旅行网提供的服务过程中有任何的困扰，可以与我们的客服人员联系。</p>
						<div class="contentP">
							<img class="smollImg" src="static/img/phone_web.png" alt="客服电话" />客服电话：<span>0851-84721802</span><br />
							<img class="smollImg" src="static/img/QQ_web.png" alt="服务QQ" />服务QQ：<span>3048691964</span><br />
							<img class="smollImg" src="static/img/sina.png" alt="新浪公众号" />新浪公众号：<span>@黔易游</span><br />
							<img class="smollImg" src="static/img/wechat_web.png" alt="微信公众号" />微信公众号：<span>@黔易游</span><br />
							<span class="weChat">打开微信，扫一扫关注我们：</span><br/>
							<img style="display: blokc;width:110px;" class="weChat" src="static/img/ewm.png" alt="" />
							<p>
							<p>如果您发现我们的服务存在缺陷，可把您的建议发到我们的邮箱或拨打我们的服务电话，感谢您的支持！！</p>
							<p><img class="smollImg" src="static/img/mail_web.png" alt="意见邮箱" />意见邮箱：<span>qyyts@qianyiyou.com</span></p>
							<p><img class="smollImg" src="static/img/phone_web.png" alt="投诉电话" />投诉电话：<span>0851-84721802</span></p>
							<p>&nbsp;</p>
							<p>如果您热爱旅行，衷于摄影，乐于分享，那就把您的作品展现给我们吧！</p>
							<p><img class="smollImg" src="static/img/mail_web.png" alt="投递邮箱" />投递邮箱：<span>gzqyy@qianyiyou.com</span></p>
							</p>
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