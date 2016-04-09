<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String basePath1 = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath()+"/";
%>
<div class="topbar">
	<div class="content clearfix">
		<c:if test="${system.webUser != null }">
			<div class="fl">
				<span class="haslogin hasdownlist"><img src="${system.webUser.headImg}" class="avatar vm mr10" height="28" width="28" alt="">${system.webUser.nickname }<span class="downlist"><a href="pc/user/home">我的主页</a><a href="pc/user/order/depthList">订单管理</a><a href="pc/user/info">个人资料</a><a href="pc/user/account/setting">账户设置</a><a href="javascript:outLogin();">退出登录</a></span></span>
				<span class="userMsg hasdownlist"><i class="iicon i-news"></i><span id="sumMessage">消息(0)</span><span class="downlist"><a href="pc/user/message" id="replyMessage">评论消息(0)</a><a href="pc/user/message?type=notice" id="noticeMessage">通知消息(0)</a></span></span>
			</div>
		</c:if>
		<c:if test="${system.webUser == null }">
			<div class="fl">
				<i class="iicon i-user"></i><a href="pc/login?op=toLogin">您好，请登录</a><span class="span-spc register-span"><a href="pc/login?op=toRegiste">注册</a></span><span class="userMsg hasdownlist"><!-- <i class="iicon i-news"></i>消息</span> -->
			</div>
		</c:if>
		<div class="fr">
			<span onclick="goAppDownload()" class="appdown hasdownlist"><i class="iicon i-app"></i>APP下载<span class="appcode"><img src="static/web/images/twovcode.jpg" height="128" width="128" alt=""></span></span>
			<span class="span-spc"><i class="iicon i-about"></i><a href="pc/aboutWe">关于我们</a></span>
			<c:if test="${system.webUser == null }">
				<span class="social-span">
					<a href="javascript:;" onclick="thirdLogin('wechat');" class="iicon i-weixin"></a>
					<a href="javascript:;" onclick="thirdLogin('qq');" class="iicon i-qq"></a>
					<a href="javascript:;" onclick="thirdLogin('weibo');" class="iicon i-weibo"></a>
				</span>
			</c:if>
			<c:if test="${system.webUser != null }">
				<span class="social-span unable">
					<span class="iicon i-weixin"></span>
					<span class="iicon i-qq"></span>
					<span class="iicon i-weibo"></span>
				</span>
			</c:if>
		</div>
	</div>
</div>

<c:if test="${ isShow }">
<div class="inner_nav_wrap rel">
	<div class="content rel">
		<a href="#" id="logo"><img src="static/web/images/logo.png" height="59" width="176" alt="" class="logo"></a>	
		<div class="search_wrapper abs"><i class="iicon i-search"></i>
		<input id="searchInput" onkeydown="enterSearch();" value="${title }" class="search-text" type="text" placeholder="请输入关键词" />
		<button onclick="search();" class="search-btn">搜 索</button></div>
		<div class="contact400">
			<span class="i-contact"></span>
			<span class="f18 bold">${tel400 }</span>
		</div>
		<c:if test="${isInteract }">
		<div name="autoplan" class="swipe-part swipe-part2 applyMaster" onclick="goApplyMaster()">
			<span class="incont">
				<span class="orange f26 inline" style="padding-bottom:9px;">我要成为达人</span><br />
				<span class="f16 dark inline pb15 mb20">I want to be Master</span><br />
				<i class="iicon i-face"></i>
			</span>
		</div>
		</c:if>
	</div>				
</div>	
</c:if>

<!-- 消息提示框 -->
<div id="mesTipPopup" style="display: none;">
	<div class="innerdiv pd20 tc">
		<p style="padding:50px 0; color:#333;">收藏成功</p>
		<button class="btn lorgbtn" name="case-ok">确认</button>
	</div>
</div>

<!-- 操作确认框 -->
<div id="mesConfirmPopup" style="display: none;">
	<div class="tc mb20 mt20">
		<button name='case-ok' class="btn lorgbtn">确定</button>
		<button name='case-no' class="btn ml20">取消</button>
	</div>
</div>
 
<script type="text/javascript">

$(function(){
	$(".applyMaster").bind("click",function(){
		goApplyMaster()
	});
	findMessage();
})

function findMessage(){
	var comment=0;
	var notice=0;
	if("${system.webUser}"!=""){
	$.post("pc/user/findUnread",{},function(data){
		if(data.status=="success"){
			var list=data.list;
			for(var i=0;i<list.length;i++){
				if(list[i].msgType=="comment"){
					comment=list[i].unreadLine;
				}else if(list[i].msgType=="notice"){
					notice=list[i].unreadLine;
				}
			}
		}
		$("#replyMessage").html("评论消息(<span>"+comment+"</span>)");
		$("#noticeMessage").html("通知消息(<span>"+notice+"</span>)");
		$("#sumMessage").html("消息(<span style='font-size:12px'>"+(notice+comment)+"</span>)");
		if(comment!=0){
			$("#replyMessage span").css("color","red");
		}
		if(notice!=0){
			$("#noticeMessage span").css("color","red");
		}
		if((notice+comment)!=0){
			$("#sumMessage span").css("color","red");
		}
		setTimeout("findMessage()",5000);
	});
	}
}

function goApplyMaster(){
	window.location.href="<%=basePath1%>pc/user/applyMaster";
}

function goAppDownload(){
	window.location.href="<%=basePath1%>pc/appDownload";
}

var search =function(){
	var title = $("#searchInput").val();
	title = encodeURI(encodeURI(title));
	window.location.href="<%=basePath1%>pc/search?fromType=home&title="+title;
};

function enterSearch(){
	var event=arguments.callee.caller.arguments[0]||window.event;//消除浏览器差异  
	if (event.keyCode == 13){  
		search();
	}  
}

function thirdLogin(op){
	$.post('<%=basePath1%>pc/login',{'type':op,'op':'toThirdLogin'},function(res){
		window.location.href=res.urls;
	},"JSON");
}

//消息提示框 
function popMesTip(mes,doOk){
	$("#mesTipPopup p").text(mes);
	var viewMesTipDlg = new dialogBox({
		title : "提示",
		contentHtml : $("#mesTipPopup").html(),
		popupBoxW : 490,
		closeBtnshow : 0,
		okFunc : doOk,
		initEvent : function($dom){
		}
	});
	viewMesTipDlg.showDlg();
}

//操作确认框 
function popMesConfirm(mes,doOk,doCancel){
	var viewMesConfirmDlg = new dialogBox({
		title : mes,
		selfClass : "type2",
		contentHtml : $("#mesConfirmPopup").html(),
		popupBoxW : 500,
		coverhide : false,
		okFunc : doOk,
		cancelFunc : doCancel, // 取消操作
		initEvent : function($dom){
		}
	});
	viewMesConfirmDlg.showDlg();
}
</script>