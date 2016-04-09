<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transition al.dtd">
<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../../../../static/inc_web.jsp"%>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv = "X-UA-Compatible" content = "IE=edge,chrome=1 " /><meta charset="utf-8"> 
<title>快旅出行-包车</title>
<!-- 日期时间控件 -->
<link href="static/web/js/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="static/web/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet" />
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

	<li id="template" style="display: none;"><a val=""
		href="javascript:;"><img src="static/web/img/car.jpg"
			height="100" width="160" alt=""></a>
		<div class="info">
			<p>
				<img class="avatar" src="static/web/img/carlogo.jpg" height="27" width="27" alt="">
			</p>
			<p>
				<i class="iicon i-pnum"></i>
			</p>
		</div>
		<div class="cprice">
			<span class="lorange">￥<span class="bold f24"></span></span>/日均
		</div> <a href="javascript:;" class="btn formbtn orgbtn">预订</a></li>

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
				<div class="breadcrumb">
					当前位置：<a href="pc/home">首页</a><a href="pc/cart/home">快旅出行</a><span>包车</span>
				</div>
				<div class="lpart">
					<ul class="category">
						<li><a href="pc/cart/rent/list"><i class="iicon i-quicktype1"></i>快旅租车</a></li>
						<li class="active"><a href="pc/cart/wrap/list"><i class="iicon i-quicktype2"></i>快旅包车</a></li>
						<li><a href="pc/cart/bus/list"><i class="iicon i-quicktype3"></i>快旅班车</a></li>
						<li><a href="pc/cart/pool/list"><i class="iicon i-quicktype3"></i>快旅拼车</a></li>
					</ul>
				</div>
				<div class="rpart f12">
						

						<div class="shadow whitebg mb10">
							<!-- 分类筛选条件 -->
							<div class="ctgallwrap ctgtype2">
								<div class="ctgselect_wrap">
									<span class="ctgname">类型</span>
									<div class="value_wrap" id="carType" style="height: 31px;">
										<a href="javascript:;" class="ctgvalue labs active" val="">不限</a>
										<c:forEach items="${carTypeList }" var="carType">
											<a href="javascript:;" class="ctgvalue" val="${carType.id }">${carType.car_type }</a>
										</c:forEach>
										<span class="showless">类型收起 ^</span>
									</div>
									<span class="showmore">查看全部 v</span>
								</div>
								<div class="ctgselect_wrap borderb1">
									<span class="ctgname">品牌</span>
									<div class="value_wrap" id="carBrand" style="height: 31px;">
										<a href="javascript:;" class="ctgvalue labs active" val="">不限</a>
										<c:forEach items="${carBrandList }" var="carBrand">
											<a href="javascript:;" class="ctgvalue" val="${carBrand.id }">${carBrand.brand }</a>
										</c:forEach>
										<span class="showless">品牌收起 ^</span>
									</div>
									<span class="showmore">查看全部 v</span>
								</div>
								<div class="ctgselect_wrap">
									<span class="ctgname">日租金</span>
									<div class="value_wrap" id="carPrice">
										<a href="javascript:;" class="ctgvalue labs active" val="">不限</a>
										<c:forEach items="${carPriceList }" var="carPrice">
											<a href="javascript:;" class="ctgvalue" 
											valStart="${carPrice.priceStart }" valEnd="${carPrice.priceEnd }">￥${carPrice.depict }</a>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>
						<div class="shadow whitebg mb10 rel" name="boxwrapper" id="wrapDiv"
							style="padding: 20px 20px 10px;">
							<!-- <a href="javascript:doSearch();" class="btn lorgbtn abs"
							style="bottom: 20px; right: 20px;" onclick="doSearch();">去选车</a> -->
							<div class="fitemwrap">
								<span class="item-title">包车类型</span>
								<div class="form-item select-item mr10" style="width: 186px;">
									<span class="select-text">
									<c:choose>
										<c:when test="${homeWrapData.seating != null }">
											${homeWrapData.seating }座
										</c:when>
										<c:otherwise>
											请选择包车类型
										</c:otherwise>
									</c:choose>
									</span> <i class="iicon i-select"></i> 
									<select id="wrapType">
										<option value="">请选择包车类型</option>
										<c:forEach items="${wrapTypeList }" var="wrap">
											<c:choose>
												<c:when test="${wrap.seating == homeWrapData.seating}">
													<option value="${wrap.seating }" selected="selected">${wrap.seating }座</option>
												</c:when>
												<c:otherwise>
													<option value="${wrap.seating }">${wrap.seating }座</option>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</select>
								</div>
							包车数量
							<span class="pronum_unit" style="margin-right:40px;"><button class="des_btn disabled">-</button><input type="text" id="wrapNum" value="${homeWrapData.wrapNum }"/><button class="res_btn">+</button></span>

							</div>
							<div class="fitemwrap">
								<span class="item-title">出发时间</span>
								<div class="form-item inline" style="width: 186px;">
									<i class="iicon i-date"></i> <input
										class="datetime form-control" readonly type="text"
										id="startTime" placeholder="请选择日期" value="${homeWrapData.startTime }"/>
								</div>
							</div>
							<div class="fitemwrap">
								<span class="item-title">结束时间</span>
								<div class="form-item inline" style="width: 186px;">
									<i class="iicon i-date"></i> <input
										class="datetime form-control" readonly type="text"
										id="endTime" placeholder="请选择日期" value="${homeWrapData.endTime }"/>
								</div>
							</div>
							<!-- 如果选择了多个目的地，则显示 -->
								<c:choose>
								<c:when test="${routeList == null }">
									<div class="fitemwrap">
								<span class="item-title">出发地</span>
								<input type="hidden" name="startAddrId" value="0">
								<div class="form-item select-item mr10" style="width: 186px;">
									<span class="select-text">贵阳市</span>
									<i class="iicon i-select"></i>
									<select id="fromCityId">
										<c:forEach items="${addrList }" var="addr">
											<c:choose>
											<c:when test="${addr.id ==  homeWrapData.fromCityId}">
												<option value="${addr.id }" selected="selected">${addr.name }</option>
											</c:when>
											<c:otherwise>
												<option value="${addr.id }">${addr.name }</option>
											</c:otherwise>
											</c:choose>
										</c:forEach>
									</select>
								</div>
								<div class="form-item inline" style="width: 160px;">
									<input type="text" placeholder="请填写地址" id="fromAddrDetail" value="${homeWrapData.fromAddrDetail }"/>
								</div>
							</div>
							<div class="fitemwrap">
								<span class="item-title">目的地</span>
								<div class="form-item select-item mr10" style="width: 186px;">
									<span class="select-text">
									<!-- 贵阳市 -->
									<c:choose>
										<c:when test="${homeWrapData.fromCityName != null }">
											${homeWrapData.fromCityName }
										</c:when>
										<c:otherwise>
											贵阳市
										</c:otherwise>
									</c:choose>
									</span>
									<i class="iicon i-select"></i>
									<select name="getCityId" id="getCityId" onchange="findGetStore(this)">
										<c:forEach items="${addrList }" var="addr">
											<c:choose>
												<c:when test="${addr.id ==  homeWrapData.fromCityId}">
													<option value="${addr.id }" selected="selected">${addr.name }</option>
												</c:when>
												<c:otherwise>
													<option value="${addr.id }">${addr.name }</option>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</select>
								</div>
								<div class="form-item select-item haspopbox" style="width:160px;">
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
									style="margin-right: 5px;"></span>
							</div>
								</c:when>
								<c:otherwise>
									<input id="fromHomeTag" type="hidden" value="">
									<c:if test="${routeList.size() > 0 }">
									<c:forEach items="${routeList }" var="route" varStatus="status">
									<c:choose>
										<c:when test="${status.count == 1 }">
											
											<div class="fitemwrap">
								<span class="item-title">出发地</span>
								<input type="hidden" name="startAddrId" value="0">
								<div class="form-item select-item mr10" style="width: 186px;">
									<span class="select-text">贵阳市</span>
									<i class="iicon i-select"></i>
									<select id="fromCityId">
										<c:forEach items="${addrList }" var="addr">
											<c:choose>
												<c:when test="${addr.id ==  homeWrapData.fromCityId}">
													<option value="${addr.id }" selected="selected">${addr.name }</option>
												</c:when>
												<c:otherwise>
													<option value="${addr.id }">${addr.name }</option>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</select>
								</div>
								<div class="form-item inline" style="width: 160px;">
									<input type="text" placeholder="请填写地址" id="fromAddrDetail" value="${homeWrapData.fromAddrDetail }"/>
								</div>
							</div>
							<div class="fitemwrap">
								<span class="item-title">目的地</span>
								<div class="form-item select-item mr10" style="width: 186px;">
									<span class="select-text">贵阳市</span>
									<i class="iicon i-select"></i>
									<select name="getCityId" id="getCityId" endA="${route.endArea }" endS="${route.endAddrId }"
									 onchange="findGetStore(this)">
										<c:forEach items="${addrList }" var="addr">
											<c:choose>
												<c:when test="${addr.id ==  route.endCityId}">
													<option value="${addr.id }" selected="selected">${addr.name }</option>
												</c:when>
												<c:otherwise>
													<option value="${addr.id }">${addr.name }</option>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</select>
								</div>
								<div class="form-item select-item haspopbox" style="width:160px;">
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
									style="margin-right: 5px;"></span>
							</div>
											
										</c:when>
										<c:otherwise>
										
									<div class="fitemwrap">
										<span class="item-title">出发地</span>
										<input type="hidden" name="startAddrId" value="${route.startAddrId }">
										<div class="form-item inline prevaddr" style="border:none 0;">${route.startAddr }							
										</div>
									</div>
									<div class="fitemwrap">
										<span class="item-title">目的地</span>
										<div class="form-item select-item mr10" style="width: 186px;">
											<span class="select-text">贵阳市</span>
											<i class="iicon i-select"></i>
											<select name="getCityIdOther" id="getCityId${status.count }" endA="${route.endArea }" endS="${route.endAddrId }" 
											onchange="findGetStore(this)">
												<c:forEach items="${addrList }" var="addr">
													<c:choose>
														<c:when test="${addr.id ==  route.endCityId}">
															<option value="${addr.id }" selected="selected">${addr.name }</option>
														</c:when>
														<c:otherwise>
															<option value="${addr.id }">${addr.name }</option>
														</c:otherwise>
													</c:choose>
												</c:forEach>
											</select>
										</div>
										<div class="form-item select-item haspopbox" style="width:160px;">
											<span class="select-text" name="destArea">请选择取目的地</span>
											<i class="iicon i-select"></i>
											<div class="popbox large r-pos" value="" id="getStoreId${status.count }">
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
										<c:if test="${status.count ==  routeList.size()}">
											<span name="addaim" class="addbtn iicon" style="margin-right: 5px;"></span>
											<span name="deleteaim" class="resbtn iicon"></span>
										</c:if>
										
									</div>
									
										</c:otherwise>
									</c:choose>
									</c:forEach>
									</c:if>
								</c:otherwise>
								
								</c:choose>
								
							<div class="fitemwrap" style="height: 40px;">
								<a id="searchBtn" href="javascript:;" onclick="doSearch()" class="btn lorgbtn abs">去选车</a>
							</div>
							
							
						</div>
					<!-- </form> -->

					<!-- 车辆列表 -->
					<div class="shadow whitebg mb10">
						<!-- 排序 -->
						<div class="sortwrap clearfix">
							<a class="active" href="javascript:;" orderBy="time">默认</a> 
							<a class="sort-res" href="javascript:;" orderBy="price">价格<i class="iicon"></i></a>
						</div>
						<div class="carprolist_wrap">
							<ul class="carlist">
							</ul>
						</div>

						<!-- 分页  -->
						<div class="pagination" style="padding-right: 20px;"></div>
					</div>
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
			<div class="fitemwrap">
				<span class="item-title">目的地</span>
				<div class="form-item select-item mr10" style="width: 186px;">
					<span class="select-text">贵阳市</span>
					<i class="iicon i-select"></i>
					<select name="getCityIdOther" id="getCityIdOther" onchange="findGetStore(this)">
						<c:forEach items="${addrList }" var="addr">
							<option value="${addr.id }">${addr.name }</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-item select-item haspopbox" style="width:160px;">
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
	
	<script type="text/template" id="addaimitem">

