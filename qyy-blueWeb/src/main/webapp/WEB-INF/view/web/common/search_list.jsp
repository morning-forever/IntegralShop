<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transition al.dtd"><%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../../static/inc_web.jsp" %>
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv = "X-UA-Compatible" content = "IE=edge,chrome=1 " /><meta charset="utf-8"> 
<title>搜索结果</title>
<link href="static/web/js/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link href="static/web/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
<link rel="stylesheet" href="static/web/css/quick.travel.css" />

<link rel="stylesheet" href="static/web/css/common.css" />
<link rel="stylesheet" href="static/web/css/inner.style.css" />
<link rel="stylesheet" href="static/web/css/personal.center.css" />
<link rel="stylesheet" href="static/web/css/member.css"/>
<style type="text/css">
.menu_cart{
	width:790px;
	left:100px;
}
.screen span{
	cursor: pointer;
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
	<div class=" content_wrap pb90">
		<div class="content">
		  <!-- <div class="searchcent clearfix">
			 <div class="searchbox fr"><input class="search-text" type="text" placeholder="请输入关键词" />
			 	<button class="search-btn" onclick="javascript:window.location='pc/search';">搜 索</button>
			 </div> 
		  </div> -->
		  <div class="screen">
		    <dl><dt><span>筛选</span></dt>
			    <dd>
				  <span class="active" id="home">全部</span>
				  <span id="depth">主题深度游</span>
				  <span id="travels2">达人攻略</span>
				  <span id="travels1">精彩游记</span>
				  <span id="travels3">玩伴召募</span>
				  <span id="question">问答</span>
				  <span id="complaint">吐槽</span>
				</dd>
			</dl>
		  </div>
		  <div class="se_resule whitebg" id="listShow">
			 
		  </div>
		  <div class="pad20">
			   <!-- 分页  -->
				<div class="pagination" style="padding-right:20px;"></div>	
		 </div>	
		</div>				
	</div>
	<input id="fromType" value="${fromType }" type="hidden">
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
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
<script id="rulepopup" type="text/template">
<div class="innerdiv  pd20">
    <div class="searchdiv">
	  <div class="search_wrap"><i class="iicon i-search"></i><input class="search-text" type="text" placeholder="搜索人" /></div>
	  <ul class="list_sear">
	    <li><i class="icon tick"></i>qina819</li>
		<li><i class="icon tick"></i>qina819</li>
		<li><i class="icon tick"></i>qina819</li>
	  </ul>
	</div>
	<div class="listbtn"><button class="Btn" name="case-ok">确认</button></div>
</div>
</script>

<!-- 日期时间控件 -->
<script type="text/javascript" src="static/web/js/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="static/web/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="static/web/js/base.js"></script>
<script type="text/javascript" src="static/web/js/index.js"></script>
<script type="text/javascript" src="static/web/js/person.js"></script>
<script type="text/javascript">
var totalPage=0;//总页数
var pageNo=1;//当前页
$(function(){
	scrollBannerInit($(".banner-ul"),$(".banner-btn"));
	previewProDetailImg();
	selfDefineFormBtn();
	// 修改身份对话框
	var ruleDlg = new dialogBox({
		selfClass : "type2",
		title : "",
		contentHtml : $("#rulepopup").html(),
		popupBoxW : 816,
		//closeBtnshow : 0,
		initEvent : function($dom){
		}
	});
	$(".add").click(function(){
		ruleDlg.showDlg();
	});
	
	$("#searchInput").change(function(){
		totalPage = 0;
		pageNo = 1;
	});
	
	$(".screen dd span").click(function(){
		$(this).parent().find(".active").removeClass("active");
		$(this).addClass('active');
		pageNo = 1;
		$("#fromType").val(this.id);
		doSerch();
	});
	
	var fromType = $("#fromType").val();
	$("#"+fromType).parent().find(".active").removeClass("active");
	$("#"+fromType).addClass('active');
	
	
	doSerch();
});

$(document).ready(function(){
	$(".search-btn").attr('onclick','doSerch()');
});

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
		"title":$("#searchInput").val(),
		"fromType":$("#fromType").val(),
		"pageNo" : pageNo
	};
	
	if(!checkField(param.fromType))
		param.fromType = 'home';
	if(!checkField(param.title))
		param.title = '${title}';
	
	var title = encodeURI(encodeURI(param.title));

	if (navigator.userAgent.indexOf('.NET CLR') < 0){
		var stateObject = {};
		var newUrl = "<%=basePath %>pc/search?fromType="+param.fromType+"&title="+title;
		history.pushState(stateObject,"搜索结果",newUrl);
	}
	
	$.post("<%=basePath %>pc/searchList",param,function(data){
		$("#listShow").html("");
		if(typeof(data.message)=='undefined' || data.message != 'success'){
			var failText = '<div class="se_resule tc" style="padding:100px 0;">'
			     +'<img src="static/web/images/Noresult.png"/>'
			     +'<p>没有任何搜索结果</p>'
			     +'</div>';
			$("#listShow").append(failText);
			$(".pagination").css("display","none");
			return ;
		}
		var list=data.data.list;
		var picText = '<ul class="li_sort clearfix">'
					+'<li><img src="static/web/img/section3-2.jpg"/>'
					+'<div class="sortTxt"><p>【餐饮】<span class="orange">贵阳</span>可可装备--帐篷</p></div>'
					+'</li></ul>';
		var text = '<div class="matter"><p>【吐槽】<span class="orange">贵阳</span>哪里可以租车</p></div>';
		var itemUi;
		for(var i in list){
			var item = list[i];
			if('question' == item.type || 'complaint'==item.type){
				itemUi = $(text).clone();
				itemUi.find("p").html('<a target="_blank" style="color:#000000;" href="'+godetails(item.type,item.id)+'">'+getTypeText(item.type)+replaces(param.title,item.title) +'</a>');
			}else{
				itemUi = $(picText).clone();
				itemUi.find("img").attr('src',item.picUrl);
				itemUi.find(".sortTxt p").html('<a target="_blank" style="color:#000000;" href="'+godetails(item.type,item.id)+'">'+getTypeText(item.type)+replaces(param.title,item.title)+'</a>');
			}
			itemUi.show();
			$("#listShow").append(itemUi);
		}
		thisPageSize=data.data.thisPageSize;
		totalPage=data.data.totalPage;
		pageNo=data.data.pageNo;
		initPage();
		$(".pagination").css("display","block");
	});
}

var godetails = function(type,id){
	var url ="";
	if('depth' == type)
		url = '<%=basePath %>pc/depth/detail/'+id;
	else if('question' == type)
		url = '<%=basePath %>pc/question/detial_'+id;
	else if('complaint' == type)
		url = '<%=basePath %>pc/complaint/detial_'+id;
	else if('travels1' == type)
		url ='<%=basePath %>pc/travels/detial/1_'+id;
	else if('travels2' == type)
		url ='<%=basePath %>pc/travels/detial/2_'+id;
	else if('travels3' == type)
		url ='<%=basePath %>pc/travels/detial/3_'+id;
	return url;
};

var getTypeText = function(type){
	if('depth' == type)
		return '【深度游】';
	else if('question' == type)
		return '【问答】';
	else if('complaint' == type)
		return '【吐槽】';
	else if('travels1' == type)
		return '【游记】';
	else if('travels2' == type)
		return '【攻略】';
	else if('travels3' == type)
		return '【玩伴】';
	return '';
};

var replaces = function(title,text){
	if(title!=null && title!='')
		text = text.replace(title,'<span class="orange">'+title+'</span>');
	return text;
};

</script>
</body>
</html>