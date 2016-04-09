<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transition al.dtd"><%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../../static/inc_web.jsp"%>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv = "X-UA-Compatible" content = "IE=edge,chrome=1 " /><meta charset="utf-8"> 
<title>快旅出行-包车详情</title>
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
				<div class="breadcrumb">
					当前位置：<a href="">首页</a><a href="pc/cart/home">快旅漫游</a><a
						href="pc/cart/wrap/list">快旅包车</a><span>包车详情</span>
				</div>
				<div class="whitebg">
					<div class="detail_wrap clearfix">
						<div class="fl detail_l">
							<div class="bigimg_wrap rel">
								<c:if test="${uploadList.size() == 0 }">
									<img src="uploadFiles/uploadImgs/zanwutupian.jpg" width="454"
										class="current" height="256" />
								</c:if>
								<c:forEach items="${uploadList }" var="upload">
									<img src="${upload.picUrl }" width="454" id="${upload.id }"
										class="current" height="256" />
								</c:forEach>
							</div>
							<div class="thumbs">
								<div class="thumbs_list clearfix">
									<c:forEach items="${uploadList }" var="upload">
										<img src="${upload.picUrl }" width="97" height="55"
											onclick="changePic(${upload.id })" />
									</c:forEach>
								</div>
							</div>
						</div>
						<div class="fr detail_r rel">
							<h3 class="detail-title">${carWrap.brand }/乘坐${carWrap.seating }人</h3>
							<div class="detail_item mb10">
								<span class="l_title">价格</span>
								<div class="r-content">
									<span class="orange">¥<span class="f24 orange bold">${carWrap.price }</span></span>/日均
								</div>
							</div>
							<div style="margin-top: 50px;">
								<a href="javascript:;" class="btn lorgbtn" onclick="toOrder()">立即预定</a>
							</div>
						</div>
					</div>
					<div class="pd20">
						<h4 class="orangeh4">
							包车基本信息<span name="showrule" class="pointer abs">包车规则</span>
						</h4>
						<div class="paramitem">
							<span class="carparam"> <i class="i-icon1"></i>品牌：<span>${carWrap.brand }</span>
							</span> <span class="carparam"> <i class="i-icon2"></i>车系：<span>${carWrap.sys }</span>
							</span>
						</div>
						<div class="paramitem mb10">
							<span class="carparam"> <i class="i-icon3"></i>年代：<span>${carWrap.car_year }</span>
							</span> <span class="carparam"> <i class="i-icon4"></i>配置：<span>${carWrap.car_configure }</span>
							</span> <span class="carparam"> <i class="i-icon5"></i>座位数：<span>${carWrap.seating }</span>
							</span>
						</div>
					</div>

				</div>
			</div>
		</div>
		<!-- footer -->
		<jsp:include page="../common/footer.jsp"></jsp:include>
		<form id="detailForm" action="pc/cart/wrap/order" method="post">
			<input type="hidden" name="id" value="${carWrap.id }">
			<input type="hidden" name="wrapNum" value="${cartWrapOrder.wrapNum }">
			<input type="hidden" name="startTime" value="${cartWrapOrder.startTime }">
			<input type="hidden" name="endTime" value="${cartWrapOrder.endTime }">
			<input type="hidden" name="fromCityId" value="${cartWrapOrder.fromCityId }">
			<input type="hidden" name="fromCityName" value="${cartWrapOrder.fromCityName }">
			<input type="hidden" name="fromAddrDetail" value="${cartWrapOrder.fromAddrDetail }">
			<input type="hidden" name="startAddrIds" value="${cartWrapOrder.startAddrIds }">
			<input type="hidden" name="endAddrIds" value="${cartWrapOrder.endAddrIds }">
		</form>
	</div>
	<script id="rulepopup" type="text/template">
<div class="innerdiv pd20">
	<p style="margin:0 40px; color:#999;">LLorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet lacus accumsan et viverra justo commodo. Proin sodales pulvinar tempor. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam fermentum, nulla luctus pharetra vulputate, felis tellus mollis orci, sed rhoncus sapien nunc eget odioLorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet lacus accumsan et viverra justo commodo. Proin sodales pulvinar tempor. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam fermentum, nulla luctus pharetra vulputate, felis tellus mollis orci, sed rhoncus sapien nunc eget odio.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet lacus accumsan et viverra justo commodo. Proin sodales pulvinar tempor. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam fermentum, nulla luctus pharetra vulputate, felis tellus mollis orci, sed rhoncus sapien nunc eget odio.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet lacus accumsan et viverra justo commodo. Proin sodales pulvinar tempor. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam fermentum, nulla luctus pharetra vulputate, felis tellus mollis orci, sed rhoncus sapien nunc eget odio.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet lacus accumsan et viverra justo commodo. Proin sodales pulvinar tempor. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam fermentum, nulla luctus pharetra vulputate, felis tellus mollis orci, sed rhoncus sapien nunc eget odio.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet lacus accumsan et viverra justo commodo. Proin sodales pulvinar tempor. Cum sociis natoqueorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet lacus accumsan et viverra justo commodo. Proin sodales pulvinar tempor. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam fermentum, nulla luctus pharetra vulputate, felis tellus mollis orci, </p>
</div>
</script>
	
	<script type="text/javascript" src="static/web/js/base.js"></script>
	<script type="text/javascript">
		$(function() {
			previewProDetailImg();
			// 修改身份对话框
			var ruleDlg = new dialogBox({
				title : "租车/包车/班车规则",
				contentHtml : $("#rulepopup").html(),
				popupBoxW : 760,
				initEvent : function($dom) {
				}
			});
			$("[name=showrule]").click(function() {
				ruleDlg.showDlg();
			});
		});
		
		//跳转至订单页面
		function toOrder() {
			$("#detailForm")[0].submit();
		}
		
		//图片切换
		function changePic(id) {
			$(".bigimg_wrap rel").find("img").each(function(){
				if(this.id.value == id){
					$(this).attr("class","current");
				}else{
					$(this).removeAttr("class");
				}
			});
		}
	</script>
</body>
</html>