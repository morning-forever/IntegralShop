<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transition al.dtd"><%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../../static/inc_web.jsp" %>
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv = "X-UA-Compatible" content = "IE=edge,chrome=1 " /><meta charset="utf-8"> 
<title>消息中心</title>
<link href="static/web/js/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link href="static/web/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />

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
						<p>${user.nickname }</p>
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
					<li><a href="pc/user/account/detail">账户明细</a></li>
					<li><a href="pc/user/order/depthList">订单管理</a></li>
					<li><a href="pc/user/account/setting">账户设置</a></li>
					<li><a href="pc/user/message" class="current">消息中心</a></li>
				</ul>
			</div>
			<div class="rpart message-center">
				<ul class="tabs clearfix">
					<li onclick="gomsg('comment');">评论</li>
					<li onclick="gomsg('notice');" class="current">通知</li>
				</ul>
				<div class="right-warp">
					<!-- 评论 -->
					<div class="tabs-cont"  style="display:none;">
						<div class="comment">
							<ul id="commentList">
								<li class="clearfix">
								</li>
							</ul>
						</div>
						<div class="pagination">
						</div>
					</div>
					<!-- 通知 -->
					<div class="tabs-cont" >
						<ul id="noticeList" class="notice">
							<li class="clearfix">
								<p class="fl"><i class="iicon bell"></i>注册成功！恭喜您获得XX个桃子</p>
								<p class="rel fr"><a href="">点击查看</a><i class="iicon delete"></i></p>
							</li>
						</ul>
						<div class="pagination">
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
<script type="text/javascript" src="static/web/js/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="static/web/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="static/web/js/base.js"></script>
<script type="text/javascript" src="static/web/js/index.js"></script>

<script type="text/javascript">
var totalPage=0;//总页数
var pageNo=1;//当前页


doSerch();

function gotoPage(goNo){
	pageNo=parseInt(goNo);
	doSerch();
}

function goPage(){
	pageNo=parseInt($("#gotopage").val());
	if(parseInt($("#gotopage").val())>totalPage){
		$("#gotopage").val(totalPage);
		valTips("gotopage", "输入页数大于当前最大页数");
	}else{
		doSerch();
	}
}

function initPage(){
	$(".pagination").html("");
	if(pageNo<=1){
		$(".pagination").append('<a class="disabled" href="javascript:;">上一页</a>');
	}else{
		$(".pagination").append('<a href="javascript:;" onclick="gotoPage('+(pageNo-1)+')">上一页</a>');
	}
	if(pageNo>3){
		$(".pagination").append('<a href="javascript:;" onclick="gotoPage(1)">1</a>');
		$(".pagination").append('<span class="p_text">...</span>');
	}
	for(var i=-2;i<3;i++){
		var thisNo=pageNo+i;
		if(thisNo>0&&thisNo<=totalPage){
			if(i==0){
				$(".pagination").append('<a href="javascript:;" class="current" onclick="gotoPage('+thisNo+')">'+thisNo+'</a>');			
			}else{
				$(".pagination").append('<a href="javascript:;" onclick="gotoPage('+thisNo+')">'+thisNo+'</a>');
			}
		}
	}
	if((totalPage-pageNo)>2){
		$(".pagination").append('<span class="p_text">...</span>');
		$(".pagination").append('<a href="javascript:;" onclick="gotoPage('+totalPage+')">'+totalPage+'</a>');
	}
	if(pageNo>=totalPage){
		$(".pagination").append('<a class="disabled" href="javascript:;">下一页</a>');
	}else{
		$(".pagination").append('<a href="javascript:;" onclick="gotoPage('+(pageNo+1)+')">下一页</a>');
	}
	$(".pagination").append('<input id="gotopage" class="gotopage" type="text" value="'+ ((typeof(pageNo) == 'undefined' )?0:pageNo) +'" /> 页');
	$(".pagination").append('<input onclick="goPage()" type="button" value="确定" />');
}


function doSerch(){
	var param = {
		'msgType':'comment',
		"pageNo" : pageNo
	};
	
	$.post("pc/user/message/notice",param,function(data){
		$("#noticeList").html("");
		var itemUl = '<li class="clearfix">'
					+'<p class="fl" id="message"><i class="iicon bell"></i>注册成功！恭喜您获得XX个桃子</p>'
					+'<p class="rel fr"><a id="pDetails" href="">点击查看</a><i id="delMsg" class="iicon delete"></i></p>'
					+'</li>';
		
		if(typeof(data.message)=='undefined' || data.message != 'success'){
			var failText = '<tr><td colspan="4">暂无系统通知</td></tr>'
			$("#noticeList").append(failText);
			return ;
		}
		var list=data.data.list;
		var itemUi;
		for(var i in list){
			var item = list[i];
			itemUi = $(itemUl).clone();
			if('qa' == item.msgSource){
				var nickLink = '<a id="nickLink" href="pc/user/home?id='+item.fromUserId+'">'+item.fromNickName+'</a>'+item.messages;
				itemUi.find("#message").html('<i class="iicon bell"></i>'+nickLink);
				itemUi.find("#pDetails").attr("href",getDetailUrl(item.msgSource,item.biuldId));
			}else if('result' == item.msgSource){
				itemUi.find("#message").html('<i class="iicon bell"></i>'+item.messages);
				itemUi.find("#pDetails").remove();
			}else if('system' != item.msgSource){
				itemUi.find("#message").html('<i class="iicon bell"></i>'+item.messages);
				itemUi.find("#pDetails").attr("href",getDetailUrl(item.msgSource,item.biuldId));
			}else{
				itemUi.find("#message").html('<i class="iicon bell"></i>'+item.messages);
				itemUi.find("#pDetails").remove();
			}
			itemUi.find("#delMsg").attr("onclick",'delMsg('+item.id+')');
			itemUi.show();
			$("#noticeList").append(itemUi);
		}
		thisPageSize=data.data.thisPageSize;
		totalPage=data.data.totalPage;
		pageNo=data.data.pageNo;
		initPage();
	});
}

function getDetailUrl(type,id){
	if("score" == type)
		return '<%=basePath %>pc/user/account/detail';
	else if("order"  == type || "order_ment" == type)
		return '<%=basePath %>pc/user/order/depth/detail/'+id;
	else if("qa"==type)
		return '<%=basePath %>pc/question/detial_'+id;
	else if("order_rent"==type || "order_wrap"==type || "order_bus"==type || "order_pool"==type)
		return '<%=basePath %>pc/user/order/orderDetial/'+id;
	return "404";
}

function delMsg(id){
	var isOk = confirm("您确定删除这条消息么？删除后不能恢复。");
	if(isOk){
		var param = {
			'msgId' : id
		};
		$.post('<%=basePath %>pc/user/delMsg',param,function(res){
			if('success' == res.message){
				alert("删除成功");
				window.location.reload();
			}else{
				alert("删除失败，请刷新后重试。");
			}
		},"JSON");
	}
}

function gomsg(type){
	window.location.href='<%=basePath %>pc/user/message?type='+type;
};

</script>

</body>
</html>