<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transition al.dtd"><%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../../static/inc_web.jsp" %>
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv = "X-UA-Compatible" content = "IE=edge,chrome=1 " /><meta charset="utf-8"> 
<title>会员互动-达人主页</title>
<link rel="stylesheet" href="static/web/css/common.css" />
<link rel="stylesheet" href="static/web/css/inner.style.css" />
<link rel="stylesheet" href="static/web/css/personal.center.css" />
<link rel="stylesheet" href="static/web/css/member.css"/>
<style type="text/css">
.menu_cart{
	width:790px;
	left:100px;
}
.firstWord{
	line-height: 20px !important;
	max-height: 60px;
	overflow: hidden;
}
</style>
</head>
<body>
<ul id="travelsModel" style="display: none;">
<li>
	<a href="pc/user/article/detail">
		<img src="static/web/img/colorful1.jpg" />
	</a>
	<div class="protext">
		<h3>跟着Blululu去旅行——一个黄昏，恋上一座城（发现基督城系列）</h3>
		<div class="Text">
			<p class="firstWord">震后的花园城市，市中心依然一片废墟，满目狼藉。可走在秋日的黄昏，一缕光拉长了我的身影，延展向远方。</p>
			<p class="tr">
				<a class="underline" href="#">查看详情</a>
			</p>
		</div>
		<p class="clock">
			<span class="grey">
				<i class="iicon i-clock"></i>
				<span class="createTime" _value="2015-6-1 21:30"></span>
			</span>
		</p>
	</div>
</li>
</ul>
<ul id="questionModel" style="display: none;">
<li>
	<img src="static/web/img/avatar2.jpg" />
	<div class="protext2">
		<h3>
			<span class="fr">5条解答</span>
			<span class="name">Ssinz</span>
		</h3>
		<p>
			<a class="underline fr" href="#">查看详情</a>
			<span class="mr10">
				<i class="icon i-matter mr10"></i>
				问
			</span>
			<span class="content">大溪谷怎么走</span>
		</p>
		<p class="createTime">time</p>
	</div>
</li>
</ul>
<ul id="complaintModel" style="display: none;">
<li>
	<p>
		<a class="underline fr" href="#">查看详情</a>
		吐槽：<span class="content">大溪谷一点也不好玩</span>
	</p>
	<p>
		<span class="fr grey">
			<i class="icon i-comt"></i>
			<span class="count">23</span>
		</span>
		<span class="grey">
			<i class="iicon i-clock"></i>
			<span class="createTiem">2015-6-1 21:30</span>
		</span>
	</p>
</li>
</ul>
<ul id="depthModel" style="display: none;">
<li>
	<a href="pc/user/article/detail">
		<img src="static/web/img/colorful1.jpg" />
	</a>
	<div class="protext3">
		<h3>橘子酒店－精选（贵阳亚运村）</h3>
		<p>
			<a class="underline fr" href="#">查看详情</a>
			<span class="orange f18">¥ 237</span>
			起
		</p>
		<p class="title">仅售97元！价值232元的超值午餐，建议3人使用，提供免费wifi。</p>
		<p class="clock">
			<span class="grey">
				<i class="iicon i-clock"></i>
				<span class="createTime">2015-6-1 21:30</span>
			</span>
		</p>
	</div>
