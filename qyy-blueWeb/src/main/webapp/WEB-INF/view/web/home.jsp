<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transition al.dtd"><%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../static/inc_web.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath %>">
<meta http-equiv="X-UA-Compatible" content="IE=8,chrome=1" /><meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7"/>  
<meta property="wb:webmaster" content="4452badfff67bf73" />
<meta property="qc:admins" content="135333772761116111756375" />
<title>首页</title>
<!-- 日期时间控件 -->
<link href="static/web/js/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link href="static/web/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
<link rel="stylesheet" href="static/web/css/common.css" />
<link rel="stylesheet" href="static/web/css/index.css" />
</head>
<body>
<div class="wrapper">
	<!-- header -->
	<div class="header">
		<jsp:include page="./common/header.jsp"></jsp:include>
		<div class="content rel">
			<div class="nav_wrap rel">
				<a href="#"><img src="static/web/images/logo.png" height="59" width="176" alt="" class="logo"></a>
				<ul class="nav clearfix">
					<li class="homepage">首页</li>
					<!-- <li><a href="pc/simple/home">智易行</a></li> -->
					<li><a href="pc/cart/home">快旅出行</a></li>
					<li><a href="pc/depth/home">主题深度游</a></li>
					<li><a href="pc/interact/home">互动社区</a></li>
				</ul>
				<div class="contact400">
					<span class="i-contact"></span>
					<span>热线电话</span><br /><span class="f18 bold">
					<!-- <a href="admin/login?op=toLogin"> -->
					${tel400 }
					</span>
				</div>				
			</div>
			<div class="header-opart rel">
				<span class="ltext Arial white">
					<span class="f16 inline" style="padding-bottom:5px;">FIND YOUR</span><br /><span class="f28 bold">HOLIDAY</span>
				</span>
				<!-- <a href="pc/cart/search?op=rent" class="links"><i class="iicon i-quicktype1"></i><br />快旅租车</a> -->
				<a href="pc/cart/rent/list" class="links"><i class="iicon i-quicktype1"></i><br />快旅租车</a>
				<a href="pc/cart/wrap/list" class="links"><i class="iicon i-quicktype2"></i><br />快旅包车</a>
				<a href="pc/cart/bus/list" class="links"><i class="iicon i-quicktype3"></i><br />快旅班车</a>
				<a href="pc/cart/pool/list" class="links"><i class="iicon i-quicktype4"></i><br />快旅拼车</a>
				<div class="search_wrapper abs"><i class="iicon i-search"></i><input class="search-text" id="searchInput" onkeyup="enterSearch()" type="text" placeholder="请输入关键词" />
					<button class="search-btn" onclick="search();">搜 索</button>
				</div>
			</div>
			<!-- <div name="autoplan" class="swipe-part">
				<span class="incont">
					<span class="orange f26 inline" style="padding-bottom:9px;">智易行</span><br />
					<span class="f16 dark inline pb15 mb20">Professional custom</span><br />
					<i class="iicon i-edit"></i>
				</span>
			</div> -->					
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
	<div class="content_wrap">
		<!-- 主题深度游  -->
		<div class="section section1">
			<div class="content">
				<h3 class="sec_title"><i class="iicon i-sec1"></i>主题深度游<br /><span>The theme depth travel</span><a href="pc/depth/home" class="more">更多&gt;&gt;</a></h3>	
				<div class="listwrap">
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
		</div>

		<!-- 玩伴招募 -->
		<div class="section section2">
			<div class="content">
				<h3 class="sec_title"><i class="iicon i-sec2"></i>玩伴招募<br /><span>Free together</span><a href="javascript:;" onclick="gofriendList()"  class="more">更多&gt;&gt;</a></h3>
				<div class="recruit_cover">
				<c:forEach items="${frendRecommendList }" var="frendRecommend" varStatus="index">
					<div class="recruit_wrap <c:if test="${index.index%2==0 }">tr</c:if><c:if test="${index.index%2==1 }">tl</c:if>">
						<a href="javascript:;" onclick="goTravels(${frendRecommend.travelsId})" class="block">
							<img src="${frendRecommend.img_url }" height="175" width="750" alt="">
							<div class="recruit_info">
								<div class="incont rel">
									<img src="${frendRecommend.head_img }" height="50" width="50" alt="" class="avatar">
									<h5 class="mb5">${frendRecommend.addrName }</h5>
									<p class="dark f16 mb5">${frendRecommend.title }</p>
									<%-- <div class="orange">￥<span class="f24 bold">${frendRecommend.price }</span><span class="f12">起/人</span></div> --%>
								</div>						
							</div>
						</a>
					</div>
				</c:forEach>
				</div>
				
			</div>
		</div>
		
		<!-- 热门攻略 -->
		<div class="section section3">
			<div class="content">
				<h3 class="sec_title"><i class="iicon i-sec3"></i>热门攻略<br /><span>A popular strategy</span><a href="javascript:;" onclick="goMasterIndex()" class="more">更多&gt;&gt;</a></h3>
				<ul class="strategy_ul clearfix" style="height: 333px">
					<c:forEach items="${travelsRecommendList }" var="travelsRecommend" varStatus="index">
						<c:if test="${index.index%2==0 }">
						<li class="orangebg">
						</c:if>
						<c:if test="${index.index%2==1 }">
						<li class="whitebg">
						</c:if>
						<c:if test="${index.index%2==1 }">
						<div><a href="javascript:;" onclick="goTravels(${travelsRecommend.travelsId})"><img src="${travelsRecommend.img_url }" height="193" width="333" title="贵阳7日自由之旅" alt=""></a></div>
						</c:if>
						<div class="incont" style="height: 173px;">
							<h4>${travelsRecommend.title }</h4>
							<%-- <p>${travelsRecommend.content }<span>...</span></p> --%>
							<div class="tr">
								<a href="javascript:;" onclick="goTravels(${travelsRecommend.travelsId})" class="btn">了解更多</a>
							</div>
						</div>	
						<c:if test="${index.index%2==0 }">
						<div><a href="javascript:;" onclick="goTravels(${travelsRecommend.travelsId})"><img src="${travelsRecommend.img_url }" height="193" width="333" title="贵阳7日自由之旅" alt=""></a></div>
						</c:if>					
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="./common/footer.jsp"></jsp:include>
</div>

