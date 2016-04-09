<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transition al.dtd"><%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../../static/inc_web.jsp" %>
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv = "X-UA-Compatible" content = "IE=edge,chrome=1 " /><meta charset="utf-8"> 
<title>会员互动-会员主页</title>
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
				<li><a href="pc/simple/home">智易行</a></li>
				<li><a href="pc/cart/home">快旅▪漫游</a></li>
				<li class="active"><a href="pc/depth/home">主题深度游</a></li>
				<li><a href="pc/interact/home">互动社区</a></li>
			</ul>
		</div>
	</div>
	<!-- page content -->
	<div class=" content_wrap pb90">
		<div class="content">
		    <div class="breadcrumb">当前位置：<a href="">首页</a><a href="">互动社区 </a><a href="">吐槽专区</a><span>我要吐槽</span></div>
			<div class="whitebg box-show">
			  <div class="playmate"><span class="parten">我要吐槽</span></div>
			  <div class="ask">
			    <h3><span class="orange">吐槽</span>这里是吐槽天堂，您可以将您想吐槽的内容发表在这里</h3>
				<div class="tare"><textarea placeholder=""></textarea></div>
				<div class="pb20 tr clearfix">
				  <input class="text mr10" type="text" placeholder="请输入验证码后提交" /><img class="mr20 vm" src="static/web/img/code.jpg" height="32" width="96" alt=""><span class="underline pointer lorange mr20">刷新</span>
				</div>
				<div class="tr mt20"><button class="Btn">发布</button></div>
				<dl><dt>说明：</dt><dd>问答仅限于旅游问题咨询、讨论与解答，随意灌水或聊天等不属于旅行问答的内容，将被视为无效信息进行删除。请大家遵守规则，共创黔易游美好平台。</dd></dl>
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