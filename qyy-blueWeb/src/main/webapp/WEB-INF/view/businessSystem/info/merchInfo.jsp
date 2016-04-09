<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="${system.basePath }">
<%@ include file="/static/inc.jsp" %>

</head>
<style type="text/css">
form label{
	width: 220px;
}
#myform2 th{
	padding-left: 0px;
}
#myform5 th{
	padding-left: 0px;
}
#myform6 th{
	padding-left: 0px;
}

</style>
<body>
<table id="hotelLocationModel" style="display: none;">
<tr class="hotelTr">
	<th>
		酒店所在地：
	</th>
	<td>
		<span>
			<select class="province" onchange="getHotelCitys(this)" tips="请选择省份">
				<c:forEach var="p" items="${provinceList }">
					<option value="${p.id }">${p.name }</option>
				</c:forEach>
			</select>
		</span>
	</td>
	<td>
		<span>
			<select class="city" onchange="getParentLocation(this)" tips="请选择城市"></select>
		</span>
	</td>
	<td>
		<span>
			<select class="ploc" onchange="getLocation(this)" tips="请选择区域"></select>
		</span>
	</td>
	<td>
		<span>
			<select name="hotelLocation" class="loc" tips="请选择区域"></select>
		</span>
	</td>
	<td>
		<a class="btn btn-small" onclick="addHotelLocation()" style="position: relative; bottom: 5px">
			<i class="icon-plus"></i>
		</a>
		<a class="btn btn-small" onclick="removeHotelLocation(this)" style="position: relative; bottom: 5px">
			<i class="icon-minus"></i>
		</a>
	</td>
</tr>
</table>
<table style="display: none;">
 	<tr class="telModel">
		<th>
		</th>
		<td>
		<input type="text" id="" name="" value=""  tips="请输入商户联系电话">
		<a class="btn btn-small" onclick="addTel()" style="position: relative; bottom: 5px"><i class="icon-plus"></i></a>
		<a class="btn btn-small" onclick="deleteTel(this)" style="position: relative; bottom: 5px"><i class="icon-minus"></i></a>
		</td>
	</tr>