</li>
</ul>
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
	<div class=" content_wrap pb90">
		<div class="content">
		  <div class="venda mt20">
			<img src="static/web/img/home_bg.jpg"/>
			<div class="information clearfix">
			  <div class="head fl" style="margin-left: -110px;"><img src="${user.headImg }" width="80" height="80"/></div>
			  <div class="inforLe">
				<h3><span class="homename mr20">${user.nickname }</span> <c:if test="${user.isMaster eq '达人' }"><span class="desig">旅行达人</span></c:if> </h3>
				<p class="grade"><span><i class="grey mr10">等级</i><i class="orange mr20">${user.parentLevelDesc }</i></span><span><i class="grey ml20"><i class="iicon fruit"></i>桃子</i><i class="orange ml10">${user.score }</i></span></p>
				<p><c:if test="${user.parentLevelName == 1 }">
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
					</c:if></p>
				<p>${user.summary }</p>
			  </div>
			  <div class="inforRi clearfix">
				  <div class="Bttun fl">
					<button onclick="goweb();"><i class="icon stratgy"></i><a href="javascript:;">攻略游记</a></button>
					<c:if test="${user.id != system.webUser.id }">
						<button onclick="ask()"><i class="icon asking"></i>向他提问</button>
					</c:if>
				  </div>
				  <div class="record fr">
					<span><p class="grey">采纳率</p><p class="orange">${percent }%</p></span><span><p class="grey">解答数</p><a href="javascript:;" onclick="clickReply()"><p class="orange">${replyCount }</p></a></span>
				  </div>
			  </div>
			</div>
		  </div>
		  <ul class="tab_sort clearfix mt20">
			 <li class="active">全部</li>
			 <li>文章</li>
			 <li>问答（${questionCount }）</li>
			 <li>吐槽（${complaintCount }）</li>
			 <li>收藏（${collectionCount }）</li>
			 <li>回答数（${replyCount }）</li>
		  </ul>
		  <div class="below">
		    <div class="list-below bgno"><!-- 首页DIV -->
			  <div class="empty"><img src="static/web/images/face_bg.png"/><p>暂无内容</p></div>
			  <div class="article">
			    <div class="list_article">
				  <div class="lump"><!-- 首页达人攻略 -->
				     <h3 class="d-title">达人攻略<i class="icon i-next"></i></h3>
				     <ul class="ul_venda">
				     <c:forEach items="${strategyList }" var="travels">
				       <li>
					     <a href="javascript:;" onclick="goTravels(${travels.id},2)"><img src="${travels.img }"/></a>
					     <div class="protext">
					       <h3>${travels.title }</h3>
						   <div class="Text"><p class="firstWord">${travels.context }</p><p class="tr">
						   <a href="javascript:;" class="underline" onclick="goTravels(${travels.id},2)">查看详情</a></p>
						   </div>
						   <p class="clock"><span class="grey"><i class="iicon i-clock"></i><span class="afterCreateDate" _value="${travels.create_time.getTime() }"></span></span></p>
					     </div>
					   </li>
				     </c:forEach>
				     </ul>
				  </div>
				  <div class="lump"><!-- 首页精彩游记 -->
				     <h3 class="d-title">精彩游记<i class="icon i-next"></i></h3>
				     <ul class="ul_venda">
				     <c:forEach items="${travelsList }" var="strategy">
				       <li>
					     <a href="javascript:;" onclick="goTravels(${strategy.id},1)"><img src="${strategy.img }"/></a>
					     <div class="protext">
					       <h3>${strategy.title }</h3>
						   <div class="Text"><p class="firstWord">${strategy.context }</p><p class="tr">
						   <a href="javascript:;" class="underline" onclick="goTravels(${strategy.id},2)">查看详情</a></p>
						   </div>
						   <p class="clock"><span class="grey"><i class="iicon i-clock"></i><span class="afterCreateDate" _value="${strategy.create_time.getTime() }"></span></span></p>
					     </div>
					   </li>
				     </c:forEach>
				     </ul>
				  </div>
				  <div class="lump"><!-- 首页玩伴招募 -->
				     <h3 class="d-title">玩伴召募<i class="icon i-next"></i></h3>
				     <ul class="ul_venda">
				     <c:forEach items="${friendList }" var="friend">
				       <li>
					     <a href="javascript:;" onclick="goTravels(${friend.id},1)"><img src="${friend.img }"/></a>
					     <div class="protext">
					       <h3>${friend.title }</h3>
						   <div class="Text"><p class="firstWord">${friend.context }</p><p class="tr">
						   <a href="javascript:;" class="underline" onclick="goTravels(${friend.id},2)">查看详情</a></p>
						   </div>
						   <p class="clock"><span class="grey"><i class="iicon i-clock"></i><span class="afterCreateDate" _value="${friend.create_time.getTime() }"></span></span></p>
					     </div>
					   </li>
				     </c:forEach>
				     </ul>
				  </div>
				  <div class="lump"><!-- 首页问答 -->
					 <h3 class="d-title">问答<i class="icon i-next"></i></h3>
					 <ul class="ul_answer">
					 <c:forEach items="${questionList }" var="question">
					   <li>
						 <img src="${question.head_img }"/>
						 <div class="protext2">
						   <h3><span class="fr">${question.replyCount }条解答</span><span>${question.nickname }</span></h3>
						   <p><a class="underline fr" href="javascript:;" onclick="goQuestion(${question.id})">查看详情</a><span class="mr10"><i class="icon i-matter mr10"></i>问</span>  ${question.content }</p>
						 </div>
					   </li>
					 </c:forEach>
					 </ul>
				  </div>
				  <div class="lump"><!-- 首页吐槽 -->
				    <h3 class="d-title">吐槽<i class="icon i-next"></i></h3>
					<ul class="ul_roast">
					<c:forEach items="${complaintList }" var="complaint">
					  <li>
						<p><a class="underline fr" href="javascript:;" onclick="goComplaint(${complaint.id})">查看详情</a>吐槽：${complaint.content }</p>
						<p><span class="fr grey"><i class="icon i-comt"></i>${complaint.replyCount }</span><span class="grey"><i class="iicon i-clock"></i><span class="afterCreateDate" _value="${complaint.create_time.getTime() }"></span></span></p>
					  </li>
					</c:forEach>
					</ul>
				  </div>
				  <div class="lump"><!-- 首页收藏 -->
				    <h3 class="d-title">收藏<i class="icon i-next"></i></h3>
			        <ul class="ul_venda">
			        <c:forEach items="${collectionList }" var="collection">
				     <li>
				     <c:if test="${collection.type=='depth' }">
					 <a _id="${collection.id }" href="javascript:;" onclick="goDepth(${collection.id})">
				     </c:if>
				     <c:if test="${collection.type=='travels' }">
					 <a _id="${collection.id }" href="javascript:;" onclick="goTravels(${collection.id})">
				     </c:if>
					 <img src="${collection.imgUrl }"/></a>
					 <div class="protext3">
					   <h3>${collection.title }</h3>
					   <p class="firstWord">
					   <c:if test="${collection.type=='depth' }">
					 <a _id="${collection.id }" class="underline fr" href="javascript:;" onclick="goDepth(${collection.id})">
				     </c:if>
				     <c:if test="${collection.type=='travels' }">
					 <a _id="${collection.id }" class="underline fr" href="javascript:;" onclick="goTravels(${collection.id})">
				     </c:if>
					   查看详情</a><span class="orange f18"></span>${collection.context }</p>
					   <%-- <p>${collection.remark }</p> --%>
					   <p class="clock"><span class="grey"><i class="iicon i-clock"></i><span class="afterCreateDate" _value="${collection.collectionTime.getTime() }"></span></span></p>
					 </div>
				   </li>
			        </c:forEach>
				    </ul>
				  </div>
				</div>
			  </div>
			</div>
			<div class="list-below bgno"><!-- 文章 -->
			  <ul class="venda_strat clearfix">
			    <li class="active"><span>全部</span></li>
				<li><span>达人攻略（${strategyCount }）</span></li>
				<li><span>精彩游记（${travelsCount }）</span></li>
				<li><span>玩伴召募（${friendCount }）</span></li>
			  </ul>
			  <div class="article">
			    <div class="list_article"><!-- 全部文章DIV -->
				  <div class="lump"><!-- 全部文章-达人攻略 -->
				     <h3 class="d-title">达人攻略<i class="icon i-next"></i></h3>
				     <ul class="ul_venda">
				      <c:forEach items="${strategyList  }" var="travels">
				       <li>
					     <a href="javascript:;" onclick="goTravels(${travels.id},1)"><img src="${travels.img }"/></a>
					     <div class="protext">
					       <h3>${travels.title }</h3>
						   <div class="Text"><p class="firstWord">${travels.context }</p><p class="tr">
						   <a href="javascript:;" class="underline" onclick="goTravels(${travels.id},1)">查看详情</a></p>
						   </div>
						   <p class="clock"><span class="grey"><i class="iicon i-clock"></i><span class="afterCreateDate" _value="${travels.create_time.getTime() }"></span></span></p>
					     </div>
					   </li>
				     </c:forEach>
				     </ul>
				  </div>
				  <div class="lump"><!-- 全部文章-精彩游记 -->
				     <h3 class="d-title">精彩游记<i class="icon i-next"></i></h3>
				     <ul class="ul_venda">
				       <c:forEach items="${travelsList }" var="strategy">
				       <li>
					     <a href="javascript:;" onclick="goTravels(${strategy.id},1)"><img src="${strategy.img }"/></a>
					     <div class="protext">
					       <h3>${strategy.title }</h3>
						   <div class="Text"><p class="firstWord">${strategy.context }</p><p class="tr">
						   <a href="javascript:;" class="underline" onclick="goTravels(${strategy.id},2)">查看详情</a></p>
						   </div>
						   <p class="clock"><span class="grey"><i class="iicon i-clock"></i><span class="afterCreateDate" _value="${strategy.create_time.getTime() }"></span></span></p>
					     </div>
					   </li>
				     </c:forEach>
				     </ul>
				  </div>
				  <div class="lump"><!-- 全部文章-玩伴招募 -->
				     <h3 class="d-title">玩伴招募<i class="icon i-next"></i></h3>
				     <ul class="ul_venda">
				      <c:forEach items="${friendList }" var="friend">
				       <li>
					     <a href="javascript:;" onclick="goTravels(${friend.id},1)"><img src="${friend.img }"/></a>
					     <div class="protext">
					       <h3>${friend.title }</h3>
						   <div class="Text"><p class="firstWord">${friend.context }</p><p class="tr">
						   <a href="javascript:;" class="underline" onclick="goTravels(${friend.id},2)">查看详情</a></p>
						   </div>
						   <p class="clock"><span class="grey"><i class="iicon i-clock"></i><span class="afterCreateDate" _value="${friend.create_time.getTime() }"></span></span></p>
					     </div>
					   </li>
				     </c:forEach>
				     </ul>
				  </div>
				</div>
			    <div class="list_article"><!-- 达人攻略 -->
			      <div class="lump strategyDiv">
			      	<input type="hidden" class="pageNo" value="1">
			      	<input type="hidden" class="totalPage">
			      	<input type="hidden" class="type" value="2">
					<h3 class="d-title">达人攻略<i class="icon i-next"></i></h3>
					<ul class="ul_venda"><!-- List内容 -->
						
				    </ul>
				    <div class="pagination">
					</div>	
				  </div>
				</div>
				<div class="list_article"><!-- 精彩游记 -->
			      <div class="lump travelsDiv">
			      	<input type="hidden" class="pageNo" value="1">
			      	<input type="hidden" class="totalPage">
			      	<input type="hidden" class="type" value="1">
					<h3 class="d-title">达人攻略<i class="icon i-next"></i></h3>
					<ul class="ul_venda"><!-- List内容 -->
						
				    </ul>
				    <div class="pagination">
					</div>	
				  </div>
				</div>
				<div class="list_article"><!-- 玩伴招募 -->
			      <div class="lump frendDiv">
			      	<input type="hidden" class="pageNo" value="1">
			      	<input type="hidden" class="totalPage">
			      	<input type="hidden" class="type" value="3">
					<h3 class="d-title">达人攻略<i class="icon i-next"></i></h3>
					<ul class="ul_venda"><!-- List内容 -->
						
				    </ul>
				    <div class="pagination">
					</div>	
				  </div>
				</div>
			  </div>
			</div>
			<div class="list-below"><!-- 旅行问答 -->
			  <div class="lump questionDiv">
				<input type="hidden" class="pageNo" value="1">
				<input type="hidden" class="totalPage">
				<input type="hidden" class="type" value="4">
			    <h3 class="d-title">旅行问答<i class="icon i-next"></i></h3>
				<ul class="ul_answer"><!-- 内容List -->
				</ul>
				<div class="pagination">
				</div>
			  </div>
			</div>
			<div class="list-below"><!-- 吐槽 -->
			  <div class="lump complaintDiv">
				<input type="hidden" class="pageNo" value="1">
				<input type="hidden" class="totalPage">
				<input type="hidden" class="type" value="5">
			    <h3 class="d-title">旅行问答<i class="icon i-next"></i></h3>
				<ul class="ul_answer"><!-- 内容List -->
				</ul>
				<div class="pagination">
				</div>
			  </div>
			</div>
			<div class="list-below"><!-- 收藏 -->
			  <ul class="venda_strat verda_strat2 clearfix">
			      <li class="active"><span id="depthCollection"></span></li>
				  <li><span id="masterCollection"></span></li>
				  <li><span id="travelsCollection"></span></li>
				  <li><span id="friendCollection"></span></li>
			  </ul>
			  <div class="article">
			    <div class="list_article"><!-- 主题深度游收藏 -->
			      <div class="lump depthCollectionDiv">
			      <input type="hidden" class="pageNo" value="1">
				  <input type="hidden" class="totalPage">
				  <input type="hidden" class="type" value="6">
			      <ul class="ul_venda">
				 </ul>
				 <div class="pagination">
				 </div>		
			  </div>
			    </div>
				<div class="list_article"><!-- 收藏达人攻略 -->
					<div class="lump strategyCollectionDiv">
				      	<input type="hidden" class="pageNo" value="1">
				      	<input type="hidden" class="totalPage">
				      	<input type="hidden" class="type" value="7">
						<h3 class="d-title">达人攻略<i class="icon i-next"></i></h3>
						<ul class="ul_venda"><!-- List内容 -->
							
					    </ul>
					    <div class="pagination">
						</div>	
				  	</div>
				</div>
				<div class="list_article"><!-- 收藏精彩游记 -->
					<div class="lump travelsCollectionDiv">
				      	<input type="hidden" class="pageNo" value="1">
				      	<input type="hidden" class="totalPage">
				      	<input type="hidden" class="type" value="8">
						<h3 class="d-title">精彩游记<i class="icon i-next"></i></h3>
						<ul class="ul_venda"><!-- List内容 -->
							
					    </ul>
					    <div class="pagination">
						</div>	
				  	</div>
				</div>
				<div class="list_article"><!-- 收藏玩伴招募 -->
					<div class="lump friendCollectionDiv">
				      	<input type="hidden" class="pageNo" value="1">
				      	<input type="hidden" class="totalPage">
				      	<input type="hidden" class="type" value="9">
						<h3 class="d-title">玩伴招募<i class="icon i-next"></i></h3>
						<ul class="ul_venda"><!-- List内容 -->
							
					    </ul>
					    <div class="pagination">
						</div>	
				  	</div>
				</div>
			  </div>
			</div>
			<div class="list-below"><!-- 吐槽 -->
			  <div class="lump QuestionReplyDiv">
				<input type="hidden" class="pageNo" value="1">
				<input type="hidden" class="totalPage">
			    <h3 class="d-title">旅行问答<i class="icon i-next"></i></h3>
				<ul class="ul_answer"><!-- 内容List -->
				</ul>
				<div class="pagination">
				</div>
			  </div>
			</div>
		  </div>
		</div>				
	</div>
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
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
<script id="rulepopup" type="text/template">
<div class="innerdiv pd20">
	<p style="margin:0 40px; color:#999;">LLorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet lacus accumsan et viverra justo commodo. Proin sodales pulvinar tempor. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam fermentum, nulla luctus pharetra vulputate, felis tellus mollis orci, sed rhoncus sapien nunc eget odioLorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet lacus accumsan et viverra justo commodo. Proin sodales pulvinar tempor. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam fermentum, nulla luctus pharetra vulputate, felis tellus mollis orci, sed rhoncus sapien nunc eget odio.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet lacus accumsan et viverra justo commodo. Proin sodales pulvinar tempor. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam fermentum, nulla luctus pharetra vulputate, felis tellus mollis orci, sed rhoncus sapien nunc eget odio.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet lacus accumsan et viverra justo commodo. Proin sodales pulvinar tempor. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam fermentum, nulla luctus pharetra vulputate, felis tellus mollis orci, sed rhoncus sapien nunc eget odio.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet lacus accumsan et viverra justo commodo. Proin sodales pulvinar tempor. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam fermentum, nulla luctus pharetra vulputate, felis tellus mollis orci, sed rhoncus sapien nunc eget odio.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet lacus accumsan et viverra justo commodo. Proin sodales pulvinar tempor. Cum sociis natoqueorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet lacus accumsan et viverra justo commodo. Proin sodales pulvinar tempor. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam fermentum, nulla luctus pharetra vulputate, felis tellus mollis orci, </p>
