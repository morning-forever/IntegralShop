<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transition al.dtd"><%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../../static/inc_web.jsp" %>
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv = "X-UA-Compatible" content = "IE=edge,chrome=1 " /><meta charset="utf-8"> 
<title>快旅出行-拼车</title>
<!-- 日期时间控件 -->
<link href="static/web/js/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link href="static/web/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
<link rel="stylesheet" href="static/web/css/common.css" />
<link rel="stylesheet" href="static/web/css/inner.style.css" />
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
				<li class="active">
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
				<li >
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
		<div class="content clearfix">
			<div class="breadcrumb">当前位置：<a href="pc/home">首页</a><a href="pc/cart/home">快旅出行</a><span>拼车</span></div>
			<div class="lpart">
				<ul class="category">
					<li><a href="pc/cart/rent/list"><i class="iicon i-quicktype1"></i>快旅租车</a></li>
					<li><a href="pc/cart/wrap/list"><i class="iicon i-quicktype2"></i>快旅包车</a></li>
					<li><a href="pc/cart/bus/list"><i class="iicon i-quicktype3"></i>快旅班车</a></li>
					<li class="active"><a href="pc/cart/pool/list"><i class="iicon i-quicktype3"></i>快旅拼车</a></li>
				</ul>
			</div>
			<div class="rpart f12">
				<div class="shadow whitebg mb10" style="padding:20px 20px 10px;">
					<div class="fitemwrap">
						<span class="item-title">出发时间</span>
						<div class="form-item inline" style="width:186px;">
							<i class="iicon i-date"></i>
							<input class="datetime form-control" value="<%-- ${poolStartTime } --%>" readonly type="text" placeholder="请选择日期" id="startTime"/>
						</div>						
					</div>				
					<div class="fitemwrap" id="fromCitys">
						<a href="javascript:;" class="btn lorgbtn fr" id="poolStart">发起拼车</a>
						<span class="item-title">出发地</span>
						<div class="form-item select-item mr10" style="width:186px;">
							<span class="select-text">请选择出发城市 </span>
							<i class="iicon i-select"></i>
							<select name="fromCity" id="fromCity" onchange="selectCounty(this);">
							</select>
						</div>
						
						<div class="form-item select-item haspopbox" style="width:160px;">
							<span class="select-text">请选择出发位置</span>
							<i class="iicon i-select"></i>
							<div class="popbox large r-pos"  id="fromC">
								<i class="iicon i-close"></i>
								<h4>所有门店</h4>
								<div id="county" class="spanwrap" style="border-bottom: 1px solid #ffb199;margin: 0 0 5 0;padding: 0 0 5 0;">
									<span class="current">区/县</span>
								</div>
								<input type="hidden" name="fromAddrId" id="fromAddrId" value="0" />
								<div id="stroge" class="spanwrap showvalue">
									<span class="current">门店</span>
								</div>
								<div id="detail" class="desc lh2">
									地址：贵阳龙暴动机场长途换成站内（国内到达11号门右手边电梯至负  一楼，沿长途换乘站指示牌到达换乘站内）<br/>
	    							电话：0987-3564885<br/>
	    							营业时间：00：00-24：00
								</div>
							</div>
						</div>
					</div>
					
					<div class="fitemwrap clearfix" id="toCitys">
						<a href="javascript:;" class="btn lorgbtn fr" onclick="doSerch();">搜索</a>
						<span class="item-title">目的地</span>
						<div class="form-item select-item mr10" style="width:186px;">
							<span class="select-text" id="tocity-text">请选择到达城市 </span>
							<i class="iicon i-select"></i>
							<select name="toCity" id="toCity">
							</select>
						</div>
						<div class="form-item select-item haspopbox" style="width:160px;">
							<span class="select-text" id="toaddr_text">请选择到达位置</span>
							<i class="iicon i-select"></i>
							<div class="popbox large r-pos"  id="fromT">
								<i class="iicon i-close"></i>
								<h4>所有门店</h4>
								<div id="county" class="spanwrap" style="border-bottom: 1px solid #ffb199;margin: 0 0 5 0;padding: 0 0 5 0;">
									<span class="current">区/县</span>
								</div>
								<input type="hidden" name="toAddrId" id="toAddrId" />
								<div id="stroge" class="spanwrap showvalue">
									<span class="current">门店</span>
								</div>
								<div id="detail" class="desc lh2">
									地址：贵阳龙暴动机场长途换成站内（国内到达11号门右手边电梯至负  一楼，沿长途换乘站指示牌到达换乘站内）<br/>
	    							电话：0987-3564885<br/>
	    							营业时间：00：00-24：00
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- 车辆列表 -->
				<div class="shadow whitebg mb10">
					<!-- 排序 -->
					<div class="sortwrap clearfix">
						<a name="orders" id="o1" class="active" href="javascript:;" >默认</a>
						<a name="orders" id="o2" class="sort-res" href="javascript:;" >出发日期<i class="iicon"></i></a>
						<input id="startTimeOrder" type="hidden" value="desc">
					</div>
					<div class="carprolist_wrap">
						<ul class="carlist type3">
							<li>
								暂无信息								
							</li>
						</ul>
					</div>
					<!-- 分页  -->
					<div class="pagination" style="padding-right:20px;">
					</div>	
				</div>
			</div>
		</div>		
	</div>
	
	
	<li id="itemTemp" style="display: none;">
		<div class="info ml10">
			<p><i class="iicon i-aim"></i><span class="f14">贵阳-东京</span></p>
			<p><i class="iicon i-pnum"></i>已拼车1位</p>
			<p><i class="iicon i-dtime"></i>出发时间：<span class="grey9">2015-6-12   16：15</span></p>
		</div>
		<div class="info info2 tc">
			<p><span class="lorange"><span class="f14">￥</span><span class="f24 bold">30-100</span></span></p>
			<p><span class="grey9">拼车截止时间</span></p>
			<p><span class="otime">01</span>&nbsp;&nbsp;时&nbsp;&nbsp;<span class="otime">00</span>&nbsp;&nbsp;分&nbsp;&nbsp;<span class="otime">02</span>&nbsp;&nbsp;秒</p>
		</div>
		<div class="r-part">
			<a href="javascript:;" class="btn formbtn orgbtn">我要拼车</a>
		</div>								
	</li>
	
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
</div>

