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
			<li class="active">帮助中心管理</li>
		</ul><!--.breadcrumb-->
	</div><!--#breadcrumbs-->
	<div class="row-fluid">
		<!-- <h3 class="header smaller lighter blue">会员管理</h3> -->
		<div class="table-header">
			帮助中心管理
		</div>
		<table style="margin-left: 5px;" id="btnmenu">
			<tbody>
				<tr>
					<td>
						问题
					</td>
					<td>
						<div class="input-prepend">
							<input type="text" id="issue" name="issue" class="span11" />
						</div>
					</td>
					<td>
						回复
					</td>
					<td>
						<div class="input-prepend">
							<input type="text" id="answer" name="answer" class="span11" />
						</div>
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
					<th width="300">问题</th>
					<th width="300">回复</th>
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
			    <li class="active"><a href="javascript:;" id="modalTitle">问题详情</a></li>
			</ul>
			<div class="tab-content">
				<form id="modalForm_price">
			    	<div class="modal-body">
	                	<table class="mytable-detail">
	                		<tr> 
	                			<td>
	                				问题
	                			</td>
	                			<td>
	                				<input type="hidden" id="id" name="id" />
	                				<input type="text" id="ie_issue" name="issue" />
	                			</td>
	                		</tr>
	                		<tr> 
	                			<td>
	                				回复
	                			</td>
	                			<td>
	                				<textarea id="ie_answer" name="answer" style="width: 700px;height: 200px;"  rows="" cols=""></textarea>
	                			</td>
	                		</tr>
	                	</table>
		            </div>
	            </form>
			</div>
			<div style = "padding:10px 350px;">
				<button onclick="save();" class="btn btn-info" type="button"><i class="icon-ok"></i>保存</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			</div>
        </div>
    </div>
</div>

<%@ include file="/static/foot.jsp" %>
</body>

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
		var json = '{"issue":"'+$("#issue").val()+'","answer":"'+$("#answer").val()+'"}';
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
        	url:"admin/helper/list",	
        	type: "POST"
        },
		"columns": [
            { "data": null  },
            { "data": "issue"},
            { "data": "answer" },
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
				"targets": 1,
				render: function (a, b, c, d) {
					if(c.issue != null && c.issue != '')
						if(c.issue.length>20){
							return c.issue.substring(0,40);
						}
			        return c.issue;
				}
			},
			{
				"targets": 2,
				render: function (a, b, c, d) {
					if(c.answer != null && c.answer != '')
						if(c.answer.length>20){
							return c.answer.substring(0,40);
						}
			        return c.answer;
				}
			},
			{
 	            "targets": 3,
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
	$("#openModal").find("#id").val('');
	$("#openModal").find("#ie_issue").val('');
	$("#openModal").find("#ie_answer").val('');
	if(0==id){
		$("#openModal").modal("show");
	}else{
		var data = {"id":id};
		$.post("admin/helper/detail",data,function(res){
			if('success' == res.status){
				$("#openModal").find("#id").val(res.id);
				$("#openModal").find("#ie_issue").val(res.issue);
				$("#openModal").find("#ie_answer").val(res.answer);
				$("#openModal").modal("show");
			}else{
				bootbox.alert("操作失败！");
			}
		},"JSON");
	}
};

var save = function(){
	var param = {
		'id':$("#openModal").find("#id").val(),
		"issue":$("#openModal").find("#ie_issue").val(),
		'answer':$("#openModal").find("#ie_answer").val()
	};
	
	if(!checkField(param.issue)){
		valTips("ie_issue", "请输入问题");
		return ;
	}
	if(!checkField(param.answer)){
		valTips("ie_answer", "请输入回复");
		return ;
	}
	
	$.post("admin/helper/save",param,function(res){
		$("#openModal").modal("hide");
		if('success' == res.status){
			bootbox.alert("保存成功！");
		}else{
			bootbox.alert("保存失败！");
		}
		$("#searchBtn").click();
	},"JSON");
}


var del =function(id){
	bootbox.confirm("您确定要删除此反馈，删除后不能恢复！",function(b){
		if(b){
			var data = {'id':id};
			$.post("admin/helper/dels",data,function(res){
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
