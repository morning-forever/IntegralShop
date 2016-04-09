<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transition al.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../../../static/inc_web.jsp" %>
<html>
<head>
<base href="<%=basePath %>">
<title>会员互动-吐槽专区</title>
<link rel="stylesheet" href="static/web/css/common.css" />
<link rel="stylesheet" href="static/web/css/inner.style.css" />
<link rel="stylesheet" href="static/web/css/personal.center.css" />
<link rel="stylesheet" href="static/web/css/member.css"/>
<style type="text/css">
.menu_cart{
	width:790px;
	left:100px;
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
				<span class="fl">Ssinz</span>
				<span class="fr">
					<span class="grey">
						<i class="iicon i-clock"></i>
						<span>2015-6-1 21:30</span>
					</span>
				</span>
			</h3>
			<p>想去贵阳大溪谷玩，咨询一下</p>
			<p class="tr">
				<a class="underline" href="#">查看详情</a>
				<span class="icon i-delete ml20"></span>
			</p>
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
		    <div class="breadcrumb">当前位置：<a href="">首页</a><a href="pc/interact/home">互动社区 </a><span>吐槽专区</span></div>
			<div class="whitebg box-show">
			  <div class="playmate"><span class="parten">吐槽专区</span></div>
			  <div class="pad20">
			    <div class="problem">
			      <div class="programa clearfix">
				     <a class="fl vb Btn" href="pc/complaint/newComplaint">我要吐槽</a>
				     <div class="fr sortwrap2">
				       <a _val="0" class="active" href="javascript:;">最新</a>
					   <a _val="1" href="javascript:;">最热</a>
				     </div> 
				  </div>
				  <ul class="list_problem"><!-- 内容UL -->
				    
				  </ul>
				  <div class="pagination"><!-- 分页DIV -->
				  </div>		
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
<div id="rulepopup" style="display: none;">
<div class="innerdiv pd20 tc">
	<p style="padding:50px 0; color:#333;">收藏成功</p>
	<button class="Btn" name="case-ok">确认</button>
</div>
</div>

<div id="confirmDialog" style="display: none;">
<div class="innerdiv pd20 tc">
	<p style="padding:50px 0; color:#333;">确认删除？</p>
	<button class="Btn" name="case-ok" onclick="deleteComplaint()">确认</button>
	<button class="Btn" name=".btn-close" onclick="closeConfirmDialog()">取消</button>
</div>
</div>

<script type="text/javascript" src="static/web/js/base.js"></script>
<script type="text/javascript" src="static/web/js/index.js"></script>
<script type="text/javascript" src="static/web/js/person.js"></script>
<script type="text/javascript">
var pageNo=1;
var totalPage=0;

var ruleDlg=null;
var confirmDlg=null;

var tempId=0;

$(function(){
	scrollBannerInit($(".banner-ul"),$(".banner-btn"));
	$(".sortwrap2 a").click(function(){
		$(".sortwrap2 a").removeClass("active");
		$(this).addClass("active");
		getList();
	});
	
	confirmDlg = new dialogBox({
		title : "提示",
		contentHtml : $("#confirmDialog").html(),
		popupBoxW : 490,
		closeBtnshow : 0,
		initEvent : function($dom){
		}
	});
	ruleDlg = new dialogBox({
		title : "提示",
		contentHtml : $("#rulepopup").html(),
		popupBoxW : 490,
		closeBtnshow : 0,
		initEvent : function($dom){
		}
	});
	getList();
});

function getList(){
	var ul=$(".list_problem");
	var orderType=$(".sortwrap2 .active").attr("_val");
	$.post("<%=basePath %>pc/complaint/list",{pageNo:pageNo,orderType:orderType},function(data){
		if(data.status=="success"){
			var list=data.list;
			ul.empty();
			for(var i=0;i<list.length;i++){
				var li=$("#liModel").children().clone();
				li.find("img").attr("src",list[i].head_img);
				li.find(".view-rgt h3 .fl").html(list[i].nickname);
				li.find(".view-rgt .grey span").html(getTimeTxt(list[i].create_time,16));
				li.find(".view-rgt p:first").html(list[i].content);
				li.find(".underline").attr("href","<%=basePath %>pc/complaint/detial_"+list[i].id);
				if(list[i].isDelete==0){
					li.find(".i-delete").attr("_id",list[i].id);
					li.find(".i-delete").bind("click",function(){
						deleteConfirm(this);
					});
				}else{
					li.find(".i-delete").hide();
				}
				ul.append(li);
			}
			totalPage=data.totalPage;
			initPage();
		}
	});
}

function deleteConfirm(obj){
	tempId=$(obj).attr("_id");
	confirmDlg.showDlg();
}

function closeConfirmDialog(){
	confirmDlg.hideDlg();
}

function deleteComplaint(){
	var id=tempId;
	$.post("<%=basePath %>pc/complaint/delete",{complaintId:id},function(data){
		if(data.status=="success"){
			resetDialog("删除成功");
			ruleDlg.showDlg();
			getList();
		}else if(data.status=="exist"){
			resetDialog("状态错误，请重试");
			ruleDlg.showDlg();
			getList();
		}else{
			resetDialog("服务器忙，请稍后");
			ruleDlg.showDlg();
		}
		tempId=0;
	})
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

//设定提示框内容
function resetDialog(str){
	$("#rulepopup p").html(str);
	ruleDlg = new dialogBox({
		title : "提示",
		contentHtml : $("#rulepopup").html(),
		popupBoxW : 490,
		closeBtnshow : 0,
		initEvent : function($dom){
		}
	});
}

</script>
</body>
</html>