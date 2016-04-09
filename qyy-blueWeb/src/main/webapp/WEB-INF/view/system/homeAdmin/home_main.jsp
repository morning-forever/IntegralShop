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
			<li class="active">物业服务企业</li>
		</ul><!--.breadcrumb-->
	</div><!--#breadcrumbs-->
	<div class="row-fluid">
		<!-- <h3 class="header smaller lighter blue">会员管理</h3> -->
		<div class="table-header">
			物业服务企业
		</div>
		<div style="height: 30px;"></div>
		
		<ul class="nav nav-tabs" id="otherInfoTab">
		    <li class="active" ><a href="#tab_1">首页banner</a></li>
		    <li ><a href="#tab_2">主题深度游推荐</a></li>
		    <li ><a href="#tab_3">玩伴召募推荐</a></li>
		    <li ><a href="#tab_4">热门攻略推荐</a></li>
		   
		</ul>
		 
		<div class="tab-content">
			<!-- 基础属性 -->
		    <div class="tab-pane active" id="tab_1">
		    	<table style="margin-left: 5px;" id="btnmenu">
					<tbody>
						<tr>
						<td>
						生效时间：
					</td>
					<td>
						<div class="input-prepend">
							<span class="add-on"><i class="icon-calendar"></i></span>
							<input type="text" id="startTime" name="date-range-picker" readonly="readonly" class="span11 mydate-picker" data-date-format="yyyy-mm-dd">
						</div>
					</td>
					<td>至</td>
					<td>
						<div class="input-prepend">
							<span class="add-on"><i class="icon-calendar"></i></span>
							<input type="text" id="endTime" name="date-range-picker" readonly="readonly" class="span11 mydate-picker" data-date-format="yyyy-mm-dd">
						</div>
					</td>	
							<td>
								<a title="查询" onclick="" class="btn btn-mini btn-light" id="searchBtn1"><i class="icon-search"></i>查询</a>
							</td>
							<td>
								<a title="添加" href="javascript:openModel1('save');" class="btn btn-mini btn-success" ><i class="icon-pencil"></i> 新增</a>
							</td>	
						</tr>
					</tbody>
				</table>
		    	<table id="table_report" class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>序号</th>
							<th>图片</th>
							<th>发布位</th>
							<th>生效时间</th>
							<th>结束时间</th>
							<th>排序</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody></tbody> 
				</table>
		    </div>
		    <!-- 主题深度游推荐-->
		   
		  
	    </div>
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
	                        aria-hidden="true">&times;</span></button>
	            </div>
	        	<ul class="nav nav-tabs" id="otherInfoTab">
				    <li class="active"><a href="#tab2_1">基础属性</a></li>
				    <li ><a href="#tab2_2">内容编辑</a></li>
				</ul>
				 
				<div class="tab-content">
					<!-- 基础属性 -->
				    <div class="tab-pane active" id="tab2_1">
				    	<div class="modal-body">
			                <div>
			                	<form id="myform" enctype="multipart/form-data">
			                		<input type="hidden" id="content" name="content"/>
	    							<input type="hidden" id="company_id" name="companyId"/>
	    							<input type="hidden" name="type" value="1"/>
				                	<table class="mytable-detail">
				                		<tr>
				                			<th>
				                				小区Id：
				                			</th>
				                			<td>
				                			 	<input type="text" class="form-control" id="plot_id" name="plotId" placeholder="小区id">
				                			</td>
				                		</tr>
				                		<tr> 
				                			<th>
				                				图片上传：
				                			</th>
				                			<td>
			                			 		<input type="file" id="imageFile" name = "cover"">
			                			 		<label for="imageFile" data-title="Choose" class="" >
			                			 			<span data-title="No File ..." class=""></span>
			                			 		</label>
				                			</td>
				                		</tr>
				                		<tr>
				                			<td colspan="2">
			                			 		<a target="_blank"><img id="imageSrc" src="" width="100px" style="padding-left: 110px"></a>
				                			</td>
				                		</tr>
				                	</table>
			                	</form>
			                </div>
			            </div>
		            </div>
		            <!-- 内容编辑 -->
		    		<div class="tab-pane" id="tab2_2">
		    			<script id="editor1" type="text/plain"></script>
		    		</div>
			    </div>
				<div style = "padding:10px 350px;">
					<button type="button" class="btn btn-primary" id="save-btn" onclick="saveCompany();" >保存</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
	        </div>
	    </div>
	</div>
	
	
	
	
</div>
<!-- #main-content -->



