<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transition al.dtd"><%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../../static/inc_web.jsp" %>
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv = "X-UA-Compatible" content = "IE=edge,chrome=1 " /><meta charset="utf-8"> 
<title>账户设置-手机号</title>
<link rel="stylesheet" href="static/web/css/common.css" />
<link rel="stylesheet" href="static/web/css/inner.style.css" />
<link rel="stylesheet" href="static/web/css/personal.center.css" />
<style type="text/css">
.menu_cart{
	width:790px;
	left:100px;
}
</style>
</head>
<body>
<div class="wrapper inner">
	<!-- header -->
	<div class="header">
		<jsp:include page="../common/header.jsp"></jsp:include>	
		<div class="nav_ul_wrap">
			<ul class="nav clearfix">
				<li><a href="pc/home">首页</a></li>
				<!-- <li><a href="pc/simple/home">智易行</a></li> -->
				<li>
					<a href="pc/cart/home">快旅出行</a>
					<div class="level2_nav menu_cart">
						<div class="oneline">
							<a href="pc/cart/rent/list">快旅租车</a>
							<a href="pc/cart/wrap/list">快旅包车</a>
							<a href="pc/cart/bus/list">快旅班车</a>
							<a href="pc/cart/pool/list">快旅拼车</a>
						</div>
					</div>
				</li>
				<li><a href="pc/depth/home">主题深度游</a></li>
				<li class="active">
					<a href="pc/interact/home">互动社区</a>
					<div class="level2_nav">
						<div class="oneline">
							<a href="pc/travels/masterIndex">达人攻略</a>
							<a href="pc/travels/travel">精彩游记</a>
							<a href="pc/interact/frendEnlist">玩伴招募</a>
							<a href="pc/question/index">旅行问答</a>
							<a href="pc/complaint/index">吐槽专区</a>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</div>

	<!-- page content -->
	<div class="content_wrap pb90">
		<div class="content pt20 clearfix">
			<div class="lpart">
				<div class="personal-info clearfix">
					<div class="head fl"><img src="${user.headImg }" width="80" height="80"></div>
					<div class="info fl">
						<span style="display:inline-block;width: 80px;">${user.nickname }</span>
						<p><span class="pr10 grey9">等级</span><span class="orange">${user.parentLevelDesc }</span></p>
						<p>
							<c:if test="${user.parentLevelName == 1 }">
								<c:if test="${user.levelName == 1}">
									<i class="iicon i-bronze"></i>
								</c:if>
								<c:if test="${user.levelName == 2}">
									<i class="iicon i-bronze"></i><i class="iicon i-bronze"></i>
								</c:if>
								<c:if test="${user.levelName == 3}">
									<i class="iicon i-bronze"></i><i class="iicon i-bronze"></i><i class="iicon i-bronze"></i>
								</c:if>
								<c:if test="${user.levelName == 4}">
									<i class="iicon i-bronze"></i><i class="iicon i-bronze"></i><i class="iicon i-bronze"></i><i class="iicon i-bronze"></i>
								</c:if>
								<c:if test="${user.levelName == 5}">
									<i class="iicon i-bronze"></i><i class="iicon i-bronze"></i><i class="iicon i-bronze"></i><i class="iicon i-bronze"></i><i class="iicon i-bronze"></i>
								</c:if>
							</c:if>
							<c:if test="${user.parentLevelName == 2 }">
								<c:if test="${user.levelName == 1}">
									<i class="iicon i-gold"></i>
								</c:if>
								<c:if test="${user.levelName == 2}">
									<i class="iicon i-gold"></i><i class="iicon i-gold"></i>
								</c:if>
								<c:if test="${user.levelName == 3}">
									<i class="iicon i-gold"></i><i class="iicon i-gold"></i><i class="iicon i-gold"></i>
								</c:if>
								<c:if test="${user.levelName == 4}">
									<i class="iicon i-gold"></i><i class="iicon i-gold"></i><i class="iicon i-gold"></i><i class="iicon i-gold"></i>
								</c:if>
								<c:if test="${user.levelName == 5}">
									<i class="iicon i-gold"></i><i class="iicon i-gold"></i><i class="iicon i-gold"></i><i class="iicon i-gold"></i><i class="iicon i-gold"></i>
								</c:if>
							</c:if>
							<c:if test="${user.parentLevelName == 3 }">
								<c:if test="${user.levelName == 1}">
									<i class="iicon i-diamod"></i>
								</c:if>
								<c:if test="${user.levelName == 2}">
									<i class="iicon i-diamod"></i><i class="iicon i-diamod"></i>
								</c:if>
								<c:if test="${user.levelName == 3}">
									<i class="iicon i-diamod"></i><i class="iicon i-diamod"></i><i class="iicon i-diamod"></i>
								</c:if>
								<c:if test="${user.levelName == 4}">
									<i class="iicon i-diamod"></i><i class="iicon i-diamod"></i><i class="iicon i-diamod"></i><i class="iicon i-diamod"></i>
								</c:if>
								<c:if test="${user.levelName == 5}">
									<i class="iicon i-diamod"></i><i class="iicon i-diamod"></i><i class="iicon i-diamod"></i><i class="iicon i-diamod"></i><i class="iicon i-diamod"></i>
								</c:if>
							</c:if>
						</p>
						<p class="fs12"><span class="pr10 grey9">桃子</span><span class="orange">${user.score }</span></p>
					</div>
				</div>
				<ul class="menu">
					<li><a href="pc/user/home">我的主页</a></li>
					<li><a href="pc/user/info" >个人资料</a></li>
					<li><a href="pc/user/account/detail" >账户明细</a></li>
					<li><a href="pc/user/order/depthList">订单管理</a></li>
					<li><a href="pc/user/account/setting" class="current">账户设置</a></li>
					<li><a href="pc/user/message">消息中心</a></li>
				</ul>
			</div>
			<div class="rpart message-center">
				<ul class="tabs clearfix">
					<li class="current">手机号</li>
					<li>邮箱</li>
				</ul>
				<div class="right-warp">
					<!-- 手机号 -->
					<div class="tabs-cont phonenum">
						<div class="status">
							<ul class="phone">
								<li class="current"><i class="iicon step">1</i>手机号验证</li>
								<span class="iicon"></span>
								<li><i class="iicon step">2</i>修改手机号</li>
								<span class="iicon"></span>
								<li><i class="iicon step">3</i>修改成功</li>
							</ul>
						</div>
						<!-- 第一步 -->
						<div class="procedure step1">
							<p>
								<span>当前手机号</span>
								<span id="phone">152*****556</span>
								<a href="javascript:;" class="toStep2">修改</a>
							</p>
						</div>

						<!-- 第二步 -->
						<div class="procedure step2">
							<c:if test="${user.phone != null && user.phone != '' }">
								<div class="item code rel">
									<i class="iicon code"></i>
									<input id="oldPhoneCode" name="oldPhoneCode" placeholder="请输入您当前手机6位短信验证码" />
									<button class="get-code abs" onclick="sendSMS(0);">获取验证码</button>
								</div>
							</c:if>
							
							<div class="item phone-num">
								<i class="iicon phone"></i>
								<input id="newPhone" name="newPhone" placeholder="请输入您的新手机号码" />
							</div>
							<div class="item code rel">
								<i class="iicon code"></i>
								<input id="newPhoneCode" name="newPhoneCode" placeholder="请输入6位您的新手机短信验证码" />
								<button class="get-code abs" onclick="sendSMS(1);">获取验证码</button>
							</div>
							
							<div>
								<c:if test="${user.phone != null && user.phone != '' }">
								<button onclick="settingSave(this,'phone_1');" class="btn next">保存</button>
								</c:if>
								<c:if test="${user.phone == null || user.phone == '' }">
								<button onclick="settingSave(this,'phone_2');" class="btn next">保存</button>
								</c:if>
							</div>
						</div>

						<!-- 第三步 -->
						<div class="procedure step3">
							<i class="iicon green-arrow"></i>
							<p>恭喜您修改成功！</p>
							<button class="btn">返回</button>
						</div>

						<div class="change-pwd">
							<div class="subtitle">登录密码</div>
							<div class="cont">
								<div class="old-pwd">
									<label>当前密码</label>
									<input name="password" id="password1" type="password" />
								</div>
								<div class="new-pwd">
									<label>新密码</label>
									<input name="newPassword" id="newPassword1" type="password" />
								</div>
								<div class="new2-pwd">
									<label>确认新密码</label>
									<input name="rnewPassword" id="rnewPassword1" type="password" />
								</div>
								<button class="btn" onclick="modPass(1);">保存</button>
							</div>
						</div>
					</div>
					<!-- 邮箱 -->
					<div class="tabs-cont email" style="display:none;">
						<div class="status">
							<ul class="phone">
								<li class="current"><i class="iicon step">1</i>邮箱验证</li>
								<c:if test="${user.email != null && user.email != '' }">
									<span class="iicon"></span>
									<li><i class="iicon step">2</i>修改邮箱</li>
									<span class="iicon"></span>
									<li><i class="iicon step">3</i>修改成功</li>
								</c:if>
								<c:if test="${user.email == null || user.email == '' }">
									<span class="iicon"></span>
									<li><i class="iicon step">2</i>修改成功</li>
								</c:if>
							</ul>
						</div>
						<!-- 第一步 -->
						<div class="procedure step1">
							<div class="email-warp">
								<div class="warp rel" style="margin-top:92px;">
									<i class="iicon email"></i>
									<input id="oldEmail" placeholder="请输入新邮箱" />
								</div>
								
								<div class="warp rel">
									<input id="oldEmailCode" placeholder="请输入您获取的验证码">
									<img onclick="sendEmailCode(0);" width="95" height="32" class="abs" src="static/img/getcode.jpg">
									<!-- <a class="abs" href="">刷新</a> -->
								</div>
								<c:if test="${user.email != null && user.email != '' }">
								<button onclick="checkEmailCode(this,0);" class="btn">验证修改</button>
								</c:if>
								<c:if test="${user.email == null || user.email == '' }">
								<button onclick="settingSave(this,'email_1');" class="btn">下一步</button>
								</c:if>
							</div>
						</div>

						<!-- 第二步 -->
						<div class="procedure step2">
							<div class="email-warp">
								<div class="warp" style="margin-top:92px;">
									<i class="iicon email"></i>
									<input id="newEmail" placeholder="请输入新的邮箱" />
								</div>
								<div class="warp rel">
									<input id="newEmailCode" placeholder="请输入新邮箱中的验证码" />
									<img onclick="sendEmailCode(1);" src="static/img/getcode.jpg" width="95" height="32" class="abs">
								</div>
								<button onclick="settingSave(this,'email_2');" class="btn">下一步</button>
							</div>
						</div>

						<!-- 第三步 -->
						<div class="procedure step3">
							<div class="email-warp rel">
								<p style="margin-top:30px;">邮件已发送至您的邮箱：</p>
								<p id="showEmail">qina819@qq.com</p>
								<p class="grey9" style="margin-top:30px;">请点击邮箱中的验证链接完成验证</p>
								<button id="goemail" onclick="" class="btn">前往邮箱验证</button>
								<div class="help abs">
									<p class="help-tit">没有收到邮箱</p>
									<p style="margin-top:20px;"><span class="num">1</span>Email地址是否写错？</p>
									<p><span class="num">2</span>是否在垃圾邮箱？</p>
									<!-- <p><span class="num">3</span>点击<a href="javascript:;">重新发送</a>验证链接</p> -->
								</div>
							</div>
						</div>

						<div class="change-pwd">
							<div class="subtitle">登录密码</div>
							<div class="cont">
								<div class="old-pwd">
									<label>当前密码</label>
									<input name="password" id="password" type="password" />
								</div>
								<div class="new-pwd">
									<label>新密码</label>
									<input name="newPassword" id="newPassword" type="password" />
								</div>
								<div class="new2-pwd">
									<label>确认新密码</label>
									<input name="rnewPassword" id="rnewPassword" type="password" />
								</div>
								<button class="btn" onclick="modPass(0);">保存</button>
							</div>
						</div>
					</div>
				</div>
			</div>
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
	</div>

	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
