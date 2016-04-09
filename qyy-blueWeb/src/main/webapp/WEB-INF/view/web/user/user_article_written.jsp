<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transition al.dtd"><%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../../static/inc_web.jsp" %>
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv = "X-UA-Compatible" content = "IE=edge,chrome=1 " /><meta charset="utf-8"> 
<title>会员互动-个人主页</title>
<link rel="stylesheet" href="static/web/css/common.css" />
<link rel="stylesheet" href="static/web/css/inner.style.css" />
<link rel="stylesheet" href="static/web/css/personal.center.css" />
<link rel="stylesheet" href="static/web/css/member.css"/>
<style type="text/css">
.input{
	border: 1px solid #dedede;
	width:50px;
}
.selectCover{
	background: #979797;
	color: white;
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
	<div class=" content_wrap pb90">
		<div class="content">
		  <div class="whitebg mt20 box-show">
			 <div class="pd20">
			   <div class="form_box type2">
			        <div id="price">
			        <span style="margin-right: 20%" class="fr orange">￥<span class="f20">
			        <input type="text" maxlength="7" name="price" class="input" id="priceValue" tips="请输入价格">
			        </span>起/人</span>
			        </div>
					<div class="form-item select-item inline" style="width:186px;">
						<span class="select-text">请选择分类</span>
						<i class="iicon i-select"></i>
						<select name="" id="travelsType" onchange="showPrice()" tips="请选择文章类型">
							<option value="">请选择</option>
							<c:forEach items="${typeList }" var="type">
								<option value="${type.id }">${type.text }</option>
							</c:forEach>
						</select>
					</div>
					<div class="form-item select-item inline" style="width:186px;">
						<span class="select-text">请选择地区</span>
						<i class="iicon i-select"></i>
						<select name="" id="city" tips="请选择区域">
							<option value="">全部</option>
							<c:forEach items="${cityList }" var="city">
								<option value="${city.id }">${city.name }</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="form_box type2">
					<div class="form-item inline mr10" style="width:600px; margin-right:10px;">
						<input type="hidden" name="travelsId" id="travelsId" value="${travelsId }">
						<input type="text" id="travelsTitle" placeholder="请输入标题（48字）" tips="请输入标题" />
					</div>
				</div>
				<div class="write-travel">
				   <div class="list_edit">
					  <div class="editing clearfix">
						<span class="fold i-person fl"></span>
						<div class="edit_menu fl" style="display:none;">
						  <span class="addword"><i class="i-person"></i>添加文字</span>
						  <span class="addimg"><i class="i-person"></i>添加照片</span>
						  <span class="addtitle"><i class="i-person"></i>添加段落标题</span>
						</div>
					  </div>
					  <!--<div class="Addtitle"><i class="i-person editor"></i><i class="i-person remove"></i></div>-->
				   </div>
				   <div class="tr"><!-- <button class="Btn">发布</button> --><a class="Btn btn" href="javascript:;" onclick="submitTracles()">发布</a></div>
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
<div class="innerdiv pb20">
   <div class="addsection">
     <h3>添加段落标题</h3>
	 <input class="secTxt" placeholder="请输入标题（48字）" type="text"/>
	 <p>例如“行程预算”“关于行程”等等</p>
   </div>
   <div class="oBtn oBtn2 tc">
     <button name="case-ok" class="yes">保存</button>
     <button name="case-no" class="no">取消</button>
   </div>
</div>
</script>
<div id="wordModel" style="display: none;">
<div class="editTxt">
	<p class="ellips">
		<i class="i-person abs alter"></i>
		<span></span>
	</p>
	<div class="editText">
		<div class="tarea" contenteditable="true"></div>
		<div class="oBtn tc">
			<button class="yes">保存</button>
			<button class="no">取消</button>
		</div>
	</div>
</div>
<div class="editing clearfix">
	<span class="fold i-person fl"></span>
	<div class="edit_menu fl" style="display:none;">
		<span class="addword">
			<i class="i-person"></i>
			添加文字
		</span>
		<span class="addimg">
			<i class="i-person"></i>
			添加照片
		</span>
		<span class="addtitle">
			<i class="i-person"></i>
			添加段落标题
		</span>
	</div>
</div>
</div>

<div id="stageModel" style="display: none;">
<div class="Addtitle">
	<span class="white title_text "></span>
	<i class="i-person editor"></i>
	<i class="i-person remove"></i>
</div>
<div class="editing clearfix">
	<span class="fold i-person fl"></span>
	<div class="edit_menu fl" style="display:none;">
		<span class="addword">
			<i class="i-person"></i>
			添加文字
		</span>
		<span class="addimg">
			<i class="i-person"></i>
			添加照片
		</span>
		<span class="addtitle">
			<i class="i-person"></i>
			添加段落标题
		</span>
	</div>
</div>
</div>

<div id="imgModel" style="display: none;">
<div class="imgDiv" >
<img style="width: 200px;height: 200px;z-index: 0;position: relative;" onclick="inputClick(this)" src="uploadFiles/uploadImgs/zanwutupian.jpg">
<input name="img" type="file" style="display: none;" onchange="ajaxFileUpload(this)">
<input type="text" style="display:none;">
<span class="selectCover" onclick="setCvoer(this);">设为封面</span>
<img id="delete1" width="20" height="20" onclick="deleteUpload(this)" src="uploadFiles/uploadImgs/X.png" >
</div>
<div class="editing clearfix">
	<span class="fold i-person fl"></span>
	<div class="edit_menu fl" style="display:none;">
		<span class="addword">
			<i class="i-person"></i>
			添加文字
		</span>
		<span class="addimg">
			<i class="i-person"></i>
			添加照片
		</span>
		<span class="addtitle">
			<i class="i-person"></i>
			添加段落标题
		</span>
	</div>
</div>
</div>
<div id="titlepopup" style="display: none;">
<div class="innerdiv pd20 tc">
	<p style="padding:50px 0; color:#333;">smg</p>
	<button class="Btn" name="case-ok">确认</button>
</div>
</div>
<script type="text/javascript" src="static/web/js/base.js"></script>
<script type="text/javascript" src="static/web/js/index.js"></script>
<script type="text/javascript" src="static/web/js/person.js"></script>
<script type="text/javascript" src="static/js/ajaxfileupload.js"></script>
<script type="text/javascript">
var titleDlg=null;
$(function(){
	selfDefineFormBtn();
	
	$("#travelsType").trigger("change");
	
	titleDlg = new dialogBox({
		title : "提示",
		contentHtml : $("#titlepopup").html(),
		popupBoxW : 490,
		closeBtnshow : 0,
		initEvent : function($dom){
		}
	});

//个人主页添加游记
$(document).on("click",".editing span.fold",function(){
	if($(this).hasClass("unfold")){
	   $(this).removeClass("unfold");
	   $(this).next(".edit_menu").css("display","none");
	}else{
	   $(this).addClass("unfold");	
	   $(this).next(".edit_menu").css("display","block");
	}
});
//添加文字
$(document).on("click",".edit_menu span.addword",function(){
   var t=$("#wordModel").children().clone();
   t.find(".ellips span").addClass("contentValue");
   t.find(".ellips span").attr("_type","word");
   //$(t).appendTo($(".list_edit"));
   //console.info($(this).parents(".editing").next(".editTxt").css("display","none"));
   //if($(this).parents(".editing").next(".editTxt").css("display","none")){
      $(this).parents(".editing").after(t);
      $(this).parents(".editing").find("span.fold").click();
   //}
});
$(document).on("click",".oBtn button.yes",function(){
	$(this).parents(".editText").css("display","none");
    $(this).parents(".editTxt").find('p.ellips').css("display","block");
	var Txt1=$(this).parents(".editText").find(".tarea").text();
	if(Txt1.length<1){
	  $(this).parents(".editTxt").next(".editing").remove();	
	  $(this).parents(".editTxt").remove();	
	}else{
	  $(this).parents(".editTxt").find("p.ellips span.contentValue").html(Txt1);
	}
});
$(document).on("click",".oBtn button.no",function(){
	$(this).parents(".editText").css("display","none");
    $(this).parents(".editTxt").find('p.ellips').css("display","block");
	var Txt2=$(this).parents(".editTxt").find("p.ellips span.contentValue").text();
	$(this).parents(".editText").find(".tarea").html(Txt2);
	if(Txt2.length<1){
	  $(this).parents(".editTxt").next(".editing").remove();
	  $(this).parents(".editTxt").remove();	
	}else{
	  $(this).parents("editTxt").find("p.ellips  span.contentValue").html(Txt2);
	}
});
$(document).on("click",".editTxt i.alter",function(){
	$(this).parent('p.ellips').css("display","none").next(".editText").css("display","block");
	var Txt=$(this).parents(".editTxt").find("p.ellips span.contentValue").text();
	$(this).parents(".editTxt").find(".tarea").html(Txt);
});


//添加段落标题
var ruleDlg = new dialogBox({
	selfClass : "type2",
	title : "",
	contentHtml : $("#rulepopup").html(),
	popupBoxW : 816,
	//closeBtnshow : 0,
	initEvent : function($dom){
	}
});
var state = 0;// 新建
var curOptObj = null; //当前编辑标题对象
var thisTitleObj=null;
$(document).on("click",".edit_menu span.addtitle,.Addtitle i.editor",function(){
	var _self = $(this);
	ruleDlg.showDlg(function(){
		if(_self.hasClass("editor")){ //编辑
			var Text2=_self.parents(".Addtitle").find(".title_text").text();
			$(".addsection input.secTxt").val(Text2);
			state = 1;
			curOptObj = _self.parent(".Addtitle");
		} else { //新建
			$(".addsection input.secTxt").val("");
			state = 0;
		}
	});
	thisTitleObj=$(this);
	$(this).parents(".editing").find("span.fold").click();
});
$(document).on("click",".oBtn2 button.yes",function(){
	if(state){
		var Text2=$(this).parents(".innerdiv").find("input.secTxt").val();
		curOptObj.find(".title_text").text(Text2);
	} else {
		var Text=$(this).parents(".innerdiv").find("input.secTxt").val();
		var r=$("#stageModel").children().clone();
		console.info(r.find(".title_text"));
		r.find(".title_text").addClass("contentValue");
		r.find(".title_text").attr("_type","stage");
		r.find(".title_text").html(Text);
		/* if(Text.length>0){
		  $(".list_edit").append(r);  
		}; */
		thisTitleObj.parents(".editing").after(r);
	};				
});	

$(document).on("click",".oBtn2 button.no",function(){
	if(state){
		var Text2=curOptObj.find(".title_text").text();
		//$(this).parents(".innerdiv").find("input.secTxt").val();
		curOptObj.find(".title_text").text(Text2);
		//console.log(curOptObj);
	}
});

$(document).on("click",".Addtitle i.remove",function(){
	$(this).parents(".Addtitle").next(".editing").remove();
	$(this).parents(".Addtitle").remove();
});

if("${travelsId}"!=""){
	initEdit();
}

});
//初始化方法结束

$(document).on("click",".edit_menu span.addimg",function(){
	var t=$("#imgModel").children().clone();
	t.find("input:eq(1)").addClass("contentValue");
	t.find("input:eq(1)").attr("_type","imgs");
	$(this).parents(".editing").after(t);
	$(this).parents(".editing").find("span.fold").click();
});

function deleteUpload(obj){
	$(obj).parents(".imgDiv").next(".editing").remove();
	$(obj).parents(".imgDiv").remove();
}

function inputClick(obj){
	$(obj).next("input").click();
}

var tempFileIdNumber=1;
function ajaxFileUpload(obj) {
	//获取欲上传的文件路径  
	var obj=$(obj);
	var file = obj.val();
	var tempId="tempImgFileId"+tempFileIdNumber;
	tempFileIdNumber+=1;
	obj.attr("id",tempId);
	var input=obj.next("input");
	var img=obj.prev("img");
	$.ajaxFileUpload({
		url : '<%=basePath %>merchSystem/info/imgFileUpload', //需要链接到服务器地址
		secureuri : false,
		fileElementId : tempId, //文件选择框的id属性
		dataType : 'JSON', //服务器返回的格式，可以是json
		success : function(data) { //相当于java中try语句块的用法
			data = data.replace(/<[^>].*?>/g, "");//对返回的数据进行转换
			var json = eval("(" + data + ")");//对返回的数据进行转换
			input.val(json.imgUrl);
			img.attr({
				src:json.imgUrl
			});
			
		}
	});

}

function checkForm(ids){
	flag="";
	var idArr=ids.split(",");
	for(var i=0;i<idArr.length;i++){
		var id=idArr[i];
		if($("#"+id).val()=="" || $("#"+id).val()==null){//验证对应实ID的输入信息是否为空
			valTips(id,$("#"+id).attr("tips"));
			return false;
		}else if($("#"+id).val().length>20){
			valTips(id,"输入内容过长");
			return false;
		}
	}
	return true;
}

function showPrice(){
	var type=$("#travelsType").val();
	if(type!="3"){
		$("#price").hide();
	}else{
		$("#price").hide();
//		$("#price").show();
	}
}

//设置封面
function setCvoer(obj){
	$(".selectCover").html("设为封面");
	$(".selectCover").removeClass("cover");
	$(obj).html("封面");
	$(obj).addClass("cover");
}


//提交文章
function submitTracles(){
	var tempCover="";
	var flag1=checkForm("travelsType,city,travelsTitle");
	if(flag1){
		var flag2=true;
		//if($("#travelsType").val()=="3"){
		//	flag2=checkForm("priceValue");
		//}
		if(flag1&&flag2){
			var contents=[];
			var types=[];
			for(var i=0;i<$(".contentValue").length;i++){
				var typeItem=$(".contentValue:eq("+i+")").attr("_type");
				types.push(typeItem);
				if(typeItem=="imgs"){
					contents.push($(".contentValue:eq("+i+")").val());
				}else{
					contents.push($(".contentValue:eq("+i+")").html());
				}
			}
			if($(".cover").prev().length==0){
				showAlert("请至少上传至少一张图片并设置封面");
			}else{
				tempCover=$(".cover").prev().val();
				//console.info("contents:"+contents);
				//console.info("types:"+types);
				//console.info("tempCover:"+tempCover);
				var data={};
				data.travelsId=$("#travelsId").val();
				data.travelType=$("#travelsType").val();
				data.atAddr=$("#city").val();
				data.title=$("#travelsTitle").val();
				//if(data.travelType=="3"){
				//	data.price=$("#priceValue").val();
				//}
				data.items=contents;
				data.itemsType=types;
				data.coverImg=tempCover;
				$.post("<%=basePath %>pc/travels/submitTravels",data,function(data){
					if(data.status=="success"){
						showAlert("提交成功");
						$(".popup-case .Btn").one("click",function(data){
							//console.info("跳转？");
							window.location.href="pc/travels/travel";
						});
					}else{
						showAlert("服务器忙，请稍后重试");
					}
				});
			}
		}
	}
}

function showAlert(str){
	$("#titlepopup p").html(str);
	titleDlg = new dialogBox({
		title : "提示",
		contentHtml : $("#titlepopup").html(),
		popupBoxW : 490,
		closeBtnshow : 0,
		initEvent : function($dom){
		}
	});
	titleDlg.showDlg();
}


//编辑初始化
function initEdit(){
	var start=new Date();
	console.info("开始初始化:"+start.getTime());
	$("#travelsType").val("${travelType}");
	$("#city").val("${travels.at_addr}");
	$("#priceValue").val("${travels.price}");
	$("#travelsTitle").val("${travels.title}");
	
	$("#travelsType").trigger("change");
	$("#city").trigger("change");;
	
	var itemList=eval('('+'${itemList}'+')');
	var cover="";
	for(var i=0;i<itemList.length;i++){
		if(itemList[i].item_type=="stage"){
			var r=$("#stageModel").children().clone();
			r.find(".title_text").addClass("contentValue");
			r.find(".title_text").attr("_type","stage");
			r.find(".title_text").html(itemList[i].context);
			$(".list_edit .editing:last").after(r);
		}else if(itemList[i].item_type=="word"){
			var t=$("#wordModel").children().clone();
			t.find(".ellips span").addClass("contentValue");
			t.find(".ellips span").attr("_type","word");
			t.find(".ellips span").html(itemList[i].context);
			t.find(".ellips").show();
			t.find(".editText").hide();
			$(".list_edit .editing:last").after(t);
		}else if(itemList[i].item_type=="imgs"){
			if(itemList[i].is_cover==0){
				cover=itemList[i].context;
			}
			var t=$("#imgModel").children().clone();
			t.find("input:eq(1)").addClass("contentValue");
			t.find("input:eq(1)").attr("_type","imgs");
			t.find("input:eq(1)").val(itemList[i].context);
			t.find("img:eq(0)").attr("src",itemList[i].context);
			$(".list_edit .editing:last").after(t);
		}
	}
	console.info($(".imgDiv img[src='"+cover+"']").nextAll("span"));
	$(".imgDiv img[src='"+cover+"']").nextAll("span").click();
	console.info("初始化完毕:"+new Date().getTime());
	console.info("初始化时间:"+(new Date().getTime()-start.getTime())/1000);
}
</script>
</body>
</html>