<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transition al.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../../../static/inc_web.jsp" %>
<html>
<head>
<base href="<%=basePath %>">
<title>会员互动-旅行问答</title>
<link rel="stylesheet" href="static/web/css/common.css" />
<link rel="stylesheet" href="static/web/css/inner.style.css" />
<link rel="stylesheet" href="static/web/css/personal.center.css" />
<link rel="stylesheet" href="static/web/css/member.css"/>
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
				<li >
					<a href="pc/cart/home">快旅出行</a>
					<div class="level2_nav menu_cart" >
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
	<div class=" content_wrap pb90">
		<div class="content">
		    <div class="breadcrumb">当前位置：<a href="">首页</a><a href="pc/interact/home">互动社区 </a>
		    <a href="pc/question/index" class="parentPath">旅行问答</a>
		    <span class="path">提问</span></div>
			<div class="whitebg box-show">
			  <div class="playmate"><span class="parten">我要提问</span></div>
			  <div class="ask">
			    <h3 class="titleSpan"></h3><!-- 标题提示文字 -->
				<div class="tare"><textarea id="content" placeholder=""></textarea></div>
				<div id="bottomItem" class="pb20 clearfix">
				  <span class="fl">请人回答<span id="selectMember" class="orange"></span><i class="icon add ml10"></i></span>
				  <span class="fr"><input id="code" style="padding: 0;height: 30px;" class="text mr10" type="text" placeholder="请输入验证码后提交" />
				  <img id="codeImg" class="mr20 vm" src="static/web/img/code.jpg" height="32" width="96" alt="">
				  <span id="codeRefresh" class="underline pointer lorange mr20">刷新</span>
				  </span>
				</div>
				<input id="userIds" name="userIds" type="hidden">
				<div class="tr mt20"><button class="Btn Btn-submit">发布</button></div>
				<dl><dt>说明：</dt><dd>问答仅限于旅游问题咨询、讨论与解答，随意灌水或聊天等不属于旅行问答的内容，将被视为无效信息进行删除。请大家遵守规则，共创黔易游美好平台。</dd></dl>
			  </div>
			</div>  
		</div>
	</div>

	<!-- footer -->
	
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
<script id="rulepopup" type="text/temp">
<div class="innerdiv  pd20">
    <div class="searchdiv">
	  <div class="search_wrap"><i class="iicon i-search"></i><input onkeyup="getSearchList()" id="search" class="search-text" type="text" placeholder="搜索人" /></div>
	  <ul class="list_sear">
	    <li><i class="icon"></i>qina819</li>
		<li><i class="icon"></i>qina819</li>
		<li><i class="icon"></i>qina819</li>
	  </ul>
	</div>
	<div class="listbtn"><button class="Btn Btn-select" name="case-ok">确认</button></div>
</div>
</script>

<div id="alertDialog" style="display: none;" >
<div class="innerdiv pd20 tc">
	<p style="padding:50px 0; color:#333;">发布成功</p>
	<button class="Btn" name="case-ok" onclick="callBack()">确认</button>
</div>
</div>

<script type="text/javascript" src="static/web/js/base.js"></script>
<script type="text/javascript" src="static/web/js/index.js"></script>
<script type="text/javascript" src="static/web/js/person.js"></script>
<script type="text/javascript">

var alertDlg;
var goUrl="";

$(function(){
	scrollBannerInit($(".banner-ul"),$(".banner-btn"));
	previewProDetailImg();
	selfDefineFormBtn();
	// 修改身份对话框
	var ruleDlg = new dialogBox({
		selfClass : "type2",
		title : "",
		contentHtml : $("#rulepopup").html(),
		popupBoxW : 816,
		//closeBtnshow : 0,
		initEvent : function($dom){
		}
	});
	
	$(document).on('click','.list_sear li',function(){
		$(this).find('i:eq(0)').toggleClass('tick');
	});
	
	$("#codeRefresh").click(function(){
		$("#codeImg").attr("src", "<%=basePath %>admin/login?op=vcode&t=" + new Date().getTime());
	});
	$("#codeRefresh").click();
	
	
	
	$(".add").click(function(){
		ruleDlg.showDlg();
		getSearchList();
	});
	
	var url="";
	var type="${type}";
	if(type=="complaint"){
		$(".titleSpan").html('<span class="orange">吐槽</span>这里是吐槽天堂，您可以将您想吐槽的内容发表在这里');
		$(".parten").html('我要吐槽');
		$(".path").html('吐槽');
		$(".parentPath").html('我要吐槽');
		$(".parentPath").attr("href","pc/complaint/index");
		$("#bottomItem .fl").hide();
		url="<%=basePath %>pc/complaint/submit";
	}else{
		$(".titleSpan").html('<span class="orange">提问</span>集思广益，让别人帮你回答');
		$(".parten").html('我要提问');
		$(".path").html('提问');
		$(".parentPath").html('我要提问');
		url="<%=basePath %>pc/question/submit";
	}
	
	console.info("${isCode}"=="0");
	if("${isCode}"=="0"){
		console.info($("#bottomItem .fr"));
		$("#bottomItem .fr").hide();	
	}
		
	
	$('.Btn-submit').click(function(){
		var content=$("#content").val();
		var code=$("#code").val();
		var atUserIds=$("#userIds").val();
		var content=$("#content").val();
		if(content.length==0){
			valTips($("#content"),"请输入提问内容");
			return false;
		}
		if(content.length>140){
			valTips($("#content"),"输入内容不得超过140字");
			return false;
		}
		$.post(url,{content:content,code:code,atUserIds:atUserIds},function(data){
			if(data.status=="success"){
				setAlert("发布成功");
				if("${type}"=="complaint"){
					goUrl="<%=basePath %>pc/complaint/index";
				}else{
					goUrl="<%=basePath %>pc/question/index";
				}
			}else if(data.status=="v_code_error"){
				$("#codeRefresh").click();
				setAlert("验证码错误");
			}else{
				setAlert("服务器忙，请稍后重试");
			}
		});
	});
	
	$('.Btn-select').click(function(){
		var userIds="";
		var names="";
		$(".searchdiv .list_sear .tick").each(function(){
			userIds+=$(this).parents("li").attr("_userId")+",";
			names+="@"+$(this).parents("li").text()+",";
		});
		if(names!=""){
			names=names.substring(0,names.lastIndexOf(","));
			userIds=userIds.substring(0,userIds.lastIndexOf(","));
		}
		$("#userIds").val(userIds);
		$("#selectMember").html(names);
	});
	
	if("${toUserId}"!=""){
		$(".add").hide();
		initAsk();
	}
	
});


function setAlert(str){
	$("#alertDialog p").html(str);
	alertDlg = new dialogBox({
		title : "提示",
		contentHtml : $("#alertDialog").html(),
		popupBoxW : 490,
		closeBtnshow : 0,
		initEvent : function($dom){
		}
	});
	alertDlg.showDlg();
}

function callBack(){
	if(goUrl!=""){
		window.location.href=goUrl;
	}
}

function getSearchList(){
	var search=$("#search").val();
	$.post("<%=basePath %>pc/question/search",{nickName:search},function(data){
		if(data.status=='success'){
			var list=data.list;
			var ul = $(".searchdiv .list_sear");
			ul.empty();
			for(var i=0;i<list.length;i++){
				var li='<li _userId="'+list[i].id+'"><i class="icon"></i>'+list[i].nickname+'</li>';
				ul.append(li);
			}
		}
	});
}

function initAsk(){
	console.info("${nickName}");
	$("#userIds").val("${toUserId}");
	$("#selectMember").html(decodeURI("${nickName}"));
}

</script>
</body>
</html>