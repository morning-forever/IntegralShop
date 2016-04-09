<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<base href="${system.basePath }">
	<%@ include file="/static/inc.jsp" %>

</head>
<link rel="stylesheet" href="static/web/css/member.css"/>
<style type="text/css">
form label {
	width: 220px;
}

#myform2 th {
	padding-left: 0px;
}

#myform5 th {
	padding-left: 0px;
}

#myform6 th {
	padding-left: 0px;
}
.adminDeleteI{
	background: url('/qyy-blueWeb/static/web/images/sprites.png') -310px -62px no-repeat;
}
</style>
<body>
<div id="areaModel" style="display: none">
 <span class="adress"><span class="areaName">贵阳市</span><i class="adminDeleteI"></i></span>
</div>
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
			<table class="mytable-detail" >
				<tbody>
					<tr><th colspan="5">开通达人</th></tr>
					<tr>
						<th>开通账号：
						</th>
						<td colspan="3">
							<input type="text" readonly id="user" onclick="showSelect(this)" tips="请选择用户">
							<input type="hidden" id="userId" name="userId" >
						</td>
					</tr>
					<tr>
						<th>真实照片:</th>
						<td>
							<div style="float: left;">
								<img id="img1" style="width: 100px;height: 100px;z-index: 0;position: relative;" onclick="inputClick(this)" src="uploadFiles/uploadImgs/zanwutupian.jpg">
								<input type="file" name="img" id="input1" style="display: none;" onchange="ajaxFileUpload(this)">
								<input tips="请上传真实照片" type="text" name="realHeadImg" id="url1" style="display:none;">
							</div>
						</td>
					</tr>
					<tr>
						<th>真实姓名:</th>
						<td><input name="realName" id="realName" tips="请输入真实姓名"></td>
					</tr>
					<tr>
						<th>现居住地:</th>
						<td><input name="nowlive" id="nowlive" tips="请输入现居住地"></td>
					</tr>
					<tr>
						<th>精通地区:</th>
						<td><select id="areaSelect">
							<option value="">全部</option>
							<c:forEach items="${areaList }" var="area">
								<option value="${area.id }">${area.name }</option>
							</c:forEach>
						</select><a href="javascript:;" onclick="addArea()">添加</a></td>
					</tr>
					<tr>
						<td></td>
						<td colspan="5">
							<div class="inline mt10 areaList" >
							</div>
						</td>
					</tr>
					<tr>
						<th>职业:</th>
						<td><input name="occupation" id="occupation" tips="请输入职业"></td>
					</tr>
					<tr>
						<th>职业:</th>
						<td><textarea id="summary" name="summary"  tips="请填写个人简介" style="width: 300px;height: 150px" class="grey9" placeholder="您的个人介绍将体现到个人主页中">${map.summary }</textarea></td>
					</tr>
					<tr>
						<th>手机:</th>
						<td><input name="phone" id="phone" tips="请输入手机号"></td>
					</tr>
					<tr>
						<th>邮箱:</th>
						<td><input name="email" id="email" tips="请输入邮箱"></td>
					</tr>
					<tr>
						<th>QQ:</th>
						<td><input name="qq" id="qq" tips="请输入QQ"></td>
					</tr>
					<tr>
						<th>微信号:</th>
						<td><input name="weChat" id="weChat"></td>
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
            		<td>昵称:</td>
            		<td><input type="text" style="widows: 50px" name="name" id="name"></td>
            		<td>
            			<a title="查询" onclick="doSearch()" class="btn btn-mini btn-success searchBtn" type="1"><i class="icon-search"></i>查询</a>
            		</td>
            	</tr>
            </table>
            </form>
			<table id="select_table" class="table table-striped table-bordered table-hover">
				<thead>
						<tr>
							<th>序号</th>
							<th>ID</th>
							<th>标题</th>
							<th>城市</th>
							<th>邮箱</th>
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
 * 选择游记
 */
function doSelect(id,phone,email){
	$("#userId").val(id);
	phone=(phone=="null"?"":phone);
	email=(email=="null"?"":email);
	var title=phone+"/"+email;
	$("#user").val(title);
	$("#priceModal").modal("hide");
}

function doSearch(){
	var json='{';
	var valueArr=$("#searchForm").serialize().split("&");
	for(var i=0;i<valueArr.length;i++){
		var valueItem=valueArr[i].split("=");
		if(valueItem[1]!=''&&valueItem[1]!=null){
			if(i!=0){
				json+=',';				
			}
			json+='"'+valueItem[0]+'":"'+valueItem[1]+'"';
		}
	}
	json+='}';
	$('#select_table').DataTable().search(json).draw();
}

function showSelect(obj){
	$("#priceModal").modal("show");
	initSelectList();
}

function initSelectList(){
	var url="";
	var fromTable=$("#from_table").val();
	$('#select_table').DataTable({
		"columns": [
            { "data": null },//0
            { "data": "id" },//1
            { "data": "nickname" },//2
            { "data": "phone" },//3
            { "data": "email" },//4
            { "data": null }//5
            ],
            "columnDefs": [{
            	"targets":0,
            	render:function(data,type,row,d){
            		 return d.settings._iDisplayStart+d.row+1;
            	}
            },{
            	"targets": 5,
            	render: function (data, type, row, d) {
            		var context =
            		{
            			func: [
            			{"name": "选择", "fn": "doSelect(\'" + row.id + "\',\'" + row.phone+"\',\'"+row.email + "\')", "type": "purple", "icon":"plus"}
            			]
            		};
            		var html = template(context);
            		return html;
            	}
            }
            ],
            fnInitComplete:function(){
			$('#select_table').DataTable().column(1).visible(false);//隐藏ID行
			},
		"oLanguage":{
			"sLengthMenu":""//设置下拉分页大选择，这里设置为空
		},
		"iDisplayLength": 5,
		"bDestroy": true,
		"ajax": {
			url:"admin/fromu/master/userList",
			data:{fromTable:fromTable},
			type: "POST"
		}
	});
}



function doSubmit(){
	//需要验证的输入栏ID
	if($("#url1").val()==''){
		scroll("img1");
		valTips("img1","请上传真实头像");
		return false;
	}
	var ids="realName,nowlive,summary,user,occupation,phone,email,qq";
	if(checkForm(ids)){
		var data=serializeObject($("#form"));
		var area="";
		$(".areaList .areaName").each(function(){
			area+=$(this).attr("_id")+",";
		});
		data.area=area;
		console.info(data);
		$.post("admin/fromu/master/submitMaster",data,function(req){
			if(req.status=="success"){
				bootbox.alert("提交成功",function(){
					window.location.href="admin/fromu/master/index";	
				})
			}else{
				bootbox.alert("提交失败，请重试");
			}
		});
	}
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
		area.find(".adminDeleteI").bind("click",function(){
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
	console.info($(obj).next("input"));
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

function scroll(id){
	$("html,body").animate({scrollTop:$("#"+id).offset().top},100)
}
</script>
</html>
