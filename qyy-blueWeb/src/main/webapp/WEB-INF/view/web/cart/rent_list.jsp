<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transition al.dtd"><%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../../static/inc_web.jsp" %>
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv = "X-UA-Compatible" content = "IE=edge,chrome=1 " /><meta charset="utf-8"> 
<title>快旅－租车</title>
<!-- 日期时间控件 -->
<link href="static/web/js/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link href="static/web/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
<link rel="stylesheet" href="static/web/css/common.css" />
<link rel="stylesheet" href="static/web/css/inner.style.css" />
<link rel="stylesheet" href="static/web/css/quick.travel.css" />
<style type="text/css">
.value_wrap a{
	border: 1px solid #ffffff
}
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
			<div class="breadcrumb">当前位置：<a href="pc/home">首页</a><a href="pc/cart/home">快旅出行</a><span>租车</span></div>
			<div class="lpart">
				<ul class="category">
					<li class="active"><a href="pc/cart/rent/list"><i class="iicon i-quicktype1"></i>快旅租车</a></li>
					<li><a href="pc/cart/wrap/list"><i class="iicon i-quicktype2"></i>快旅包车</a></li>
					<li><a href="pc/cart/bus/list"><i class="iicon i-quicktype3"></i>快旅班车</a></li>
					<li><a href="pc/cart/pool/list"><i class="iicon i-quicktype3"></i>快旅拼车</a></li>
				</ul>
			</div>
			<div class="rpart f12">
			<form action="pc/cart/rent/list" method="post" id="serchForm">
			<input type="hidden" name="typeId" id="typeValue">
			<input type="hidden" name="brandId" id="brandValue">
			<input type="hidden" name="serchPrice" id="priceValue">
			<input type="hidden" name="getStoreId" id="getStoreValue">
			<input type="hidden" name="loseStoreId" id="loseStoreValue">
			<input type="hidden" name="pageNo" id="pageNo" value="${pageNo }">
			<input type="hidden" name="sort" id="sort" value="">
				
				<!-- 链接模板 -->
				<a href="javascript:;" class="ctgvalue aModel" style="display: none;">雪佛兰</a>
				<div class="shadow whitebg mb10">
					<!-- 分类筛选条件 -->
					<div class="ctgallwrap ctgtype2">
						<div class="ctgselect_wrap">
							<span class="ctgname">类型</span>
							<div class="value_wrap" id="type">
								<a href="javascript:;" val="" class="ctgvalue labs active">不限</a>
								<span class="showless">品牌收起 ^</span>
							</div>
							<span class="showmore">查看全部 v</span>
						</div>
						<div class="ctgselect_wrap borderb1">
							<span class="ctgname">品牌</span>
							<div class="value_wrap" id="brand">
								<a href="javascript:;" val="" class="ctgvalue labs active">不限</a>
								<!-- <span class="showless">品牌收起 ^</span> -->
							</div>							
							<!-- <span class="showmore hidden">查看全部 v</span> -->
						</div>
						<div class="ctgselect_wrap">
							<span class="ctgname">日租金</span>
							<div class="value_wrap" id="priceInterval">
								<a href="javascript:;" val="" class="ctgvalue labs active">不限</a>
							</div>	
						</div>
					</div>
				</div>
				<div class="shadow whitebg mb10" style="padding:20px 20px 10px;">
					<div class="fitemwrap">
						<span class="item-title">取车地点</span>
						<div class="form-item select-item mr10" style="width:186px;">
							<span class="select-text">贵阳</span>
							<i class="iicon i-select"></i>
							<select name="getCityId" id="getCityId" onchange="findGetStore(this,'','')">
								<!-- <option value="">贵阳</option> -->
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
							<span class="select-text">请选择取车门店</span>
							<i class="iicon i-select"></i>
							<div class="popbox large r-pos" value="" id="getStoreId">
								<i class="iicon i-close"></i>
								<h4>所有门店</h4>
								<div class="spanwrap" style="border-bottom: 1px solid #ffb199">
									<span>机场／火车站</span>
									<span>云岩区</span>
									<span>南明区</span>
									<span>全羊区</span>
									<span>关山湖区</span>													
								</div>
								<div class="spanwrap showvalue">
									<span class="current">龙洞堡机场店</span>
									<span>贵阳高铁北站服务点</span>
									<span>贵阳火车站点</span>
								</div>
								<div class="desc lh2">地址：贵阳龙暴动机场长途换成站内（国内到达11号门右手边电梯至负
    一楼，沿长途换乘站指示牌到达换乘站内）<br/>
    							电话：0987-3564885<br/>
    							营业时间：00：00-24：00
								</div>
							</div>
						</div>
					</div>
					<div class="fitemwrap">
						<span class="item-title">还车地点</span>
						<div class="form-item select-item mr10" style="width:186px;">
							<span class="select-text">贵阳</span>
							<i class="iicon i-select"></i>
							<select name="loseCityId" id="loseCityId" onchange="findGetStore(this,'','')">
								<!-- <option value="">贵阳</option> -->
							</select>
						</div>
						<div class="form-item select-item haspopbox" style="width:160px;">
							<span class="select-text">请选择取车门店</span>
							<i class="iicon i-select"></i>
							<div class="popbox large r-pos"  value="" id="loseStoreId">
								<i class="iicon i-close"></i>
								<h4>所有门店</h4>
								<div class="spanwrap" style="border-bottom: 1px solid #ffb199">
									<span>机场／火车站</span>
									<span>云岩区</span>
									<span>南明区</span>
									<span>全羊区</span>
									<span>关山湖区</span>													
								</div>
								<div class="spanwrap showvalue">
									<span class="current">龙洞堡机场店</span>
									<span>贵阳高铁北站服务点</span>
									<span>贵阳火车站点</span>
								</div>
								<div class="desc lh2">地址：贵阳龙暴动机场长途换成站内（国内到达11号门右手边电梯至负
    一楼，沿长途换乘站指示牌到达换乘站内）<br/>
    							电话：0987-3564885<br/>
    							营业时间：00：00-24：00
								</div>
							</div>
						</div>
					</div>
					<div class="fitemwrap">
						<span class="item-title">取车时间</span>
						<div class="form-item inline" style="width:186px;">
							<i class="iicon i-date"></i>
							<input class="datetime form-control" id="startTime" value="${startDate }" readonly type="text" placeholder="请选择日期" />
						</div>						
					</div>
					<div class="fitemwrap clearfix">
						<a href="javascript:;" id="doSearch" class="btn lorgbtn fr">选车</a>
						<span class="item-title">还车时间</span>
						<div class="form-item inline" style="width:186px;">
							<i class="iicon i-date"></i>
							<input class="datetime form-control" id="endTime" readonly value="${endDate }" type="text" placeholder="请选择日期" />
						</div>
					</div>
				</div>
				</form>
				<!-- 车辆列表 -->
				<div class="shadow whitebg mb10">
					<!-- 排序 -->
					<div class="sortwrap clearfix">
						<a class="active" href="javascript:;" onclick="priceSort(this)">默认</a>
						<a class="sort-des" href="javascript:;" onclick="priceSort(this)">价格<i class="iicon"></i></a>
					</div>
					<ul>
						<li class="liModel">
							<a href="javascript:;"><img src="static/web/img/car.jpg" height="100" width="160" alt=""></a>
							<div class="info">
								<p><img class="avatar" src="static/web/img/carlogo.jpg" height="27" width="27" alt=""></p>
								<p><i class="iicon i-type"></i></p>
								<p><i class="iicon i-pnum"></i></p>
							</div>
							<div class="cprice"><span class="lorange">￥<span class="bold f24"></span></span>/日均</div>
							<a href="javascript:;" class="btn formbtn orgbtn">预订</a>
						</li>
					</ul>
					<div class="carprolist_wrap">
						<ul class="carlist">
							
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
var totalPage=0;//总页数
var pageNo=0;//当前页

