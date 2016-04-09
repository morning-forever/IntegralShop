<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../../../static/inc_web.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath %>">
<title>漫游商城－酒店</title>
<!-- 日期时间控件 -->
<link href="js/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
<link rel="stylesheet" href="static/web/css/common.css" />
<link rel="stylesheet" href="static/web/css/inner.style.css" />
<link rel="stylesheet" href="static/web/css/inner.page.css" />
</head>
<body>
<div class="wrapper inner">
	<!-- header -->
	<div class="header">
		<div class="topbar">
			<div class="content clearfix">
				<div class="fl">
					<span class="haslogin hasdownlist"><img src="static/web/img/avatar.jpg" class="avatar vm mr10" height="28" width="28" alt="">Hi  Mary<span class="downlist"><a href="">我的主页</a><a href="">订单管理</a><a href="">个人资料</a><a href="">账户设置</a><a href="">退出登录</a></span></span>
					<span class="userMsg hasdownlist"><i class="iicon i-news"></i>消息<span class="downlist"><a href="">评论消息(3)</a><a href="">通知消息(2)</a></span></span>
				</div>
				<div class="fr">
					<span class="appdown hasdownlist"><i class="iicon i-app"></i>APP下载<span class="appcode"><img src="static/web/images/twovcode.jpg" height="128" width="128" alt=""></span></span><span class="span-spc"><i class="iicon i-about"></i><a href="">关于我们</a></span><span class="social-span"><a href="" class="iicon i-weixin"></a><a href="" class="iicon i-qq"></a><a href="" class="iicon i-weibo"></a></span>
				</div>
			</div>
		</div>		
		<div class="inner_nav_wrap rel">
			<div class="content rel">
				<a href="#"><img src="static/web/images/logo.png" height="59" width="176" alt="" class="logo"></a>	
				<div class="search_wrapper abs"><i class="iicon i-search"></i><input class="search-text" type="text" placeholder="请输入关键词" /><button class="search-btn">搜 索</button></div>
				<div class="contact400">
					<span class="i-contact"></span>
					<span class="f18 bold">400-820-8820</span>
				</div>
			</div>										
		</div>				
		<div class="nav_ul_wrap">
			<ul class="nav clearfix">
				<li><a href="#">首页</a></li>
				<li><a href="#">智能定制</a></li>
				<li class="active">
					<a href="pc/cart/home">快旅▪漫游</a>
					<div class="level2_nav">
						<div class="fl">
							<h3>快旅出行</h3>
							<div><a href="#">快旅租车</a><a href="#">快旅包车</a><a href="#">快旅班车</a><a href="#">快旅拼车</a></div>
						</div>
						<div class="fl">
							<h3>漫游商城</h3>
							<div>
							<a href="pc/mall/scenicGoodsList">景区</a>
							<a href="pc/mall/hotelGoodsList">酒店</a>
							<a href="pc/mall/caterGoodsList">餐饮</a>
							<a href="pc/mall/equipGoodsList">装备</a>
							</div>
						</div>
					</div>
				</li>
				<li><a href="#">主题深度游</a></li>
				<li><a href="#">互动社区</a></li>
			</ul>
		</div>
	</div>

	<!-- page content -->
	<div class="content_wrap pb90">
		<div class="content clearfix">
			<div class="breadcrumb">当前位置：<a href="">首页</a><a href="">漫游商城</a><a href="">酒店</a><span>贵阳</span></div>
			<div class="whitebg mb10">
				<!-- 用户自定义筛选条件 -->				
				<div class="ctgselect_wrap selfdefine_ctg">
					<span class="ctgname">目的地</span>
					<div class="form-item select-item inline" style="width:186px;">
						<span class="select-text">全部</span>
						<i class="iicon i-select"></i>
						<select name="" id="">
							<option value="">全部</option>
							<option value="">类型2</option>
						</select>
					</div>
					<span class="ctgname">入住时间</span>
					<div class="form-item inline" style="width:186px;">
						<i class="iicon i-date"></i>
						<input class="datetime form-control" readonly type="text" />
					</div>
					<span class="ctgname">结束时间</span>
					<div class="form-item inline" style="width:186px;">
						<i class="iicon i-date"></i>
						<input class="datetime form-control" readonly type="text" />
					</div>
					<button class="btn lorgbtn">搜索</button>
				</div>				
			</div>
			<div class="whitebg mb5">
				<!-- 分类筛选条件 -->
				<div class="ctgallwrap">
					<div class="ctgselect_wrap">
						<span class="ctgname">位置</span>
						<a href="#" class="ctgvalue">全部</a><a href="#" class="ctgvalue">火车站</a><a href="#" class="ctgvalue active">景区</a><a href="#" class="ctgvalue">商圈</a><a href="#" class="ctgvalue">飞机场／火车站／客运站</a><a href="#" class="ctgvalue">地铁站</a>
					</div>
					<div class="ctgselect_wrap lessspace_wrap">
						<span class="ctgname">价格</span>
						<a href="#" class="ctgvalue active">全部</a><a href="#" class="ctgvalue">150元以下</a><a href="#" class="ctgvalue">150-300元</a><a href="#" class="ctgvalue">300-600元</a><a href="#" class="ctgvalue">600以上</a>
						<div class="selfdefind_price">
							自定义&nbsp;&nbsp;<input type="text" /> — <input type="text" class="mr20" /> <span class="btn formbtn mr10">清除</span><button class="btn formbtn orgbtn">确定</button>
						</div>
					</div>
					<div class="ctgselect_wrap">
						<span class="ctgname">星级</span>
						<a href="#" class="ctgvalue">全部</a><a href="#" class="ctgvalue active">五星级/豪华型</a><a href="#" class="ctgvalue">四星级/品质型</a><a href="#" class="ctgvalue">三星级/舒适性</a><a href="#" class="ctgvalue">二星级/简约型</a>
					</div>
					<div class="ctgselect_wrap">
						<span class="ctgname">品牌</span>
						<a href="#" class="ctgvalue">全部</a><a href="#" class="ctgvalue">如家</a><a href="#" class="ctgvalue active">锦江之星</a><a href="#" class="ctgvalue">莫泰</a><a href="#" class="ctgvalue">速8</a><a href="#" class="ctgvalue">华美达</a><a href="#" class="ctgvalue">豪庭国际</a><a href="#" class="ctgvalue">布丁</a><a href="#" class="ctgvalue">豪庭国际</a>
					</div>
					<div class="ctgselect_wrap">
						<span class="ctgname">主题</span>
						<a href="#" class="ctgvalue active">全部</a><a href="#" class="ctgvalue">客栈/民宿</a><a href="#" class="ctgvalue">青年旅社</a><a href="#" class="ctgvalue">情侣酒店</a><a href="#" class="ctgvalue">温泉酒店</a><a href="#" class="ctgvalue">海景酒店</a><a href="#" class="ctgvalue">精品酒店</a>
					</div>
				</div>
				
				<!-- 已筛选结果 -->
				<div class="ctgresult">
					<div class="f12 grey9 pb10"><span class="f14 orange">16</span> 个景点满足条件</div>
					<div class="itemwrap"><span class="item">大别山<i class="iicon i-del"></i></span><span class="varrow">&gt;</span><span class="item">黄果树<i class="iicon i-del"></i></span><span class="varrow">&gt;</span><span class="item">动物园<i class="iicon i-del"></i></span><button class="btn formbtn orgbtn">清空条件</button></div>
				</div>
			</div>

			<div class="whitebg hotallist_wrap">
				<!-- 排序 -->
				<div class="sortwrap clearfix">
					<a href="">默认</a>
					<a class="sort-des" href="">热门<i class="iicon"></i></a>
					<a class="sort-des active" href="">好评<i class="iicon"></i></a>
					<a class="sort-res" href="">最新<i class="iicon"></i></a>
					<a class="sort-res" href="">销量<i class="iicon"></i></a>
					<a class="sort-res" href="">价格<i class="iicon"></i></a>
				</div>

				<!-- 推荐酒店列表 -->
				<div class="hotalunit">
					<div class="clearfix">
						<img class="hotal-img" src="static/web/img/hotal.jpg" height="112" width="173" alt="">
						<div class="info">
							<h3>如家酒店(苹果园地铁站店)</h3>
							<p class="grey"><i class="iicon i-tag mr10"></i>石景山区阜石路300号，苹果园地铁口AD出口西行300米，喜隆多商场</p>
							<span class="price">￥<span class="f24 bold">237.00</span><span class="f12 grey9">起</span></span>
							<span class="judge">好评率90%</span>
						</div>
					</div>					
					<ul class="horizontal_ul">
						<li>
							<span class="col1">大床房</span>
							<span class="col2">大床</span>
							<span class="col3">不含早餐</span>
							<span class="col4">￥<span class="f20 bold">237.00</span>&nbsp;<span class="f12 oldprice">¥320.00</span></span>
							<a class="btn morgbtn mr10" href="pc/mall/hotleGoodsDetialOfIntroduce">查看详情</a>
							<a class="btn morgbtn" href="pc/mall/hotleGoodsDetialBeforePay">立即预定</a>
						</li>
						<li>
							<span class="col1">商务大床房</span>
							<span class="col2">大床</span>
							<span class="col3">免费早餐</span>
							<span class="col4">￥<span class="f20 bold">237.00</span>&nbsp;<span class="f12 oldprice">¥320.00</span></span>
							<a class="btn morgbtn mr10" href="pc/mall/hotleGoodsDetialOfIntroduce">查看详情</a>
							<a class="btn morgbtn" href="pc/mall/hotleGoodsDetialBeforePay">立即预定</a>
						</li>
						<li>
							<span class="col1">标准间</span>
							<span class="col2">大床</span>
							<span class="col3">可用时间<br/><span class="f12">08：00－22:00</span></span>
							<span class="col4">￥<span class="f20 bold">237.00</span>&nbsp;<span class="f12 oldprice">¥320.00</span></span>
							<a class="btn morgbtn mr10" href="pc/mall/hotleGoodsDetialOfIntroduce">查看详情</a>
							<a class="btn morgbtn" href="pc/mall/hotleGoodsDetialBeforePay">立即预定</a>
						</li>
					</ul>
					<span class="expandall">展开剩余1个</span>
				</div>
				<div class="hotalunit">
					<div class="clearfix">
						<img class="hotal-img" src="static/web/img/hotal.jpg" height="112" width="173" alt="">
						<div class="info">
							<h3>如家酒店(苹果园地铁站店)</h3>
							<p class="grey"><i class="iicon i-tag mr10"></i>石景山区阜石路300号，苹果园地铁口AD出口西行300米，喜隆多商场</p>
							<span class="price">￥<span class="f24 bold">237.00</span><span class="f12 grey9">起</span></span>
							<span class="judge">好评率90%</span>
						</div>
					</div>					
					<ul class="horizontal_ul">
						<li>
							<span class="col1">大床房</span>
							<span class="col2">大床</span>
							<span class="col3">不含早餐</span>
							<span class="col4">￥<span class="f20 bold">237.00</span>&nbsp;<span class="f12 oldprice">¥320.00</span></span>
							<a class="btn morgbtn mr10" href="">查看详情</a>
							<a class="btn morgbtn" href="">立即预定</a>
						</li>
						<li>
							<span class="col1">商务大床房</span>
							<span class="col2">大床</span>
							<span class="col3">免费早餐</span>
							<span class="col4">￥<span class="f20 bold">237.00</span>&nbsp;<span class="f12 oldprice">¥320.00</span></span>
							<a class="btn morgbtn mr10" href="">查看详情</a>
							<a class="btn morgbtn" href="">立即预定</a>
						</li>
						<li>
							<span class="col1">标准间</span>
							<span class="col2">大床</span>
							<span class="col3">可用时间<br/><span class="f12">08：00－22:00</span></span>
							<span class="col4">￥<span class="f20 bold">237.00</span>&nbsp;<span class="f12 oldprice">¥320.00</span></span>
							<a class="btn morgbtn mr10" href="">查看详情</a>
							<a class="btn morgbtn" href="">立即预定</a>
						</li>
						<li>
							<span class="col1">标准间</span>
							<span class="col2">大床</span>
							<span class="col3">可用时间<br/><span class="f12">08：00－22:00</span></span>
							<span class="col4">￥<span class="f20 bold">237.00</span>&nbsp;<span class="f12 oldprice">¥320.00</span></span>
							<a class="btn morgbtn mr10" href="">查看详情</a>
							<a class="btn morgbtn" href="">立即预定</a>
						</li>
					</ul>
					<span class="expandall">收起</span>
				</div>
				<div class="hotalunit">
					<div class="clearfix">
						<img class="hotal-img" src="static/web/img/hotal.jpg" height="112" width="173" alt="">
						<div class="info">
							<h3>如家酒店(苹果园地铁站店)</h3>
							<p class="grey"><i class="iicon i-tag mr10"></i>石景山区阜石路300号，苹果园地铁口AD出口西行300米，喜隆多商场</p>
							<span class="price">￥<span class="f24 bold">237.00</span><span class="f12 grey9">起</span></span>
							<span class="judge">好评率90%</span>
						</div>
					</div>					
					<ul class="horizontal_ul">
						<li>
							<span class="col1">大床房</span>
							<span class="col2">大床</span>
							<span class="col3">不含早餐</span>
							<span class="col4">￥<span class="f20 bold">237.00</span>&nbsp;<span class="f12 oldprice">¥320.00</span></span>
							<a class="btn morgbtn mr10" href="">查看详情</a>
							<a class="btn morgbtn" href="">立即预定</a>
						</li>
						<li>
							<span class="col1">商务大床房</span>
							<span class="col2">大床</span>
							<span class="col3">免费早餐</span>
							<span class="col4">￥<span class="f20 bold">237.00</span>&nbsp;<span class="f12 oldprice">¥320.00</span></span>
							<a class="btn morgbtn mr10" href="">查看详情</a>
							<a class="btn morgbtn" href="">立即预定</a>
						</li>
						<li>
							<span class="col1">标准间</span>
							<span class="col2">大床</span>
							<span class="col3">可用时间<br/><span class="f12">08：00－22:00</span></span>
							<span class="col4">￥<span class="f20 bold">237.00</span>&nbsp;<span class="f12 oldprice">¥320.00</span></span>
							<a class="btn morgbtn mr10" href="">查看详情</a>
							<a class="btn morgbtn" href="">立即预定</a>
						</li>
					</ul>
					<span class="expandall">展开剩余1个</span>
				</div>
				<div class="hotalunit">
					<div class="clearfix">
						<img class="hotal-img" src="static/web/img/hotal.jpg" height="112" width="173" alt="">
						<div class="info">
							<h3>如家酒店(苹果园地铁站店)</h3>
							<p class="grey"><i class="iicon i-tag mr10"></i>石景山区阜石路300号，苹果园地铁口AD出口西行300米，喜隆多商场</p>
							<span class="price">￥<span class="f24 bold">237.00</span><span class="f12 grey9">起</span></span>
							<span class="judge">好评率90%</span>
						</div>
					</div>					
					<ul class="horizontal_ul">
						<li>
							<span class="col1">大床房</span>
							<span class="col2">大床</span>
							<span class="col3">不含早餐</span>
							<span class="col4">￥<span class="f20 bold">237.00</span>&nbsp;<span class="f12 oldprice">¥320.00</span></span>
							<a class="btn morgbtn mr10" href="">查看详情</a>
							<a class="btn morgbtn" href="">立即预定</a>
						</li>
						<li>
							<span class="col1">商务大床房</span>
							<span class="col2">大床</span>
							<span class="col3">免费早餐</span>
							<span class="col4">￥<span class="f20 bold">237.00</span>&nbsp;<span class="f12 oldprice">¥320.00</span></span>
							<a class="btn morgbtn mr10" href="">查看详情</a>
							<a class="btn morgbtn" href="">立即预定</a>
						</li>
						<li>
							<span class="col1">标准间</span>
							<span class="col2">大床</span>
							<span class="col3">可用时间<br/><span class="f12">08：00－22:00</span></span>
							<span class="col4">￥<span class="f20 bold">237.00</span>&nbsp;<span class="f12 oldprice">¥320.00</span></span>
							<a class="btn morgbtn mr10" href="">查看详情</a>
							<a class="btn morgbtn" href="">立即预定</a>
						</li>
						<li>
							<span class="col1">标准间</span>
							<span class="col2">大床</span>
							<span class="col3">可用时间<br/><span class="f12">08：00－22:00</span></span>
							<span class="col4">￥<span class="f20 bold">237.00</span>&nbsp;<span class="f12 oldprice">¥320.00</span></span>
							<a class="btn morgbtn mr10" href="">查看详情</a>
							<a class="btn morgbtn" href="">立即预定</a>
						</li>
					</ul>
					<span class="expandall">收起</span>
				</div>
			</div>
			
			<!-- 分页  -->
			<div class="pagination">
				<a class="disabled" href="#">上一页</a>
				<a class="current" href="#">1</a>
				<a href="#">2</a>
				<a href="#">3</a>
				<span class="p_text">...</span>
				<a href="#">8</a>
				<a href="#">下一页</a>
				<span class="p_text">共8页，到第</span>
				<input class="gotopage" type="text" value="1" /> 页
				<input type="button" value="确定" />
			</div>

		</div>			
	</div>

	<!-- footer -->
	<div class="indexfooter footer">
		<div class="content tc">
			<div class="olinks_wrap">
				<h3>合作伙伴<br/>Partner</h3>
				<div class="olinks">
					<a href="">加拿大旅游局</a>
					<a href="">加拿大旅游局</a>
					<a href="">加拿大旅游局</a>
					<a href="">加拿大旅游局</a>
					<a href="">加拿大旅游局</a>
					<a href="">加拿大旅游局</a>
					<a href="">加拿大旅游局</a>
					<a href="">加拿大旅游局</a>
					<a href="">加拿大旅游局</a>
					<a href="">加拿大旅游局</a>
				</div>
			</div>
			<p class="mb20 fourlinks"><a href="">关于我们</a><span class="divid-line"></span><a href="">联系我们</a><span class="divid-line"></span><a href="">帮助中心</a><span class="divid-line"></span><a href="">用户协议</a></p>
			<p class="copyright">Copyright 2015 贵州正礼服务有限公司。 著作权所有，并保留一切权利。 黔ICP备05049XXXX</p>
		</div>
	</div>
</div>

<!-- 日期时间控件 -->
<script type="text/javascript" src="static/web/js/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="static/web/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="static/web/js/base.js"></script>
<script type="text/javascript">
$(function(){
	$('.datetime').datetimepicker({
		autoclose:1,
		format:"yyyy-mm-dd",
		minView: 2,
		todayBtn: true
	});
	selfDefineFormBtn();
});
</script>
</body>
</html>