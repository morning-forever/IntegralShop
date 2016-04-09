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
			<li class="active">角色管理</li>
		</ul><!--.breadcrumb-->
	</div><!--#breadcrumbs-->
	<div class="row-fluid">
		<!-- <h3 class="header smaller lighter blue">会员管理</h3> -->
		<div class="table-header">
			角色管理
		</div>
		<table style="margin-left: 5px;" id="btnmenu">
			<tbody>
				<tr>
					<td>
						角色名：
					</td>
					<td>
						<input type="text" id="roleName" name="roleName" />
					</td>
					<td>
						角色状态：
					</td>
					<td>
						<select id="roleState" name="roleState">
							<option value="0">有效</option>
							<option value="1">无效</option>
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
					<th width="200">角色名</th>
					<th width="300">角色描述</th>
					<th width="120">角色状态</th>
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
		var json = '{"roleName":"'+$("#roleName").val()+'","roleState":"'+$("#roleState").val()+'"}';
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
        	url:"admin/user/roleList",	
        	type: "POST"
        },
		"columns": [
            { "data": null  },
            { "data": "roleName"},
            { "data": "roleDesc" },
            { "data": "roleState"},
            { "data": null ,"sWidth": "150px"}
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
					if(c.roleDesc != null && c.roleDesc != '')
						if(c.roleDesc.length>20){
							return c.roleDesc.substring(0,20);
						}
			        return c.roleDesc;
				}
			},
			{
				"targets": 3,
				render: function (a, b, c, d) {
					if(c.roleState==0){
						return '有效';
					}
			        return '无效';
				}
			},
			{
 	            "targets": 4,
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
	targetMainFrame("admin/user/roleDetail?roleId="+ id);
};

var del =function(id){
	bootbox.confirm("您确定要删除此角色，删除后不能恢复！",function(b){
		if(b){
			var data = {'roleId':id};
			$.post("admin/user/delsRole",data,function(res){
				if('success' == res.status){
					bootbox.alert("删除成功");
				}else if("exists" == res.status){
					bootbox.alert("删除失败,此角色或已经被用户关联");
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
