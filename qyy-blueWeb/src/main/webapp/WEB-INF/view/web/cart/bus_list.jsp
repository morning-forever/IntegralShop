<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transition al.dtd"><%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../../static/inc_web.jsp" %>
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv = "X-UA-Compatible" content = "IE=edge,chrome=1 " /><meta charset="utf-8"> 
<title>快旅出行-班车</title>
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
			<div class="breadcrumb">当前位置：<a href="pc/home">首页</a><a href="pc/cart/home">快旅出行</a><span>班车</span></div>
			<div class="lpart">
				<ul class="category">
					<li><a href="pc/cart/rent/list"><i class="iicon i-quicktype1"></i>快旅租车</a></li>
					<li><a href="pc/cart/wrap/list"><i class="iicon i-quicktype2"></i>快旅包车</a></li>
					<li class="active"><a href="pc/cart/bus/list"><i class="iicon i-quicktype3"></i>快旅班车</a></li>
					<li><a href="pc/cart/pool/list"><i class="iicon i-quicktype3"></i>快旅拼车</a></li>
				</ul>
			</div>
			<div class="rpart f12">
				<div class="shadow whitebg mb10" style="padding:20px 20px 10px;">
					<div class="fitemwrap">
						<span class="item-title">出发时间</span>
						<div class="form-item inline" style="width:186px;">
							<i class="iicon i-date"></i>
							<input class="datetime form-control" name="startTime" id="startTime" readonly type="text" placeholder="请选择日期" value="${startTime}" />
						</div>						
					</div>
					<div class="fitemwrap">
						<span class="item-title">出发地</span>
						<div class="form-item select-item mr10" style="width:186px;">
							<span class="select-text">请选择出发城市</span>
							<i class="iicon i-select"></i>
							<select name="getCityId" id="getCityId" onchange="findGetStore(this,'','',function(){})">
								<option value="0">请选择出发城市</option>
							</select>
						</div>
						<!-- <div class="form-item select-item" style="width:160px;">
							<span class="select-text">请选择取车门店</span>
							<i class="iicon i-select"></i>
							<select name="" id="getSotreId">
								<option value="">贵阳</option>
							</select>
						</div> -->
						<div class="form-item select-item haspopbox" style="width:160px;">
							<span class="select-text">请选择乘车地点</span>
							<i class="iicon i-select"></i>
							<div class="popbox large r-pos" value="" id="getStoreId">
								<i class="iicon i-close"></i>
								<h4>所有门店</h4>
								<div class="spanwrap" style="border-bottom: 1px solid #ffb199">
									<span>暂无</span>
								</div>
								<div class="spanwrap showvalue">
									<span class="current">暂无</span>
								</div>
								<div class="desc lh2">地址：暂无<br/>
    							电话：暂无<br/>
    							营业时间：暂无
								</div>
							</div>
						</div>
					</div>
					<div class="fitemwrap clearfix">
						<a href="javascript:doSearch();" class="btn lorgbtn fr">搜索</a>
						<span class="item-title">目的地</span>
						<div class="form-item select-item mr10" style="width:186px;">
							<span class="select-text">请选择到达城市</span>
							<i class="iicon i-select"></i>
							<select name="loseCityId" id="loseCityId" onchange="findGetStore(this,'','',function(){})">
								<option value="0">请选择到达城市</option>
							</select>
						</div>
						<div class="form-item select-item haspopbox" style="width:160px;">
							<span class="select-text">请选择取车门店</span>
							<i class="iicon i-select"></i>
							<div class="popbox large r-pos"  value="" id="loseStoreId">
								<i class="iicon i-close"></i>
								<h4>所有门店</h4>
								<div class="spanwrap" style="border-bottom: 1px solid #ffb199">
									<span>暂无</span>
								</div>
								<div class="spanwrap showvalue">
									<span class="current">暂无</span>
								</div>
								<div class="desc lh2">地址：暂无<br/>
    							电话：暂无<br/>
    							营业时间：暂无
								</div>
							</div>
						</div>
					</div>	
					<div>
						<p style="margin-left: 85px;font-size: 14px"><span style="color: red;">※</span><span style="margin-left: 10px;color: #e00;">如果班车今日出发时间已过，点击可预订明日同一时刻班车</span></p>
					</div>
				</div>			

				<!-- 车辆列表 -->
				<div class="shadow whitebg mb10">
					<!-- 排序 -->
					<div class="sortwrap clearfix">
						<a class="active" href="javascript:;" data-cmd="cb.create_time" data-sort="desc">默认</a>
						<a class="sort-res" href="javascript:;" data-cmd="ple" data-sort="asc">客座率<i class="iicon"></i></a>
						<input type="hidden" id="orderBy" value="cb.create_time desc"/>
					</div>
					<div class="carprolist_wrap">
						<ul class="carlist type2" id="dataBox">
						
						</ul>
					</div>

					<!-- 分页  -->
					<div class="pagination" style="padding-right:20px;" >
					</div>
					
				</div>
			</div>
		</div>		
	</div>
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
</div>
<!-- 日期时间控件 -->
<script type="text/javascript" src="static/web/js/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="static/web/js/bootstrap-datetimepicker.js"></script>
	<script type="text/javascript" src="static/web/js/index.js"></script>
