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
				<li class="active">快旅出行</li>
			</ul>
			<!--.breadcrumb-->
		</div>
		<!--#breadcrumbs-->
		<div class="row-fluid">
			<div class="table-header">车辆价格筛选</div>
			<ul class="nav nav-tabs" id="otherInfoTab">
				<li class="active"><a href="#tab_1">租车价格筛选</a></li>
				<li><a href="#tab_2">包车价格筛选</a></li>
			</ul>
			<div class="tab-content">
				<!-- 租车价格筛选 -->
				<div class="tab-pane active" id="tab_1">
					<table style="margin-left: 5px;" id="btnmenu">
						<tbody>
							<tr>
								<td><a title="新增" onclick="openPriceModel('new','1')"
									href="javascript:;" target="mainFrame"
									class="btn btn-mini btn-info"><i class="icon-plus"></i> 新增</a>
									<a title="删除" onclick="doDeletes('1')" href="javascript:;"
									class="btn btn-mini btn-info"><i class="icon-trash"></i> 删除</a>
									</td>
							</tr>
						</tbody>
					</table>
					<table id="table_report1"
						class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th><label><input type='checkbox' id="tableCheckbox1" /><span
									class="lbl"></span></label>&nbsp;序号</th>
								<th>租车价格</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</div>
				<!-- 包车价格筛选  -->
				<div class="tab-pane" id="tab_2">
					<table style="margin-left: 5px;" id="btnmenu">
						<tbody>
							<tr>
								<td><a title="新增" onclick="openPriceModel('new','2')"
									href="javascript:;" target="mainFrame"
									class="btn btn-mini btn-info"><i class="icon-plus"></i> 新增</a>
									<a title="删除" onclick="doDeletes('2')" href="javascript:;"
									class="btn btn-mini btn-info"><i class="icon-trash"></i> 删除</a>
									</td>
							</tr>
						</tbody>
					</table>
					<table id="table_report2"
						class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th><label><input type='checkbox' id="tableCheckbox2" /><span
									class="lbl"></span></label>&nbsp;序号</th>
								<th>包车价格</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</div>
			</div>
		</div>

		<!-- Modal 租车价格筛选-->
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
								<input type="hidden" id="priceId1" name="priceId" />
								<input type="hidden" id="searchType" name="searchType" value="car_rent"/>
								<table class="mytable-detail">
									<tr>
										<th>包车价格从：</th>
										<td><input type="text" class="form-control"
											maxlength="20" id="priceStart1" name="priceStart"
											placeholder="包车价格从"></td>
										<th>至：</th>
										<td><input type="text" class="form-control"
											maxlength="20" id="priceEnd1" name="priceEnd"
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
						onclick="savePrice('1');">保存</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
		
		<!-- Modal 包车价格-->
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
								<input type="hidden" id="priceId2" name="priceId" />
								<input type="hidden" id="searchType" name="searchType" value="car_wrap"/>
								<table class="mytable-detail">
									<tr>
										<th>包车价格从：</th>
										<td><input type="text" class="form-control"
											maxlength="20" id="priceStart2" name="priceStart"
											placeholder="包车价格从"></td>
										<th>至：</th>
										<td><input type="text" class="form-control"
											maxlength="20" id="priceEnd2" name="priceEnd"
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
						onclick="savePrice('2');">保存</button>
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
		
		initRentPriceList();
		initWrapPriceList();
		
		//全选
		$("#tableCheckbox1").click(function() {
			var flag = this.checked;
			$("#table_report1 input[flag=row]").each(function() {
				this.checked = flag;
			});
		});
		
		//全选
		$("#tableCheckbox2").click(function() {
			var flag = this.checked;
			$("#table_report2 input[flag=row]").each(function() {
				this.checked = flag;
			});
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

	//加载租车价格
	function initRentPriceList() {
		$('#table_report1').DataTable({
			"columns" : [ {
				"data" : null
			}, {
				"data" : "depict"
			}, {
				"data" : null
			} ],
			"columnDefs" : [ {
				"targets" : 0,
				render : function(data, type, row, meta) {
					var str = "<label><input type='checkbox'  flag='row' value='"+row.id+"' /><span class='lbl'></span></label>&nbsp;";
					return str + (meta.row + 1);
				}
			}, {
				"targets" : 2,
				render : function(a, b, c, d) {
					var context = {
						func : [ {
							"name" : "编辑",
							"fn" : "openPriceModel(\'" + c.id + "'\,'1')",
							"type" : "purple",
							"icon" : "edit"
						}, {
							"name" : "删除",
							"fn" : "deletePrice(\'" + c.id + "'\,'1')",
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
	        	"sSearch": '{"searchType":"car_rent"}'
	        },
			"ajax" : {
				url : "roamMall/price/list",
				type : "POST"
			}
		});
	}
	
	//加载包车价格
	function initWrapPriceList() {
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
				render : function(data, type, row, meta) {
					var str = "<label><input type='checkbox'  flag='row' value='"+row.id+"' /><span class='lbl'></span></label>&nbsp;";
					return str + (meta.row + 1);
				}
			}, {
				"targets" : 2,
				render : function(a, b, c, d) {
					var context = {
						func : [ {
							"name" : "编辑",
							"fn" : "openPriceModel(\'" + c.id + "'\,'2')",
							"type" : "purple",
							"icon" : "edit"
						}, {
							"name" : "删除",
							"fn" : "deletePrice(\'" + c.id + "'\,'2')",
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
	        	"sSearch": '{"searchType":"car_wrap"}'
	        },
			"ajax" : {
				url : "roamMall/price/list",
				type : "POST"
			}
		});
	}
	
	//新增和编辑 租车和包车价格
	function openPriceModel(flag,i) {
		//新增
		if (flag == "new") {
			$("#priceId"+i).val("");
			$("#priceStart"+i).val("");
			$("#priceEnd"+i).val("");
			$("#myModal"+i).modal("show");
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
						$("#priceId"+i).val(req.data.id);
						$("#priceStart"+i).val(req.data.priceStart);
						$("#priceEnd"+i).val(req.data.priceEnd);
						$("#myModal"+i).modal("show");
					} else {
						bootbox.alert("服务器异常！");
					}
				}
			});
		}
	}

	//保存 租车和包车价格
	function savePrice(i) {
		var priceStart = $("#priceStart"+i).val();
		var priceEnd = $("#priceEnd"+i).val();
		
		//起始价格不能为空，且为非负整数
		if(priceStart == ''){
			valTips("priceStart"+i,"请输入起始价格！");
			return;
		}else{
			if(!/^\d+$/.test(priceStart)){
				valTips("priceStart"+i,"请输入非负整数！");
				return;	
			}
		}
		//结束价格可以为空，如果不为空，则为正整数
		if(priceEnd != ''){
			if(!/^[1-9]\d*$/.test(priceEnd)){
				valTips("priceEnd"+i,"请输入正整数！");
				return;	
			}
		}
		//结束金额不为空时，起始金额不能超过结束金额		
		if(priceStart != '' && priceEnd != ''){
			if(parseInt(priceStart) > parseInt(priceEnd)){
				valTips("priceEnd"+i,"起始金额不能超过结束金额！");
				return;	
			}
		}
		//表单提交
		$("#myform"+i).ajaxSubmit({
			url : "roamMall/price/save",
			type : 'post',
			success : function(req) {
				if (req.status == "success") {
					bootbox.alert("保存成功！");
					$("#myModal"+i).modal("hide");
					$('#table_report'+i).DataTable().clear();
					$('#table_report'+i).DataTable().draw();
				}else if(req.status == 'exists'){
					valTips('priceEnd'+i, '该价格区间已存在！');		
				}
			}
		});
	}
	
	//删除 租车和包车价格
	function deletePrice(id,i) {
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
							$('#table_report'+i).DataTable().clear();
							$('#table_report'+i).DataTable().draw();
						}
					}

				});
			}
		});
	}
	
	//多个删除
	function doDeletes(i) {
		var idStr = "";
		$("#table_report"+i+" input[flag=row]").each(function() {
			if (this.checked) {
				idStr += this.value + ",";
			}
		});
		if(idStr == ""){
			bootbox.alert("请先选择需要操作的数据");
			return ;
		}
		bootbox.confirm("确定要删除选中的数据么?", function(result) {
			if (result) {
				$.post('roamMall/price/delete', {
					"ids" : idStr.substr(0, idStr.length - 1)
				}, function(res) {
					if (res.status == 'success') {
						bootbox.alert("删除成功！");
						$('#table_report'+i).DataTable().clear();
						$('#table_report'+i).DataTable().draw();
					}
				}, "JSON");
			}
		});
	}

</script>
</html>
