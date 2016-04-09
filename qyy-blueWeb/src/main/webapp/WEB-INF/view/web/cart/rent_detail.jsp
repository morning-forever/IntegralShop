<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transition al.dtd"><%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../../static/inc_web.jsp" %>
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv = "X-UA-Compatible" content = "IE=edge,chrome=1 " /><meta charset="utf-8"> 
<title>快旅出行-租车详情</title>
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
		<div class="content">
			<div class="breadcrumb">当前位置：<a href="">首页</a><a href="">快旅漫游</a><a href="">快旅租车</a><span>租车详情</span></div>
			<div class="whitebg">
				<div class="detail_wrap clearfix">
				    <div class="fl detail_l">			    	
						<div class="bigimg_wrap rel">
							<c:forEach items="${photoUrls }" var="photo">
								<img src="${photo.pic_url }" width="454" height="256" class="current" />
							</c:forEach>
						</div>
						<div class="thumbs">
							<div class="thumbs_list clearfix">
								<c:forEach items="${photoUrls }" var="photo">
									<img src="${photo.pic_url }" width="97" height="55" class="current" />
								</c:forEach>
							</div>
						</div>
				    </div>
					<div class="fr detail_r rel">
						<h3 class="detail-title">${rent.brand }/${rent.coach }/${rent.outputs }/${rent.gearbox }</h3>
						<div class="detail_item mb10">
							<span class="l_title">价格</span>
							<div class="r-content">
								<span class="orange">¥<span class="f24 orange bold">${rent.price }</span></span>/日均
							</div>
						</div>
						<div style="margin-top:50px;">										
							<a href="javascript:;" onclick="goOrderSubmit()" class="btn lorgbtn">立即预定</a>						
						</div>
					</div>
				</div>
				<div class="pd20">
					<h4 class="orangeh4">租车基本信息<span name="showrule" class="pointer abs">租车规则</span></h4>
					<div class="paramitem">
						<span class="carparam">
							<i class="i-icon1"></i>品牌：<span>${rent.brand }</span>
						</span>
						<span class="carparam">
							<i class="i-icon2"></i>车系：<span>${rent.sys }</span>
						</span>
					</div>
					<div class="paramitem mb10">
						<span class="carparam">
							<i class="i-icon3"></i>年代：<span>${rent.car_year }</span>
						</span>
						<span class="carparam">
							<i class="i-icon4"></i>配置：<span>${rent.car_configure }</span>
						</span>
					</div>
					<p class="f16 dark mb10">租车配置信息</p>
					<div class="paramitem borderto1">
						<span class="carparam">
							<i class="i-icon5"></i>座位数：<span>${rent.seating }</span>
						</span>
						<span class="carparam">
							<i class="i-icon6"></i>车门数：<span>${rent.door }</span>
						</span>
						<span class="carparam">
							<i class="i-icon7"></i>燃料类型：<span>${rent.fuel }</span>
						</span>
						<span class="carparam">
							<i class="i-icon8"></i>变速箱类型：<span>${rent.gearbox }</span>
						</span>
					</div>
					<div class="paramitem">
						<span class="carparam">
							<i class="i-icon9"></i>排量：<span>${rent.outputs }</span>
						</span>
						<span class="carparam">
							<i class="i-icon10"></i>燃油标号：<span>${rent.fuel_grade }</span>
						</span>
						<span class="carparam">
							<i class="i-icon11"></i>驱动方式：<span>${rent.drives }</span>
						</span>
						<span class="carparam">
							<i class="i-icon12"></i>发动机进气形式：<span>${rent.air_form }</span>
						</span>
					</div>
					<div class="paramitem">
						<span class="carparam">
							<i class="i-icon13"></i>天窗：<span id="skylight"></span>
						</span>
						<span class="carparam">
							<i class="i-icon14"></i>油箱容量：<span>${rent.fuel_tankage }</span>
						</span>
						<span class="carparam">
							<i class="i-icon15"></i>音箱：<span>${rent.voice_box }</span>
						</span>
						<span class="carparam">
							<i class="i-icon16"></i>座椅：<span>${rent.chair }</span>
						</span>
					</div>
					<div class="paramitem borderbo1 mb10">
						<span class="carparam">
							<i class="i-icon17"></i>倒车雷达：<span id="radar"></span>
						</span>
						<span class="carparam">
							<i class="i-icon18"></i>气囊：<span>${rent.gasbag }</span>
						</span>
						<span class="carparam">
							<i class="i-icon19"></i>DVD/CD：<span>${rent.dvdcd }</span>
						</span>
						<span class="carparam">
							<i class="i-icon20"></i>GPS导航：<span id="gps"></span>
						</span>
					</div>
					<div class="paramitem">
						<span class="carparam">
							<i class="i-icon21"></i>取车地点：<span>${getStoreName }</span>
						</span>
						<span class="carparam">
							<i class="i-icon22"></i>还车地点：<span>${loseStoreName }</span>
						</span>
					</div>
					<div class="red">注：驾驶员要求：持C1驾照</div>
				</div>
						
			</div>
		</div>
						
	</div>
	<form action="" id="form">
		<input type="hidden" name="id" value="${rent.id }">
		<input type="hidden" name="getStoreId" value="${getStoreId }">
		<input type="hidden" name="loseStoreId" value="${loseStoreId }">
		<input type="hidden" name="startTime" value="${startTime }">
		<input type="hidden" name="endTime" value="${endTime }">
	</form>
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
</div>
<script id="rulepopup" type="text/template">
<div class="innerdiv pd20">
	<p style="margin:0 40px; color:#999;">LLorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet lacus accumsan et viverra justo commodo. Proin sodales pulvinar tempor. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam fermentum, nulla luctus pharetra vulputate, felis tellus mollis orci, sed rhoncus sapien nunc eget odioLorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet lacus accumsan et viverra justo commodo. Proin sodales pulvinar tempor. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam fermentum, nulla luctus pharetra vulputate, felis tellus mollis orci, sed rhoncus sapien nunc eget odio.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet lacus accumsan et viverra justo commodo. Proin sodales pulvinar tempor. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam fermentum, nulla luctus pharetra vulputate, felis tellus mollis orci, sed rhoncus sapien nunc eget odio.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet lacus accumsan et viverra justo commodo. Proin sodales pulvinar tempor. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam fermentum, nulla luctus pharetra vulputate, felis tellus mollis orci, sed rhoncus sapien nunc eget odio.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet lacus accumsan et viverra justo commodo. Proin sodales pulvinar tempor. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam fermentum, nulla luctus pharetra vulputate, felis tellus mollis orci, sed rhoncus sapien nunc eget odio.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet lacus accumsan et viverra justo commodo. Proin sodales pulvinar tempor. Cum sociis natoqueorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet lacus accumsan et viverra justo commodo. Proin sodales pulvinar tempor. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam fermentum, nulla luctus pharetra vulputate, felis tellus mollis orci, </p>