<script type="text/javascript" src="static/web/js/base.js"></script>
<script type="text/javascript">

var totalPage = 0;
var pageNo = 1;
var showLine = 10;

var flag=0;

var doSearch = function (){
	$("#dataBox").text("");
	$(".pagination").text("");
	var orderBy = $("#orderBy").val();
	var startTime = $("#startTime").val();
	var fromAddrId = $("#getStoreId div:eq(1) .current").attr("val");
	var toAddrId = $("#loseStoreId div:eq(1) .current").attr("val");
	var data = {"orderBy":orderBy,"pageNo":pageNo,"showLine":showLine,"fromAddrId":fromAddrId,"toAddrId":toAddrId,"startTime":startTime};
	$.ajax({
		url:"<%=basePath %>pc/cart/bus/data",
		data:data,
		type:"post",
		success:function(req){
			$.each ( req.list , function(i,c){
				var li = $(modal).clone();
				li.find("img").attr("src",c.pic_url);
				li.find("a:eq(0)").attr("href","<%=basePath %>pc/cart/bus/detail/"+c.id);
				li.find(".formbtn").attr("href","<%=basePath %>pc/cart/bus/order/"+c.id);
				li.find(".f14").text(c.from_addr+"-"+c.to_addr);
				li.find(".f24").text(c.price);
				li.find("span[name=brand]").text(c.brand);
				li.find("span[name=from]").text(c.from_time);
				li.find("span[name=to]").text(c.to_time);
				li.find("span[name=ple]").text(c.ple+"%");
				li.find("span[name=seating]").text("已乘坐"+c.use_count+"人，余"+(c.seating - c.use_count)+"位");
				$("#dataBox").append(li);
			});
			
			pageNo = parseInt(req.pageNo);
			flag++;
			totalPage = req.resultNum%showLine==0?req.resultNum/showLine:parseInt(req.resultNum/showLine)+1;
			initPage();
		}
	});
}


$(function(){
	
	doSearch();
	
	scrollBannerInit($(".banner-ul"),$(".banner-btn"));
	var nowDate=new Date();
	nowDate.setMinutes(0);
	nowDate.setSeconds(0);
	var startDate=new Date();
	startDate.setHours(0);
	startDate.setMinutes(0);
	startDate.setSeconds(0);
	var endDate=new Date();
	endDate.setHours(23);
	endDate.setMinutes(59);
	endDate.setSeconds(59);
	$('.datetime').datetimepicker({
		autoclose:1,
		format:"hh:ii",
		startView:1,
		maxView:1,
		minView:1,
		initialDate:nowDate,
		//minView: 2,
		//todayBtn: true,
		clearBtn:true,
		language : "zh-CN",
		startDate:startDate,
		endDate:endDate
	});
	$(".showmore").click(function(){
		$(this).prev(".value_wrap").css({"height":"auto"});
		$(this).css({"visibility":"hidden"});
	});
	$(".showless").click(function(){
		$(this).parent(".value_wrap").animate({"height":"31px"},200);
		$(this).parent(".value_wrap").next(".showmore").css({"visibility":"visible"});
	});
	//初始化地址列表
	$.post("<%=basePath %>pc/cart/rent/addrList",{type:"bus"},function(data){
		var addrList=data.list;
		for(var i=0;i<addrList.length;i++){
			$("#getCityId").append('<option value="'+addrList[i].id+'">'+addrList[i].name+'</option>');
			$("#loseCityId").append('<option value="'+addrList[i].id+'">'+addrList[i].name+'</option>');
		}
		
		var getCityId="${getStore.city_id}";
		var loseCityId="${loseStore.city_id}";
		
		var search1 = function(){};
		var search2 = function(){};
		
		if(getCityId!=""){
			$("#getCityId").val(getCityId);
			search1 = doSearch;
		}
		if(loseCityId!=""){
			$("#loseCityId").val(loseCityId);
			search2 = doSearch;
		}
		
		if(getCityId != "" && loseCityId != "") search1 = function(){};
		
		//初始化选择
		findGetStore($("#getCityId"),"${getStore.area}","${getStore.id}",search1);
		findGetStore($("#loseCityId"),"${loseStore.area}","${loseStore.id}",search2);
	});
	
	$(".sortwrap a").click(function(){
		var $this = $(this);
		$this.addClass("active").siblings().removeClass("active");
		var param = $this.attr("data-cmd");
		var sort = $this.attr("data-sort");
		if(param != "cb.create_time"){
			if("desc" == sort){
				$this.removeClass("sort-res").addClass("sort-des");
				$this.attr("data-sort","asc");
			}
			if("asc" == sort){
				$this.removeClass("sort-des").addClass("sort-res");
				$this.attr("data-sort","desc");
			}
		}
		$("#orderBy").val(param+" "+sort);
		doSearch();
	});
	
});

