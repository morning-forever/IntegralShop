<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transition al.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../../../../static/inc_web.jsp" %>
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv = "X-UA-Compatible" content = "IE=edge,chrome=1 " /><meta charset="utf-8"> 
<title>订单管理-评价</title>
<link rel="stylesheet" href="static/web/css/common.css" />
<link rel="stylesheet" href="static/web/css/inner.style.css" />
<link rel="stylesheet" href="static/web/css/order.management.css" />
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
				<li class="active"><a href="pc/depth/home">主题深度游</a></li>
				<li>
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
		<div class="content order-manage">
			<div class="breadcrumb">当前位置：<a href="pc/home">首页</a><a href="pc/user/order/depthList">订单管理</a><span>评价</span></div>
			<div class="whitebg pb20">
				<div class="remark">
					<div class="order-info pt20 pb20 clearfix">
						<img src="${goodsInfo.picUrl }" width="316" height="179" class="fl">
						<div class="ml10 fl rel" style="height:180px;">
							<p class="f16 dark">${goodsInfo.goodsName }</p>
							<p class="lorange abs" style="margin-top:68px;padding-left:5px;bottom:0;width: 200px;">￥<span class="f18 bold">${goodsInfo.realPrice }</span><span class="grey9 pl20">数量 ${goodsInfo.goodsCount }</span></p>
						</div>
					</div>
					<div class="score mt20">
						<span class="pr20">评分</span><i class="iicon i-score hasscore"></i><i class="iicon i-score hasscore"></i><i class="iicon i-score hasscore"></i><i class="iicon i-score hasscore"></i><i class="iicon i-score noscore"></i><span class="pl20 f16 grey">4.0分</span>
					</div>
					<form id="myForm">
					<input type="hidden" name="orderId" value="${goodsInfo.orderId }">
					<input type="hidden" name="goodsId" value="${goodsInfo.goodsId }">
					<input type="hidden" name="score" value="">
					<textarea class="txarea mt20" id="comment" name="comment" placeholder="评价140字以内" maxlength="140"></textarea>
					<div class="addimgs clearfix mt10">
						<div class="img add">
							<img id="img1" src="" width="109" height="109" onclick="inputClick(this)">
							<input type="file" name="img" id="input1" style="display: none;" onchange="ajaxFileUpload(this)">
					    	<input type="text" name="url" id="url1" style="display:none;">
						</div>
						<div class="img add">
							<img id="img2" src="" width="109" height="109" onclick="inputClick(this)">
							<input type="file" name="img" id="input2" style="display: none;" onchange="ajaxFileUpload(this)">
				    		<input type="text" name="url" id="url2" style="display:none;">
						</div>
						<div class="img add">
							<img id="img3" src="" width="109" height="109" onclick="inputClick(this)">
							<input type="file" name="img" id="input3" style="display: none;" onchange="ajaxFileUpload(this)">
				    		<input type="text" name="url" id="url3" style="display:none;">
						</div>
						<div class="img add">
							<img id="img4" src="" width="109" height="109" onclick="inputClick(this)">
							<input type="file" name="img" id="input4" style="display: none;" onchange="ajaxFileUpload(this)">
				    		<input type="text" name="url" id="url4" style="display:none;">
						</div>
						<div class="img add">
							<img id="img5" src="" width="109" height="109" onclick="inputClick(this)">
							<input type="file" name="img" id="input5" style="display: none;" onchange="ajaxFileUpload(this)">
				    		<input type="text" name="url" id="url5" style="display:none;">
						</div>
					</div>
					</form>
					<div class="tc mt20 mb20">
						<button class="btn lorgbtn" onclick="saveComment()">发表评论</button>
					</div>
				</div>
			</div>
		</div>
						
	</div>

	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
</div>
<script type="text/javascript" src="static/web/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="static/js/ajaxfileupload.js"></script>
<script type="text/javascript" src="static/js/jquery.tips.js"></script>
<script type="text/javascript" src="static/web/js/base.js"></script>
<script type="text/javascript">
$(function(){
	selfDefineFormBtn();
	HorizontalList();
	
	//给分数添加样式
	$(".i-score").css("cursor","pointer");
	$("input[name=score]").val(4);//默认评分为4
	
	//评分爱心点击事件
	$(".i-score").click(function(){
		var inx = $(".i-score").index(this);//当前元素的索引值
		//设置点击元素之前的元素样式为选中
		for(var i = 0; i <= inx; i++){
			$(".i-score:eq("+i+")").attr("class","iicon i-score hasscore");
		}
		//设置点击元素之前的元素样式为未选中
		for(var i = inx+1; i < $(".i-score").length; i++){
			$(".i-score:eq("+i+")").attr("class","iicon i-score noscore");
		}
		//设置分数
		$(".score span:last").text($(".score [class$=hasscore]").length+".0分");
		$("input[name=score]").val($(".score [class$=hasscore]").length);//分数值
	});
});

//图片点击事件
function inputClick(obj) {
	var id = $(obj).attr("id");
	var input = "input" + id.substring(3, id.length);
	$("#" + input).click();
}

//文件上传
function ajaxFileUpload(obj) {
	//获取欲上传的文件路径  
	var file = $(obj).val();
	var fileId = $(obj).attr("id");
	$.ajaxFileUpload({
		url : '<%=basePath %>merchSystem/info/imgFileUpload', //需要链接到服务器地址
		secureuri : false,
		fileElementId : fileId, //文件选择框的id属性
		dataType : 'JSON', //服务器返回的格式，可以是json
		success : function(data) { //相当于java中try语句块的用法
			data = data.replace(/<[^>].*?>/g, "");//对返回的数据进行转换
			var json = eval("(" + data + ")");//对返回的数据进行转换
			var number = fileId.substring(5, fileId.length);
			$("#url" + number).val(json.imgUrl);
			$("#img" + number).attr({
				src : json.imgUrl
			});
		}
	});
}

//发表评论
function saveComment(){
	var comment = $("#comment").val();
	if(!checkField(comment,0,140)){
		valTips('comment','评价内容不超过140个字');
		return;
	}
	var myForm = serializeObject($("#myForm"));
	$.post('<%=basePath %>pc/user/order/saveEvaluate', myForm , function(res) {
		if (res.status == 'success') {
			popMesTip("评价成功",function(){
				location.href = "<%=basePath %>pc/user/order/depthList";
			});
		}else if (res.status == 'exists') {
			popMesTip("该订单已评价过");
		} else {
			popMesTip("系统忙，请稍后重试");
		}
	}, "JSON");
}

//表单序列化
var serializeObject = function(form) {
	var o = {};
	$.each(form.serializeArray(), function(index) {
		if (o[this["name"]]) {
			o[this["name"]] = o[this["name"]] + "," + this["value"];
		} else {
			o[this["name"]] = this["value"];
		}
	});
	return o;
};
</script>
</body>
</html>
