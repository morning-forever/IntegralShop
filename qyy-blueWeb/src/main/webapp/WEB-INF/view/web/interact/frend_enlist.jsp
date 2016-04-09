<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transition al.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../../../static/inc_web.jsp" %>
<html>
<head>
<base href="<%=basePath %>">
<title>会员互动-玩伴招募</title>
<link rel="stylesheet" href="static/web/css/common.css" />
<link rel="stylesheet" href="static/web/css/inner.style.css" />
<link rel="stylesheet" href="static/web/css/personal.center.css" />
<link rel="stylesheet" href="static/web/css/member.css"/>
<style type="text/css">
.menu_cart{
	width:790px;
	left:100px;
}
.maxlength{
	line-height: 10px;
}
</style>
</head>
<body>
<ul id="liModel" style="display: none;">
<li>
	<div class="review clearfix">
		<div class="view-let">
			<img src="static/web/img/avatar2.jpg" />
		</div>
		<div class="view-rgt">
			<h3 class="v-title clearfix">
				<span class="fl nickName">Ssinz</span>
				<span class="fr">
					<span class="grey">
						<i class="icon i-prai"></i>
						<span class="praise">23</span>
					</span>
					<span class="grey">
						<i class="icon i-comt"></i>
						<span class="reply">23</span>
					</span>
					<span class="grey">
						<i class="iicon i-clock"></i>
						<span class="createTime">2015-6-1 21:30</span>
					</span>
				</span>
			</h3>
				<h3 class="z-title">
					<span class=" fr icon i-delete"></span>
					<a class="detial" href="javascript:;" onclick="travelsDetial(this)">
						<span class="title">召募去贵阳大溪谷的玩伴</span>
					</a>
				</h3>
			<p class="f12 firstWord">南侧紧邻的蒲江采茶山文化自然保护基地，总占地12万亩，是西南最大的采茶基地，这里出品的蒲江雀舌茶以色翠、香高、味醇、形美而闻名。北临蒲江城，步行5分钟即可到达。可享受到这个淳朴江城的各种城市生活配套资源。
			</p>
			<div class="z-img">
				<img src="static/web/img/colorful2.jpg" />
			</div>
		</div>
	</div>
</li>
</ul>
<div class="wrapper inner">
	<!-- header -->
	<div class="header">
		<jsp:include page="../common/header.jsp"></jsp:include>					
		<div class="nav_ul_wrap">
			<ul class="nav clearfix">
				<li><a href="pc/home">首页</a></li>
				<!-- <li><a href="pc/simple/home">智易行</a></li> -->
				<li >
					<a href="pc/cart/home">快旅出行</a>
					<div class="level2_nav menu_cart" >
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
			<div class="whitebg box-show mt20">
			  <div class="playmate"><span class="parten">玩伴召募</span></div>
			  <div class="pad20">
			    <div class="sortwrap2 clearfix mb10 mt30">
					<a class="active" _val="1" href="javascript:;">最新</a>
					<a class="sort-res" _val="2" href="javascript:;">最热</a>
			    </div>
			  </div>
			  <div class="detailwrap"><!-- 内容DIV -->
			    <ul>
				 
				</ul>
			  </div>
			  <div class="pad20">
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
		</div>				
	</div>

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
<div id="rulepopup" type="text/template" style="display: none;">
<div class="innerdiv pd20">
	<p style="margin:0 40px; color:#999;">LLorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet lacus accumsan et viverra justo commodo. Proin sodales pulvinar tempor. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam fermentum, nulla luctus pharetra vulputate, felis tellus mollis orci, sed rhoncus sapien nunc eget odioLorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet lacus accumsan et viverra justo commodo. Proin sodales pulvinar tempor. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam fermentum, nulla luctus pharetra vulputate, felis tellus mollis orci, sed rhoncus sapien nunc eget odio.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet lacus accumsan et viverra justo commodo. Proin sodales pulvinar tempor. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam fermentum, nulla luctus pharetra vulputate, felis tellus mollis orci, sed rhoncus sapien nunc eget odio.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet lacus accumsan et viverra justo commodo. Proin sodales pulvinar tempor. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam fermentum, nulla luctus pharetra vulputate, felis tellus mollis orci, sed rhoncus sapien nunc eget odio.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet lacus accumsan et viverra justo commodo. Proin sodales pulvinar tempor. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam fermentum, nulla luctus pharetra vulputate, felis tellus mollis orci, sed rhoncus sapien nunc eget odio.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet lacus accumsan et viverra justo commodo. Proin sodales pulvinar tempor. Cum sociis natoqueorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet lacus accumsan et viverra justo commodo. Proin sodales pulvinar tempor. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam fermentum, nulla luctus pharetra vulputate, felis tellus mollis orci, </p>