<%@ include file="/static/foot.jsp" %>
</body>
<script type="text/javascript" src="static/js/jquery.form.js"></script>
<script type="text/javascript" charset="utf-8" src="plugins/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="plugins/ueditor/ueditor.all.min.js"></script>
<!--定义操作列按钮模板-->
<script id="tpl" type="text/x-handlebars-template">
	{{#each func}}
	<a class="btn btn-mini btn-{{this.type}}" href="javascript:;" title="{{this.name}}" target="mainFrame" onclick="{{this.fn}}"><i class="icon-{{this.icon}}"></i></a>
	{{/each}}
</script>
<script type="text/javascript">
var ue1;
var ue2;
var ue5;
var ue6;
var tpl = $("#tpl").html();
//预编译模板
var template = Handlebars.compile(tpl);

$(document).ready(function(){
	
	initMainList();
	//initPressList();
	//initVideoList();
	$('.mydate-picker').datepicker();
	
	var table = $("#table_report").DataTable();
	


	
	$("#searchBtn1").click(function(){
		var startTime = $("#startTime").val();
		var endTime = $("#endTime").val();
		
		var json = '{"startTime":"'+startTime+'","endTime":"'+endTime+'"}';
    	table.search(json).draw();
	});
	
	
	$('input[type=file]').ace_file_input({
		no_file:'No File ...',
		btn_choose:'选择',
		btn_change:'改变',
		droppable:false,
		onchange:null,
		thumbnail:false //| true | large
		//whitelist:'gif|png|jpg|jpeg'
		//blacklist:'exe|php'
		//onchange:''
		//
	});
	
	$("#imageFile").change(function(){
		$("#imageSrc").parent().parent().hide();
	});
	
	$("#imageFile2").change(function(){
		$("#imageSrc2").parent().hide();
	});
	$("#imageFile4").change(function(){
		$("#imageSrc4").parent().hide();
	});
	
});


/*tab页*/
$(function() {
    $('#otherInfoTab a:first').tab('show');//初始化显示哪个tab

    $('#otherInfoTab a').click(function(e) {
        e.preventDefault();//阻止a链接的跳转行为
        $(this).tab('show');//显示当前选中的链接及关联的content
    });
})

function initMainList(){
	$('#table_report').DataTable( {
	    "columns": [
            { "data": "id" },
            { "data": "bannerImg" },
            { "data": "bannerWhere" },
            { "data": "createTime" },
            { "data": "updateTime" },
            { "data": "bannerOrder" },
            { "data": null }
        ],
        "columnDefs": [ 
                        {
		            "targets": 6,
		            render: function (a, b, c, d) {
		                var context =
		                {
		                    func: [
		                        {"name": "编辑", "fn": "updateBanner(\'" + c.id + "\')", "type": "purple", "icon":"edit"},
		                        {"name": "删除", "fn": "deleteBanner(\'" + c.id + "\','')", "type": "danger", "icon":"trash"}
		                    ]
		                };
		                var html = template(context);
		                return html;
		            }
		        }
        ],
        "bDestroy": true,
        
        "ajax": {
        	url:"home/getBannerList",	
        	type: "POST"
        }
    } );
}


function updateBanner(id){
	targetMainFrame('home/homeBannerDetail?id='+id);
}


function initPressList(){
	$('#table_report3').DataTable( {
	    "columns": [
            { "data": "id" },
            { "data": "image" },
            { "data": "imageNum" },
            { "data": "updateDate" },
            { "data": null }
        ],
        "columnDefs": [ 
                        {
		            "targets": 1,
		            render: function (a, b, c, d) {
		            	var html = '<a target="_blank" href="'+c.image+'"><img src="'+c.image+'" width="100px"></a>';
		                return html;
		            }
		        },{
		            "targets": 4,
		            render: function (a, b, c, d) {
		                var context =
		                {
		                    func: [
		                        {"name": "编辑", "fn": "openModel1(\'" + c.id + "\')", "type": "purple", "icon":"edit"},
		                        {"name": "删除", "fn": "deletePlotCompany(\'" + c.id + "\','3')", "type": "danger", "icon":"trash"}
		                    ]
		                };
		                var html = template(context);
		                return html;
		            }
		        }
        ],
        "bDestroy": true,
        "oSearch": {
        	"sSearch": '{"type":"3"}'
        },
        "ajax": {
        	url:"plotCompany/getPlotCompanyList",	
        	type: "POST"
        }
    } );
}

function initVideoList(){
	$('#table_report4').DataTable( {
	    "columns": [
            { "data": "id" },
            { "data": "image" },
            { "data": "video" },
            { "data": "updateDate" },
            { "data": null }
        ],
        "columnDefs": [ 
                        {
		            "targets": 1,
		            render: function (a, b, c, d) {
		            	var html = '<a target="_blank" href="'+c.image+'"><img src="'+c.image+'" width="100px"></a>';
		                return html;
		            }
		        },{
		            "targets": 2,
		            render: function (a, b, c, d) {
		            	var html = '<a target="_blank" href="'+c.video+'">'+c.video+'</a>';
		                return html;
		            }
		        },{
		            "targets": 4,
		            render: function (a, b, c, d) {
		                var context =
		                {
		                    func: [
		                        {"name": "编辑", "fn": "openModel4(\'" + c.id + "\')", "type": "purple", "icon":"edit"},
		                        {"name": "删除", "fn": "deletePlotCompany(\'" + c.id + "\','4')", "type": "danger", "icon":"trash"}
		                    ]
		                };
		                var html = template(context);
		                return html;
		            }
		        }
        ],
        "bDestroy": true,
        "oSearch": {
        	"sSearch": '{"type":"4"}'
        },
        "ajax": {
        	url:"plotCompany/getPlotCompanyList",	
        	type: "POST"
        }
    } );
}

function deleteBanner(id,num){
	bootbox.confirm("确定要删除吗?", function(result) {
		if(result){
			$.ajax({
				url : "home/deleteBannerById",
				post : "post",
				data:{
					"id":id
				},
				success:function(data){
					if(data.status == "success"){
						bootbox.alert("删除成功！");
						$('#table_report'+num).DataTable().clear();
						$('#table_report'+num).DataTable().draw();
					}
				}
				
			});
		}
	});
}

function openModel1(flag){
	
	if(flag == "save"){
		$("#myform input").val("");
		$("#myform").find("input[name=type]").val("1");
		$('.remove').trigger("click");
		$("#app").attr("checked",true);
		$("#wx").attr("checked",true);
		
		$("#imageSrc").parent().parent().hide();
		$("#imageSrc").attr("src","");
		$("#imageSrc").parent().attr("herf","");
		
		$("#myModal1").modal("show");
	}else{
		$("#imageSrc").parent().parent().show();
		
		$.ajax({
			url:"plotCompany/editPlotCompany",
			type:"post",
			data:{"id":flag},
			success:function(req){
				if(req.status == "success"){
					$('.remove').trigger("click");
					$("#company_id").val(req.data.id);
					$("#plot_id").val(req.data.plotId);
					$("#imageSrc").attr("src",req.data.image);
					$("#imageSrc").parent().attr("herf",req.data.image);
					ue1.setContent(req.data.content);

					$("#myModal1").modal("show");
				}else{
					bootbox.alert("服务器异常！");
				}
			}
		});
	}
	
}

function openModel3(flag){
	
	if(flag == "save"){
		$("#myform3 input").val("");
		$('.remove').trigger("click");
		
		$("#imageSrc").parent().parent().hide();
		$("#imageSrc").attr("src","");
		$("#imageSrc").parent().attr("herf","");
		
		$("#myModal3").modal("show");
	}else{
		$("#imageSrc").parent().parent().show();
		
		$.ajax({
			url:"plotCompany/editPlotCompany",
			type:"post",
			data:{"id":flag},
			success:function(req){
				if(req.status == "success"){
					$('.remove').trigger("click");
					$("#company_id").val(req.data.id);
					$("#plot_id").val(req.data.plotId);
					$("#imageSrc").attr("src",req.data.image);
					$("#imageSrc").parent().attr("herf",req.data.image);
					ue1.setContent(req.data.content);

					$("#myModal3").modal("show");
				}else{
					bootbox.alert("服务器异常！");
				}
			}
		});
	}
	
}

function openModel4(flag){
	
	if(flag == "save"){
		$("#myform4 input").val("");
		$("#myform4 input[name=type]").val("4");
		$('.remove').trigger("click");
		
		$("#imageSrc4").parent().parent().hide();
		$("#imageSrc4").attr("src","");
		$("#imageSrc4").parent().attr("herf","");
		
		$("#myModal4").modal("show");
	}else{
		$("#imageSrc4").parent().parent().show();
		
		$.ajax({
			url:"plotCompany/editPlotCompany",
			type:"post",
			data:{"id":flag},
			success:function(req){
				if(req.status == "success"){
					$('.remove').trigger("click");
					$("#myform4 input[name=companyId]").val(req.data.id);
					$("#videoUrl").val(req.data.video);
					$("#imageSrc4").attr("src",req.data.image);
					$("#imageSrc4").parent().attr("herf",req.data.image);
					
					$("#myModal4").modal("show");
				}else{
					bootbox.alert("服务器异常！");
				}
			}
		});
	}
	
}

function saveCompany(){
	var content = ue1.getContent();
	var imageFile = $("#imageFile").val();
	var imageSrc = $("#imageSrc").attr("src");
	var plotId = $("#plot_id").val();
	
	$("#content").val(content);
	
	if(imageFile == null || imageFile == ''){
		if(imageSrc == null || imageSrc == ''){
			valTips("imageFile","请选择图片！");
			return;
		}
	}
	if(plotId == '' || plotId == null){
		valTips("plot_id","请输入小区id！");
		return;
	}else{
		if(plotId == "0"){
			valTips("plot_id","该项不可以设置为全部！");
			return;
		}else if(!/^\d+$/.test(plotId)){
			valTips("plot_id","请输入正确小区id！");
			return;
		}
	}
	
	$("#myform").ajaxSubmit({
		url:"plotCompany/savePlotCompany",
		type:'post',
		success: function (req) {
			if(req.status == "success"){
				bootbox.alert("保存成功！");
				$("#myModal1").modal("hide");
				$('#table_report').DataTable().clear();
				$('#table_report').DataTable().draw();
			}
		}
    });
}

function saveAboutJd(){
	var content = ue2.getContent();
	var imageFile = $("#imageFile2").val();
	var imageSrc = $("#imageSrc2").attr("src");
	
	$("#content2").val(content);
	
	if(imageFile == null || imageFile == ''){
		if(imageSrc == null || imageSrc == ''){
			valTips("imageFile2","请选择图片！");
			return;
		}
	}
	
	$("#myform2").ajaxSubmit({
		url:"plotCompany/savePlotCompany",
		type:'post',
		success: function (req) {
			if(req.status == "success"){
				bootbox.alert("保存成功！");
				$("#imageSrc2").attr("src",req.image);
				$("#imageSrc2").parent().show();
				$("#imageSrc2").parent().attr("herf",req.image);
				$('.remove').trigger("click");
			}
		}
    });
}

function saveYanglao(){
	var content = ue5.getContent();
	var imageFile = $("#imageFile5").val();
	var imageSrc = $("#imageSrc5").attr("src");
	
	$("#content5").val(content);
	
	if(imageFile == null || imageFile == ''){
		if(imageSrc == null || imageSrc == ''){
			valTips("imageFile5","请选择图片！");
			return;
		}
	}
	
	$("#myform5").ajaxSubmit({
		url:"plotCompany/savePlotCompany",
		type:'post',
		success: function (req) {
			if(req.status == "success"){
				bootbox.alert("保存成功！");
				$("#imageSrc5").attr("src",req.image);
				$("#imageSrc5").parent().show();
				$("#imageSrc5").parent().attr("herf",req.image);
				$('.remove').trigger("click");
			}
		}
    });
}

function saveCall(){
	var content = ue6.getContent();
	var phone = $("#phone").val();
	$("#content6").val(content);
	
	if(phone == '' || phone == null){
		valTips("phone","请输入联系电话！");
		return;
	}
	if(!checkField(phone, 10, 64, new RegExp("^\\d{3}-\\d{8}|\\d{4}-\\d{7}|\\d{4}-\\d{4}-\\d{2}|\\d{11}$"))){
		valTips('phone', '请提供有效的联系电话.');
		return 1;
	}
	
	$("#myform6").ajaxSubmit({
		url:"plotCompany/savePlotCompany",
		type:'post',
		success: function (req) {
			if(req.status == "success"){
				bootbox.alert("保存成功！");
			}
		}
    });
}

function saveVideo(){
	var video = $("#videoUrl").val();
	var imageFile = $("#imageFile4").val();
	var imageSrc = $("#imageSrc4").attr("src");
	
	if(video == null || video == ''){
		valTips("videoUrl","请填写视频地址！");
		return;
	}
	
	if(imageFile == null || imageFile == ''){
		if(imageSrc == null || imageSrc == ''){
			valTips("imageFile4","请选择图片！");
			return;
		}
	}
	
	$("#myform4").ajaxSubmit({
		url:"plotCompany/savePlotCompany",
		type:'post',
		success: function (req) {
			if(req.status == "success"){
				bootbox.alert("保存成功！");
				$("#myModal4").modal("hide");
				$('#table_report4').DataTable().clear();
				$('#table_report4').DataTable().draw();
			}
		}
    });
}
</script>
</html>
