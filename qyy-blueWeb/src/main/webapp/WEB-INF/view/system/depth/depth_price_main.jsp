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
				<li class="active">主题深度游</li>
			</ul>
			<!--.breadcrumb-->
		</div>
		<!--#breadcrumbs-->
		<div class="row-fluid">
			<div class="table-header">主题深度游价格筛选</div>
			<div class="tab-content">
				
				<table style="margin-left: 5px;" id="btnmenu">
					<tbody>
						<tr>
							<td><a title="新增" href="javascript:openPriceModel('new');"
								class="btn btn-mini btn-success"><i class="icon-plus"></i>
									新增</a></td>
						</tr>
					</tbody>
				</table>
				<table id="table_report"
					class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>序号</th>
							<th>主题深度游价格</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
			</div>
		</div>

		<!-- Modal 主题深度游价格-->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
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
							<form id="myform">
								<input type="hidden" id="priceId" name="priceId" />
								<input type="hidden" id="searchType" name="searchType" value="depth"/>
								<table class="mytable-detail">
									<tr>
										<th>深度游价格从：</th>
										<td><input type="text" class="form-control"
											maxlength="20" id="priceStart" name="priceStart"
											placeholder="主题深度游价格从"></td>
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
		
		//主题深度游价格筛选
		initPriceList();
		$('.mydate-picker').datepicker();

		var table = $("#table_report").DataTable();
		$("#searchBtn2").click(function() {
			var priceId = $("#sPrice").val();

			var json = '{"priceId":"' + priceId + '","searchType":"equip"}';
			table.search(json).draw();
		});
	});

	//------------------------------主题深度游价格-------------------------------
	//加载主题深度游价格
	function initPriceList() {
		$('#table_report').DataTable({
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
	        	"sSearch": '{"searchType":"depth"}'
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
			$("#myModal").modal("show");
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
						$("#myModal").modal("show");
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
		
		$("#myform").ajaxSubmit({
			url : "roamMall/price/save",
			type : 'post',
			success : function(req) {
				if (req.status == "success") {
					bootbox.alert("保存成功！");
					$("#myModal").modal("hide");
					$('#table_report').DataTable().clear();
					$('#table_report').DataTable().draw();
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
							$('#table_report').DataTable().clear();
							$('#table_report').DataTable().draw();
						}
					}

				});
			}
		});
	}
</script>
</html>
