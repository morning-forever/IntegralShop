<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transition al.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../../static/inc_web.jsp" %>
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv = "X-UA-Compatible" content = "IE=edge,chrome=1 " /><meta charset="utf-8"> 
<title>快旅出行-班车详情</title>
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
			<div class="breadcrumb">当前位置：<a href="">首页</a><a href="">快旅漫游</a><a href="">快旅班车</a><span>班车详情</span></div>
			<div class="whitebg">
				<div class="detail_wrap clearfix">
				    <div class="fl detail_l">			    	
						<div class="bigimg_wrap rel">
							<c:forEach items="${image}" var="c" varStatus="s">
								<img src="${c.pic_url }" width="454" height="256" <c:if test="${c.pic_type == 'cover' }">class="current"</c:if> />	
							</c:forEach>
						</div>
						<div class="thumbs">
							<div class="thumbs_list clearfix">
								<c:forEach items="${image}" var="c" varStatus="s">
									<img src="${c.pic_url }" width="97" height="55" <c:if test="${c.pic_type == 'cover' }">class="current"</c:if> />	
								</c:forEach>
							</div>
						</div>
				    </div>
					<div class="fr detail_r rel">
						<h3 class="detail-title">${bus.from_addr }-${bus.to_addr }</h3>
						<div class="detail_item mb10">
							<span class="l_title">价格</span>
							<div class="r-content">
								<span class="orange">¥<span class="f24 orange bold">${bus.price }</span></span>/日均
							</div>
						</div>
						<div class="mb20">已坐<span class="f20 lorange">${bus.use_count }</span>位，剩<span class="f20 lorange">${bus.seating-bus.use_count}</span>位</div>
						<div>客座率<span class="f20 lorange">${bus.ple }</span></div>
						<div style="margin-top:30px;">										
							<a href="pc/cart/bus/order/${bus.id }" class="btn lorgbtn">立即预定</a>						
						</div>
					</div>
				</div>
				<div class="pd20">
					<h4 class="orangeh4">班车基本信息<span name="showrule" class="pointer abs">班车规则</span></h4>
					<div class="paramitem">
						<span class="carparam">
							<i class="i-icon1"></i>品牌：<span>${bus.brand }</span>
						</span>
						<span class="carparam">
							<i class="i-icon3"></i>年代：<span>${bus.car_year }</span>
						</span>
					</div>
					<div class="paramitem mb10">
						<span class="carparam">
							<i class="i-icon5"></i>座位数：<span>${bus.seating }</span>
						</span>
					</div>
					<h4 class="orangeh4">班车详情</h4>	
					<div class="paramitem">
						<span class="carparam">
							<i class="i-icon23"></i>发车时间：<span>${bus.from_time }</span>
						</span>
						<span class="carparam">
							<i class="i-icon23"></i>预计到达时间：<span>${bus.to_time }</span>
						</span>
					</div>
						<div class="paramitem borderbo1 mb10">
						<span class="carparam">
							<i class="i-icon24"></i>发车地点：<span>${bus.from_store }</span>
						</span>
						<span class="carparam">
							<i class="i-icon25"></i>目的地：<span>${bus.to_store }</span>
						</span>
					</div>
					<div class="paramitem">
						<span class="carparam">
							<i class="i-icon21"></i>坐车地点：<span>${bus.from_store }</span>
						</span>
					</div>				
				</div>
						
			</div>
		</div>
						
	</div>

	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
</div>
<script id="rulepopup" type="text/template">
<div class="innerdiv pd20">
	<p style="margin:0 40px; color:#999;">${bus.depict}</p>
</div>
</script>
<script type="text/javascript" src="static/web/js/bootstrap-datetimepicker.js"></script>
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
	
	
	
});
</script>
</body>
</html>