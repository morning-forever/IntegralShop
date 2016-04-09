<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transition al.dtd"><%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../../static/inc_web.jsp" %>
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv = "X-UA-Compatible" content = "IE=edge,chrome=1 " /><meta charset="utf-8"> 
<title>${depth.name }</title>
<!-- 日期时间控件 -->
<link href="static/web/js/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link href="static/web/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
<!-- Add fancyBox main JS and CSS files -->
<link rel="stylesheet" href="static/web/js/source/jquery.fancybox.css" type="text/css"  media="screen" />
<link rel="stylesheet" href='static/web/js/fullcalendar/fullcalendar.css' type="text/css" />
<link rel="stylesheet" href="static/web/css/common.css" />
<link rel="stylesheet" href="static/web/css/inner.style.css" />
<link rel="stylesheet" href="static/web/css/topic.deeptravel.css" />
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
	<div class="banner_wrapper rel ck-slide">	
		<img src="${depth.coverUrl }" style="width: 1440px;height: 670px;"/>
		<div class="content abs">
			<div class="swipe-part" style="display: none;">
				<span class="incont">
					<span class="purple rel inline" style="top:-15px; font-size:30px;">超级</span><br />
					<span class="purple inline pb15 mb20" style="font-size:40px;">自由行</span><br />
					<i class="iicon i-freetravel"></i>
				</span>
			</div>
			<div class="star-level abs"><span class="mr10">推荐指数</span><span class="star_wrap iicon"><span class="star_value iicon" style="width:${depth.expon*20}%;"></span></span></div>
			<div class="relinfo">
			<c:forEach items="${labelArr }" var="label">
				<span>${label }</span>
			</c:forEach>
			</div>
		</div>						
	</div>

	<!-- page content -->
	<input type="hidden" id="depthId" value="${depth.id }">
	<div class="content_wrap pb90" id="contentDiv">
		<div class="content rel pt20">	
			<div class="toppart">
				<span class="inline vm pl20"><span class="lorange">￥<span class="f24 bold" id="adultPrice">${depth.adult_price }</span></span><span class="ml10">元/成人</span></span>
				<span class="inline vm ml20"><span class="lorange">￥<span class="f24 bold" id="childPrice">${depth.child_price }</span></span><span class="ml10">元/儿童</span></span>
				<span style="margin-left:50px;" name="pricequery" class="btn lorgbtn">价格查询</span><span name="costcontain" class="btn cancelbtn ml20">价格包含</span>
				<span class="pointer ml20" name="viewjudge"><i class="iicon i-comment"></i>&nbsp;评论(${depth.evaluateNum })</span>
				<span class="pointer ml20" onclick="doCollect(this)" val="0"><i class="iicon i-fav"></i>&nbsp;收藏(${depth.collectNum })</span>
			</div>
			<!-- 详细行程 -->
			<div class="content-box whitebg">
				<h3 class="sec_title"><i class="iicon i-travelplan"></i>详细行程<br /><span>Detailed itinerary</span></h3>
				<div class="travelplan rel" style="margin-bottom:40px;">
					<span name="plandetail" class="pointer btn alphabtn abs">详细行程&gt;&gt;</span>
					<img src="${depth.tripUrl }" height="455" width="940" alt="">
				</div>

				<!-- 精彩亮点 -->
				<h3 class="sec_title"><i class="iicon i-colorfulpoint"></i>精彩亮点<br /><span>Highlight</span></h3>
				<div class="hasmoreitems borderb1 rel" style="margin-bottom:60px;">					
					<div class="listwrap">
						<ul class="list_ul clearfix type3">
							<c:forEach items="${pointList }" var="point">
								<li>
									<img id="${point.id }" name="viewdetail" src="${point.picUrl }" height="192" width="296" alt="">
									<h5>${point.scenic_name }</h5>
									<p>${point.point_name }</p>
								</li>
							</c:forEach>
						</ul>						
					</div>
					<c:if test="${pointList.size() > 3 }">
					<span id="showMore" class="expandall">展开更多</span>
					<span id="showLess" class="expandall">收起</span>
					</c:if>
				</div>

				<!-- 预定须知 -->
				<h3 class="sec_title"><i class="iicon i-ordernote"></i>预定须知<br /><span>Reservation information</span></h3>
				<div class="pl20 pr20 text-box">
					${provision }
				</div>
			</div>

			<!-- 右侧工具栏 -->
			<div class="rsidebox fixbox">
				<div class="fitemwrap">
					<span class="item-title">出发日期</span>
					<div class="form-item inline" style="width:130px;">
						<i class="iicon i-date"></i>
						<input id="startTime" class="datetime form-control" readonly type="text" />
					</div>						
				</div>
				<div class="fitemwrap">
					<span class="item-title">出发城市</span>
					<div class="form-item select-item mr10" style="width:130px;">
						<span class="select-text">贵州</span>
						<i class="iicon i-select"></i>
						<select name="" id="citySelect">
							<c:forEach items="${cityList }" var="city">
								<c:if test="${city.city == '贵阳市' }">
								<option value="${city.id }">${city.city }</option>
								</c:if>
							</c:forEach>
						</select>
					</div>	
				</div>
				<div class="fitemwrap">
					<span class="item-title">成人</span>
					<!-- <span class="item-title">成人</span>
					<div class="form-item select-item mr10" style="width:130px;">
						<span class="select-text">2</span>
						<i class="iicon i-select"></i>
						<select name="" id="adultSelect" onchange="getSumPrice()">
						</select>
					</div>	 -->
						<span class="pronum_unit" style="margin-right:40px;">
							<button class="des_btn disabled">-</button><input maxlength="2" type="text" id="adultSelect" value="2" onkeyup="getSumPrice()"/><button class="res_btn">+</button>
						</span>
				</div>
				<div class="fitemwrap">
					<span class="item-title">儿童</span>
					<!-- <div class="form-item select-item mr10" style="width:130px;">
						<span class="select-text">0</span>
						<i class="iicon i-select"></i>
						<select name="" id="childSelect" onchange="getSumPrice()">
						</select>
					</div>	 -->
					<span class="pronum_unit" style="margin-right:40px;">
						<button class="des_btn disabled">-</button><input maxlength="2" type="text" id="childSelect" value="0" onkeyup="getSumPrice()"/><button class="res_btn">+</button>
					</span>
				</div>
				<div class="pl10 pt10 pb10">合计<span class="lorange ml10">￥<span id="sumPrice" class="f24 bold">21467.00</span></span></div>
				<div class="tc pt10">
					<button onclick="toOrder()" class="btn lorgbtn">一键预订</button>
				</div>	
			</div>
		</div>		
	</div>

	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
