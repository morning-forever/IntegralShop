<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transition al.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../../../../static/inc_web.jsp" %>
<html>
<head>
<base href="<%=basePath %>">
<title>会员互动-精彩游记主页</title>
<!-- 日期时间控件 -->
<link href="js/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
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
.maxlength{
	height: 22px;
	overflow: hidden;
}
</style>
</head>
<body>
<ul id="travelsModel" style="display: none;">
<li>
	<a href="javascript:;" onclick="travelsDetial(this)"><img src="static/web/img/bigimg.jpg" /></a>
	<div class="hotxt">
		<h3 class="orange">【丫头@Vietnam】 2015开年之旅</h3>
		<div class="newtxt">
			<span class="fr grey">11小时前</span>
			<img src="static/web/img/avatar2.jpg" />
			<span class="orange">娜丫头的邂逅</span>
			的游记被
			<span class="orange">杨长松</span>
			<span></span>
		</div>
		<p class="maxlength">在最青春的年华里，不去旅行，不去体验，不去谈一场恋爱，不去尝试没试过的生活......</p>
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
			<div class="whitebg mt30 clearfix">
			  <div class="Le-port">
			    <div class="port-list clearfix">
				  <span class="fl">目的地</span>
				  <ul class="port-title fl" id="addrUl">
				    <li class="active" val="">全部</li>
				    <c:forEach items="${cityList }" var="city" >
						<li val="${city.id }">${city.name }</li>
				    </c:forEach>
				  </ul>
				</div>
				<div class="sortwrap tabstor clearfix mb20">
					<a class="active" _val="1" href="javascript:;">最新</a>
					<a class="sort-res" _val="2" href="javascript:;">最热</a>
				</div>
				<ul class="hotnews clearfix">
				</ul>
				<div class="pagination">
				</div>		
			  </div>
			  <div class="Ri-recom">
			    <h3 class="p-title">游记精彩推荐</h3>
			    <ul class="strategy">
			    <c:forEach items="${travelsList }" var="travels">
				  <li>
				    <span class="num orange">1</span>
					<img src="${travels.img }" onclick="travelsDetial(this)" travelsId="${travels.id }"/>
					<div class="protxt">
					  <a href="javascript:;"><p onclick="travelsDetial(this)" travelsId="${travels.id }">${travels.title }</p></a>
					  <p>人气：<span class="orange">${travels.countReply }</span></p>
					</div>
				  </li>
			    </c:forEach>
				</ul>
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

<!-- 日期时间控件 -->
<script type="text/javascript" src="static/web/js/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="static/web/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="static/web/js/slide.js"></script>
<script type="text/javascript" src="static/web/js/index.js"></script>
<script type="text/javascript" src="static/web/js/base.js"></script>
<script type="text/javascript">
var pageNo=1;
var totalPage=0;
$(function(){
	
	$('.ck-slide').ckSlide({
		autoPlay: true
	});
	
	initTravels();
	var addrDiv=$("#addrUl");
	addrDiv.find("li").addClass("mouseCursor");
	addrDiv.find("li").bind("click",function(){
		$(this).toggleClass("active");
		if($(this).attr("val")!=''){
			addrDiv.find("li[val='']").removeClass("active");
		}else{
			addrDiv.find("li").removeClass("active");
			addrDiv.find("li[val='']").addClass("active");
		}
		if(addrDiv.find(".active").length==0){
			addrDiv.find("li[val='']").addClass("active");
		}
		initTravels();
	});
	
	$(".tabstor a").click(function(){
		$(".tabstor a").removeClass("active");
		$(this).addClass("active");
		initTravels();
	});
	
});

function initTravels(){
	var addrIds="";
	$("#addrUl .active").each(function(){
		addrIds+=$(this).attr("val");
		addrIds+=",";
	});
	var sort=$(".tabstor .active").attr("_val");
	$.post("<%=basePath %>pc/travels/travelsList",{pageNo:pageNo,showLine:10,addrIds:addrIds,sort:sort},function(data){
		if(data.status=='success'){
			var list=data.list;
			var ul=$(".hotnews")
			ul.empty();
			for(var i=0;i<list.length;i++){
				var li=$("#travelsModel").children().clone();
				li.find("img").attr("src",list[i].cover);
				li.find("a").attr("travelsId",list[i].id);
				li.find("img").attr("travelsId",list[i].id);
				li.find("h3").html(list[i].title);
				li.find(".newtxt img").attr("src",list[i].head_img);
				li.find(".newtxt span:eq(0)").html(getDistanceNow(list[i].create_time));
				li.find(".newtxt span:eq(1)").html(list[i].thisNickName);
				li.find(".newtxt span:eq(2)").html(list[i].nickName);
				var word=list[i].word;
				if(word!=null&&word.length>20){
					word=word.substring(0,20)+"...";
				}
				li.find(".hotxt p").html(list[i].word);
				if(list[i].dynamicUserId==null){
					li.find(".newtxt").hide();
				}else{
					if(list[i].type=="praise"){
						li.find(".newtxt span:eq(3)").html("点赞了");
					}else if(list[i].type=="reply"){
						li.find(".newtxt span:eq(3)").html("评论了");
					}
				}
				ul.append(li);
			}
			totalPage=data.totalPage;
			initPage();
		}
	});
}

function travelsDetial(obj){
	var id=$(obj).attr("travelsId");
	window.location.href="<%=basePath %>pc/travels/detial/1_"+id;
}

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

function gotoPage(goNo){
	pageNo=parseInt(goNo);
	initTravels();
}

function goPage(){
	pageNo=parseInt($("#gotopage").val());
	if(parseInt($("#gotopage").val())>totalPage){
		$("#gotopage").val(totalPage);
		valTips("gotopage", "输入页数大于当前最大页数");
	}else{
		initTravels();
	}
}

function initPage(){
	var pageDiv=$(".pagination");
	pageDiv.html("");
	if(pageNo<=1){
		pageDiv.append('<a class="disabled" href="javascript:;">上一页</a>');
	}else{
		pageDiv.append('<a href="javascript:;" onclick="gotoPage('+(pageNo-1)+')">上一页</a>');
	}
	if(pageNo>3){
		pageDiv.append('<a href="javascript:;" onclick="gotoPage(1)">1</a>');
		pageDiv.append('<span class="p_text">...</span>');
	}
	for(var i=-2;i<3;i++){
		var thisNo=pageNo+i;
		if(thisNo>0&&thisNo<=totalPage){
			if(i==0){
				pageDiv.append('<a href="javascript:;" class="current" onclick="gotoPage('+thisNo+')">'+thisNo+'</a>');			
			}else{
				pageDiv.append('<a href="javascript:;" onclick="gotoPage('+thisNo+')">'+thisNo+'</a>');
			}
		}
	}
	if((totalPage-pageNo)>2){
		pageDiv.append('<span class="p_text">...</span>');
		pageDiv.append('<a href="javascript:;" onclick="gotoPage('+totalPage+')">'+totalPage+'</a>');
	}
	if(pageNo>=totalPage){
		pageDiv.append('<a class="disabled" href="javascript:;">下一页</a>');
	}else{
		pageDiv.append('<a href="javascript:;" onclick="gotoPage('+(pageNo+1)+')">下一页</a>');
	}
	pageDiv.append('<input id="gotopage" class="gotopage" type="text" value="'+pageNo+'" /> 页');
	pageDiv.append('<input onclick="goPage()" type="button" value="确定" class="mouseCursor"/>');
}
</script>
</body>
</html>