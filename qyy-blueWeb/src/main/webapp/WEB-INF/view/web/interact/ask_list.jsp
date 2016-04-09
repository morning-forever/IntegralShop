<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transition al.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../../../static/inc_web.jsp" %>
<html>
<head>
<base href="<%=basePath %>">
<title>会员互动-旅行问答</title>
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
			<img class="headImg" src="static/web/img/avatar2.jpg" />
		</div>
		<div class="view-rgt">
			<h3 class="v-title clearfix">
				<span class="fl nickName">Ssinz</span>
				<span class="fr">
					<span class="grey">
						<i class="iicon i-clock"></i>
						<span class="createTime">2015-6-1 21:30</span>
					</span>
				</span>
			</h3>
			<p class="content">想去贵阳大溪谷玩，咨询一下</p>
			<p class="tr">
				<a class="underline" href="pc/interact/questionDetial">查看详情</a>
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
		    <div class="breadcrumb">当前位置：<a href="">首页</a><a href="pc/interact/home">互动社区 </a><span>旅行问答</span></div>
			<div class="tab_problem solve">
			  <ul>
			    <li _val="0" class="active">已解决问题</li>
				<li _val="1">未解决问题</li>
			  </ul>
			</div>
			<div class="whitebg box-show pad20">
			  <div class="problem">
			    <div class="programa clearfix">
				   <a class="fl vb Btn" href="pc/question/newQuestion"><i class="icon mr10 agree"></i>我要提问</a>
				   <div class="fr sortwrap2 order">
				     <a _val="1" class="active" href="javascript:;">最新</a>
					 <a _val="2" href="javascript:;">最热</a>
					 <a _val="3" href="javascript:;">已采纳</a>
					 <a _val="4" href="javascript:;">未采纳</a>
				   </div>
				</div>
				<ul class="list_problem"><!-- 内容DIV -->
				  
				</ul>
				<div class="pagination"><!-- 分页DIV -->
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
<script id="rulepopup" type="text/template">
<div class="innerdiv pd20">
	<p style="margin:0 40px; color:#999;"></p>
</div>
</script>

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
	
	
	$(".tab_problem li").click(function(){
		$(this).addClass("active").siblings().removeClass("active");
		var ul=$(".sortwrap2").empty();
		if($(this).attr("_val")=="0"){
			ul.append('<a _val="1" class="active" href="javascript:;">最新</a>');
			ul.append('<a _val="2" href="javascript:;">最热</a>');
			ul.append('<a _val="3" href="javascript:;">已采纳</a>');
			ul.append(' <a _val="4" href="javascript:;">未采纳</a>');
		}else{
			ul.append('<a _val="1" class="active" href="javascript:;">最新</a>');
			ul.append('<a _val="2" href="javascript:;">最热</a>');
		}
		$(".sortwrap2 a").click(function(){
			$(this).addClass("active").siblings().removeClass("active");
			getList();
		});
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
	
	$(".tab_problem li:first").click();
	
	getList();
	
});

function getList(){
	var data={};
	var order=$(".order .active").attr("_val");
	var solve=$(".solve ul .active").attr("_val")
	var adopt=null;
	var orderType=null;
	//修改，已采纳=已解决  2015年11月30日
	data.orderType=0;
	data.adopt=solve;
	switch (order) {
	case "1":
		data.orderType=0;
		break;
	case "2":
		data.orderType=1;
		break;
	case "3":
		data.adopt=0;
		break;
	case "4":
		data.adopt=1;
		break;

	default:
		break;
	}
	data.pageNo=pageNo;
	//data.solve=solve;
	$.post("<%=basePath %>pc/question/list",data,function(data){
		if(data.status=="success"){
			var list=data.list;
			var ul=$(".list_problem");
			ul.empty();
			for(var i=0;i<list.length;i++){
				var li=$("#liModel").children().clone();
				li.find(".headImg").attr("src",list[i].head_img);
				li.find(".nickName").html(list[i].nickname);
				li.find(".createTime").html(getTimeTxt(list[i].create_time,16));
				li.find(".content").html(list[i].content);
				li.find(".underline").attr("href","pc/question/detial_"+list[i].id);
				if(list[i].isDelete==1){
					li.find(".i-delete").hide();
				}else{
					li.find(".i-delete").attr("_id",list[i].id);
					li.find(".i-delete").bind("click",function(){
						deleteConfirm(this);
					});
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
	$.post("<%=basePath %>pc/question/delete",{questionId:id},function(data){
		if(data.status=="success"){
			resetDialog("删除成功");
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