var modal = '<li>'+
'				<a href="pc/cart/bus/detail/?op=bus"><img src="" height="100" width="160" alt=""></a>'+
'				<div class="info ml10">'+
'					<p><i class="iicon i-aim"></i><span class="f14"></span></p>'+
'					<p><i class="iicon i-pos"></i><span name="brand"></p>'+
'					<p><i class="iicon i-pnum"></i><span name="seating"><span></p>'+
'				</div>'+
'				<div class="info">'+
'					<p><i class="iicon i-dtime"></i>发车时间：<span class="grey9" name="from"></span></p>'+
'					<p><i class="iicon i-dtime"></i>预计到达时间：<span class="grey9" name="to"></span></p>'+
'					<p><i class="iicon i-rate"></i>客座率<span class="lorange" name="ple"></span></p>'+
'				</div>'+
'				<div class="cprice">'+
'					<span class="lorange">￥<span class="bold f24"></span></span><br />'+
'					<a href="pc/cart/destine?op=rent" class="btn formbtn orgbtn">预订</a>'+
'				</div>'+
'			</li>';




function gotoPage(goNo){
	pageNo = parseInt(goNo);
	doSearch();
}

function goPage(){
	/* pageNo = $("#gotopage").val();
	doSearch(); */
	pageNo = $("#gotopage").val();
	if(parseInt(pageNo)>totalPage){
		$("#gotopage").val(totalPage);
		valTips("gotopage", "输入页数大于当前最大页数");
	}else{
		doSearch();
	}
}

function initPage(){
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
		var thisNo=parseInt(pageNo)+i;
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


function findGetStore(obj,countyId,storeId,callback){
	//console.info(countyId);
	var getCityId=$(obj).val();
	$(obj).prevAll(".select-text").html($(obj).find("option[value="+getCityId+"]").html());
	var id=$(obj).attr("id").replace("City","Store");
	var o={};
	o.id=getCityId;
	o.type="bus";//
	$.post("<%=basePath %>pc/cart/rent/getCounty",o,function(data){
		var list=data.list;
		$("#"+id+" div:eq(0)").html("");
		for(var i=0;i<list.length;i++){
			if(i==0){
				$("#"+id+" div:eq(0)").append('<span  class="current" onclick="selectCounty(this,\'\')" val='+list[i].id+'>'+list[i].name+'</span>');
			}else{
				$("#"+id+" div:eq(0)").append('<span onclick="selectCounty(this,\'\')" val='+list[i].id+'>'+list[i].name+'</span>');
			}
		}
		initCounty();
		//console.info(countyId);
		if(countyId==""){
			$("#"+id+" div:eq(0) span:eq(0)").click();
		}else{
			selectCounty($("#"+id+" div:eq(0) span[val="+countyId+"]"),storeId,callback);
		}
	})
}

function selectCounty(obj,storeId,callback){
	var countyId=$(obj).attr("val")
	var id=$(obj).parents(".popbox").attr("id");
	var type="bus";//地址类型
	$.post("<%=basePath %>pc/cart/rent/getStore",{id:countyId,type:type},function(data){
		var list=data.list;
		$("#"+id+" div:eq(1)").html("");
		for(var i=0;i<list.length;i++){
			if(i==0){
				$("#"+id+" div:eq(1)").append('<span class="current" openTime='+list[i].open_time+' phone='+list[i].link_tel+' addr='+list[i].addr_detail+' val='+list[i].id+'>'+list[i].store+'</span>');
			}else{
				$("#"+id+" div:eq(1)").append('<span  openTime='+list[i].open_time+' phone='+list[i].link_tel+' addr='+list[i].addr_detail+' val='+list[i].id+'>'+list[i].store+'</span>');
			}
		}
		initCounty();
		$("#"+id+" div:eq(1) span:eq(0)").click();
		$("#"+id+" div:eq(1) span[val="+storeId+"]").click();
		callback();
	});
}


function initCounty(){
	$(".popbox .spanwrap span").click(function(e){
		var _text = $(this).text();
		var _phone=$(this).attr("phone");
		var _addr=$(this).attr("addr");
		var _openTime=$(this).attr("openTime");
		stopPropagation(e);
		$(this).parent(".spanwrap").find("span.current").removeClass("current");
		$(this).addClass("current");
		if( $(this).parent(".spanwrap").hasClass("showvalue") ){
			var str="地址："+_addr+"<br>电话："+_phone+"<br>营业时间:"+_openTime;
			$(this).parents(".haspopbox").find(".select-text").text( _text );
			$(this).parents(".showvalue").next(".lh2").html(str);
		}
	});
}

</script>
</body>
</html>