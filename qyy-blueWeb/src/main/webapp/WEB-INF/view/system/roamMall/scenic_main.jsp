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
				<li class="active">景区管理</li>
			</ul>
			<!--.breadcrumb-->
		</div>
		<!--#breadcrumbs-->
		<div class="row-fluid">
			<div class="table-header">景区管理</div>
			<ul class="nav nav-tabs" id="otherInfoTab">
				<li class="active"><a href="#tab_1">景区目的地</a></li>
				<li><a href="#tab_2">景区价格筛选</a></li>
			</ul>
			<div class="tab-content">
				<!-- 景区目的地 -->
				<div class="tab-pane active" id="tab_1">
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
								<td>景区目的地：</td>
								<td><select id="dest" style="width: 150px">
										<option value="">---请选择---</option>
								</select></td>
								<td><a title="查询" onclick="" class="btn btn-mini btn-light"
									id="searchBtn1"><i class="icon-search"></i>查询</a></td>
								<td><a title="清空" onclick="" class="btn btn-mini btn-light"
									id="clearBtn"><i class="icon-search"></i>清空</a></td>
								<td><a title="添加" href="javascript:openScenicModel('new');"
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
								<th>省</th>
								<th>市</th>
								<th>景区目的地</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</div>
				<!-- 景区价格筛选  -->
				<div class="tab-pane" id="tab_2">
					<table style="margin-left: 5px;" id="btnmenu">
						<tbody>
							<tr>
								<td>景区价格：</td>
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
								<th>景区价格</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</div>
			</div>
		</div>

		<!-- Modal 景区目的地-->
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
								<input type="hidden" id="scenicId" name="scenicId" />
								<table class="mytable-detail">
									<tr>
										<td>省：</td>
										<td><span style="margin-top: 7px;" class="input-icon">
												<select id="eprovince" name="provinceId" style="width: 110px;" notNull="请输入省">
													<option value="">---请选择---</option>
											</select>
										</span></td>

										<td>市：</td>
										<td><span style="margin-top: 7px;" class="input-icon">
												<select id="ecity" name="cityId" style="width: 110px;" notNull="请输入市">
													<option value="">---请选择---</option>
											</select>
										</span></td>
									</tr>
									<tr>
										<td>景区目的地：</td>
										<td colspan="4"><input type="text" class="form-control" id="edest" notNull="请输入景区目的地"
											name="destination" placeholder="请输入景区目的地"></td>
									</tr>
								</table>
							</form>
						</div>
					</div>
				</div>
				<div style="padding: 10px 350px;">
					<button type="button" class="btn btn-primary" id="save-btn"
						onclick="saveScenic();">保存</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>

		<!-- Modal 景区价格-->
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
								<input type="hidden" id="priceId" name="priceId" /> <input
									type="hidden" id="searchType" name="searchType" value="scenic" />
								<table class="mytable-detail">
									<tr>
										<th>景区价格从：</th>
										<td><input type="text" class="form-control"
											maxlength="20" id="priceStart" name="priceStart"
											placeholder="景区价格从"></td>
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

	$(document).ready(
			function() {
				//景区目的地
				initScenicList();
				initSelects();
				$('.mydate-picker').datepicker();

				//清空
				$("#clearBtn").click(function() {
					$("#btnmenu input,select").val("");
				});

				var table1 = $("#table_report1").DataTable();
				$("#searchBtn1").click(
						function() {
							var json = '{"provinceId":"' + $("#province").val()
									+ '","cityId":"' + $("#city").val()
									+ '","destId":"' + $("#dest").val() + '"}';
							table1.search(json).draw();
						});

				//景区价格筛选
				initPriceList();
				$('.mydate-picker').datepicker();

				var table2 = $("#table_report2").DataTable();
				$("#searchBtn2").click(
						function() {
							var priceId = $("#sPrice").val();

							var json = '{"priceId":"' + priceId
									+ '","searchType":"scenic"}';
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

	//加载景区目的地
	function initScenicList() {
		$('#table_report1').DataTable({
			"columns" : [ {
				"data" : null
			}, {
				"data" : "province"
			}, {
				"data" : "city"
			}, {
				"data" : "destination"
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
							"fn" : "openScenicModel(\'" + c.id + "'\)",
							"type" : "purple",
							"icon" : "edit"
						}, {
							"name" : "删除",
							"fn" : "deleteScenic(\'" + c.id + "'\)",
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
				url : "admin/roamMall/scenic/list",
				type : "POST"
			}
		});
	}
	
	var ecityId = 0;
	var ecountyId = 0;

	//新增和编辑 景区目的地
	function openScenicModel(flag) {
		//新增
		if (flag == "new") {
			$("#scenicId").val("");
			$("#myModal1").modal("show");
		}
		//编辑
		else {
			$.ajax({
				url : "admin/roamMall/scenic/edit",
				type : "post",
				async: false,
				data : {
					"id" : flag
				},
				success : function(res) {
					if (res.status == "success") {
						$("#scenicId").val(res.data.id);
						$("#eprovince").val(res.data.provinceId);
						ecityId = res.data.cityId;
						ecountyId = res.data.countyId;
						$("#eprovince").change();
						$("#ecity").change();
						$("#edest").val(res.data.destination);
						$("#myModal1").modal("show"); 
					} else {
						bootbox.alert("服务器异常！");
					}
				}
			});
		}
	}

	//保存 景区目的地
	function saveScenic() {
		var i = 0;
		$("#myform1 [notNull]").each(function(){
			if($(this).val() == null || $(this).val() == ""){
				valTips(this.id, $(this).attr("notNull"));
				i++;
				return false;
			}
		});
		if(i > 0){
			return ;
		}
		$.post("admin/roamMall/scenic/save", $("#myform1").serialize(),
				function(res) {
					if ('exists' == res.status) {
						valTips('edest', '该景区目的地已存在！');
					} else if ('success' == res.status) {
						bootbox.alert("保存成功！", function() {
							$("#searchBtn1").click();
						});
						$("#myModal1").modal("hide");
						$('#table_report1').DataTable().clear();
						$('#table_report1').DataTable().draw();
					} else {
						bootbox.alert("保存失败！");
					}

				}, "JSON");
	}

	function deleteScenic(id) {
		bootbox.confirm("确定要删除吗?", function(result) {
			if (result) {
				$.ajax({
					url : "admin/roamMall/scenic/delete",
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

	//------------------------------景区价格-------------------------------
	//加载景区价格
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
			"oSearch" : {
				"sSearch" : '{"searchType":"scenic"}'
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
	//--------------------------初始化省市区-----------------------
	var initSelects = function() {
		initProvinceList();
		changeProvince();
		changeCounty();
		
		initProvinceList2();
		changeProvince2();
	};
	//初始化省
	var initProvinceList = function() {
		var province = $("#province");
		$.post('admin/webcitymngr/provinceList', null, function(res) {
			if (res.status == 'success') {
				province.empty();
				province.append("<option value=''>---请选择---</option>");
				var list = res.list;
				for ( var i in list) {
					var item = list[i];
					province.append("<option value='"+item.id+"'>"
							+ item.province + "</option>");
				}
			}
		}, "JSON");
	};

	//获取市
	var changeProvince = function() {
		$("#province").change(
				function() {
					var provinceId = this.value;
					var city = $("#city");
					city.empty();
					city.append("<option value=''>---请选择---</option>");
					var county = $("#county");
					county.empty();
					county.append("<option value=''>---请选择---</option>");
					$.post('admin/webcitymngr/cityList', {
						'provinceId' : provinceId
					}, function(res) {
						if (res.status == 'success') {
							var list = res.list;
							for ( var i in list) {
								var item = list[i];
								city.append("<option value='"+item.id+"'>"
										+ item.city + "</option>");
								
							}
						}
					}, "JSON");
				});
	};
	//获取目的地
	var changeCounty = function() {
		$("#city").change(
				function() {
					var cityId = this.value;
					var dest = $("#dest");
					dest.empty();
					dest.append("<option value=''>---请选择---</option>");
					$.post('admin/roamMall/scenic/getDest', {
						'cityId' : cityId
					}, function(res) {
						if (res.status == 'success') {
							var list = res.list;
							for ( var i in list) {
								var item = list[i];
								dest.append("<option value='"+item.id+"'>"
										+ item.destination + "</option>");
							}
						}
					}, "JSON");
				});
	};
	
	//初始化省2
	var initProvinceList2 = function() {
		var province = $("#eprovince");
		$.post('admin/webcitymngr/provinceList', null, function(res) {
			if (res.status == 'success') {
				province.empty();
				province.append("<option value=''>---请选择---</option>");
				var list = res.list;
				for ( var i in list) {
					var item = list[i];
					province.append("<option value='"+item.id+"'>"
							+ item.province + "</option>");
				}
			}
		}, "JSON");
	};

	//获取市2
	var changeProvince2 = function() {
		$("#eprovince").change(
				function() {
					var provinceId = this.value;
					var city = $("#ecity");
					city.empty();
					city.append("<option value=''>---请选择---</option>");
					var county = $("#ecounty");
					county.empty();
					county.append("<option value=''>---请选择---</option>");
					$.post('admin/webcitymngr/cityList', {
						'provinceId' : provinceId
					}, function(res) {
						if (res.status == 'success') {
							var list = res.list;
							for ( var i in list) {
								var item = list[i];
								if(ecityId == item.id){
									city.append("<option selected='selected' value='"+item.id+"'>"
											+ item.city + "</option>");
								}else{
									city.append("<option value='"+item.id+"'>"
											+ item.city + "</option>");
								}
								
							}
						}
					}, "JSON");
				});
	};

</script>
</html>