<!-- 智易行弹出框 -->
<script id="autoPlanpopup" type="text/template">
<div class="innerdiv f12 pd20" style="margin:0 auto; width:508px;">
	<div class="fitemwrap">
						<span class="item-title">出发地</span>
						<div class="form-item select-item mr10" style="width:186px;">
							<span class="select-text">贵阳</span>
							<i class="iicon i-select"></i>
							<select name="" id="">
								<option value="">贵阳</option>
								<option value="">类型2</option>
							</select>
						</div>												
					</div>
					<div class="fitemwrap">
						<span class="item-title">目的地</span>
						<div class="form-item select-item mr10" style="width:186px;">
							<span class="select-text">贵阳</span>
							<i class="iicon i-select"></i>
							<select name="" id="">
								<option value="">贵阳</option>
								<option value="">类型2</option>
							</select>
						</div>												
					</div>
					<div class="fitemwrap">
						<span class="item-title">浏览日期</span>
						<div class="form-item inline" style="width:186px;">
							<i class="iicon i-date"></i>
							<input class="datetime form-control" readonly placeholder="请选择日期" />
						</div>													
					</div>
					<div class="fitemwrap">
						<span class="item-title">预算</span>
						<div class="form-item inline" style="width:186px;">
							<input type="text" placeholder="如有预算请输入" />
						</div>													
					</div>
					<div class="fitemwrap">
						<span class="item-title">住宿</span>
						<div class="form-item select-item mr10" style="width:186px;">
							<span class="select-text">系统推荐</span>
							<i class="iicon i-select"></i>
							<select name="" id="">
								<option value="">系统推荐</option>
								<option value="">类型2</option>
							</select>
						</div>												
					</div>
					<div class="fitemwrap">
						<span class="item-title">人数</span>
						<div class="form-item spc-time inline" style="width:186px;">
							<span>成人</span>
							<input type="text" placeholder="如有预算请输入" />
						</div>
						<div class="form-item spc-time inline" style="width:186px;">
							<span>儿童</span>
							<input type="text" placeholder="如有预算请输入" />
						</div>													
					</div>
					<div class="fitemwrap">
						<span class="item-title">房间数</span>
						<div class="form-item select-item mr10" style="width:186px;">
							<span class="select-text">1</span>
							<i class="iicon i-select"></i>
							<select name="" id="">
								<option value="">1</option>
								<option value="">2</option>
								<option value="">3</option>
								<option value="">4</option>
								<option value="">5</option>
								<option value="">6</option>
								<option value="">7</option>
								<option value="">8</option>
								<option value="">9</option>
								<option value="">10</option>
							</select>
						</div>												
					</div>
					<div class="fitemwrap" style="padding:30px 0 0 50px;">
						<span class="btn myhobbybtn mr20">我的偏好 <span class="f30 inline vt">+</span></span>
						<button name="case-ok" class="btn lorgbtn mr20">下一步</button>
						<button name="case-no" class="btn cancelbtn">取消</button>
					</div>
