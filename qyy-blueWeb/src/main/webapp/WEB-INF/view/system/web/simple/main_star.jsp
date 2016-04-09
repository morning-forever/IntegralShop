<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="${system.basePath }">
<%@ include file="/static/inc.jsp" %>

</head>
<body>
<div class="container-fluid" id="main-container">
	<div id="breadcrumbs">
		<ul class="breadcrumb">
			<li><i class="icon-home"></i> <a href="javascript:;">当前</a><span class="divider"><i class="icon-angle-right"></i></span></li>
			<li class="active">酒店管理</li>
		</ul><!--.breadcrumb-->
	</div><!--#breadcrumbs-->
	<div class="row-fluid">
		<!-- <h3 class="header smaller lighter blue">会员管理</h3> -->
		<div class="table-header">
			酒店星级管理
		</div>
		<table style="margin-left: 5px;" id="btnmenu">
			<tbody>
				<tr>
					<td>
						酒店星级：
					</td>
					<td>
						<span style="margin-top: 7px;" class="input-icon">
							<select id="star" style="width: 110px;">
								<option value="">---请选择---</option>
								<c:forEach items="${starList }" var="star">
								<option value="${star.id }">${star.starDetail }</option>
								</c:forEach>
							</select>
						</span>
					</td>
					
					<td>
						<a title="查询" onclick="" class="btn btn-mini btn-light" id="searchBtn"><i class="icon-search"></i>查询</a>
					</td>
					<td>
						<a title="新增星级" href="javascript:;" class="btn btn-mini btn-success" id="addHotelStarBtn"><i class="icon-pencil"></i> 新增</a>
					</td>
				</tr>
			</tbody>
		</table>
		<table id="table_report" class="table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th>序号</th>
					<th>酒店星级</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody></tbody> 
		</table>
	</div>
</div>
<!-- #main-content -->

<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
            </div>
        	<ul class="nav nav-tabs" id="otherInfoTab">
			    <li class="active"><a href="javascript:;" id="modalTitle">酒店星级</a></li>
			</ul>
			<div class="tab-content">
				<form id="modalForm">
			    	<div class="modal-body">
	                	<table class="mytable-detail">
	                		<tr> 
	                			<th width="70">
	                				酒店星级：
	                			</th>
	                			<td>
	                				<input id="starId" name="id" type="hidden" value="">
	                			 	<input type="text" class="form-control span3" id="starDetail" name="starName">
	                			</td>
	                		</tr>
	                	</table>
		            </div>
	            </form>
			</div>
			<div style = "padding:10px 350px;">
				<button type="button" class="btn btn-primary" id="save-btn" onclick="saveStar();" >保存</button>
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

var tpl = $("#tpl").html();
//预编译模板
var template = Handlebars.compile(tpl);

$(document).ready(function(){
	initList();
	var table = $("#table_report").DataTable();
	//查询
	$("#searchBtn").click(function(){
		doSearch();
	});
	//新增
	$("#addHotelStarBtn").click(function(){
		$("#starId").val("");
		$("#starDetail").val("");
		$("#addModal").modal("show");
	});
});

var doSearch =function(){
	/* var data = data|{};
	data = {
		"nickname" : $("#nickname").val(),
		"phone": $("#phone").val(),
		"email": $("#email").val(),
		"isBan": $("#isBan").val()
	} */		
	var json = '{"starId":"'+$("#star").val()+'","hotelName":"'+$("#hotelName").val()+'","addrId":"'+$("#city").val()+'"}';
	$("#table_report").DataTable().search(json).draw();
};


var initList = function(){
	$('#table_report').DataTable( {
		"bDestroy": true,
        "ajax": {
        	url:"admin/simplestarmngr/list",	
        	type: "POST"
        },
		"columns": [
            { "data": null },
            { "data": "starDetail" },
            { "data": null }
        ],
        "columnDefs": [
			{
				"targets": 0,
				render: function (a, b, c, d) {
	                return d.settings._iDisplayStart+d.row+1;
				}
			},
			{
 	            "targets": 2,
 	            render: function (a, b, c, d) {
 	            	var context =
 	                {
 	                    func: [
 	                        {"name": "编辑", "fn": "editHotelStar(\'" + c.id + "\')", "type": "purple", "icon":"edit"},
 	                        {"name": "删除", "fn": "delHotelStar(\'" + c.id + "\')", "type": "danger", "icon":"trash"}
 	                    ]
 	                };
 	                var html = template(context);
 	            	return html;
           		}
  	        }
   		]
    });
};

var editHotelStar = function(id){
	$.post("admin/simplestarmngr/detail",{'id':id},function(res){
		if("success" == res.status){
			$("#starId").val(res.star.id);
			$("#starDetail").val(res.star.starDetail);
			$("#addModal").modal("show");
		}else{
			bootbox.alert("没有查询到相关的详情信息。");
		}
	},"JSON");
};

var delHotelStar =function(id){
	var isOk = confirm("您删除一个星级，删除后无法恢复，点击确定删除。");
	if(isOk){
		$.post("admin/simplestarmngr/delete",{'id':id},function(res){
			if("success" == res.status){
				bootbox.alert("删除成功。");
			}else if('used' == res.status){
				bootbox.alert("已经被使用，无法删除。");
			}else{
				bootbox.alert("您的操作有误，请检查后重试。");
			}
			doSearch();
		},"JSON");
	}
};

var saveStar = function(){
	var isOk = confirm("您确认输入无误，点击确定保存。");
	if(isOk){
		$.post("admin/simplestarmngr/save",$("#modalForm").serialize(),function(res){
			if("success" == res.status){
				$("#addModal").modal("hide");
				bootbox.alert("保存成功。");
			}else if('exists' == res.status){
				bootbox.alert("已经存在相同的星级。");
			}else{
				bootbox.alert("您的输入有误，请检查后重试。");
			}
			doSearch();
		},"JSON");
	}
};


</script>
</html>
