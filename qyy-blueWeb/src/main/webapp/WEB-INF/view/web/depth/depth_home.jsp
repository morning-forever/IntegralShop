<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transition al.dtd"><%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../../static/inc_web.jsp" %>
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv = "X-UA-Compatible" content = "IE=edge,chrome=1 " /><meta charset="utf-8"> 
<title>主题深度游</title>
<!-- 日期时间控件 -->
<link href="static/web/js/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link href="static/web/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
<link rel="stylesheet" href="static/web/css/common.css" />
<link rel="stylesheet" href="static/web/css/inner.style.css" />
<link rel="stylesheet" href="static/web/css/topic.deeptravel.css" />
<link rel="stylesheet" href="static/web/css/quick.travel.css" />
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
				<li class="active"><a href="pc/depth/home">主题深度游</a></li>
				<li>
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
					
					<c:if test="${bn.bannerLink == 6 }">
					<li>
					<a href="pc/travels/detial/0_${bn.bannerLinkSpecific }"><img src="${bn.picUrl }" alt="" style="width: 1440px; height: 670px;"></a>
					</li>
					</c:if>
					
					<c:if test="${bn.bannerLink == 7 }">
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
	<div class="content_wrap pb90" style="background:#fff;">
		<div class="content pt20">
			<div class="clearfix topictravel">
				<div class="l-part pt20">
					<h3 class="sec_title ml20"><i class="iicon i-recommend"></i>热门推荐<br /><span>Popular recommendation</span></h3>
					<div class="listwrap type2">
						<ul class="list_ul clearfix">
							<c:forEach items="${recommendList }" var="recommend">
							<li>
								<a href="pc/depth/detail/${recommend.id }"><img src="${recommend.picUrl }" height="169" width="228" alt=""></a>
								<div class="incont">
									<h4><a href="">${recommend.name }</a></h4>
									<div class="price"><span class="f14">￥</span><span class="bold">${recommend.adult_price }</span><span class="salenum">已售：${recommend.sale_num }</span></div>
									<div class="star-level"><span class="mr10">推荐指数：</span><span class="star_wrap iicon"><span class="star_value iicon" style="width:${recommend.expon*20}%;"></span></span></div>						
								</div>							
							</li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<div class="r-part">
					<h4 class="f16 silverygrey tc">主题深度旅游排行榜</h4>
					<ul class="topiclist">
						<c:forEach items="${depthList }" var="depth" varStatus="status" begin="0" end="6">
						<li>
							<span class="numid green">${status.count }</span>
							<a href="pc/depth/detail/${depth.id }"><img src="${depth.picUrl }" height="51" width="51" alt="" class="fl"></a>
							<h5>${depth.name }</h5>
							<p>¥ ${depth.adult_price }&nbsp;<span> 起</span></p>
						</li>
						</c:forEach>
					</ul>
				</div>
			</div>	
			
			<!-- 分类筛选条件 -->
			<div class="ctgallwrap mb20">
				<div class="ctgallwrap ctgtype2">
				<div class="ctgselect_wrap">
					<span class="ctgname">目的地</span>
					<div class="value_wrap" id="city">
					<a href="javascript:;" class="ctgvalue labs active" val="">全部</a>
					<c:forEach items="${cityList }" var="city">
						<a href="javascript:;" class="ctgvalue" val="${city.id }">${city.city }</a>
					</c:forEach>
					</div>
				</div>
				<div class="ctgselect_wrap ">
					<span class="ctgname">方位</span>
					<div class="value_wrap" id="azimuth">
					<a href="javascript:;" class="ctgvalue labs active" val="">全部</a>
					<c:forEach items="${azimuthList }" var="azimuth">
						<a href="javascript:;" class="ctgvalue" val="${azimuth.id }">${azimuth.azimuth }</a>
					</c:forEach>
					</div>
				</div>
				<div class="ctgselect_wrap">
					<span class="ctgname">主题</span>
					<div class="value_wrap" id="subject">
					<a href="javascript:;" class="ctgvalue labs active" val="">全部</a>
					<c:forEach items="${subjectList }" var="subject">
						<a href="javascript:;" class="ctgvalue" val="${subject.id }">${subject.subject }</a>
					</c:forEach>
					</div>
				</div>
				<div class="ctgselect_wrap">
					<span class="ctgname">价格</span>
					<div class="value_wrap" id="price">
					<a href="javascript:;" class="ctgvalue labs active" val="">全部</a>
					<c:forEach items="${priceList }" var="price">
						<a href="javascript:;" class="ctgvalue" val="${price.id }"
						 valStart="${price.priceStart }" valEnd="${price.priceEnd }">${price.depict }</a>
					</c:forEach>
					</div>
				</div>
				<div class="ctgselect_wrap">
					<span class="ctgname">天数</span>
					<div class="value_wrap" id="day">
					<a href="javascript:;" class="ctgvalue labs active" val="">全部</a>
					<c:forEach items="${dayList }" var="day">
						<a href="javascript:;" class="ctgvalue" val="${day.days }">${day.days }天</a>
					</c:forEach>
					</div>				
				</div>
				</div>
			</div>
			
			<!-- 排序 -->
			<div class="sortwrap clearfix">
				<a class="active" href="javascript:;">默认</a>
				<a class="sort-des" href="javascript:;" orderBy="hot">热门<i class="iicon"></i></a>
				<a class="sort-des" href="javascript:;" orderBy="evaluate">好评<i class="iicon"></i></a>
				<a class="sort-des" href="javascript:;" orderBy="time">最新<i class="iicon"></i></a>
				<a class="sort-des" href="javascript:;" orderBy="sale">销量<i class="iicon"></i></a>
				<a class="sort-res" href="javascript:;" id="orderPrice" orderBy="priceUp">价格<i class="iicon"></i></a>
			</div>

			<!-- 模板 -->
			<ul>
				<li class="liModel">
					<a href=""><img src="static/web/img/topic1.jpg" height="169" width="228" alt=""></a>
					<div class="incont">
						<h4><a href="">夏威夷岛五日游</a></h4>
						<div class="price"><span class="f14">￥</span><span class="bold">9980</span><span class="salenum">已售：561</span></div>
						<div class="star-level"><span class="mr10">推荐指数：</span><span class="star_wrap iicon"><span class="star_value iicon" style="width:80%;"></span></span></div>							
					</div>							
				</li>
			</ul>
			<!-- 加载列表 -->
			<div class="listwrap">
				<ul id="depthUl" class="list_ul clearfix">
				</ul>
			</div>
			
			<!-- 分页  -->
			<div class="pagination">
			</div>

		</div>		
	</div>

	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