</div>

<!-- 价格包含弹出框 -->
<div id="costcontainpopup" style="display: none;">
<div class="innerdiv pd20">
	<div class="box-section">
		<span class="l-part">
			<i class="iicon i-fly mr20"></i><span class="f24 silverygrey inline vm">交通</span>
		</span>
		<div class="r-part">
			<span class="inline vm">出发口岸城市<br />檀香山</span>
			<i class="iicon i-arrow ml10 mr10"></i>
			<span class="inline vm">檀香山往返含税机票<br />卡护卢往返含税机票 </span>
		</div>
	</div>
	<div class="box-section">
		<span class="l-part">
			<i class="iicon i-hotel mr20"></i><span class="f24 silverygrey inline vm">酒店</span>
		</span>
		<div class="r-part">
			<p><span class="lorange w100">DAY 1-2</span>茂宜岛  Aston  Maui Hill Hotel</p>
			<p><span class="lorange w100">DAY 1-2</span>喔胡岛  Aston    Bamboo  Maui Hill Hotel   (含税)</p>
			<p class="f12 grey9">＊考虑到行程安排、酒店房型库存等原因,实际预定时可能会选用其他同级别精品酒店</p>
		</div>
	</div>
	<div class="box-section">
		<span class="l-part">
			<i class="iicon i-p mr20"></i><span class="f24 silverygrey inline vm">观光</span>
		</span>
		<div class="r-part">
			<p>喔胡岛亚特兰蒂斯潜水艇门票<span class="grey9">（11:00 am ，普通人）</span></p>
			<p>夏威夷喔胡岛日落晚餐巡航－豪华晚宴<span class="grey9">（普通座位，成人）</span></p>
		</div>
	</div>	
</div>
</div>

<!-- 查看精彩亮点详情 -->
<div id="viewdetailpopup" style="display: none;">
<div class="innerdiv viewdetail" style="padding:40px;">
	<p class="grey">建议时长：4小时</p>
	<p class="grey">地点：哈纳360公路  hanadghknd </p>
	<p class="grey">地址：2485  hanadghknd，hahf 夏威夷  9485 美国 </p>
	<p><span class="grey mr20 fl">概述</span><span class="f12 inline" style="width:600px;">哈纳公路贯穿茂宜岛北部海岸，被视为世界上风景最为优美的公路之一，全长约84公里，共有大约600个弯道，经过54座桥梁，蜿蜒曲折的路面狭窄，路边景色优美，每一处弯道都能看到壮阔的海景、黑沙的海滩、奔流的瀑布，还有延绵数里的落叶乔木。沿途还有很多地方可供游客照相取景和徒步取道。大约2小时便能开遍全程，但你必然会忍不住一路走走停停欣赏风景。</span></p>
	<img style="margin-bottom:20px;" width="100%" src="static/web/img/pic1.jpg" />
	<p>＊小贴士（旅行信息变化较快，以下内容<span style="color:red;">仅供参考！</span>)</p>
	<h4>注意事项</h4>
	<p class="f12 attention">1. 道路虽然有些路段比较湿滑，但全程坡度不大，家用车型都可以自驾<br />