var getLoadFlag=0;
var loseLoadFlag=0;

$(function(){
	
	
	popBoxInit();
	
	//showModalDialog();
	
	scrollBannerInit($(".banner-ul"),$(".banner-btn"));
	$('.datetime').datetimepicker({
		autoclose:1,
		format:"yyyy-mm-dd hh:ii",
		minView: 0,
		todayBtn: true,
		language : "zh-CN"
	});
	/* $(".showmore").click(function(){
		$(this).prev(".value_wrap").css({"height":"auto"});
		$(this).css({"visibility":"hidden"});
	});
	$(".showless").click(function(){
		$(this).parent(".value_wrap").animate({"height":"31px"},200);
		$(this).parent(".value_wrap").next(".showmore").css({"visibility":"visible"});
	}); */
	
	//初始化品牌列表
	$.post("<%=basePath %>pc/cart/rent/brandList",{type:"rent"},function(data){
		var brandList=data.list;
		for(var i=0;i<brandList.length;i++){
			/* $("#brand").append($(".aModel").clone());
			$(".aModel:last").html(brandList[i].brand);
			$(".aModel:last").attr("val",brandList[i].id);
			$(".aModel:last").show();
			$(".aModel:last").removeClass("aModel"); */
			$("#brand").prepend('<a href="javascript:;" val="'+brandList[i].id+'" class="ctgvalue">'+brandList[i].brand+'</a>');
		}
		//初始化点击事件
		$("#brand a").bind("click",function(){
			//$("#brand a").removeClass("active");
			$(this).toggleClass("active");
			if($(this).attr("val")!=''){
				$("#brand a[val='']").removeClass("active");
			}else{
				//$("#brand a[val='']").hasClass("active");
				$("#brand a").removeClass("active");
				$("#brand a[val='']").addClass("active");
			}
			if($("#brand .active").length==0){
				$("#brand a[val='']").addClass("active");
			}
		});
		$(".showmore").click(function(){
			$(this).prev(".value_wrap").css({"height":"auto"});
			$(this).css({"visibility":"hidden"});
		});
		$(".showless").click(function(){
			$(this).parent(".value_wrap").animate({"height":"31px"},200);
			$(this).parent(".value_wrap").next(".showmore").css({"visibility":"visible"});
		});
		$(".showless").click();
	});
	
	//初始化类型列表
	$.post("<%=basePath %>pc/cart/rent/typeList",{type:"rent"},function(data){
		var typeList=data.list;
		for(var i=0;i<typeList.length;i++){
			$("#type").prepend('<a href="javascript:;" val="'+typeList[i].id+'" class="ctgvalue">'+typeList[i].car_type+'</a>');
		}
		//初始化点击事件
		$("#type a").bind("click",function(){
			$(this).toggleClass("active");
			if($(this).attr("val")!=''){
				$("#type a[val='']").removeClass("active")
			}else{
				//$("#type a[val='']").hasClass("active");
				$("#type a").removeClass("active");
				$("#type a[val='']").addClass("active");
			}
			if($("#type .active").length==0){
				$("#type a[val='']").addClass("active");
			}
		});
	});
	
	//初始化价格列表
	$.post("<%=basePath %>pc/cart/rent/priceIntervalList",{type:"car_rent"},function(data){
		var priceList=data.list;
		for(var i=0;i<priceList.length;i++){
			$("#priceInterval").append('<a href="javascript:;" val="'+priceList[i].id+'" class="ctgvalue">￥'+priceList[i].depict+'</a>');
		}
		//初始化点击事件
		$("#priceInterval a").bind("click",function(){
			$("#priceInterval a").removeClass("active");
			$(this).addClass("active");
		});
	});
	
	//初始化地址列表
	$.post("<%=basePath %>pc/cart/rent/addrList",{type:"rent"},function(data){
		var addrList=data.list;
		for(var i=0;i<addrList.length;i++){
			$("#getCityId").append('<option value="'+addrList[i].id+'">'+addrList[i].name+'</option>');
			$("#loseCityId").append('<option value="'+addrList[i].id+'">'+addrList[i].name+'</option>');
		}
		//初始化选择
		var getCityId="${getStore.city_id}";
		var loseCityId="${loseStore.city_id}";
		if(getCityId!=""){
			$("#getCityId").val(getCityId);
		}
		if(getCityId!=""){
			$("#loseCityId").val(loseCityId);
		}
		findGetStore($("#getCityId"),"${getStore.area}","${getStore.id}");
		findGetStore($("#loseCityId"),"${loseStore.area}","${loseStore.id}");
	});
	
	$(".liModel").hide();
	
	$("#doSearch").click(function(){
		var getDate=simpleFormatDate($("#startTime").val());
		var loseDate=simpleFormatDate($("#endTime").val());
		if((loseDate.getTime()-24*60*60*1000+1)<=getDate.getTime()){
			valTips("endTime", "还车时间必须大于租车时间一天");
		}else{
			doSerch();
		}
	});
	
	//doSerch();
	
});