</div>

<script type="text/javascript" src="static/web/js/base.js"></script>
<script type="text/javascript" src="static/web/js/index.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#phone").html(enPhone());
	$("#email").html(enMail());
	$("#oldEmail").val(enMail());
});

var modPass = function(type){
	var password = $("#password").val();
	var newPassword = $("#newPassword").val();
	var rnewPassword = $("#rnewPassword").val();
	if(type == 1){
		password = $("#password1").val();
		newPassword = $("#newPassword1").val();
		rnewPassword = $("#rnewPassword1").val();
	}
	
	if(!checkField(password)){
		popMesTip("请输入原密码");
		return ;
	}
	
	if(!checkField(newPassword, 6, 16)){
		popMesTip("请输入新密码");
		return ;
	}
	if(!newPassword == rnewPassword){
		popMesTip("新密码和确认密码不一致");
		return ;
	}
	
	$.post('<%=basePath %>pc/user/modPass',{'password':password,'newPassword':newPassword,'rnewPassword':rnewPassword},function(res){
		if('success' == res.status){
			popMesConfirm("保存成功",function(){
				window.location.href=window.location.href;
			});
		}else if("re_pass_err" == res.status){
			popMesTip("新密码和确认密码不一致");
		}else if("login_user_pass_err" == res.status){
			popMesTip("原密码错误");
		}else if('param_err' == res.status){
			popMesTip("输入有误，请检查输入");
		}else{
			popMesTip("服务器忙，请稍后重试");
		}
	},"JSON");
};