</div>
</div>

<script type="text/javascript" src="static/web/js/base.js"></script>
<script type="text/javascript" src="static/web/js/index.js"></script>
<script type="text/javascript">
var pageNo=1;
var totalPage=0;
$(function(){
	scrollBannerInit($(".banner-ul"),$(".banner-btn"));
	
	$(".sortwrap2 a").click(function(){
		$(".sortwrap2 a").removeClass("active");
		$(this).addClass("active");
		getList();
	});
	getList();
	
});

function getList(){
	var sortType=$(".sortwrap2 .active").attr("_val");
	$.post("pc/travels/playerList",{pageNo:pageNo,orderType:sortType},function(data){
		if(data.status=="success"){
			var list=data.list;
			var ul=$(".detailwrap ul");
			ul.empty();
			for(var i=0;i<list.length;i++){
				var li=$("#liModel").children().clone();
				li.find(".view-let img").attr("src",list[i].head_img);
				li.find(".view-rgt .nickName").html(list[i].nickname);
				li.find(".view-rgt .praise").html(list[i].praise);
				li.find(".view-rgt .reply").html(list[i].countReply);
				li.find(".view-rgt .createTime").html(getTimeTxt(list[i].create_time,16));
				li.find(".view-rgt .title").html(list[i].title);
				li.find(".view-rgt .firstWord").html(list[i].context);
				li.find(".view-rgt .detial").attr("travelsId",list[i].id)
				li.find(".view-rgt .z-img img:first").attr("src",list[i].cover);
				var imgs=list[i].imgs;
				if(imgs!=null){
					var imgArr=imgs.split(",");
					for(var j=1;j<(imgArr.length+1)&&j<3;j++){
						li.find(".view-rgt .z-img").append("<img></img>");
						li.find(".view-rgt .z-img img:eq("+j+")").attr("src",imgArr[j-1]);
					}
				}
				if(list[i].isEdit==1){
					li.find(".view-rgt .i-delete").hide();
				}
				ul.append(li);
			}
			totalPage=data.totalPage;
			initPage();
		}
	})
}

function travelsDetial(obj){
	var id=$(obj).attr("travelsId");
	window.location.href="<%=basePath %>pc/travels/detial/3_"+id;
}

function gotoPage(goNo){
	pageNo=parseInt(goNo);
	getList();
}

function goPage(){
	pageNo=parseInt($("#gotopage").val());
	if(parseInt($("#gotopage").val())>totalPage){
		$("#gotopage").val(totalPage);
		valTips("gotopage", "输入页数大于当前最大页数");
	}else{
		getList();
	}
}

function initPage(){
	var pageDiv=$(".pagination");
	pageDiv.html("");
	if(pageNo<=1){
		pageDiv.append('<a class="disabled" href="javascript:;">上一页</a>');
	}else{
		pageDiv.append('<a href="javascript:;" onclick="gotoPage('+(pageNo-1)+')">上一页</a>');
	}
	if(pageNo>3){
		pageDiv.append('<a href="javascript:;" onclick="gotoPage(1)">1</a>');
		pageDiv.append('<span class="p_text">...</span>');
	}
	for(var i=-2;i<3;i++){
		var thisNo=pageNo+i;
		if(thisNo>0&&thisNo<=totalPage){
			if(i==0){
				pageDiv.append('<a href="javascript:;" class="current" onclick="gotoPage('+thisNo+')">'+thisNo+'</a>');			
			}else{
				pageDiv.append('<a href="javascript:;" onclick="gotoPage('+thisNo+')">'+thisNo+'</a>');
			}
		}
	}
	if((totalPage-pageNo)>2){
		pageDiv.append('<span class="p_text">...</span>');
		pageDiv.append('<a href="javascript:;" onclick="gotoPage('+totalPage+')">'+totalPage+'</a>');
	}
	if(pageNo>=totalPage){
		pageDiv.append('<a class="disabled" href="javascript:;">下一页</a>');
	}else{
		pageDiv.append('<a href="javascript:;" onclick="gotoPage('+(pageNo+1)+')">下一页</a>');
	}
	pageDiv.append('<input id="gotopage" class="gotopage" type="text" value="'+pageNo+'" /> 页');
	pageDiv.append('<input onclick="goPage()" type="button" value="确定" class="mouseCursor"/>');
}
</script>
</body>
</html>