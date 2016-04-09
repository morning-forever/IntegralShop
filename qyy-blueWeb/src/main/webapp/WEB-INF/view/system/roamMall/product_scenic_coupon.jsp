<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="${system.basePath }">
<%@ include file="/static/inc.jsp"%>

<link rel="stylesheet" href="static/css/daterangepicker.css" />
<link rel="stylesheet" href="static/css/bootstrap-timepicker.css" />
</head>
<style type="text/css">
form label {
	width: 220px;
}

#myform2 th {
	padding-left: 0px;
}

#myform5 th {
	padding-left: 0px;
}

#myform6 th {
	padding-left: 0px;
}
</style>
<body>
	<div class="container-fluid" id="main-container">
		<div id="breadcrumbs">
			<ul class="breadcrumb">
				<li><i class="icon-home"></i> <a
					href="javascript:alert('index');">当前</a><span class="divider"><i
						class="icon-angle-right"></i></span></li>
				<li class="active">商品信息</li>
			</ul>
			<!--.breadcrumb-->
		</div>
		<!--#breadcrumbs-->
		<div class="row-fluid">
			<div class="table-header">订购券信息</div>
			<div style="height: 30px;"></div>
			<div class="tab-content">
				<!-- 基本信息 -->
				<table style="margin-left: 5px;" id="btnmenu">
					<tbody>
						<tr>
							<td>券号：</td>
							<td><span style="margin-top: 7px;" class="input-icon">
									<input type="text" placeholder="这里输入券号" class="mysearch"
									id="coupon"> <i class="icon-search"></i>
							</span></td>
							<td>昵称：</td>
							<td><span style="margin-top: 7px;" class="input-icon">
									<input type="text" placeholder="这里输入昵称" class="mysearch"
									id="nickname"> <i class="icon-search"></i>
							</span></td>
							<td>用户电话：</td>
							<td><span style="margin-top: 7px;" class="input-icon">
									<input type="text" placeholder="这里输入用户电话" class="mysearch"
									id="phone"> <i class="icon-search"></i>
							</span></td>
							<td><a title="查询" onclick="" class="btn btn-mini btn-light"
								id="searchBtn"><i class="icon-search"></i>查询</a></td>
							<td><a title="清空" onclick="" class="btn btn-mini btn-light"
								id="clearBtn"><i class="icon-search"></i>清空</a></td>
						</tr>
					</tbody>
				</table>
				<h3>${merchUser.username }</h3>
				<h4>商品ID:${goods.number }</h4>
				<h4>商品名称:${goods.title }</h4>
				<table id="table_report"
					class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>序号</th>
							<th>券号</th>
							<th>昵称</th>
							<th>用户电话</th>
							<th>验证状态</th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
				<div>
			    	<input class="btn" style="margin-left: 10%" onclick="doBack()" type="button" value="返回">
			    </div>
			</div>
		</div>
	</div>
	<%@ include file="/static/foot.jsp"%>
</body>
<script type="text/javascript" charset="utf-8"
	src="plugins/ueditor1.4.3/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="plugins/ueditor1.4.3/ueditor.all.min.js"></script>
<script type="text/javascript" src="static/js/jquery.form.js"></script>
<script type="text/javascript" src="static/js/ajaxfileupload.js"></script>
<script type="text/javascript" src="static/js/daterangepicker.min.js"></script>
<script type="text/javascript"
	src="static/js/bootstrap-timepicker.min.js"></script>
<script type="text/javascript" src="static/js/fuelux.spinner.js"></script>
<!--定义操作列按钮模板-->
<script id="tpl" type="text/x-handlebars-template">
	{{#each func}}
	<a class="btn btn-mini btn-{{this.type}}" href="javascript:;" title="{{this.name}}" target="mainFrame" onclick="{{this.fn}}"><i class="icon-{{this.icon}}"></i></a>
	{{/each}}
</script>
<script type="text/javascript">
	var tpl = $("#tpl").html();
	var ue;
	//预编译模板
	var template = Handlebars.compile(tpl);
	$(document).ready(function(){
		
		initList();//景区
		
		//查询
		$("#searchBtn").click(
			function() {
				var coupon = $("#coupon").val();
				var nickname = $("#nickname").val();
				var phone = $("#phone").val();
				var goodsId = "${goods.id}";

				var json = '{"coupon":"' + coupon
						+ '","nickname":"' + nickname + '"'
						+ ',"phone":"' + phone 
						+ '","goodsId":"' + goodsId + '"}';
				$("#table_report").DataTable().search(json).draw();
		});
		
		//清空
		$("#clearBtn").click(function(){
			$("#btnmenu input").val("");
		});

	});
	
	//加载订购券
	function initList() {
		$('#table_report').DataTable({
			"columns" : [ {
				"data" : null
			}, {
				"data" : "coupon"
			}, {
				"data" : null
			}, {
				"data" : "phone"
			}, {
				"data" : null
			} ],
			"columnDefs" : [ {
				"targets" : 0,
				render : function(a, b, c, d) {
					return d.row + 1;
				}
			},{
				"targets" : 2,
				render : function(a, b, c, d) {
					var name = "<a href='admin/webusermngr/infoUser?id="+c.userId+"'>"+c.nickname+"</a>";
					return name;
				}
			}, {
				"targets" : 4,
				render : function(a, b, c, d) {
					var name = "-";
					if (c.isUsed == 0) {
						name = "是";
					}
					if (c.isUsed == 1) {
						name = "否";
					}
					return name;
				}
			}],
			"bDestroy" : true,
			"ajax" : {
				url : "admin/roamMall/scenic/getCoupon?goodsId=${goods.id}",
				type : "POST"
			}
		});
	}
	function doBack(id){
		window.location.href="admin/roamMall/product/main?tab=2";
	}

</script>
</html>
