<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="${system.basePath }">
<%@ include file="/static/inc.jsp" %>

<style type="text/css">
#table_report thead th{
  display:run-in;
  overflow-y:auto;
/* "sScrollXInner": "1160",
		"bScrollCollapse": true,
		"scrollX": true, */
}
.oper_btn{
	margin: 8px 9px;
}

</style>

</head>
<body>
<div class="container-fluid" id="main-container">
	<div id="breadcrumbs">
		<ul class="breadcrumb">
			<li><i class="icon-home"></i> <a href="javascript:;">当前</a><span class="divider"><i class="icon-angle-right"></i></span></li>
			<li class="active">系统管理</li>
		</ul><!--.breadcrumb-->
	</div><!--#breadcrumbs-->
	<div class="row-fluid">
		<!-- <h3 class="header smaller lighter blue">会员管理</h3> -->
		<div class="table-header">
			版本管理
		</div>
		<table style="margin-left: 5px;" id="btnmenu">
			<tbody>
				<tr>
					<td>
						版本号：
					</td>
					<td>
						<select id="issueVersion" class="span12">
							<option value="">全部</option>
							<c:forEach var="vs" items="${versionList }">
								<option value="${vs.issueVersion }">v${vs.issueVersion }</option>
							</c:forEach>
						</select>
					</td>
					<td>
						手机系统：
					</td>
					<td>
						<select id="appSys" class="span12">
							<option value="">全部</option>
							<option value="android">Android</option>
							<option value="ios">IOS</option>
						</select>
					</td>
					<td>
						<a title="查询" onclick="" class="btn btn-mini btn-light" id="searchBtn"><i class="icon-search"></i>查询</a>
					</td>
				</tr>
			</tbody>
		</table>
		<div class="oper_btn">
			<a title="新增" onclick="info(0);" href="javascript:;" class="btn btn-mini btn-info"><i class="icon-plus"></i> 新增</a>		
		</div>
		<table id="table_report" class="table table-striped table-bordered table-hover" style="margin-left: 0px; width:1300px; ">
			<thead align="center">
				<tr>
					<th width="35">序号</th>
					<th width="80">版本号</th>
					<th width="80">手机系统</th>
					<th width="80">更新</th>
					<th width="80">版本属性</th>
					<th width="80">发布人</th>
					<th width="80">发布时间</th>
					<th width="150">操作</th>
				</tr>
			</thead>
			<tbody></tbody> 
		</table>
	</div>
</div>
<!-- #main-content -->

<%@ include file="/static/foot.jsp" %>
</body>

<script type="text/javascript" src="static/js/jquery.form.js"></script>
<script type="text/javascript" src="static/js/daterangepicker.min.js"></script>

<!--定义操作列按钮模板-->
<script id="tpl" type="text/x-handlebars-template">
	{{#each func}}
	<a class="btn btn-mini btn-{{this.type}}" {{this.property}} href="javascript:;" title="{{this.name}}" target="mainFrame" onclick="{{this.fn}}"><i class="icon-{{this.icon}}"></i></a>
	{{/each}}
</script>
<script type="text/javascript">



//初始化时间插件
$('.mydate-picker').datepicker();
var tpl = $("#tpl").html();
//预编译模板
var template = Handlebars.compile(tpl);

$(document).ready(function(){
	initList();
	var table = $("#table_report").DataTable();
	$("#searchBtn").click(function(){
		var json = '{"issueVersion":"'+$("#issueVersion").val()+'","appSys":"'+$("#appSys").val()+'"}';
    	table.search(json).draw();
	});
});

var initList = function(){
	$('#table_report').DataTable( {
		"bAutoWidth": false,
		"sScrollX":"100%",
		"scrollX": true, 
        "scrollCollapse": true, 
        "scrollXInner": "110%",
        
		"sScrollY":350,
		"scrollY": true,
		"bDestroy": true,
        "ajax": {
        	url:"admin/version/list",	
        	type: "POST"
        },
		"columns": [
            { "data": null  },
            { "data": "issueVersion"},
            { "data": "appSys" },
            { "data": "updateType" },
            { "data": "versionType"},
            { "data": "username" },
            { "data": "createTime" },
            { "data": null ,"sWidth": "150px"}
        ],
        "columnDefs": [
			{
				"targets": 0,
				render: function (a, b, c, d) {
			        return d.row+1;
				}
			},{
				"targets": 3,
				render: function (a, b, c, d) {
					if(c.updateType == 1){
						return '非强制'
					}
			        return '强制';
				}
			},
			{
				"targets": 4,
				render: function (a, b, c, d) {
					if(c.versionType == 1){
						return '灰度版'
					}
			        return '正式版';
				}
			},
			{
 	            "targets": 7,
 	            render: function (a, b, c, d) {
 	            	var context =
 	                {
 	                    func: [
 	                        {"name": "编辑", "fn": "info(\'" + c.id + "\')", "type": "purple", "icon":"edit"},
 	                        {"name": "删除", "fn": "del(\'" + c.id + "\')", "type": "danger", "icon":"trash"}
 	                    ]
 	                };
 	                var html = template(context);
 	            	return html;
           		}
  	        }
   		]
    });
}

var info = function(id){
	targetMainFrame("admin/version/detail?id="+ id);
};

var del =function(id){
	bootbox.confirm("您确定要删除此广告，删除后不能恢复！",function(b){
		if(b){
			var data = {'id':id};
			$.post("admin/version/dels",data,function(res){
				if('success' == res.status){
					bootbox.alert("删除成功");
				}else{
					bootbox.alert("系统异常，请稍后重试");
				}
				$("#searchBtn").click();
			},"JSON");
		}
	});
};

</script>
</html>
