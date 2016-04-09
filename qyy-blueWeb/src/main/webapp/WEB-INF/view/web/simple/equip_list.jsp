<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transition al.dtd"><%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../../static/inc_web.jsp" %>
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv = "X-UA-Compatible" content = "IE=edge,chrome=1 " /><meta charset="utf-8"> 
<title>行程方案-装备清单</title>
<link rel="stylesheet" href="static/web/css/common.css" />
<link rel="stylesheet" href="static/web/css/inner.style.css" />
<link rel="stylesheet" href="static/web/css/travel.plan.css" />
</head>
<body>
<div class="wrapper inner">
	<!-- header -->
	<div class="header">
		<jsp:include page="../common/header.jsp"></jsp:include>
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
				<li><a href="pc/home">首页</a></li>
				<li class="active"><a href="pc/simple/home">智易行</a></li>
				<li><a href="pc/cart/home">快旅▪漫游</a></li>
				<li><a href="pc/depth/home">主题深度游</a></li>
				<li><a href="pc/interact/home">互动社区</a></li>
			</ul>
		</div>
	</div>

	<!-- page content -->
	<div class="content_wrap pt20 pb90">
		<div class="content clearfix">
			<div class="topbox whitebg mb20">
				<div class="pl20"><span class="tagspan">行程方案</span></div>
				<div class="itemwrap">
					<span class="item"><span class="item-l">行程日期</span>2015-6-11至2015-6-14</span>
					<span class="item"><span class="item-l">原始预算</span>无具体预算/1000元</span>
					<span class="item"><span class="item-l">原始总费用 </span><span class="orange">￥<span class="f24">774</span></span></span>
					<span class="item"><span class="item-l">同行人数</span>2成人，0儿童</span>
					<span class="item"><span class="item-l">起始地</span>贵州</span>
					<span class="item"><span class="item-l">目的地</span>贵阳</span>
				</div>
				<div class="clearfix pl20 pr20 pb20">
					<a href="pc/simple/destine" class="btn lorgbtn fr"><i class="iicon i-order mr10"></i>我要预定</a>
					<a href="" class="btn lwhitebtn mr20">收藏我的行程</a>
					<a href="" class="btn lwhitebtn mr20">重新运算行程</a>
					<a href="" class="btn lwhitebtn">建新行程</a>
				</div>
			</div>

			<ul class="atab clearfix">
				<li><a href="pc/simple/home">行程计划</a></li>
				<li><a href="pc/simple/travelDetail">行程明细</a></li>
				<li><a href="pc/simple/budgetDetail">预算明细</a></li>
				<li class="active"><a href="pc/simple/equipList">装备清单</a></li>
				<li><a href="pc/simple/downlineActivity?op=scenic">线下活动</a></li>
			</ul>
			<div class="tab-content pd20 whitebg">
				<p class="mb20 tr"><a href="" class="inline"><i class="iicon i-print"></i><span class="underline grey ml10">打印</span></a></p>
				<table width="100%" class="table cost-detail mb20">
					<tr>
						<th width="16%">分类</th>
						<th>要带的东西</th>
					</tr>
					<tr>
						<td class="rowspan">证件/金钱</td>
						<td>
							<div class="tl pt10">
								<span class="item"><i class="iicon i-check checked"></i>签证</span>
								<span class="item"><i class="iicon i-check"></i>护照/身份证/其他证件</span>
								<span class="item"><i class="iicon i-check"></i>旅行支票</span>
								<span class="item"><i class="iicon i-check checked"></i>巴士票</span>
								<span class="item"><i class="iicon i-check"></i>机票</span>
								<span class="item"><i class="iicon i-check"></i>火车票</span>
								<span class="item"><i class="iicon i-check checked"></i>船票</span>
								<span class="item"><i class="iicon i-check"></i>驾驶执照</span>
								<span class="item"><i class="iicon i-check"></i>酒店预订单</span>
								<span class="item"><i class="iicon i-check checked"></i>旅游保险</span>
								<span class="item"><i class="iicon i-check"></i>防疫注射</span>
								<span class="item"><i class="iicon i-check"></i>电话卡</span>		
								<span class="item"><i class="iicon i-check"></i>漫游处理</span>
								<span class="item"><i class="iicon i-check"></i>信用卡</span>
								<span class="item"><i class="iicon i-check"></i>当地货币</span>
								<span class="item"><i class="iicon i-check"></i>美元货币</span>
							</div>							
						</td>
					</tr>
					<tr>
						<td class="rowspan">个人物品</td>
						<td>
							<div class="tl pt10">
								<span class="item"><i class="iicon i-check checked"></i>签证</span>
								<span class="item"><i class="iicon i-check"></i>护照/身份证/其他证件</span>
								<span class="item"><i class="iicon i-check"></i>旅行支票</span>
								<span class="item"><i class="iicon i-check checked"></i>巴士票</span>
								<span class="item"><i class="iicon i-check"></i>机票</span>
								<span class="item"><i class="iicon i-check"></i>火车票</span>
								<span class="item"><i class="iicon i-check checked"></i>船票</span>
								<span class="item"><i class="iicon i-check"></i>驾驶执照</span>
								<span class="item"><i class="iicon i-check"></i>酒店预订单</span>
								<span class="item"><i class="iicon i-check checked"></i>旅游保险</span>
								<span class="item"><i class="iicon i-check"></i>防疫注射</span>
								<span class="item"><i class="iicon i-check"></i>电话卡</span>		
								<span class="item"><i class="iicon i-check"></i>漫游处理</span>
								<span class="item"><i class="iicon i-check"></i>信用卡</span>
								<span class="item"><i class="iicon i-check"></i>当地货币</span>
								<span class="item"><i class="iicon i-check"></i>美元货币</span>
							</div>							
						</td>
					</tr>
					<tr>
						<td class="rowspan">护理</td>
						<td>
							<div class="tl pt10">
								<span class="item"><i class="iicon i-check checked"></i>签证</span>
								<span class="item"><i class="iicon i-check"></i>护照/身份证/其他证件</span>
								<span class="item"><i class="iicon i-check"></i>旅行支票</span>
								<span class="item"><i class="iicon i-check checked"></i>巴士票</span>
								<span class="item"><i class="iicon i-check"></i>机票</span>
								<span class="item"><i class="iicon i-check"></i>火车票</span>
								<span class="item"><i class="iicon i-check checked"></i>船票</span>
								<span class="item"><i class="iicon i-check"></i>驾驶执照</span>
								<span class="item"><i class="iicon i-check"></i>酒店预订单</span>
								<span class="item"><i class="iicon i-check checked"></i>旅游保险</span>
								<span class="item"><i class="iicon i-check"></i>防疫注射</span>
								<span class="item"><i class="iicon i-check"></i>电话卡</span>		
								<span class="item"><i class="iicon i-check"></i>漫游处理</span>
								<span class="item"><i class="iicon i-check"></i>信用卡</span>
								<span class="item"><i class="iicon i-check"></i>当地货币</span>
								<span class="item"><i class="iicon i-check"></i>美元货币</span>
							</div>							
						</td>
					</tr>
					<tr>
						<td class="rowspan">护理（女性）</td>
						<td>
							<div class="tl pt10">
								<span class="item"><i class="iicon i-check checked"></i>卫生巾</span>
								<span class="item"><i class="iicon i-check"></i>化妆用品</span>
								<span class="item"><i class="iicon i-check"></i>润肤液／面膜／洗面奶</span>
								<span class="item"><i class="iicon i-check checked"></i>唇膏</span>
								<span class="item"><i class="iicon i-check"></i>脱毛用品</span>
								<span class="item"><i class="iicon i-check"></i>浴帽</span>
							</div>							
						</td>
					</tr>
					<tr>
						<td class="rowspan">食物</td>
						<td>
							<div class="tl pt10">
								<span class="item"><i class="iicon i-check checked"></i>水瓶</span>
								<span class="item"><i class="iicon i-check"></i>保温瓶</span>
								<span class="item"><i class="iicon i-check"></i>餐具</span>
								<span class="item"><i class="iicon i-check checked"></i>方便面</span>
								<span class="item"><i class="iicon i-check"></i>干粮</span>
								<span class="item"><i class="iicon i-check"></i>糖果／口香糖</span>
							</div>							
						</td>
					</tr>
					<tr>
						<td class="rowspan">电器用品</td>
						<td>
							<div class="tl pt10">
								<span class="item"><i class="iicon i-check checked"></i>签证</span>
								<span class="item"><i class="iicon i-check"></i>护照/身份证/其他证件</span>
								<span class="item"><i class="iicon i-check"></i>旅行支票</span>
								<span class="item"><i class="iicon i-check checked"></i>巴士票</span>
								<span class="item"><i class="iicon i-check"></i>机票</span>
								<span class="item"><i class="iicon i-check"></i>火车票</span>
								<span class="item"><i class="iicon i-check checked"></i>船票</span>
								<span class="item"><i class="iicon i-check"></i>驾驶执照</span>
								<span class="item"><i class="iicon i-check"></i>酒店预订单</span>
								<span class="item"><i class="iicon i-check checked"></i>旅游保险</span>
								<span class="item"><i class="iicon i-check"></i>防疫注射</span>
								<span class="item"><i class="iicon i-check"></i>电话卡</span>		
								<span class="item"><i class="iicon i-check"></i>漫游处理</span>
								<span class="item"><i class="iicon i-check"></i>信用卡</span>
								<span class="item"><i class="iicon i-check"></i>当地货币</span>
								<span class="item"><i class="iicon i-check"></i>美元货币</span>
							</div>							
						</td>
					</tr>
					<tr>
						<td class="rowspan">小童用品</td>
						<td>
							<div class="tl pt10">
								<span class="item"><i class="iicon i-check checked"></i>尿片</span>
								<span class="item"><i class="iicon i-check"></i>奶粉</span>
								<span class="item"><i class="iicon i-check"></i>奶瓶</span>
								<span class="item"><i class="iicon i-check checked"></i>湿纸巾</span>
								<span class="item"><i class="iicon i-check"></i>奶嘴</span>
								<span class="item"><i class="iicon i-check"></i>玩具</span>
								<span class="item"><i class="iicon i-check checked"></i>保温瓶</span>
								<span class="item"><i class="iicon i-check"></i>婴儿车</span>
							</div>							
						</td>
					</tr>
					<tr>
						<td class="rowspan">其他</td>
						<td>
							<div class="tl pt10">
								<span class="item"><i class="iicon i-check checked"></i>书</span>
								<span class="item"><i class="iicon i-check"></i>旅游书</span>
								<span class="item"><i class="iicon i-check"></i>笔</span>
								<span class="item"><i class="iicon i-check checked"></i>记事簿</span>
								<span class="item"><i class="iicon i-check"></i>字典</span>
								<span class="item"><i class="iicon i-check"></i>指南针</span>
								<span class="item"><i class="iicon i-check checked"></i>地图</span>
								<span class="item"><i class="iicon i-check"></i>后备袋／手信袋</span>
								<span class="item"><i class="iicon i-check"></i>雨伞</span>
								<span class="item"><i class="iicon i-check checked"></i>行李锁／行李绑带</span>
								<span class="item"><i class="iicon i-check"></i>证件袋</span>
							</div>							
						</td>
					</tr>
				</table>
				<div class="pt20 pb20 tc"><button class="btn lorgbtn">保存</button></div>
			</div>		

		</div>			
	</div>

	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
</div>

<script type="text/javascript" src="static/web/js/base.js"></script>
<script type="text/javascript" src="static/web/js/index.js"></script>
<script type="text/javascript">
$(function(){
	scrollBannerInit($(".banner-ul"),$(".banner-btn"));
	selfDefineFormBtn();
});
</script>
</body>
</html>