</table>
<div class="container-fluid" id="main-container">
	<div id="breadcrumbs">
		<ul class="breadcrumb">
			<li><i class="icon-home"></i> <a href="javascript:;">当前</a><span class="divider"><i class="icon-angle-right"></i></span></li>
			<li class="active"></li>
		</ul><!--.breadcrumb-->
	</div><!--#breadcrumbs-->
	<div class="row-fluid">
		<!-- <h3 class="header smaller lighter blue">会员管理</h3> -->
		<div class="table-header">
			
		</div>
		<div style="height: 30px;"></div>
		
		<ul class="nav nav-tabs" id="otherInfoTab">
		    <li class="active" ><a href="#tab_1">基本信息</a></li>
		    <li ><a href="#tab_2">上传图片</a></li>
		    <li ><a href="#tab_3">联系方式</a></li>
		</ul>
		 <form action="" id="form" method="post" enctype="multipart/form-data">
		<div class="tab-content">
			<!-- 基本信息 -->
		    <div class="tab-pane active" id="tab_1">
		    	<table class="mytable-detail" >
		    			<tbody>
			    			<tr>
			    				<th>
	                				商户Logo：
	                			</th>
	                			<td>
	               			 		<img alt="" width="100" height="100" src="https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=4206008922,4033801172&fm=116&gp=0.jpg">
	                			</td>
			    			</tr>
			    			<tr>
			    				<th>
			    					商户名称：
			    				</th>
			    				<td>
			    					<input type="text" id="username" name="username" value="${username }" tips="请输入商户名称">
			    				</td>
			    			</tr>
			    			<tr id="merchSelect">
			    				<th>
			    					所在地：
			    				</th>
			    				<td>
			    					<span><select id="province" class="province" name="province" onchange="getCitys('merchSelect')" tips="请选择省份">
			    						<c:forEach var="p" items="${provinceList }">
			    							<option value="${p.id }">${p.province }</option>
			    						</c:forEach>
			    					</select> </span>
			    				</td>
			    				<td>
			    					<span><select id="city"  class="city" name="city" onchange="getCounty('merchSelect')"  tips="请选择城市"></select></span> 
			    				</td>
			    				<td>
			    					<span><select id="county"  class="county" name="atAddr"  tips="请选择区域"></select></span>
			    				</td>
			    			</tr>
			    			<tr class="hotelTr">
			    				<th>
			    					酒店所在地：
			    				</th>
			    				<td>
			    					<span><select class="province" onchange="getHotelCitys(this)" tips="请选择省份">
			    						<c:forEach var="p" items="${provinceList }">
			    							<option value="${p.id }">${p.name }</option>
			    						</c:forEach>
			    					</select> </span>
			    				</td>
			    				<td>
			    					<span><select  class="city" onchange="getParentLocation(this)"  tips="请选择城市"></select></span> 
			    				</td>
			    				<td>
			    					<span><select  class="ploc" onchange="getLocation(this)"  tips="请选择区域"></select></span>
			    				</td>
			    				<td>
			    					<span><select name="hotelLocation"  class="loc"  tips="请选择区域"></select></span>
			    				</td>
			    				<td>
			    					<a class="btn btn-small" onclick="addHotelLocation()" style="position: relative; bottom: 5px"><i class="icon-plus"></i></a>
			    				</td>
			    			</tr>
			    			<tr>
			    				<th>
			    					具体地址：
			    				</th>
			    				<td>
			    					<input type="text" id="addrDetail" name="addrDetail" value="${addrDetail }"  tips="请输入具体地址">
			    				</td>
			    			</tr>
			    			<tr model="2">
			    				<th>
			    					品牌：
			    				</th>
			    				<td>
			    					<select name="brand">
			    						<c:forEach items="${merchBrandList }" var="merchBrand">
			    							<option value="${merchBrand.id }">${merchBrand.name }</option>
			    						</c:forEach>
			    					</select>
			    				</td>
			    			</tr>
			    			<tr model="2">
			    				<th>
			    					星级：
			    				</th>
			    				<td>
			    					<select name="starLevel">
			    						<c:forEach items="${hotelStarList }" var="hotelStar">
			    							<option value="${hotelStar.starKey }">${hotelStar.starDetail }</option>
			    						</c:forEach>
			    					</select>
			    				</td>
			    			</tr>
			    			<tr model="2">
			    				<th>
			    					主题：
			    				</th>
			    				<td>
			    					<select name="theme">
			    						<c:forEach items="${merchThemeList }" var="merchTheme">
			    							<option value="${merchTheme.id }">${merchTheme.name }</option>
			    						</c:forEach>
			    					</select>
			    				</td>
			    			</tr>
			    			<tr model="3">
			    				<th>
			    					餐饮分类：
			    				</th>
			    				<td>
			    					<select name="serviceType">
			    						<c:forEach items="${merchRestaurantList }" var="merchRestaurant">
			    							<option value="${merchRestaurant.id }">${merchRestaurant.name }</option>
			    						</c:forEach>
			    					</select>
			    				</td>
			    			</tr>
			    			<tr model="4">
			    				<th>
			    					装备分类：
			    				</th>
			    				<td>
			    					<select name="serviceType">
			    						<c:forEach items="${webSimpleEquipList }" var="webSimpleEquip">
			    							<option value="${webSimpleEquip.id }">${webSimpleEquip.queip }</option>
			    						</c:forEach>
			    					</select>
			    				</td>
			    			</tr>
			    			<tr model="2">
			    				<th>
			    					设施：
			    				</th>
			    				<td colspan="3">
			    					<label>
				    					<input value="wifi" name="facilities" class="ace-switch ace-switch-7" type="checkbox">
				    					<span class="lbl">wifi</span>
			    					</label>
			    					<label>
				    					<input value="吹风机" name="facilities" class="ace-switch ace-switch-7" type="checkbox">
				    					<span class="lbl">吹风机</span>
			    					</label>
			    					<label>
				    					<input value="泊车" name="facilities" class="ace-switch ace-switch-7" type="checkbox">
				    					<span class="lbl">泊车</span>
			    					</label>
			    					
			    				</td>
			    			</tr>
			    			<tr>
			    				<th>
			    					商户介绍：
			    				</th>
			    				<td colspan="3">
			    					
			    					<textarea id="summary" name="summary" rows="4" cols="75" style="width: auto;"  tips="请输入商户介绍">${summary }</textarea>
			    				</td>
			    			</tr>
			    			
		    			</tbody>
		    		</table>
		    </div>
		    <!-- 上传图片 -->
		    <div class="tab-pane" id="tab_2" style="min-height: 200px">
		    	
		    	<!-- 图片1 -->
		    	<div style="float: left;">
		    	<img id="img1" style="width: 200px;height: 200px;z-index: 0;position: relative;" onclick="inputClick(this)" src="uploadFiles/uploadImgs/zanwutupian.jpg">
		    	<input type="file" name="img" id="input1" style="display: none;" onchange="ajaxFileUpload(this)">
		    	<input type="text" name="url" id="url1" style="display:none;">
		    	<img id="delete1" width="20" height="20" onclick="deleteUpload(this)" src="uploadFiles/uploadImgs/X.png" style="z-index: 10;position: relative;right: 20px;bottom: 100px">
		    	</div>
		    	<!-- 图片2 -->
		    	<div  style="float: left;">
		    	<img id="img2" style="width: 200px;height: 200px;z-index: 0;position: relative;" onclick="inputClick(this)" src="uploadFiles/uploadImgs/zanwutupian.jpg">
		    	<input type="file" name="img" id="input2" style="display: none;" onchange="ajaxFileUpload(this)">
		    	<input type="text" name="url" id="url2" style="display:none;">
		    	<img id="delete2" width="20" height="20" onclick="deleteUpload(this)" src="uploadFiles/uploadImgs/X.png" style="z-index: 10;position: relative;right: 20px;bottom: 100px">
		    	</div>
		    	<!-- 图片3 -->
		    	<div  style="float: left;">
		    	<img id="img3"  style="width: 200px;height: 200px;z-index: 0;position: relative;" onclick="inputClick(this)" src="uploadFiles/uploadImgs/zanwutupian.jpg">
		    	<input type="file" name="img" id="input3" style="display: none;" onchange="ajaxFileUpload(this)">
		    	<input type="text" name="url" id="url3" style="display:none;">
		    	<img id="delete3" width="20" height="20" onclick="deleteUpload(this)" src="uploadFiles/uploadImgs/X.png" style="z-index: 10;position: relative;right: 20px;bottom: 100px">
		    	</div>
		    	<!-- 图片4 -->
		    	<div  style="float: left;">
		    	<img id="img4" style="width: 200px;height: 200px;z-index: 0;position: relative;" onclick="inputClick(this)" src="uploadFiles/uploadImgs/zanwutupian.jpg">
		    	<input type="file" name="img" id="input4" style="display: none;" onchange="ajaxFileUpload(this)">
		    	<input type="text" name="url" id="url4" style="display:none;">
		    	<img id="delete4" width="20" height="20" onclick="deleteUpload(this)" src="uploadFiles/uploadImgs/X.png" style="z-index: 10;position: relative;right: 20px;bottom: 100px">
		    	</div>
		    	<!-- 图片5 -->
		    	<div  style="float: left;">
		    	<img id="img5" style="width: 200px;height: 200px;z-index: 0;position: relative;" onclick="inputClick(this)" src="uploadFiles/uploadImgs/zanwutupian.jpg">
		    	<input type="file" name="img" id="input5" style="display: none;" onchange="ajaxFileUpload(this)">
		    	<input type="text" name="url" id="url5" style="display:none;">
		    	<img id="delete5" width="20" height="20" onclick="deleteUpload(this)" src="uploadFiles/uploadImgs/X.png" style="z-index: 10;position: relative;right: 20px;bottom: 100px">
		    	</div>
		    </div>
		    <!-- 联系方式 -->
		    <div class="tab-pane" id="tab_3">
		    <table>
		    	<tr>
			   		<th>
			   			联系人：
			    	</th>
			    	<td>
			    		<input type="text" id="linkName" name="linkName" value="${linkName }"  tips="请输入商户联系人">
			   		</td>
			    </tr>
			    <tr>
			   		<th>
			   			联系人手机号：
			    	</th>
			    	<td>
			    		<input type="text" id="linkPhone" name="linkPhone" value="${linkPhone }"  tips="请输入商户联系人手机号">
			   		</td>
			    </tr>
			    <tr>
			   		<th>
			   			联系人邮箱：
			    	</th>
			    	<td>
			    		<input type="text" id="linkEmail" name="linkEmail" value="${linkEmail }"  tips="请输入商户联系人邮箱">
			   		</td>
			    </tr>
			    <tr>
			   		<th>
			   			商户联系电话：
			    	</th>
			    	<td>
			    		<input type="text" id="linkMerchTel" name="linkMerchTel" value=""  tips="请输入商户联系电话">
			    		<a class="btn btn-small" onclick="addTel()" style="position: relative; bottom: 5px"><i class="icon-plus"></i></a>
			   		</td>
			    </tr>
		    </table>
		    </div>
	    </div>
	    </form>
	    <div>
	    	<input class="btn" style="margin-left: 10%" onclick="doSubmit()" type="button" value="提交">
	    </div>
	</div>
	
