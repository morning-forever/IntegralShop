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
				<li class="active">方位深度游</li>
			</ul>
			<!--.breadcrumb-->
		</div>
		<!--#breadcrumbs-->
		<div class="row-fluid">
			<div class="table-header">方位深度游方位</div>
			<div class="tab-content">
					<table style="margin-left: 5px;" id="btnmenu">
						<tbody>
							<tr>
								<td><a title="添加" href="javascript:openModel('new');"
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
								<th>方位</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</div>
			</div>
		</div>

		<!-- Modal 方位-->
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
								<input type="hidden" id="azimuthId" name="azimuthId" />
								<table class="mytable-detail">
									<tr>
										<th>方位名称：</th>
										<td><input type="text" class="form-control"
											maxlength="20" id="azimuthName" name="azimuthName"
											placeholder="请输入方位名称"></td>
									</tr>
								</table>
							</form>
						</div>
					</div>
				</div>
				<div style="padding: 10px 350px;">
					<button type="button" class="btn btn-primary" id="save-btn"
						onclick="save();">保存</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
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
		//方位
		initMainList();

	});

	//加载方位
	function initMainList() {
		$('#table_report').DataTable({
			"columns" : [ {
				"data" : null
			}, {
				"data" : "azimuth"
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
					var context = {func : [ 
						   {"name" : "编辑","fn" : "openModel(\'" + c.id + "'\)","type" : "purple","icon" : "edit"}, 
						   {"name" : "删除","fn" : "doDelete(\'" + c.id + "'\)","type" : "danger","icon" : "trash"} 
						]};
					var html = template(context);
					return html;
				}
			} ],
			"bDestroy" : true,
			"ajax" : {
				url : "admin/depth/azimuth/list",
				type : "POST"
			}
		});
	}
	
	

	//新增和编辑 方位
	function openModel(flag) {
		//新增
		if (flag == "new") {
			$("#azimuthId").val("");
			$("#azimuthName").val("");
			$("#myModal").modal("show");
		}
		//编辑
		else {
			$.ajax({
				url : "admin/depth/azimuth/edit",
				type : "post",
				data : {
					"id" : flag
				},
				success : function(req) {
					if (req.status == "success") {
						$("#azimuthId").val(req.data.id);
						$("#azimuthName").val(req.data.azimuth);
						$("#myModal").modal("show");
					} else {
						bootbox.alert("服务器异常！");
					}
				}
			});
		}
	}

	//保存 方位
	function save() {
		var azimuthName = $("#azimuthName").val();
		if(azimuthName == null || azimuthName == ''){
			valTips("azimuthName","请输入方位！");
			return;
		}
		
		$.post("admin/depth/azimuth/save",$("#myform").serialize(),function(res){
			if('exists'==res.status){
				valTips('azimuthName', '该方位已存在！');		
			}else if('success'==res.status){
				bootbox.alert("保存成功！",function(){
					$('#table_report').DataTable().clear();
					$('#table_report').DataTable().draw();
				});
				$("#myModal").modal("hide");
			}else{
				bootbox.alert("保存失败！");
			}
			
		},"JSON");
	}

	function doDelete(id) {
		bootbox.confirm("确定要删除吗?", function(result) {
			if (result) {
				$.ajax({
					url : "admin/depth/azimuth/delete",
					post : "post",
					data : {
						"id" : id
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