</div>
</script>

<script type="text/javascript" src="static/web/js/base.js"></script>
<script type="text/javascript" src="static/web/js/index.js"></script>
<script type="text/javascript" src="static/web/js/person.js"></script>
<script type="text/javascript">

var userId=parseInt("${user.id}");

$(function(){
	scrollBannerInit($(".banner-ul"),$(".banner-btn"));
	
	$("span.afterCreateDate").each(function(){//初始化时间
		var timestamp=parseInt($(this).attr("_value"));
		$(this).html(getTimeTxt(timestamp,16));
	});
	
	getTravelsList($(".strategyDiv"));
	getTravelsList($(".travelsDiv"));
	getTravelsList($(".frendDiv"));
	getQuestion($(".questionDiv"));
	getComplaint($(".complaintDiv"));
	getTravelsCollection($(".strategyCollectionDiv"));
	getTravelsCollection($(".travelsCollectionDiv"));
	getTravelsCollection($(".friendCollectionDiv"));
	getDepthCollection($(".depthCollectionDiv"));
	getQuestionReply($(".QuestionReplyDiv"));
	

	
});


//获取主题深度游列表
function getDepthCollection(obj){
	var type=$(obj).find("input.type").val();
	var pageNo=$(obj).find("input.pageNo").val();
	$.post("<%=basePath %>pc/user/depthCollectionList",{pageNo:pageNo,showLine:10,userId:userId},function(data){
		if(data.status=="success"){
			var list=data.list;
			var ul=$(obj).find("ul").empty();
			for(var i=0;i<list.length;i++){
				var li=$("#depthModel").children().clone();
				li.find("a").attr("href","javascript:;");
				li.find("a").attr("_id",list[i].id);
				li.find("a").bind("click",function(){
					goDepth($(this).attr("_id"));
				});
				li.find("img").attr("src",list[i].pic_url);
				li.find("h3").html(list[i].name);
				li.find(".f18").html("¥ "+list[i].adult_price);
				li.find(".title").html(list[i].remark);
				li.find(".createTime").html(getTimeTxt(list[i].create_time,16));
				ul.append(li);
			}
			$("#depthCollection").html("深度游("+data.recordsTotal+")");
			$(obj).find("input.totalPage").val(data.totalPage);
			initPage(obj);
		}
	});
}