<!-- 日期时间控件 -->
<script type="text/javascript" src="static/web/js/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="static/web/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="static/web/js/index.js"></script>
<script type="text/javascript" src="static/web/js/base.js"></script>

<script type="text/javascript">
var totalPage=0;//总页数
var pageNo=1;//当前页

var isTime=0;

$(function(){
	scrollBannerInit($(".banner-ul"),$(".banner-btn"));
	$(".showmore").click(function(){
		$(this).prev(".value_wrap").css({"height":"auto"});
		$(this).css({"visibility":"hidden"});
	});
	$(".showless").click(function(){
		$(this).parent(".value_wrap").animate({"height":"31px"},200);
		$(this).parent(".value_wrap").next(".showmore").css({"visibility":"visible"});
	});
	$('.datetime').datetimepicker({
		autoclose:1,
		format:"yyyy-mm-dd hh:ii",
		//minView: 2,
		language:'zh-CN',
		todayBtn: true
	});
	doSerch();
	
	$("a[name=orders]").click(function(){
		if($(this).attr('id') == 'o1' && $(this).attr('class') != 'active'){
			$(this).addClass('active');
			$("#o2").removeClass("active");
		}else{
			$(this).addClass('active');
			$("#o1").removeClass("active");
		}
		var orders =  $("#startTimeOrder").val();
		if('desc' == orders){
			$("#startTimeOrder").val('asc');
		}else{
			$("#startTimeOrder").val('desc');
		}
		doSerch();
	});
	
	$("#poolStart").click(function() {
		goCreatePool();	
	});
	
	$('#startTime').change(function(){
		$.post("<%=basePath %>pc/cart/valTime2Hour",{'startTime':$("#startTime").val()},function(req){
			if(req.status=='fail'){
				isTime = 1;
				valTips("startTime", "出发时间必须在当前时间的2小时后。");
			}else{
				isTime = 0;
			}
		},"JSON");
	});	
	
});

function gotoPage(goNo){
	pageNo = parseInt(goNo);
	doSerch();
}

