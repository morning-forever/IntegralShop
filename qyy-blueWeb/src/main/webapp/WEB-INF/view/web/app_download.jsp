<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@include file="../../../static/inc_web.jsp" %> 
<!DOCTYPE html>
<!-- saved from url=(0039)http://bang.chinacache.com/download.htm -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>客户端下载</title>

<base href="<%=basePath %>">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta content="yes" name="apple-mobile-web-app-capable">
<meta content="black" name="apple-mobile-web-app-status-bar-style">
<meta content="telephone=no" name="format-detection">
<style type="text/css">
body { font-family: Arial,"microsoft yahei",Verdana; padding:0;	margin:0; font-size:12px; color:#fff; background: url(static/web/images/download_bkg.jpg) no-repeat; background-size:cover; }
body,div,fieldset,form,h1,h2,h3,h4,h5,h6,html,p,span { -webkit-text-size-adjust: none}
h1,h2,h3,h4,h5,h6 { font-weight:normal; }
applet,dd,div,dl,dt,h1,h2,h3,h4,h5,h6,html,iframe,img,object,p,span {
	padding: 0;
	margin: 0;
	border: none
}
img {padding:0; margin:0; vertical-align:top; border: none}
li,ul {list-style: none outside none; padding: 0; margin: 0}
input,select { -webkit-appearance:none; -moz-appearance: none; }
input[type=text],select { margin:0; padding:0; background:none; border:none; font-size:14px; text-indent:3px; font-family: Arial,"microsoft yahei",Verdana;}
.wrapper { width:100%; padding:10px; box-sizing:border-box; text-align:center;}
.logo { width:35%; max-width:176px; padding-top:50px;}
h3 { margin:30px 0; font-weight:bold;}
p { margin-bottom:15px;}
a.btn { display:inline-block; border:1px solid #fff; border-radius:3px; color:#fff; line-height:30px; width:100px; margin:0 10px; text-decoration:none;}
a.btn:active { background:#fff; color:#676767; }
.cover { left:0; top:0; right:0; bottom:0; position:absolute; background:rgba(0,0,0,.7)}
.cover p { margin:30px auto 0; width:160px; text-shadow:0 0 3px #fff; line-height:30px;position:absolute;}
</style>
<style type="text/css" adt="123"></style><script></script></head>
<body>
<div class="cover" id="mask" style="display: none;">
	<p>
		1、点击右上角菜单 <br>
		2、在菜单中选择浏览器打开 <br>
		3、即可下载黔易游客户端
	</p>
</div>
<div class="wrapper">
	<img src="static/web/images/favicon.png" class="logo">
	<h3>手机端应用下载</h3>
	<p><a class="btn" href="http://itunes.apple.com/cn/app/id1068109230?mt=8">Iphone 版下载</a><a class="btn" href="${android.data.version.clientUrl }">Android 版下载</a></p>
</div>
<script>

$(function(){
	var ua = window.navigator.userAgent.toLowerCase();
	if(ua.match(/MicroMessenger/i) == 'micromessenger'){
		document.getElementById("mask").style.display="block";
	}
	
	var width=$("#mask").width();
	var height=$("#mask").height();
	var thisWidth=$("#mask p").width();
	var thisHeight=$("#mask p").height();
	
	$("#mask p").css("left",(width-thisWidth)/2);
	$("#mask p").css("top",(height-thisHeight)/3);
	
})
</script>

</body></html>