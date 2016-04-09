<%@include file="../../../../static/qyy_inc.jsp" %>

<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="<%=basePath%>static/web/css/qyy_css/home.css">
<script type="text/javascript" src="<%=basePath%>static/web/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#main").load(function(){
			$("#main").height(0);
			$("#main").width(0);
			
			$("#main").height($("#main").get(0).contentWindow.document.body.scrollHeight);
			$("#main").width($("#main").get(0).contentWindow.document.body.scrollWidth);
			
		});
		
		$(".navlist").click(function(){
			$(".navlist").css({"background-color":"white","color":"black"});
			$(this).css({"background-color":"#e8a000","color":"white"});
		});
	}); 
	function toQyyIndex(){
		window.location.href="";
	}
</script>


<!-- <link rel="stylesheet" type="text/css" href="<%=basePath%>static/web/css/qyy_css/normalize.css"> -->
<title>首页</title>
</head>
<body >
	<div id="header">
		<div class="fl">
			<img alt="黔易游"
				src="<%=basePath%>static/web/images/logo.png" onclick="toQyyIndex()">
		</div>
		<div class="fr">
			<span class="appdown"> <span class="iicon i-app linklist"></span>
				<span class="linklist linkFontColor">APP下载</span> <span
				class="appcode"> <img alt=""
					src="<%=basePath%>static/web/images/twovcode.jpg"
					width="128" height="128">
			</span>

			</span> <span class="seg linklist"><a href="javascript:void(0);"
				class="linkFontColor">黔易游首页</a></span> <span>
				<a href="javascript:void(0);" class="iicon i-weixin linklist"></a></span> 
				<span><a href="javascript:void(0);" class="iicon i-qq linklist"></a></span> <span><a
				href="javascript:void(0);" class="iicon i-weibo linklist"></a></span>
		</div>
		<div style="clear: both;"></div>
		<nav class="nav">
			<a class="navlist navListIndex" href="integralShop/index" target="container">首页</a> 
			<a	class="navlist navListCenter" href="integralShop/yiyouzp" target="container">易游专品</a> 
			<a	class="navlist navListCenter" href="integralShop/travelEquipment" target="container">旅行装备</a> 
			<a	class="navlist navListCenter" href="integralShop/minzuyx" target="container">民族·印象</a>
		</nav>
	</div>
	
		<iframe src="<%=basePath%>integralShop/index" name="container" scrolling="no" id="main" frameborder="0"></iframe>
	
	<!-- banner -->
	
	<hr style="margin-top: 20px; margin-bottom: 10px; color:#FFF;">
	<div id="footer">
		<span class="footFont" style="margin-right: 10px">合作伙伴</span>|<span class="footFont" style="margin-right: 10px;margin-left: 10px">国骅集团</span><span class="footFont" style="margin-right: 10px;margin-left: 10px">贵州龙行神州集团</span>
		<br>
		<span class="footFont" style="margin-right: 54px">关于我们</span> <span class="footFont" style="margin-right: 54px">联系我们</span>  <span class="footFont" style="margin-right: 54px">帮助中心</span>  <span class="footFont" >用户协议</span><br>
		<span class="footFont" style="margin-right: 54px">Copyright &copy 2016 贵州黔易游商务有限公司&nbsp;&nbsp;著作权所有，并保留一切权力。黔ICP备15014846号-1</span>
	</div>
	
</body>
</html>