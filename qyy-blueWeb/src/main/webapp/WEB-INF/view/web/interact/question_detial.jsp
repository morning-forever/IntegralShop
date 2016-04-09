<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transition al.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../../../static/inc_web.jsp" %>
<html>
<head>
<base href="<%=basePath %>">
<title>会员互动-旅行问答详情</title>
<link rel="stylesheet" href="static/web/css/common.css" />
<link rel="stylesheet" href="static/web/css/inner.style.css" />
<link rel="stylesheet" href="static/web/css/personal.center.css" />
<link rel="stylesheet" href="static/web/css/member.css"/>
<style type="text/css">
.past img{
	height: 55px;
	width: 55px;
}
</style>
<style type="text/css">
.menu_cart{
	width:790px;
	left:100px;
}
.i-report:hover {
color: #ffb126;
cursor: pointer;
}
</style>
</head>
<body>
<ul id="replyModel" style="display: none;">
<li>
	<div class="review clearfix"><!-- 回复本体DIV -->
		<div class="view-let">
			<img src="static/web/img/avatar2.jpg" />
			<p>
				<span class="">普通会员</span>
			</p>
			<p class="block">
			</p>
		</div>
		<div class="view-rgt">
			<p class="floor">楼层</p>
			<h3 class="v-title">
				<span class="grey fr">
					<i class="iicon i-clock"></i>
					<span>2015-6-1 21:30</span>
				</span>
				<span class="nickName">Ssinz</span>
			</h3>
			<p class="content">不好意思，刚看到您的问题。
				麦卡伦国际机场租车中心距离机场3英里。到达麦卡伦机场租车中心后，进入Gilespie
				Street上的还车入口，按照路边标识就能找到租车公司相应的区域。还完车后，穿过租车大厅，走出租车大厅入口，可以乘坐租车shuttle离开，去往麦卡伦国际机场1号航站楼或者3号航站楼。希望我的回答能够帮到你。祝你愉快！
			</p>
			<p class="tr">
				<span class="mr10 orange adopt">
					<i class="icon"></i>
					<a href="javascript:;"><span>采纳</span></a>
				</span>
				<span class="i-support mr10">
					<i class="icon"></i>
					<span>赞(</span><span class="praises">18</span><span>)</span>
				</span>
				<span class="i-comment">
					<i class="icon"></i>
					<span>评论(</span><span class="reply">18</span><span>)</span>
				</span>
				<span class="i-report">
					<i class="icon"></i>
					<span>举报</span>
				</span>
			</p>
		</div>
	</div>
	<div class="details_comment"><!-- 字节回复DIV -->
		<span class="abs delete iicon"></span>
		<div class="search"><!-- 回复框DIV位置 -->
			<form class="socendaryForm">
				<input type="text" value="" class='txt' />
				<input type="button" class='but' value="发表评论" />
			</form>
		</div>
		<ul class="list_detai"><!-- 子级回复列表位置 -->
		</ul>
	</div>