2. 沿路有些地方道路狭窄，没有明确的分隔线，需要错车，弯路一定要减速慢行。<br />
3. 这条路的弯道没完没了，容易晕车的朋友，应该做好预防措施。</p>
	<h4>交通情况</h4>
	<p class="f12 traffic">提供指定酒店的接送服务</p>
	<h4>特色推荐</h4>
	<p class="f12 feature">电影爱好者们可以在伊甸园或植物园里停下，去看看《侏罗纪公园》的拍摄地。</p>
	<h4>其它</h4>
	<p class="f12 other1">1. 茂宜岛的哈纳之路，被称为世界上最美丽的五十条自驾公路之一，因此到茂宜岛必须要租车。很多人会选择租一辆敞篷的野马，这样在阳光明媚的时候在海边开着敞篷跑车的感觉真是爽爆了！</p>
	<p class="f12 other2" style="display: none;">2. 哈纳公路(Hana Highway)是知名的沿海风景线，全长约50英里，但因其道路崎岖狭窄，限速很低，一路海景、瀑布、雨林和鲜花尽收眼底，去时下雨，天空和海水颜色十分灰暗，瀑布水流虽异常丰盈，但略显土黄色，个人感觉风景一般，回程时渐渐放晴，景色美多了。</p>
	<p class="f12 other3" style="display: none;">3. 哈纳公路(Hana Highway)是知名的沿海风景线，全长约50英里，但因其道路崎岖狭窄，限速很低，一路海景、瀑布、雨林和鲜花尽收眼底，去时下雨，天空和海水颜色十分灰暗，瀑布水流虽异常丰盈，但略显土黄色，个人感觉风景一般，回程时渐渐放晴，景色美多了。</p>
</div>
</div>

<!-- 查看评价 -->
<div id="viewjudgepopup" style="display: none;">
<div class="innerdiv">	
	<div class="total_judge">
		<span class="f16 grey mr20">好评率</span>
		<span class="orange2" style="margin-right:120px;"><span style="font-size:33px;">100</span>％</span>
		<span class="heart_wrap iicon mr10"><span class="heart_value iicon" style="width:80%;"></span></span>
		<span class="f16 grey">4.0 分</span>
	</div>
	<div id="judge" class="single_judge">
		<div class="l-part tc">
			<img src="static/web/img/avatar2.jpg" height="54" width="54" alt="">
			<span class="lorange f12">普通会员</span>
			<span><i class="iicon i-level1"></i><i class="iicon i-level1"></i><i class="iicon i-level1"></i><i class="iicon i-level1"></i><i class="iicon i-level1"></i></span>
		</div>
		<div class="r-part">
			<div class="rel mb20 pb20">
				<span class="dark mr20">Ssinz</span><span class="heart_wrap iicon mr10"><span class="heart_value iicon" style="width:80%;"></span></span>
				<span class="f16 grey">4.0 分</span>
				<span class="r-abs"><i class="iicon i-time"></i>2015-6-1    21:30</span>
			</div>
			<p class="f16 grey">很好玩，很不错 下次还会来的啦｀｀｀｀</p>
		</div>
		<div class="judge-img">
			<a class="fancybox" href="static/web/img/popupimg.jpg"><img src="static/web/img/judge1.jpg" height="107" width="168" alt=""></a>
			<a class="fancybox" href="static/web/img/popupimg.jpg"><img src="static/web/img/judge2.jpg" height="107" width="168" alt=""></a>
			<a class="fancybox" href="static/web/img/popupimg.jpg"><img src="static/web/img/judge3.jpg" height="107" width="168" alt=""></a>
		</div>						
	</div>
	<div class="single_judge_wrap">
		
	</div>		
	<div class="pagination"></div>		
</div>
</div>

<!-- 详细行程 -->
<div id="plandetailpopup" style="display: none;">
<div class="innerdiv plandetail">
	<ul class="steptag_list">
		<li class="active">启程</li>
		<li>第1天</li>
		<li>第2天</li>
		<li>第3天</li>
		<li>第4天</li>
		<li>第5天</li>
		<li>第6天</li>
		<li>第7天</li>
		<li>第8天</li>
		<li>第9天</li>
		<li>第10天</li>
		<li>返程</li>
	</ul>
	<div id="stepDiv">
	<div id="addr" class="step">
		<div class="l-part"><span class="roundspan">启程</span></div>			
		<div class="r-part">出发口岸城市－檀香山</div>
	</div>
	<div id="traffic" class="step-cont">
		<div class="l-part"><i class="iicon i-fly"></i></div>
		<div class="r-part">
			<i class="iicon i-arrow"></i>
			<span class="inline fr"><i class="iicon i-time"></i>1小时</span>
			<p>飞机</p>
		</div>
	</div>
	<div id="imgs" class="step-cont">
		<div class="l-part"><i class="iicon i-hotel"></i></div>
		<div class="r-part hasimg">
			<i class="iicon i-arrow"></i>
			<img src="static/web/img/pic3.jpg" />
			<h5>威尼斯酒店出发</h5>
			<p class="f12"><span class="fr"><i class="iicon i-time-s"></i>20小时</span>此图片仅供参考</p>
		</div>
	</div>
	<div id="endstep" class="step endstep">
		<div class="l-part"><span class="endspan">旅行结束</span></div>
	</div>
	</div>
	<div class="r-content">
		
	</div>