</div>
</script>

<script type="text/javascript" src="static/web/js/base.js"></script>
<script type="text/javascript">
$(function(){
	previewProDetailImg();
	// 修改身份对话框
	var ruleDlg = new dialogBox({
		title : "租车/包车/班车规则",
		contentHtml : $("#rulepopup").html(),
		popupBoxW : 760,
		initEvent : function($dom){
		}
	});
	$("[name=showrule]").click(function(){
		ruleDlg.showDlg();
	});
	
	var radar="${rent.radar}";
	var skylight="${rent.skylight}";
	var gps="${rent.gps}";
	if(radar=="0"){
		$("#radar").html("有");
	}else{
		$("#radar").html("有");
	}
	if(skylight=="0"){
		$("#skylight").html("有");
	}else{
		$("#skylight").html("无");
	}
	if(gps=="0"){
		$("#gps").html("有");
		$("#gps").html("无");
	}
	
});

function goOrderSubmit(){
	subWebForm("<%=basePath %>pc/cart/rent/goSubmitOrder",serializeObject($("#form")));
}

var serializeObject = function(form) {
	var o = {};
	$.each(form.serializeArray(), function(index) {
		if (o[this["name"]]) {
			o[this["name"]] = o[this["name"]] + "," + this["value"];
		} else {
			o[this["name"]] = this["value"];
		}
	});
	return o;
};
</script>
</body>
</html>