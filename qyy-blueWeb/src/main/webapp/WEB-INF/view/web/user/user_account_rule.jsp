<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transition al.dtd"><%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../../static/inc_web.jsp" %>
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv = "X-UA-Compatible" content = "IE=edge,chrome=1 " /><meta charset="utf-8"> 
<title>桃子规则</title>
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
					<li><a href="pc/user/account/detail" class="current">账户明细</a></li>
					<li><a href="pc/user/order/depthList">订单管理</a></li>
					<li><a href="pc/user/account/setting">账户设置</a></li>
					<li><a href="pc/user/message">消息中心</a></li>
				</ul>
			</div>
			<div class="rpart">
				<div class="right-warp pt20">
					<div class="title">
						<span>桃子规则</span>
					</div>
					<p class="grey9">
						${ruleDetail.details }
					</p>
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
		"pageNo" : pageNo
	};
	
	$.post("<%=basePath %>pc/user/account/detailList",param,function(data){
		$("#listShow").html("");
		var tr = '<tr><td>{time}</td><td>{operDesc}</td><td>+{operScore}</td><td>{total}</td></tr>';
		if(typeof(data.message)=='undefined' || data.message != 'success'){
			var failText = '<tr><td colspan="4">暂无账户明细</td></tr>'
			$("#listShow").append(failText);
			return ;
		}
		var list=data.data.accountList;
		var itemUi;
		for(var i in list){
			var item = list[i];
			itemUi = $(tr).clone();
			itemUi.find("td:eq(0)").html(item.operDate);
			itemUi.find("td:eq(1)").html(item.ruleDesc);
			itemUi.find("td:eq(2)").html(item.ruleScore);
			itemUi.find("td:eq(3)").html(item.totals);
			itemUi.show();
			$("#listShow").append(itemUi);
		}
		thisPageSize=data.data.thisPageSize;
		totalPage=data.data.totalPage;
		pageNo=data.data.pageNo;
		initPage();
	});
}











</script>

</body>
</html>