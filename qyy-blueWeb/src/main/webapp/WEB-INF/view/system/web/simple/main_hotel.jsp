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
			酒店管理
		</div>
		<table style="margin-left: 5px;" id="btnmenu">
			<tbody>
				<tr>
					<td>
						酒店名称：
					</td>
					<td>
						<span style="margin-top: 7px;" class="input-icon">
							<input  type="text" placeholder="请输入酒店名称" class="mysearch" data-cmd="1" id="hotelName">
							<i class="icon-search"></i>
						</span>
					</td>
				
					<td>
						所在地：
					</td>
					<td>
						<span style="margin-top: 7px;" class="input-icon">
							<select id="city" style="width: 110px;">
								<option value="">---请选择---</option>
								<c:forEach items="${cityList }" var="city">
								<option value="${city.id }">${city.name }</option>
								</c:forEach>
							</select>
						</span>
					</td>
					
					<td>
						酒店类型：
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
						<a title="新增酒店" href="javascript:;" class="btn btn-mini btn-success" id="addHotelBtn"><i class="icon-pencil"></i> 新增</a>
					</td>
					<td>
						<a title="星级管理" href="javascript:;" class="btn btn-mini btn-info" id="goStarBtn"><i class="icon-pencil"></i> 星级管理</a>
					</td>
				</tr>
			</tbody>
		</table>
		<table id="table_report" class="table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th>序号</th>
					<th>酒店名称</th>
					<th>所在地</th>
					<th>具体地址</th>
					<th>住宿费(元/间)</th>
					<th>酒店星级</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody></tbody> 
		</table>
	</div>
</div>
<!-- #main-content -->

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
		/* var data = data|{};
		data = {
			"nickname" : $("#nickname").val(),
			"phone": $("#phone").val(),
			"email": $("#email").val(),
			"isBan": $("#isBan").val()
		} */		
		var json = '{"starId":"'+$("#star").val()+'","hotelName":"'+$("#hotelName").val()+'","addrId":"'+$("#city").val()+'"}';
    	table.search(json).draw();
	});
	//新增
	$("#addHotelBtn").click(function(){
		window.location.href="admin/simplehotelmngr/toAdd";
	});
	
	$("#goStarBtn").click(function(){
		window.location.href="admin/simplestarmngr/main";
	});
});

var initList = function(){
	$('#table_report').DataTable( {
		"bDestroy": true,
        "ajax": {
        	url:"admin/simplehotelmngr/list",	
        	type: "POST"
        },
		"columns": [
            { "data": null },
            { "data": "names" },
            { "data": "name" },
            { "data": "addrDetail" },
            { "data": "prices" },
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
 	            "targets": 6,
 	            render: function (a, b, c, d) {
 	            	var context =
 	                {
 	                    func: [
 	                        {"name": "编辑", "fn": "editHotel(\'" + c.id + "\')", "type": "purple", "icon":"edit"},
 	                        {"name": "删除", "fn": "delHotel(\'" + c.id + "\')", "type": "danger", "icon":"trash"}
 	                    ]
 	                };
 	                var html = template(context);
 	            	return html;
           		}
  	        }
   		]
    });
}

var editHotel = function(id){
	window.location.href="admin/simplehotelmngr/detail?id="+id;
};

var delHotel =function(id){
	$.post('admin/simplehotelmngr/delete',{"id":id},function(res){
		if(res.status == 'success'){
			bootbox.alert("删除成功");
		}else if(res.status == 'used'){
			bootbox.alert("此酒店已经被使用了，不能被删除");
		}else{
			bootbox.alert("删除失败，请稍后重试");
		}
		$("#searchBtn").click();
	},"JSON");
};


</script>
</html>