</div>
</script>

<!-- 我的偏好弹出框 -->
<script id="myhobbypopup" type="text/template">
<div class="innerdiv f12 pd20" style="margin:0 auto; width:540px;">
	<div class="hobbyitem">
		<span class="l-title">自然风光</span>
		<div class="r-content">
			<span class="line-wrap"><i class="iicon i-dot"></i><span class="line-value"></span></span>
		</div>
	</div>
	<div class="hobbyitem">
		<span class="l-title">民族风俗</span>
		<div class="r-content">
			<span class="line-wrap"><i class="iicon i-dot"></i><span class="line-value"></span></span>
		</div>
	</div>
	<div class="hobbyitem">
		<span class="l-title">古韵风情</span>
		<div class="r-content">
			<span class="line-wrap"><i class="iicon i-dot"></i><span class="line-value"></span></span>
		</div>
	</div>
	<div class="hobbyitem">
		<span class="l-title">红色文化</span>
		<div class="r-content">
			<span class="line-wrap"><i class="iicon i-dot"></i><span class="line-value"></span></span>
		</div>
	</div>
	<div class="hobbyitem">
		<span class="l-title">徒步探险</span>
		<div class="r-content">
			<span class="line-wrap"><i class="iicon i-dot"></i><span class="line-value"></span></span>
		</div>
	</div>
	<div class="hobbyitem">
		<span class="l-title">生态养生</span>
		<div class="r-content">
			<span class="line-wrap"><i class="iicon i-dot"></i><span class="line-value"></span></span>
		</div>
	</div>
	<div class="hobbyitem">
		<span class="l-title">休闲娱乐</span>
		<div class="r-content">
			<span class="line-wrap"><i class="iicon i-dot"></i><span class="line-value"></span></span>
		</div>
	</div>
	<div class="hobbyitem">
		<span class="l-title">必去景点</span>
		<div class="r-content">
			<ul class="recommend-list clearfix">
				<li><img src="static/web/img/super1.jpg" width="110" height="80" /><span class="title"></span><i class="iicon i-check"></i></li>
				<li><img src="static/web/img/super2.jpg" width="110" height="80" /><span class="title"></span><i class="iicon i-check"></i></li>
				<li><img src="static/web/img/super3.jpg" width="110" height="80" /><span class="title"></span><i class="iicon i-check"></i></li>
				<li><img src="static/web/img/super4.jpg" width="110" height="80" /><span class="title"></span><i class="iicon i-check"></i></li>
				<li><img src="static/web/img/super5.jpg" width="110" height="80" /><span class="title"></span><i class="iicon i-check"></i></li>
				<li><img src="static/web/img/super6.jpg" width="110" height="80" /><span class="title"></span><i class="iicon i-check"></i></li>
			</ul>
		</div>
	</div>
	<div class="hobbyitem tc">
		<button name="case-ok" class="btn lorgbtn mr20">上一步</button>
		<button name="case-no" class="btn cancelbtn">确定</button>
	</div>
