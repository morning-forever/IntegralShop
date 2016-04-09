<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transition al.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../../../../static/inc_web.jsp" %>
<html>
<head>
<meta http-equiv = "X-UA-Compatible" content = "IE=edge,chrome=1 " /><meta charset="utf-8"> 
<base href="<%=basePath %>">
<title>申请成为达人</title>
<link rel="stylesheet" href="static/web/css/common.css" />
<link rel="stylesheet" href="static/web/css/inner.style.css" />
<link rel="stylesheet" href="static/web/css/personal.center.css" />
<link rel="stylesheet" href="static/web/css/member.css"/>
</head>
<body>
<div id="areaModel" style="display: none">
 <span class="adress"><span class="areaName">贵阳市</span><i class="iicon delete"></i></span>
</div>
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
		
		<div class="content">
			<div class="whitebg mt20">
				<div class="pd20">
				<form action="" id="form">
				  <div class="apply pb20 clearfix">
				    <dl>
					  <dt><h3>申请成为达人</h3></dt>
					  <dd>
					    <h3><i class="iicon i-i"></i>申请达人必备条件</h3>
						<p><a href="#"></a>1、头像必须为本人真实照片</p>
						<p><a href="#"></a>2、不少于20字的真实简介</p>
						<p><a href="#"></a>3、会员等级达到钻石级别</p>
					  </dd>
					</dl>
				  </div>
				  <h4 class="orangeh4">联系人信息</h4>
				  <div class="form-cont pb10">
				      <div class="reg-item">
                        <span class="item-le">&nbsp;&nbsp;申请帐号</span>
                        <span class="item-ri">
						   <span class="list-item phone_and_email"></span>
						</span>
                      </div>
					  <div class="reg-item">
                        <span class="item-le" style="height: 100px"><span class="red f12">* </span>真实头像</span></span>
                        <span class="item-ri">
						  <span class="">
						  	<div class="inline-block mr10">
								<img id="heads" src="${map.real_head_img }" width="90" height="90" />
								<input type="file" style="display: none;" name="img" id="img" onchange="ajaxFileUpload(this);"/>
								<input type="text" name="realHeadImg" id="url" value="${map.real_head_img }" style="display:none;">
								<button class="btnOrange upload" id="openUpload">上传头像</button>
							</div>
						  </span>
						</span>
                      </div>
					  <div class="reg-item">
                        <span class="item-le"><span class="red f12">* </span>真实姓名</span></span>
                        <span class="item-ri">
						  <span class="list-item"><input tips="请输入真实姓名" value="${map.real_name }" id="realName" name="realName" type="text" placeholder="真实姓名"></span>
						</span>
                      </div>
					  <div class="reg-item">
                        <span class="item-le"><span class="red f12">* </span>现居住地</span></span>
                        <span class="item-ri">
						  <span class="list-item"><input tips="请输入现居住地" value="${map.nowlive }" id="nowlive" name="nowlive" type="text" placeholder="现居住地"></span>
						</span>
                      </div>
					  <div class="reg-item">
                        <span class="item-le"><span class="red f12">* </span>精通地区</span></span>
                        <span class="item-ri">
						  <span class="list-item">
						     <div class="form-item select-item inline mr20" style="width:186px;">
							   <span class="select-text">请选择</span>
							   <i class="iicon i-select"></i>
							   <select name="" id="areaSelect">
								 <option value="">请选择</option>
								 <c:forEach items="${cityList }" var="city">
									 <option value="${city.id }">${city.name }</option>
								 </c:forEach>
							   </select>
						     </div>
							 <a class="underline inline vm" href="javascript:;" onclick="addArea()">保存</a>
						  </span>
						  <div class="inline mt10 areaList" >
						  	<c:forEach items="${areaList }" var="area">
						  	<span class="adress"><span class="areaName" _id="${area.id }">${area.name }</span><i class="iicon delete"></i></span>
						  	</c:forEach>
						  </div>
						</span>
                      </div>
					  <div class="reg-item">
                        <span class="item-le"><span class="red f12">* </span>职业</span></span>
                        <span class="item-ri">
						  <span class="list-item"><input tips="请输入职业" value="${map.occupation }" id="occupation" name="occupation" type="text" placeholder="职业"></span>
						</span>
                      </div>
					  <div class="reg-item">
                        <span class="item-le"><span class="red f12">* </span>简介</span></span>
                        <span class="item-ri">
							<span class="">
								<textarea id="summary" name="summary"  tips="请填写真实简介" style="width: 300px;height: 150px" class="grey9" placeholder="请填写真实简介">${map.summary }</textarea>
							</span>
						</span>
                      </div>
				  </div>
				  <h4 class="orangeh4">联系方式</h4>
				  <div class="form-cont pb10">
				      <div class="reg-item">
                        <span class="item-le"><span class="red f12">* </span>手机</span></span>
                        <span class="item-ri">
						  <span class="list-item"><input tips="请输入手机" value="${map.phone }" id="phone" name="phone" type="text" placeholder="手机"></span>
						</span>
                      </div>
					  <div class="reg-item">
                        <span class="item-le"><span class="red f12">* </span>邮箱</span></span>
                        <span class="item-ri">
						  <span class="list-item"><input tips="请输入邮箱" value="${map.email }" id="email" name="email" type="text" placeholder="邮箱"></span>
						</span>
                      </div>
					  <div class="reg-item">
                        <span class="item-le"><span class="red f12">* </span>QQ</span></span>
                        <span class="item-ri">
						  <span class="list-item"><input tips="请输入QQ" value="${map.qq_num }" id="qq" name="qq" type="text" placeholder="QQ"></span>
						</span>
                      </div>
					  <div class="reg-item">
                        <span class="item-le"><span class="red f12">* </span>微信号</span></span>
                        <span class="item-ri">
						  <span class="list-item"><input  tips="请输入微信号" value="${map.wechat }" id="weChat" name="weChat" type="text" placeholder="微信号"></span>
						</span>
                      </div>
                      <c:if test="${map.is_audit=='TO' }">
					  <div class="reg-item">
                        <span>您的审核正在申请，审核中的申请您可以再次编辑提交</span>
                      </div>
                      </c:if>
                      <c:if test="${map.is_audit=='NO' }">
					  <div class="reg-item">
                        <span>您的审核已被拒接，您可以重新编辑提交审核</span>
                      </div>
                      </c:if>
                      <c:if test="${map.is_audit=='OK' }">
					  <div class="reg-item">
                        <span>您已经成为达人</span>
                      </div>
                      </c:if>
                      <c:if test="${ map.is_audit=='PLATFORM' }">
					  <div class="reg-item">
                        <span>您已经成为达人</span>
                      </div>
                      </c:if>
					  <div class="reg-item tc"><button class="Btn submit">保存</button></div>
				  </div>
					  </form>	
				</div>			
			</div>
		</div>	
				
	</div>

	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