</div>
</div>

<!-- 价格查询 -->
<script id="pricequerypopup" type="text/template">
<div class="innerdiv pricequery pb10">
	<div id="calendar"></div>
	<div class="clearfix pl20 pr20"><span class="fr f12 red">*价格为双人出行的每人基础均价，若您选择升级产品。实际价格与此价格会存在差价</span><span class="statespan state1 mr10">缺</span>此日期缺少商品<span class="statespan state2 mr10 ml20">惠</span>此日期为优惠商品</div>
</div>
</script>

<script type="text/javascript" src="static/web/js/source/jquery.fancybox.js"></script>
<!-- 日期时间控件 -->
<script type="text/javascript" src="static/web/js/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="static/web/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="static/web/js/index.js"></script>
<script type="text/javascript" src="static/web/js/base.js"></script>
<!-- 日历控件 -->
<script src='static/web/js/fullcalendar/moment.min.js'></script>
<script src='static/web/js/fullcalendar/fullcalendar.min.js'></script>
<script type="text/javascript">

var pricequeryDlg = null;//定义价格查询对话框

$(function(){
	var startPos = $(".content_wrap").find(".content:first").offset().top;
	
	var winW = $(window).width();
	var winH = $(window).height()/10;
	//winH = winH - 20;
	var boxH = $(".fixbox").outerHeight();
	//$(".fixbox").css("top",winH/2 - boxH/2);
	$(".fixbox").css("top",0);
	$(window).scroll(function(){
		var _top = $(document).scrollTop();		
		if( _top >= startPos ){
			$(".fixbox").css({position: "fixed"});
			if(winW < 1440){
				$(".fixbox").addClass("smallscreen");
			}
		} else {
			$(".fixbox").css({position: "absolute"});
			if(winW < 1440){
				$(".fixbox").removeClass("smallscreen");
			}
		}
	});
	
	
	
	//初始化只显示三个
	if($(".list_ul li").length >= 3){
		$(".list_ul li").hide();
		for(var i=0; i < 3; i++){
			$(".list_ul li:eq("+i+")").show();
		}
		$("#showLess").hide();
	}
	
	//展开更多
	$("#showMore").click(function() {
		$(".list_ul li").show();
		$(this).hide();
		$("#showLess").show();
	});
	//收起
	$("#showLess").click(function() {
		$(".list_ul li").hide();
		for(var i=0; i < 3; i++){
			$(".list_ul li:eq("+i+")").show();
		}
		$(this).hide();
		$("#showMore").show();
	});
	
	var depthId = "${depth.id}";//深度游id
	
	//下拉框事件
	selfDefineFormBtn();
	$(".select-item #citySelect").change();//初始化出发城市框
	
	//initPersonNum();//初始化成人儿童下拉框
	$("#adultSelect").val(2);
	$("#childSelect").val(0);
	getSumPrice();//初始化总价格
	
	InitPronum();
	
	$(".res_btn").click();
	$(".des_btn").click();
	
	//初始化隐藏行程div
	$("#stepDiv").hide();
	
	//初始化隐藏评价div
	$("#judge").hide();
	
	//初始化出发日期
	var secondDay = new Date();
	secondDay.setTime(new Date().getTime()+24*60*60*1000);
	if($("#startTime").val() == ""){
		$("#startTime").val(secondDay.format("yyyy-MM-dd"));
	}
	
	//点击出发日期，弹出日期价格弹出框
	$("#startTime").click(function(){
		showPriceQuery();
	});
	
	//价格包含
	$("[name=costcontain]").click(function(){
		showPricesContain(depthId);
	});
	
	//精彩亮点对话框
	$("[name=viewdetail]").click(function(){
		showPointDetail(this.id);
	});
	
	//查看评价
	$("[name=viewjudge]").click(function(){
		//第二个参数为是否显示对话框，只有查看评价时显示对话框，分页时不显示
		showEvaluate(depthId,true);
	});

	//详细行程
	$("[name=plandetail]").click(function(){
		showTrip(depthId);
	});	
	
	//初始化价格查询
	initDatePrice(depthId);
	
	//价格查询
	$("[name=pricequery]").click(function(){
		showPriceQuery();
	});
	
	//初始化是否收藏
	var isCollected = "${depth.isCollected}";
	if(isCollected != 0){
		isCollected = 1;
		$(".toppart span:last").attr("val",isCollected);//收藏状态值
		$(".toppart span:last").html('<i class="iicon i-fav"></i>&nbsp;取消收藏');//收藏显示文字
	}
	
});

function InitPronum() {
	$(".pronum_unit button").click(function() {
		var $unit = $(this).parent(".pronum_unit");
		var _val = parseInt($unit.find("input").val());
		if (!$.isNumeric(_val)) {
			alert("请输入数字");
			return;
		}
		if ($(this).hasClass("disabled"))
			return;
		// 增加
		if ($(this).hasClass("res_btn")) {
			$unit.find("input").val(++_val);
			if (_val >= 1) {
				$unit.find("button.des_btn").removeClass("disabled");
			}
		} else {
			$unit.find("input").val(--_val);
			if (_val < 1) {
				$unit.find("button.des_btn").addClass("disabled");
			}
		}
		getSumPrice();
	});
}

