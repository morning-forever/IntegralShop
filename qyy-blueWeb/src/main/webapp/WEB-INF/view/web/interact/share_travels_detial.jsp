<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transition al.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../../../static/inc_web.jsp" %>
<html>
<head>
<base href="<%=basePath %>">
<title>黔易游-${travels.title }</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta content="yes" name="apple-mobile-web-app-capable">
<meta content="black" name="apple-mobile-web-app-status-bar-style">
<meta content="telephone=no" name="format-detection">
<link rel="stylesheet" href="static/web/css/app-common.css" />
</head>
<body>
<div class="wrapper">
	<div class="tinfo borderb1"><span class="f12">类型：${travels.travelsTypeString } | 人气：${travels.replyCount }</span>
	<div id="price"><span class="posr f12"><span class="f14 red">￥${travels.price }元</span> 起</span></div>
	</div>
	<div class="uinfo clearfix">
		<img class="avatar fl" src="${travels.head_img }" alt="">
		<div class="content fr">
			<div class="rel"><span class="dark">${travels.nickname }</span><span class="posr grey6 createTime">${travels.create_time.getTime() }</span></div>
			<div class="ulevel_wrap"><span class="orange mr10 f12">${travels.level_desc }</span>
			<div id="medals">
			</div>
			</div>
			<p class="f12 dark">${travels.title }</p>
			<div class="tr f12 grey6">
				<span><i class="iicon i-support"></i>&nbsp;${travels.praise }<i class="iicon i-comment ml20"></i>&nbsp;${travels.replyCount }</span>
			</div>
		</div>
	</div>
		<c:forEach items="${itemList }" var="item">
			<c:if test="${item.item_type=='word' }">
				<p class="textwrap">${item.context }</p>
			</c:if>
			<c:if test="${item.item_type=='imgs' }">
				<img src="${item.context }" style="width: 100%" />
			</c:if>
			<c:if test="${item.item_type=='stage' }">
				<h3 class="title"><span class="tline"></span>${item.context }</h3>
			</c:if>
		</c:forEach>
	<!-- <p class="textwrap">在最青春的年华里，不去旅行，不去体验，不去谈一场恋爱，不去尝试没试过的生活。在最青春的年华里，不去旅行，不去体验，不去谈一场恋爱，不去尝试没试过的生活。</p>
	<h3 class="title"><span class="tline"></span>行程计划</h3>
	<img src="images/desc.jpg" alt="">
	<div class="imgtext_wrap">
		<p>震后的花园城市，市中心依然一片废墟，满目狼藉。可走在秋日的黄昏，一缕光拉长了我的身影，延展向远方。</p>
		<img src="images/desc.jpg" alt="">
		<p>震后的花园城市，市中心依然一片废墟，满目狼藉。可走在秋日的黄昏，一缕光拉长了我的身影，延展向远方。</p>
	</div> -->
</div>
<script type="text/javascript" src="<%=basePath %>static/web/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="static/web/js/base.js"></script>
<script type="text/javascript">
	$(function(){
		var timestamp=parseInt($(".createTime").html());
		console.info(getTimeTxt(timestamp,16));
		$(".createTime").html(getTimeTxt(timestamp,16));
		
		var medalsNumber=parseInt("${travels.level_name }");
		for(var i=0;i<medalsNumber;i++){
			$("#medals").append('<i class="iicon u-level"></i>');
		}
		
		if("${travels.travelType}"!="3"){
			$("#price").hide();
		}
		
	})
</script>
</body>
</html>