</div>

<div id="rulepopup" style="display: none;">
<div class="innerdiv pd20 tc">
	<p style="padding:50px 0; color:#333;">提交成功</p>
	<button class="Btn" name="case-ok" onclick="callBack()">确认</button>
</div>
</div>
<script type="text/javascript" src="static/web/js/base.js"></script>
<script type="text/javascript" src="static/web/js/index.js"></script>
<script type="text/javascript" src="static/web/js/person.js"></script>
<script type="text/javascript" src="static/js/ajaxfileupload.js"></script>
<script type="text/javascript">

$(function(){
	
	previewProDetailImg();
	selfDefineFormBtn();
	
	$("form").bind("submit",function(){
		return false;
	});
	
	$(".Btn").bind("click",function(){
		doSubmit();
	});
	
	$(".delete").bind("click",function(){
		$(this).parents(".adress").remove();
	});
	
	var phone="${phone}";
	var email="${mail}";
	if(phone!=""&&email!=""){
		$(".phone_and_email").html(phone+"/"+email);
	}else{
		$(".phone_and_email").html(phone+email);
	}
	
	var state="${map.is_audit}";
	if(state=="OK"||state=="PLATFORM"){
		$(".submit").hide();
	}
	
	
	var url="${map.real_head_img}";
	if(url!=""){
		$("#url1").val(url);
		$("#img1").attr({
			src:url
		});
	}
	$("#openUpload").click(function(){
		$("#img").click();
	});
	
})