</li>
</ul>
<ul id="secondaryReplyModel" style="display: none;">
	<li>
	<input type="hidden" name="rootId"/>
	<input type="hidden" name="id"/>
	<input type="hidden" name="userId"/>
	<dl class="past">
		<dt>
			<img src="img/avatar2.jpg"/>
			<p>
				<span>普通会员</span>
			</p>
			<p class="block">
			</p>
		</dt>
		<dd>
			<p class="replyFloor">楼层</p>
			<h3 class="v-title">
				<span class="grey fr">
					<i class="iicon i-clock"></i>
					<span>2015-6-1 21:30</span>
				</span>
				<span class="nickName f12">Ssinz</span>
			</h3>
			<p class="replyContent">不好意思，刚看到您的问题。</p>
			<p class="tr">
				<span class="orange"><!-- 回复 --></span>
				<span class="i-report">举报</span>
			</p>
		</dd>
	</dl>
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
	<div class="content_wrap pb90">
		<div class="content">
		    <div class="breadcrumb">当前位置：<a href="">首页</a><a href="pc/interact/home">互动社区</a><a href="pc/question/index">旅行问答 </a><span>问答详情</span></div>
			<div class="whitebg">
			    <div class="pd20">
				  <div class="order">
				     <div class="review clearfix">
					    <div class="view-let">
						  <img src="${question.head_img }"/>
						  <p><span class="orange">普通会员</span></p>
						  <p class="block" id="rank">
						  		
						  </p>
						</div>
						<div class="view-rgt">
						  <h3 class="v-title"><span class="grey fr"><i class="iicon i-clock"></i><span id="createTime">2015-6-1    21:30</span></span>${question.nickname}</h3>
						  <p>${question.content }</p>
						  <c:if test="${question.isDelete==0 }">
	                          <p class="tr"><span class="icon i-delete ml20" onclick="deleteTravels()"></span></p>       
						  </c:if>
						</div>
				     </div>
					 
				  </div>
				</div>
				<div class="detail_wrap3">
				  <ul class="list_comment"><!-- 回复列表 -->
				  </ul>
			    </div>
				<div class="pagination pat40"><!-- 分页 -->
				</div>	
				<div class="all-comment">
			       <p><span class="i-comment mr10"><i class="icon"></i>解答（${question.replyCount}）</span></p>
				   <div class="tare"><textarea id="reply" placeholder=""></textarea></div>
				   <div class="tr mt20"><button id="replyBtn" class="Btn">发表评论</button></div>
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
	<button class="Btn" name="case-ok" onclick="callBack();">确认</button>
</div>
</div>

<div id="confirmDialog" style="display: none;">
<div class="innerdiv pd20 tc">
	<p style="padding:50px 0; color:#333;">确认删除？</p>
	<button class="Btn" name="case-ok" onclick="confirmDelete(${question.id})">确认</button>
	<button class="Btn" name=".btn-close" onclick="closeConfirmDialog()">取消</button>
</div>
</div>

<div id="confirmAdoptDialog" style="display: none;">
<div class="innerdiv pd20 tc">
	<p style="padding:50px 0; color:#333;">确认采纳该回复？</p>
	<button class="Btn" name="case-ok" onclick="confirmAdopt()">确认</button>
	<button class="Btn" name=".btn-close" onclick="closeConfirmAdoptDialog()">取消</button>
</div>
</div>

<div id="confirmReportDialog" style="display: none;">
<div class="innerdiv pd20 tc">
	<p style="padding:50px 0; color:#333;">请选择举报原因</p>
	<form action="" class="reportForm" style="margin-bottom: 3px;">
		<label><input type="radio" name="reportReason" value="色情低俗" />色情低俗</label>
		<label><input type="radio" name="reportReason" value="广告骚扰" />广告骚扰</label>
		<label><input type="radio" name="reportReason" value="涉嫌隐私披露" />涉嫌隐私披露</label><br />
		<label><input type="radio" name="reportReason" value="涉嫌诱导欺诈" />涉嫌诱导欺诈</label>
		<label><input type="radio" name="reportReason" value="政治敏感" />政治敏感</label><br />
		<label><input type="radio" name="reportReason" value="other"/>其他</label>
		<input id="otherInput" style="border-bottom: 1px solid #999999"/>
	</form>
	<button class="Btn" name="case-ok" onclick="confirmReport()">确认</button>
	<button class="Btn" name=".btn-close" onclick="closeConfirmReportDialog()">取消</button>
</div>
</div>

<script type="text/javascript" src="static/web/js/base.js"></script>
<script type="text/javascript" src="static/web/js/index.js"></script>
<script type="text/javascript" src="static/web/js/person.js"></script>
<script type="text/javascript">

var pageNo=1;
var totalPage=0;
var SecondaryPageNo=1;
var questionId=parseInt("${question.id}");
var userId=parseInt("${question.userId}");
var ruleDlg ;
var confirmDlg;
var confirmAdoptDlg;
var goUrl="";
var adopt="${question.adopt}";
var adoptId;
var tempReportId=0;

