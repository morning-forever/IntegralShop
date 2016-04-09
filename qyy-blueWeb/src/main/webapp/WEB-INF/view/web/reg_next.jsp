<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transition al.dtd"><%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../static/inc_web.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath %>">
<meta http-equiv = "X-UA-Compatible" content = "IE=edge,chrome=1 " /><meta charset="utf-8"> 
<title>注册信息</title>
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
							第三方会员绑定信息
						</c:if>
					</c:if>
				</c:if>
				<c:if test="${system ==null }">
					注册信息
				</c:if>
				</span>
			</div>			
		</div>		
	</div>

	<!-- page content -->
	<div class="content_wrap">
		<div class="content rel">
			<div class="login_box nextstep abs">
				<div class="mpart">					
					<form id="userRegForm" action="">
						<div class="form_wrap">
							<input name="phone" id="phone" value="${phone }" type="hidden">
							<input name="email" id="email" value="${email }" type="hidden">
							<div class="item"><i class="iicon i-uname"></i>
								<c:if test="${system.webUser != null }">
									<input type="text" class="text" value="${system.webUser.nickname }" readonly="readonly" placeholder="设置昵称" name="nickName" id="nickName" maxlength="10"/></div>
								</c:if>
								<c:if test="${system.webUser == null }">
									<input type="text" class="text" placeholder="设置昵称" name="nickName" id="nickName" maxlength="10"/></div>
								</c:if>
							<div class="item"><i class="iicon i-pwd"></i>
								<input type="password" class="text" placeholder="设置密码(6-16个字符)" name="loginPwd" id="loginPwd" /></div>
							<div class="item" style="margin-bottom:50px;"><i class="iicon i-pwd"></i>
								<input type="password" class="text" placeholder="设置密码(6-16个字符)" name="rloginPwd" id="rloginPwd" /></div>
							<button class="btn loginBtn" onclick="registe();">注册</button>
						</div>					
					</form>							
				</div>
				<div class="opart tc tipmsg">
					已有帐号，<a href="">立即登录</a>
				</div>
			</div>
		</div>
	</div>
	
	<c:if test="${regtype == 'email' }">
	</c:if>
	
	
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
</body>
<script type="text/javascript" src="static/web/js/base.js"></script>
<script type="text/javascript">
$("#userRegForm").bind('submit',function(){return false;});

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


var registe = function(){
	var param = {
		"op":'register',
		<c:if test="${regtype != 'email' }">
		"phone":$("#phone").val(),
		</c:if>
		
		<c:if test="${regtype == 'email' }">
		"email":$("#email").val(),
		</c:if>
		"nickName":$("#nickName").val(),
		"loginPwd":$("#loginPwd").val(),
		"rloginPwd":$("#rloginPwd").val()
	};
	if(!checkField(param.nickName)){
		popMesTip("请输入您的昵称");
		return ;
	}else{
		if(!checkField(param.nickName,0,10)){
			popMesTip("昵称不能超过10个字");
			return ;
		}
	}
	if(!checkField(param.loginPwd)){
		popMesTip("请输入您的密码");
		return ;
	}
	if(param.loginPwd != param.rloginPwd){
		popMesTip("两次密码输入不一致");
		return ;
	}
	$.post('<%=basePath %>pc/login',param,function(res){
		if(res.message == 'success'){
			alert("注册成功，点击确定跳转到登录页面。")
			window.location.href='<%=basePath %>pc/login?op=toLogin';
		}else if("user_is_contain" == res.message){
			popMesTip("注册失败，该手机或邮箱已经被使用.")
		}else if("r_password_err" == res.message){
			popMesTip("注册失败，两次密码输入不一致.")
		}else{
			popMesTip("注册失败，请稍后重试.")
		}
	},"JSON");
};
</script>
</html>