function doSubmit(){
	var checkIds="realName,nowlive,summary,occupation,phone,email,qq,weChat";
	if($("#url1").val()==''){
		scroll("img1");
		valTips("img1","请上传真实头像");
		return false;
	}
	if(!checkForm(checkIds)){
		return false;
	}
	var data=serializeObject($("#form"));
	var area="";
	$(".areaList .areaName").each(function(){
		area+=$(this).attr("_id")+",";
	});
	if(area==""){
		valTips("areaSelect", "请选择至少一个精通地区");
		return ;
	}else{
		var lastIndex=area.lastIndexOf(",");
		area=area.substring(0,lastIndex);
	}
	data.area=area;
	$.post("<%=basePath %>pc/user/submitMaster",data,function(result){
		if(result.status=="success"){
			alertDialog("提交成功");
			$(".popup-case .ok").one("click",function(){
				window.location.href="#"
			});
		}else{
			alertDialog("服务器忙，请稍后重试");
		}
	});
}

function addArea(){
	var id=$("#areaSelect").val();
	if(id==""){
		valTips("areaSelect", "请选择");
	}else{
		var name=$("#areaSelect option[value="+id+"]").html();
		var area=$("#areaModel").children().clone();
		area.find(".areaName").html(name);
		area.find(".areaName").attr("_id",id);
		area.find(".delete").bind("click",function(){
			$(this).parents(".adress").remove();
		});
		$(".areaList .areaName[_id="+id+"]").parents(".adress").remove();
		$(".areaList").append(area);
	}
}


function checkForm(ids){
	flag="";
	var idArr=ids.split(",");
	for(var i=0;i<idArr.length;i++){
		var id=idArr[i];
		if($("#"+id).val()=="" || $("#"+id).val()==null){//验证对应实ID的输入信息是否为空
			valTips(id,$("#"+id).attr("tips"));
			return false;
		}else if($("#"+id).val().length>140){
			valTips(id,"输入内容过长");
			return false;
		}
	}
	return true;
}


function deleteUpload(obj){
	var id=$(obj).attr("id");
	var number=id.substring(6,id.length);
	$("#url"+number).val("");
	$("#img"+ number).attr({
		src:"uploadFiles/uploadImgs/zanwutupian.jpg"
	});
}

function inputClick(obj){
	$(obj).next("input").click();
}

function ajaxFileUpload(obj) {
	//获取欲上传的文件路径  
	var fileId = $(obj).attr("id");
	$.ajaxFileUpload({
		url : 'pc/imgFileUpload', //需要链接到服务器地址
		secureuri : false,
		fileElementId : fileId, //文件选择框的id属性
		dataType : "text", //服务器返回的格式，可以是json
		success : function(data) { //相当于java中try语句块的用法
			data = data.replace(/<[^>].*?>/g, "");//对返回的数据进行转换
			var json = eval("(" + data + ")");//对返回的数据进行转换
			$("#url").val(json.imgUrl);
			$("#heads").attr({
				src : '<%=basePath %>'+json.imgUrl
			});
		}
	});
}

function alertDialog(str){
	$("#rulepopup p").html(str);
	ruleDlg = new dialogBox({
		title : "提示",
		contentHtml : $("#rulepopup").html(),
		popupBoxW : 490,
		closeBtnshow : 0,
		initEvent : function($dom){
		}
	});
	ruleDlg.showDlg();
}

function scroll(id){
	$("html,body").animate({scrollTop:$("#"+id).offset().top},100);
}
</script>
</body>
</html>