//获取搜藏文章列表
function getTravelsCollection(obj){
	var type=$(obj).find("input.type").val();
	var pageNo=$(obj).find("input.pageNo").val();
	$.post("<%=basePath %>pc/user/strategyCollectionList",{type:type,pageNo:pageNo,showLine:10,userId:userId},function(data){
		if(data.status=="success"){
			var list=data.list;
			var ul=$(obj).find("ul").empty();
			for(var i=0;i<list.length;i++){
				var li=$("#travelsModel").children().clone();
				li.find("a").attr("href","javascript:;");
				li.find("a").attr("_id",list[i].id);
				li.find("a").bind("click",function(){
					goTravels($(this).attr("_id"));
				});
				li.find("img").attr("src",list[i].imgUrl);
				li.find("h3").html(list[i].title);
				li.find(".Text p:first").html(list[i].context);
				li.find(".clock .createTime").html(getTimeTxt(list[i].create_time,16));
				ul.append(li);
			}
			if(obj.hasClass("strategyCollectionDiv")){
				$("#masterCollection").html("攻略("+data.recordsTotal+")");
			}else if(obj.hasClass("travelsCollectionDiv")){
				$("#travelsCollection").html("游记("+data.recordsTotal+")");
			}else if(obj.hasClass("friendCollectionDiv")){
				$("#friendCollection").html("玩伴招募("+data.recordsTotal+")");
			}
			$(obj).find("input.totalPage").val(data.totalPage);
			initPage(obj);
		}
	});
}