</div>



<%@ include file="/static/foot.jsp" %>
</body>
<script type="text/javascript" src="static/js/jquery.form.js"></script>
<script type="text/javascript" src="static/js/ajaxfileupload.js"></script>
<script type="text/javascript" src="static/web/js/base.js"></script>
<!--定义操作列按钮模板-->
<script id="tpl" type="text/x-handlebars-template">
	{{#each func}}
	<a class="btn btn-mini btn-{{this.type}}" href="javascript:;" title="{{this.name}}" target="mainFrame" onclick="{{this.fn}}"><i class="icon-{{this.icon}}"></i></a>
	{{/each}}
</script>
<script type="text/javascript">
var tpl = $("#tpl").html();
//预编译模板
var template = Handlebars.compile(tpl);
var facilities="${facilities}";
//var countyId="${city.id}";
//var cityId="${city.parentId}";

$(document).ready(function(){
	
	$.ajaxSetup({
		async: false//ajax设置为同步，
	});
	
	$('.mydate-picker').datepicker();
	
	var table = $("#table_report").DataTable();
	
	var urlArr=new Array();
	urlArr[0]="${photoList[0].pic_url}"
	urlArr[1]="${photoList[1].pic_url}"
	urlArr[2]="${photoList[2].pic_url}"
	urlArr[3]="${photoList[3].pic_url}"
	urlArr[4]="${photoList[4].pic_url}"
	
	//console.info("${photoList}");
	//初始化图片
	for(var i=0;i<"${photoList.size()}";i++){
		var url=urlArr[i];
		$("#img"+(i+1)).attr("src",url);
		$("#url"+(i+1)).val(url);
		//console.info(i+":"+url+",test"+i+":"+$("#url"+(i+1)).val());
	}	
	
	//初始化商户联系人电话
	var telStr="${linkMerchTel }";
	var telArr=telStr.split(",");
	$("input[name=linkMerchTel]:eq(0)").val(telArr[0]);
	for(var i=1;i<telArr.length;i++){
		addTel();
		$("input[name=linkMerchTel]:eq("+i+")").val(telArr[i]);
	}
	
	//根据商户类型，初始化信息栏
	var trArr=$("tr");
	var merchType=${merchType};
	for(var i=0;i<$("tr").length;i++){
		if(typeof($("tr:eq("+i+")").attr("model"))!='undefined'){
			if($("tr:eq("+i+")").attr("model")!=merchType){
				$("tr:eq("+i+")").hide();
				$("tr:eq("+i+") input[type!=checkbox]").attr("disabled","true");
				$("tr:eq("+i+") select").attr("disabled","true");
				if(merchType==3){
					$("input[value=吹风机]").parents("tr").show();
					$("input[value=吹风机]").parent().hide();
				}
			}
		}
	}
	
	$("select[name=brand]").val("${brand}");
	$("select[name=starLevel]").val("${starLevel}");
	$("select[name=theme]").val("${theme}");
	$("select[name=serviceType]").val("${serviceType}");
	
	var facilitiesArr=facilities.split(",");
	//console.info(facilitiesArr);
	for(var i=0;i<facilitiesArr.length;i++){
		$("input[value="+facilitiesArr[i]+"]").attr("checked","checked");
	}
	
	//console.info($("#breadcrumbs .active"));
	$("#breadcrumbs .active").html("${merchTypeName}信息");
	$(".table-header").html("${merchTypeName}信息");
	
	if(merchType!=2){
		$(".hotelTr").hide();
		$("#province").val("${province.parentId}");
		getCitys('merchSelect',"${city.parentId}","${city.id}");
	}else{
		var hotelLocList=eval('('+'${hotelLocList}'+')');
		$("#merchSelect").hide();
		for(var i=0;i<hotelLocList.length;i++){
			var provinceId=hotelLocList[i].provinceId;
			var cityId=hotelLocList[i].cityId;
			var typeId=hotelLocList[i].typeId;
			var locationId=hotelLocList[i].locationId;
			if(i!=0){
				addHotelLocation();
			}
			$(".hotelTr:last .province").val(provinceId);
			getHotelCitys($(".hotelTr:last .province"),cityId,typeId,locationId);
		}
	}
	
});


/*tab页*/
$(function() {
    $('#otherInfoTab a:first').tab('show');//初始化显示哪个tab

    $('#otherInfoTab a').click(function(e) {
        e.preventDefault();//阻止a链接的跳转行为
        $(this).tab('show');//显示当前选中的链接及关联的content
    });
})


function doSubmit(){
	//需要验证的输入栏ID
	var ids="username,addrDetail,summary,linkName,linkPhone,linkEmail,linkMerchTel";
	//console.info(serializeObject($("#form")));
	//return;
	if(checkForm(ids)){
		$(" input[name=img]").attr("disabled","true");
		$("#form").ajaxSubmit({
			url:"merchSystem/info/saveMerch",
			type:'post',
			success: function (req) {
				console.info(req.status);
				if(req.status="success"){
					bootbox.alert("提交成功",function(){
						window.location.reload();	
					})
				}else{
					bootbox.alert("提交失败，请重试");
				}
			}
	    });
	}
}

function addTel(){
	var tr=$(".telModel").clone();
	$("#tab_3 table").append(tr);
	$(".telModel:last input").attr("name","linkMerchTel");
	$(".telModel:last").removeClass("telModel");
}

function deleteTel(obj){
	$(obj).parents("tr").remove();
}

function getCitys(pid){
	getCitys(pid,"","");
}

function getCitys(pid,cityId,countyId){
	var provinceId=$("#"+pid+" .province").val();
	$.post("merchSystem/info/getCitys",{id:provinceId},function(data){
		var list=data.citysList;
		//console.info(list);
		$("#"+pid+" .city").html("");
		for(var i=0;i<list.length;i++){
			//select中添加对应的城市
			var city=document.createElement("option");
			city.value=list[i].id;
			city.innerHTML=list[i].name;
			$("#"+pid+" .city").append(city);			
		}
		if(cityId!=""){
			$("#"+pid+" .city").val(cityId);
			cityId="";
		}
		getCounty(pid,countyId);
	});
}

function getCounty(pid){
	getCounty(pid,"");
}

function getCounty(pid,countyId){
	var cityId=$("#"+pid+" .city").val();
	$.post("merchSystem/info/getCitys",{id:cityId},function(data){
		var list=data.citysList;
		$("#"+pid+" .county").html("");
		for(var i=0;i<list.length;i++){
			//select中添加对应的城市
			var county=document.createElement("option");
			county.value=list[i].id;
			county.innerHTML=list[i].name;
			$("#"+pid+" .county").append(county);			
		}
		if(countyId!=""){
			$("#"+pid+" .county").val(countyId);
			countyId="";
		}
	});
}

function checkForm(ids){
	flag="";
	var idArr=ids.split(",");
	//console.info(idArr);
	for(var i=0;i<idArr.length;i++){
		var id=idArr[i];
		if($("#"+id).val()=="" || $("#"+id).val()==null){//验证对应实ID的输入信息是否为空
			var tabId=$("#"+id).parents(".tab-pane").attr("id");
			$("#otherInfoTab a[href=#"+tabId+"]").tab("show");//确定当前的tab
			valTips(id,$("#"+id).attr("tips"));
			return false;
		}else if($("#"+id).val().length>20){
			var tabId=$("#"+id).parents(".tab-pane").attr("id");
			$("#otherInfoTab a[href=#"+tabId+"]").tab("show");//确定当前的tab
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
	/* var id=$(obj).attr("id");
	var input="input"+id.substring(3,id.length);
	$("#"+input).click(); */
	$(obj).next("input").click();
}

function ajaxFileUpload(obj) {
	//获取欲上传的文件路径  
	var file = $(obj).val();
	/* var rs = checkPictureType(file);
	if (rs < 0) {
		$(obj).val("");
		$.messager.alert("提示", "您选择的上传文件不是有效的图片文件！");
		return;
	} */
	
	var fileId=$(obj).attr("id");
	$.ajaxFileUpload({
		url : 'merchSystem/info/imgFileUpload', //需要链接到服务器地址
		secureuri : false,
		fileElementId : fileId, //文件选择框的id属性
		dataType : 'JSON', //服务器返回的格式，可以是json
		success : function(data) { //相当于java中try语句块的用法
			//alert(data);
			data = data.replace(/<[^>].*?>/g, "");//对返回的数据进行转换
			//alert(data);
			var json = eval("(" + data + ")");//对返回的数据进行转换
			//data.imgUrl
			//console.info(json);
			//alert(json.imgUrl);
			var number=fileId.substring(5,fileId.length);
			//alert(number);
			$("#url"+number).val(json.imgUrl);
			$("#img"+ number).attr({
				src:json.imgUrl
			});
			//bootbox.alert("上传成功");
		}
	});

}

//2015年10月8日 添加酒店地址标签模式

//酒店地址选择-城市
function getHotelCitys(obj){
	getHotelCitys(obj,null,null,null);
}
function getHotelCitys(obj,cityId,typeId,locationId){
	var provinceId=$(obj).val();
	var tr=$(obj).parents("tr");
	$.post("merchSystem/info/getHotelCitys",{id:provinceId},function(data){
		var list=data.citysList;
		var selectObj=tr.find(".city");
		selectObj.html("");
		for(var i=0;i<list.length;i++){
			//select中添加对应的城市
			var city=document.createElement("option");
			city.value=list[i].id;
			city.innerHTML=list[i].name;
			selectObj.append(city);			
		}
		selectObj.val(cityId);
		getParentLocation(selectObj,typeId,locationId);
	});
}

//酒店地址选择-一级分类
function getParentLocation(obj){
	getParentLocation(obj,null,null);
}
function getParentLocation(obj,typeId,locationId){
	var cityId=$(obj).val();
	var tr=$(obj).parents("tr");
	$.post("merchSystem/info/getlocation",{cityId:cityId,parentId:0},function(data){
		var list=data.citysList;
		var selectObj=tr.find(".ploc");
		selectObj.html("");
		for(var i=0;i<list.length;i++){
			var city=document.createElement("option");
			city.value=list[i].id;
			city.innerHTML=list[i].loc;
			selectObj.append(city);			
		}
		selectObj.val(typeId);
		getLocation(selectObj,locationId);
	});
}

//酒店地址选择-具体地址
function getLocation(obj){
	getLocation(obj,null);
}
function getLocation(obj,locationId){
	var parentId=$(obj).val();
	var tr=$(obj).parents("tr");
	$.post("merchSystem/info/getlocation",{parentId:parentId},function(data){
		var list=data.citysList;
		var selectObj=tr.find(".loc");
		selectObj.html("");
		for(var i=0;i<list.length;i++){
			var city=document.createElement("option");
			city.value=list[i].id;
			city.innerHTML=list[i].loc;
			selectObj.append(city);			
		}
		selectObj.val(locationId);
	});
}


function addHotelLocation(){
	var model=$("#hotelLocationModel tbody").children().clone();
	$(".hotelTr:last").after(model);
	getHotelCitys(model.find(".province"));
}

function removeHotelLocation(obj){
	$(obj).parents("tr").remove();
}
</script>
</html>
