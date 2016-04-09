<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transition al.dtd"><%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../../static/inc_web.jsp" %>
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv = "X-UA-Compatible" content = "IE=edge,chrome=1 " /><meta charset="utf-8"> 
<title>个人资料</title>
<!-- 日期时间控件 -->
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
				<!-- <li><a href="pc/simple/home">智易行</a></li> -->
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
				<div class="personal-info clearfix">
					<div class="head fl"><img src="${user.headImg }" width="80" height="80"></div>
					<div class="info fl">
						<span style="display:inline-block;width: 80px;">${user.nickname }</span>
						<p><span class="pr10 grey9">等级</span><span class="orange">${user.parentLevelDesc }</span></p>
						<p>
							<c:if test="${user.parentLevelName == 1 }">
								<c:if test="${user.levelName == 1}">
									<i class="iicon i-bronze"></i>
								</c:if>
								<c:if test="${user.levelName == 2}">
									<i class="iicon i-bronze"></i><i class="iicon i-bronze"></i>
								</c:if>
								<c:if test="${user.levelName == 3}">
									<i class="iicon i-bronze"></i><i class="iicon i-bronze"></i><i class="iicon i-bronze"></i>
								</c:if>
								<c:if test="${user.levelName == 4}">
									<i class="iicon i-bronze"></i><i class="iicon i-bronze"></i><i class="iicon i-bronze"></i><i class="iicon i-bronze"></i>
								</c:if>
								<c:if test="${user.levelName == 5}">
									<i class="iicon i-bronze"></i><i class="iicon i-bronze"></i><i class="iicon i-bronze"></i><i class="iicon i-bronze"></i><i class="iicon i-bronze"></i>
								</c:if>
							</c:if>
							<c:if test="${user.parentLevelName == 2 }">
								<c:if test="${user.levelName == 1}">
									<i class="iicon i-gold"></i>
								</c:if>
								<c:if test="${user.levelName == 2}">
									<i class="iicon i-gold"></i><i class="iicon i-gold"></i>
								</c:if>
								<c:if test="${user.levelName == 3}">
									<i class="iicon i-gold"></i><i class="iicon i-gold"></i><i class="iicon i-gold"></i>
								</c:if>
								<c:if test="${user.levelName == 4}">
									<i class="iicon i-gold"></i><i class="iicon i-gold"></i><i class="iicon i-gold"></i><i class="iicon i-gold"></i>
								</c:if>
								<c:if test="${user.levelName == 5}">
									<i class="iicon i-gold"></i><i class="iicon i-gold"></i><i class="iicon i-gold"></i><i class="iicon i-gold"></i><i class="iicon i-gold"></i>
								</c:if>
							</c:if>
							<c:if test="${user.parentLevelName == 3 }">
								<c:if test="${user.levelName == 1}">
									<i class="iicon i-diamod"></i>
								</c:if>
								<c:if test="${user.levelName == 2}">
									<i class="iicon i-diamod"></i><i class="iicon i-diamod"></i>
								</c:if>
								<c:if test="${user.levelName == 3}">
									<i class="iicon i-diamod"></i><i class="iicon i-diamod"></i><i class="iicon i-diamod"></i>
								</c:if>
								<c:if test="${user.levelName == 4}">
									<i class="iicon i-diamod"></i><i class="iicon i-diamod"></i><i class="iicon i-diamod"></i><i class="iicon i-diamod"></i>
								</c:if>
								<c:if test="${user.levelName == 5}">
									<i class="iicon i-diamod"></i><i class="iicon i-diamod"></i><i class="iicon i-diamod"></i><i class="iicon i-diamod"></i><i class="iicon i-diamod"></i>
								</c:if>
							</c:if>
						</p>
						<p class="fs12"><span class="pr10 grey9">桃子</span><span class="orange">${user.score }</span></p>
					</div>
				</div>
				<ul class="menu">
					<li><a href="pc/user/home">我的主页</a></li>
					<li><a href="pc/user/info" class="current">个人资料</a></li>
					<li><a href="pc/user/account/detail">账户明细</a></li>
					<li><a href="pc/user/order/depthList">订单管理</a></li>
					<li><a href="pc/user/account/setting">账户设置</a></li>
					<li><a href="pc/user/message">消息中心</a></li>
				</ul>
			</div>
			<div class="rpart">
				<div class="right-warp pt20">
					<div class="title">
						<span>个人资料</span>
					</div>
					<div class="info-content">
						<div class="fitemwrap">
							<span class="item-title head">头像</span>
							<div class="inline-block mr10">
								<img id="heads" src="${user.headImg }" width="90" height="90" />
								<input type="file" style="display: none;" name="img" id="img" onchange="ajaxFileUpload(this);"/>
								<input type="text" name="headImg" id="url" value="${user.headImg }" style="display:none;">
								<button class="btnOrange upload" id="openUpload">上传头像</button>
							</div>
						</div>
						<form id="myForm">
						<input type="hidden" name="sex" value="">
						<div class="fitemwrap">
							<span class="item-title">昵称</span>
							<div class="mr10 nikname">
								<input name="nickname" id="nickname" value="${user.nickname }" maxlength="10"/>
							</div>
						</div>
						<div class="fitemwrap">
							<span class="item-title">性别</span>
							<div class="mr10 sex">
								<c:if test="${user.sex eq '男' }"></c:if>
								<span><i val="1" class="iicon checkbox <c:if test="${user.sex eq '男' }">checked</c:if>"></i>男</span>
								<span><i val="0" class="iicon checkbox <c:if test="${user.sex eq '女' }">checked</c:if>"></i>女</span>
							</div>
						</div>
						<div class="fitemwrap">
							<span class="item-title">生日</span>
							<input value="${user.birthday }" name="birthday" id="birthday" class="datetime form-control" readonly type="text" />
						</div>
						<div class="fitemwrap">
							<span class="item-title">所在地</span>
							<div class="form-item select-item mr10" style="width:186px;">
								<span class="select-text">
									<c:if test="${user.areaParent !=null && user.areaParent != '' }">
										${user.areaParentName }
									</c:if>
									<c:if test="${user.areaParent ==null || user.areaParent == '' }">
										请选择省市
									</c:if>
								</span>
								<i class="iicon i-select"></i>
								<select id="province" name="province" onchange="getCity()">
									<option value="">请选择</option>
									<c:forEach var="area" items="${areaList }">
										<option value="${area.id }" <c:if test="${user.areaParent == area.id }">selected=selected</c:if>>${area.name }</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-item select-item" style="width:160px;">
								<span class="select-text">
									<c:if test="${user.atAreaId !=null && user.atAreaId != '' }">
										${user.areaName }
									</c:if>
									<c:if test="${user.atAreaId ==null || user.atAreaId == '' }">
										全部
									</c:if>
								</span>
								<i class="iicon i-select"></i>
								<select id="city" name="atAreaId">
								</select>
							</div>
						</div>
						<div class="fitemwrap">
							<span class="item-title">电话</span>
							<div class="mr10 contact">
								<span class="phone" id="phone">${user.phone }</span><a href="pc/user/account/setting">修改</a>
							</div>
						</div>
						<div class="fitemwrap">
							<span class="item-title">邮箱</span>
							<div class="mr10 contact">
								<span class="phone" id="email"></span><a href="pc/user/account/setting">修改</a>
							</div>
						</div>
						<div class="fitemwrap">
							<span class="item-title">个人介绍</span>
							<div class="mr10">
								<textarea class="grey9" placeholder="您的个人介绍将体现到个人主页中" name="summary">${user.summary }</textarea>
							</div>
						</div>
						</form>
						<div class="fitemwrap">
							<button onclick="save()" class="btn lorgbtn ml10" style="vertical-align:bottom;">保存</button>
						</div>
					</div>
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

