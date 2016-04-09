<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transition al.dtd"><%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../../static/inc_web.jsp" %>
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv = "X-UA-Compatible" content = "IE=edge,chrome=1 " /><meta charset="utf-8"> 
<title>行程计划</title>
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
					<a href="javascript:void(0);" name="replan" class="btn lwhitebtn mr20">重新运算行程</a>
					<a href="javascript:void(0);" name="newplan" class="btn lwhitebtn">建新行程</a>
				</div>
			</div>

			<ul class="atab clearfix">
				<li class="active"><a href="pc/simple/home">行程计划</a></li>
				<li><a href="pc/simple/travelDetail">行程明细</a></li>
				<li><a href="pc/simple/budgetDetail">预算明细</a></li>
				<li><a href="pc/simple/equipList">装备清单</a></li>
				<li><a href="pc/simple/downlineActivity?op=scenic">线下活动</a></li>
			</ul>
			<div class="tab-content pd10 whitebg" style="padding-top:40px;">
				<div class="sectionlist plan-list">
					<div class="section clearfix">
						<i class="iicon i-dot"></i>
						<h5>第1天 2015-6-11</h5>
						<p class="desc">07:55    大峡谷<br />
						08:00    金边<br />
						10:00    塔山寺<br />
						11:30    乌那隆寺<br />
						13:30    桃源呵漂流<br />
						15:30    息烽温泉<br />
						16:30    贵阳野生动物园<br />
						17:55    四季美酒店</p>
					</div>
					<div class="section clearfix">
						<i class="iicon i-dot"></i>
						<h5>第2天 2015-6-12</h5>
						<p class="desc">07:55    大峡谷<br />
						08:00    金边<br />
						10:00    塔山寺<br />
						11:30    乌那隆寺<br />
						13:30    桃源呵漂流<br />
						15:30    息烽温泉<br />
						16:30    贵阳野生动物园<br />
						17:55    四季美酒店</p>
					</div>
					<div class="section clearfix">
						<i class="iicon i-dot"></i>
						<h5>第3天 2015-6-13</h5>
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
			</div>
		</div>			
	</div>

	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
</div>

<!-- 查看提示 -->
<script id="tip_popup" type="text/template">
<div class="innerdiv popup_inner">
	<p>重算前:</p>
	<p class="lorange">您是否已保留想去的景点，如未保留请按返回。</p>
	<div style="padding:30px 0 40px 60px;">
		<p class="mb10"><i name="yesorno" class="iicon i-check mr10"></i>保留我想去的景点</p>
		<p><i name="yesorno" class="iicon i-check checked mr10"></i>忽略想去的景点</p>
	</div>
	<button name="case-ok" class="btn lorgbtn mr20">确定</button><button name="case-no" class="btn cancelbtn">返回</button>
</div>
</script>

<script type="text/javascript" src="static/web/js/base.js"></script>
<script type="text/javascript">
$(function(){
	// 提示弹出框
	var tippopupDlg = new dialogBox({
		title : '提示',
		selfClass : "type3",
		contentHtml : $("#tip_popup").html(),
		popupBoxW : 490,
		popupBoxH : 380,
		initEvent : function($dom){
			$dom.find(".i-check").click(function(){
				var _name = $(this).attr("name");
				if( !$(this).hasClass("checked") ){
					$dom.find("[name="+_name+"]").removeClass("checked");
					$(this).addClass("checked");
				} else {
					$(this).removeClass("checked");
				}				
			});
		}
	});
	$("[name=replan]").click(function(){
		tippopupDlg.showDlg();
	});
	$("[name=newplan]").click(function(){
		window.location="pc/home?op=open";
	});
});
</script>
</body>
</html>