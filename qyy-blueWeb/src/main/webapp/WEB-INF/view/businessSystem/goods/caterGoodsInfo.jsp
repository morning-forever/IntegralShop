<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="${system.basePath }">
<%@ include file="/static/inc.jsp" %>

<link rel="stylesheet" href="static/css/daterangepicker.css" />
<link rel="stylesheet" href="static/css/bootstrap-timepicker.css" />
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
			<li class="active">商品信息</li>
		</ul><!--.breadcrumb-->
	</div><!--#breadcrumbs-->
	<div class="row-fluid">
		<!-- <h3 class="header smaller lighter blue">会员管理</h3> -->
		<div class="table-header">
			商品信息
		</div>
		<div style="height: 30px;"></div>
		
		<ul class="nav nav-tabs" id="otherInfoTab">
		    <li class="active" ><a href="#tab_1">基本信息</a></li>
		    <li ><a href="#tab_2">详细介绍</a></li>
		    <li ><a href="#tab_3">上传图片</a></li>
		    <li ><a href="#tab_4">注意事项</a></li>
		</ul>
		 <form action="" id="form" method="post" enctype="multipart/form-data">
		 <input type="hidden" name="goodsCaterId" value="${goodsCater.id }">
		 <input type="hidden" name="goodsId" value="${goods.id }">
		<div class="tab-content">
			<!-- 基本信息 -->
		    <div class="tab-pane active" id="tab_1">
		    	<table class="mytable-detail" >
		    			<tbody>
			    			<tr>
			    				<th>
	                				商品标题：
	                			</th>
	                			<td>
			    					<input type="text" id="title" name="title" value="${goods.title }" tips="请输入商品标题">
	                			</td>
			    			</tr>
			    			<tr>
			    				<th>
			    					副标题：
			    				</th>
			    				<td>
			    					<input type="text" id="subtitle" name="subtitle" value="${goods.subtitle }" tips="请输入副标题">
			    				</td>
			    			</tr>
			    			<tr>
			    				<th>
			    					套餐：
			    				</th>
			    				<td>
			    					<input type="text" id="meal" name="meal" value="${goodsCater.meal }" tips="请输入副套餐">
			    				</td>
			    			</tr>
			    			<%-- <tr>
			    				<th>
			    					景区所在地：
			    				</th>
			    				<td colspan="3">
			    					<span><select id="province" name="province" onchange="getCitys()" tips="请选择省份">
			    						<c:forEach var="p" items="${provinceList }">
			    							<option value="${p.id }">${p.province }</option>
			    						</c:forEach>
			    					</select> </span>
			    					<span><select id="city" name="city" onchange="getCounty()"  tips="请选择城市"></select></span> 
			    					<span><select id="county" name="atAreaId"  tips="请选择区域"></select></span>
			    				</td>
			    			</tr>
			    			<tr>
			    				<th>
			    					景区具体地址：
			    				</th>
			    				<td>
			    					<input type="text" id="addrDetail" name="addrDetail" value="${goodsScenic.addrDetail }"  tips="请输入具体地址">
			    				</td>
			    			</tr> --%>
			    			<tr>
			    				<th>
			    					餐饮费用：
			    				</th>
			    				<td>
			    					原价：<input type="text" id="originalPrice" name="originalPrice" value="${goodsCater.originalPrice }"  tips="请输入原价">
			    				</td>
			    			</tr>
			    			<tr>
			    				<th>
			    				</th>
			    				<td>
									现价：<input type="text" id="currentPrice" name="currentPrice" value="${goodsCater.currentPrice }"  tips="请输入现价">
			    				</td>
			    			</tr>
			    			<tr>
			    				<th>
			    					是否上架：
			    				</th>
			    				<td>
			    					<div class="controls" id="isShelves">
			    					
										<label>
											<input name="isShelves" type="radio" value="0" checked /><span class="lbl"> 是</span>
										</label>
									
										<label>
											<input name="isShelves" type="radio" value="1" /><span class="lbl"> 否</span>
										</label>
									</div>
			    				</td>
			    			</tr>
			    			
		    			</tbody>
		    		</table>
		    </div>
		    
		    <div class="tab-pane" id="tab_2">
				<textarea id="editor">${goods.detailedInfo }</textarea>
				<input type="hidden" name="detailedInfo" id="detailedInfo">
		    </div>
		    
		    <!-- 上传图片 -->
		    <div class="tab-pane" id="tab_3" style="min-height: 200px">
		    	
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
		    <div class="tab-pane" id="tab_4">
		    <table>
			    <tr>
			   		<th>
			   			温馨提示：
			    	</th>
			    	<td>
			    		<textarea id="reminder" name="reminder" rows="4" cols="75" style="width: auto;"  tips="请输入温馨提示">${goods.reminder }</textarea>
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
<script type="text/javascript" charset="utf-8" src="plugins/ueditor1.4.3/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="plugins/ueditor1.4.3/ueditor.all.min.js"></script>
<script type="text/javascript" src="static/js/jquery.form.js"></script>
<script type="text/javascript" src="static/js/ajaxfileupload.js"></script>
<script type="text/javascript" src="static/js/daterangepicker.min.js"></script>
<script type="text/javascript" src="static/js/bootstrap-timepicker.min.js"></script>
<script type="text/javascript" src="static/js/fuelux.spinner.js"></script>
<!--定义操作列按钮模板-->
<script id="tpl" type="text/x-handlebars-template">
	{{#each func}}
	<a class="btn btn-mini btn-{{this.type}}" href="javascript:;" title="{{this.name}}" target="mainFrame" onclick="{{this.fn}}"><i class="icon-{{this.icon}}"></i></a>
	{{/each}}
</script>
<script type="text/javascript">
var tpl = $("#tpl").html();
var ue;
//预编译模板
var template = Handlebars.compile(tpl);
var urls="${urls}";
var operation="${operation}";
$(document).ready(function(){
	
	//tab分页
	$('#otherInfoTab a:first').tab('show');//初始化显示哪个tab

    $('#otherInfoTab a').click(function(e) {
        e.preventDefault();//阻止a链接的跳转行为
        $(this).tab('show');//显示当前选中的链接及关联的content
    });
	
	$('.mydate-picker').datepicker();
	
	var table = $("#table_report").DataTable();
	
	//$("#province").val(provinceId);
	//getCitys();
	
	
	$('#timeStart').timepicker({//初始化时间选择插件
		minuteStep: 1,
		showSeconds: true,
		showMeridian: false
	});
	$('#timeEnd').timepicker({//初始化时间选择插件
		minuteStep: 1,
		showSeconds: true,
		showMeridian: false
	});
	
	ue = UE.getEditor('editor', {//初始化编辑器
		toolbars : [ [ "bold", "italic", "underline", "|", "fontfamily", "diyh3", "blockquote", "insertunorderedlist", "insertorderedlist", "|", "insertimage", "|", "removeformat" ] ],
		initialFrameWidth:820,
		initialFrameHeight:250,
		autoHeightEnabled:false
	});
	
	var currentPrice=0;
	var originalPrice=0;
	
		
	if(urls!=""){
		urls=urls.substring(0,urls.length-1);
		console.info(urls);
		var urlArr=urls.split(",");
		console.info(urlArr.length);
		for(var i=0;i<urlArr.length;i++){
			var url=urlArr[i];
			$("#img"+(i+1)).attr("src",url);
			$("#url"+(i+1)).val(url);
		}
	}
	$("#isShelves input[value=${goods.isShelves}]").attr("checked","checked");
	currentPrice= isNaN(parseInt("${goodsCater.currentPrice }"))?0:parseInt("${goodsCater.currentPrice }");
	originalPrice=isNaN(parseInt("${goodsCater.originalPrice }"))?0:parseInt("${goodsCater.originalPrice }");
	
	
	//限制金额输入部分只允许输入数字，并且调整位置平行
	$('#currentPrice').ace_spinner({value:currentPrice,min:0,max:100000,step:10,icon_up:'icon-caret-up', icon_down:'icon-caret-down'});
	$('#originalPrice').ace_spinner({value:originalPrice,min:0,max:100000,step:10,icon_up:'icon-caret-up', icon_down:'icon-caret-down'});
	$("#currentPrice").attr("style","margin:0");
	$("#originalPrice").attr("style","margin:0");
	
});




function doSubmit(){
	//需要验证的输入栏ID
	var ids="title,subtitle,meal,reminder";
	$("#detailedInfo").val(ue.getContent());
	console.info($("#detailedInfo").val());
	if(checkForm(ids)){
		$(" input[name=img]").attr("disabled","true");
		$("#form").ajaxSubmit({
			url:"merchSystem/goods/submitCaterProduct",
			type:'post',
			success: function (req) {
				console.info(req.status);
				if(req.status=="success"){
					bootbox.alert("提交成功",function(){
						window.location.href="merchSystem/goods/page";	
					})
				}else{
					bootbox.alert("提交失败，请重试");
				}
			}
	    });
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


</script>
</html>