//获取问答列表
function getComplaint(obj){
	var type=$(obj).find("input.type").val();
	var pageNo=$(obj).find("input.pageNo").val();
	$.post("<%=basePath %>pc/user/complaintList",{pageNo:pageNo,showLine:10,userId:userId,orderType:0},function(data){
		if(data.status=="success"){
			var list=data.list;
			var ul=$(obj).find("ul").empty();
			for(var i=0;i<list.length;i++){
				var li=$("#complaintModel").children().clone();
				li.find("a").attr("href","javascript:;");
				li.find("a").attr("_id",list[i].id);
				li.find("a").bind("click",function(){
					goComplaint($(this).attr("_id"));
				});
				li.find(".content").html(list[i].content);
				li.find(".count").html(list[i].replyCount);
				li.find(".createTiem").html(getTimeTxt(list[i].create_time,16));
				ul.append(li);
			}
			$(obj).find("input.totalPage").val(data.totalPage);
			initPage(obj);
		}
	});
}

//获取问答列表
function getQuestion(obj){
	var type=$(obj).find("input.type").val();
	var pageNo=$(obj).find("input.pageNo").val();
	$.post("<%=basePath %>pc/user/questionList",{pageNo:pageNo,showLine:10,userId:userId,orderType:0},function(data){
		if(data.status=="success"){
			var list=data.list;
			var ul=$(obj).find("ul").empty();
			for(var i=0;i<list.length;i++){
				var li=$("#questionModel").children().clone();
				li.find("img").attr("src",list[i].head_img);
				li.find("h3 .fr").html(list[i].replyCount+"条解答");
				li.find(".name").html(list[i].nickname);
				var content=list[i].content;
				if(content.length>80){
					content=content.substring(0,80)+"...";
				}
				li.find(".content").html(content);
				li.find(".createTime").html(getTimeTxt(list[i].create_time,16));
				li.find("a").attr("href","javascript:;");
				li.find("a").attr("_id",list[i].id);
				li.find("a").bind("click",function(){
					goQuestion($(this).attr("_id"));
				});
				ul.append(li);
			}
			$(obj).find("input.totalPage").val(data.totalPage);
			initPage(obj);
		}
	});
}

