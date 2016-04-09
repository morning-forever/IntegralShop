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
</style>
<body>
	<div class="container-fluid" id="main-container">
		<div id="breadcrumbs">
			<ul class="breadcrumb">
				<li><i class="icon-home"></i> <a
					href="javascript:alert('index');">当前</a><span class="divider"><i
						class="icon-angle-right"></i></span></li>
				<li class="active">车辆管理</li>
			</ul>
			<!--.breadcrumb-->
		</div>
		<!--#breadcrumbs-->

		<div class="row-fluid">
			<div class="table-header">车辆及路线</div>
			<ul class="nav nav-tabs" id="otherInfoTab">
				<li><a href="admin/cart/rent/listPage">租车车辆信息</a></li>
				<li class="active"><a href="admin/cart/wrap/main">包车车辆信息</a></li>
				<li><a href="admin/cart/bus/main">班车车辆信息及路线</a></li>
				<li><a href="admin/cart/carpool/main">拼车路线</a></li>
			</ul>
			<div class="tab-content">
				<div id="searchDiv">
					<table style="margin-left: 5px;" id="btnmenu">
						<tbody>
							<tr>
								<td>车辆品牌：</td>
								<td><select id="brandId" style="width: 100px" onchange="getSys()">
										<option value="">全部</option>
										<c:forEach items="${brandList }" var="brand">
											<option value="${brand.id }">${brand.brand }</option>
										</c:forEach>
								</select></td>
								<td>车系：</td>
								<td><select id="sysId" style="width: 100px">
										<option value="">全部</option>
								</select></td>
								<td>座位数：</td>
								<td><select id="seating" style="width: 100px">
										<option value="">全部</option>
										<c:forEach items="${seatingList }" var="seat">
											<option value="${seat.seating }">${seat.seating }</option>
										</c:forEach>
								</select></td>
								<td>日均价：</td>
								<td><span style="margin-top: 7px;" class="input-icon">
										<input type="text" class="mysearch" id="price"> <i
										class="icon-search"></i>
								</span></td>
								<td><a title="查询" onclick=""
									class="btn btn-mini btn-success" id="searchBtn"><i
										class="icon-search"></i>查询</a></td>
							</tr>
							<tr>
								<td colspan="5"><a title="新增" onclick=""
									href="admin/cart/wrap/edit/0" target="mainFrame"
									class="btn btn-mini btn-info"><i class="icon-plus"></i> 新增</a>
									<a title="上架" onclick="onOffLine(0)" href="javascript:;"
									class="btn btn-mini btn-info"><i class="icon-check"></i> 上架</a>
									<a title="下架" onclick="onOffLine(1)" href="javascript:;"
									class="btn btn-mini btn-info"><i class="icon-check-empty"></i>
										下架</a> <a title="删除" onclick="doDeletes()" href="javascript:;"
									class="btn btn-mini btn-info"><i class="icon-trash"></i> 删除</a>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<table id="table_report"
					class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th><label><input type='checkbox' id="tableCheckbox" /><span
									class="lbl"></span></label>&nbsp;序号</th>
							<th>图片</th>
							<th>品牌</th>
							<th>车系</th>
							<th>年代</th>
							<th>座位数</th>
							<th>数量</th>
							<th>日均价</th>
							<th style="width: 56px">上架状态</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
			</div>
		</div>
	</div>
	<!-- #main-content -->
	<%@ include file="/static/foot.jsp"%>
