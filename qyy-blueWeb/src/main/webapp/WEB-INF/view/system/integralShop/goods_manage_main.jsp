<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="${system.basePath }">
<%@ include file="/static/inc.jsp"%>

</head>
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
</style>
<body>
	<div class="container-fluid" id="main-container">
		<div id="breadcrumbs">
			<ul class="breadcrumb">
				<li><i class="icon-home"></i> <a
					href="javascript:alert('index');">当前</a><span class="divider"><i
						class="icon-angle-right"></i></span></li>
				<li class="active">积分商城</li>
			</ul>
			<!--.breadcrumb-->
		</div>
		<!--#breadcrumbs-->
		<div class="row-fluid">
			<div class="table-header">商品管理</div>
				<div class="tab-content">
					<table style="margin-left: 5px;" id="btnmenu">
						<tbody>
							<tr>
								<td>
									商品名称：
								</td>
								<td>
									<input type="text" placeholder="请输入主题名称" class="mysearch" id="name"> 
								</td>
								<td>
									<a title="查询" class="btn btn-mini btn-success" id="searchBtn"><i class="icon-search"></i>查询</a>
									<a title="清空" class="btn btn-mini btn-success" id="clearBtn"><i class="icon-refresh"></i>清空</a>
								</td>
							<tr>
								<td colspan="5"><a title="新增" href="admin/integralShop/goods_manage/saveUI" target="mainFrame"
									class="btn btn-mini btn-info"><i class="icon-plus"></i> 新增</a>
								</td>
							</tr>
						</tbody>
					</table>
					<table id="table_report" class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>序号</th>
								<th>商品名称</th>
								<th>图片</th>
								<th>原价</th>
								<th>现价</th>
								<th>库存</th>
								<th>剩余</th>
								<th>概述</th>
								<th>商品类型</th>
								<th>热度</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
		</div>
	</div>
	<%@ include file="/static/foot.jsp"%>
</body>
<script type="text/javascript" charset="utf-8"
	src="plugins/ueditor1.4.3/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="plugins/ueditor1.4.3/ueditor.all.min.js"></script>
<script type="text/javascript" src="static/js/jquery.form.js"></script>
<script type="text/javascript" src="static/js/daterangepicker.min.js"></script>
<script type="text/javascript" src="static/js/bootstrap-timepicker.min.js"></script>
<script type="text/javascript" src="static/js/base.js"></script>
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

	$(document).ready(function(){
		//初始化加载列表
		initMainList();
		
		//设置table的宽度
		$("#table_report").on('draw.dt',function() {
	    	$(".dataTables_wrapper").css("width","1700px");
	    });
		
		//查询
		var table = $("#table_report").DataTable();
		$("#searchBtn").click(function() {

			var json = '{';
			$("#btnmenu select,#btnmenu input").each(function() {
				json += '"' + this.id + '":"' + $(this).val() + '",';
			});
			json = json.substr(0, json.length - 1);
			json += '}';
			var flag = true;
			/* var adultPrice = $("#adultPrice").val();
			var childPrice = $("#childPrice").val();
			if(isNaN(adultPrice)){
				valTips('adultPrice',"请输入数字");
				flag = false;
			}
			if(isNaN(childPrice)){
				valTips('childPrice',"请输入数字");
				flag = false;
			} */
			if(flag){
				table.search(json).draw();
			}
		});	
		
		//清空
		$("#clearBtn").click(function(){
			$("#btnmenu input,#btnmenu select").val("");
		});
	});

	//初始化加载列表
	function initMainList(){
		
		$('#table_report').DataTable( {
			"bDestroy": true,
	        "ajax": {
	        	url:"admin/integralShop/goods_manage/list",	
	        	type: "POST"
	        },
			"columns": [
	            { "data": null },//序号
	            { "data": "name" },//主题名称
	            { "data": "img_url"},
	            { "data": "original_price" },//行程天数
	            { "data": "current_price" },//成人价
	            { "data": "allNumber" },//儿童价
	            { "data": "residueNumber" },//标签
	          	{ "data": "summary"},//概述 
	            { "data": "goods_type" },//标签
	            { "data": "level" },//推荐指数
	            { "data": null }//操作
	        ],
	        "columnDefs": [
				{
					"targets": 0,
					render: function (a, b, c, d) {
		                return d.row+1;
					}
				},
				{
					"targets": 2,
					render: function(data,type,row){
	            		return '<img src="'+data+'" width="50px" height="50px">';
	            	}
				},
				{
					"targets": 7,
					render: function(data,type,row){
						if(data.length>50){
							return data.substring(0,50)+"……";
						}else{
							return data;
						}
	            		
	            	}
				},
				{
	 	            "targets": 10,
	 	            render: function (a, b, c, d) {
	 	            	
	 	            		context =
		 	 	                {
		 	 	                    func: [
		 	 	                        {"name": "编辑", "fn": "doEdit(\'" + c.id + "\')", "type": "purple", "icon":"edit"},
		 	 	                        {"name": "删除", "fn": "doDelete(\'" + c.id + "\')", "type": "danger", "icon":"trash"}
		 	 	                    ]
		 	 	                };
	 	            	
	 	            	return template(context);
	           		}
	  	        }
	   		]
	    });
	}
	
	//编辑
	function doEdit(id){
		location.href = "admin/integralShop/goods_manage/editUI/"+id;
	}
	
	//上架和下架
	function onOffLine(depthId,isShelves){
		var tip = "";
		if(isShelves == 0){
			tip= "上架";
		}else if(isShelves == 1){
			tip= "下架";
		}
		bootbox.confirm("确定要"+tip+"吗?", function(result) {
			if (result) {
				$.ajax({
					url : "admin/depth/onOffLine",
					post : "post",
					data : {
						"depthId" : depthId,
						"isShelves" : isShelves
					},
					success : function(data) {
						if (data.status == "success") {
							bootbox.alert(tip+"成功！");
							$('#table_report').DataTable().clear();
							$('#table_report').DataTable().draw();
						} else {
							bootbox.alert("服务器异常！");
						}
					}
				});
			}
		});
	}
	
	//删除
	function doDelete(id){
		bootbox.confirm("确定要删除吗?", function(result) {
			if (result) {
				$.ajax({
					url : "admin/integralShop/goods_manage/deleteGoods/"+id,
					post : "post",
					success : function(data) {
						if (data.status == "success") {
							bootbox.alert("删除成功！");
							$('#table_report').DataTable().clear();
							$('#table_report').DataTable().draw();
						} else {
							bootbox.alert("服务器异常！");
						}
					}
				});
			}
		});
	}
	
</script>
</html>