$(function(){
	previewProDetailImg();
	selfDefineFormBtn();
	// 修改身份对话框
	ruleDlg = new dialogBox({
		title : "提示",
		contentHtml : $("#rulepopup").html(),
		popupBoxW : 490,
		closeBtnshow : 0,
		initEvent : function($dom){
		}
	});
	
	confirmDlg = new dialogBox({
		title : "提示",
		contentHtml : $("#confirmDialog").html(),
		popupBoxW : 490,
		closeBtnshow : 0,
		initEvent : function($dom){
		}
	});
	confirmAdoptDlg = new dialogBox({
		title : "提示",
		contentHtml : $("#confirmAdoptDialog").html(),
		popupBoxW : 490,
		closeBtnshow : 0,
		initEvent : function($dom){
		}
	});
	
	confirmReportDlg = new dialogBox({
		title : "提示",
		contentHtml : $("#confirmReportDialog").html(),
		popupBoxW : 490,
		closeBtnshow : 0,
		initEvent : function($dom){
		}
	});
	
	$(".i-collect i").click(function(){
		ruleDlg.showDlg();
	});
	
	$("#createTime").html(getTimeTxt(parseInt("${question.create_time.getTime()}"),16));
	
	var iicon='<i class="iicon i-level${question.p_level_name }"></i>';
	var badgeNumber=parseInt("${question.badgeNumber}");
	$("#rank").empty();
	for(var i=0;i<badgeNumber;i++){
		$("#rank").append(iicon);
	}
	
	$("#replyBtn").click(function(){
		addReply();
	});
	
	
	initReply();
	
	$(document).on("click",".i-report",function(){
		tempReportId=$(this).attr("_id");
		confirmReportDlg.showDlg();
		$(".popup-case .reportForm input[type=radio]:first").click();
		$(".popup-case .reportForm  #otherInput").val("");
	});
});

function closeConfirmReportDialog(){
	confirmReportDlg.hideDlg();
}

function confirmReport(){
	var reportReason=$(".popup-case .reportForm input[type=radio]:checked").val();
	if(reportReason=="other"){
		reportReason=$(".popup-case .reportForm #otherInput").val();
	}
	$.post("<%=basePath %>app/question/addReport",{fromTable:'web_travels_reply',fromId:tempReportId,reportReason:reportReason},function(data){
		if(data.message=='success'){
			resetDialog("已举报该回复");
		}else{
			resetDialog("举报失败，请稍后重试");
		}
		ruleDlg.showDlg();
	});
}