</div>

<!-- 日期时间控件 -->
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
	$('.datetime').datetimepicker({
		autoclose:1,
		format:"yyyy-mm-dd",
		minView: 2,
		todayBtn: true
	});
	selfDefineFormBtn();
	
	$(".liModel").hide();
	
	clickFn();//初始化按钮点击事件
	doSearch();//查询
});

var totalPage=0;//总页数
var pageNo=1;//当前页	

//查询
function doSearch(){
	var cityIds = "";
	var subjectIds = "";
	var azimuthIds = "";
	$("#city .active").each(function(){
		cityIds += $(this).attr("val")+",";
	});
	$("#subject .active").each(function(){
		subjectIds += $(this).attr("val")+",";
	});
	$("#azimuth .active").each(function(){
		azimuthIds += $(this).attr("val")+",";
	});
	var json = {
			'cityIds' : cityIds.substr(0,cityIds.length-1),
			'subjectIds' : subjectIds.substr(0,subjectIds.length-1),
			'azimuthIds' : azimuthIds.substr(0,azimuthIds.length-1),
			'days' : $("#day .active").attr("val"),
			'priceStart' : $("#price .active").attr("valStart"),
			'priceEnd' : $("#price .active").attr("valEnd"),
			'orderBy' : $(".sortwrap .active").attr("orderBy"),
			'pageNo': pageNo
		};
	$.post("<%=basePath %>pc/depth/list",json,function(res){
		$("#depthUl").empty();
		if(res.status == 'success'){
			var list = res.list;
			for(var i=0;i<list.length;i++){
				$("#depthUl").append($(".liModel").clone());
				$(".liModel:last img").attr("src",list[i].picUrl);//图片
				$(".liModel:last h4 a").text(list[i].name);//主题深度游名称
				$(".liModel:last .price .bold").text(list[i].adult_price);//价格
				$(".liModel:last .price .salenum").text("已售："+list[i].sale_num);//销售量
				$(".liModel:last .star-level .star_value").css("width",list[i].expon*20+"%");//推荐指数
				//详情
				$(".liModel:last a").attr("href","<%=basePath %>pc/depth/detail/"+list[i].id);
				$(".liModel:last").show();
				$(".liModel:last").removeClass("liModel");
			}
		}
		totalPage = res.totalPage;
		pageNo = res.pageNo;
		initPage();
	});
}

//初始化选择框点击事件
function clickFn() {
	//默认和价格排序
	$(".sortwrap a").bind("click",function(){
		if($(this).hasClass("active")){
			if(this.id == 'orderPrice'){
				if($(this).hasClass("sort-des")){
					$(this).removeClass("sort-des");
					$(this).addClass("sort-res");
					$(this).attr("orderBy","priceUp");//升序
				}else if($(this).hasClass("sort-res")){
					$(this).removeClass("sort-res");
					$(this).addClass("sort-des");
					$(this).attr("orderBy","priceDown");//降序
				}
			}
		}else{
			$(".sortwrap a").removeClass("active");
			$(this).addClass("active");
		}
		doSearch();
	});
	singleChoice("day");//天数
	singleChoice("price");//价格
	multiChoice("azimuth");//方位
	multiChoice("subject");//主题
	multiChoice("city");//目的地
}

//单选
function singleChoice(obj){
	$("#"+obj+" a").bind("click", function() {
		$("#"+obj+" a").removeClass("active");
		$(this).addClass("active");
		doSearch();
	});
}

//多选
function multiChoice(obj){
	$("#"+obj+" a").bind("click", function() {
		$(this).toggleClass("active");
		if ($(this).attr("val") != '') {
			$("#"+obj+" a[val='']").removeClass("active");
		} else {
			$("#"+obj+" a").removeClass("active");
			$("#"+obj+" a[val='']").addClass("active");
		}
		if ($("#"+obj+" .active").length == 0) {
			$("#"+obj+" a[val='']").addClass("active");
		}
		doSearch();
	});
}

function gotoPage(goNo){
	pageNo = goNo;
	doSearch();
}

function goPage(){
	pageNo = $("#gotopage").val();
	if(parseInt(pageNo)>totalPage){
		$("#gotopage").val(totalPage);
		valTips("gotopage", "输入页数大于当前最大页数");
	}else{
		doSearch();
	}
}

function initPage(){
	$(".pagination").empty();
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
	$(".pagination").append('<input id="gotopage" class="gotopage" type="text" value="'+pageNo+'" /> 页');
	$(".pagination").append('<input onclick="goPage()" type="button" value="确定" />');
}
</script>
</body>
</html>