function doSerch(){
	
	//将选中的值设置到form表单中
	var type="";
	var brand="";
	var getStoreId="";
	var getStoreId="";
	$("#type .active").each(function(){
		type+=$(this).attr("val")+",";
	})
	$("#brand .active").each(function(){
		brand+=$(this).attr("val")+",";
	});
	$("#typeValue").val(type);
	$("#brandValue").val(brand);
	$("#priceValue").val($("#priceInterval .active").attr("val"));
	$("#getStoreValue").val($("#getStoreId div:eq(1) .current").attr("val"));
	$("#loseStoreValue").val($("#loseStoreId div:eq(1) .current").attr("val"));
	
	//发送查询请求
	//console.info(serializeObject($("#serchForm")));
	$.post("<%=basePath %>pc/cart/rent/getListData",serializeObject($("#serchForm")),function(data){
		var list=data.list;
		$(".carlist").html("");
		for(var i=0;i<list.length;i++){
			$(".carlist").append($(".liModel").clone());
			var url=list[i].pic_url;
			var logoUrl="static/web/img/carlogo.jpg";//默认品牌logo图片
			$(".liModel:last img").attr("src",url);
			
			$(".liModel:last .info p:eq(0)").html('<i class="iicon i-pos"></i>'+list[i].brand);
			//$(".liModel:last .info p:eq(0)").html('<img class="avatar" src="'+logoUrl+'" height="27" width="27" alt="">'+list[i].brand);
			$(".liModel:last .info p:eq(1)").html('<i class="iicon i-type"></i>'+list[i].gearbox);
			$(".liModel:last .info p:eq(2)").html('<i class="iicon i-pnum"></i>乘坐'+list[i].seating+'人');
			$(".liModel:last .f24").html(list[i].price);
			var url="pc/cart/rent/detail/"+list[i].id;
			$(".liModel:last a:eq(0)").attr("val",list[i].id);
			$(".liModel:last a:eq(0)").bind("click",function(){
				var id=$(this).attr("val");
				data.getStoreId=$("#getStoreId div:eq(1) .current").attr("val");
				data.loseStoreId=$("#loseStoreId div:eq(1) .current").attr("val");
				data.startTime=$("#startTime").val();
				data.endTime=$("#endTime").val();
				//window.location.href="pc/cart/rent/detail/"+id+"_"+getStoreId+"_"+loseStoreId;
				subWebForm("<%=basePath %>pc/cart/rent/detail/"+id,data);
			});
			
			$(".liModel:last a:eq(1)").attr("val",list[i].id);
			$(".liModel:last a:eq(1)").bind("click",function(){
				var data={};
				data.id=$(this).attr("val");
				data.getStoreId=$("#getStoreId div:eq(1) .current").attr("val");
				data.loseStoreId=$("#loseStoreId div:eq(1) .current").attr("val");
				data.startTime=$("#startTime").val();
				data.endTime=$("#endTime").val();
				//window.location.href="pc/cart/rent/detail/"+id+"_"+getStoreId+"_"+loseStoreId;
				//console.info(data);
				subWebForm("<%=basePath %>pc/cart/rent/goSubmitOrder",data);
			});
			$(".liModel:last").show();
			$(".liModel:last").removeClass("liModel");
		}
		totalPage=data.totalPage;
		pageNo=data.pageNo;
		initPage();
	})
}

