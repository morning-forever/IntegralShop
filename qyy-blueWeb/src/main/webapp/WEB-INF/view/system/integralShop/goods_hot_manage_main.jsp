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
			<div class="table-header">商品热度管理</div>
				<div class="tab-content">
					<table style="margin-left: 5px;" id="btnmenu">
						<tbody>
							<tr>
								<td colspan="5"><a title="新增" href="admin/integralShop/goods_hot_manage/saveUI" target="mainFrame"
									class="btn btn-mini btn-info"><i class="icon-plus"></i> 新增</a>
								</td>
							</tr>
						</tbody>
					</table>
					<table id="table_report" class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>序号</th>
								<th>热度名称</th>
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
			alert("hello!");
			var json = '{';
			$("#btnmenu select,#btnmenu input").each(function() {
				json += '"' + this.id + '":"' + $(this).val() + '",';
			});
			json = json.substr(0, json.length - 1);
			json += '}';
			var flag = true;
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
	        	url:"admin/integralShop/goods_hot_manage/list",	
	        	type: "POST"
	        },
			"columns": [
	            { "data": null },//序号
	            { "data": "level" },//商品类型
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
	 	            render: function (a, b, c, d) {
	 	            	var context =
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
		location.href = "admin/integralShop/goods_hot_manage/editUI/"+id;
	}
	
	//删除
	function doDelete(id){
		bootbox.confirm("确定要删除吗?", function(result) {
			if (result) {
				$.ajax({
					url : "admin/integralShop/goods_hot_manage/delete/"+id,
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
