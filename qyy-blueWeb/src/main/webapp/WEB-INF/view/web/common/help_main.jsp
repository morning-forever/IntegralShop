<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transition al.dtd"><%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../../static/inc_web.jsp" %>
<html>
<head>
<base href="<%=basePath %>">
<title>帮助中心</title>
<meta http-equiv = "X-UA-Compatible" content = "IE=edge,chrome=1 " /><meta charset="utf-8"> 
<link href="static/web/js/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link href="static/web/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
<link rel="stylesheet" href="static/web/css/common.css" />
<link rel="stylesheet" href="static/web/css/inner.style.css" />
<link rel="stylesheet" href="static/web/css/personal.center.css" />
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
				<li>
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
				<li class="active">
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
		<div class="content pt20 clearfix">
			<div class="lpart">
				<ul class="menu">
					<li><a href="pc/helpMain" class="current">帮助中心</a></li>
					<li><a href="pc/aboutWe">关于我们</a></li>
					<li><a href="pc/contactWe">联系我们</a></li>
					<li><a href="pc/protocol">用户协议</a></li>
				</ul>
			</div>
			<div class="rpart">
				<div class="right-warp help-center">
					<ul id="qalist">
						<li>
							<label>1/</label>
							<div class="q-a">
								<p class="q"><span class="circle">Q</span>智能定制功能如何使用，可以自动计算出费用吗？</p>
								<p class="a"><span class="circle">A</span>您智能定制功能可以自动帮您规划出路线，节约您大量时间，该功能使用自动计算出您出行所花的费用，非常方便</p>
							</div>
							<div class="toggle">展开/收起</div>
						</li>
					</ul>
					<!-- 分页  -->
					<div class="pagination" style="padding-right:20px;"></div>	
				</div>
			</div>
		</div>
		<div class="additional">
			<div class="twovcode">
				<div class="cont">
					<img src="static/web/images/twovcode.jpg" width="70" height="65">
					<p>APP下载</p>
				</div>
				<span class="close"></span>
			</div>
			<div class="totop"></div>
			<div class="remark"></div>
		</div>		
	</div>

	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
</div>
<script type="text/javascript" src="static/web/js/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="static/web/js/base.js"></script>
<script type="text/javascript" src="static/web/js/index.js"></script>

<script type="text/javascript">
var totalPage=0;//总页数
var pageNo=1;//当前页

function gotoPage(goNo){
	pageNo=parseInt(goNo);
	doSerch();
}

function goPage(){
	pageNo=parseInt($("#gotopage").val());
	if(parseInt($("#gotopage").val())>totalPage){
		$("#gotopage").val(totalPage);
		valTips("gotopage", "输入页数大于当前最大页数");
	}else{
		doSerch();
	}
}

function initPage(){
	$(".pagination").html("");
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
	$(".pagination").append('<input id="gotopage" class="gotopage" type="text" value="'+ ((typeof(pageNo) == 'undefined' )?0:pageNo) +'" /> 页');
	$(".pagination").append('<input onclick="goPage()" type="button" value="确定" />');
}

function doSerch(){
	var param = {
		"pageNo" : pageNo
	};
	
	$.post("<%=basePath %>pc/helpList",param,function(data){
		$("#qalist").html("");
		if(typeof(data.message)=='undefined' || data.message != 'success'){
			var failText ='<p>没有帮助信息</p>'
			$("#qalist").append(failText);
			return ;
		}
		var list=data.data.list;
		var picText = '<li><label>1/</label>'
			+'<div class="q-a">'
			+'<p class="q"><span class="circle">Q</span>智能定制功能如何使用，可以自动计算出费用吗？</p>'
			+'<p class="a"><span class="circle">A</span><span id="subContent"></span><span id="allContent" style="display:none;"></span></p>'
			+'</div><div class="toggle" onclick="openOrClose();">展开/收起</div></li>';
		var itemUi;
		for(var i in list){
			var item = list[i];
			itemUi = $(picText).clone();
			itemUi.find("label").html((parseInt(i)+1));
			itemUi.find(".q").html('<span class="circle">Q</span>'+item.issue);
			itemUi.find("#subContent").html(subContent(item.answer,100));
			itemUi.find("#allContent").html(item.answer);
			itemUi.find("#subContent").attr("id","subContent"+item.id);
			itemUi.find("#allContent").attr("id","allContent"+item.id);
			itemUi.find(".toggle").attr("onclick",'openOrClose('+item.id+')');
			$("#qalist").append(itemUi);
		}
		debugger
		thisPageSize=data.data.thisPageSize;
		totalPage=data.data.totalPage;
		pageNo=data.data.pageNo;
		initPage();
	});
}

function openOrClose(id){
	var dis = $("#subContent"+id).css("display");
	if('none' == dis){
		$("#subContent"+id).show();
		$("#allContent"+id).hide();
	}else{
		$("#subContent"+id).hide();
		$("#allContent"+id).show();
	}
}

doSerch();

var subContent = function(text,len){
	var textLen = text.length;
	if(textLen > len){
		return text.substring(0,len);	
	}
	return text;
}

</script>


</body>
</html>