function priceSort(obj){
	if($(obj).hasClass("active")){
		if($(obj).hasClass("sort-des")){
			$(obj).removeClass("sort-des");
			$(obj).addClass("sort-res");
		}else if($(obj).hasClass("sort-res")){
			$(obj).addClass("sort-des");
			$(obj).removeClass("sort-res");
		}
	}else{
		$(".sortwrap a").removeClass("active");
		$(obj).addClass("active");
	}
	if($(".sortwrap .active").hasClass("sort-res")){
		$("#sort").val("desc");
	}else if($(".sortwrap .active").hasClass("sort-des")){
		$("#sort").val("asc");
	}else{
		$("#sort").val("");
	}
	//console.info($("#sort").val());
	doSerch();
}

function findGetStore(obj,countyId,storeId){
	//console.info(countyId);
	var getCityId=$(obj).val();
	$(obj).prevAll(".select-text").html($(obj).find("option[value="+getCityId+"]").html());
	var id=$(obj).attr("id").replace("City","Store");
	var o={};
	o.id=getCityId;
	o.type="rent";//
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
			selectCounty($("#"+id+" div:eq(0) span[val="+countyId+"]"),storeId);
		}
	})
}

function selectCounty(obj,storeId){
	var countyId=$(obj).attr("val")
	var id=$(obj).parents(".popbox").attr("id");
	var type="rent";//地址类型
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
		if(storeId!=""){
			$("#"+id+" div:eq(1) span[val="+storeId+"]").click();
		}
		checkInitList(id);
	});
}

