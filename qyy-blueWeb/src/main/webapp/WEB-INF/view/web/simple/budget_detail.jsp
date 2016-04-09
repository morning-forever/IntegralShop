<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transition al.dtd"><%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../../static/inc_web.jsp" %>
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv = "X-UA-Compatible" content = "IE=edge,chrome=1 " /><meta charset="utf-8"> 
<title>行程方案-预算明细.</title>
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
				<div class="search_wrapper abs"><i class="iicon i-search"></i><input class="search-text" type="text" placeholder="请输入关键词" />
					<button class="search-btn" onclick="javascript:window.location='pc/search';">搜 索</button>
				</div>
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
				<li class="active"><a href="pc/simple/budgetDetail">预算明细</a></li>
				<li><a href="pc/simple/equipList">装备清单</a></li>
				<li><a href="pc/simple/downlineActivity?op=scenic">线下活动</a></li>
			</ul>
			<div class="tab-content pd20 whitebg">
				<p class="mb20"><span class="f16 mr20 grey">合计</span><span class="lorange f18">￥<span class="f30">237</span></span></p>
				<table width="100%" class="table cost-detail">
					<tr>
						<th width="20%">日期</th>
						<th width="15%">类别</th>
						<th width="20%">活动</th>
						<th width="15%">活动费用（单位：元）</th>
						<th width="30%">备注</th>
					</tr>
					<tr>
						<td class="rowspan" rowspan="10">第1天<br />2015-6-11</td>
						<td>景区</td>
						<td>大峡谷</td>
						<td>20</td>
						<td></td>
					</tr>
					<tr>
						<td>景区</td>
						<td>金边</td>
						<td>20</td>
						<td></td>
					</tr>
					<tr>
						<td>景区</td>
						<td>塔山寺</td>
						<td>20</td>
						<td></td>
					</tr>
					<tr>
						<td>景区</td>
						<td>乌那隆寺</td>
						<td>20</td>
						<td></td>
					</tr>
					<tr>
						<td>景区</td>
						<td>桃源呵漂流</td>
						<td>20</td>
						<td></td>
					</tr>
					<tr>
						<td>景区</td>
						<td>息烽温泉</td>
						<td>20</td>
						<td></td>
					</tr>
					<tr>
						<td>景区</td>
						<td>贵阳野生动物园</td>
						<td>20</td>
						<td></td>
					</tr>
					<tr>
						<td>景区</td>
						<td>布伦景点</td>
						<td>20</td>
						<td></td>
					</tr>
					<tr>
						<td>住宿</td>
						<td>四季美酒店</td>
						<td>20</td>
						<td></td>
					</tr>
					<tr>
						<td>交通</td>
						<td>今天的交通费用﹐以公共交通为参考</td>
						<td>55</td>
						<td></td>
					</tr>
					<tr>
						<td colspan="5"><span class="inline pointer"><i class="iicon addbtn"></i>&nbsp;&nbsp;增加一项</span></td>
					</tr>
					<tr>
						<td class="rowspan" rowspan="10">第2天<br />2015-6-12</td>
						<td>景区</td>
						<td>大峡谷</td>
						<td>20</td>
						<td></td>
					</tr>
					<tr>
						<td>景区</td>
						<td>金边</td>
						<td>20</td>
						<td></td>
					</tr>
					<tr>
						<td>景区</td>
						<td>塔山寺</td>
						<td>20</td>
						<td></td>
					</tr>
					<tr>
						<td>景区</td>
						<td>乌那隆寺</td>
						<td>20</td>
						<td></td>
					</tr>
					<tr>
						<td>景区</td>
						<td>桃源呵漂流</td>
						<td>20</td>
						<td></td>
					</tr>
					<tr>
						<td>景区</td>
						<td>息烽温泉</td>
						<td>20</td>
						<td></td>
					</tr>
					<tr>
						<td>景区</td>
						<td>贵阳野生动物园</td>
						<td>20</td>
						<td></td>
					</tr>
					<tr>
						<td>景区</td>
						<td>布伦景点</td>
						<td>20</td>
						<td></td>
					</tr>
					<tr>
						<td>住宿</td>
						<td>四季美酒店</td>
						<td>20</td>
						<td></td>
					</tr>
					<tr>
						<td>交通</td>
						<td>今天的交通费用﹐以公共交通为参考</td>
						<td>55</td>
						<td></td>
					</tr>
					<tr>
						<td colspan="5"><span class="inline pointer"><i class="iicon addbtn"></i>&nbsp;&nbsp;增加一项</span></td>
					</tr>
					<tr>
						<td class="rowspan" rowspan="10">第3天<br />2015-6-13</td>
						<td>景区</td>
						<td>大峡谷</td>
						<td>20</td>
						<td></td>
					</tr>
					<tr>
						<td>景区</td>
						<td>金边</td>
						<td>20</td>
						<td></td>
					</tr>
					<tr>
						<td>景区</td>
						<td>塔山寺</td>
						<td>20</td>
						<td></td>
					</tr>
					<tr>
						<td>景区</td>
						<td>乌那隆寺</td>
						<td>20</td>
						<td></td>
					</tr>
					<tr>
						<td>景区</td>
						<td>桃源呵漂流</td>
						<td>20</td>
						<td></td>
					</tr>
					<tr>
						<td>景区</td>
						<td>息烽温泉</td>
						<td>20</td>
						<td></td>
					</tr>
					<tr>
						<td>景区</td>
						<td>贵阳野生动物园</td>
						<td>20</td>
						<td></td>
					</tr>
					<tr>
						<td>景区</td>
						<td>布伦景点</td>
						<td>20</td>
						<td></td>
					</tr>
					<tr>
						<td>住宿</td>
						<td>四季美酒店</td>
						<td>20</td>
						<td></td>
					</tr>
					<tr>
						<td>交通</td>
						<td>今天的交通费用﹐以公共交通为参考</td>
						<td>55</td>
						<td></td>
					</tr>
					<tr>
						<td colspan="5"><span class="inline pointer"><i class="iicon addbtn"></i>&nbsp;&nbsp;增加一项</span></td>
					</tr>
				</table>
			</div>		

		</div>			
	</div>

	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
</div>

<script type="text/javascript" src="static/web/js/index.js"></script>
<script type="text/javascript">
$(function(){
	scrollBannerInit($(".banner-ul"),$(".banner-btn"));
});
</script>
</body>
</html>