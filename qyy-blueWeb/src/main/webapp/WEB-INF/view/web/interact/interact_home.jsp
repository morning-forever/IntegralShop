<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transition al.dtd"><%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../../static/inc_web.jsp" %>
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv = "X-UA-Compatible" content = "IE=edge,chrome=1 " /><meta charset="utf-8"> 
<title>会员互动</title>
<!-- 日期时间控件 -->
<link href="static/web/js/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link href="static/web/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
<link rel="stylesheet" href="static/web/css/common.css" />
<link rel="stylesheet" href="static/web/css/index.css" />
<link rel="stylesheet" href="static/web/css/inner.style.css" />
<link rel="stylesheet" href="static/web/css/personal.center.css" />
<link rel="stylesheet" href="static/web/css/member.css"/>
<style type="text/css">
.menu_cart{
	width:790px;
	left:100px;
}
.nickname{
	overflow: hidden;
	height: 23px;
}
</style>
</head>
<body>
<div id="userModel" style="display: none;">
<dl class="postion ">
<dd><a href="javascript:;"><img src=""/></a></dd>
<dt><a href="javascript:;"><p class="nickname"></p></a><p class="f12"><i class="icon i-post"></i>发帖 <span class="orange count"></span></p></dt>
</dl>
</div>
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
    <!-- banner -->
	<div class="ck-slide">
		<ul class="ck-slide-wrapper">
			<c:if test="${bannerList != null && bannerList != '' }">
				<c:forEach var="bn" items="${bannerList }">
					<c:if test="${bn.bannerLink == 1 }">
					<li>
					<a href="pc/depth/detail/${bn.bannerLinkSpecific }"><img src="${bn.picUrl }" alt="" style="width: 1440px; height: 670px;"></a>
					</li>
					</c:if>
					
					<c:if test="${bn.bannerLink == 6 || bn.bannerLink == 7 || bn.bannerLink == 8 }">
					<li>
					<a href="pc/travels/detial/0_${bn.bannerLinkSpecific }"><img src="${bn.picUrl }" alt="" style="width: 1440px; height: 670px;"></a>
					</li>
					</c:if>
					
					<c:if test="${bn.bannerLink == 9 }">
					<li>
					<a href="allowAccess/advert?id=${bn.bannerLinkSpecific }"><img src="${bn.picUrl }" alt="" style="width: 1440px; height: 670px;"></a>
					</li>
					</c:if>
				</c:forEach>
			</c:if>
			<c:if test="${bannerList == null || bannerList == '' }">
				<li>
				<a ><img src="static/web/img/banner1.jpg" alt="" style="width: 1440px; height: 670px;"></a>
				</li>
			</c:if>
		</ul>
		<a href="javascript:;" class="ctrl-slide iicon ck-prev">上一张</a> <a href="javascript:;" class="ctrl-slide ck-next iicon">下一张</a>
		<div class="ck-slidebox">
			<div class="slideWrap">
				<ul class="dot-wrap">
					<c:if test="${bannerList == null || bannerList == '' }">
						<li><em>1</em></li>
					</c:if>
					<c:if test="${bannerList != null && bannerList != '' }">
					<c:forEach varStatus="st" items="${bannerListCount }">
						<c:if test="${st.index == 0}"><li class="current"><em>${st.index + 1 }</em></li></c:if>
						<c:if test="${st.index != 0 }">
							<li><em>${st.index + 1 }</em></li>
						</c:if>
					</c:forEach>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
	<!-- page content -->
	<div class="cantainer_wrap pb90">
		<div class="content">
			<div class="whitebg centre">
			  <div class="classify">
			    <ul class="clearfix">
				  <li>
				    <img src="static/web/img/classify_1.jpg"/>
					<p><i class="icon i-strat"></i><a href="pc/travels/masterIndex">达人攻略</a></p>
				  </li>
				  <li>
				    <img src="static/web/img/classify_2.jpg"/>
					<p><i class="icon i-wonderful"></i><a href="pc/travels/travel">精彩游记</a></p>
				  </li>
				  <li>
				    <img src="static/web/img/classify_3.jpg"/>
					<p><i class="icon i-playmate"></i><a href="pc/interact/frendEnlist">玩伴招募</a></p>
				  </li>
				  <li>
				    <img src="static/web/img/classify_4.jpg"/>
					<p><i class="icon i-travel"></i><a href="pc/question/index">旅行问答</a></p>
				  </li>
				  <li>
				    <img src="static/web/img/classify_5.jpg"/>
					<p><i class="icon i-roast"></i><a href="pc/complaint/index">吐槽专区</a></p>
				  </li>
				</ul>
			  </div>
			  <div class="section section4">
			    <h3 class="sec_title"><i class="iicon i-sec4"></i>活跃用户<br /><span>Active user</span></h3>
				<div class="lively">
				  <span class="abs icon Left" onclick="findActiveList(2);"></span>
				  <span class="abs icon Right" onclick="findActiveList(1);"></span>
				  <div class="activeUserDiv">
				  <c:forEach items="${userList }" var="user" varStatus="index">
				  <dl class="postion stop${index.index+1 }">
				    <dd><a href="javascript:;" onclick="goUser(this)" _id="${user.id}"><img src="${user.head_img }"/></a></dd>
				    <dt><a href="javascript:;" onclick="goUser(this)" _id="${user.id}"><p class="nickname">${user.nickname }</p></a><p class="f12"><i class="icon i-post"></i>发帖 <span class="orange">${user.count }</span></p></dt>
				  </dl>
				  </c:forEach>
				  </div>
				</div>
			  </div>
			  <div class="section section5 clearfix">
			    <div class="seLeft fl">
				    <h3 class="sec_title"><i class="iicon i-sec5"></i>推荐与分享<br /><span>Popular and share</span></h3>
					<ul class="ul_refer">
					<c:forEach items="${travelsRecommendList }" var="travelsRecommend">
					  <li>
					    <span class="aImg abs"><img src="${travelsRecommend.head_img }"></span>
					    <a href="javascript:;" onclick="goTravels(this)" travelsId="${travelsRecommend.id }"><img src="${travelsRecommend.img_url }"/></a>
						<div class="recom_txt">
						  <a href="javascript:;" onclick="goTravels(this)" travelsId="${travelsRecommend.id }"><p class="r-title" style="height: 40px">${travelsRecommend.title }</p></a>
						  <p><span><i class="icon face"></i>${travelsRecommend.nickname }</span><span class="ml20"><i class="icon invit"></i>发帖<a href="javascript:;" onclick="goUser(this)" _id="${travelsRecommend.userId}"> ${travelsRecommend.count }</a></span></p>
						</div>
					  </li>
					</c:forEach>
					</ul>
				</div>
				<div class="seRight fr">
				  <h3 class="p-title">达人动态</h3>
				  <ul class="trends">
				  <c:forEach items="${masterList }" var="master">
					  <li>
						<dl><dt><a href="javascript:;" onclick="goUser(this)" _id="${master.userId}"><img src="${master.head_img }"/></a></dt>
							<dd><p>
							<a href="javascript:;" onclick="goUser(this)" _id="${master.userId}"><span class="orange">${master.nickname }</span></a> ${master.title }</p>
								<p class="tr"><i class="icon i-clock" ></i><span class="createTime" _value="${master.create_time.getTime() }">刚刚</span></p>
							</dd>
						</dl>
					  </li>
				  </c:forEach>
				  </ul>
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
<!-- 智易行弹出框 -->
<script id="autoPlanpopup" type="text/template">
<div class="innerdiv f12 pd20" style="margin:0 auto; width:500px;">
	<div class="fitemwrap">
						<span class="item-title">出发地</span>
						<div class="form-item select-item mr10" style="width:186px;">
							<span class="select-text">贵阳</span>
							<i class="iicon i-select"></i>
							<select name="" id="">
								<option value="">贵阳</option>
								<option value="">类型2</option>
							</select>
						</div>												
					</div>
					<div class="fitemwrap">
						<span class="item-title">目的地</span>
						<div class="form-item select-item mr10" style="width:186px;">
							<span class="select-text">贵阳</span>
							<i class="iicon i-select"></i>
							<select name="" id="">
								<option value="">贵阳</option>
								<option value="">类型2</option>
							</select>
						</div>												
					</div>
					<div class="fitemwrap">
						<span class="item-title">浏览日期</span>
						<div class="form-item inline" style="width:186px;">
							<i class="iicon i-date"></i>
							<input class="datetime form-control" readonly placeholder="请选择日期" />
						</div>													
					</div>
					<div class="fitemwrap">
						<span class="item-title">预算</span>
						<div class="form-item inline" style="width:186px;">
							<input type="text" placeholder="如有预算请输入" />
						</div>													
					</div>
					<div class="fitemwrap">
						<span class="item-title">住宿</span>
						<div class="form-item select-item mr10" style="width:186px;">
							<span class="select-text">系统推荐</span>
							<i class="iicon i-select"></i>
							<select name="" id="">
								<option value="">系统推荐</option>
								<option value="">类型2</option>
							</select>
						</div>												
					</div>
					<div class="fitemwrap">
						<span class="item-title">人数</span>
						<div class="form-item spc-time inline" style="width:186px;">
							<span>成人</span>
							<input type="text" placeholder="如有预算请输入" />
						</div>
						<div class="form-item spc-time inline" style="width:186px;">
							<span>儿童</span>
							<input type="text" placeholder="如有预算请输入" />
						</div>													
					</div>
					<div class="fitemwrap">
						<span class="item-title">房间数</span>
						<div class="form-item select-item mr10" style="width:186px;">
							<span class="select-text">1</span>
							<i class="iicon i-select"></i>
							<select name="" id="">
								<option value="">1</option>
								<option value="">2</option>
								<option value="">3</option>
								<option value="">4</option>
								<option value="">5</option>
								<option value="">6</option>
								<option value="">7</option>
								<option value="">8</option>
								<option value="">9</option>
								<option value="">10</option>
							</select>
						</div>												
					</div>
					<div class="fitemwrap" style="padding:30px 0 0 50px;">
						<span class="btn myhobbybtn mr20">我的偏好 <span class="f30 inline vt">+</span></span>
						<button name="case-ok" class="btn lorgbtn mr20">下一步</button>
						<button name="case-no" class="btn cancelbtn">取消</button>
					</div>
