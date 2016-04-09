<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transition al.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../static/inc_web.jsp" %>
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv = "X-UA-Compatible" content = "IE=edge,chrome=1 " /><meta charset="utf-8"> 
<title>会员登录</title>
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
				<span class="more_text">会员登录</span>
			</div>			
		</div>		
	</div>

	<!-- page content -->
	<div class="content_wrap">
		<div class="content rel">
			<div class="login_box abs">
				<div class="mpart">
					<div class="form_wrap">
						<div class="item"><i class="iicon i-uname"></i><input type="text" id="loginname" class="text" placeholder="请输入您的邮箱／手机号" /></div>
						<div class="item"><i class="iicon i-pwd"></i><input type="password" id="password" class="text" placeholder="请输入密码" /></div>
						<div class="oitem mb20 pb20 clearfix">
							<a class="fr" href="pc/login?op=toFindPwd">忘记密码？</a>
							<span class="iicon checkbox" id="saveid"></span> 两周内自动登录
						</div>
						<button type="button" onclick="severCheck();" class="btn loginBtn">登录</button>
					</div>					
					<div class="tc ologintype">
						<a href="javascript:;" onclick="thirdLogin('weibo');" class="iicon i-weibo"></a>
						<a href="javascript:;" onclick="thirdLogin('wechat');"class="iicon i-weixin"></a>
						<a href="javascript:;" onclick="thirdLogin('qq');"class="iicon i-qq"></a>
					</div>
				</div>				
				<div class="opart tc white">
					您还没有黔易游账号？<a href="<%=basePath %>pc/login?op=toRegiste">立刻注册</a>
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
	$("#loginname").focus();
});

$(document).keyup(function(event) {
	if (event.keyCode == 13) {
		$(".loginBtn").click();
	}
});

$(document).ready(function(){
	$(".loginBtn").bind("click",function(){return false;});
	
	var loginname = $.cookie('loginname');
	var password = $.cookie('password');
	
	if (typeof(loginname) != "undefined"){
		$("#loginname").val(loginname);
	}
	if(typeof(password) != "undefined") {
		$("#password").val(password);
	}
	if(typeof(password) != "undefined"
			&&typeof(password) != "undefined"){
		$("#saveid").addClass("checked");
		//$(".loginBtn").click();
	}
});

function severCheck(){
	if(check()){
		var loginname = $("#loginname").val();
		var password = $("#password").val();
		var code = loginname+","+password;
		$.ajax({
			type: "POST",
			url: '<%=basePath %>pc/login?op=login',
	    	data: {DATA:code,tm:new Date().getTime()},
			dataType:'json',
			cache: false,
			success: function(data){
				
				if("success" == data.flag){
					saveCookie();
					var redirect = data.redirect;
					debugger;
					if(!checkField(redirect)){
						redirect = "<%=basePath %>pc/home";
					}else{
						if(redirect.indexOf('http:')==0){
							redirect = redirect;
						}else{
							//redirect = '<%=basePath %>'+redirect.substring(0,redirect.lastIndexOf('/pc/')) ;
							redirect = '<%=basePath %>'+redirect;
						}
					}
					window.location.href=redirect;
				}else if("login_user_pass_err" == data.flag){
					valTips("loginname","用户名或密码错误");
					$("#loginname").focus();
				}else if("login_is_ban" == data.flag){
					valTips("loginname","账户已被禁用");
					$("#loginname").focus();
				}else{
					valTips("loginname","服务器忙，请稍后再试");
					$("#loginname").focus();
				}
			}
		});
	}
}

function savePaw() {
	if (!$("#saveid").hasClass("checked")) {
		$.cookie('loginname', '', {
			expires : -1
		});
		$.cookie('password', '', {
			expires : -1
		});
		$("#loginname").val('');
		$("#password").val('');
	}
}

//客户端校验
function check() {

	if ($("#loginname").val() == "") {
		valTips("loginname","用户名不得为空");
		$("#loginname").focus();
		return false;
	} else {
		$("#loginname").val(jQuery.trim($('#loginname').val()));
	}

	if ($("#password").val() == "") {
		valTips("loginname","密码不得为空");
		$("#password").focus();
		return false;
	}

	$("#loginname").tips({
		side : 1,
		msg : '正在登录 , 请稍后 ...',
		bg : '#68B500',
		time : 1
	});

	return true;
}

function saveCookie() {
	if ($("#saveid").hasClass("checked")) {
		$.cookie('loginname', $("#loginname").val(), {
			expires : 14
		});
		$.cookie('password', $("#password").val(), {
			expires : 14 ,path : '/pc'
		});
	}
}

function thirdLogin(op){
	$.post('<%=basePath %>pc/login',{'type':op,'op':'toThirdLogin'},function(res){
		window.location.href=res.urls;
	},"JSON");
}
</script>
</body>
</html>