//初始化一级回复List
var levelColor=["green","lorange","blue"];
function initReply(){
	$.post("<%=basePath %>pc/question/replyList",{pageNo:pageNo,questionId:questionId},function(data){
		if(data.status=='success'){
			var list =data.list;
			var listComment=$(".list_comment")
			listComment.empty();
			for(var i=0;i<list.length;i++){
				var item=$("#replyModel").children().clone();
				item.find(".view-let img").attr("src",list[i].head_img);//头像URL
				item.find(".view-let span").html(list[i].level);//会员等级
				item.find(".view-let span").addClass(levelColor[parseInt(list[i].p_level_name)-1]);
				var level='<i class="iicon i-level'+list[i].p_level_name+'"></i>';//勋章等级
				for(var j=0;j<list[i].badgeNumber;j++){//勋章数量
					item.find(".view-let .block").append(level);
				}
				item.find(".view-rgt .grey span").html(getTimeTxt(list[i].create_time,16));
				item.find(".view-rgt .nickName").html(list[i].nickname);
				item.find(".view-rgt .floor").html(((pageNo-1)*10+i+1)+"楼");
				item.find(".view-rgt .content").html(list[i].content);
				item.find(".view-rgt .praises").html(list[i].praise);
				item.find(".view-rgt .reply").html(list[i].replyCount);
				item.find(".view-rgt .adopt").attr("_flag",list[i].isAdopt);
				item.find(".view-rgt .adopt").attr("_id",list[i].id);
				if(list[i].isAdopt==0){
					item.find(".view-rgt .adopt").html("已采纳");
				}else{
					item.find(".view-rgt .adopt").bind("click",function(){
						doAdopt(this);
					});
				}
				item.find(".review span.i-comment").attr("_id",list[i].id);
				item.find(".review span.i-report").attr("_id",list[i].id);
				item.find(".review .i-support").attr("_id",list[i].id);
				item.find("form").attr("_id",list[i].id);
				item.find("form").attr("_rootId",list[i].id);
				item.find("form").attr("_userId",list[i].userId);
				listComment.append(item);
			}
			
			//初始二级回复List内容
			$(".list_comment .review span.i-comment").click(function(){
				initSecondary($(this));
			});
			
			//初始化点击展开二级回复List
			$(".review span.i-comment").click(function(){
				$(this).parents('.list_comment li').find('.details_comment').slideDown();
				$(this).parents('.list_comment li').siblings('li').find('.details_comment').slideUp();
			});
			$(".details_comment span.delete").click(function(){
				$(this).parents('.details_comment').slideUp();
			});
			
			//初始化二级回复List展开点击触发事件
			$(".i-support").click(function(){
				praiserReply($(this));
			});
			
			//提交回复
			$(".but").click(function(){
				if("${userId}"==""){
					console.info(url);
					var url=window.location.href;
					$.post("<%=basePath %>pc/login/setBackUrl",{backUrl:url},function(data){
						if(data.status=="success"){
							resetDialog("请先登录");
							goUrl="<%=basePath %>pc/login?op=toLogin";
							ruleDlg.showDlg();
						}
					});
				}else{
				var form=$(this).parents("form");
				var replyId=form.attr("_id");
				var toUserId=form.attr("_userId");
				var rootId=form.attr("_rootId");
				var content=form.find(".txt").val();
				var userId=parseInt("${userId}");
				var data={content:content,toUserId:toUserId,replyId:replyId,replyUserId:userId,rootId:rootId};
				var replyNumberNode=$(this).parents("li").find(".i-comment .reply");
				var iicon=$(this).parents("li").find(".i-comment");
				if(content==""){
					valTips(form.find(".txt"), "请输入内容");
					return;
				}
				if(content.length>400){
					valTips(form.find(".txt"), "输入内容过长");
					return;
				}
				$.post("<%=basePath %>pc/question/addReply",data,function(data){
					if(data.status=="success"){
						resetDialog("回复成功");
						ruleDlg.showDlg();
						var replyNumber=parseInt(replyNumberNode.html());
						replyNumber+=1;
						replyNumberNode.html(replyNumber);
						initSecondary(iicon);
						form.find(".txt").val("");
					}else{
						alert("提交失败，请稍后再试");
					}
				});
				}
			});
			if(adopt=="0"){
				$(".adopt[_flag=1]").hide();
			}
			if("${question.isDelete}"=="1"){
				$(".adopt").hide();
			}
			//初始化分页
			totalPage=data.totalPage;
			initPage();
		}
	});
}

//初始化二级回复List
function initSecondary(obj){
	SecondaryPageNo=1;
	var replyId=$(obj).attr("_id");
	var data={pageNo:SecondaryPageNo,replyId:replyId,length:20};
	$.post("<%=basePath %>pc/question/secondaryReply",data,function(data){
		var list=data.list;
		var listNode=$(obj).parents("li").find(".list_detai");
		listNode.empty();
		for(var i=0;i<list.length;i++){
			console.info(list[i]);
			var listItem=$("#secondaryReplyModel").children().clone();
			listItem.find("img").attr("src",list[i].userHeadImg);
			listItem.find("dt span").html(list[i].level_desc);
			listItem.find("dt span").addClass(levelColor[parseInt(list[i].p_level_name)-1]);
			var level='<i class="iicon i-level'+list[i].p_level_name+'"></i>';//勋章等级
			for(var j=0;j<list[i].level_name;j++){//勋章数量
				listItem.find(".block").append(level);
			}
			listItem.find("span.i-report").attr("_id",list[i].id);
			listItem.find(".grey span").html(getTimeTxt(list[i].create_time,16));
			listItem.find(".nickName").html(list[i].userNickName);
			listItem.find("dd .replyFloor").html((i+1)+"楼");
			listItem.find("dd .replyContent").html(list[i].content);
			listItem.find("input[name=rootId]").val(list[i].root_id);
			listItem.find("input[name=id]").val(list[i].id);
			listItem.find("input[name=userId]").val(list[i].userId);
			listNode.append(listItem);
		}
		//点击回复时，将对应的回复ID和用户ID填到回复框的form中，可以指定回复到某条回复和某个人
		$(".list_detai li dd .orange").click(function(){
			var li=$(this).parents("li:first");
			var replyId=li.find("input[name=id]").val();
			var userId=li.find("input[name=userId]").val();
			//console.info(li);
			//console.info(replyId+"-"+userId);
			$(this).parents(".details_comment").find("form").attr("_id",replyId);
			$(this).parents(".details_comment").find("form").attr("_userId",userId);
		});
	});
}