</div>
</script>

<!-- 我的偏好弹出框 -->
<script id="myhobbypopup" type="text/template">
<div class="innerdiv f12 pd20" style="margin:0 auto; width:540px;">
	<div class="hobbyitem">
		<span class="l-title">自然风光</span>
		<div class="r-content">
			<span class="line-wrap"><i class="iicon i-dot"></i><span class="line-value"></span></span>
		</div>
	</div>
	<div class="hobbyitem">
		<span class="l-title">民族风俗</span>
		<div class="r-content">
			<span class="line-wrap"><i class="iicon i-dot"></i><span class="line-value"></span></span>
		</div>
	</div>
	<div class="hobbyitem">
		<span class="l-title">古韵风情</span>
		<div class="r-content">
			<span class="line-wrap"><i class="iicon i-dot"></i><span class="line-value"></span></span>
		</div>
	</div>
	<div class="hobbyitem">
		<span class="l-title">红色文化</span>
		<div class="r-content">
			<span class="line-wrap"><i class="iicon i-dot"></i><span class="line-value"></span></span>
		</div>
	</div>
	<div class="hobbyitem">
		<span class="l-title">徒步探险</span>
		<div class="r-content">
			<span class="line-wrap"><i class="iicon i-dot"></i><span class="line-value"></span></span>
		</div>
	</div>
	<div class="hobbyitem">
		<span class="l-title">生态养生</span>
		<div class="r-content">
			<span class="line-wrap"><i class="iicon i-dot"></i><span class="line-value"></span></span>
		</div>
	</div>
	<div class="hobbyitem">
		<span class="l-title">休闲娱乐</span>
		<div class="r-content">
			<span class="line-wrap"><i class="iicon i-dot"></i><span class="line-value"></span></span>
		</div>
	</div>
	<div class="hobbyitem">
		<span class="l-title">必去景点</span>
		<div class="r-content">
			<ul class="recommend-list clearfix">
				<li><img src="img/super1.jpg" width="110" height="80" /><span class="title"></span><i class="iicon i-check"></i></li>
				<li><img src="img/super2.jpg" width="110" height="80" /><span class="title"></span><i class="iicon i-check"></i></li>
				<li><img src="img/super3.jpg" width="110" height="80" /><span class="title"></span><i class="iicon i-check"></i></li>
				<li><img src="img/super4.jpg" width="110" height="80" /><span class="title"></span><i class="iicon i-check"></i></li>
				<li><img src="img/super5.jpg" width="110" height="80" /><span class="title"></span><i class="iicon i-check"></i></li>
				<li><img src="img/super6.jpg" width="110" height="80" /><span class="title"></span><i class="iicon i-check"></i></li>
			</ul>
		</div>
	</div>
	<div class="hobbyitem tc">
		<button name="case-ok" class="btn lorgbtn mr20">上一步</button>
		<button name="case-no" class="btn cancelbtn">确定</button>
	</div>
