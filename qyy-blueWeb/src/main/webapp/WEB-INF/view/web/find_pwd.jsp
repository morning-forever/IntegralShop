<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transition al.dtd"><%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../static/inc_web.jsp" %>
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv = "X-UA-Compatible" content = "IE=edge,chrome=1 " /><meta charset="utf-8"> 
<title>找回密码</title>
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
				<span class="more_text">找回密码</span>
			</div>			
		</div>		
	</div>

	<!-- page content -->
	<div class="content_wrap">
		<div class="content rel">
			<div class="login_box findpwd abs">
				<div class="mpart">					
					<ul class="box-tab clearfix f18">
						<li class="active">手机找回密码<span class="arrow"></span></li>
						<li>邮箱找回密码<span class="arrow"></span></li>
					</ul>
					<div class="tab-content">
						<div class="form_wrap">
							<!-- 验证码等待中时，codebtn 按钮加上样式disabled -->
							<div class="item getcode_wrap"><i class="iicon i-tel"></i>
								<input name="phone" id="phone" type="text" class="text" placeholder="请输入您的手机号码" /><span onclick="sendSMS();" class="btn codebtn">获取验证码</span></div>
							<div class="item" style="margin-bottom:80px;"><i class="iicon i-code"></i>
								<input name="code" id="code" type="text" class="text" placeholder="请输入6位短信验证码" /></div>
							<p class="tc tipmsg none">（请在60秒内完成验证，超时请点击重新发送）</p>
							<button onclick="checkPhoneCode();" class="btn loginBtn">下一步</button>
						</div>					
					</div>					
					<div class="tab-content none">
						<div class="form_wrap">
							<div class="item"><i class="iicon i-email"></i>
								<input name="email" id="email" type="text" class="text" placeholder="请输入您的邮箱" /></div>
							<div class="item validcode_wrap" style="margin-bottom:80px;">
								<input name="vcode" id="vcode" type="text" class="text" placeholder="验证码" />
								<img id="vcodeImg" class="validcode" src="static/web/img/code.jpg" height="32" width="96"/>
								<span onclick="loadVcode()" class="refreshbtn">刷新</span></div>
							<button onclick="checkEmailFind();" class="btn loginBtn">立即找回</button>
						</div>					
					</div>
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
<!-- 消息提示框 -->
<div id="mesTipPopup" style="display: none;">
	<div class="innerdiv pd20 tc">
		<p style="padding:50px 0; color:#333;">收藏成功</p>
		<button class="btn lorgbtn" name="case-ok">确认</button>
	</div>
</div>
<script type="text/javascript" src="static/web/js/base.js"></script>
<script type="text/javascript">
$(function(){
	//selfDefineFormBtn();
	$(".box-tab li").click(function(){
		var idx = $(this).index();
		$(".box-tab li.active").removeClass("active");
		$(this).addClass("active");
		$(".tab-content").hide();
		$(".tab-content").eq(idx).show();
	});
	loadVcode();
});

//消息提示框 
function popMesTip(mes){
	$("#mesTipPopup p").text(mes);
	var viewMesTipDlg = new dialogBox({
		title : "提示",
		contentHtml : $("#mesTipPopup").html(),
		popupBoxW : 490,
		closeBtnshow : 0,
		initEvent : function($dom){
		}
	});
	viewMesTipDlg.showDlg();
}

var adds = function(){
	$("#sendSms").attr("onclick","sendSMS()");
};

var sendSMS =function(){
	var phone = $("#phone").val();
	if(!checkField(phone)){
		popMesTip("请输入您的手机号");
		return ;
	}
	var param = {
		"op" : 'sendSMSOfFind',
		"phone":$("#phone").val()
	};
	$.post('<%=basePath %>pc/login',param,function(res){
		if(res.message == 'success'){
			popMesTip("发送成功.");
			$("#sendSms").removeAttr("onclick");
			setTimeout(adds, 60000);
		}else if("user_not_found" == res.message){
			popMesTip("发送失败，当前手机不存在。");
		}else{
			popMesTip("发送失败，请稍后重试.")
		}
	},"JSON");
};

var checkPhoneCode =function(){
	var phone = $("#phone").val();
	if(!checkField(phone)){
		popMesTip("请输入您的手机号");
		return ;
	}
	var code = $("#code").val();
	if(!checkField(code)){
		popMesTip("请输入您的手机验证码");
		return ;
	}
	var param = {
		"op" : 'checkPhoneCode',
		"phone":$("#phone").val(),
		"vPhoneCode":$("#code").val()
	};
	$.post('<%=basePath %>pc/login',param,function(res){
		if(res.message == 'success'){
			window.location.href='<%=basePath %>pc/login?op=toFindconfrim&phone='+phone;
		}else{
			popMesTip("验证失败，请稍后重试.")
		}
	},"JSON");
};

var loadVcode = function(){
	$("#vcodeImg").attr({"src":'<%=basePath%>admin/login?op=vcode&vt='+(new Date()).getTime()});
};

//
var checkEmailFind =function(){
	var code = $("#vcode").val();
	if(!checkField(code)){
		popMesTip("请输入您的手机验证码");
		return ;
	}
	var param = {
		"op" : 'checkEmailFind',
		"email":$("#email").val(),
		"vcode":$("#vcode").val()
	};
	$.post('<%=basePath %>pc/login',param,function(res){
		if(res.message == 'success'){
			window.location.href='<%=basePath %>pc/login?op=toEmailVildate';
		}else if(res.message == 'user_not_found'){
			popMesTip("发送失败，当前邮箱不存在。");
		}else if("code_err"==res.message){
			popMesTip("验证失败，验证码不匹配.");
		}else{
			popMesTip("验证失败，请稍后重试.");
		}
		loadVcode();
	},"JSON");
};

</script>
</body>
</html>