function enPhone(){
	var phone ='${user.phone }';
	if(phone != ''){
		var sinx = phone.substring(0, 3);
		var einx = phone.substring(phone.length-3, phone.length);
		return sinx +"*****"+einx;
	}
	return '当前没有绑定手机';
}

function enMail(){
	var email ='${user.email }';
	if(email != ''){
		var sinx = email.substring(0, 3);
		var einx = email.substring(email.indexOf("@"), email.length);
		return sinx +"*****"+einx;
	}
	return '';
}

function sendSMS(op){
	var phone = '${user.phone }';
	if(1==op){
		phone = $("#newPhone").val();
	}
	if(!checkField(phone)){
		popMesTip("请输入正确的电话号码");
		return;
	}
	$.post('<%=basePath %>pc/user?op=sendSMS',{'phone':phone},function(res){
		if('success' == res.status){
			popMesTip("发送成功");
		}else if('api_timeout' == res.status){
			popMesTip("您已经发送过验证码了，请稍后发送");
		}else{
			popMesTip("服务器忙，请稍后重试");
		}
	},"JSON");
}

function sendEmailCode(op){
	var email = '${user.email}';
	
	if(!checkField(email))
		email = $("#oldEmail").val();
	if(1==op){
		email = $("#newEmail").val();
	}
	if(!checkField(email)){
		popMesTip("您的邮箱有误，请检查输入");
		return;
	}
	$.post('<%=basePath %>pc/user/account/sendMailSMS',{'email':email},function(res){
		if('success' == res.status){
			popMesTip("发送成功");
		}else if('api_timeout' == res.status){
			popMesTip("您已经发送过验证码了，请稍后发送");
		}else{
			popMesTip("服务器忙，请稍后重试");
		}
	},"JSON");	
}

