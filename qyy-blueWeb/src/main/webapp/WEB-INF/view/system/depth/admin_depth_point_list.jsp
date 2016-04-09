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
<!-- <style type="text/css">
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
</style> -->
<body>
	<div class="container-fluid" id="main-container">
		<div id="breadcrumbs">
			<ul class="breadcrumb">
				<li><i class="icon-home"></i> <a
					href="javascript:alert('index');">当前</a><span class="divider"><i
						class="icon-angle-right"></i></span></li>
				<li class="active">精彩亮点管理</li>
			</ul>
			<!--.breadcrumb-->
		</div>
		<!--#breadcrumbs-->
		<div class="row-fluid">
			<div class="table-header">新增/编辑精彩亮点</div>
				<div class="tab-content">
					<table style="margin-left: 5px;" id="btnmenu">
						<tbody>
							<tr>
								<td>
									亮点名称：
								</td>
								<td>
									<input type="text" placeholder="请输入亮点名称" class="mysearch" id="pointName"> 
								</td>
								<td>
									景点名称：
								</td>
								<td>
									<input type="text" placeholder="请输入景点名称" class="mysearch" id="scenicName"> 
								</td>
								<td>
									所在地：
								</td>
								<td>
									<select id="cityId" style="width: 180px">
										<option value="">全部</option>
										<c:forEach items="${cityList }" var="city">
											<option value="${city.id }">${city.city }</option>
										</c:forEach>
									</select>
								</td>
								<td>
									<a title="查询" class="btn btn-mini btn-success" id="searchBtn"><i class="icon-search"></i>查询</a>
									<a title="清空" class="btn btn-mini btn-success" id="clearBtn"><i class="icon-refresh"></i>清空</a>
								</td>
							</tr>
							<tr>
								<td colspan="5">
									<a title="新增"href="admin/depth/point/detail/0" target="mainFrame"
									class="btn btn-mini btn-info"><i class="icon-plus"></i> 新增</a>
								</td>
							</tr>
						</tbody>
					</table>
					<table id="table_report" class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>序号</th>
								<th>亮点名称</th>
								<th>景点名称</th>
								<th>所在地</th>
								<th>具体地址</th>
								<th>建议游览时长</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody></tbody>
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
		
		//查询
		var table = $("#table_report").DataTable();
		$("#searchBtn").click(function() {
			var json = '{"pointName" : "'+$("#pointName").val()
				+'","scenicName" : "'+$("#scenicName").val()
				+'","cityId" : "'+$("#cityId").val()+'"}';
			table.search(json).draw();
		});
		
		//清空
		$("#clearBtn").click(function(){
			$("#btnmenu input,select").val("");
		});
		
	});

	//初始化加载列表
	function initMainList(){
		$('#table_report').DataTable( {
			"bDestroy": true,
	        "ajax": {
	        	url:"admin/depth/point/list",	
	        	type: "POST"
	        },
			"columns": [
	            { "data": null },//序号
	            { "data": "point_name" },//亮点名称
	            { "data": "scenic_name" },//景点名称
	            { "data": "city" },//所在地
	            { "data": "addr_detail" },//具体地址
	            { "data": null },//建议游览时长
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
					"targets":5,
					render:function(data,type,row){
						var str = "";
						if(data.tour_hour != 0){
							str += data.tour_hour + "小时";
						}
						if(data.tour_minute != 0){
							str += data.tour_minute + "分钟";
						}
						return str;
					}
        		},
				{
	 	            "targets": 6,
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
	function doEdit(pointId){
		location.href = "admin/depth/point/detail/"+pointId;
	}
	
	//删除
	function doDelete(pointId){
		bootbox.confirm("确定要删除吗?", function(result) {
			if (result) {
				$.ajax({
					url : "admin/depth/point/deletePoint",
					post : "post",
					data : {
						"pointId" : pointId
					},
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
