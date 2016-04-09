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

</style>

</head>
<body>
<div class="container-fluid" id="main-container">
	<div id="breadcrumbs">
		<ul class="breadcrumb">
			<li><i class="icon-home"></i> <a href="javascript:;">当前</a><span class="divider"><i class="icon-angle-right"></i></span></li>
			<li class="active">反馈管理</li>
		</ul><!--.breadcrumb-->
	</div><!--#breadcrumbs-->
	<div class="row-fluid">
		<!-- <h3 class="header smaller lighter blue">会员管理</h3> -->
		<div class="table-header">
			反馈管理
		</div>
		<table style="margin-left: 5px;" id="btnmenu">
			<tbody>
				<tr>
					<td>
						反馈时间：
					</td>
					<td>
						<div class="input-prepend">
							<span class="add-on"><i class="icon-calendar"></i></span>
							<input type="text" id="startTime" name="startTime" readonly="readonly" class="span11 mydate-picker" data-date-format="yyyy-mm-dd">
						</div>
						<span class="add-on" style="margin-left: 18px;">
						至
						</span>
						<div class="input-prepend">
							<span class="add-on"><i class="icon-calendar"></i></span>
							<input type="text" id="endTime" name="endTime" readonly="readonly" class="span11 mydate-picker" data-date-format="yyyy-mm-dd">
						</div>
					</td>
					<td>
						<a title="查询" onclick="" class="btn btn-mini btn-success" id="searchBtn"><i class="icon-search"></i>查询</a>
						<a title="清空" onclick="" class="btn btn-mini btn-success" id="clearBtn"><i class="icon-refresh"></i>清空</a>
					</td>
				</tr>
			</tbody>
		</table>
		<table id="table_report" class="table table-striped table-bordered table-hover" style="margin-left: 0px;">
			<thead align="center">
				<tr>
					<th width="35">序号</th>
					<th width="120">用户账户</th>
					<th width="120">用户邮箱</th>
					<th >意见反馈内容</th>
					<th width="150">反馈时间</th>
					<th width="150">操作</th>
				</tr>
			</thead>
			<tbody></tbody> 
		</table>
	</div>
</div>
<!-- #main-content -->

<div class="modal fade" id="openModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
            </div>
        	<ul class="nav nav-tabs" id="otherInfoTab">
			    <li class="active"><a href="javascript:;" id="modalTitle">反馈详情</a></li>
			</ul>
			<div class="tab-content">
				<form id="modalForm_price">
			    	<div class="modal-body">
	                	<table class="mytable-detail">
	                		<tr> 
	                			<td id="message">
	                				内容
	                			</td>
	                		</tr>
	                	</table>
		            </div>
	            </form>
			</div>
			<div style = "padding:10px 350px;">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			</div>
        </div>
    </div>
</div>

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
		var json = '{"startTime":"'+$("#startTime").val()+'","endTime":"'+$("#endTime").val()+'"}';
		if($("#startTime").val() > $("#endTime").val()){
			valTips('startTime',"反馈开始时间不能大于反馈结束时间");
			return ;
		}
    	table.search(json).draw();
	});
	
	//清空
	$("#clearBtn").click(function(){
		$("#btnmenu input").val("");
	});
});

var initList = function(){
	$('#table_report').DataTable( {
		/* "bAutoWidth": false,
		"sScrollX":"100%",
		"scrollX": true, 
        "scrollCollapse": true, 
        "scrollXInner": "110%",
        
		"sScrollY":350,
		"scrollY": true, */
		"bDestroy": true,
        "ajax": {
        	url:"admin/feedback/list",	
        	type: "POST"
        },
		"columns": [
            { "data": null  },
            { "data": "account"},
            { "data": "email" },
            { "data": "message" },
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
					
					if(c.message.length>20){
						return c.message.substring(0,40);
					}
					
			        return c.message;
				}
			},
			{
 	            "targets": 5,
 	            render: function (a, b, c, d) {
 	            	var context =
 	                {
 	                    func: [
 	                        {"name": "查看", "fn": "info(\'" + c.id + "\')", "type": "light", "icon":"eye-open"},
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
	var data = {"backId":id};
	$.post("admin/feedback/detail",data,function(res){
		if('success' == res.status){
			$("#openModal").find("#message").html(res.message);
			$("#openModal").modal("show");
		}else{
			bootbox.alert("操作失败！");
		}
	},"JSON");
};

var del =function(id){
	bootbox.confirm("您确定要删除此反馈，删除后不能恢复！",function(b){
		if(b){
			var data = {'id':id};
			$.post("admin/feedback/dels",data,function(res){
				if('success' == res.status){
					bootbox.alert("操作成功！");
				}else{
					bootbox.alert("操作失败！");
				}
				$("#searchBtn").click();
			},"JSON");
		}
	});
};

</script>
</html>