</div>
</script>
<!-- 正在创建行程弹出框 -->
<script id="createpopup" type="text/template">
<div class="innerdiv pt20 tc">
	<div class="creating">
		<p class="pb20 grey9 pt20">90%</p>
		<div class="pb20 mb20"><img src="static/web/images/loading.gif" /></div>
		<p class="lh2 lorange f12">正在创建行程，请等待一会哦~~<br />已耗时：00：33</p>
	</div>
	<div class="loaderror none"><p class="pb20 grey9 pt20">已耗时：00：33，导出失败</p>
		<div class="pb20 mb20"><img src="static/web/images/loaderror.jpg" /></div>
	<div class="tc"><button onclick="javascript:window.location='pc/simple/home';" class="btn lorgbtn">返回智易行</button></div></div>	
</div>
</script>
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
	
	
	// 智易行对话框
	var autoPlanDlg = new dialogBox({
		title : "智易行",
		contentHtml : $("#autoPlanpopup").html(),
		popupBoxW : 760,
		popupBoxH : 510,
		initEvent : function($dom){	
			selfDefineFormBtn();
			$dom.find('.datetime').datetimepicker({
				autoclose:1,
				format:"yyyy-mm-dd",
				minView: 2,	
				todayBtn: true
			});
			var myHobbyDlg = new dialogBox({
				title : "我的偏好",
				contentHtml : $("#myhobbypopup").html(),
				popupBoxW : 760,
				popupBoxH : 510,
				noCover : true,
				initEvent : function($dom){	
					$dom.find(".line-wrap").each(function(){
						$(this).slidetoValue();
					});
					$dom.find(".i-check").click(function(){
						if($(this).hasClass("checked")){
							$(this).removeClass("checked");
						} else {
							$(this).addClass("checked");
						}
					});
				}
			});
			$dom.find(".myhobbybtn").click(function(){
				myHobbyDlg.showDlg();
			});
		},
		okFunc : function(){
			createDlg.showDlg(function($dom){
				window.setTimeout(function(){
					loadError( $dom.find(".innerdiv") );
				},3000);
			});
		}
	});

	$("[name=autoplan]").click(function(){
		autoPlanDlg.showDlg();
	});

	// 正在创建行程对话框
	var createDlg = new dialogBox({
		title : "提示",
		contentHtml : $("#createpopup").html(),
		popupBoxW : 485,
		popupBoxH : 310,
		closeBtnshow : false,
		coverhide : false,
		selfClass : "type3",
		initEvent : function($dom){		
			$dom.find("button").click(function(){
				createDlg.hideDlg();
				autoPlanDlg.showDlg();
				creating( $dom.find(".innerdiv") );
			});	
		}
	});

	function loadError($dom){
		$dom.find(".creating").hide();
		$dom.find(".loaderror").show();		
	}

	function creating($dom){
		$dom.find(".loaderror").hide();
		$dom.find(".creating").show();
	}
	
	<c:if test="${op eq 'open' }">
	$("[name=autoplan]").click();
	</c:if>
});

// 滑动条
$.fn.extend({
	slidetoValue:function(){
		var _self = $(this); //line-wrap
		var _dot = _self.find(".i-dot");
		var _value = _self.find(".line-value");
		_dot.mousedown(function(e){
			var e = e || window.event;
			var eLeft = e.clientX;			
			var _left = parseInt( _dot.css("left") );
			var _w = _value.width();
			$(this).bind("mousemove",function(e){
				var e = e || window.event;
				var curEleft = e.clientX;
				var move = curEleft - eLeft;
				if( (_w + move) >= _self.width() || (_w + move) <= 0 ) return;
				_dot.css("left",_left + move);
				_value.css("width",_w + move);
			});
		}).mouseup(function(){
			$(this).unbind("mousemove");
		});
		$(document).mouseup(function(){
			_dot.unbind("mousemove");
		});
	}
});

var search =function(){
	var title = $("#searchInput").val();
	title = encodeURI(encodeURI(title));
	window.location.href="<%=basePath %>pc/search?fromType=home&title="+title;
}

function enterSearch(){
	var event=arguments.callee.caller.arguments[0]||window.event;//消除浏览器差异  
	if (event.keyCode == 13){  
		search();
	} 
}
//跳转到文章页面
function goTravels(id){
	window.location.href="<%=basePath %>pc/travels/detial/0_"+id;
}

function gofriendList(){
	window.location.href="<%=basePath %>pc/interact/frendEnlist";
}

function goMasterIndex(){
	window.location.href="<%=basePath %>pc/travels/masterIndex";
}

</script>
</body>
</html>