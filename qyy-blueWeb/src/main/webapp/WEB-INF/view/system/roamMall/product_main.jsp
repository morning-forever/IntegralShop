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
				<li class="active">商品管理</li>
			</ul>
			<!--.breadcrumb-->
		</div>
		<!--#breadcrumbs-->
		<div class="row-fluid">
			<div class="table-header">商品管理</div>
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
							<td id="createTimeTh">时间：</td>
							<td id="createTimeCt"><span style="margin-top: 7px;"
								class="input-icon"> <input id=sCreateTime " type="text"
									class="mydate-picker" readonly="readonly"
									data-date-format="yyyy-mm-dd"> <i class="icon-calendar"></i>
							</span></td>
							<td>商家名称：</td>
							<td><span style="margin-top: 7px;" class="input-icon">
									<input type="text" placeholder="这里输入商家名称" class="mysearch"
									id="sUsername"> <i class="icon-search"></i>
							</span></td>
							<td>商品ID：</td>
							<td><span style="margin-top: 7px;" class="input-icon">
									<input type="text" placeholder="这里输入商家ID" class="mysearch"
									id="sProductNo"> <i class="icon-search"></i>
							</span></td>
							<td>商品名称：</td>
							<td><span style="margin-top: 7px;" class="input-icon">
									<input type="text" placeholder="这里输入商品名称" class="mysearch"
									id="sTitle"> <i class="icon-search"></i>
							</span></td>
							<td>上架状态：</td>
							<td><select id="sIsShelves" style="width: 150px">
									<option value="">全部</option>
									<option value="0">上架</option>
									<option value="1">下架</option>
							</select></td>
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
								<th>商户名称</th>
								<th>商品ID</th>
								<th>商品标题</th>
								<th>商品原价</th>
								<th>商品现价</th>
								<th>销量</th>
								<th>销量数量</th>
								<th>上架状态</th>
								<th>订购券</th>
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
								<th>商户名称</th>
								<th>商品ID</th>
								<th>商品标题</th>
								<th>房型</th>
								<th>房间数量</th>
								<th>商品原价</th>
								<th>商品现价</th>
								<th>销量</th>
								<th>上架状态</th>
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
								<th>商户名称</th>
								<th>商品ID</th>
								<th>商品标题</th>
								<th>套餐</th>
								<th>商品原价</th>
								<th>商品现价</th>
								<th>销量</th>
								<th>上架状态</th>
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
								<th>商户名称</th>
								<th>商品ID</th>
								<th>商品标题</th>
								<th>规格</th>
								<th>商品原价</th>
								<th>商品现价</th>
								<th>数量</th>
								<th>销量</th>
								<th>上架状态</th>
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
						var createTime = $("#sCreateTime").val();
						var username = $("#sUsername").val();
						var productNo = $("#sProductNo").val();
						var title = $("#sTitle").val();
						var isShelves = $("#sIsShelves").val();
	
						var json = '{"createTime":"' + createTime
								+ '","username":"' + username
								+ '","productNo":"' + productNo + '"'
								+ ',"title":"' + title + '","isShelves":"'
								+ isShelves + '"}';
						var searchTab = $("#tab").val();
						$("#table_report"+searchTab).DataTable().search(json).draw();
				});
				
				//清空
				$("#clearBtn").click(function(){
					$("#btnmenu input,select").val("");
				});

			});

	//tab页
	$(function() {
		var tab = "${tab}";
		$('#otherInfoTab a:eq('+tab+')').tab('show');//初始化显示哪个tab
		$("#createTimeTh").hide();
		$("#createTimeCt").hide();

		$('#otherInfoTab a').click(function(e) {
			e.preventDefault();//阻止a链接的跳转行为
			$(this).tab('show');//显示当前选中的链接及关联的content
			if ($(this).attr("href") == "#tab_1") {
				$("#createTimeTh").hide();
				$("#createTimeCt").hide();
			} else {
				$("#createTimeTh").show();
				$("#createTimeCt").show();
			}
			$("#tab").val($(this).attr("href").substr(5,1));
		})
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
				"data" : "number"
			}, {
				"data" : "title"
			}, {
				"data" : "original_price"
			}, {
				"data" : "current_price"
			}, {
				"data" : "sales_volume"
			}, {
				"data" : "used_volume"
			}, {
				"data" : null
			}, {
				"data" : null
			}, {
				"data" : null
			} ],
			"columnDefs" : [ {
				"targets" : 0,
				render : function(a, b, c, d) {
					return d.row + 1;
				}
			}, {
				"targets" : 8,
				render : function(a, b, c, d) {
					var name = "-";
					if (c.is_shelves == 0) {
						name = "<span style='color:green'>上架</span>";
					}
					if (c.is_shelves == 1) {
						name = "下架";
					}
					return name;
				}
			}, {
				"targets" : 9,
				render : function(a, b, c, d) {
					var context = {
						func : [ {
							"name" : "查看订购券",
							"fn" : "toCoupon(\'" + c.id + "\')",
							"type" : "light",
							"icon" : "eye-open"
						} ]
					};
					var html = template(context);
					return html;
				}
			}, {
				"targets" : 10,
				render : function(a, b, c, d) {
					var context = {
						func : [ {
							"name" : "查看详情",
							"fn" : "queryDetail(\'" + c.id + "\','scenic')",
							"type" : "light",
							"icon" : "eye-open"
						} ]
					};
					var html = template(context);
					return html;
				}
			} ],
			"bDestroy" : true,
			"ajax" : {
				url : "admin/roamMall/product/list?goodsType=scenic",
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
				"data" : "number"
			}, {
				"data" : "title"
			}, {
				"data" : "room_name"
			}, {
				"data" : "room_number"
			}, {
				"data" : "original_price"
			}, {
				"data" : "current_price"
			}, {
				"data" : "sales_volume"
			}, {
				"data" : null
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
					var name = "-";
					if (c.is_shelves == 0) {
						name = "<span style='color:green'>上架</span>";
					}
					if (c.is_shelves == 1) {
						name = "下架";
					}
					return name;
				}
			}, {
				"targets" : 10,
				render : function(a, b, c, d) {
					var context = {
						func : [ {
							"name" : "查看详情",
							"fn" : "queryDetail(\'" + c.id + "\','hotel')",
							"type" : "light",
							"icon" : "eye-open"
						} ]
					};
					var html = template(context);
					return html;
				}
			} ],
			"bDestroy" : true,
			"ajax" : {
				url : "admin/roamMall/product/list?goodsType=hotel",
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
				"data" : "number"
			}, {
				"data" : "title"
			}, {
				"data" : "meal"
			}, {
				"data" : "original_price"
			}, {
				"data" : "current_price"
			}, {
				"data" : "sales_volume"
			}, {
				"data" : null
			}, {
				"data" : null
			} ],
			"columnDefs" : [ {
				"targets" : 0,
				render : function(a, b, c, d) {
					return d.row + 1;
				}
			}, {
				"targets" : 8,
				render : function(a, b, c, d) {
					var name = "-";
					if (c.is_shelves == 0) {
						name = "<span style='color:green'>上架</span>";
					}
					if (c.is_shelves == 1) {
						name = "下架";
					}
					return name;
				}
			}, {
				"targets" : 9,
				render : function(a, b, c, d) {
					var context = {
						func : [ {
							"name" : "查看详情",
							"fn" : "queryDetail(\'" + c.id + "\','cater')",
							"type" : "light",
							"icon" : "eye-open"
						} ]
					};
					var html = template(context);
					return html;
				}
			} ],
			"bDestroy" : true,
			"ajax" : {
				url : "admin/roamMall/product/list?goodsType=cater",
				type : "POST"
			}
		});
	}

	//------------------------------装备-------------------------------
	//加载餐饮
	function initEquipList() {
		$('#table_report4').DataTable({
			"columns" : [ {
				"data" : null
			}, {
				"data" : "username"
			}, {
				"data" : "number"
			}, {
				"data" : "title"
			}, {
				"data" : "spec"
			}, {
				"data" : "original_price"
			}, {
				"data" : "current_price"
			}, {
				"data" : "volume"
			}, {
				"data" : "sales_volume"
			}, {
				"data" : null
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
					var name = "-";
					if (c.is_shelves == 0) {
						name = "<span style='color:green'>上架</span>";
					}
					if (c.is_shelves == 1) {
						name = "下架";
					}
					return name;
				}
			}, {
				"targets" : 10,
				render : function(a, b, c, d) {
					var context = {
						func : [ {
							"name" : "查看详情",
							"fn" : "queryDetail(\'" + c.id + "\','equip')",
							"type" : "light",
							"icon" : "eye-open"
						} ]
					};
					var html = template(context);
					return html;
				}
			} ],
			"bDestroy" : true,
			"ajax" : {
				url : "admin/roamMall/product/list?goodsType=equip",
				type : "POST"
			}
		});
	}
	
	function queryDetail(id,goodsType){
		window.location.href="admin/roamMall/product/detail?id="+id+"&goodsType="+goodsType;
	}
	
	function toCoupon(id){
		window.location.href="admin/roamMall/scenic/toCoupon?goodsId="+id;
	}
</script>
</html>
