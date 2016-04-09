<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transition al.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../static/inc_web.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath %>">
<meta http-equiv = "X-UA-Compatible" content = "IE=edge,chrome=1 " /><meta charset="utf-8"> 
<title>会员注册</title>
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
				<span class="more_text">
				<c:if test="${system !=null }">
					<c:if test="${system.webUser != null }">
						<c:if test="${system.webUser.threeUid != null }">
							第三方会员绑定注册
						</c:if>
					</c:if>
				</c:if>
				<c:if test="${system ==null }">
					会员注册
				</c:if>
				</span>
			</div>			
		</div>		
	</div>
	<!-- page content -->
	<div class="content_wrap">
		<div class="content rel">
			<div class="login_box register abs">
				<div class="mpart">					
					<ul class="box-tab clearfix f18">
						<li class="active">手机注册<span class="arrow"></span></li>
						<li>邮箱注册<span class="arrow"></span></li>
					</ul>
					<div class="tab-content">
						<form id="nextsForm" method="post">
							<div class="form_wrap">
								<!-- 验证码等待中时，codebtn 按钮加上样式disabled -->
								<div class="item getcode_wrap"><i class="iicon i-tel"></i><input type="text" class="text" id="phone" name="phone" placeholder="请输入您的手机号码" /><span id="sendSms" class="btn codebtn" onclick="sendSMS();">获取验证码</span></div>
								<div class="item" style="margin-bottom:10px;"><i class="iicon i-code"></i><input type="text" class="text" name="code" id="code" placeholder="请输入6位短信验证码" /></div>
								<div class="oitem" style="margin-bottom:45px;">
									<span class="iicon checkbox checked phoneCheck"></span> 同意<a href="pc/protocol" target="_blank">《黔易游注册协议》</a>
								</div>
								<p class="tc tipmsg none">（请在60秒内完成验证，超时请点击重新发送）</p>
								<!-- <a class="btn loginBtn" href="#">下一步</a> -->
								<a class="btn loginBtn  nextBtn" onclick="checkPhoneCode();">下一步</a> 
								<!-- <button class="btn loginBtn">下一步</button> -->
								<!-- <a href="pc/login?op=toRegNext">下一步</a> -->
							</div>					
						</form>
					</div>					
					<div class="tab-content none">
						<form action="#">
							<div class="form_wrap">
								<div class="item" style="margin-bottom:10px;"><i class="iicon i-email"></i>
									<input name="email" id="email" type="text" class="text" placeholder="请输入您的邮箱" /></div>
								<div class="oitem" style="margin-bottom:115px;">
									<span class="iicon checkbox checked emailCheck"></span> 同意<a href="pc/protocol" target="_blank">《黔易游注册协议》</a>
								</div>
								<!-- <button class="btn loginBtn">注册</button> -->
								<a class="btn loginBtn regBtn" href="javascript:;" onclick="checkOrSendEmail();">注册</a>
								
							</div>					
						</form>
					</div>
				</div>				
				<div class="opart tc tipmsg">
					已有帐号，<a href="pc/login?op=toLogin">立即登录</a>
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
	$("#nextsForm").bind('submit',function(){return false;});
	$(".checkbox").click(function(){
		$(this).toggleClass("checked");
		var type="";
		if($(this).hasClass("emailCheck")){
			type="regBtn";
		}else{
			type="nextBtn";
		}
		if(!$(this).hasClass("checked")){
			$("."+type).css("background","#999999");
		}else{
			$("."+type).css("background","");
		}
	});
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

var checkOrSendEmail = function(){
	if(!$(".emailCheck").hasClass("checked")){
		return;
	}
	var param = {
		'email' : $("#email").val()
	};
	/* if(!checkField(param.email, new RegExp('^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$'))){
		popMesTip("您输入的邮箱有误，请重新输入。");
		return ;
	} */
	if(!checkEmail(param.email)){
		popMesTip("您输入的邮箱有误，请重新输入。");
		return ;
	}
	$.post("<%=basePath %>pc/login?op=checkEmail",param,function(res){
		if(res.message == 'success'){
			window.location.href='<%=basePath %>pc/login?op=toEmailVildate';
		}else if(res.message == 'user_is_contain'){
			popMesTip("发送失败，当前邮箱已经被使用了。")
		}else{
			popMesTip("发送失败，请稍后重试.")
		}
	},"JSON");
};
var sendSMS =function(){
	var phone = $("#phone").val();
	/* if(!checkField(phone)){
		popMesTip("请输入您的手机号");
		return ;
	} */
	if(!checkPhone(phone)){
		popMesTip("您输入的手机号有误，请重新输入");
		return ;
	}
	var param = {
		"op" : 'sendSMS',
		"phone":$("#phone").val()
	};
	$(".tipmsg").show();
	$.post('<%=basePath %>pc/login',param,function(res){
		if(res.status == 'success'){
			popMesTip("发送成功.");
			$("#sendSms").removeAttr("onclick");
			setTimeout(adds, 60000);
		}else if(res.status == 'exists'){
			popMesTip("此号码已经注册了，请更换手机号码");
		}else{
			popMesTip("发送失败，请稍后重试.");
		}
	},"JSON");
};

var adds = function(){
	$("#sendSms").attr("onclick","sendSMS()");
};

var checkPhoneCode =function(){
	if(!$(".phoneCheck").hasClass("checked")){
		return;
	}
	var phone = $("#phone").val();
	/* if(!checkField(phone)){
		popMesTip("请输入您的手机号");
		return ;
	} */
	if(!checkPhone(phone)){
		popMesTip("您输入的手机号有误，请重新输入");
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
			window.location.href='<%=basePath %>pc/login?op=toRegNext&phone='+phone;
		}else{
			popMesTip("验证失败，请稍后重试.")
		}
	},"JSON");
};

</script>
</body>
</html>