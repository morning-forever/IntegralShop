<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transition al.dtd"><%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../../static/inc_web.jsp" %>
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv = "X-UA-Compatible" content = "IE=edge,chrome=1 " /><meta charset="utf-8"> 
<title>快旅出行</title>
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
	<div class="content_wrap pt20 pb90">
		<div class="content whitebg">
			<!-- 租车 -->
			<h4 class="orangeh4"><i class="iicon i-quicktype1"></i>租车</h4>
			<div class="box-section clearfix">
				<div class="l-part">
					<h5>租车规则：</h5>
					<p> ${rules.rent }</p>
				</div>
				<div class="r-part">
					<div class="fitemwrap">
						<span class="item-title">取车地点</span>
						<div class="form-item select-item mr10" style="width:186px;">
							<span class="select-text">贵阳</span>
							<i class="iicon i-select"></i>
							<select name="getRentCityId" id="getRentCityId" onchange="findRentStore(this)">
							</select>
						</div>
						<div class="form-item select-item haspopbox" style="width:160px;">
							<span class="select-text">请选择取车门店</span>
							<i class="iicon i-select"></i>
							<div class="popbox large r-pos" value="" id="getRentStoreId">
								<i class="iicon i-close"></i>
								<h4>所有门店</h4>
								<div class="spanwrap" style="border-bottom: 1px solid #ffb199">
								</div>
								<div class="spanwrap showvalue">
									<span class="current"></span>
									<span></span>
									<span></span>
								</div>
								<div class="desc lh2">
								</div>
							</div>
						</div>
					</div>
					<div class="fitemwrap">
						<span class="item-title">还车地点</span>
						<div class="form-item select-item mr10" style="width:186px;">
							<span class="select-text">贵阳</span>
							<i class="iicon i-select"></i>
							<select name="getRentCityId" id="loseRentCityId" onchange="findRentStore(this)">
							</select>
						</div>
						<div class="form-item select-item haspopbox" style="width:160px;">
							<span class="select-text">请选择取车门店</span>
							<i class="iicon i-select"></i>
							<div class="popbox large r-pos" value="" id="loseRentStoreId">
								<i class="iicon i-close"></i>
								<h4>所有门店</h4>
								<div class="spanwrap" style="border-bottom: 1px solid #ffb199">
								</div>
								<div class="spanwrap showvalue">
									<span class="current"></span>
									<span></span>
									<span></span>
								</div>
								<div class="desc lh2">
								</div>
							</div>
						</div>
					</div>
					<div class="fitemwrap">
						<span class="item-title">取车时间</span>
						<div class="form-item inline" style="width:186px;">
							<i class="iicon i-date"></i>
							<input class="datetime form-control" id="getRentTime" name="getRentTime" readonly type="text" placeholder="请选择日期" />
						</div>						
					</div>
					<div class="fitemwrap">
						<span class="item-title">还车时间</span>
						<div class="form-item inline" style="width:186px;">
							<i class="iicon i-date"></i>
							<input class="datetime form-control" id="loseRentTime" name="loseRentTime" readonly type="text" placeholder="请选择日期" />
						</div>						
					</div>
				</div>
			</div>
			<div class="tc pb20"><a href="javascript:goRent();" class="btn lorgbtn">去选车</a></div>

			<!-- 包车 -->
			<h4 class="orangeh4"><i class="iicon i-quicktype1"></i>包车</h4>
			<div class="box-section clearfix">
				<div class="l-part">
					<h5>包车规则：</h5>
					<p> ${rules.wrap }</p>
				</div>
				<div id="wrapDiv" class="r-part">
					<div class="fitemwrap">
						<span class="item-title">包车类型</span>
						<div class="form-item select-item mr10" style="width:186px;">
							<span class="select-text">请选择包车类型</span>
							<i class="iicon i-select"></i>
							<select name="" id="wrapType">
								<!-- <option value="">贵阳</option>
								<option value="">类型2</option> -->
							</select>
						</div>
						包车数量
						<span class="pronum_unit ml10"><button class="des_btn disabled">-</button><input type="text" id="wrapNum"/><button class="res_btn">+</button></span>	
					</div>	
					<div class="fitemwrap">
						<span class="item-title">出发时间</span>
						<div class="form-item inline" style="width:186px;">
							<i class="iicon i-date"></i>
							<input class="datetime form-control" readonly type="text" id="startWrapTime" placeholder="请选择日期" />
						</div>						
					</div>
					<div class="fitemwrap">
						<span class="item-title">结束时间</span>
						<div class="form-item inline" style="width:186px;">
							<i class="iicon i-date"></i>
							<input class="datetime form-control" readonly type="text" id="endWrapTime" placeholder="请选择日期" />
						</div>						
					</div>					
					<div class="fitemwrap">
						<span class="item-title">出发地</span>
						<input type="hidden" name="startAddrId" value="0">
						<div class="form-item select-item mr10" style="width: 140px;">
							<span class="select-text">贵阳市</span>
							<i class="iicon i-select"></i>
							<select id="fromCityId">
								<c:forEach items="${addrList }" var="addr">
									<option value="${addr.id }">${addr.name }</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-item inline" style="width: 160px;">
							<input type="text" placeholder="请填写地址" id="fromAddrDetail" />
						</div>
					</div>
					<div class="fitemwrap toaddress">
						<span class="item-title">目的地</span>
						<div class="form-item select-item mr10" style="width: 140px;">
							<span class="select-text">贵阳市</span>
							<i class="iicon i-select"></i>
							<select name="getCityId" id="getCityId" onchange="findGetStore(this)">
								<c:forEach items="${addrList }" var="addr">
									<option value="${addr.id }">${addr.name }</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-item select-item haspopbox" style="width:140px;">
							<span class="select-text" name="destArea">请选择取目的地</span>
							<i class="iicon i-select"></i>
							<div class="popbox large r-pos" value="" id="getStoreId">
								<i class="iicon i-close"></i>
								<h4>所有目的地</h4>
								<div class="spanwrap" style="border-bottom: 1px solid #ffb199">
									<span>机场／火车站</span>
									<span>云岩区</span>
									<span>南明区</span>
									<span>全羊区</span>
									<span>关山湖区</span>													
								</div>
								<div class="spanwrap showvalue" name="endAddrId">
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
							<span name="addaim" class="addbtn iicon" 
							style="margin-right: 1px; "></span>
						</div>	

				</div>
			</div>
			<div class="tc pb20"><a href="javascript:;" onclick="toWrapPage()" class="btn lorgbtn">去选车</a></div>

			<!-- 班车 -->
			<h4 class="orangeh4"><i class="iicon i-quicktype3"></i>班车</h4>
			<div class="box-section clearfix">
				<div class="l-part">
					<h5>班车规则：</h5>
					<p> ${rules.bus }</p>
				</div>
				<div class="r-part">
					<div class="fitemwrap">
						<span class="item-title">出发时间</span>
						<div class="form-item inline" style="width:186px;">
							<i class="iicon i-date"></i>
							<input class="datetime form-control" name="busStartTime" id="busStartTime" readonly type="text" placeholder="请选择日期" />
						</div>						
					</div>				
					<div class="fitemwrap">
						<span class="item-title">出发地</span>
						<div class="form-item select-item mr10" style="width:186px;">
							<span class="select-text">请选择出发城市</span>
							<i class="iicon i-select"></i>
							<select name="getBusCityId" id="getBusCityId" onchange="findBusStore(this)">
								<option value="0">请选择出发城市</option>
							</select>
						</div>
						<div class="form-item select-item haspopbox" style="width:160px;">
							<span class="select-text">请选择乘车地点</span>
							<i class="iicon i-select"></i>
							<div class="popbox large r-pos"  value="" id="getBusStoreId">
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
					<div class="fitemwrap">
						<span class="item-title">目的地</span>
						<div class="form-item select-item mr10" style="width:186px;">
							<span class="select-text">请选择到达城市</span>
							<i class="iicon i-select"></i>
							<select name="loseCityId" id="loseBusCityId" onchange="findBusStore(this)">
								<option value="0">请选择到达城市</option>
							</select>
						</div>
						<div class="form-item select-item haspopbox" style="width:160px;">
							<span class="select-text">请选择到达地点</span>
							<i class="iicon i-select"></i>
							<div class="popbox large r-pos"  value="" id="loseBusStoreId">
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
				</div>
			</div>
			<div class="tc pb20"><a href="javascript:toBusPage();" class="btn lorgbtn" >搜索</a></div>

			<!-- 拼车 -->
			<h4 class="orangeh4"><i class="iicon i-quicktype3"></i>拼车</h4>
			<div class="box-section clearfix">
				<div class="l-part">
					<h5>拼车规则：</h5>
					<p> ${rules.carpool }</p>
				</div>
				<div class="r-part">
					<div class="form_box mt10 type2">
						<span class="inline f12 grey"><span class="red f12">* </span>出发时间</span>
						<div class="form-item inline mr20" style="width:186px;">
							<i class="iicon i-date"></i>
							<input value="${poolStartTime }" class="datetime form-control" id="poolStartTime" readonly type="text" />
						</div>
					</div>
					<div class="fitemwrap" id="fromCitys">
						<span class="item-title">出发地</span>
						<div class="form-item select-item mr10" style="width:186px;">
							<span class="select-text">请选择出发城市 </span>
							<i class="iicon i-select"></i>
							<select name="fromCity" id="fromCity" onchange="selectRentCounty(this);">
							</select>
						</div>
						
						<div class="form-item select-item haspopbox" style="width:160px;">
							<span class="select-text">请选择乘车地点</span>
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
						<span class="item-title">目的地</span>
						<div class="form-item select-item mr10" style="width:186px;">
							<span class="select-text">请选择到达城市 </span>
							<i class="iicon i-select"></i>
							<select name="toCity" id="toCity">
							</select>
						</div>
						<div class="form-item select-item haspopbox" style="width:160px;">
							<span class="select-text">请选择到达地点</span>
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
			</div>
			<div class="tc pb20">
				<a href="javascript:;" class="btn lorgbtn" onclick="goPoolList()">参与快旅拼车</a>
				<a href="javascript:;" class="btn lorgbtn" id="poolStart">发起快旅拼车</a>
			</div>
		</div>		
	</div>

	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	
 	<div id="addaimitem" style="display:none ">
			<div class="fitemwrap">
				<span class="item-title">出发地</span>
				<input type="hidden" name="startAddrId">
				<div class="form-item inline prevaddr" style="border:none 0;">							
				</div>
			</div>
			<div class="fitemwrap toaddress">
				<span class="item-title">目的地</span>
				<div class="form-item select-item mr10" style="width: 140px;">
					<span class="select-text">贵阳市</span>
					<i class="iicon i-select"></i>
					<select name="getCityIdOther" id="getCityIdOther" onchange="findGetStore(this)">
						<c:forEach items="${addrList }" var="addr">
							<option value="${addr.id }">${addr.name }</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-item select-item haspopbox" style="width:140px;">
					<span class="select-text" name="destArea">请选择取目的地</span>
					<i class="iicon i-select"></i>
					<div class="popbox large r-pos" value="" id="getStoreIdOther">
						<i class="iicon i-close"></i>
						<h4>所有目的地</h4>
						<div class="spanwrap" style="border-bottom: 1px solid #ffb199">
							<span>机场／火车站</span>
							<span>云岩区</span>
							<span>南明区</span>
							<span>全羊区</span>
							<span>关山湖区</span>													
						</div>
						<div class="spanwrap showvalue" name="endAddrId">
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
				<span name="deleteaim" class="resbtn iicon"></span>
			</div>
		</div>
		<div id="selectCarBtn" style="display: none;">
			<div class="fitemwrap" style="height: 40px;">
								<a id="searchBtn" href="javascript:;" onclick="doSearch()" class="btn lorgbtn abs">去选车</a>
							</div>
		</div>
	