//初始化价格日期
var eventArr = [];
function initDatePrice(depthId){
	$.post("<%=basePath %>pc/depth/pricesList",{'depthId':depthId},function(res){
		if(res.status == 'success'){
			var list = res.pricesList;
			for(var i = 0; i < list.length; i++){
				var eventItem = {};
				eventItem.start = list[i].dateFormat;//日期
				eventItem.val1 = list[i].adult_price;//成人价
				eventItem.val2 = list[i].child_price;//儿童价
				eventItem.state = list[i].is_odds;//是否优惠
				eventArr[i] = eventItem;
			}
		}
	});
}

//初始化成人儿童数量下拉框
function initPersonNum(){
	for(var i = 1; i <= 9; i++){
		$("#adultSelect").append('<option value="'+i+'">'+i+'</option>');
	}
	for(var i = 0; i <= 4; i++){
		$("#childSelect").append('<option value="'+i+'">'+i+'</option>');
	}
}

//得出总价
function getSumPrice(){
	//根据日期得出日期对应的价格
	if("${depth.adult_price}" == '暂无' || "${depth.child_price}" == '暂无'){
		$("#sumPrice").text("暂无");
	}else{
		var curAdultPrice = parseFloat("${depth.adult_price}");
		var curChildPrice = parseFloat("${depth.child_price}");
		var adultNum = parseInt($("#adultSelect").val());
		var childNum = parseInt($("#childSelect").val());
		if(isNaN(adultNum)){
			adultNum=0;
		}
		if(isNaN(childNum)){
			childNum=0;
		}
		var countPrice=curAdultPrice*adultNum + curChildPrice*childNum;
		$("#sumPrice").text(countPrice);
	}
	
}

//预定 跳转到订单页
function toOrder(){
	var sumPrice = $("#sumPrice").text();
	var adultNum = $("#adultSelect").val();
	var childNum = $("#childSelect").val();
	if(sumPrice == '' || sumPrice == '暂无'){
		popMesTip("该出发日期暂无价格，请选择其他日期");
		return ;
	}
	if(sumPrice == '0'){
		popMesTip("请至少选择一个成人");
		return ;
	}
	if(adultNum >= 1000 || childNum >= 1000 ){
		popMesTip("人数不能超过1000");
		return ;
	}
	if(isNaN(adultNum) || isNaN(childNum) || isNaN(sumPrice)){
		popMesTip("请输入数字");
		return ;
	}
	var json = {
		'depthId':$("#depthId").val(),//深度游id
		'startTime': $("#startTime").val(),//出发日期
		'fromCityId': $("#citySelect").val(),//出发城市id
		'adultNum' : $("#adultSelect").val(),//成人数量
		'childNum' : $("#childSelect").val(),//儿童数量
		'realPrice' : $("#sumPrice").text()//订单总价
	};
	subWebForm("<%=basePath %>pc/depth/toOrder",json);
}

var totalPage=0;//总页数
var pageNo=1;//当前页	

//显示评价
function showEvaluate(depthId,isShowView){
	//总评价
	$(".total_judge .orange2 span").text("${depth.goodsRate}");//好评率
	$(".total_judge span:last").text("${depth.avgScore}"+"分");//平均分
	$(".total_judge .heart_value").css("width",20*"${depth.avgScore}"+"%");//平均分图标百分比
	//获取评价列表
	$.post("<%=basePath %>pc/depth/evaluateList",{'depthId':depthId,'pageNo':pageNo},function(res){
		if(res.status == 'success'){
			$(".single_judge_wrap").empty();
			var list = res.list;
			for(var i in list){
				var judge = $("#judge").clone().removeAttr("id");
				judge.find(".l-part img").attr("src",list[i].head_img);//会员头像
				judge.find(".l-part .lorange").html(list[i].level_desc+"&nbsp;");//会员级别
				//会员级别样式设置
				judge.find(".l-part span:last").empty();
				var levelIcon = "iicon i-level"+list[i].level_name;//所在级别(1-普通会员，2-黄金会员，3-钻石会员)
				//所在级别徽章个数
				for(var j = 0; j < list[i].level_detail; j++){
					judge.find(".l-part span:last").append('<i class="'+levelIcon+'">');
				}
				judge.find(".r-part .dark").text(list[i].nickname);//昵称
				judge.find(".r-part .dark").text(list[i].nickname);//昵称
				judge.find(".r-part span.grey").text(list[i].score+"分");//分数
				judge.find(".r-part .heart_value").css("width",20*list[i].score+"%");//分数图标百分比
				judge.find(".r-part .r-abs").text(new Date(list[i].create_time).format("yyyy-MM-dd hh:mm"));//评价时间
				judge.find(".r-part p").text(list[i].comment);//评价内容
				//图片
				judge.find(".judge-img").empty();
				var photoList = list[i].photoList;
				for(var j in photoList){
					//judge.find(".judge-img").append('<img src='+photoList[j].picUrl+' height="107" width="168" alt="">');
					judge.find(".judge-img").append('<a class="fancybox" href="'+photoList[j].picUrl+'"><img src="'+photoList[j].picUrl+'" height="107" width="168" alt=""></a>');
				}
				judge.show();
				$(".single_judge_wrap").append(judge);
			}
			totalPage = res.totalPage;
			pageNo = res.pageNo;
			initPage();
			if(isShowView){
				//显示对话框
				var viewjudgeDlg = new dialogBox({
					title : $("[name=viewjudge]").text(),
					selfClass : "type2",
					contentHtml : $("#viewjudgepopup").html(),
					popupBoxW : 830,
					coverhide : false,
					initEvent : function($dom){
						//评价大图
						$('.fancybox').fancybox();
					}
				});
				viewjudgeDlg.showDlg();
			}
		}
	});
}