function goPage(){
	/* $("#pageNo").val($("#gotopage").val());
	$("#doSearch").click(); */
	
	pageNo= parseInt($("#gotopage").val());
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
		"startTime":$("#startTime").val(),
		"fromAddrId":$("#fromAddrId").val(),
		"toAddrId":$("#toAddrId").val(),
		"startTimeOrder":$("#startTimeOrder").val(),
		"pageNo":pageNo
	};
	
	$.post("<%=basePath %>pc/cart/pool/listData",param,function(data){
		var list=data.data.list;
		$(".carlist").html("");
		var itemTemp = $("#itemTemp");
		if(typeof(list)=='undefined'){
			$(".carlist").append('暂无数据');
		}
		
		for(var i in list){
			itemUi = itemTemp.clone();
			var item = list[i];
			itemUi.find(".f14:eq(0)").html(item.seAddr);
			itemUi.find("p:eq(1)").html('<i class="iicon i-pnum"></i>已拼车'+item.poolDss+'位');
			itemUi.find("p:eq(2) .grey9").html(''+subTime(item.startTime)+'');
			itemUi.find(".bold").html(item.minPrice +'-'+item.maxPrice);
			itemUi.find("p:last").html(convertDate(item.diffTime));
			//disbtn
			if(item.diffTime<=0 || item.isClosed == 0){
				itemUi.find("a:eq(0)").addClass('disbtn');
			}else{
				itemUi.find("a:eq(0)").attr({"onclick":'destineOrder('+item.id+');'});
			}
			itemUi.show();
			$(".carlist").append(itemUi);
		}
		thisPageSize=data.data.thisPageSize;
		totalPage=data.data.totalPage;
		pageNo=data.data.pageNo;
		initPage();
	});
}

var subTime = function(times){
	if(times != null && times !='' )
		return times.substring(0,times.length-3);
	return '';
};

var convertDate = function(t){
	var sx = 1;
	var mx = 60;
	var hx = 60;
	var ss = parseInt(t / sx % mx),mm = 0,hh=0;
	if(ss >= 0){
		if(t / sx / mx >= 0)
			mm = parseInt(t / sx / mx % hx);
		hh = parseInt(t / sx / mx / hx);
	}
	return '<span class="otime">'+hh+'</span>&nbsp;&nbsp;时&nbsp;&nbsp;<span class="otime">'+mm+'</span>&nbsp;&nbsp;分&nbsp;&nbsp;<span class="otime">'+(ss<0?0:ss)+'</span>&nbsp;&nbsp;秒';
};

/**
 * 提交订单
 */
var destineOrder = function(id){
	window.location.href='<%=basePath %>pc/cart/pool/destineOrder?id='+id;	
};

/*页面重新绑定事件*/
$(".popbox .spanwrap span").click(initCounty());

$(document).ready(function(){
	//初始化开始城市
	
	$("#fromAddrId").val(0);
	$("#toAddrId").val(0);
	
	var fromCitysDiv = $("#fromCitys");
	var toCitysDiv = $("#toCitys");
	initC(fromCitysDiv,toCitysDiv);
	var fromCity = fromCitysDiv.find("select:eq(0)");
	var toCity = toCitysDiv.find("select:eq(0)");
	fromCity.attr({onchange:"changeCity(this)"});
	$.post("<%=basePath %>pc/cart/pool/fromCitys",{},function(req){
		fromCity.empty();
		fromCity.append('<option value="0" >------请选择------</option>');
		var list = req.fromCitys;
		for(var i in list){
			var item = '<option value="'+list[i].id+'" val="'+list[i].name+'">'+list[i].name+'</option>';
			fromCity.append(item);
		}
	},"JSON");
	
	toCity.attr({onchange:'changeToCity(this)'});
	$("#fromAddrId").change(function(){
		$.post("<%=basePath %>pc/cart/pool/toCitys",{'fromAddrId':this.value},function(req){
			toCity.empty();
			toCity.append('<option value="0">------请选择------</option>');
			var list = req.toCitys;
			for(var i in list){
				var item = '<option value="'+list[i].id+'" >'+list[i].name+'</option>';
				toCity.append(item);
			}
		},"JSON");
	});
});

