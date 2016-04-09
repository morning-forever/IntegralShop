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
				<li class="active">酒店管理</li>
			</ul>
			<!--.breadcrumb-->
		</div>
		<!--#breadcrumbs-->
		<div class="row-fluid">
			<div class="table-header">酒店管理</div>
			<ul class="nav nav-tabs" id="otherInfoTab">
				<li class="active"><a href="#tab_5">酒店位置</a></li>
				<li><a href="#tab_6">酒店具体位置</a></li>
				<li><a href="#tab_1">酒店品牌</a></li>
				<li><a href="#tab_2">酒店星级</a></li>
				<li><a href="#tab_3">酒店主题</a></li>
				<li><a href="#tab_4">酒店价格筛选</a></li>
			</ul>
			<div class="tab-content">
				<!-- 酒店位置 -->
				<div class="tab-pane active" id="tab_5">
					<table style="margin-left: 5px;" id="btnmenu">
						<tbody>
							<tr>
								<td>省：</td>
								<td><span style="margin-top: 7px;" class="input-icon">
										<select id="province" style="width: 110px;">
											<option value="">---请选择---</option>
									</select>
								</span></td>
								<td>市：</td>
								<td><span style="margin-top: 7px;" class="input-icon">
										<select id="city" style="width: 110px;">
											<option value="">---请选择---</option>
									</select>
								</span></td>
								<td>位置：</td>
								<td><select id="loc" style="width: 150px">
										<option value="">---请选择---</option>
								</select></td>
								<td><a title="查询" onclick="" class="btn btn-mini btn-light"
									id="searchBtn5"><i class="icon-search"></i>查询</a></td>
								<td><a title="清空" onclick="" class="btn btn-mini btn-light"
									id="clearBtn5"><i class="icon-search"></i>清空</a></td>
								<td><a title="添加"
									href="javascript:openHotelLocModel('new');"
									class="btn btn-mini btn-success" style="margin-left: 1%"><i
										class="icon-plus"></i>新增</a></td>
							</tr>
						</tbody>
					</table>
					<table id="table_report5"
						class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>序号</th>
								<th>省</th>
								<th>市</th>
								<th>位置</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</div>
				<!-- 酒店具体位置 -->
				<div class="tab-pane" id="tab_6">
					<table style="margin-left: 5px;" id="btnmenu">
						<tbody>
							<tr>
								<td>省：</td>
								<td><span style="margin-top: 7px;" class="input-icon">
										<select id="dprovince" style="width: 110px;">
											<option value="">---请选择---</option>
									</select>
								</span></td>
								<td>市：</td>
								<td><span style="margin-top: 7px;" class="input-icon">
										<select id="dcity" style="width: 110px;">
											<option value="">---请选择---</option>
									</select>
								</span></td>
								<td>位置：</td>
								<td><select id="dloc" style="width: 150px">
										<option value="">---请选择---</option>
								</select></td>
								<td>具体位置：</td>
								<td><select id="dlocDetail" style="width: 150px">
										<option value="">---请选择---</option>
								</select></td>
								<td><a title="查询" onclick="" class="btn btn-mini btn-light"
									id="searchBtn6"><i class="icon-search"></i>查询</a></td>
								<td><a title="清空" onclick="" class="btn btn-mini btn-light"
									id="clearBtn6"><i class="icon-search"></i>清空</a></td>
								<td colspan="6"><a title="添加"
									href="javascript:openHotelLocDetailModel('new');"
									class="btn btn-mini btn-success" style="margin-left: 1%"><i
										class="icon-plus"></i> 新增</a></td>
							</tr>
						</tbody>
					</table>
					<table id="table_report6"
						class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>序号</th>
								<th>省</th>
								<th>市</th>
								<th>位置</th>
								<th>具体位置</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</div>
				<!-- 酒店品牌 -->
				<div class="tab-pane" id="tab_1">
					<table style="margin-left: 5px;" id="btnmenu">
						<tbody>
							<tr>
								<td>酒店品牌：</td>
								<td><select id="sBrandName" style="width: 150px">
										<option value="">--请选择--</option>
										<c:forEach items="${brandList }" var="brand">
											<option value="${brand.id }">${brand.name }</option>
										</c:forEach>
								</select></td>
								<td><a title="查询" onclick="" class="btn btn-mini btn-light"
									id="searchBtn1"><i class="icon-search"></i>查询</a></td>
								<td><a title="添加" href="javascript:openBrandModel('new');"
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
								<th>酒店品牌</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</div>
				<!-- 酒店星级  -->
				<div class="tab-pane" id="tab_2">
					<table style="margin-left: 5px;" id="btnmenu">
						<tbody>
							<tr>
								<td>酒店星级：</td>
								<td><select id="sStarName" style="width: 150px">
										<option value="">--请选择--</option>
										<c:forEach items="${starList }" var="star">
											<option value="${star.id }">${star.starDetail }</option>
										</c:forEach>
								</select></td>
								<td><a title="查询" onclick="" class="btn btn-mini btn-light"
									id="searchBtn2"><i class="icon-search"></i>查询</a></td>
								<td><a title="新增" href="javascript:openStarModel('new');"
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
								<th>酒店星级</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</div>
				<!-- 酒店主题  -->
				<div class="tab-pane" id="tab_3">
					<table style="margin-left: 5px;" id="btnmenu">
						<tbody>
							<tr>
								<td>酒店主题：</td>
								<td><select id="sThemeName" style="width: 150px">
										<option value="">--请选择--</option>
										<c:forEach items="${themeList }" var="star">
											<option value="${theme.id }">${theme.name }</option>
										</c:forEach>
								</select></td>
								<td><a title="查询" onclick="" class="btn btn-mini btn-light"
									id="searchBtn3"><i class="icon-search"></i>查询</a></td>
								<td><a title="新增" href="javascript:openThemeModel('new');"
									class="btn btn-mini btn-success"><i class="icon-plus"></i>
										新增</a></td>
							</tr>
						</tbody>
					</table>
					<table id="table_report3"
						class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>序号</th>
								<th>酒店主题</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</div>
				<!-- 酒店价格筛选  -->
				<div class="tab-pane" id="tab_4">
					<table style="margin-left: 5px;" id="btnmenu">
						<tbody>
							<tr>
								<td>酒店价格：</td>
								<td><select id="sPrice" style="width: 150px">
										<option value="">--请选择--</option>
										<c:forEach items="${priceList }" var="price">
											<option value="${price.id }">${price.depict }</option>
										</c:forEach>
								</select></td>
								<td><a title="查询" onclick="" class="btn btn-mini btn-light"
									id="searchBtn4"><i class="icon-search"></i>查询</a></td>
								<td><a title="新增" href="javascript:openPriceModel('new');"
									class="btn btn-mini btn-success"><i class="icon-plus"></i>
										新增</a></td>
							</tr>
						</tbody>
					</table>
					<table id="table_report4"
						class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>序号</th>
								<th>酒店价格</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</div>
			</div>
		</div>

		<!-- Modal 酒店品牌-->
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
								<input type="hidden" id="brandId" name="brandId" />
								<table class="mytable-detail">
									<tr>
										<th>酒店品牌：</th>
										<td><input type="text" class="form-control"
											maxlength="20" id="brandName" name="brandName"
											placeholder="请输入酒店品牌"></td>
									</tr>
								</table>
							</form>
						</div>
					</div>
				</div>
				<div style="padding: 10px 350px;">
					<button type="button" class="btn btn-primary" id="save-btn"
						onclick="saveBrand();">保存</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>

		<!-- Modal 酒店星级-->
		<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
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
							<form id="myform2">
								<input type="hidden" id="starId" name="starId" />
								<table class="mytable-detail">
									<tr>
										<th>酒店星级：</th>
										<td><input type="text" class="form-control"
											maxlength="20" id="starName" name="starName"
											placeholder="请输入酒店星级"></td>
									</tr>
								</table>
							</form>
						</div>
					</div>
				</div>
				<div style="padding: 10px 350px;">
					<button type="button" class="btn btn-primary" id="save-btn"
						onclick="saveStar();">保存</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>

		<!-- Modal 酒店主题-->
		<div class="modal fade" id="myModal3" tabindex="-1" role="dialog"
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
							<form id="myform3">
								<input type="hidden" id="themeId" name="themeId" />
								<table class="mytable-detail">
									<tr>
										<th>酒店主题：</th>
										<td><input type="text" class="form-control"
											maxlength="20" id="themeName" name="themeName"
											placeholder="请输入酒店主题"></td>
									</tr>
								</table>
							</form>
						</div>
					</div>
				</div>
				<div style="padding: 10px 350px;">
					<button type="button" class="btn btn-primary" id="save-btn"
						onclick="saveTheme();">保存</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>

		<!-- Modal 酒店价格-->
		<div class="modal fade" id="myModal4" tabindex="-1" role="dialog"
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
							<form id="myform4">
								<input type="hidden" id="priceId" name="priceId" /> <input
									type="hidden" id="searchType" name="searchType" value="hotel" />
								<table class="mytable-detail">
									<tr>
										<th>酒店价格从：</th>
										<td><input type="text" class="form-control"
											maxlength="20" id="priceStart" name="priceStart"
											placeholder="酒店价格从"></td>
										<th>至：</th>
										<td><input type="text" class="form-control"
											maxlength="20" id="priceEnd" name="priceEnd" placeholder="至"></td>
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

		<!-- Modal 酒店位置-->
		<div class="modal fade" id="myModal5" tabindex="-1" role="dialog"
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
							<form id="myform5">
								<input type="hidden" id="locId" name="locId" />
								<input type="hidden" name="level" value="1"/>
								<table class="mytable-detail">
									<tr>
										<td>省：</td>
										<td><span style="margin-top: 7px;" class="input-icon">
												<select id="lprovince" name="provinceId"
												style="width: 110px;" notNull="请输入省">
													<option value="">---请选择---</option>
											</select>
										</span></td>

										<td>市：</td>
										<td><span style="margin-top: 7px;" class="input-icon">
												<select id="lcity" name="cityId" style="width: 110px;"
												notNull="请输入市">
													<option value="">---请选择---</option>
											</select>
										</span></td>
									</tr>
									<tr>
										<td>位置：</td>
										<td colspan="4"><input type="text" class="form-control" id="lloc"
											notNull="请输入酒店位置" name="loc" placeholder="请输入酒店位置"></td>
									</tr>
								</table>
							</form>
						</div>
					</div>
				</div>
				<div style="padding: 10px 350px;">
					<button type="button" class="btn btn-primary" id="save-btn"
						onclick="saveHotelLoc();">保存</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>

		<!-- Modal 酒店具体位置-->
		<div class="modal fade" id="myModal6" tabindex="-1" role="dialog"
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
							<form id="myform6">
								<input type="hidden" id="locDetId" name="locDetId" />
								<input type="hidden" name="level" value="2"/>
								<table class="mytable-detail">
									<tr>
										<td>省：</td>
										<td><span style="margin-top: 7px;" class="input-icon">
												<select id="ldprovince" name="provinceId"
												style="width: 110px;" notNull="请输入省">
													<option value="">---请选择---</option>
											</select>
										</span></td>

										<td>市：</td>
										<td><span style="margin-top: 7px;" class="input-icon">
												<select id="ldcity" name="cityId" style="width: 110px;"
												notNull="请输入市">
													<option value="">---请选择---</option>
											</select>
										</span></td>
									</tr>
									<tr>
										<td>位置：</td>
										<td colspan="4"><select id="ldloc" name="locId" style="width: 200px;"
												notNull="请输入酒店位置">
													<option value="">---请选择---</option>
											</select></td>
									</tr>
									<tr>
										<td>具体位置：</td>
										<td colspan="4"><input type="text" class="form-control" id="ldlocDetail"
											notNull="请输入酒店具体位置" name="locDetail" placeholder="请输入酒店具体位置"></td>
									</tr>
								</table>
							</form>
						</div>
					</div>
				</div>
				<div style="padding: 10px 350px;">
					<button type="button" class="btn btn-primary" id="save-btn"
						onclick="saveHotelLocDetail();">保存</button>
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
		$('.mydate-picker').datepicker();

		//酒店品牌
		initBrandList();
		var table1 = $("#table_report1").DataTable();
		$("#searchBtn1").click(function() {
			var brandId = $("#sBrandName").val();

			var json = '{"brandId":"' + brandId + '"}';
			table1.search(json).draw();
		});

		//酒店星级
		initStarList();
		var table2 = $("#table_report2").DataTable();
		$("#searchBtn2").click(function() {
			var starId = $("#sStarName").val();

			var json = '{"starId":"' + starId + '"}';
			table2.search(json).draw();
		});

		//酒店主题
		initThemeList();
		var table3 = $("#table_report3").DataTable();
		$("#searchBtn3").click(function() {
			var themeId = $("#sThemeName").val();

			var json = '{"themeId":"' + themeId + '"}';
			table3.search(json).draw();
		});

		//酒店价格筛选
		initPriceList();

		var table4 = $("#table_report4").DataTable();
		$("#searchBtn4").click(function() {
			var priceId = $("#sPrice").val();

			var json = '{"priceId":"' + priceId + '","searchType":"hotel"}';
			table4.search(json).draw();
		});
		
		initSelects();
		//酒店位置
		initHotelLocList();
		$("#clearBtn5").click(function() {
			$("#tab_5 #btnmenu input,select").val("");
		});

		var table5 = $("#table_report5").DataTable();
		$("#searchBtn5").click(
				function() {
					var json = '{"provinceId":"' + $("#province").val()
							+ '","cityId":"' + $("#city").val()
							+ '","locId":"' + $("#loc").val() + '"}';
					table5.search(json).draw();
				});
		
		//酒店具体位置
		initHotelLocDetailList();
		$("#clearBtn6").click(function() {
			$("#tab_6 #btnmenu input,select").val("");
		});

		var table6 = $("#table_report6").DataTable();
		$("#searchBtn6").click(
				function() {
					var json = '{"provinceId":"' + $("#dprovince").val()
							+ '","cityId":"' + $("#dcity").val()
							+ '","locId":"' + $("#dloc").val() 
							+ '","locDetId":"' + $("#dlocDetail").val() + '"}';
					table6.search(json).draw();
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

	//------------------------酒店品牌--------------------------
	//加载酒店品牌
	function initBrandList() {
		$('#table_report1').DataTable({
			"columns" : [ {
				"data" : null
			}, {
				"data" : "brand_name"
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
							"fn" : "openBrandModel(\'" + c.id + "'\)",
							"type" : "purple",
							"icon" : "edit"
						}, {
							"name" : "删除",
							"fn" : "deleteBrand(\'" + c.id + "'\)",
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
				url : "admin/roamMall/brand/list",
				type : "POST"
			}
		});
	}

	//新增和编辑 酒店品牌
	function openBrandModel(flag) {
		//新增
		if (flag == "new") {
			$("#brandId").val("");
			$("#brandName").val("");
			$("#myModal1").modal("show");
		}
		//编辑
		else {
			$.ajax({
				url : "admin/roamMall/brand/edit",
				type : "post",
				data : {
					"id" : flag
				},
				success : function(req) {
					if (req.status == "success") {
						$("#brandId").val(req.data.id);
						$("#brandName").val(req.data.brand_name);
						$("#myModal1").modal("show");
					} else {
						bootbox.alert("服务器异常！");
					}
				}
			});
		}
	}

	//保存 酒店品牌
	function saveBrand() {
		var brandName = $("#brandName").val();
		if (brandName == null || brandName == '') {
			valTips("brandName", "请输入酒店品牌！");
			return;
		}

		$.post("admin/roamMall/brand/save", $("#myform1").serialize(),
				function(res) {
					if ('exists' == res.status) {
						valTips('brandName', '该酒店品牌已存在！');
					} else if ('success' == res.status) {
						bootbox.alert("保存成功！", function() {
							$("#searchBtn1").click();
						});
						$("#myModal1").modal("hide");
					} else {
						bootbox.alert("保存失败！");
					}

				}, "JSON");
	}

	function deleteBrand(id) {
		bootbox.confirm("确定要删除吗?", function(result) {
			if (result) {
				$.ajax({
					url : "admin/roamMall/brand/delete",
					post : "post",
					data : {
						"id" : id
					},
					success : function(data) {
						if (data.status == "success") {
							bootbox.alert("删除成功！");
							$('#table_report1').DataTable().clear();
							$('#table_report1').DataTable().draw();
						} else {
							bootbox.alert("服务器异常！");
						}
					}

				});
			}
		});
	}

	//------------------------酒店星级------------------------
	//加载酒店星级
	function initStarList() {
		$('#table_report2').DataTable({
			"columns" : [ {
				"data" : null
			}, {
				"data" : "starDetail"
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
							"fn" : "openStarModel(\'" + c.id + "'\)",
							"type" : "purple",
							"icon" : "edit"
						}, {
							"name" : "删除",
							"fn" : "deleteStar(\'" + c.id + "'\)",
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
				url : "admin/roamMall/star/list",
				type : "POST"
			}
		});
	}

	//新增和编辑 酒店星级
	function openStarModel(flag) {
		//新增
		if (flag == "new") {
			$("#starId").val("");
			$("#starName").val("");
			$("#myModal2").modal("show");
		}
		//编辑
		else {
			$.ajax({
				url : "admin/roamMall/star/edit",
				type : "post",
				data : {
					"id" : flag
				},
				success : function(req) {
					if (req.status == "success") {
						$("#starId").val(req.data.id);
						$("#starName").val(req.data.starDetail);
						$("#myModal2").modal("show");
					} else {
						bootbox.alert("服务器异常！");
					}
				}
			});
		}
	}

	//保存 酒店星级
	function saveStar() {
		var starName = $("#starName").val();
		if (starName == null || starName == '') {
			valTips("starName", "请输入酒店星级！");
			return;
		}

		$.post("admin/roamMall/star/save", $("#myform2").serialize(), function(
				res) {
			if ('exists' == res.status) {
				valTips('starName', '该酒店星级已存在！');
			} else if ('success' == res.status) {
				bootbox.alert("保存成功！", function() {
					$("#searchBtn2").click();
				});
				$("#myModal2").modal("hide");
			} else {
				bootbox.alert("保存失败！");
			}

		}, "JSON");
	}

	function deleteStar(id) {
		bootbox.confirm("确定要删除吗?", function(result) {
			if (result) {
				$.ajax({
					url : "admin/roamMall/star/delete",
					post : "post",
					data : {
						"id" : id
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

	//------------------------酒店主题------------------------
	//加载酒店主题
	function initThemeList() {
		$('#table_report3').DataTable({
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
							"fn" : "openThemeModel(\'" + c.id + "'\)",
							"type" : "purple",
							"icon" : "edit"
						}, {
							"name" : "删除",
							"fn" : "deleteTheme(\'" + c.id + "'\)",
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
				url : "admin/roamMall/theme/list",
				type : "POST"
			}
		});
	}

	//新增和编辑 酒店主题
	function openThemeModel(flag) {
		//新增
		if (flag == "new") {
			$("#themeId").val("");
			$("#themeName").val("");
			$("#myModal3").modal("show");
		}
		//编辑
		else {
			$.ajax({
				url : "admin/roamMall/theme/edit",
				type : "post",
				data : {
					"id" : flag
				},
				success : function(req) {
					if (req.status == "success") {
						$("#themeId").val(req.data.id);
						$("#themeName").val(req.data.name);
						$("#myModal3").modal("show");
					} else {
						bootbox.alert("服务器异常！");
					}
				}
			});
		}
	}

	//保存 酒店主题
	function saveTheme() {
		var themeName = $("#themeName").val();
		if (themeName == null || themeName == '') {
			valTips("themeName", "请输入酒店主题！");
			return;
		}

		$.post("admin/roamMall/theme/save", $("#myform3").serialize(),
				function(res) {
					if ('exists' == res.status) {
						valTips('themeName', '该酒店主题已存在！');
					} else if ('success' == res.status) {
						bootbox.alert("保存成功！", function() {
							$("#searchBtn3").click();
						});
						$("#myModal3").modal("hide");
					} else {
						bootbox.alert("保存失败！");
					}

				}, "JSON");
	}

	function deleteTheme(id) {
		bootbox.confirm("确定要删除吗?", function(result) {
			if (result) {
				$.ajax({
					url : "admin/roamMall/theme/delete",
					post : "post",
					data : {
						"id" : id
					},
					success : function(data) {
						if (data.status == "success") {
							bootbox.alert("删除成功！");
							$('#table_report3').DataTable().clear();
							$('#table_report3').DataTable().draw();
						}
					}

				});
			}
		});
	}

	//------------------------------酒店价格-------------------------------
	//加载酒店价格
	function initPriceList() {
		$('#table_report4').DataTable({
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
			"oSearch" : {
				"sSearch" : '{"searchType":"hotel"}'
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
			$("#priceId").val("");
			$("#priceStart").val("");
			$("#priceEnd").val("");
			$("#myModal4").modal("show");
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
						$("#myModal4").modal("show");
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
		if (priceStart == '') {
			valTips("priceStart", "请输入起始价格！");
			return;
		} else {
			if (!/^\d+$/.test(priceStart)) {
				valTips("priceStart", "请输入非负整数！");
				return;
			}
		}
		//结束价格可以为空，如果不为空，则为正整数
		if (priceEnd != '') {
			if (!/^[1-9]\d*$/.test(priceEnd)) {
				valTips("priceEnd", "请输入正整数！");
				return;
			}
		}
		//结束金额不为空时，起始金额不能超过结束金额		
		if (priceStart != '' && priceEnd != '') {
			if (parseInt(priceStart) > parseInt(priceEnd)) {
				valTips("priceEnd", "起始金额不能超过结束金额！");
				return;
			}
		}

		$("#myform4").ajaxSubmit({
			url : "roamMall/price/save",
			type : 'post',
			success : function(req) {
				if (req.status == "success") {
					bootbox.alert("保存成功！");
					$("#myModal4").modal("hide");
					$('#table_report4').DataTable().clear();
					$('#table_report4').DataTable().draw();
				} else if (req.status == 'exists') {
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
						"id" : id
					},
					success : function(data) {
						if (data.status == "success") {
							bootbox.alert("删除成功！");
							$('#table_report4').DataTable().clear();
							$('#table_report4').DataTable().draw();
						}
					}

				});
			}
		});
	}
	//------------------------------酒店位置-------------------------------
	//加载酒店位置
	function initHotelLocList() {
		$('#table_report5').DataTable({
			"columns" : [ {
				"data" : null
			}, {
				"data" : "province"
			}, {
				"data" : "city"
			}, {
				"data" : "loc"
			}, {
				"data" : null
			} ],
			"columnDefs" : [ {
				"targets" : 0,
				render : function(a, b, c, d) {
					return d.row + 1;
				}
			}, {
				"targets" : 4,
				render : function(a, b, c, d) {
					var context = {
						func : [ {
							"name" : "编辑",
							"fn" : "openHotelLocModel(\'" + c.id + "'\)",
							"type" : "purple",
							"icon" : "edit"
						}, {
							"name" : "删除",
							"fn" : "deleteHotelLoc(\'" + c.id + "'\)",
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
				url : "admin/roamMall/hotelLoc/list",
				type : "POST"
			}
		});
	}
	lcityId = 0;
	llocId = 0;
	
	//新增和编辑 酒店位置
	function openHotelLocModel(flag) {
		//新增
		if (flag == "new") {
			$("#locId").val("");
			$("#myModal5").modal("show");
		}
		//编辑
		else {
			$.ajax({
				url : "admin/roamMall/hotelLoc/editLoc",
				type : "post",
				data : {
					"id" : flag
				},
				success : function(res) {
					if (res.status == "success") {
						$("#locId").val(res.data.id);
						$("#lprovince").val(res.data.provinceId);
						lcityId = res.data.cityId;
						$("#lprovince").change();
						$("#lloc").val(res.data.loc);
						$("#myModal5").modal("show"); 
					} else {
						bootbox.alert("服务器异常！");
					}
				}
			});
		}
	}
	//保存 酒店位置
	function saveHotelLoc() {
		var i = 0;
		$("#myform5 [notNull]").each(function() {
			if ($(this).val() == null || $(this).val() == "") {
				valTips(this.id, $(this).attr("notNull"));
				i++;
				return false;
			}
		});
		if (i > 0) {
			return;
		}
		$.post("admin/roamMall/hotelLoc/saveLoc", $("#myform5").serialize(),
				function(res) {
					if ('exists' == res.status) {
						valTips('lloc', '该酒店位置已存在！');
					} else if ('success' == res.status) {
						bootbox.alert("保存成功！", function() {
							$("#searchBtn5").click();
						});
						$("#myModal5").modal("hide");
					} else {
						bootbox.alert("保存失败！");
					}

				}, "JSON");
	}
	function deleteHotelLoc(id) {
		bootbox.confirm("确定要删除吗?", function(result) {
			if (result) {
				$.ajax({
					url : "admin/roamMall/hotelLoc/deleteLoc",
					post : "post",
					data : {
						"id" : id
					},
					success : function(data) {
						if (data.status == "success") {
							bootbox.alert("删除成功！");
							$('#table_report5').DataTable().clear();
							$('#table_report5').DataTable().draw();
						}
					}

				});
			}
		});
	}
	//------------------------------酒店具体位置-------------------------------
	//加载酒店具体位置
	function initHotelLocDetailList() {
		$('#table_report6').DataTable({
			"columns" : [ {
				"data" : null
			}, {
				"data" : "province"
			}, {
				"data" : "city"
			}, {
				"data" : "loc"
			}, {
				"data" : "locDetail"
			}, {
				"data" : null
			} ],
			"columnDefs" : [ {
				"targets" : 0,
				render : function(a, b, c, d) {
					return d.row + 1;
				}
			}, {
				"targets" : 5,
				render : function(a, b, c, d) {
					var context = {
						func : [ {
							"name" : "编辑",
							"fn" : "openHotelLocDetailModel(\'" + c.id + "'\)",
							"type" : "purple",
							"icon" : "edit"
						}, {
							"name" : "删除",
							"fn" : "deleteHotelLocDetail(\'" + c.id + "'\)",
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
				url : "admin/roamMall/hotelLocDet/list",
				type : "POST"
			}
		});
	}
	
	
	
	//新增和编辑 酒店具体位置
	function openHotelLocDetailModel(flag) {
		//新增
		if (flag == "new") {
			$("#locDetId").val("");
			$("#myModal6").modal("show");
		}
		//编辑
		else {
			$.ajax({
				url : "admin/roamMall/hotelLocDet/edit",
				type : "post",
				data : {
					"id" : flag
				},
				success : function(res) {
					if (res.status == "success") {
						$("#locDetId").val(res.data.id);
						$("#ldprovince").val(res.data.provinceId);
						lcityId = res.data.cityId;
						llocId = res.data.locId;
						$("#ldprovince").change();
						$("#ldcity").change();
						$("#ldlocDetail").val(res.data.locDetail);
						$("#myModal6").modal("show"); 
					} else {
						bootbox.alert("服务器异常！");
					}
				}
			});
		}
	}
	//保存 酒店具体位置
	function saveHotelLocDetail() {
		var i = 0;
		$("#myform6 [notNull]").each(function() {
			if ($(this).val() == null || $(this).val() == "") {
				valTips(this.id, $(this).attr("notNull"));
				i++;
				return false;
			}
		});
		if (i > 0) {
			return;
		}
		$.post("admin/roamMall/hotelLocDet/save", $("#myform6").serialize(),
				function(res) {
					if ('exists' == res.status) {
						valTips('ldlocDetail', '该酒店具体位置已存在！');
					} else if ('success' == res.status) {
						bootbox.alert("保存成功！", function() {
							$("#searchBtn6").click();
						});
						$("#myModal6").modal("hide");
					} else {
						bootbox.alert("保存失败！");
					}

				}, "JSON");
	}
	function deleteHotelLocDetail(id) {
		bootbox.confirm("确定要删除吗?", function(result) {
			if (result) {
				$.ajax({
					url : "admin/roamMall/hotelLocDet/delete",
					post : "post",
					data : {
						"id" : id
					},
					success : function(data) {
						if (data.status == "success") {
							bootbox.alert("删除成功！");
							$('#table_report6').DataTable().clear();
							$('#table_report6').DataTable().draw();
						}
					}

				});
			}
		});
	}
	//------------------------------初始化省市区下拉框-------------------------------
	var initSelects = function() {
		//初始化酒店位置 查询条件 省市区
		initProvinceList($("#province"));
		changeProvince($("#province"), $("#city"), $("#loc"));
		changeCity($("#city"),$("#loc"));
		//初始化酒店位置 弹出框 省市区
		initProvinceList($("#lprovince"));
		changeProvince($("#lprovince"),$("#lcity"));
		
		//初始化酒店具体位置 查询条件 省市区
		initProvinceList($("#dprovince"));
		changeProvince($("#dprovince"),$("#dcity"), $("#dloc"));
		changeCity($("#dcity"),$("#dloc"));
		changeLoc($("#dloc"),$("#dlocDetail"));
		//初始化酒店具体位置 弹出框 省市区
		initProvinceList($("#ldprovince"));
		changeProvince($("#ldprovince"),$("#ldcity"),$("#ldloc"));
		changeCity($("#ldcity"), $("#ldloc"));

	};
	//初始化省
	function initProvinceList(proObj) {
		$.post('admin/webcitymngr/provinceList', null, function(res) {
			if (res.status == 'success') {
				proObj.empty();
				proObj.append("<option value=''>---请选择---</option>");
				var list = res.list;
				for ( var i in list) {
					var item = list[i];
					proObj.append("<option value='"+item.id+"'>"
							+ item.province + "</option>");
				}
			}
		}, "JSON");
	};

	//获取市
	function changeProvince(proObj, cityObj, locObj) {
		proObj.change(function() {
			var provinceId = this.value;
			cityObj.empty();
			cityObj.append("<option value=''>---请选择---</option>");
			if(locObj != null){
				locObj.empty();
				locObj.append("<option value=''>---请选择---</option>");
			}
			$.ajax({
				url : 'admin/webcitymngr/cityList',
				post : "post",
				async : false,
				data : {
					'provinceId' : provinceId
				},
				success : function(res) {
					if (res.status == 'success') {
						var list = res.list;
						for ( var i in list) {
							var item = list[i];
							if(lcityId == item.id){
								cityObj.append("<option selected='selected' value='"+item.id+"'>"
										+ item.city + "</option>");
							}else{
								cityObj.append("<option value='"+item.id+"'>"
										+ item.city + "</option>");
							}
						}
						lcityId = 0;
					}
				}
			});
		});
	};
	//获取位置
	function changeCity(cityObj,locObj) {
		cityObj.change(
				function() {
					var cityId = this.value;
					locObj.empty();
					locObj.append("<option value=''>---请选择---</option>");
					$.post('admin/roamMall/hotelLoc/getLoc', {
						'cityId' : cityId
					}, function(res) {
						if (res.status == 'success') {
							var list = res.list;
							for ( var i in list) {
								var item = list[i];
								if(llocId == item.id){
									locObj.append("<option selected='selected' value='"+item.id+"'>"
											+ item.loc + "</option>");
								}else{
									locObj.append("<option value='"+item.id+"'>"
											+ item.loc + "</option>");
								}
							}
							llocId = 0;
						}
					}, "JSON");
				});
	};
	//获取具体位置
	function changeLoc(locObj, locDetObj) {
		locObj.change(
				function() {
					var locId = this.value;
					locDetObj.empty();
					locDetObj.append("<option value=''>---请选择---</option>");
					$.post('admin/roamMall/hotelLocDet/getLocDet', {
						'locId' : locId
					}, function(res) {
						if (res.status == 'success') {
							var list = res.list;
							for ( var i in list) {
								var item = list[i];
								locDetObj.append("<option value='"+item.id+"'>"
										+ item.locDetail + "</option>");
							}
						}
					}, "JSON");
				});
	};
</script>
</html>