//显示价格包含
function showPricesContain(depthId){
	$.post("<%=basePath %>pc/depth/pricesContain",{'depthId':depthId},function(res){
		if(res.status == 'success'){
			var list = res.pricesContain;
			$(".box-section:eq(1) .r-part").empty();
			$(".box-section:eq(2) .r-part").empty();
			var startAddrs = "";
			var endAddrs = "";
			//遍历
			for(var i = 0; i < list.length; i++){
				//交通
				if(list[i].contain_type == 'traffic'){
					startAddrs += list[i].from_addr + "<br/>";
					endAddrs += list[i].to_addr + "<br/>";
				}
				//酒店
				else if(list[i].contain_type == 'hotel'){
					$(".box-section:eq(1) .r-part").append('<p><span class="lorange w100">DAY '+list[i].check_day+'</span>'+list[i].check_hotel+'</p>');
				}
				//观光
				else if(list[i].contain_type == 'visit'){
					$(".box-section:eq(2) .r-part").append('<p>'+list[i].visit+'<span class="grey9">('+list[i].remark+')</span></p>');
				}
			}
			$(".box-section:eq(0) .r-part span:eq(0)").html(startAddrs.substr(0,startAddrs.length-5));
			$(".box-section:eq(0) .r-part span:eq(1)").html(endAddrs.substr(0,endAddrs.length-5));
			$(".box-section:eq(1) .r-part").append('<p class="f12 grey9">＊考虑到行程安排、酒店房型库存等原因,实际预定时可能会选用其他同级别精品酒店</p>');
			//$("#costcontainpopup").show();
			//弹出对话框
			var costcontainDlg = new dialogBox({
				title : "价格包含",
				selfClass : "type2",
				contentHtml : $("#costcontainpopup").html(),
				popupBoxW : 815,
				coverhide : false,
				initEvent : function($dom){
				}
			});
			costcontainDlg.showDlg();
		}
	});
}

//显示价格查询
function showPriceQuery(){
	if(pricequeryDlg == null){
		pricequeryDlg = new dialogBox({
			title : '价格查询',
			selfClass : "type2",
			contentHtml : $("#pricequerypopup").html(),
			popupBoxW : 815,
			coverhide : false,
			initEvent : function($dom){
				addCalendar();
			}
		});
	}
	pricequeryDlg.showDlg();
	$(".fc-icon-left-single-arrow").click();
	$(".fc-icon-right-single-arrow").click();
}

//创建日历
function addCalendar(){
	$('#calendar').fullCalendar({
		header: {
			left: 'prev',
			center: 'title',
			right: 'next'
		},
		titleFormat : 'YYYY年MMMM',
		monthNames : ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'],
 		dayNamesShort : ['周日', '周一', '周二', '周三', '周四', '周五', '周六'],
		editable: false,
		contentHeight : 370,
		events: eventArr,
		eventRender: function(event, element) {
			var statetext = '';
			if( event.state == 2 ){
				statetext = "<span class='statespan state1'>缺</span>";
			} else if( event.state == 1 ){
				statetext = "<span class='statespan state2'>惠</span>";
			}
			var _html = statetext+"<span>成人¥</span>"+event.val1+"<br/><span>儿童¥"+event.val2+"</span>";
			if( event.state == 2 ){
				element.append( statetext );				
			} else {
				element.append( _html );
			}
	        
	    },
	    eventClick : function(date, jsEvent, view){
	    	$("#calendar").find(".fc-body").find(".selected").removeClass("selected");
	    	var _idx = $(this).parent("td").index();	    	
	    	$(this).addClass("selected");
	    	$(this).parents("tbody").prev("thead").find("td").eq(_idx+1).addClass("selected");
	    	$(this).parents(".fc-content-skeleton").prev(".fc-bg").find("td").eq(_idx).addClass("selected");
	    	//修改右侧出发日期和合计
	    	$("#startTime").val(date._start._i);
	    	var adultNum = parseInt($("#adultSelect").val());
	    	var childNum = parseInt($("#childSelect").val());
	    	$("#sumPrice").text( date.val1*adultNum + date.val2*childNum);
	    	//修改当前页面显示的成人价和儿童价
	    	$("#adultPrice").text(date.val1);
	    	$("#childPrice").text(date.val2);
	    }
	});
}