var initC = function(fromCitysDiv,toCitysDiv){
	fromCitysDiv.find("#county").html('暂无');
	fromCitysDiv.find("#stroge").html('暂无');
	fromCitysDiv.find("#detail").html('暂无');
	toCitysDiv.find("#county").html('暂无');
	toCitysDiv.find("#stroge").html('暂无');
	toCitysDiv.find("#detail").html('暂无');
};

var changeToCity= function(obj){
	$("#toAddrId").val(0);
	$("#toaddr_text").html('请选择到达位置');
	var cityId=$(obj).val();
	var toCitysDiv = $("#toCitys");
	toCitysDiv.find("#county").html("");
	toCitysDiv.find(".form-item .select-text:eq(0)").html(obj.options[obj.selectedIndex].text);
	$.post("<%=basePath %>pc/cart/pool/toCountys",{"fromAddrId" :$("#fromAddrId").val(),'toCityId':cityId },function(data){
		var list=data.toCountys;
		if(list == null || list == ''){
			toCitysDiv.find("#county").html('暂无');
			toCitysDiv.find("#stroge").html('暂无');
			toCitysDiv.find("#detail").html('暂无');
		}
		for(var i=0;i<list.length;i++){
			if(i==0){
				toCitysDiv.find("#county").append('<span onclick=clickToCounty(this); class="current" val='+list[i].id+'>'+list[i].name+'</span>');
			}else{
				toCitysDiv.find("#county").append('<span onclick=clickToCounty(this); val='+list[i].id+'>'+list[i].name+'</span>');
			}
		}
		toCitysDiv.find("#county span:eq(0)").click();
	});
};

/*选择区域*/
var clickToCounty = function(obj){
	var fromCitysDiv = $("#toCitys");
	fromCitysDiv.find("#stroge").html("");
	$.post("<%=basePath %>pc/cart/pool/toAddrs",{"fromAddrId" :$("#fromAddrId").val(),'toCountyId':$(obj).attr('val')},function(data){
		var list=data.toAddrs;
		fromCitysDiv.find("#detail").empty();
		if(list == null || list == ''){
			fromCitysDiv.find("#detail").html('暂无');
		}
		for(var i=0;i<list.length;i++){
			if(i==0){
				fromCitysDiv.find("#stroge").append('<span name="strogeDetail" class="current" openTime="'+list[i].openTime+'" phone="'+list[i].linkTel+'" addr="'+list[i].addrDetail+'" val="'+list[i].id+'">'+list[i].store+'</span>');
				fromCitysDiv.find("#detail").append("地址："+list[i].addrDetail+"<br>电话："+list[i].linkTel+"<br>营业时间:"+list[i].openTime);
				$("#addrsId").val(list[i].id);
			}else{
				fromCitysDiv.find("#stroge").append('<span  openTime='+list[i].openTime+' phone="'+list[i].linkTel+'" addr='+list[i].addrDetail+' val='+list[i].id+'>'+list[i].store+'</span>');
			}
		}
		fromCitysDiv.find("#stroge .current").click();
		initCounty();
	});
};


/*选择城市*/
var changeCity = function(obj){
	
	$("#toaddr_text").html('请选择到达位置');
	$("#tocity-text").html("请选择到达城市");
	$("#toAddrId").val(0);//设置toAddrId地址为0
	
	var cityId=$(obj).val();
	var fromCitysDiv = $("#fromCitys");
	fromCitysDiv.find("#county").html("");
	fromCitysDiv.find(".form-item .select-text:eq(0)").html(obj.options[obj.selectedIndex].text);
	$.post("<%=basePath %>pc/cart/pool/fromCountys",{"fromCityId" :cityId },function(data){
		var list=data.fromCountys;
		if(list == null || list == ''){
			fromCitysDiv.find("#county").html('暂无');
			fromCitysDiv.find("#stroge").html('暂无');
			fromCitysDiv.find("#detail").html('暂无');
		}
		for(var i=0;i<list.length;i++){
			if(i==0){
				fromCitysDiv.find("#county").append('<span onclick=clickCounty(this); class="current" val='+list[i].id+'>'+list[i].name+'</span>');
			}else{
				fromCitysDiv.find("#county").append('<span onclick=clickCounty(this); val='+list[i].id+'>'+list[i].name+'</span>');
			}
		}
		fromCitysDiv.find("#county span:eq(0)").click();
	});
};