/**
 * 该方法用于第一次进入List页面时，根据所选的两个地址来初始化列表
 * 因为地址列表需要通过ajax请求，无法在初始化方法中直接执行
 * 并且由于开始和结束地点分别都需要一个ajax来完成加载，所以由此方法来调用初始化
 */
function checkInitList(id){
	if(id.lastIndexOf("get")!=-1){
		if(loseLoadFlag==1&&getLoadFlag==0){
			doSerch();
		}
		getLoadFlag=1;
	}else{
		if(loseLoadFlag==0&&getLoadFlag==1){
			doSerch();
		}
		loseLoadFlag=1;
	}
}


function gotoPage(goNo){
	$("#pageNo").val(parseInt(goNo));
	$("#doSearch").click();
}

function goPage(){
	$("#pageNo").val($("#gotopage").val());
	if(parseInt($("#gotopage").val())>totalPage){
		$("#gotopage").val(totalPage);
		valTips("gotopage", "输入页数大于当前最大页数");
	}else{
		$("#doSearch").click();
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
	pageDiv.append('<input onclick="goPage()" type="button" value="确定" />');
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

//格式化时间，只能格式化  yyyy-MM-dd hh:mm格式的时间
function simpleFormatDate(dateTimeStr){
	var dateTimeArr=dateTimeStr.split(" ");
	var dateStr=dateTimeArr[0];
	var timeStr=dateTimeArr[1];
	
	var dateArr=dateStr.split("-");
	var year=dateArr[0];
	var month=dateArr[1];
	var day=dateArr[2];
	
	var timeArr=timeStr.split(":");
	var h=timeArr[0];
	var m=timeArr[1];
	return new Date(year,month,day,h,m,0);
}
</script>
</body>
</html>