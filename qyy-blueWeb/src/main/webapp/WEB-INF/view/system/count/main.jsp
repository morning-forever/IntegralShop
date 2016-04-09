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
			PV,UV统计查询
		</div>
		<table style="margin-left: 5px;" id="btnmenu">
			<tbody>
				<tr>
					<td>
						起始时间：
					</td>
					<td>
						<div class="input-prepend">
							<span class="add-on"><i class="icon-calendar"></i></span>
							<input type="text" id="startTime" name="startTime" readonly="readonly" class="span11 mydate-picker" data-date-format="yyyy-mm-dd">
						</div>
					</td>
					<td>
						结束时间：
					</td>
					<td>
						<div class="input-prepend">
							<span class="add-on"><i class="icon-calendar"></i></span>
							<input type="text" id="endTime" name="endTime" readonly="readonly" class="span11 mydate-picker" data-date-format="yyyy-mm-dd">
						</div>
					</td>
					<td>
						<a title="查询" onclick="" class="btn btn-mini btn-light" id="searchBtn"><i class="icon-search"></i>查询</a>
					</td>
				</tr>
			</tbody>
		</table>
		<div class="oper_btn">
			<span style="color: red;">PV计算方式：单ip访问所有页面（去重复）之和。   UV计算方式：单ip访问数量和</span>
		</div>
		<table id="table_report" class="table table-striped table-bordered table-hover" style="margin-left: 0px; width:1300px; ">
			<thead align="center">
				<tr>
					<th width="35">序号</th>
					<th width="20%">日期</th>
					<th width="20%">pv量</th>
					<th width="20%">uv量</th>
					<th >操作</th>
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
		
		
		var dateStr=[$("#startTime").val(),$("#endTime").val()];
		var date=[new Date(),new Date()];
		for(var i=0;i<dateStr.length;i++){
			var dateItem=dateStr[i].split("-");
			date[i].setFullYear(dateItem[0]);
			date[i].setMonth(parseInt(dateItem[1])-1);
			date[i].setDate(dateItem[2]);
		}
		if(date[0].getTime()>date[1].getTime()){
			valTips($("#endTime"), "开始时间不能小于结束时间");
			return ;
		}
		
		var json = '{"startTime":"'+$("#startTime").val()+'","endTime":"'+$("#endTime").val()+'"}';
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
        	url:"admin/puvcount/list",	
        	type: "POST"
        },
		"columns": [
            { "data": null  },
            { "data": "accessTime"},
            { "data": "pvTotalCount" },
            { "data": "uvTotalCount" },
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
 	            "targets": 4,
 	            render: function (a, b, c, d) {
 	            	var context =
 	                {
 	                    func: [
 	                        {"name": "详情", "fn": "info(\'" + c.accessTime + "\')", "type": "purple", "icon":"edit"}
 	                    ]
 	                };
 	                var html = template(context);
 	            	return html;
           		}
  	        }
   		]
    });
};

var info = function(accessTime){
	targetMainFrame("admin/puvcount/detail?accessTime="+ accessTime);
};

</script>
</html>
