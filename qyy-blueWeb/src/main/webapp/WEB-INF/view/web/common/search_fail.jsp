<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transition al.dtd"><%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../../static/inc_web.jsp" %>
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv = "X-UA-Compatible" content = "IE=edge,chrome=1 " /><meta charset="utf-8"> 
<title>搜索结果</title>
<link rel="stylesheet" href="static/web/css/common.css" />
<link rel="stylesheet" href="static/web/css/inner.style.css" />
<link rel="stylesheet" href="static/web/css/personal.center.css" />
<link rel="stylesheet" href="static/web/css/member.css"/>
<style type="text/css">
.menu_cart{
	width:790px;
	left:100px;
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
	<div class=" content_wrap pb90">
		<div class="content">
		  <div class="screen">
		    <dl><dt><span>筛选</span></dt>
			    <dd>
				  <span class="active">全部</span>
				  <span>主题深度游</span>
				  <span>达人攻略</span>
				  <span>精彩游记</span>
				  <span>玩伴召募</span>
				  <span>问答</span>
				  <span>吐槽</span>
				</dd>
			</dl>
		  </div>
		  <div class="se_resule tc" style="padding:100px 0;">
		     <img src="static/web/images/Noresult.png"/>
			 <p>没有任何搜索结果</p>
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
<div class="innerdiv  pd20">
    <div class="searchdiv">
	  <div class="search_wrap"><i class="iicon i-search"></i><input class="search-text" type="text" placeholder="搜索人" /></div>
	  <ul class="list_sear">
	    <li><i class="icon tick"></i>qina819</li>
		<li><i class="icon tick"></i>qina819</li>
		<li><i class="icon tick"></i>qina819</li>
	  </ul>
	</div>
	<div class="listbtn"><button class="Btn" name="case-ok">确认</button></div>
</div>
</script>
<script type="text/javascript" src="static/web/js/base.js"></script>
<script type="text/javascript" src="static/web/js/index.js"></script>
<script type="text/javascript" src="static/web/js/person.js"></script>
<script type="text/javascript">
$(function(){
	scrollBannerInit($(".banner-ul"),$(".banner-btn"));
	previewProDetailImg();
	selfDefineFormBtn();
	// 修改身份对话框
	var ruleDlg = new dialogBox({
		selfClass : "type2",
		title : "",
		contentHtml : $("#rulepopup").html(),
		popupBoxW : 816,
		//closeBtnshow : 0,
		initEvent : function($dom){
		}
	});
	$(".add").click(function(){
		ruleDlg.showDlg();
	});
});
</script>
</body>
</html>