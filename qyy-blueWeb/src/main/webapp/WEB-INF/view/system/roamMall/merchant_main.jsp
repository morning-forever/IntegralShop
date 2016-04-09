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
				<li class="active">商户管理</li>
			</ul>
			<!--.breadcrumb-->
		</div>
		<!--#breadcrumbs-->
		<div class="row-fluid">
			<div class="table-header">商户信息</div>
			<ul class="nav nav-tabs" id="otherInfoTab">
				<li class="active"><a href="#tab_1">景区</a></li>
				<li><a href="#tab_2">酒店</a></li>
				<li><a href="#tab_3">餐饮</a></li>
				<li><a href="#tab_4">装备</a></li>
			</ul>
			<input type="hidden" id="tab" value="${tab }">
			<div class="tab-content">
				<table style="margin-left: 5px;" id="btnmenu">
					<tbody>
						<tr>
							<td>商家名称：</td>
							<td><span style="margin-top: 7px;" class="input-icon">
									<input type="text" placeholder="这里输入商家名称" class="mysearch"
									id="sUsername"> <i class="icon-search"></i>
							</span></td>
							<td>联系电话：</td>
							<td><span style="margin-top: 7px;" class="input-icon">
									<input type="text" placeholder="这里输入联系电话" class="mysearch"
									id="sLinkPhone"> <i class="icon-search"></i>
							</span></td>
							<td>商家地址：</td>
							<td><span style="margin-top: 7px;" class="input-icon">
									<input type="text" placeholder="这里输入商家地址" class="mysearch"
									id="sAddrDetail"> <i class="icon-search"></i>
							</span></td>
							<td><a title="查询" onclick="" class="btn btn-mini btn-light"
								id="searchBtn"><i class="icon-search"></i>查询</a></td>
							<td><a title="清空" onclick="" class="btn btn-mini btn-light"
								id="clearBtn"><i class="icon-search"></i>清空</a></td>
						</tr>
					</tbody>
				</table>
				<!-- 景区 -->
				<div class="tab-pane active" id="tab_1">
					<table id="table_report1"
						class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>序号</th>
								<th>商家名称</th>
								<th>商家地址</th>
								<th>联系人</th>
								<th>商家电话</th>
								<th>联系人电话</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</div>
				<!-- 酒店  -->
				<div class="tab-pane" id="tab_2">
					<table id="table_report2"
						class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>序号</th>
								<th>商家名称</th>
								<th>品牌</th>
								<th>星级</th>
								<th>主题</th>
								<th>商家地址</th>
								<th>联系人</th>
								<th>商家电话</th>
								<th>联系人电话</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</div>
				<!-- 餐饮  -->
				<div class="tab-pane" id="tab_3">
					<table id="table_report3"
						class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>序号</th>
								<th>商家名称</th>
								<th>餐饮分类</th>
								<th>商家地址</th>
								<th>联系人</th>
								<th>商家电话</th>
								<th>联系人电话</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</div>
				<!-- 装备  -->
				<div class="tab-pane" id="tab_4">
					<table id="table_report4"
						class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>序号</th>
								<th>商家名称</th>
								<th>装备分类</th>
								<th>商家地址</th>
								<th>联系人</th>
								<th>商家电话</th>
								<th>联系人电话</th>
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

				initScenicList();//景区
				initHotelList();//酒店
				initCaterList();//餐饮
				initEquipList();//装备
				$('.mydate-picker').datepicker();

				//查询
				$("#searchBtn").click(
						function() {
							var username = $("#sUsername").val();
							var linkPhone = $("#sLinkPhone").val();
							var addrDetail = $("#sAddrDetail").val();

							var json = '{"username":"' + username
									+ '","linkPhone":"' + linkPhone + '"'
									+ ',"addrDetail":"' + addrDetail + '"}';
							var searchTab = $("#tab").val();
							$("#table_report"+searchTab).DataTable().search(json).draw();
						});

				//清空
				$("#clearBtn").click(function() {
					$("#btnmenu input,select").val("");
				});

			});

	//tab页
	$(function() {
		var tab = "${tab}";
		$('#otherInfoTab a:eq('+tab+')').tab('show');//初始化显示哪个tab

		$('#otherInfoTab a').click(function(e) {
			e.preventDefault();//阻止a链接的跳转行为
			$(this).tab('show');//显示当前选中的链接及关联的content
			$("#tab").val($(this).attr("href").substr(5,1));
		});
		
	})

	//------------------------------景区-------------------------------
	//加载景区
	function initScenicList() {
		$('#table_report1').DataTable({
			"columns" : [ {
				"data" : null
			}, {
				"data" : "username"
			}, {
				"data" : "addr_detail"
			}, {
				"data" : "link_name"
			}, {
				"data" : "link_merch_tel"
			}, {
				"data" : "link_phone"
			}, {
				"data" : null
			} ],
			"columnDefs" : [ {
				"targets" : 0,
				render : function(a, b, c, d) {
					return d.row + 1;
				}
			}, {
				"targets" : 6,
				render : function(a, b, c, d) {
					var context = {
						func : [ {
							"name" : "查看详情",
							"fn" : "queryDetail(\'" + c.id + "\','1')",
							"type" : "light",
							"icon" : "eye-open"
						}, {
							"name" : "删除",
							"fn" : "deleteFn(\'" + c.id + "\','1')",
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
				url : "admin/roamMall/merchant/list?merchType=1",
				type : "POST"
			}
		});
	}

	//------------------------------酒店-------------------------------
	//加载酒店
	function initHotelList() {
		$('#table_report2').DataTable({
			"columns" : [ {
				"data" : null
			}, {
				"data" : "username"
			}, {
				"data" : "brand_name"
			}, {
				"data" : "star_name"
			}, {
				"data" : "theme_name"
			}, {
				"data" : "addr_detail"
			}, {
				"data" : "link_name"
			}, {
				"data" : "link_merch_tel"
			}, {
				"data" : "link_phone"
			}, {
				"data" : null
			} ],
			"columnDefs" : [ {
				"targets" : 0,
				render : function(a, b, c, d) {
					return d.row + 1;
				}
			}, {
				"targets" : 9,
				render : function(a, b, c, d) {
					var context = {
						func : [ {
							"name" : "查看详情",
							"fn" : "queryDetail(\'" + c.id + "\','2')",
							"type" : "light",
							"icon" : "eye-open"
						} , {
							"name" : "删除",
							"fn" : "deleteFn(\'" + c.id + "\','2')",
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
				url : "admin/roamMall/merchant/list?merchType=2",
				type : "POST"
			}
		});
	}

	//------------------------------餐饮-------------------------------
	//加载餐饮
	function initCaterList() {
		$('#table_report3').DataTable({
			"columns" : [ {
				"data" : null
			}, {
				"data" : "username"
			}, {
				"data" : "cater_name"
			}, {
				"data" : "addr_detail"
			}, {
				"data" : "link_name"
			}, {
				"data" : "link_merch_tel"
			}, {
				"data" : "link_phone"
			}, {
				"data" : null
			} ],
			"columnDefs" : [ {
				"targets" : 0,
				render : function(a, b, c, d) {
					return d.row + 1;
				}
			}, {
				"targets" : 7,
				render : function(a, b, c, d) {
					var context = {
						func : [ {
							"name" : "查看详情",
							"fn" : "queryDetail(\'" + c.id + "\','3')",
							"type" : "light",
							"icon" : "eye-open"
						} , {
							"name" : "删除",
							"fn" : "deleteFn(\'" + c.id + "\','3')",
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
				url : "admin/roamMall/merchant/list?merchType=3",
				type : "POST"
			}
		});
	}

	//------------------------------装备-------------------------------
	//加载装备
	function initEquipList() {
		$('#table_report4').DataTable({
			"columns" : [ {
				"data" : null
			}, {
				"data" : "username"
			}, {
				"data" : "equip_name"
			}, {
				"data" : "addr_detail"
			}, {
				"data" : "link_name"
			}, {
				"data" : "link_merch_tel"
			}, {
				"data" : "link_phone"
			}, {
				"data" : null
			} ],
			"columnDefs" : [ {
				"targets" : 0,
				render : function(a, b, c, d) {
					return d.row + 1;
				}
			}, {
				"targets" : 7,
				render : function(a, b, c, d) {
					var context = {
						func : [ {
							"name" : "查看详情",
							"fn" : "queryDetail(\'" + c.id + "\','4')",
							"type" : "light",
							"icon" : "eye-open"
						} , {
							"name" : "删除",
							"fn" : "deleteFn(\'" + c.id + "\','4')",
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
				url : "admin/roamMall/merchant/list?merchType=4",
				type : "POST"
			}
		});
	}

	//查看详情
	function queryDetail(id, merchType) {
		window.location.href = "admin/roamMall/merchant/detail?id=" + id
				+ "&merchType=" + merchType;
	}
	
	//物理删除
	function deleteFn(id,i) {
		bootbox.confirm("确定要删除该商户么?", function(result) {
			if (result) {
				$.post('admin/roamMall/merchant/delete', {
					"id" : id
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