var checkEmailCode = function(obj,op){
	var email = '${user.email}';
	var code =$("#oldEmailCode").val();
	if(2==op){
		email = $("#newEmail").val();
		code = $("#newEmailCode").val();
	}
	if(!checkField(email)){
		popMesTip("邮箱不能为空");
		return;
	}
	$.post('<%=basePath %>pc/user/account/checkSetting',{'email':email,'code':code},function(res){
		if('success' == res.status){
			if(0 == op){
				$(obj).parent().parent().parent().find(".step1").css('display','none');
				$(obj).parent().parent().parent().find(".step2").css('display','block');
				$(".email").find("div li:eq(1)").addClass("current");
			}else if(2==op){
				$(obj).parent().parent().parent().find(".step2").css('display','none');
				$(obj).parent().parent().parent().find(".step3").css('display','block');
				$(".email").find("div li:eq(2)").addClass("current");
			}else{
				$(obj).parent().parent().parent().find(".step1").css('display','none');
				$(obj).parent().parent().parent().find(".step3").css('display','block');
				$(".email").find("div li:eq(1)").addClass("current");
			}
		}else if('code_time_out' == res.status){
			popMesTip("验证码失效，请重新获取");
		}else{
			popMesTip("验证码输入有误，请检查输入");
		}
	},"JSON");	
};


