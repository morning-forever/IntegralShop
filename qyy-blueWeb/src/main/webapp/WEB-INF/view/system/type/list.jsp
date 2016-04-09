<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
				<li><i class="icon-home"></i> <a href="javascript:;">当前</a><span class="divider"><i class="icon-angle-right"></i></span></li>
				<li class="active">商品信息</li>
			</ul>
			<!--.breadcrumb-->
		</div>
		<!--#breadcrumbs-->
		<div class="table-header">车辆类型</div>
		<ul class="nav nav-tabs" id="otherInfoTab">
			<li class="active"><a href="#tab_1">快旅租车</a></li>
			<li><a href="#tab_2">快旅包车</a></li>
			<li><a href="#tab_3">快旅班车</a></li>
		</ul>
		<div class="tab-content">
			<!-- 租车类型 -->
			<div class="tab-pane active" id="tab_1">
				<div class="row-fluid">
					<!-- <h3 class="header smaller lighter blue">会员管理</h3> -->
					<form action="" id="table_rent_search">
						<table style="margin-left: 5px;" id="btnmenu">
							<tbody>
								<tr>
									<td>类型：</td>
									<td><input name="brandName" id="brandName"></td>
									<td><a title="查询" onclick="" class="btn btn-mini btn-success searchBtn" searchForm="table_rent"><i class="icon-search"></i>查询</a></td>
								</tr>
								<tr>
									<td colspan="5">
									<a title="新增类型" onclick="openAddType('rent')" href="javascript:;" class="btn btn-mini btn-info"><i class="icon-plus"></i> 新增类型</a>
									<a title="删除" onclick="doDeletes('rent')" href="javascript:;" class="btn btn-mini btn-info"><i class="icon-trash"></i> 删除</a>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
					<table id="table_rent" class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th class='center' style="width: 50px">
									<label><input type='checkbox' class="tableCheckbox"   searchForm="table_rent" /><span class="lbl"></span></label></th>
								<th>ID</th>
								<th>类型</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</div>
			</div>
			
			<!-- 包车类型 -->
			<div class="tab-pane active" id="tab_2">
				<div class="row-fluid">
					<!-- <h3 class="header smaller lighter blue">会员管理</h3> -->
					<form action="" id="table_wrap_search">
						<table style="margin-left: 5px;" id="btnmenu">
							<tbody>
								<tr>
									<td>类型：</td>
									<td><input name="brandName" id="brandName"></td>
									<td><a title="查询" onclick="" class="btn btn-mini btn-success searchBtn" searchForm="table_wrap"><i class="icon-search"></i>查询</a></td>
								</tr>
								<tr>
									<td colspan="5">
									<a title="新增类型" onclick="openAddType('wrap')" href="javascript:;" class="btn btn-mini btn-info"><i class="icon-plus"></i> 新增类型</a> 
									<a title="删除" onclick="doDeletes('wrap')" href="javascript:;" class="btn btn-mini btn-info"><i class="icon-trash"></i> 删除</a></td>
								</tr>
							</tbody>
						</table>
					</form>
					<table id="table_wrap" class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th class='center' style="width: 50px"><label><input type='checkbox' searchForm="table_wrap" class="tableCheckbox"  /><span class="lbl"></span></label></th>
								<th>ID</th>
								<th>类型</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</div>
			</div>
			
			<!-- 班车类型 -->
			<div class="tab-pane active" id="tab_3">
				<div class="row-fluid">
					<!-- <h3 class="header smaller lighter blue">会员管理</h3> -->
					<form action="" id="table_bus_search">
						<table style="margin-left: 5px;" id="btnmenu">
							<tbody>
								<tr>
									<td>类型：</td>
									<td><input name="brandName" id="brandName"></td>
									<td><a title="查询" onclick="" class="btn btn-mini btn-success searchBtn" searchForm="table_bus"><i class="icon-search"></i>查询</a></td>
								</tr>
								<tr>
									<td colspan="5">
									<a title="新增类型" onclick="openAddType('bus')" href="javascript:;" class="btn btn-mini btn-info"><i class="icon-plus"></i> 新增类型</a> 
									<a title="删除" onclick="doDeletes('bus')" href="javascript:;" class="btn btn-mini btn-info"><i class="icon-trash"></i> 删除</a></td>
								</tr>
							</tbody>
						</table>
					</form>
					<table id="table_bus" class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th class='center' style="width: 50px"><label><input type='checkbox' searchForm="table_bus" class="tableCheckbox" /><span class="lbl"></span></label></th>
								<th>ID</th>
								<th>类型</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- #main-content -->
	<!-- 新增车系 -->
	<div class="modal fade" id="addTypeModal" tabindex="-1" role="dialog" aria-labelledby="addBrandModalLabel" aria-hidden="true" style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times; </span>
					</button>
				</div>
				<input type="hidden" name="TypeId" id="TypeId">
				<input type="hidden" name="typeType" id="typeType"><!-- 车辆类型所属的不同车系类型，包车，租车，班车等 -->
				<div class="modal-body">
					<div class="form-group">
						<table style="margin-left: 5px;" id="btnmenu">
							<tr>
								<td>类型:<input name="addTypeName" id="addTypeName"></td>
								<td><a title="保存" onclick="submitType()" href="javascript:;" class="btn btn-mini btn-info"><i class="icon-success"></i> 保存</a></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
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

		$('#otherInfoTab a:first').tab('show');//初始化显示哪个tab
		$('#otherInfoTab a').click(function(e) {
			e.preventDefault();//阻止a链接的跳转行为
			$(this).tab('show');//显示当前选中的链接及关联的content
		})

		$('.mydate-picker').datepicker();

		initMainList('rent');
		initMainList('wrap');
		initMainList('bus');
		
		$('#otherInfoTab a').click();
		$('#otherInfoTab a:first').click();

		var table = $("#table_rent").DataTable();

		$(".searchBtn").click(function() {
			//List列表ID和按钮的searchForm的Id相同，
			//搜索输入框Form的Id为在列表Id后加_search
			var id=$(this).attr("searchForm");
			var json=formToJson(id+"_search");
			$("#"+id).DataTable().search(json).draw();
		});


		$('.table-bordered').on('click', 'td', function() {
			//$(this).find("input[flag=row]").click();
			if ($(this).find("input[flag=row]").length == 0) {
				$(this).parent("tr").find("input[flag=row]").click();
			}
		});

		$(".tableCheckbox").click(function() {
			var id=$(this).attr("searchForm");
			var flag = this.checked;
			$("#"+id+" input[flag=row]").each(function() {
				this.checked = flag;
			});
		});

		$("#addBrandModal").modal("hide");
	});


	function openAddType(type) {
		$("#addTypeName").val("");
		$("#typeType").val(type);
		$("#TypeId").val("");
		$("#addTypeModal").modal("show");
	}
	
	function doEdit(id,name,type) {
		$("#addTypeName").val(name);
		$("#typeType").val(type);
		$("#TypeId").val(id);
		$("#addTypeModal").modal("show");
	}

	function submitType() {
		var addTypeName = $("#addTypeName").val();
		var typeType = $("#typeType").val();
		var id=$("#TypeId").val();
		var data = {};
		data.addTypeName = addTypeName;
		data.typeType = typeType;
		data.id = id;
		$.post("admin/type/submitType", data, function(result) {
			if (result.status == 'success') {
				$("#addTypeModal").modal("hide");
				bootbox.alert("保存成功", function() {
					$("#table_"+typeType+"_search .searchBtn").click();
				});
			} else {
				bootbox.alert("服务器忙，请稍后再试");
			}
		})
	}


	function doDelete(id,type) {
		bootbox.confirm("确定要删除该车辆类型么?", function(result) {
			if (result) {
				$.ajax({
					url : "admin/type/deletes",
					post : "post",
					data : {
						"ids" : id
					},
					success : function(data) {
						if (data.status == "success") {
							bootbox.alert("删除成功！",function(){
								$("#table_"+type+"_search .searchBtn").click();
							});
						}
					}

				});
			}
		});
	}

	function doDeletes(type) {
		var idStr = "";
		$("#table_"+type+"_search input[flag=row]").each(function() {
			if (this.checked) {
				idStr += this.value + ",";
			}
		});
		if(idStr==""){
			bootbox.alert("请选择需要删除的车辆类型");
			return;
		}
		bootbox.confirm("确定要删除选中的车辆类型么?", function(result) {
			if (result) {
				$.ajax({
					url : "admin/type/deletes",
					post : "post",
					data : {
						"ids" : idStr
					},
					success : function(data) {
						if (data.status == "success") {
							bootbox.alert("删除成功！",function(){
								$("#table_"+type+"_search .searchBtn").click();
							});
						}else{
							bootbox.alert("删除成功！");
						}
					}

				});
			}
		});
	}

	function initMainList(type) {
		var id = '#table_' + type;
		$(id).DataTable({
			"columns" : [ {
				"data" : null
			},//0
			{
				"data" : "id"
			},//1
			{
				"data" : "car_type"
			},//2
			{
				"data" : null
			} //3
			],
			"columnDefs" : [ {
				"targets" : 0,
				render : function(data, type, row) {
					var str = "<label><input type='checkbox'  flag='row' value='"+row.id+"' /><span class='lbl'></span></label>";
					return str;
				}
			}, {
				"targets" : 3,
				render : function(data, rowType, row, d) {
					var context = {
						func : [ {
							"name" : "编辑",
							"fn" : "doEdit(\'"+row.id+"\',\'" + row.car_type + "\',\'"+type+"\')",
							"type" : "purple",
							"icon" : "edit"
						}, {
							"name" : "删除",
							"fn" : "doDelete(\'" + row.id + "\',\'"+type+"\')",
							"type" : "danger",
							"icon" : "trash"
						} ]
					};
					var html = template(context);
					return html;
				}
			} ],
			fnInitComplete : function() {
				$(id).DataTable().column(1).visible(false);//隐藏ID行
			},
			"bDestroy" : true,
			"ajax" : {
				url : "admin/type/data?type=" + type,
				type : "POST"
			}
		});
	}

	
	
	function formToJson(id){
		var json = '{';
		var valueArr = $("#"+id).serialize().split("&");
		for (var i = 0; i < valueArr.length; i++) {
			var valueItem = valueArr[i].split("=");
			if (valueItem[1] != '' && valueItem[1] != null) {
				if (i != 0) {
					json += ',';
				}
				var value = $("#"+id+" [name=" + valueItem[0] + "]").val();
				json += '"' + valueItem[0] + '":"' + value + '"';
			}
		}
		json += '}';
		return json;
	}

	/**
	 * 将毫秒的时间转成时间字符串
	 * @param mmSecond
	 * @param length
	 * @returns {String}
	 */
	var getTimeTxt = function(mmSecond, length) {
		var t = new Date(mmSecond);
		var r = t.getFullYear() + "-";
		r += (t.getMonth() + 1 >= 10 ? t.getMonth() + 1 : "0" + (t.getMonth() + 1));
		r += "-" + (t.getDate() >= 10 ? t.getDate() : "0" + t.getDate());
		if (length == 10) {
			return r;
		}
		r += " " + (t.getHours() >= 10 ? t.getHours() : "0" + t.getHours());
		r += ":" + (t.getMinutes() >= 10 ? t.getMinutes() : "0" + t.getMinutes());

		if (length == 16) {
			return r;
		}

		r += ":" + (t.getSeconds() >= 10 ? t.getSeconds() : "0" + t.getSeconds());
		if (length == 19) {
			return r;
		}
	}
</script>
</html>
