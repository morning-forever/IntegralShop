<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../../../static/inc_web.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath %>">
<title>漫游商城-餐饮</title>
<link rel="stylesheet" href="static/web//css/common.css" />
<link rel="stylesheet" href="static/web//css/inner.style.css" />
<link rel="stylesheet" href="static/web//css/inner.page.css" />
</head>
<body>
<div class="wrapper inner">
	<!-- header -->
	<div class="header">
		<div class="topbar">
			<div class="content clearfix">
				<div class="fl">
					<span class="haslogin hasdownlist"><img src="static/img/avatar.jpg" class="avatar vm mr10" height="28" width="28" alt="">Hi  Mary<span class="downlist"><a href="">我的主页</a><a href="">订单管理</a><a href="">个人资料</a><a href="">账户设置</a><a href="">退出登录</a></span></span>
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
			<div class="breadcrumb">当前位置：<a href="">首页</a><a href="">漫游商城</a><a href="">餐饮</a><span>贵阳</span></div>
			<div class="whitebg mb5">
				<!-- 分类筛选条件 -->
				<div class="ctgallwrap">
					<div class="ctgselect_wrap">
						<span class="ctgname">分类</span>
						<a href="#" class="ctgvalue">全部</a><a href="#" class="ctgvalue">代金券</a><a href="#" class="ctgvalue active">火锅</a><a href="#" class="ctgvalue">西餐</a><a href="#" class="ctgvalue">川湘菜</a><a href="#" class="ctgvalue">海鲜</a><a href="#" class="ctgvalue">家常菜</a><a href="#" class="ctgvalue">韩国料理</a><a href="#" class="ctgvalue">东北菜</a>
					</div>
					<div class="ctgselect_wrap">
						<span class="ctgname">区域</span>
						<a href="#" class="ctgvalue active">全部</a><a href="#" class="ctgvalue">都均市</a><a href="#" class="ctgvalue">惠水县</a><a href="#" class="ctgvalue">龙里县</a><a href="#" class="ctgvalue">罗县</a>
					</div>
					<div class="ctgselect_wrap">
						<span class="ctgname">人数</span>
						<a href="#" class="ctgvalue active">全部</a><a href="#" class="ctgvalue">单人餐</a><a href="#" class="ctgvalue">双人餐</a><a href="#" class="ctgvalue">5-6人餐</a><a href="#" class="ctgvalue">7-8人餐</a><a href="#" class="ctgvalue">9-10人餐</a><a href="#" class="ctgvalue">10人以上</a><a href="#" class="ctgvalue">其他</a>
					</div>
					<div class="ctgselect_wrap lessspace_wrap">
						<span class="ctgname">价格</span>
						<a href="#" class="ctgvalue active">全部</a><a href="#" class="ctgvalue">150元以下</a><a href="#" class="ctgvalue">150-300元</a><a href="#" class="ctgvalue">300-600元</a><a href="#" class="ctgvalue">600以上</a>
						<div class="selfdefind_price">
							自定义&nbsp;&nbsp;<input type="text" /> — <input type="text" class="mr20" /> <span class="btn formbtn mr10">清除</span><button class="btn formbtn orgbtn">确定</button>
						</div>
					</div>
				</div>
				
				<!-- 已筛选结果 -->
				<div class="ctgresult">
					<div class="f12 grey9 pb10"><span class="f14 orange">16</span> 家餐饮满足条件</div>
					<div class="itemwrap"><span class="item">火锅<i class="iicon i-del"></i></span><span class="varrow">&gt;</span><span class="item">都均市<i class="iicon i-del"></i></span><span class="varrow">&gt;</span><span class="item">全部<i class="iicon i-del"></i></span><button class="btn formbtn orgbtn">清空条件</button></div>
				</div>
			</div>

			<div class="whitebg">
				<!-- 排序 -->
				<div class="sortwrap clearfix">
					<a class="active" href="">默认</a>
					<a class="sort-des" href="">热门<i class="iicon"></i></a>
					<a class="sort-des" href="">最新<i class="iicon"></i></a>
					<a class="sort-res" href="">价格<i class="iicon"></i></a>
				</div>
				<!-- 产品列表 -->
				<div class="listwrap type3 type3_3">
					<ul class="list_ul clearfix">
						<li>
							<a href="pc/mall/caterGoodsDetialOfIntroduce"><img src="static/web/img/food1.jpg" width="100%" alt=""></a>
							<div class="incont">
								<h4><a href="pc/mall/caterGoodsDetialOfIntroduce">金釜山烤肉店[汉口区]</a></h4>
								<div class="rel"><span class="lorange">￥98</span>&nbsp;&nbsp;<span class="orderprice">￥120</span></div>							
							</div>							
						</li>
						<li>
							<a href=""><img src="static/web/img/food2.jpg" width="100%" alt=""></a>
							<div class="incont">
								<h4><a href="">金釜山烤肉店[汉口区]</a></h4>
								<div class="rel"><span class="lorange">￥98</span>&nbsp;&nbsp;<span class="orderprice">￥120</span></div>							
							</div>							
						</li>
						<li>
							<a href=""><img src="static/web/img/food3.jpg" width="100%" alt=""></a>
							<div class="incont">
								<h4><a href="">海底捞火锅店[汉口区]</a></h4>
								<div class="rel"><span class="lorange">￥98</span>&nbsp;&nbsp;<span class="orderprice">￥120</span></div>							
							</div>							
						</li>
						<li>
							<a href=""><img src="static/web/img/food4.jpg" width="100%" alt=""></a>
							<div class="incont">
								<h4><a href="">小肥羊火锅店[武昌区]</a></h4>
								<div class="rel"><span class="lorange">￥198</span>&nbsp;&nbsp;<span class="orderprice">￥120</span></div>							
							</div>							
						</li>
						<li>
							<a href=""><img src="static/web/img/food5.jpg" width="100%" alt=""></a>
							<div class="incont">
								<h4><a href="">金釜山烤肉店[汉口区]</a></h4>
								<div class="rel"><span class="lorange">￥98</span>&nbsp;&nbsp;<span class="orderprice">￥120</span></div>							
							</div>							
						</li>
						<li>
							<a href=""><img src="static/web/img/food6.jpg" width="100%" alt=""></a>
							<div class="incont">
								<h4><a href="">金釜山烤肉店[汉口区]</a></h4>
								<div class="rel"><span class="lorange">￥98</span>&nbsp;&nbsp;<span class="orderprice">￥120</span></div>							
							</div>							
						</li>
						<li>
							<a href=""><img src="static/web/img/food7.jpg" width="100%" alt=""></a>
							<div class="incont">
								<h4><a href="">海底捞火锅店[汉口区]</a></h4>
								<div class="rel"><span class="lorange">￥98</span>&nbsp;&nbsp;<span class="orderprice">￥120</span></div>							
							</div>							
						</li>
						<li>
							<a href=""><img src="static/web/img/food8.jpg" width="100%" alt=""></a>
							<div class="incont">
								<h4><a href="">小肥羊火锅店[武昌区]</a></h4>
								<div class="rel"><span class="lorange">￥198</span>&nbsp;&nbsp;<span class="orderprice">￥120</span></div>							
							</div>							
						</li>
						<li>
							<a href=""><img src="static/web/img/food1.jpg" width="100%" alt=""></a>
							<div class="incont">
								<h4><a href="">金釜山烤肉店[汉口区]</a></h4>
								<div class="rel"><span class="lorange">￥98</span>&nbsp;&nbsp;<span class="orderprice">￥120</span></div>							
							</div>							
						</li>
						<li>
							<a href=""><img src="static/web/img/food2.jpg" width="100%" alt=""></a>
							<div class="incont">
								<h4><a href="">金釜山烤肉店[汉口区]</a></h4>
								<div class="rel"><span class="lorange">￥98</span>&nbsp;&nbsp;<span class="orderprice">￥120</span></div>							
							</div>							
						</li>
						<li>
							<a href=""><img src="static/web/img/food3.jpg" width="100%" alt=""></a>
							<div class="incont">
								<h4><a href="">海底捞火锅店[汉口区]</a></h4>
								<div class="rel"><span class="lorange">￥98</span>&nbsp;&nbsp;<span class="orderprice">￥120</span></div>							
							</div>							
						</li>
						<li>
							<a href=""><img src="static/web/img/food4.jpg" width="100%" alt=""></a>
							<div class="incont">
								<h4><a href="">小肥羊火锅店[武昌区]</a></h4>
								<div class="rel"><span class="lorange">￥198</span>&nbsp;&nbsp;<span class="orderprice">￥120</span></div>							
							</div>							
						</li>
						<li>
							<a href=""><img src="static/web/img/food5.jpg" width="100%" alt=""></a>
							<div class="incont">
								<h4><a href="">金釜山烤肉店[汉口区]</a></h4>
								<div class="rel"><span class="lorange">￥98</span>&nbsp;&nbsp;<span class="orderprice">￥120</span></div>							
							</div>							
						</li>
						<li>
							<a href=""><img src="static/web/img/food6.jpg" width="100%" alt=""></a>
							<div class="incont">
								<h4><a href="">金釜山烤肉店[汉口区]</a></h4>
								<div class="rel"><span class="lorange">￥98</span>&nbsp;&nbsp;<span class="orderprice">￥120</span></div>							
							</div>							
						</li>
						<li>
							<a href=""><img src="static/web/img/food7.jpg" width="100%" alt=""></a>
							<div class="incont">
								<h4><a href="">海底捞火锅店[汉口区]</a></h4>
								<div class="rel"><span class="lorange">￥98</span>&nbsp;&nbsp;<span class="orderprice">￥120</span></div>							
							</div>							
						</li>
						<li>
							<a href=""><img src="static/web/img/food8.jpg" width="100%" alt=""></a>
							<div class="incont">
								<h4><a href="">小肥羊火锅店[武昌区]</a></h4>
								<div class="rel"><span class="lorange">￥198</span>&nbsp;&nbsp;<span class="orderprice">￥120</span></div>							
							</div>							
						</li>			
					</ul>
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

<script type="text/javascript" src="static/web/js/index.js"></script>
<script type="text/javascript">
$(function(){
	scrollBannerInit($(".banner-ul"),$(".banner-btn"));
});
</script>
</body>
</html>