<!-- 日期时间控件 -->
<script type="text/javascript" src="static/web/js/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="static/web/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="static/web/js/base.js"></script>
<script type="text/javascript" src="static/web/js/index.js"></script>
<script type="text/javascript" src="static/js/ajaxfileupload.js"></script>
<script type="text/javascript">
$(function(){
	selfDefineFormBtn();
	$('.datetime').datetimepicker({
		autoclose:2,
		format:"yyyy-mm-dd",
		//minView: 1,
		minView: "month",
		language:'zh-CN',
		todayBtn: true
	});
	
	$("#phone").html(enPhone());
	$("#email").html(enMail());
	
	$("#openUpload").click(function(){
		$("#img").click();
	});
});

function enPhone(){
	var phone ='${user.phone }';
	if(phone != ''){
		var sinx = phone.substring(0, 3);
		var einx = phone.substring(phone.length-3, phone.length);
		return sinx +"*****"+einx;
	}else{
		return '暂无';
	}
}

function enMail(){
	var email ='${user.email }';
	if(email != ''){
		var sinx = email.substring(0, 3);
		var einx = email.substring(email.indexOf("@"), email.length);
		return sinx +"*****"+einx;
	}else{
		return '暂无';
	}
}

//保存
function save(){
	var formObj = serializeObject($("#myForm"));
	formObj.sex = $(".sex .checked").attr("val");
	formObj.headImg = $("#url").val();
	$.post('<%=basePath %>pc/user/saveInfo', formObj ,function(res){
		if(res.status == 'success'){
			popMesTip("保存成功",function(){
				window.location.href = window.location.href;
			});
		}else{
			popMesTip("系统忙，请稍后重试");
		}
	});
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

function ajaxFileUpload(obj) {
	//获取欲上传的文件路径  
	var fileId = $(obj).attr("id");
	$.ajaxFileUpload({
		url : 'pc/user/uploadHead', //需要链接到服务器地址
		secureuri : false,
		fileElementId : fileId, //文件选择框的id属性
		dataType : "text", //服务器返回的格式，可以是json
		success : function(data) { //相当于java中try语句块的用法
			window.location.href = window.location.href;
			data = data.replace(/<[^>].*?>/g, "");//对返回的数据进行转换
			var json = eval("(" + data + ")");//对返回的数据进行转换
			$("#url").val(json.imgUrl);
			$("#heads").attr({
				src : '<%=basePath %>'+json.imgUrl
			});
		}
	});
}

function getCity(){
	var id=$("#province").val();
	$.post("<%=basePath %>pc/areaAll/getChildren",{id:id},function(data){
		var list=data.list;
		$("#city").parents("div:first").show();
		$("#city").html("");
		$("#city").append('<option value="">请选择</option>');
		$("#city").val("");
		$("#city").prevAll(".select-text").html("请选择市");
		for(var i=0;i<list.length;i++){
			var atAearId = '${user.atAreaId}';
			if(atAearId == list[i].id){
				$("#city").append('<option selected=selected value="'+list[i].id+'">'+list[i].name+'</option>');
				$("#city").prevAll(".select-text").html(list[i].name);
			}
			$("#city").append('<option value="'+list[i].id+'">'+list[i].name+'</option>');
		}
	});
}

getCity();
</script>
</body>
</html>