//获取问答列表
function getQuestionReply(obj){
	var type=$(obj).find("input.type").val();
	var pageNo=$(obj).find("input.pageNo").val();
	$.post("<%=basePath %>pc/user/questionReplyList",{pageNo:pageNo,showLine:10,userId:userId},function(data){
		if(data.status=="success"){
			var list=data.list;
			var ul=$(obj).find("ul").empty();
			for(var i=0;i<list.length;i++){
				var li=$("#questionModel").children().clone();
				li.find("img").attr("src",list[i].head_img);
				li.find("h3 .fr").html(list[i].replyCount+"条解答");
				li.find(".name").html(list[i].nickname);
				var content=list[i].content;
				if(content.length>80){
					content=content.substring(0,80)+"...";
				}
				li.find(".content").html(content);
				li.find(".createTime").html(getTimeTxt(list[i].create_time,16));
				li.find("a").attr("href","javascript:;");
				li.find("a").attr("_id",list[i].id);
				li.find("a").bind("click",function(){
					goQuestion($(this).attr("_id"));
				});
				ul.append(li);
			}
			$(obj).find("input.totalPage").val(data.totalPage);
			initPage(obj);
		}
	});
}

//获得文章列表
function getTravelsList(obj){
	var type=$(obj).find("input.type").val();
	var pageNo=$(obj).find("input.pageNo").val();
	$.post("<%=basePath %>pc/user/travlesList",{travelType:type,pageNo:pageNo,showLine:10,userId:userId,orderType:0},function(data){
		if(data.status=="success"){
			var list=data.list;
			var ul=$(obj).find("ul").empty();
			for(var i=0;i<list.length;i++){
				var li=$("#travelsModel").children().clone();
				li.find("a").attr("href","javascript:;");
				li.find("a").attr("_id",list[i].id);
				li.find("a").bind("click",function(){
					goTravels($(this).attr("_id"));
				});
				li.find("img").attr("src",list[i].img);
				li.find("h3").html(list[i].title);
				li.find(".Text p:first").html(list[i].context);
				li.find(".clock .createTime").html(getTimeTxt(list[i].create_time,16));
				ul.append(li);
			}
			$(obj).find("input.totalPage").val(data.totalPage);
			initPage(obj);
		}
	});
}