/*选择区域*/
var clickCounty = function(obj){
	var fromCitysDiv = $("#fromCitys");
	fromCitysDiv.find("#stroge").html("");
	$.post("<%=basePath %>pc/cart/pool/fromAddrs",{"fromCountyId":$(obj).attr("val"),"type":"bus"},function(data){
		var list=data.fromAddrs;
		fromCitysDiv.find("#detail").empty();
		if(list == null || list == ''){
			fromCitysDiv.find("#detail").html('暂无');
		}
		for(var i=0;i<list.length;i++){
			if(i==0){
				fromCitysDiv.find("#stroge").append('<span name="strogeDetail" class="current" openTime='+list[i].openTime+' phone="'+list[i].linkTel+'" addr='+list[i].addrDetail+' val='+list[i].id+'>'+list[i].store+'</span>');
				fromCitysDiv.find("#detail").append("地址："+list[i].addrDetail+"<br>电话："+list[i].linkTel+"<br>营业时间:"+list[i].openTime);
				$("#addrsId").val(list[i].id);
			}else{
				fromCitysDiv.find("#stroge").append('<span  openTime='+list[i].openTime+' phone="'+list[i].linkTel+'" addr='+list[i].addrDetail+' val='+list[i].id+'>'+list[i].store+'</span>');
			}
		}
		fromCitysDiv.find("#stroge .current").click();
		initCounty();
	});
};

/*初始弹出div层的选择联动*/
function initCounty(){
	$(".popbox .spanwrap span").click(function(e){
		console.info(12222);
		var _text = $(this).text();
		var _phone=$(this).attr("phone");
		var _addr=$(this).attr("addr");
		var _openTime=$(this).attr("openTime");
		stopPropagation(e);
		if('fromC'==$(this).parent(".spanwrap").parent("div").attr('id') && $(this).parent(".spanwrap").attr('id')=='stroge'){
			$("#fromAddrId").val($(this).attr('val'));
			$("#fromAddrId").change();
		}else if('fromT'==$(this).parent(".spanwrap").parent("div").attr('id') && $(this).parent(".spanwrap").attr('id')=='stroge'){
			$("#toAddrId").val($(this).attr('val'));
			//$("#toAddrId").change();
		}
		$(this).parent(".spanwrap").find("span.current").removeClass("current");
		$(this).addClass("current");
		if( $(this).parent(".spanwrap").hasClass("showvalue") ){
			var str="地址："+_addr+"<br>电话："+_phone+"<br>营业时间:"+_openTime;
			console.info(str +"    "+_text);
			$(this).parents(".haspopbox").find(".select-text").text( _text );
			$(this).parents(".showvalue").next(".lh2").html(str);
		}
	});
}


function goCreatePool(){
	var fromCityId = $("#fromCity").val();
	var fromAddrId = $("#fromAddrId").val();
	var toCityId = $("#toCity").val();
	var toAddrId = $("#toAddrId").val();
	var startTime = $("#startTime").val();
	
	if (!checkField(startTime)) {
		valTips("startTime","出发时间不能为空。");
		return;
	}
	$('.datetime').change();
	if (isTime == 1) {
		valTips("poolStartTime","出发时间必须在当前时间的24小时后。");
		return;
	}
	
	if (!checkField(fromAddrId)|| fromAddrId == 0) {
		valTips($("#fromCitys").find(".select-item:last"),"出发地点不能为空。");
		return;
	}
	if (!checkField(toAddrId)|| toAddrId == 0) {
		valTips($("#toCitys").find(".select-item:last"),"到达地点不能为空。");
		return;
	}
	
	var json = {
	"fromCityId" : fromCityId,
	"fromAddrId" : fromAddrId,
	"toCityId" : toCityId,
	"toAddrId" : toAddrId,
	"startTime" : startTime
	};
	subWebForm("<%=basePath %>pc/cart/pool/destineOrder",json);
}


</script>
</body>
</html>