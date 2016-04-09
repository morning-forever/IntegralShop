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
				<li class="active">装备管理</li>
			</ul>
			<!--.breadcrumb-->
		</div>
		<!--#breadcrumbs-->
		<div class="row-fluid">
			<div class="table-header">装备管理</div>
			<ul class="nav nav-tabs" id="otherInfoTab">
				<li class="active"><a href="#tab_1">装备分类</a></li>
				<li><a href="#tab_2">装备价格筛选</a></li>
			</ul>
			<div class="tab-content">
				<!-- 装备分类 -->
				<div class="tab-pane active" id="tab_1">
					<table style="margin-left: 5px;" id="btnmenu">
						<tbody>
							<tr>
								<td>分类名称：</td>
								<td><select id="sEquipName" style="width: 150px">
										<option value="">--请选择--</option>
										<c:forEach items="${equipList }" var="equip">
											<option value="${equip.id }">${equip.name }</option>
										</c:forEach>
								</select></td>
								<td><a title="查询" onclick="" class="btn btn-mini btn-light"
									id="searchBtn1"><i class="icon-search"></i>查询</a></td>
								<td><a title="添加" href="javascript:openEquipModel('new');"
									class="btn btn-mini btn-success"><i class="icon-plus"></i>
										新增</a></td>
							</tr>
						</tbody>
					</table>
					<table id="table_report1"
						class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>序号</th>
								<th>装备分类</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</div>
				<!-- 装备价格筛选  -->
				<div class="tab-pane" id="tab_2">
					<table style="margin-left: 5px;" id="btnmenu">
						<tbody>
							<tr>
								<td>装备价格：</td>
								<td><select id="sPrice" style="width: 150px">
										<option value="">--请选择--</option>
										<c:forEach items="${priceList }" var="price">
											<option value="${price.id }">${price.depict }</option>
										</c:forEach>
								</select></td>
								<td><a title="查询" onclick="" class="btn btn-mini btn-light"
									id="searchBtn2"><i class="icon-search"></i>查询</a></td>
								<td><a title="新增" href="javascript:openPriceModel('new');"
									class="btn btn-mini btn-success"><i class="icon-plus"></i>
										新增</a></td>
							</tr>
						</tbody>
					</table>
					<table id="table_report2"
						class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>序号</th>
								<th>装备价格</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</div>
			</div>
		</div>

		<!-- Modal 装备分类-->
		<div class="modal fade" id="myModal1" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true"
			style="display: none;">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div>
							<form id="myform1">
								<input type="hidden" id="equipId" name="equipId" />
								<table class="mytable-detail">
									<tr>
										<th>分类名称：</th>
										<td><input type="text" class="form-control"
											maxlength="20" id="equipName" name="equipName"
											placeholder="请输入分类名称"></td>
									</tr>
								</table>
							</form>
						</div>
					</div>
				</div>
				<div style="padding: 10px 350px;">
					<button type="button" class="btn btn-primary" id="save-btn"
						onclick="saveEquip();">保存</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
		
		<!-- Modal 装备价格-->
		<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
			aria-labelledby="myModal2Label" aria-hidden="true"
			style="display: none;">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div>
							<form id="myform2">
								<input type="hidden" id="priceId" name="priceId" />
								<input type="hidden" id="searchType" name="searchType" value="equip"/>
								<table class="mytable-detail">
									<tr>
										<th>装备价格从：</th>
										<td><input type="text" class="form-control"
											maxlength="20" id="priceStart" name="priceStart"
											placeholder="装备价格从"></td>
										<th>至：</th>
										<td><input type="text" class="form-control"
											maxlength="20" id="priceEnd" name="priceEnd"
											placeholder="至"></td>	
										<td>(可不填，表示无限大)</td>
									</tr>
								</table>
							</form>
						</div>
					</div>
				</div>
				<div style="padding: 10px 350px;">
					<button type="button" class="btn btn-primary" id="save-btn"
						onclick="savePrice();">保存</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	<!-- #main-content -->
	<%@ include file="/static/foot.jsp"%>