</script>
	
	<!-- 日期时间控件 -->
	<script type="text/javascript"
		src="static/web/js/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="static/web/js/bootstrap-datetimepicker.js"></script>
	<script type="text/javascript" src="static/web/js/base.js"></script>
	<script type="text/javascript" src="static/web/js/index.js"></script>
	<script type="text/javascript" src="static/web/js/quick.travel.js"></script>
	<script type="text/javascript">
	var thisPageSize=0;//当前页大小
	var totalPage=0;//总页数
	var pageNo=1;//当前页	
	
	var smg=0;
	
	$(function() {
			
			popBoxInit();//初始化目的地弹出框
			
			scrollBannerInit($(".banner-ul"), $(".banner-btn"));
			selfDefineFormBtn();
			InitPronum();
			$('.datetime').datetimepicker({
				autoclose : 1,
				format : "yyyy-mm-dd hh:ii",
				//minView: 2,
				todayBtn : true,
				language : "zh-CN"
			});
			$(".showless").hide();
			
			$(".showmore").click(function() {
				$(this).prev(".value_wrap").css({
					"height" : "auto"
				});
				$(this).prev(".value_wrap").find(".showless").show();
				$(this).hide();
				//$(this).attr("style", "visibility:hidden!important");
			});
			$(".showless").click(function() {
				$(this).parent(".value_wrap").animate({
					"height" : "31px"
				}, 200);
				$(this).parent(".value_wrap").next(".showmore").show();
				$(this).hide();
				/* $(this).attr("style", "visibility:hidden!important");
				$(this).parent(".value_wrap").next(".showmore").attr(
						"style", "visibility:visible!important"); */
			});
			// initSelect($("[name=boxwrapper]").find(".fitemwrap").last());
			$("[name=boxwrapper]").find("[name=addaim]").click(addAim);
			$("[name=boxwrapper]").find("[name=deleteaim]").click(deleteAim);
			
			//初始化出发时间和结束时间
			var secondDay=new Date();
			secondDay.setTime(new Date().getTime()+24*60*60*1000);
			if($("#startTime").val() == ""){
				$("#startTime").val(secondDay.format("yyyy-MM-dd hh:mm"));
			}
			if($("#endTime").val() == ""){
				$("#endTime").val(secondDay.format("yyyy-MM-dd hh:mm"));
			}
			
			clickFn();
			doSearch();
			initPage();//分页
			
			//初始化目的地
			var size = "${routeList.size()}";
			if(size == 0){
				findGetStore($("#getCityId"));
			}else{
				findGetStoreHome($("#getCityId"),$("#getCityId").attr("endA"),$("#getCityId").attr("endS"));
				$("[name=addaim]:first").remove();
				$("#fromHomeTag").val(size);
			}
			
			for(var i = 2; i <= size; i++){
				findGetStoreHome($("#getCityId"+i),$("#getCityId"+i).attr("endA"),$("#getCityId"+i).attr("endS"));
			}
			//初始化包车数量
			if("${homeWrapData.wrapNum }" != ""){
				$("#wrapNum").val("${homeWrapData.wrapNum }");
			}
			
			$(".select-item select").change();
		});
	
		//校验出发日期和包车数量
		function checkDateAndNum(){
			var startDate = simpleFormatDate($("#startTime").val());
			var endDate = simpleFormatDate($("#endTime").val());
			if( startDate.getTime() > endDate.getTime()){
				valTips("endTime", "出发时间不能大于结束时间！");
				return false;
			}
			var wrapNum = $("#wrapNum").val();
			if(!checkField(wrapNum,/^[1-9]\d*$/)){
				valTips("wrapNum", "请输入正整数！");
				return false;
			}else{
				if(parseInt(wrapNum) >= 1000){
					valTips("wrapNum", "包车数量不能超过1000！");
					return false;
				}
			}
			return true;
		}
	
		//查询
		function doSearch(orderBy) {
			if(checkDateAndNum()){
				var carlist = $(".carlist");
				var carTypes = "";
				var carBrands = "";
				$("#carType .active").each(function(){
					carTypes += $(this).attr("val")+",";
				})
				$("#carBrand .active").each(function(){
					carBrands+=$(this).attr("val")+",";
				});
				var json = {
					'wrapNum' : $("#wrapNum").val(),
					'seating' : $("#wrapType").val(),
					'carTypes' : carTypes.substr(0,carTypes.length-1),
					'carBrands' : carBrands.substr(0,carBrands.length-1),
					'priceStart' : $("#carPrice .active").attr("valStart"),
					'priceEnd' : $("#carPrice .active").attr("valEnd"),
					'orderBy' : orderBy,
					'pageNo': pageNo
				};
				$.post('<%=basePath %>pc/cart/wrap/search', json,
						function(res) {
							if (res.status == 'success') {
								carlist.empty();
								$(".carlist").html("");
								var list = res.carWrapList;
								for ( var i in list) {
									var item = list[i];
									var template = $("#template").clone().removeAttr("id");
									template.find("img").first().attr("src",item.picUrl);
									
									template.find(".info p:eq(0)").html('<i class="iicon i-pos"></i>'+item.brand);
									
									//template.find("img").last().attr("src",item.logoUrl);
									//template.find("div img").after(item.brand);
									template.find("div i:eq(1)").after("乘坐" + item.seating + "人");
									template.find(".cprice span span").after(item.price);
									template.find("a").first().attr('onclick','toDetail('+item.id+')');
									template.find("a").last().attr('onclick','toOrder('+item.id+')');
									template.show();
									carlist.append(template);
									
									thisPageSize=res.thisPageSize;
									totalPage=res.totalPage;
									pageNo=res.pageNo;
									
									initPage();//分页
								}
							}
						}, "JSON");
			}
		}
		
		//跳转至详情页面
		function toDetail(carId) {
			var startAddrIds = "";
			var endAddrIds = "";
			$("input[name=startAddrId]").each(function(){
				startAddrIds += $(this).val() + ",";
			});
			$("div[name=endAddrId] span.current").each(function(){
				endAddrIds += $(this).attr("val") + ",";
			});
			var json = {
					'id':carId,
					'wrapNum' : $("#wrapNum").val(),
					'startTime': $("#startTime").val(),
					'endTime': $("#endTime").val(),
					'fromCityId': $("#fromCityId").val(),
					'fromCityName': $("#fromCityId").find("option:selected").text(),
					'fromAddrDetail': $("#fromAddrDetail").val(),
					'startAddrIds' : startAddrIds.substr(0,startAddrIds.length-1),
					'endAddrIds' : endAddrIds.substr(0,endAddrIds.length-1)
				};
			subWebForm("<%=basePath %>pc/cart/wrap/detail",json);
		}
		
		//跳转至订单页面
		function toOrder(carId) {
			if(checkDateAndNum()){
				if($("#fromAddrDetail").val() == ""){
					valTips("fromAddrDetail", "请填写出发地！");
					return false;
				}
				var startAddrIds = "";
				var endAddrIds = "";
				$(".rpart input[name=startAddrId]").each(function(){
					startAddrIds += $(this).val() + ",";
				});
				$(".rpart div[name=endAddrId] span.current").each(function(){
					endAddrIds += $(this).attr("val") + ",";
				});
				var json = {
						'id':carId,
						'wrapNum' : $("#wrapNum").val(),
						'startTime': $("#startTime").val(),
						'endTime': $("#endTime").val(),
						'fromCityId': $("#fromCityId").val(),
						'fromCityName': $("#fromCityId").find("option:selected").text(),
						'fromAddrDetail': $("#fromAddrDetail").val(),
						'startAddrIds' : startAddrIds.substr(0,startAddrIds.length-1),
						'endAddrIds' : endAddrIds.substr(0,endAddrIds.length-1)
					};
				subWebForm("<%=basePath %>pc/cart/wrap/order",json);
			}
		}
		
		//初始化选择框点击事件
		function clickFn() {
			//默认和价格排序
			$(".sortwrap a").bind("click",function(){
				$(".sortwrap a").removeClass("active");
				$(this).addClass("active");
				doSearch($(this).attr("orderBy"));
			});
			//日租金
			$("#carPrice a").bind("click", function() {
				$("#carPrice a").removeClass("active");
				$(this).addClass("active");
			});
			//类型
			$("#carType a").bind("click", function() {
				$(this).toggleClass("active");
				if ($(this).attr("val") != '') {
					$("#carType a[val='']").removeClass("active")
				} else {
					$("#carType a[val='']").hasClass("active");
					$("#carType a").removeClass("active");
					$("#carType a[val='']").addClass("active");
				}
				if ($("#carType .active").length == 0) {
					$("#carType a[val='']").addClass("active");
				}
			});
			//品牌
			$("#carBrand a").bind("click", function() {
				$(this).toggleClass("active");
				if ($(this).attr("val") != '') {
					$("#carBrand a[val='']").removeClass("active");
				} else {
					$("#carBrand a[val='']").hasClass("active");
					$("#carBrand a").removeClass("active");
					$("#carBrand a[val='']").addClass("active");
				}
				if ($("#carBrand .active").length == 0) {
					$("#carBrand a[val='']").addClass("active");
				}
			});

			//选择框反选
			if ("${serchPrice}" != "") {
				$("#carPrice .active").removeClass("active");
				$("#carPrice a[val=${serchPrice}]").addClass("active")
			}
			if ("${typeId}" != "") {
				var typeIds = "${typeId}";
				var typeIdArr = typeIds.split(",");
				$("#carType .active").removeClass("active");
				for (var i = 0; i < typeIdArr.length; i++) {
					$("#carType a[val=" + typeIdArr[i] + "]")
							.addClass("active")
				}
			}
			if ("${brandId}" != "") {
				var brandIds = "${brandId}";
				var brandIdArr = brandIds.split(",");
				$("#carBrand .active").removeClass("active");
				for (var i = 0; i < brandIdArr.length; i++) {
					$("#carBrand a[val=" + brandIdArr[i] + "]").addClass(
							"active")
				}
			}
		}
		
		function gotoPage(goNo){
			pageNo = goNo;
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
			//console.info(smg);
			smg+=1;
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