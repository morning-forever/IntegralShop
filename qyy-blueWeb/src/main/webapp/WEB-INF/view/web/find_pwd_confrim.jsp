<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transition al.dtd"><%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../static/inc_web.jsp" %>
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv = "X-UA-Compatible" content = "IE=edge,chrome=1 " /><meta charset="utf-8"> 
<title>保存新密码</title>
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
				<span class="more_text">保存新密码</span>
			</div>			
		</div>		
	</div>

	<!-- page content -->
	<div class="content_wrap">
		<div class="content rel">
			<div class="login_box findpwd abs">
				<div class="mpart">
					<form id="confrimForm">
						<div class="form_wrap">
							<input type="hidden" name="phone" id="phone" value="${phone }" />
							<input type="hidden" name="email" id="email" value="${email }" />
							<div class="item"><i class="iicon i-pwd"></i>
								<input name="loginPwd" id="loginPwd" type="password" class="text" placeholder="设置密码(6-16个字符)" /></div>
							<div class="item" style="margin-bottom:70px;"><i class="iicon i-pwd"></i>
								<input name="rloginPwd" id="rloginPwd" type="password" class="text" placeholder="确认密码(6-16个字符)" /></div>
							<button onclick="subpwd();" class="btn loginBtn">提交</button>
						</div>					
					</form>
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
	$("#confrimForm").bind("click",function(){
		return false;
	});
});

var subpwd = function(){
	var data = {
		'phone':$("#phone").val(),
		'email':$("#email").val(),
		'loginPwd':$("#loginPwd").val(),
		'rloginPwd':$("#rloginPwd").val()
	};
	$.post('<%=basePath %>pc/login?op=updatePassword',data,function(res){
		if(res.message=='success'){
			alert("修改成功，点击确定跳转到登录页面。");
			window.location.href='<%=basePath %>pc/login?op=toLogin';
		}else if("time_out"==res.message){
			alert("修改失败，验证码超时.");
		}else{
			alert("输入有误，请检查输入后重试。");
		}
	},"JSON");
}
</script>
</body>
</html>