</body>
<script type="text/javascript" src="static/js/jquery.form.js"></script>
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
		//装备分类
		initEquipList();
		$('.mydate-picker').datepicker();

		var table1 = $("#table_report1").DataTable();
		$("#searchBtn1").click(function() {
			var equipId = $("#sEquipName").val();

			var json = '{"equipId":"' + equipId + '"}';
			table1.search(json).draw();
		});
		
		//装备价格筛选
		initPriceList();
		$('.mydate-picker').datepicker();

		var table2 = $("#table_report2").DataTable();
		$("#searchBtn2").click(function() {
			var priceId = $("#sPrice").val();

			var json = '{"priceId":"' + priceId + '","searchType":"equip"}';
			table2.search(json).draw();
		});
	});

	//tab页
	$(function() {
		$('#otherInfoTab a:first').tab('show');//初始化显示哪个tab

		$('#otherInfoTab a').click(function(e) {
			e.preventDefault();//阻止a链接的跳转行为
			$(this).tab('show');//显示当前选中的链接及关联的content
		})
	})

	//加载装备分类
	function initEquipList() {
		$('#table_report1').DataTable({
			"columns" : [ {
				"data" : null
			}, {
				"data" : "name"
			}, {
				"data" : null
			} ],
			"columnDefs" : [ {
				"targets" : 0,
				render : function(a, b, c, d) {
					return d.row + 1;
				}
			}, {
				"targets" : 2,
				render : function(a, b, c, d) {
					var context = {
						func : [ {
							"name" : "编辑",
							"fn" : "openEquipModel(\'" + c.id + "'\)",
							"type" : "purple",
							"icon" : "edit"
						}, {
							"name" : "删除",
							"fn" : "deleteEquip(\'" + c.id + "'\)",
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
				url : "admin/roamMall/equip/list",
				type : "POST"
			}
		});
	}
	
	

	//新增和编辑 装备分类
	function openEquipModel(flag) {
		//新增
		if (flag == "new") {
			$("#equipName").val("");
			$("#myModal1").modal("show");
		}
		//编辑
		else {
			$.ajax({
				url : "admin/roamMall/equip/edit",
				type : "post",
				data : {
					"id" : flag
				},
				success : function(req) {
					if (req.status == "success") {
						$("#equipId").val(req.data.id);
						$("#equipName").val(req.data.name);
						$("#myModal1").modal("show");
					} else {
						bootbox.alert("服务器异常！");
					}
				}
			});
		}
	}

	//保存 装备分类
	function saveEquip() {
		var equipName = $("#equipName").val();
		if(equipName == null || equipName == ''){
			valTips("equipName","请输入装备分类！");
			return;
		}
		
		$.post("admin/roamMall/equip/save",$("#myform1").serialize(),function(res){
			if('exists'==res.status){
				valTips('equipName', '该装备分类已存在！');		
			}else if('success'==res.status){
				bootbox.alert("保存成功！",function(){
					$("#searchBtn1").click();
				});
				$("#myModal1").modal("hide");
			}else{
				bootbox.alert("保存失败！");
			}
			
		},"JSON");
	}

	function deleteEquip(id) {
		bootbox.confirm("确定要删除吗?", function(result) {
			if (result) {
				$.ajax({
					url : "admin/roamMall/equip/delete",
					post : "post",
					data : {
						"id" : id
					},
					success : function(data) {
						if (data.status == "success") {
							bootbox.alert("删除成功！");
							$('#table_report1').DataTable().clear();
							$('#table_report1').DataTable().draw();
						}
					}

				});
			}
		});
	}
	
	//------------------------------装备价格-------------------------------
	//加载装备价格
	function initPriceList() {
		$('#table_report2').DataTable({
			"columns" : [ {
				"data" : null
			}, {
				"data" : "depict"
			}, {
				"data" : null
			} ],
			"columnDefs" : [ {
				"targets" : 0,
				render : function(a, b, c, d) {
					return d.row + 1;
				}
			}, {
				"targets" : 2,
				render : function(a, b, c, d) {
					var context = {
						func : [ {
							"name" : "编辑",
							"fn" : "openPriceModel(\'" + c.id + "'\)",
							"type" : "purple",
							"icon" : "edit"
						}, {
							"name" : "删除",
							"fn" : "deletePrice(\'" + c.id + "'\)",
							"type" : "danger",
							"icon" : "trash"
						} ]
					};
					var html = template(context);
					return html;
				}
			} ],
			"bDestroy" : true,
			"oSearch": {
	        	"sSearch": '{"searchType":"equip"}'
	        },
			"ajax" : {
				url : "roamMall/price/list",
				type : "POST"
			}
		});
	}
	
	//新增和编辑 价格筛选
	function openPriceModel(flag) {
		//新增
		if (flag == "new") {
			$("#priceStart").val("");
			$("#priceEnd").val("");
			$("#myModal2").modal("show");
		}
		//编辑
		else {
			$.ajax({
				url : "roamMall/price/edit",
				type : "post",
				data : {
					"id" : flag
				},
				success : function(req) {
					if (req.status == "success") {
						$("#priceId").val(req.data.id);
						$("#priceStart").val(req.data.priceStart);
						$("#priceEnd").val(req.data.priceEnd);
						$("#myModal2").modal("show");
					} else {
						bootbox.alert("服务器异常！");
					}
				}
			});
		}
	}

	//保存 价格筛选
	function savePrice() {
		var priceStart = $("#priceStart").val();
		var priceEnd = $("#priceEnd").val();
		
		//起始价格不能为空，且为非负整数
		if(priceStart == ''){
			valTips("priceStart","请输入起始价格！");
			return;
		}else{
			if(!/^\d+$/.test(priceStart)){
				valTips("priceStart","请输入非负整数！");
				return;	
			}
		}
		//结束价格可以为空，如果不为空，则为正整数
		if(priceEnd != ''){
			if(!/^[1-9]\d*$/.test(priceEnd)){
				valTips("priceEnd","请输入正整数！");
				return;	
			}
		}
		//结束金额不为空时，起始金额不能超过结束金额		
		if(priceStart != '' && priceEnd != ''){
			if(parseInt(priceStart) > parseInt(priceEnd)){
				valTips("priceEnd","起始金额不能超过结束金额！");
				return;	
			}
		}
		
		$("#myform2").ajaxSubmit({
			url : "roamMall/price/save",
			type : 'post',
			success : function(req) {
				if (req.status == "success") {
					bootbox.alert("保存成功！");
					$("#myModal2").modal("hide");
					$('#table_report2').DataTable().clear();
					$('#table_report2').DataTable().draw();
				}else if(req.status == 'exists'){
					valTips('priceEnd', '该价格区间已存在！');		
				}
			}
		});
	}
	
	function deletePrice(id) {
		bootbox.confirm("确定要删除吗?", function(result) {
			if (result) {
				$.ajax({
					url : "roamMall/price/delete",
					post : "post",
					data : {
						"ids" : id
					},
					success : function(data) {
						if (data.status == "success") {
							bootbox.alert("删除成功！");
							$('#table_report2').DataTable().clear();
							$('#table_report2').DataTable().draw();
						}
					}

				});
			}
		});
	}
</script>
</html>