</div>
</script>


<script type="text/javascript" src="static/web/js/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="static/web/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="static/web/js/slide.js"></script>
<script type="text/javascript" src="static/web/js/index.js"></script>
<script type="text/javascript" src="static/web/js/base.js"></script>
<script type="text/javascript">
$(function(){
	
	$('.ck-slide').ckSlide({
		autoPlay: true
	});
	
	$(".createTime").each(function(){
		var timeStamp=parseInt($(this).attr("_value"));
		$(this).html(getDistanceNow(timeStamp));
	});
	
});

var nowTimeStamp=new Date().getTime();//当前时间毫秒数
function getDistanceNow(timeStamp){
	var distance=nowTimeStamp-timeStamp;
	var min=1000*60;
	var hour=min*60;
	var day=hour*24;
	var _5day=day*5;
	if(distance>_5day){//超过5天
		return getTimeTxt(parseInt(timeStamp),10)
	}else if (distance>day){//超过一天
		return Math.floor(distance/day)+"天前";
	}else if(distance>hour){//超过一小时
		return Math.floor(distance/hour)+"小时前";
	}else if(distance>min){//超过1分钟
		return Math.floor(distance/min)+"分钟前";
	}else{//1分钟以内
		return "刚刚";
	}
}

var inx = 1;
var userParam = {"pageNo":inx};
function  findActiveList(op){
	if(op==1){
		userParam.pageNo += 1;
	}else{
		if(1>=userParam.pageNo){
			popMesTip("已经是第一页了");
			return ;
		}
		userParam.pageNo -= 1;
	}
	console.info(userParam.pageNo);
	$.post("<%=basePath%>pc/findActiveList",userParam,function(res){
		var itemUi ='<dl class="postion stop{cssInx}">'
				   +' <dd><a href="javascript:;" onclick="goUser({userId})"><img src="{headImg}"/></a></dd>'
				   +' <dt><a href="javascript:;" onclick="goUser({userId})"><p class="nickname">{userNickname}</p></a><p class="f12"><i class="icon i-post"></i>发帖 <span class="orange">{userCount}</span></p></dt>'
				   +'</dl>';
		if(res.message == 'success'){
			$(".activeUserDiv").html('');
			var list = res.data.userList;
			for(var i in list){
				var dl=$("#userModel").children().clone();
				dl.find("img").attr("src",list[i].head_img);
				dl.find(".nickname").html(list[i].nickname);
				dl.find(".count").html(list[i].count);
				dl.find("a").attr("_id",list[i].id);
				dl.find("a").bind("click",function(){
					goUser(this);
				});
				dl.addClass("stop"+(parseInt(i)+1));
				$(".activeUserDiv").append(dl);
			}
		}else{
			popMesTip("已经是最后一页了");
			userParam.pageNo -= 1;
			return ;
		}
	},"JSON");
}

function goTravels(obj){
	var id=$(obj).attr("travelsId");
	window.location.href="<%=basePath %>pc/travels/detial/0_"+id;
}

function goUser(obj){
	var id=$(obj).attr("_id");
	window.location.href="<%=basePath%>pc/user/home?id="+id;
}
</script>
</body>
</html>