function clickReply(){
	$(".tab_sort li:eq(5)").click();
}

function goweb(){
	window.location.href="<%=basePath %>pc/travels/written";
}

function goDepth(id){
	window.location.href="<%=basePath %>pc/depth/detail/"+id;
}

function goTravels(id){
	window.location.href="<%=basePath %>pc/travels/detial/0_"+id;
}

function goQuestion(id){
	window.location.href="<%=basePath %>pc/question/detial_"+id;
}

function goComplaint(id){
	window.location.href="<%=basePath %>pc/complaint/detial_"+id;
}

function ask(){
	var data={};
	data.nickName="${user.nickname }";
	data.toUserId=userId;
	subWebForm("<%=basePath %>pc/question/newQuestion",data);
}

function gotoPage(goNo,obj){
	var obj=$(obj).parents(".lump");
	console.info(obj);
	$(obj).find("input.pageNo").val(parseInt(goNo));
	var type=parseInt($(obj).find("input.type").val());
	if(type<4){
		getTravelsList(obj);
	}else if(type==4){
		getQuestion(obj);
	}else if(type==5){
		getComplaint(obj);
	}else if (type>5){
		getTravelsCollection(obj);
	}
}

function goPage(thisObj){
	var obj=$(thisObj).parents(".lump");
	var pageNo=parseInt($(thisObj).prev().val());
	var totalPage=$(obj).find("input.totalPage").val();
	var type=parseInt($(obj).find("input.type").val());
	if(pageNo>totalPage){
		$(thisObj).prev().val(totalPage);
		valTips("gotopage"+type, "输入页数大于当前最大页数");
	}else{
		$(obj).find("input.pageNo").val(pageNo);
		if(type<4){
			getTravelsList(obj);
		}else if(type==4){
			getQuestion(obj);
		}else if(type==5){
			getComplaint(obj);
		}else if (type>5){
			getTravelsCollection(obj);
		}
	}
}