function settingSave(obj,type){
	var stype = type.split('_');
	var inx = stype[1];
	
	if('phone' == stype[0]){
		
		var oldPhoneCode = $("#oldPhoneCode").val();
		var newPhoneCode = $("#newPhoneCode").val();
		var newPhone = $("#newPhone").val();
		var oldPhone = '${user.phone }';
		var newPhone = $("#newPhone").val();
		
		if(inx == 1){
			if(oldPhone == newPhone){
				popMesTip("当前手机号和新手机号不能一样");
				return ;
			}
			if(!checkField(oldPhoneCode)){
				popMesTip("请输入当前手机的验证码");
				return ;
			}
		}
		
		if(!checkField(newPhone)){
			popMesTip("请输入新手机号");
			return ;
		}
		if(!checkField(newPhoneCode)){
			popMesTip("请输入新手机验证码");
			return ;
		}
		var param = {
			'oldPhoneCode':oldPhoneCode,
			'newPhoneCode':newPhoneCode,
			'newPhone':newPhone,
			'type':'phone'
		};
		$.post('<%=basePath %>pc/user/account/settingSave',param,function(res){
			if(res.status =='success'){
				$(obj).parent().parent().parent().find(".step2").css('display','none');
				$(obj).parent().parent().parent().find(".step3").css('display','block');
				$(".phonenum").find("div li:eq(2)").addClass("current");
			}else if('new_code_time_out'==res.status || 'old_code_time_out'==res.status){
				popMesTip("验证码已经失效，请重新获取");
			}else if('exists' == res.status){
				popMesTip("此手机已经被其他用户使用，请更换");
			}else{
				popMesTip("您的输入有误，请检查输入");
			}
		},"JSON");
	}else{
		var param ={};
		if('1' == inx){
			param = {
				'modcode':$("#oldEmailCode").val(),
				'email':$("#oldEmail").val(),
				'type':'email'
			};
		}else{
			param = {
				'modcode':$("#newEmailCode").val(),
				'email':$("#newEmail").val(),
				'type':'email'
			};
		}
		if(!checkField(param.email)){
			popMesTip("请输入邮箱");
			return;
		}
		if(!checkField(param.modcode)){
			popMesTip("请输入验证码");
			return;
		}
		
		$.post('<%=basePath %>pc/user/account/settingSave',param,function(res){
			if('success' == res.status){
				if(2==inx){
					$(obj).parent().parent().parent().find(".step2").css('display','none');
					$(obj).parent().parent().parent().find(".step3").css('display','block');
					$(".email").find("div li:eq(2)").addClass("current");
				}else{
					$(obj).parent().parent().parent().find(".step1").css('display','none');
					$(obj).parent().parent().parent().find(".step3").css('display','block');
					$(".email").find("div li:eq(1)").addClass("current");
				}
				$("#showEmail").html(res.email);
				$("#goemail").attr('onclick','javascript:window.location.href=\''+res.emailUrl+'\';');
			}else if('code_time_out' == res.status){
				popMesTip("验证码失效，请重新获取");
			}else if('exists' == res.status){
				popMesTip("此邮箱已经被其他用户使用，请更换");
			}else{
				popMesTip("验证码输入有误，请检查输入");
			}
		},"JSON");
	}
}
</script>

</body>
</html>