</div>


<!-- 日期时间控件 -->
<script type="text/javascript" src="static/web/js/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="static/web/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="static/web/js/slide.js"></script>
<script type="text/javascript" src="static/web/js/index.js"></script>
<script type="text/javascript" src="static/web/js/base.js"></script>
<script type="text/javascript" src="static/web/js/quick.travel.js"></script>
<script type="text/javascript" src="static/web/js/select-car-addr.js"></script>

<script type="text/javascript">
var isTime = 0;
$(function(){
	//scrollBannerInit($(".banner-ul"),$(".banner-btn"));
	
	$('.ck-slide').ckSlide({
		autoPlay: true
	});
	
	$('#busStartTime').datetimepicker({
		autoclose:1,
		format:"hh:ii",
		language:'zh-CN',
		todayBtn: true
	});
	
	$('.datetime').datetimepicker({
		autoclose:1,
		format:"yyyy-mm-dd hh:ii",
		language:'zh-CN',
		todayBtn: true
	});
	selfDefineFormBtn();
	$('#poolStartTime').change(function(){
		$.post("<%=basePath %>pc/cart/valTime2Hour",{'startTime':$("#poolStartTime").val()},function(req){
			if(req.status=='fail'){
				isTime = 1;
				valTips("poolStartTime", "出发时间必须在当前时间的2小时后。");
			}else{
				isTime = 0;
			}
		},"JSON");
	});	
	
	
	InitPronum();
	// 包车增加目的地对话框
	/* var addAimDlg = new dialogBox({
		title : "包车",
		contentHtml : $("#addAimpopup").html(),
		popupBoxW : 760,
		coverhide : false,
		initEvent : function($dom){
			$dom.find('.datetime').datetimepicker({
				autoclose:1,
				format:"yyyy-mm-dd hh:ii",
				todayBtn: true
			});
			$dom.find("[name=addaim]").click(addAim);
			//initSelect( $(".fitemwrap").eq(-2) );
		}
	});	
	$("[name=addaim]").click(function(){
		addAimDlg.showDlg();
	}); */
	$('.datetime').datetimepicker({
		autoclose:1,
		format:"yyyy-mm-dd hh:ii",
		//minView: 2,
		todayBtn: true
	});
	
	/* 王冠中更新 */
	initRent();//初始化租车地点等信息
	var rentToDay=new Date();
	$("#getRentTime").val(rentToDay.format("yyyy-MM-dd hh:mm"));
	rentToDay.setTime(new Date().getTime()+24*60*60*1000);
	$("#loseRentTime").val(rentToDay.format("yyyy-MM-dd hh:mm"));
	
	/* 江恋更新 */
	initWrap();
	$("#startWrapTime").val(rentToDay.format("yyyy-MM-dd hh:mm"));
	$("#endWrapTime").val(rentToDay.format("yyyy-MM-dd hh:mm"));
	
	initBus();
	});

	/*页面重新绑定事件*/
	$(".popbox .spanwrap span").click(initCounty());

	$(document)
			.ready(
					function() {
						//初始化开始城市
						$("#fromAddrId").val(0);
						$("#toAddrId").val(0);
						var fromCitysDiv = $("#fromCitys");
						var toCitysDiv = $("#toCitys");
						initC(fromCitysDiv, toCitysDiv);
						var fromCity = fromCitysDiv.find("select:eq(0)");
						var toCity = toCitysDiv.find("select:eq(0)");
						fromCity.attr({
							onchange : "changeCity(this)"
						});
						$
								.post(
										"<%=basePath %>pc/cart/pool/fromCitys",
										{},
										function(req) {
											fromCity.empty();
											fromCity
													.append('<option value="0" >------请选择------</option>');
											var list = req.fromCitys;
											for ( var i in list) {
												var item = '<option value="'+list[i].id+'" val="'+list[i].name+'">'
														+ list[i].name
														+ '</option>';
												fromCity.append(item);
											}
										}, "JSON");

						toCity.attr({
							onchange : 'changeToCity(this)'
						});
						$("#fromAddrId")
								.change(
										function() {
											console.info("fromAddrId change:"
													+ this.value);
											$
													.post(
															"<%=basePath %>pc/cart/pool/toCitys",
															{
																'fromAddrId' : this.value
															},
															function(req) {
																toCity.empty();
																toCity
																		.append('<option value="0">------请选择------</option>');
																var list = req.toCitys;
																for ( var i in list) {
																	var item = '<option value="'+list[i].id+'" >'
																			+ list[i].name
																			+ '</option>';
																	toCity
																			.append(item);
																}
															}, "JSON");
										});

						$("#poolStart")
								.click(
										function() {
											var fromCityId = $("#fromCity")
													.val();
											var fromAddrId = $("#fromAddrId")
													.val();
											var toCityId = $("#toCity").val();
											var toAddrId = $("#toAddrId").val();
											var startTime = $("#poolStartTime")
													.val();

											if (!checkField(startTime)) {
												valTips("poolStartTime",
														"出发时间不能为空。");
												return;
											}
											$('.datetime').change();
											if (isTime == 1) {
												valTips("poolStartTime",
														"出发时间必须在当前时间的24小时后。");
												return;
											}

											if (!checkField(fromAddrId)
													|| fromAddrId == 0) {
												valTips($("#fromCitys").find(
														".select-item:last"),
														"出发地点不能为空。");
												return;
											}
											if (!checkField(toAddrId)
													|| toAddrId == 0) {
												valTips($("#toCitys").find(
														".select-item:last"),
														"到达地点不能为空。");
												return;
											}

											var json = {
												"fromCityId" : fromCityId,
												"fromAddrId" : fromAddrId,
												"toCityId" : toCityId,
												"toAddrId" : toAddrId,
												"startTime" : startTime
											};
											subWebForm(
													"<%=basePath %>pc/cart/pool/destineOrder",
													json);
										});
					});

	var initC = function(fromCitysDiv, toCitysDiv) {
		fromCitysDiv.find("#county").html('暂无');
		fromCitysDiv.find("#stroge").html('暂无');
		fromCitysDiv.find("#detail").html('暂无');
		toCitysDiv.find("#county").html('暂无');
		toCitysDiv.find("#stroge").html('暂无');
		toCitysDiv.find("#detail").html('暂无');
	};

	var changeToCity = function(obj) {
		var cityId = $(obj).val();
		var toCitysDiv = $("#toCitys");
		toCitysDiv.find("#county").html("");
		toCitysDiv.find(".form-item .select-text:eq(0)").html(
				obj.options[obj.selectedIndex].text);
		$.post("<%=basePath %>pc/cart/pool/toCountys", {
			"fromAddrId" : $("#fromAddrId").val(),
			'toCityId' : cityId
		}, function(data) {
			var list = data.toCountys;
			if (list == null || list == '') {
				toCitysDiv.find("#county").html('暂无');
				toCitysDiv.find("#stroge").html('暂无');
				toCitysDiv.find("#detail").html('暂无');
			}
			for (var i = 0; i < list.length; i++) {
				if (i == 0) {
					toCitysDiv.find("#county").append(
							'<span onclick=clickToCounty(this); class="current" val='
									+ list[i].id + '>' + list[i].name
									+ '</span>');
				} else {
					toCitysDiv.find("#county").append(
							'<span onclick=clickToCounty(this); val='
									+ list[i].id + '>' + list[i].name
									+ '</span>');
				}
			}
			toCitysDiv.find("#county span:eq(0)").click();
		});
	};

	/*选择区域*/
	var clickToCounty = function(obj) {
		var fromCitysDiv = $("#toCitys");
		fromCitysDiv.find("#stroge").html("");
		$
				.post(
						"<%=basePath %>pc/cart/pool/toAddrs",
						{
							"fromAddrId" : $("#fromAddrId").val(),
							'toCountyId' : $(obj).attr('val')
						},
						function(data) {
							var list = data.toAddrs;
							fromCitysDiv.find("#detail").empty();
							if (list == null || list == '') {
								fromCitysDiv.find("#detail").html('暂无');
							}
							for (var i = 0; i < list.length; i++) {
								if (i == 0) {
									fromCitysDiv
											.find("#stroge")
											.append(
													'<span name="strogeDetail" class="current" openTime="'+list[i].openTime+'" phone="'+list[i].linkTel+'" addr="'+list[i].addrDetail+'" val='+list[i].id+'>'
															+ list[i].store
															+ '</span>');
									fromCitysDiv.find("#detail").append(
											"地址：" + list[i].addrDetail
													+ "<br>电话："
													+ list[i].linkTel
													+ "<br>营业时间:"
													+ list[i].openTime);
									$("#addrsId").val(list[i].id);
								} else {
									fromCitysDiv
											.find("#stroge")
											.append(
													'<span  openTime="'+list[i].openTime+'" phone="'+list[i].linkTel+'" addr="'+list[i].addrDetail+'" val='+list[i].id+'>'
															+ list[i].store
															+ '</span>');
								}
							}
							fromCitysDiv.find("#stroge .current").click();
							initCounty();
						});
	};

	/*选择城市*/
	var changeCity = function(obj) {
		var cityId = $(obj).val();
		var fromCitysDiv = $("#fromCitys");
		fromCitysDiv.find("#county").html("");
		fromCitysDiv.find(".form-item .select-text:eq(0)").html(
				obj.options[obj.selectedIndex].text);
		$.post("<%=basePath %>pc/cart/pool/fromCountys", {
			"fromCityId" : cityId
		}, function(data) {
			var list = data.fromCountys;
			if (list == null || list == '') {
				fromCitysDiv.find("#county").html('暂无');
				fromCitysDiv.find("#stroge").html('暂无');
				fromCitysDiv.find("#detail").html('暂无');
			}
			for (var i = 0; i < list.length; i++) {
				if (i == 0) {
					fromCitysDiv.find("#county").append(
							'<span onclick=clickCounty(this); class="current" val='
									+ list[i].id + '>' + list[i].name
									+ '</span>');
				} else {
					fromCitysDiv.find("#county").append(
							'<span onclick=clickCounty(this); val='
									+ list[i].id + '>' + list[i].name
									+ '</span>');
				}
			}
			fromCitysDiv.find("#county span:eq(0)").click();
		});
	};

	/*选择区域*/
	var clickCounty = function(obj) {
		var fromCitysDiv = $("#fromCitys");
		fromCitysDiv.find("#stroge").html("");
		$
				.post(
						"<%=basePath %>pc/cart/pool/fromAddrs",
						{
							"fromCountyId" : $(obj).attr("val"),
							"type" : "bus"
						},
						function(data) {
							var list = data.fromAddrs;
							fromCitysDiv.find("#detail").empty();
							if (list == null || list == '') {
								fromCitysDiv.find("#detail").html('暂无');
							}
							for (var i = 0; i < list.length; i++) {
								if (i == 0) {
									fromCitysDiv
											.find("#stroge")
											.append(
													'<span name="strogeDetail" class="current" openTime="'+list[i].openTime+'" phone="'+list[i].linkTel+'" addr="'+list[i].addrDetail+'" val='+list[i].id+'>'
															+ list[i].store
															+ '</span>');
									fromCitysDiv.find("#detail").append(
											"地址：" + list[i].addrDetail
													+ "<br>电话："
													+ list[i].linkTel
													+ "<br>营业时间:"
													+ list[i].openTime);
									$("#addrsId").val(list[i].id);
								} else {
									fromCitysDiv
											.find("#stroge")
											.append(
													'<span  openTime="'+list[i].openTime+'" phone="'+list[i].linkTel+'" addr="'+list[i].addrDetail+'" val='+list[i].id+'>'
															+ list[i].store
															+ '</span>');
								}
							}
							fromCitysDiv.find("#stroge .current").click();
							initCounty();
						});
	};

	/*初始弹出div层的选择联动*/
	function initCounty() {
		$(".popbox .spanwrap span")
				.click(
						function(e) {
							var _text = $(this).text();
							var _phone = $(this).attr("phone");
							var _addr = $(this).attr("addr");
							var _openTime = $(this).attr("openTime");
							stopPropagation(e);
							if ('fromC' == $(this).parent(".spanwrap").parent(
									"div").attr('id')
									&& $(this).parent(".spanwrap").attr('id') == 'stroge') {
								$("#fromAddrId").val($(this).attr('val'));
								$("#fromAddrId").change();
							} else if ('fromT' == $(this).parent(".spanwrap")
									.parent("div").attr('id')
									&& $(this).parent(".spanwrap").attr('id') == 'stroge') {
								$("#toAddrId").val($(this).attr('val'));
								//$("#toAddrId").change();
							}
							$(this).parent(".spanwrap").find("span.current")
									.removeClass("current");
							$(this).addClass("current");
							if ($(this).parent(".spanwrap").hasClass(
									"showvalue")) {
								var str = "地址：" + _addr + "<br>电话：" + _phone
										+ "<br>营业时间:" + _openTime;
								$(this).parents(".haspopbox").find(
										".select-text").text(_text);
								$(this).parents(".showvalue").next(".lh2")
										.html(str);
							}
						});
	}

	//王冠中更新
	function findRentStore(obj) {
		var getCityId = $(obj).val();
		$(obj).prevAll(".select-text").html(
				$(obj).find("option[value=" + getCityId + "]").html());
		var id = $(obj).attr("id").replace("City", "Store");
		var o = {};
		o.id = getCityId;
		o.type = "rent";//
		$.post("<%=basePath %>pc/cart/rent/getCounty", o, function(data) {
			var list = data.list;
			$("#" + id + " div:eq(0)").html("");
			for (var i = 0; i < list.length; i++) {
				if (i == 0) {
					$("#" + id + " div:eq(0)").append(
							'<span  class="current" onclick="selectRentCounty(this)" val='
									+ list[i].id + '>' + list[i].name
									+ '</span>');
				} else {
					$("#" + id + " div:eq(0)").append(
							'<span onclick="selectRentCounty(this)" val='
									+ list[i].id + '>' + list[i].name
									+ '</span>');
				}
			}
			initCounty();
			$("#" + id + " div:eq(0) span:eq(0)").click();
		})
	}

	function selectRentCounty(obj) {
		var countyId = $(obj).attr("val")
		var id = $(obj).parents(".popbox").attr("id");
		var type = "rent";//地址类型
		$
				.post(
						"<%=basePath %>pc/cart/rent/getStore",
						{
							id : countyId,
							type : type
						},
						function(data) {
							var list = data.list;
							$("#" + id + " div:eq(1)").html("");
							for (var i = 0; i < list.length; i++) {
								if (i == 0) {
									$("#" + id + " div:eq(1)")
											.append(
													'<span class="current" openTime="'+list[i].open_time+'" phone="'+list[i].link_tel+'" addr="'+list[i].addr_detail+'" val='+list[i].id+'>'
															+ list[i].store
															+ '</span>');
								} else {
									$("#" + id + " div:eq(1)")
											.append(
													'<span  openTime="'+list[i].open_time+'" phone="'+list[i].link_tel+'" addr="'+list[i].addr_detail+'" val='+list[i].id+'>'
															+ list[i].store
															+ '</span>');
								}
							}
							initCounty();
							$("#" + id + " div:eq(1) span:eq(0)").click();
						});
	}

	function initRent() {
		//初始化地址列表
		$.post("<%=basePath %>pc/cart/rent/addrList", {
			type : "rent"
		}, function(data) {
			var addrList = data.list;
			for (var i = 0; i < addrList.length; i++) {
				$("#getRentCityId").append(
						'<option value="'+addrList[i].id+'">'
								+ addrList[i].name + '</option>');
				$("#loseRentCityId").append(
						'<option value="'+addrList[i].id+'">'
								+ addrList[i].name + '</option>');
			}
			//初始化选择
			findRentStore($("#getRentCityId"));
			findRentStore($("#loseRentCityId"));
		});
	}
	
	

	function goRent() {
		var data = {};
		//data.getCityId=$("#getRentCityId").val();
		data.getStoreId = $("#getRentStoreId div:eq(1) .current").attr("val");
		//data.loseCityId=$("#loseRentCityId").val();
		data.loseStoreId = $("#loseRentStoreId div:eq(1) .current").attr("val");
		data.getRentTime = $("#getRentTime").val();
		data.loseRentTime = $("#loseRentTime").val();
		var getDate = simpleFormatDate(data.getRentTime);
		var loseDate = simpleFormatDate(data.loseRentTime);
		if ((loseDate.getTime() - 24 * 60 * 60 * 1000) <= getDate.getTime()) {
			valTips("loseRentTime", "还车时间必须大于租车时间一天");
		} else {
			subWebForm("pc/cart/rent/list",data);
		}
	}

	//格式化时间，只能格式化  yyyy-MM-dd hh:mm格式的时间
	function simpleFormatDate(dateTimeStr) {
		var dateTimeArr = dateTimeStr.split(" ");
		var dateStr = dateTimeArr[0];
		var timeStr = dateTimeArr[1];

		var dateArr = dateStr.split("-");
		var year = dateArr[0];
		var month = dateArr[1];
		var day = dateArr[2];

		var timeArr = timeStr.split(":");
		var h = timeArr[0];
		var m = timeArr[1];
		return new Date(year, month, day, h, m, 0);
	}
	
	//初始化包车信息
	function initWrap(){
		$("#wrapDiv [name=addaim]").click(addAim);
		
		//初始化包车类型
		$.post("<%=basePath %>pc/cart/wrap/getWrapTypeList", null , function(data) {
			var list = data.list;
			for (var i = 0; i < list.length; i++) {
				$("#wrapType").append(
						'<option value="'+list[i].seating+'">'
								+ list[i].seating + '座</option>');
				
			}
		});
		$(".select-item select").change();
		findGetStore($("#getCityId"));
	}
	
	//跳转到包车列表页面
	function toWrapPage(){
		var startAddrIds = "";
		var endAddrIds = "";
		$("input[name=startAddrId]").each(function(){
			startAddrIds += $(this).val() + ",";
		});
		$("div[name=endAddrId] span.current").each(function(){
			endAddrIds += $(this).attr("val") + ",";
		});
		var json = {
				'wrapNum' : $("#wrapNum").val(),
				'seating' : $("#wrapType").val(),
				'startTime': $("#startWrapTime").val(),
				'endTime': $("#endWrapTime").val(),
				'fromCityId': $("#fromCityId").val(),
				'fromCityName': $("#fromCityId").text(),
				'fromAddrDetail': $("#fromAddrDetail").val(),
				'startAddrIds' : startAddrIds.substr(0,startAddrIds.length-1),
				'endAddrIds' : endAddrIds.substr(0,endAddrIds.length-1)
			};
		subWebForm("<%=basePath %>pc/cart/wrap/list",json);
	}
	
	
	//跳转到班车列表页面
	function toBusPage() {
		var data = {};
		data.getStoreId = $("#getBusStoreId div:eq(1) .current").attr("val");
		data.loseStoreId = $("#loseBusStoreId div:eq(1) .current").attr("val");
		data.startTime = $("#busStartTime").val();
		subWebForm("<%=basePath %>pc/cart/bus/list",data);
	}

	function initBus() {
		//初始化地址列表
		$.post("pc/cart/rent/addrList",{type:"bus"},function(data){
			var addrList=data.list;
			for(var i=0;i<addrList.length;i++){
				$("#getBusCityId").append('<option value="'+addrList[i].id+'">'+addrList[i].name+'</option>');
				$("#loseBusCityId").append('<option value="'+addrList[i].id+'">'+addrList[i].name+'</option>');
			}
			//初始化选择
			findBusStore($("#getBusCityId"));
			findBusStore($("#loseBusCityId"));
		});
	}
	
	function findBusStore(obj){
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
					$("#"+id+" div:eq(0)").append('<span  class="current" onclick="selectBusCounty(this)" val='+list[i].id+'>'+list[i].name+'</span>');
				}else{
					$("#"+id+" div:eq(0)").append('<span onclick="selectBusCounty(this)" val='+list[i].id+'>'+list[i].name+'</span>');
				}
			}
			initCounty();
			$("#"+id+" div:eq(0) span:eq(0)").click();
		})
	}

	function selectBusCounty(obj){
		var countyId=$(obj).attr("val")
		var id=$(obj).parents(".popbox").attr("id");
		var type="bus";//地址类型
		$.post("<%=basePath %>pc/cart/rent/getStore",{id:countyId,type:type},function(data){
			var list=data.list;
			$("#"+id+" div:eq(1)").html("");
			for(var i=0;i<list.length;i++){
				if(i==0){
					$("#"+id+" div:eq(1)").append('<span class="current" openTime="'+list[i].open_time+'" phone="'+list[i].link_tel+'" addr="'+list[i].addr_detail+'" val='+list[i].id+'>'+list[i].store+'</span>');
				}else{
					$("#"+id+" div:eq(1)").append('<span  openTime="'+list[i].open_time+'" phone="'+list[i].link_tel+'" addr="'+list[i].addr_detail+'" val='+list[i].id+'>'+list[i].store+'</span>');
				}
			}
			initCounty();
			$("#"+id+" div:eq(1) span:eq(0)").click();
		});
	}
	
	function goPoolList(){
		window.location.href="pc/cart/pool/list";
	}
</script>
</body>
</html>