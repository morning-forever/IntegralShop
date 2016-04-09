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

.operiation-btn{
	position: relative;
	bottom: 6px;
}

</style>
<body>
<table class="model" style="display: none;">
	<tr>
		<th></th>
		<td colspan="10">
			<select name="city" onchange="getCounty(this,'','')">
				<c:forEach items="${Addrlist }" var="addr">
					<option value="${addr.id }">${addr.name }</option>
				</c:forEach>
			</select>
			<select name="county" onchange="getStore(this,'')">
			</select>
			<select name="store">
			</select>
			<input type="button" value="+" class="btn operiation-btn" onclick="addTel()">
			<input type="button" value="-" class="btn operiation-btn" onclick="deleteTel(this)">
		</td>
	</tr>
</table>
<div class="container-fluid" id="main-container">
	<div id="breadcrumbs">
		<ul class="breadcrumb">
			<li><i class="icon-home"></i> <a href="javascript:;">当前</a><span class="divider"><i class="icon-angle-right"></i></span></li>
			<li class="active">商户信息</li>
		</ul><!--.breadcrumb-->
	</div><!--#breadcrumbs-->
	<div class="row-fluid">
		<!-- <h3 class="header smaller lighter blue">会员管理</h3> -->
		<div class="table-header">
			商户信息
		</div>
		<div style="height: 30px;"></div>
		
		<ul class="nav nav-tabs" id="otherInfoTab">
		    <li class="active" ><a href="#tab_1">车辆基本信息</a></li>
		    <li ><a href="#tab_2">车辆配置信息</a></li>
		    <li ><a href="#tab_3">租车价格</a></li>
		    <li ><a href="#tab_4">上传图片</a></li>
		</ul>
		 <form action="" id="form" method="post" enctype="multipart/form-data">
		 <input type="hidden" id="carId" name="carId" value="${rent.id }">
		 <input type="hidden" id="rentId" name="rentId" value="${rent.rentId }">
		<div class="tab-content">
			<!-- 车辆基本信息 -->
		    <div class="tab-pane active" id="tab_1">
		    	<table class="mytable-detail" >
		    			<tbody>
			    			<tr>
			    				<th style="width: 80px">
	                				车辆品牌：
	                			</th>
	                			<td>
	               			 		<select  id="brandId" name="brandId" onchange="getSys()" tips="请选择车辆品牌">
	               			 		<option value="">请选择</option>
	               			 		<c:forEach items="${brandList }" var="brand">
										<option value="${brand.id }">${brand.brand }</option>
									</c:forEach>
	               			 		</select>
	                			</td>
	                			<th>
	                				车系:
	                			</th>
	                			<td>
	                				<select id="sysId" name="sysId"  tips="请选择车系">
										<option value="">请选择</option>
									</select>
	                			</td>
	                			<th>
	                				年代:
	                			</th>
	                			<td>
	                				<select id="carYear" name="carYear" tips="请选择年代">
	                				</select>
	                			</td>
			    			</tr>
			    			<tr>
			    				<th>
			    					配置：
			    				</th>
			    				<td>
			    					<select id="carConfigure" name="carConfigure">
			    						<option value="标准版">标准版</option>
			    						<option value="精英版">经典版</option>
			    						<option value="标准版">豪华版</option>
			    					</select>
			    				</td>
			    				<th>
			    					车厢:
			    				</th>
			    				<td>
			    					<select id="coach" name="coach">
			    						<option value="4">4</option>
			    						<option value="5">5</option>
			    						<option value="6">6</option>
			    						<option value="7">7</option>
			    						<option value="8">8</option>
			    						<option value="9">9</option>
			    						<option value="10">10</option>
			    						<option value="11">11</option>
			    						<option value="12">12</option>
			    						<option value="13">13</option>
			    						<option value="14">14</option>
			    					</select>
			    				</td>
			    				<th>
			    					数量:
			    				</th>
			    				<td>
			    					<input name="counts" id="counts" value="${rent.counts }">
			    				</td>
			    			</tr>
			    			<tr>
			    				<th>
			    					车辆类型:
			    				</th>
			    				<td colspan="10" id="carTypeList">
			    					
			    				</td>
			    			</tr>
			    			<tr class="storeTr">
			    				<th>车辆所在地</th>
			    				<td colspan="10">
			    					<select name="city" onchange="getCounty(this,'','')">
			    						<c:forEach items="${Addrlist }" var="addr">
				    						<option value="${addr.id }">${addr.name }</option>
			    						</c:forEach>
			    					</select>
			    					<select name="county" onchange="getStore(this,'')">
			    					</select>
			    					<select name="store">
			    					</select>
			    					<input type="button" value="+" class="btn operiation-btn" onclick="addTel()">
			    				</td>
			    			</tr>
			    			<tr>
			    				<th>
			    					是否上架：
			    				</th>
			    				<td>
			    					<div class="span3">
										<label>
											<input id="isShelves" name="isShelves" value="0" class="ace-switch ace-switch-5" type="checkbox" >
											<span class="lbl"></span>
										</label>
									</div>
			    				</td>
			    			</tr>
		    			</tbody>
		    		</table>
		    </div>
		    
		    <!-- 车辆配置信息 -->
		    <div class="tab-pane" id="tab_2">
		    <table>
		    	<tr>
			   		<th>
			   			座位数：
			    	</th>
			    	<td>
			    		<input id="seating" name="seating" >
			   		</td>
			   		<th>
			   			车门数
			   		</th>
			   		<td>
			   			<input id="door" name="door">
			   		</td>
			    </tr>
		    	<tr>
			   		<th>
			   			燃料类型：
			    	</th>
			    	<td>
			    		<input id="fuel" name="fuel" tips="请输入燃料类型">
			   		</td>
			   		<th>
			   			变速箱类型:
			   		</th>
			   		<td>
			   			<input id="gearbox" name="gearbox" tips="请输入变速箱类型">
			   		</td>
			    </tr>
		    	<tr>
			   		<th>
			   			排量：
			    	</th>
			    	<td>
			    		<input id="outputs" name="outputs" tips="请输入排量" value="${rent.outputs }">
			   		</td>
			   		<th>
			   			燃油标号:
			   		</th>
			   		<td>
			   			<input id="fuelGrade" name="fuelGrade" tips="请输入燃油标号" value="${rent.fuel_grade }">
			   		</td>
			    </tr>
		    	<tr>
			   		<th>
			   			驱动方式：
			    	</th>
			    	<td>
			    		<input id="drives" name="drives" tips="请输入驱动方式" value="${rent.drives }">
			   		</td>
			   		<th>
			   			进气方式:
			   		</th>
			   		<td>
			   			<input id="airForm" name="airForm" tips="请输入进气方式" value="${rent.air_form }">
			   		</td>
			    </tr>
		    	<tr>
			   		<th>
			   			天窗有无：
			    	</th>
			    	<td>
			    		<select id="skylight" name="skylight">
			    			<option value="0">有</option>
			    			<option value="1">无</option>
			    		</select>
			   		</td>
			   		<th>
			   			油箱容量:
			   		</th>
			   		<td>
			   			<input id="fuelTankage" name="fuelTankage" tips="请输入邮箱容量"  value="${rent.fuel_tankage }">
			   		</td>
			    </tr>
		    	<tr>
			   		<th>
			   			音箱：
			    	</th>
			    	<td>
			    		<input id="voiceBox" name="voiceBox" tips="请输入音箱" value="${rent.voice_box }">
			   		</td>
			   		<th>
			   			座椅:
			   		</th>
			   		<td>
			   			<input id="chair" name="chair" tips="请输入座椅" value="${rent.chair }">
			   		</td>
			    </tr>
		    	<tr>
			   		<th>
			   			倒车雷达：
			    	</th>
			    	<td>
			    		<select id="radar" name="radar">
			    			<option value="0">有</option>
			    			<option value="1">无</option>
			    		</select>
			   		</td>
			   		<th>
			   			安全气囊:
			   		</th>
			   		<td>
			   			<input id="gasbag" name="gasbag"  tips="请输入安全气囊" value="${rent.gasbag }">
			   		</td>
			    </tr>
		    	<tr>
			   		<th>
			   			DVD/CD：
			    	</th>
			    	<td>
			    		<select id="dvdcd" name="dvdcd">
			    			<option value="DVD">DVD</option>
			    			<option value="CD">CD</option>
			    		</select>
			   		</td>
			   		<th>
			   			GPS导航:
			   		</th>
			   		<td>
			   			<select id="gps" name="gps">
			    			<option value="0">有</option>
			    			<option value="1">无</option>
			    		</select>
			   		</td>
			    </tr>
		    </table>
		    </div>
		    
		    <!-- 日历控件 -->
		    <div class="tab-pane" id="tab_3" >
		    	<input name="defaultPrice" id="defaultPrice" >
		    	<input type="button" class="btn" value="保存" onclick="saveThreePrice()">
				<div id='calendar' style="margin:0px"></div>
		    </div>
		    
		    
		    <!-- 上传图片 -->
		    <div class="tab-pane" id="tab_4" style="min-height: 200px">
		    	
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
<script type="text/javascript" charset="utf-8" src="plugins/ueditor1.4.3/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="plugins/ueditor1.4.3/ueditor.all.min.js"></script>
<script type="text/javascript" src="static/js/jquery.form.js"></script>
<script type="text/javascript" src="static/js/ajaxfileupload.js"></script>
<script type="text/javascript" src="static/js/daterangepicker.min.js"></script>
<script type="text/javascript" src="static/js/bootstrap-timepicker.min.js"></script>
<script type="text/javascript" src="static/js/fuelux.spinner.js"></script>
<script type="text/javascript" src="static/web/js/base.js"></script>
<script type="text/javascript" src="static/js/fullcalendar.min.js"></script>
<!--定义操作列按钮模板-->
<script id="tpl" type="text/x-handlebars-template">
	{{#each func}}
	<a class="btn btn-mini btn-{{this.type}}" href="javascript:;" title="{{this.name}}" target="mainFrame" onclick="{{this.fn}}"><i class="icon-{{this.icon}}"></i></a>
	{{/each}}
</script>
<script type="text/javascript">
var tpl = $("#tpl").html();
var sysId;//系列ID
var priceList='${priceList}';//价格List
var storeList='${storeList}';//价格List
var eventArr;//价格日历控件初始化对象
var typeArr;//初始化类型数组
//预编译模板
var template = Handlebars.compile(tpl);
var calendar;

$(document).ready(function(){
	/*tab页*/
	$('#otherInfoTab a:eq(2)').tab('show');//初始化显示哪个tab

    $('#otherInfoTab a').click(function(e) {
        e.preventDefault();//阻止a链接的跳转行为
        $(this).tab('show');//显示当前选中的链接及关联的content
    });
	
	//$('.mydate-picker').datepicker();
	
	
	
	var urlArr=new Array();
	urlArr[0]="${photoList[0].pic_url}"
	urlArr[1]="${photoList[1].pic_url}"
	urlArr[2]="${photoList[2].pic_url}"
	urlArr[3]="${photoList[3].pic_url}"
	
	//console.info("${photoList}");
	for(var i=0;i<"${photoList.size()}";i++){
		var url=urlArr[i];
		$("#img"+(i+1)).attr("src",url);
		$("#url"+(i+1)).val(url);
		console.info(i+":"+url+",test"+i+":"+$("#url"+(i+1)).val());
	}	
	
	var telStr="${linkMerchTel }";
	var telArr=telStr.split(",");
	$("input[name=linkMerchTel]:eq(0)").val(telArr[0]);
	for(var i=1;i<telArr.length;i++){
		addTel();
		$("input[name=linkMerchTel]:eq("+i+")").val(telArr[i]);
	}
	
	
	//初始化年份选择框
	$("#carYear").append('<option value="">请选择</option>');
	for(var i=2000;i<2031;i++){
		$("#carYear").append('<option value="'+i+'">'+i+'</option>');
	}
	
	//初始化车辆类型复选框
	initCarTypeList();
	
	var seatingValue="${rent.seating}";
	var countsValue="${rent.counts}";
	var doorValue="${rent.door}";
	seatingValue=seatingValue==""?0:parseInt(seatingValue);
	countsValue=countsValue==""?0:parseInt(countsValue);
	doorValue=doorValue==""?0:parseInt(doorValue);
	
	//初始化数字输入框
	$('#seating').ace_spinner({value:seatingValue,min:0,max:100000,step:1,icon_up:'icon-caret-up', icon_down:'icon-caret-down'});
	$('#counts').ace_spinner({value:countsValue,min:0,max:100000,step:1,icon_up:'icon-caret-up', icon_down:'icon-caret-down'});
	$('#door').ace_spinner({value:doorValue,min:0,max:100000,step:1,icon_up:'icon-caret-up', icon_down:'icon-caret-down'});
	$("#tab_2 *").attr("style","margin:0");
	$("#seating").attr("style","margin:0;width:188px");
	$("#door").attr("style","margin:0;width:188px");
	$("#counts").attr("style","margin:0;width:188px");
	
	$("#tab_2 select").attr("style","margin:0;width:210px");
	
	$("select[name=city]").trigger("change");
	
	eventArr=[];
	
	if(priceList!=''){
		priceList=eval('('+priceList+')');
	}else{
		priceList=[];
	}
	
	
	for(var i=0;i<priceList.length;i++){
		var eventItem={};
		eventItem.title=priceList[i].price.toString();
		eventItem.start=new Date().setTime(priceList[i].time);
		eventItem.className="label-success";
		eventArr[i]=eventItem;
	}
	
	initCalendar();
	$('#otherInfoTab a:eq(0)').click();
	
	$("#carYear").val("${rent.car_year}");
	$("#carConfigure").val("${rent.car_configure}");
	$("#fuel").val("${rent.fuel}");
	$("#gearbox").val("${rent.gearbox}");
	$("#skylight").val("${rent.skylight}");
	$("#radar").val("${rent.radar}");
	$("#dvdcd").val("${rent.dvdcd}");
	$("#gps").val("${rent.gps}");
	
	$("#brandId").val("${rent.brand_id}");
	$("#brandId").trigger("change");
	sysId="${rent.sys_id}";//设置好车系ID，在车系加载完毕之后执行
	
	if("${rent.is_shelves}"=="0"){//初始化上架状态
		$("#isShelves").click();
	}
	
	typeArr="${typeIds}".split(",");
	
	if(storeList!=''){
		storeList=eval('('+storeList+')');
	}else{
		storeList=[];
	}
	//console.info(storeList);
	for(var i=0;i<storeList.length;i++){
		//console.info("for:"+i);
		if(i!=0){
			addTel();
		}
		var city=$("select[name=city]:last");
		city.val(storeList[i].cityId);
		getCounty(city,storeList[i].countyId,storeList[i].storeId);
	}
	
});



function getSys(){
	var id=$("#brandId").val();
	$.post("admin/cart/rent/getSysList",{id:id},function(data){
		var list=data.list;
		$("#sysId").html("");
		$("#sysId").append('<option value="">请选择</option>');
		for(var i=0;i<list.length;i++){
			$("#sysId").append('<option value="'+list[i].id+'">'+list[i].sys+'</option>');
		}
		if(sysId!=""){
			$("#sysId").val(sysId);
			sysId="";
		}
	})
}

function initCarTypeList(){
	$.post("admin/cart/rent/getCarTypeList",{},function(data){
		var list=data.list;
		for(var i=0;i<list.length;i++){
			$("#carTypeList").append('<div class="span3" style="width:auto"><label style="width:auto"><input style="width:auto" value="'+list[i].id+'" name="carType" class="ace-switch ace-switch-5" type="checkbox"><span class="lbl" style="width:auto">'+list[i].car_type+'</span></label></div>');
		}
		for(var i=0;i<typeArr.length;i++){
			$("#carTypeList input[value="+typeArr[i]+"]").click();
		}
	});
}

function getCounty(obj,countyId,storeId){
	//console.info("countId:"+countyId);
	//console.info("storeId:"+storeId);
	var id=$(obj).val();
	var county=$(obj).parent().find("select[name=county]");
	$.post("admin/cart/rent/getCounty",{id:id},function(data){
		var list=data.list;
		county.html("");
		for(var i=0;i<list.length;i++){
			county.append('<option value="'+list[i].id+'">'+list[i].name+'</option>');
		}
		county.val(countyId);
		getStore(county,storeId);
	});
}

function getStore(obj,sotreId){
	var id=$(obj).val();
	var store=$(obj).parent().find("select[name=store]");
	$.post("admin/cart/rent/getStore",{id:id},function(data){
		var list=data.list;
		store.html("");
		for(var i=0;i<list.length;i++){
			store.append('<option value="'+list[i].id+'">'+list[i].store+'</option>');
		}
		//console.info(sotreId);
		store.val(sotreId);
	});
}

function doSubmit(){
	var ids="brandId,sysId,carYear,outputs,fuelGrade,drives,airForm,fuelTankage,voiceBox,chair,gasbag,fuel,gearbox";
	if(checkForm(ids)){
		var value=serializeObject($("form"));
		var date=$('#calendar').fullCalendar("clientEvents");
		var prices="";
		var dates="";
		for(var i=0;i<date.length;i++){
			if(i!=0){
				prices+=",";
				dates+=",";
			}
			prices+=date[i].title;
			dates+=date[i]._start.getTime();
		}
		value.prices=prices;
		value.dates=dates;
		if(!('isShelves' in value)){
			value.isShelves=1;
		}
		//console.info(value);
		//console.info(value.isShelves);
		$.post("admin/cart/rent/doSubmit",value,function(data){
			var status=data.status;
			if(status=='success'){
				bootbox.alert("保存成功");
			}else{
				bootbox.alert("服务器忙，请稍后");
			}
		});
	}
}

function addTel(){
	var tr=$(".model tbody").children().clone();
	//console.info($("#city").parents("tr:first"));
	//$("#test").after(tr);
	$("#tab_1 .storeTr").after(tr);
	//$(".telModel:last input").attr("name","linkMerchTel");
	//$(".Model:last").removeClass("Model");
}

function deleteTel(obj){
	$(obj).parents("tr").remove();
}

function saveThreePrice(){
	var price=$("#defaultPrice").val();
	if(isNaN(price)){
		valTips($("#defaultPrice"),"请输入数字");
	}else{
		var date=new Date();
		date.setTime(date.getTime()-date.getTime()%(24*60*60*1000)-8*60*60*1000);
		var currentDate=new Date();
		var o=[];
		for(var i=0;i<93;i++){
			if((date.getMonth()-currentDate.getMonth())<3){
				var itemDate=new Date();
				itemDate.setTime(date.getTime());
				o[i]={	title: price,
						start: itemDate,
						allDay: true,
						className: 'label-success'};
				$('#calendar').fullCalendar('removeEvents' , function(ev){
					/* console.info(i);
					console.info("ev:"+ev._start);
					console.info("itemDate:"+itemDate);
					console.info("result:"+(ev._start.getTime()==itemDate.getTime())); */
					return (ev._start.getTime()==itemDate.getTime());
				});
				$('#calendar').fullCalendar('renderEvent',o[i],true);
				date.setTime(date.getTime()+24*60*60*1000);
			}
		} 
		//console.info(o);
	}
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
	var id=$(obj).attr("id");
	var input="input"+id.substring(3,id.length);
	$("#"+input).click();
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
			console.info(data);
			data = data.replace(/<[^>].*?>/g, "");//对返回的数据进行转换
			var json = eval("(" + data + ")");//对返回的数据进行转换
			//console.info(data);
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


function initCalendar(){
	var date = new Date();
	var d = date.getDate();
	var m = date.getMonth();
	var y = date.getFullYear();
	
	calendar = $('#calendar').fullCalendar({
		height:400,
		buttonText: {
			prev: '<i class="icon-chevron-left"><a href="javascript:;"></a></i>',
			next: '<i class="icon-chevron-right"><a href="javascript:;"></a></i>'
		},
		events:eventArr,
		header: {
			left: 'prev,next today',
			center: 'title',
			right: 'month'
		},
		editable: true,
		droppable: true, // this allows things to be dropped onto the calendar !!!
		drop: function(date, allDay) { // this function is called when something is dropped
		
			// retrieve the dropped element's stored Event Object
			var originalEventObject = $(this).data('eventObject');
			var $extraEventClass = $(this).attr('data-class');
			
			
			// we need to copy it, so that multiple events don't have a reference to the same object
			var copiedEventObject = $.extend({}, originalEventObject);
			
			// assign it the date that was reported
			copiedEventObject.start = date;
			copiedEventObject.allDay = allDay;
			if($extraEventClass) copiedEventObject['className'] = [$extraEventClass];
			
			// render the event on the calendar
			// the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
			$('#calendar').fullCalendar('renderEvent', copiedEventObject, true);
			
			// is the "remove after drop" checkbox checked?
			if ($('#drop-remove').is(':checked')) {
				// if so, remove the element from the "Draggable Events" list
				$(this).remove();
			}
			
		},
		dayClick: function(date, allDay, jsEvent, view) {
			bootbox.prompt("设置价格:", function(title) {
				if (title != null) {
					if(isNaN(title)){
						valTips($(".bootbox input"),"请输入数字");
						return false;
					}else{
						//判断当天是否有价格，如果有，则删除
						//该方法为遍历，查询所有事件事件，如果相同，则删除
						
						calendar.fullCalendar('removeEvents' , function(ev){
							/* console.info("ev:"+ev._id);
							console.info("ev:"+ev._start);
							console.info("itemDate:"+date);
							console.info("result:"+(ev._start.getTime()==date.getTime())); */
							return (ev._start.getTime()==date.getTime());
						});
						calendar.fullCalendar('renderEvent',
							{
								title: title,
								start: date,
								allDay: allDay,
								className: 'label-success'
							},
							true // make the event "stick"
						);
					}
				}
			});
		},
		eventClick: function(calEvent, jsEvent, view) {
			var form = $("<form class='form-inline'><label>修改价格</label></form>");
			form.append("<input autocomplete=off type=text value='" + calEvent.title + "' /> ");
			form.append("<button type='submit' class='btn btn-small btn-success'><i class='icon-ok'></i> 保存</button>");
			var div = bootbox.dialog(form,
				[
				{
					"label" : "<i class='icon-trash'></i> 删除价格",
					"class" : "btn-small btn-danger",
					"callback": function() {
						calendar.fullCalendar('removeEvents' , function(ev){
							return (ev._id == calEvent._id);
						})
					}
				}
				,
				{
					"label" : "<i class='icon-remove'></i> 关闭",
					"class" : "btn-small"
				}
				]
				,
				{
					// prompts need a few extra options
					"onEscape": function(){div.modal("hide");}
				}
			);
			
			form.on('submit', function(){
				calEvent.title = form.find("input[type=text]").val();
				if(isNaN(calEvent.title)){
					valTips($(".bootbox input"),"请输入数字");
				}else{
					calendar.fullCalendar('updateEvent', calEvent);
					div.modal("hide");
				}
				return false;
			});
		
			//console.log(calEvent.id);
			//console.log(jsEvent);
			//console.log(view);
			// change the border color just for fun
			//$(this).css('border-color', 'red');
		},
		monthNames:['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月'],
		monthNamesShort:['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月'],
		dayNames:['星期一', '星期二', '星期三', '星期四', '星期五', '星期六', '星期天'],
		dayNamesShort:['周一', '周二', '周三', '周四', '周五', '周六', '周日'],
		buttonText:{
			prev: '上月', // ‹
			next: '下月', // ›
			prevYear: '«', // «
			nextYear: '»', // »
			today: '今天',
			month: '月',
			week: '周',
			day: '日'
			}
		
	});
}


</script>
</html>
