<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transition al.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../static/inc_web.jsp" %>
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv = "X-UA-Compatible" content = "IE=edge,chrome=1 " /><meta charset="utf-8"> 
<title>登录－第三方</title>
<link rel="stylesheet" href="static/web/css/common.css" />
<link rel="stylesheet" href="static/web/css/login.css" />
</head>
<body>
<div class="wrapper login">
	<!-- header -->
	<div class="header">
		<div class="content">
			<div class="logo_wrap">
				<a href="#"><img src="static/web/images/logo.png" height="59" width="176" alt="" class="logo"></a>
				<span class="more_text">第三方登录</span>
			</div>			
		</div>		
	</div>

	<!-- page content -->
	<div class="content_wrap">
		<div class="content rel">
			<div class="login_box thirdtype abs">
				<div class="mpart">
					<div class="form_wrap">
						<!-- 验证码等待中时，codebtn 按钮加上样式disabled -->
						<div class="item getcode_wrap"><i class="iicon i-tel"></i><input type="text" class="text" placeholder="请输入您的手机号码" /><span class="btn codebtn">获取验证码</span></div>
						<div class="item mb50" style="margin-bottom:50px;"><i class="iicon i-code"></i><input type="text" class="text" placeholder="请输入6位短信验证码" /></div>
						<p class="tc tipmsg none">（请在60秒内完成验证，超时请点击重新发送）</p>
						<button onclick="javascript:window.location='<%=basePath %>pc/home';" class="btn loginBtn">绑定</button>
					</div>					
				</div>				
				<div class="opart tc tipmsg">
					为了让您能更好体验黔易游服务，快速绑定手机号<br/>如果您注册过账号，请绑定注册的原手机号；<br />
					如果您是新用户，请绑定新手机号
				</div>
			</div>
		</div>
	</div>

	<!-- footer -->
	<div class="footer">
		<div class="content tc">
			<p class="mb20"><a href="pc/aboutWe">关于我们</a><span class="divid-line"></span><a href="pc/contactWe">联系我们</a><span class="divid-line"></span><a href="pc/helpMain">帮助中心</a><span class="divid-line"></span><a href="pc/protocol">用户协议</a></p>
			<p>Copyright @ 2015 贵州黔易游商务有限公司。 著作权所有，并保留一切权利。 黔ICP备15014846号-1</p>
		</div>
	</div>
</div>

<script type="text/javascript" src="static/web/js/base.js"></script>
<script type="text/javascript">
$(function(){
	selfDefineFormBtn();
});
</script>
</body>
</html>