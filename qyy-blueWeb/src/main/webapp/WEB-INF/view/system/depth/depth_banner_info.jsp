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
<div class="container-fluid" id="main-container">
	<div id="breadcrumbs">
		<ul class="breadcrumb">
			<li><i class="icon-home"></i> <a href="javascript:;">当前</a><span class="divider"><i class="icon-angle-right"></i></span></li>
			<li class="active"></li>
		</ul><!--.breadcrumb-->
	</div><!--#breadcrumbs-->
	<div class="row-fluid">
		<div class="table-header">
			
		</div>
		<div style="height: 30px;"></div>
		
		<form action="" id="form" method="post">
			<input type="hidden" value="${type }" name="type">
            <input type="hidden" value="${map.id }" id="id" name="id">
			<table class="mytable-detail" >
				<tbody>
					<tr>
						<th>
							所属页面
						</th>
						<td colspan="3">
							<select name="from_type" id="from_type">
								<c:forEach items="${fromTypeList }" var="fromTypeItem">
								<option value="${fromTypeItem.fromType }">${fromTypeItem.fromTypeName }</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<th>
							序号
						</th>
						<td>
							<select name="order_number" id="order_number">
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
							</select>
						</td>
					</tr>
					<tr>
						<th></th>
						<td>
							<div style="float: left;">
								<img id="img1" style="width: 400px;height: 200px;z-index: 0;position: relative;" onclick="inputClick(this)" src="uploadFiles/uploadImgs/zanwutupian.jpg">
								<input type="file" name="img" id="input1" style="display: none;" onchange="ajaxFileUpload(this)">
								<input type="text" name="url" id="url1" style="display:none;">
								<img id="delete1" width="20" height="20" onclick="deleteUpload(this)" src="uploadFiles/uploadImgs/X.png" style="z-index: 10;position: relative;right: 20px;bottom: 100px">
							</div>
						</td>
					</tr>
					<tr>
						<th>
							链接栏目
						</th>
						<td colspan="3">
							<select id="from_table" name="from_table">
								<option value="1">主题深度游</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>
						</th>
						<td colspan="3">
							<input type="text" readonly id="from_title" name="from_title" onclick="showSelect(this)" tips="请选择链接文章">
							<input type="hidden" id="from_id" name="from_id" value="">
						</td>
					</tr>
					<tr>
						<th>
							开始时间：
						</th>
						<td>
							<div class="input-prepend">
								<span class="add-on"><i class="icon-calendar"></i></span>
								<input type="text" id="startDate" name="startDate" readonly="readonly" class="span11 mydate-picker" data-date-format="yyyy-mm-dd" tips="请选择开始时间">
							</div>
						</td>
					</tr>
					<tr>
						<th>
							结束时间：
						</th>
						<td>
							<div class="input-prepend">
								<span class="add-on"><i class="icon-calendar"></i></span>
								<input type="text" id="endDate" name="endDate" readonly="readonly" class="span11 mydate-picker" data-date-format="yyyy-mm-dd" tips="请选择结束时间">
							</div>
						</td>
					</tr>
				<tr>
					<th>
						状态：
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
		</form>
	</div>
<div>
	<input class="btn" style="margin-left: 10%" onclick="doSubmit()" type="button" value="提交">
</div>
</div>

<div class="modal fade" id="priceModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
            </div>
            <form action="" id="searchForm">
            <table>
            	<tr>
            		<td>标题</td>
            		<td><input type="text" style="widows: 50px" name="title" id="title"></td>
            		<td>
            			<a title="查询" onclick="doSearch()" class="btn btn-mini btn-success searchBtn" type="1" style="margin-bottom: 5px;">
            			<i class="icon-search"></i>查询</a>
            		</td>
            	</tr>
            </table>
            </form>
			<table id="select_table" class="table table-striped table-bordered table-hover">
				<thead>
						<tr>
							<th>序号</th>
							<th>标题</th>
							<th>操作</th>
						</tr>
					</thead>
				<tbody></tbody> 
			</table>
			<div style = "padding:10px 350px;">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			</div>
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
	

	$('#otherInfoTab a:first').tab('show');//初始化显示哪个tab

	/*tab页点击初始化*/
    $('#otherInfoTab a').click(function(e) {
        e.preventDefault();//阻止a链接的跳转行为
        $(this).tab('show');//显示当前选中的链接及关联的content
    });
	
	$('.mydate-picker').datepicker();
	
	$("#priceModal").modal("hide");
	$("#isShelves").click();
	
	if("${map}"!=""){
		initData();
	}
	
});