//显示详细行程
function showTrip(depthId){
	$.post("<%=basePath %>pc/depth/trip",{'depthId':depthId},function(res){
		if(res.status == 'success'){
			var list = res.tripList;
			if(list.length == 0){
				popMesTip("暂时没有行程安排");
			}else{
				$(".steptag_list").empty();//天数
				$(".r-content").empty();//行程
				//遍历
				for(var i = 0; i < list.length; i++){
					//地址
					var addr = $("#addr").clone().removeAttr("id");
					if(list[i].day_type == 'start'){
						$(".steptag_list").append('<li class="active" inx="'+i+'">启程</li>');
						addr.find(".roundspan").text("启程");//第几天;
					}else if(list[i].day_type == 'ing'){
						var day = parseInt(list[i].current_day) + 1;
						$(".steptag_list").append('<li inx="'+i+'">第'+day+'天</li>');
						addr.find(".roundspan").text("第"+day+"天");//第几天;
					}else if(list[i].day_type == 'end'){
						$(".steptag_list").append('<li inx="'+i+'">返程</li>');
						addr.find(".roundspan").text("返程");
					}
					addr.find(".roundspan").parents(".step").attr("id","day_trip_"+i);
					
					/* var addrs = "暂无";
					if(list[i].addrs != null){
						addrs = list[i].addrs;
					}
					addr.find(".r-part").text(addrs);//行程地址
					addr.show();
					$(".r-content").append(addr); */
					//行程
					var addrs = "";
					var addrList = list[i].addrList;
					for(var m = 0; m < addrList.length; m++){
						addrs += "● "+addrList[m].trip_addr+"</br>";
					}
					if(addrs == ""){
						addrs = "暂无";
					}
					addr.find(".r-part").html(addrs);//行程地址
					$(".r-content").append(addr);
					
					//交通
					var trafficList = list[i].trafficList;
					for(var j = 0; j < trafficList.length; j++){
						var traffic = $("#traffic").clone().removeAttr("id");
						var trafficIcon = "";//交通工具图标
						if(trafficList[j].toolId == '1'){
							trafficIcon = "i-fly";//飞机
						}else if(trafficList[j].toolId == '2'){
							trafficIcon = "i-train";//火车
						}else if(trafficList[j].toolId == '3'){
							trafficIcon = "i-public";//公共交通
						}else if(trafficList[j].toolId == '4'){
							trafficIcon = "i-boat";//坐船
						}else if(trafficList[j].toolId == '5'){
							trafficIcon = "i-walk";//步行
						}
						traffic.find(".l-part i").attr("class","iicon "+trafficIcon);//交通方式图标
						traffic.find(".r-part span").text(timeStr(trafficList[j].used_hour,trafficList[j].used_minute));//交通时间
						traffic.find(".r-part p").text(trafficList[j].toolName);//交通方式名称
						traffic.show();
						$(".r-content").append(traffic);
					}
					//图片
					var imgList = list[i].imgList;
					for(var j = 0; j < imgList.length; j++){
						var imgs = $("#imgs").clone().removeAttr("id");
						var imgIcon = "";//图片图标
						if(imgList[j].pic_type == 'scenic'){
							imgIcon = "i-photo";//景点
						}else if(imgList[j].pic_type == 'cater'){
							imgIcon = "i-food";//餐饮
						}else if(imgList[j].pic_type == 'hotel'){
							imgIcon = "i-hotel";//酒店
						}
						imgs.find(".l-part i").attr("class","iicon "+imgIcon);//图片图标
						imgs.find(".r-part img").attr("src",imgList[j].picUrl);//图片路径
						imgs.find(".r-part h5").text(imgList[j].remark);//图片备注
						imgs.find(".r-part span").text(timeStr(imgList[j].used_hour,imgList[j].used_minute));//建议时间
						imgs.show();
						$(".r-content").append(imgs);
					}
				}
				//行程结束
				var endstep = $("#endstep").clone().removeAttr("id");
				$(".r-content").append(endstep);
				
				//弹出对话框
				var plandetailDlg = new dialogBox({
					title : '详细行程',
					selfClass : "type2",
					contentHtml : $("#plandetailpopup").html(),
					popupBoxW : 815,
					coverhide : false,
					initEvent : function($dom){
					}
				});
				plandetailDlg.showDlg();
				
				//设置左边天数的样式
				var w = $(".r-content").parents(".popup-cent").width();
				var h = $(".r-content").parents(".popup-cent").outerHeight();
				$(".steptag_list").css("top",($(window).height()-h)/2+50);
				$(".steptag_list").css("left",($(window).width()-w)/2+40);
				$(".steptag_list").css({position: "fixed"});
				$(".steptag_list").find("li").css({cursor:"pointer"});
				
				//设置天数的点击事件
				$(".steptag_list").find("li").bind('click',function(){
					var $this = $(this);
					
					$(".steptag_list").find("li").removeClass("active");
					$this.addClass("active");
					
					var inx = $this.attr("inx");
					var $trip = $this.parents(".popup-cent").find("#day_trip_"+inx);
					$(".popup-cent").animate({scrollTop:$trip.position().top+10},200);
				});
			}
		}
	});
}

