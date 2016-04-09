<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transition al.dtd"><%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../static/inc_web.jsp" %>
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv = "X-UA-Compatible" content = "IE=edge,chrome=1 " /><meta charset="utf-8"> 
<title>注册－邮箱验证提示</title>
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
				<span class="more_text">邮箱注册</span>
			</div>			
		</div>		
	</div>

	<!-- page content -->
	<div class="content_wrap">
		<div class="content rel">
			<div class="login_box ovalidpage abs">
				<div class="mpart">
					<div class="form_wrap white">
						<div class="tc f16 pt20 pb20 mb20 lh18">邮件已发送至您的邮箱<br /><span class="f18">${email }</span></div>		
						<div class="tc tipmsg mb10">请点击邮箱中的验证链接完成验证</div>	
						<button class="btn loginBtn" onclick="govail();">前往邮箱验证</button>
					</div>
				</div>				
				<div class="opart rel tipmsg">
					<span class="white otitle">没有收到邮件</span>
					<span class="num1 iicon"></span>Email地址是否写错？<br/><span class="num2 iicon"></span>是否在垃圾邮箱？<br />
					<span class="num3 iicon"></span>点击<a href="javascript:;" onclick="checkOrSendEmail();" class="f18"> 重新发送</a> 验证链接
				</div>
			</div>
		</div>
	</div>

	<!-- footer -->
	<div class="footer">
		<div class="content tc">
			<p class="mb20"><a href="">关于我们</a><span class="divid-line"></span><a href="">联系我们</a><span class="divid-line"></span><a href="">帮助中心</a><span class="divid-line"></span><a href="">用户协议</a></p>
			<p>Copyright 2015 贵州正礼服务有限公司。 著作权所有，并保留一切权利。 黔ICP备05049XXXX</p>
		</div>
	</div>
</div>

<script type="text/javascript" src="static/web/js/base.js"></script>
<script type="text/javascript">
$(function(){
	selfDefineFormBtn();
});

var govail = function(){
	window.location.href='https://mail.${mailAddr}';	
};


var checkOrSendEmail = function(){
	var param = {
		'email' : '${email}'
	};
	$.post("<%=basePath %>pc/login?op=checkEmail",param,function(res){
		debugger
		if(res.message == 'success'){
			alert("发送成功");
			//window.location.href='pc/login?op=toEmailVildate';
		}else{
			alert("发送失败，请稍后重试.");
		}
	},"JSON");
};

</script>
</body>
</html>