/**
 * 选择主题深度游
 */
function doSelect(id,title){
	$("#from_id").val(id);
	$("#from_title").val(title);
	$("#priceModal").modal("hide");
}

//查询
function doSearch(){
	var json = '{"depthName" : "'+ $("#title").val()+'"}';
	$('#select_table').DataTable().search(json).draw();
}

//显示链接栏目弹出框
function showSelect(obj){
	$("#priceModal").modal("show");
	initSelectList();
}

//初始化弹出框
function initSelectList(){
	var url="";
	//var fromTable=$("#from_table").val();
	$('#select_table').DataTable({
		"columns": [
            { "data": null },
            { "data": "name" },
            { "data": null },
            ],
            "columnDefs": [{
            	"targets":0,
            	render:function(data,type,row,d){
            		 return d.settings._iDisplayStart+d.row+1;
            	}
            },{
            	"targets": 2,
            	render: function (data, type, row, d) {
            		var context =
            		{
            			func: [
            			{"name": "选择", "fn": "doSelect(\'" + data.id + "\',\'" + data.name + "\')", "type": "purple", "icon":"plus"}
            			]
            		};
            		var html = template(context);
            		return html;
            	}
            }],
		"oLanguage":{
			"sLengthMenu":""//设置下拉分页大选择，这里设置为空
		},
		"iDisplayLength": 5,
		"bDestroy": true,
		"ajax": {
			url:"admin/depth/recommand/depthList",
			type: "POST"
		}
	});
}

function getTip(type){
	var tip;
	if(type == 1){
		tip = "推荐";
	}else{
		tip = "banner";
	}
	return tip;
}

//提交
function doSubmit(){
	var type = $("[name=type]").val();
	//需要验证的输入栏ID
	var ids="from_type,from_title,startDate,endDate";
	if(checkForm(ids)){
		if($("#startDate").val() > $("#endDate").val()){
			valTips("startDate","开始时间不能大于结束时间");
			return;
		}
		var data=serializeObject($("#form"));
		$.post("admin/depth/recommand/submit",data,function(req){
			if(req.status=="success"){
				bootbox.alert("提交成功",function(){
					window.location.href="admin/depth/recommand/main?tabIndex="+(type-1);	
				})
			}else if(req.status=="exists"){
				bootbox.alert("已有相同位置的"+getTip(type)+"，请确认");
			}else{
				bootbox.alert("提交失败，请重试");
			}
		});
		/* $("#form").ajaxSubmit({
			url:"admin/depth/recommand/submit",
			type:'post',
			success: function (req) {
				if(req.status=="success"){
					bootbox.alert("提交成功",function(){
						window.location.href="admin/depth/recommand/main?tabIndex="+(type-1);	
					})
				}else if(req.status=="exists"){
					bootbox.alert("已有相同位置的"+getTip(type)+"，请确认");
				}else{
					bootbox.alert("提交失败，请重试");
				}
			}
		}); */
	}
}

//验证表单
function checkForm(ids){
	flag="";
	var idArr=ids.split(",");
	for(var i=0;i<idArr.length;i++){
		var id=idArr[i];
		if($("#"+id).val()=="" || $("#"+id).val()==null){//验证对应实ID的输入信息是否为空
			valTips(id,$("#"+id).attr("tips"));
			return false;
		}else if($("#"+id).val().length>100){
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
			data = data.replace(/<[^>].*?>/g, "");//对返回的数据进行转换
			var json = eval("(" + data + ")");//对返回的数据进行转换
			var number=fileId.substring(5,fileId.length);
			$("#url"+number).val(json.imgUrl);
			$("#img"+ number).attr({
				src:json.imgUrl
			});
		}
	});

}

function initData(){
	$("#from_type")	.val("${map.from_type}");
	$("#order_number").val("${map.order_number}");
	$("#img1").attr("src","${map.img_url}");
	$("#url1").val("${map.img_url}");
	$("#from_table").val("${map.banner_link}");
	$("#from_title").val("${map.title}");
	$("#from_id").val("${map.from_id}");
	$("#startDate").val(getTimeTxt(parseInt("${map.start_time.getTime()}"),10));
	$("#endDate").val(getTimeTxt(parseInt("${map.end_time.getTime()}"),10));
	if("${map.is_enable}"=="1"){
		$("#isShelves").click();
	}
}


</script>
</html>