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
				<li class="active">订单管理</li>
			</ul>
			<!--.breadcrumb-->
		</div>
		<!--#breadcrumbs-->
		<div class="row-fluid">
			<div class="table-header">订单信息</div>
			<ul class="nav nav-tabs" id="otherInfoTab">
				<li class="active"><a href="#tab_1">旅游</a></li>
				<li><a href="admin/order/cart/index">快旅出行</a></li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane active" id="tab_1">
				<table style="margin-left: 5px;" id="btnmenu">
					<tbody>
						<tr>
							<td>
								昵称：
							</td>
							<td>
								<input type="text" class="mysearch" id="nickName"> 
							</td>
							<td>
								商品订单号：
							</td>
							<td>
								<input type="text" class="mysearch" id="orderCode"> 
							</td>
							<td>
								支付订单号：
							</td>
							<td colspan="2">
								<input type="text" class="mysearch" id="payOrderId" style="width: 240px;"> 
							</td>
						</tr>
						<tr>
							<td>
								联系电话：
							</td>
							<td>
								
								<input type="text" class="mysearch" id="personPhone"> 
							</td>
							<td>
								订单时间：
							</td>
							<td>
								<div class="input-prepend">
									<span class="add-on"><i class="icon-calendar"></i></span>
									<input type="text" id="orderTime" readonly="readonly" class="span11 mydate-picker" data-date-format="yyyy-mm-dd" style="width: 190px;">
								</div>
							</td>
							<td>
								订单状态：
							</td>
							<td>
								<select id="orderState">
									<option value="">全部</option>
									<option value="WAITPAY">待付款</option>
									<option value="PAY_OK">交易成功</option>
									<option value="CLOSED">交易关闭</option>
									<option value="REFUNDING">退款中</option>
									<option value="REFUNDING_FAIL">退款失败</option>
									<option value="REFUNDED">退款完成</option>
								</select>
							</td>
							<td>
								<a title="查询" class="btn btn-mini btn-success" id="searchBtn"><i class="icon-search"></i>查询</a>
								<a title="清空" class="btn btn-mini btn-success" id="clearBtn"><i class="icon-refresh"></i>清空</a>
							</td>
						</tr>
					</tbody>
				</table>
				<table id="table_report" class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th width="2%">序号</th>
							<th width="15%">商品标题</th>
							<th width="10%">商品订单号</th>
							<th width="15%">支付订单号</th>
							<th width="8%">昵称</th>
							<th width="8%">联系人姓名</th>
							<th width="8%">联系人电话</th>
							<th width="5%">订单金额</th>
							<th width="8%">订单时间</th>
							<th width="8%">订单状态</th>
							<th width="10%">操作</th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
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
<script type="text/javascript" src="static/js/bootstrap-timepicker.min.js"></script>
<script type="text/javascript" src="static/js/fuelux.spinner.js"></script>
<script type="text/javascript" src="static/web/js/base.js"></script>
<script type="text/javascript" src="static/js/fullcalendar.min.js"></script>
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

	$(document).ready(function(){
		//初始化加载列表
		initMainList();
		
		//初始化时间插件
		$('.mydate-picker').datepicker();
		
		//查询
		var table = $("#table_report").DataTable();
		$("#searchBtn").click(function() {
			var json = '{';
			$("#btnmenu select,#btnmenu input").each(function() {
				json += '"' + this.id + '":"' + $(this).val() + '",';
			});
			json = json.substr(0, json.length - 1);
			json += '}';
			table.search(json).draw();
		});	
		
		//清空
		$("#clearBtn").click(function(){
			$("#btnmenu input,#btnmenu select").val("");
		});
	});

	//初始化加载列表
	function initMainList(){
		$('#table_report').DataTable( {
			"bDestroy": true,
	        "ajax": {
	        	url:"admin/order/depth/list",	
	        	type: "POST"
	        },
			"columns": [
	            { "data": null },//0-序号
	            { "data": "name" },//1-商品标题
	            { "data": "order_code" },//2-商品订单号
	            { "data": "pay_order_id" },//3-支付订单号
	            { "data": "nickname" },//4-昵称
	            { "data": "person_name" },//5-联系人姓名
	            { "data": "person_phone" },//6-联系人电话
	            { "data": "real_price" },//7-订单金额
	            { "data": "create_time" },//8-订单时间
	            { "data": "order_state" },//9-订单状态
	            { "data": null }//10-操作
	        ],
	        "columnDefs": [
				{
					"targets": 0,
					render: function (a, b, c, d) {
		                return d.row+1;
					}
				},
				{
					"targets" : 4 ,
					render : function(a, b, c, d) {
						var name = "<a href='admin/webusermngr/infoUser?id="+c.userId+"'>"+c.nickname+"</a>";
						return name;
					}
				}, 
				{
					"targets" : 8,
					render : function(a, b, c, d) {
						var date = new Date(a).format("yyyy-MM-dd");
						return date;
					}
				},
				{
					"targets" : 9,
					render : function(a, b, c, d) {
						return getStateDesc(a);
					}
				},
				{
	 	            "targets": 10,
	 	            render: function (a, b, c, d) {
	 	            	var context ;
	 	            	if(c.order_state == 'WAITPAY'){
	 	            		context = 
	 	 	                {
	 	 	                    func: [
	 	 	                        {"name": "查看", "fn": "toDetail(\'" + c.id + "\',\'" + c.nickname + "\')", "type": "light", "icon":"eye-open"},
	 	 	                       	{"name": "取消订单", "fn": "doCancel(\'" + c.id + "\',1)", "type": "info", "icon":"check-empty"},
	 	 	                        {"name": "删除", "fn": "doDelete(\'" + c.id + "\')", "type": "danger", "icon":"trash"}
	 	 	                    ]
	 	 	                };
	 	            	}else{
	 	            		context = 
	 	 	                {
	 	 	                    func: [
	 	 	                        {"name": "查看", "fn": "toDetail(\'" + c.id + "\',\'" + c.nickname + "\')", "type": "light", "icon":"eye-open"},
	 	 	                        {"name": "删除", "fn": "doDelete(\'" + c.id + "\')", "type": "danger", "icon":"trash"}
	 	 	                    ]
	 	 	                };
	 	            	}
	 	            	return template(context);
	           		}
	  	        }
	   		]
	    });
	}
	
	//编辑
	function toDetail(orderId, nickName){
		var json = {
			'orderId' : orderId,
			'nickName' : nickName
		};
		subWebForm('admin/order/depth/detail',json);
	}
	
	//取消订单
	function doCancel(id){
		bootbox.confirm("确定要取消该订单吗?", function(result) {
			if (result) {
				$.ajax({
					url : "admin/order/depth/canelOrder",
					post : "post",
					data : {
						"id" : id
					},
					success : function(data) {
						if (data.status == "success") {
							bootbox.alert("取消成功！");
							$('#table_report').DataTable().clear();
							$('#table_report').DataTable().draw();
						} else {
							bootbox.alert("服务器异常！");
						}
					}
				});
			}
		});
	}
	
	//删除
	function doDelete(id){
		bootbox.confirm("确定要删除吗?", function(result) {
			if (result) {
				$.ajax({
					url : "admin/order/depth/deleteOrder",
					post : "post",
					data : {
						"id" : id
					},
					success : function(data) {
						if (data.status == "success") {
							bootbox.alert("删除成功！");
							$('#table_report').DataTable().clear();
							$('#table_report').DataTable().draw();
						} else {
							bootbox.alert("服务器异常！");
						}
					}
				});
			}
		});
	}
	
	//获取订单状态描述
	function getStateDesc(orderState){
		var desc = "";
		if(orderState == 'WAITPAY'){
			desc = '待付款';
		}else if(orderState == 'PAY_OK'){
			desc = '交易成功';
		}else if(orderState == 'CLOSED'){
			desc = '交易关闭';
		}else if(orderState == 'REFUNDING'){
			desc = '退款中';
		}else if(orderState == 'REFUNDING_FAIL'){
			desc = '退款失败';
		}else if(orderState == 'REFUNDED'){
			desc = '退款完成';
		}
		return desc;
	}
	
	Date.prototype.format = function(format) {
	    var date = {
	           "M+": this.getMonth() + 1,
	           "d+": this.getDate(),
	           "h+": this.getHours(),
	           "m+": this.getMinutes(),
	           "s+": this.getSeconds(),
	           "q+": Math.floor((this.getMonth() + 3) / 3),
	           "S+": this.getMilliseconds()
	    };
	    if (/(y+)/i.test(format)) {
	           format = format.replace(RegExp.$1, (this.getFullYear() + '').substr(4 - RegExp.$1.length));
	    }
	    for (var k in date) {
	           if (new RegExp("(" + k + ")").test(format)) {
	                  format = format.replace(RegExp.$1, RegExp.$1.length == 1
	                         ? date[k] : ("00" + date[k]).substr(("" + date[k]).length));
	           }
	    }
	    return format;
	}
	
</script>
</html>