function initPage(obj){
	var pageDiv=$(obj).find(".pagination");
	var pageNo=parseInt($(obj).find("input.pageNo").val());
	var totalPage=parseInt($(obj).find("input.totalPage").val());
	var type=$(obj).find("input.type").val();
	pageDiv.html("");
	if(pageNo<=1){
		pageDiv.append('<a class="disabled" href="javascript:;">上一页</a>');
	}else{
		pageDiv.append('<a href="javascript:;" onclick="gotoPage('+(pageNo-1)+',this)">上一页</a>');
	}
	if(pageNo>3){
		pageDiv.append('<a href="javascript:;" onclick="gotoPage(1,this)">1</a>');
		pageDiv.append('<span class="p_text">...</span>');
	}
	for(var i=-2;i<3;i++){
		var thisNo=pageNo+i;
		if(thisNo>0&&thisNo<=totalPage){
			if(i==0){
				pageDiv.append('<a href="javascript:;" class="current" onclick="gotoPage('+thisNo+',this)">'+thisNo+'</a>');			
			}else{
				pageDiv.append('<a href="javascript:;" onclick="gotoPage('+thisNo+',this)">'+thisNo+'</a>');
			}
		}
	}
	if((totalPage-pageNo)>2){
		pageDiv.append('<span class="p_text">...</span>');
		pageDiv.append('<a href="javascript:;" onclick="gotoPage('+totalPage+',this)">'+totalPage+'</a>');
	}
	if(pageNo>=totalPage){
		pageDiv.append('<a class="disabled" href="javascript:;">下一页</a>');
	}else{
		pageDiv.append('<a href="javascript:;" onclick="gotoPage('+(pageNo+1)+',this)">下一页</a>');
	}
	pageDiv.append('<input id="gotopage'+type+'" class="gotopage" type="text" value="'+pageNo+'" /> 页');
	pageDiv.append('<input onclick="goPage(this)" type="button" value="确定" class="mouseCursor"/>');
}

</script>
</body>
</html>