//显示亮点详情
function showPointDetail(pointId){
	$.post("<%=basePath %>pc/depth/pointDetail",{'pointId':pointId},function(res){
		if(res.status == 'success'){
			//注意事项
			var attention = "1. "+res.point.attention_1;
			if(res.point.attention_2 != null && res.point.attention_2 != ""){
				attention += "<br/>"+"2. "+res.point.attention_2;
			} 
			if(res.point.attention_3 != null && res.point.attention_3 != ""){
				attention += "<br/>"+"3. "+res.point.attention_3;
			} 
			var viewdetail = $("#viewdetailpopup .viewdetail").clone();
			viewdetail.find("p:eq(0)").text("建议时长："+timeStr(res.point.tour_hour,res.point.tour_minute));//建议时长
			viewdetail.find("p:eq(1)").text("地点："+res.point.city);//地点
			viewdetail.find("p:eq(2)").text("地址："+res.point.addr_detail);//地址
			viewdetail.find("img").attr("src",res.point.picUrl);//图片
			viewdetail.find("p.attention").html(attention);//注意事项
			viewdetail.find("p.traffic").text(res.point.traffic);//交通情况
			viewdetail.find("p.feature").text(res.point.feature);//特色推荐
			viewdetail.find("p.other1").text("1. "+res.point.other_1);//其他1
			if(res.point.other_2 != null && res.point.other_2 != ""){
				viewdetail.find("p.other2").text("2."+res.point.other_2);//其他2
				viewdetail.find("p.other2").show();
			}
			if(res.point.other_3 != null && res.point.other_3 != ""){
				viewdetail.find("p.other3").text("3."+res.point.other_3);//其他3
				viewdetail.find("p.other3").show();
			}
			viewdetail.find("p:eq(3) span.f12").html(res.point.summary);//概述
			viewdetail.show();
			$("#viewdetailpopup").empty();
			$("#viewdetailpopup").append(viewdetail);
			
			//弹出对话框
			var viewdetailDlg = new dialogBox({
				title : res.point.point_name+'<span class="f12 ml20">人气：'+res.point.click_num+'</span>',
				selfClass : "type2",
				contentHtml : $("#viewdetailpopup").html(),
				popupBoxW : 830,
				coverhide : false,
				initEvent : function($dom){
				}
			});
			viewdetailDlg.showDlg();
		}
	});
}

//收藏(添加和取消)
function doCollect(obj){
 	var val = $(obj).attr("val");
	var tip = "";
	var txt = "";
	//若未收藏，则添加收藏
	if(val == 0){
		tip = "收藏成功";
		txt = "取消收藏";
	}
	//若已收藏，则取消收藏
	else if(val == 1){
		tip = "取消收藏成功";
		txt = "收藏("+"${depth.collectNum }"+")";
	}
	$.post("<%=basePath %>pc/depth/doCollect",{'fromId':$("#depthId").val()},function(res){
		if(res.status == 'success'){
			popMesTip(tip);
			$(obj).attr("val",res.val);//收藏状态值
			$(obj).html('<i class="iicon i-fav"></i>&nbsp;'+txt);//收藏显示文字
		}else if(res.status =="unlogin"){
			location.href="pc/login?op=toLogin"
		}else if(res.status =="exception"){
			alert("系统忙，请稍后再试");
		}
	}); 
}

//返回时长字符串
function timeStr(hour, minute){
	var time = "";
	if(hour != 0){
		time += hour + "小时";
	}
	if(minute != 0){
		time += minute + "分钟";
	}
	return time;
}

function gotoPage(goNo){
	pageNo = goNo;
	showEvaluate($("#depthId").val());
}

function goPage(){
	pageNo = $("#gotopage").val();
	if(parseInt(pageNo)>totalPage){
		$("#gotopage").val(totalPage);
		valTips("gotopage", "输入页数大于当前最大页数");
	}else{
		showEvaluate($("#depthId").val());
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



Date.prototype.format = function(format) {
    var date = {
           "M+": this.getMonth() + 1,
           "d+": this.getDate(),
           "h+": this.getHours(),
           "m+": this.getMinutes(),
           "s+": this.getSeconds(),
           "q+": Math.floor((this.getMonth() + 3) / 3),
           "S+": this.getMilliseconds()
    };
    if (/(y+)/i.test(format)) {
           format = format.replace(RegExp.$1, (this.getFullYear() + '').substr(4 - RegExp.$1.length));
    }
    for (var k in date) {
           if (new RegExp("(" + k + ")").test(format)) {
                  format = format.replace(RegExp.$1, RegExp.$1.length == 1
                         ? date[k] : ("00" + date[k]).substr(("" + date[k]).length));
           }
    }
    return format;
}

</script>
</body>
</html>