//点赞评论
function praiserReply(obj){
	if("${userId}"==""){
		var url=window.location.href;
		$.post("<%=basePath %>pc/login/setBackUrl",{backUrl:url},function(data){
			if(data.status=="success"){
				resetDialog("请先登录");
				goUrl="<%=basePath %>pc/login?op=toLogin";
				ruleDlg.showDlg();
			}
		});
	}else{
		var replyId=$(obj).attr("_id");
		$.post("<%=basePath %>pc/question/praiseReply",{replyId:replyId},function(data){
			if(data.status=="success"){
				resetDialog("点赞成功");
				var praiseNumber=parseInt($(obj).find(".praises").html());
				$(obj).find(".praises").html(praiseNumber+1)
				ruleDlg.showDlg();
			}else if(data.status=="exists"){
				resetDialog("已点赞该文章");
				ruleDlg.showDlg();
			}else{
				resetDialog("系统忙，请稍后");
				ruleDlg.showDlg();
			}
		});
	}
}

//提交一级回复
function addReply(){
	if("${userId}"==""){
		var url=window.location.href;
		console.info(url);
		$.post("<%=basePath %>pc/login/setBackUrl",{backUrl:url},function(data){
			if(data.status=="success"){
				resetDialog("请先登录");
				goUrl="<%=basePath %>pc/login?op=toLogin";
				ruleDlg.showDlg();
			}
		});
	}else{
	var content=$("#reply").val();
	var toUserId=parseInt("${question.userId}");
	var userId=parseInt("${userId}");
	var data={content:content,toUserId:toUserId,replyId:questionId,replyUserId:userId,rootId:0};
	if(content==""){
		valTips($("#reply"), "请输入内容");
		return;
	}
	if(content.length>400){
		valTips($("#reply"), "输入内容过长");
		return;
	}
	 $.post("<%=basePath %>pc/question/addReply",data,function(data){
		if(data.status=="success"){
			resetDialog("回复成功");
			ruleDlg.showDlg();
			initReply();
			$("#reply").val("");
		}else{
			alert("提交失败，请稍后再试");
		}
	});
	}
}

function doAdopt(obj){
	adoptId=$(obj).attr("_id");
	confirmAdoptDlg.showDlg();
}

//弹出确认框
function deleteTravels(){
	confirmDlg.showDlg();
}

//关闭确认框(取消)
function closeConfirmDialog(){
	confirmDlg.hideDlg();
}

//关闭确认框(取消)
function closeConfirmAdoptDialog(){
	confirmAdoptDlg.hideDlg();
}

//删除本吐槽
function confirmDelete(id){
	$.post("<%=basePath %>pc/question/delete",{questionId:questionId,userId:userId},function(data){
		if(data.status=='success'){
			resetDialog("已删除该文章");
			goUrl="<%=basePath %>pc/question/index";
		}else{
			resetDialog("提交失败，请稍后重试");
		}
		ruleDlg.showDlg();
	});
}

function confirmAdopt(){
	var data={replyId:adoptId};
	 $.post("<%=basePath %>pc/question/adopt",data,function(data){
		if(data.status=="success"){
			resetDialog("采纳成功");
			ruleDlg.showDlg();
			initReply();
			adoptId=null;
			goUrl=window.location.href;
		}else if(data.status=="exists"){
			resetDialog("问题已采纳");
			ruleDlg.showDlg();
		}else{
			resetDialog("采纳失败，请稍后再试");
			ruleDlg.showDlg();
		}
	});
}

function callBack(){
	if(goUrl!=""){
		window.location.href=goUrl;
	}
}

function gotoPage(goNo){
	pageNo=parseInt(goNo);
	initReply();
}

function goPage(){
	pageNo=parseInt($("#gotopage").val());
	if(parseInt($("#gotopage").val())>totalPage){
		$("#gotopage").val(totalPage);
		valTips("gotopage", "输入页数大于当前最大页数");
	}else{
		initReply();
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