</body>
<script type="text/javascript" src="static/js/jquery.form.js"></script>
<script type="text/javascript" src="static/js/daterangepicker.min.js"></script>
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

	$(document).ready(function() {

		initMainList();
		$('.mydate-picker').datepicker();
		//查询
		var table = $("#table_report").DataTable();
		$("#searchBtn").click(function() {
			var json = '{';
			$("#searchDiv select,input").each(function() {
				json += '"' + this.id + '":"' + $(this).val() + '",';
			});
			json = json.substr(0, json.length - 1);
			json += '}';
			console.info(json);
			table.search(json).draw();
		});

		//getSys();

		//全选
		$("#tableCheckbox").click(function() {
			var flag = this.checked;
			$("input[flag=row]").each(function() {
				this.checked = flag;
			});
		});
	});

	/*tab页*/
	$(function() {
		$('#otherInfoTab a:eq(1)').tab('show');//初始化显示哪个tab

		/* $('#otherInfoTab a').click(function(e) {
			e.preventDefault();//阻止a链接的跳转行为
			$(this).tab('show');//显示当前选中的链接及关联的content
		}) */

	});

	//初始化列表
	function initMainList() {
		$('#table_report')
				.DataTable(
						{
							"columns" : [ {
								"data" : null
							}, {
								"data" : "url"
							}, {
								"data" : "brand"
							}, {
								"data" : "sys"
							}, {
								"data" : "year"
							}, {
								"data" : "seating"
							}, {
								"data" : "counts"
							}, {
								"data" : "price"
							}, {
								"data" : "is_shelves"
							}, {
								"data" : null
							} ],
							"columnDefs" : [
									{
										"targets" : 0,
										render : function(data, type, row, meta) {
											var str = "<label><input type='checkbox'  flag='row' value='"+row.id+"' /><span class='lbl'></span></label>&nbsp;";
											return str + (meta.row + 1);
										}
									},
									{
										"targets" : 1,
										render : function(data, type, row) {
											return '<img src="'+data+'" width="50" height="50">';
										}
									},
									{
										"targets" : 8,
										render : function(data, type, row) {
											var str = "";
											if (data == 0) {
												str = "上架";
											} else if (data == 1) {
												str = "下架";
											} else {
												str = "-";
											}
											return str;
										}
									},
									{
										"targets" : 9,
										render : function(data, type, row, d) {
											var context = {
												func : [
														{
															"name" : "编辑",
															"fn" : "doEdit(\'"
																	+ row.id
																	+ "\')",
															"type" : "purple",
															"icon" : "edit"
														},
														{
															"name" : "删除",
															"fn" : "doDelete(\'"
																	+ row.id
																	+ "\')",
															"type" : "danger",
															"icon" : "trash"
														} ]
											};
											var html = template(context);
											return html;
										}
									} ],
							"bDestroy" : true,
							"ajax" : {
								url : "admin/cart/wrap/list",
								type : "POST"
							}
						});
	}

	//根据品牌获取车系
	function getSys(sysid) {
		var brandId = $("#brandId").val();
		var sys = $("#sysId");
		sys.empty();
		sys.append("<option value=''>全部</option>");
		$.post(
			'admin/cart/wrap/getSys',
			{
				'brandId' : brandId
			},
			function(res) {
				if (res.status == 'success') {
					var list = res.list;
					for ( var i in list) {
						var item = list[i];
						if (sysid == item.id) {
							sys.append("<option value='"+item.id+"' selected='selected'>"
											+ item.sys
											+ "</option>");
						} else {
							sys.append("<option value='"+item.id+"'>"
											+ item.sys
											+ "</option>");
						}
					}
				}
			}, "JSON");
	};

	//删除
	function doDelete(id) {
		bootbox.confirm("确定要删除该商品么?", function(result) {
			if (result) {
				$.post('admin/cart/wrap/delete', {
					"ids" : id
				}, function(res) {
					if (res.status == 'success') {
						bootbox.alert("删除成功！");
						$('#table_report').DataTable().clear();
						$('#table_report').DataTable().draw();
					}
				}, "JSON");
			}
		});
	}

	//多个删除
	function doDeletes() {
		var idStr = "";
		$("input[flag=row]").each(function() {
			if (this.checked) {
				idStr += this.value + ",";
			}
		});
		if(idStr == ""){
			bootbox.alert("请先选择需要操作的数据");
			return ;
		}
		bootbox.confirm("确定要删除选中的商品么?", function(result) {
			if (result) {
				$.post('admin/cart/wrap/delete', {
					"ids" : idStr.substr(0, idStr.length - 1)
				}, function(res) {
					if (res.status == 'success') {
						bootbox.alert("删除成功！");
						$('#table_report').DataTable().clear();
						$('#table_report').DataTable().draw();
					}
				}, "JSON");
			}
		});
	}

	//上架和下架
	function onOffLine(is_shelves) {
		var idStr = "";
		$("input[flag=row]").each(function() {
			if (this.checked) {
				idStr += this.value + ",";
			}
		});
		if(idStr == ""){
			bootbox.alert("请先选择需要操作的数据");
			return ;
		}
		var mes = "";
		if (is_shelves == 0) {
			mes = "上架";
		} else if (is_shelves == 1) {
			mes = "下架";
		}
		bootbox.confirm("确定要" + mes + "选中的商品么?", function(result) {
			if (result) {
				$.post('admin/cart/wrap/onOffLine', {
					"is_shelves" : is_shelves,
					"ids" : idStr.substr(0, idStr.length - 1)
				}, function(res) {
					if (res.status == 'success') {
						bootbox.alert(mes + "成功！");
						$('#table_report').DataTable().clear();
						$('#table_report').DataTable().draw();
					}
				}, "JSON");
			}
		});
	}

	//编辑
	function doEdit(id) {
		window.location.href = "admin/cart/wrap/edit/" + id;
	}

</script>
</html>
