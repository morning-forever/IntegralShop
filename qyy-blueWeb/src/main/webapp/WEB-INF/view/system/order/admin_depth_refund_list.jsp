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
.small-input{
	width: 180px;
}
table.dataTable thead th{
	padding: 10px 0px;
	text-align: center;
}
.dialogBottom{
	margin: 0 auto 5px;
	width: 250px
}
.examineDetial td{
	padding: 5px 10px;
}
.examineListDetial{
	height: 300px;
	overflow: auto;
}
.bottomTr{
	border-bottom: 1px solid #999999;
}
</style>
<table id="examineListModel" style="display: none;">
<tr>
	<td class="createTime"></td>
</tr>
<tr class="bottomTr">
	<td class="state"></td>
	<td class="reason"></td>
</tr>
</table>
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
				<li><a href="admin/order/cart/refundIndex">快旅出行</a></li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane active" id="tab_1">
				<table style="margin-left: 5px;" id="btnmenu">
					<tbody>
						<tr>
							<td>
								商品标题：
							</td>
							<td>
								<input type="text" class="mysearch" id="depthName" style="width: 150px;"> 
							</td>
							<td>
								商品订单号：
							</td>
							<td>
								<input type="text" class="mysearch" id="orderCode" style="width: 160px;"> 
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
								退款人真实姓名：
							</td>
							<td>
								<input type="text" class="mysearch" id="personName" style="width: 150px;"> 
							</td>
							<td>
								退款银行：
							</td>
							<td>
								<input type="text" class="mysearch" id="bankName" style="width: 160px;"> 
							</td>
							<td>
								订单状态：
							</td>
							<td>
								<select id="orderState">
									<option value="">全部</option>
									<option value="'REFUNDING'">退款中</option>
									<option value="'REFUNDING_FAIL'">退款失败</option>
									<option value="'REFUNDED'">退款完成</option>
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
							<th>序号</th>
							<th>商品标题</th>
							<th>商品订单号</th>
							<th>支付订单号</th>
							<th>用户账号</th>
							<th>联系人电话</th>
							<th>订单金额</th>
							<th>申请退款时间</th>
							<th>支付方式</th>
							<th>真实姓名</th>
							<th>退款银行</th>
							<th>退款银行账号</th>
							<th>退款完成时间</th>
							<th>退款状态</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
				</div>
			</div>
		</div>
	</div>
	
		<!-- Modal 审核弹出框-->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="addBrandModalLabel" aria-hidden="true" style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times; </span>
					</button>
				</div>
				<input type="hidden" id="refundId" value="">
				<input type="hidden" id="orderId" value="">
				<div class="modal-body">
					<div class="form-group">
						<table style="margin-left: 5px;margin: 0 auto;" id="btnmenu">
							<tr>
								<th>审核是否通过？</th>
							</tr>
							<tr>
								<th>审核通过后不可修改</th>
							</tr>
							<tr>
								<td>
									<textarea rows="3" cols="3" placeholder="请填写未通过原因（30字以内）" maxlength="30" id="reason"></textarea>
								</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="dialogBottom">
				<a title="通过" onclick="doCheck(0);" href="javascript:;" class="btn btn-mini btn-success"><i class="icon-ok"></i> 通过</a>
				<a title="未通过" onclick="doCheck(1);" href="javascript:;" class="btn btn-mini btn-danger"><i class="icon-remove"></i> 未通过</a>
				</div>
			</div>
		</div>
	</div>
		
		<!-- Modal 退款失败弹出框-->
		<div class="modal fade" id="failModal" tabindex="-1" role="dialog" 
		aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
					<div class="form-group">
						<table style="margin-left: 5px;margin: 0 auto;" id="btnmenu">
							<tr>
								<td>
									退款备注：<textarea id="failReason" style="width: 400px;height: 80px" placeholder="请填写未通过原因（30字以内）"></textarea>
								</td>
							</tr>
						</table>
					</div>
				</div>
				</div>
				<div style="padding: 10px 350px;">
					<button type="button" class="btn btn-primary" id="save-btn" onclick="doRefundFail();">提交</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
		
		<!-- Modal 审核记录弹出框-->
		<div class="modal fade" id="recordModal" tabindex="-1" role="dialog" aria-labelledby="addBrandModalLabel" aria-hidden="true" style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times; </span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-group examineListDetial">
						<table id="examineListDetial" class="examineDetial">
							<tr>
								<td>
									<span>昵称：</span><span class="nickName"></span>
								</td><td>
									<span>姓名：</span><span class="name"></span>
								</td><td>
									<span>联系电话：</span><span class="phone"></span>
								</td>
							</tr>
							<tr>
								<td>
									<span>退款银行：</span><span class="bankName"></span>
								</td><td colspan="2">
									<span>退款银行帐号：</span><span class="bankCard"></span>
								</td>
							</tr>
						</table>
						<hr>
						<table style="margin-left: 5px;" id="examineListTable">
						</table>
					</div>
				</div>
				<div class="dialogBottom">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
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
		
		//设置table的宽度
		$("#table_report").on('draw.dt',function() {
	    	$(".dataTables_wrapper").css("width","1700px");
	    });
		
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
	        "autoWidth": true,
			"bDestroy": true,
	        "ajax": {
	        	url:"admin/refund/depth/list",	
	        	type: "POST"
	        },
			"columns": [
	            { "data": null },//0-序号
	            { "data": "name" },//1-商品标题
	            { "data": "order_code" },//2-商品订单号
	            { "data": "pay_order_id" },//3-支付订单号
	            { "data": "nickname" },//4-用户账号
	            { "data": "person_phone" },//5-联系人电话
	            { "data": "real_price" },//6-订单金额
	            { "data": "create_time" },//7-申请退款时间
	            { "data": "pay_type" },//8-支付方式
	            { "data": "person_name" },//9-真实姓名
	            { "data": "bank_name" },//10-退款银行
	            { "data": "bank_no" },//11-退款银行账号
	            { "data": "finish_time" },//12-退款完成时间
	            { "data": "order_state" },//13-退款状态
	            { "data": null }//14-操作
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
					"targets" : 7,
					render : function(a, b, c, d) {
						var date = new Date(a).format("yyyy-MM-dd");
						return date;
					}
				},
				{
					"targets" : 8,
					render : function(a, b, c, d) {
						var type = "";
						if(a == 'alipay'){
							type = "支付宝";
						}else if(a == 'unionpay'){
							type = "银联";
						}
						return type;
					}
				},
				{
					"targets" : 11,
					render : function(a, b, c, d) {
						var num = a.replace(/\s/g,'').replace(/(\d{4})(?=\d)/g,"$1 ");//先去掉所有的空格,再每隔4个数字加空格
						return num;
					}
				},
				{
					"targets" : 12,
					render : function(a, b, c, d) {
						if(a != null){
							var date = new Date(a).format("yyyy-MM-dd hh:mm:ss");
							return date;
						}else{
							return "";
						}
						
					}
				},
				{
					"targets" : 13,
					render : function(a, b, c, d) {
						return getStateDesc(a);
					}
				},
				{
	 	            "targets": 14,
	 	            render: function (a, b, c, d) {
	 	            	var context ;
	 	            	//退款中
	 	            	if(c.order_state == 'REFUNDING'){
	 	            		//未审核（审核记录，审核，删除）
	 	            		if(c.is_check == 1){
	 	            			context = 
		 	 	                {
		 	 	                    func: [
			 	 	                    {"name": "审核记录", "fn": "openExamineModel(\'" + c.orderId + "\')", "type": "purple", "icon":"list"},
		 	 	                        {"name": "审核", "fn": "openModel(\'" + c.refundId + "\',\'" + c.orderId + "\')", "type": "light", "icon":"search"},
		 	 	                        {"name": "删除", "fn": "doDelete(\'" + c.orderId + "\')", "type": "danger", "icon":"trash"}
		 	 	                    ]
		 	 	                };
	 	            		}
	 	            		//已审核（审核记录，退款完成，退款失败，删除）
	 	            		if(c.is_check == 0){
	 	            			context = 
		 	 	                {
		 	 	                    func: [
		 	 	                        {"name": "审核记录", "fn": "openExamineModel(\'" + c.orderId + "\')", "type": "purple", "icon":"list"},
		 	 	                        {"name": "退款完成", "fn": "doRefundSuccess(\'" + c.refundId + "\',\'" + c.orderId + "\',\'REFUNDED\')", "type": "purple", "icon":"ok-sign"},
		 	 	                        {"name": "退款失败", "fn": "openFailModel(\'" + c.orderId + "\')", "type": "purple", "icon":"remove-sign"},
		 	 	                        {"name": "删除", "fn": "doDelete(\'" + c.orderId + "\')", "type": "danger", "icon":"trash"}
		 	 	                    ]
		 	 	                };
	 	            		}
	 	            	}
	 	            	//退款完成和退款失败
	 	            	else{
	 	            		context = 
	 	 	                {
	 	 	                    func: [
	 	 	                        {"name": "审核记录", "fn": "openExamineModel(\'" + c.orderId + "\')", "type": "purple", "icon":"list"},
	 	 	                        {"name": "删除", "fn": "doDelete(\'" + c.orderId + "\')", "type": "danger", "icon":"trash"}
	 	 	                    ]
	 	 	                };
	 	            	}
	 	            	return template(context);
	           		}
	  	        }
	   		]
	    });
	}
	
	//打开审核弹出框
	function openModel(refundId, orderId){
		$("#refundId").val(refundId);
		$("#orderId").val(orderId);
		$("#myModal").modal("show");
	}
	
	//审核
	function doCheck(result){
		//审核通过，则只修改审核状态，不添加审核记录
		if(result == 0){
			var json = {
					'refundId' : $("#refundId").val(),
					'orderId' : $("#orderId").val()
				};
				$.post('admin/refund/depth/saveCheck', json ,function(res){
					if(res.status == 'success'){
						bootbox.alert("审核成功！");
						$('#table_report').DataTable().clear();
						$('#table_report').DataTable().draw();
					}else if(res.status == 'error'){
						bootbox.alert("审核失败！");
					} else {
						bootbox.alert("服务器异常！");
					}
					$("#myModal").modal("hide");
				});
		}
		//审核未通过，则相当于退款失败，添加审核记录
		else if(result == 1){
			var json = {
				'refundId' : $("#refundId").val(),
				'orderId' : $("#orderId").val(),
				'reason' : $("#reason").val(),
				'result' : 1,
				'state' : 'REFUNDING_FAIL' //修改的订单状态
			};
			$.post('admin/refund/depth/saveRefund', json ,function(res){
				if(res.status == 'success'){
					bootbox.alert("提交成功！");
					$('#table_report').DataTable().clear();
					$('#table_report').DataTable().draw();
				}else if(res.status == 'error'){
					bootbox.alert("提交失败！");
				} else {
					bootbox.alert("服务器异常！");
				}
				$("#myModal").modal("hide");
			});
		}
	}
	
	//退款完成
	function doRefundSuccess(refundId, orderId){
		bootbox.confirm("确认退款完成吗?", function(result) {
			if (result) {
				$.ajax({
					url : "admin/refund/depth/saveRefund",
					post : "post",
					data : {
						'refundId' : refundId,
						'orderId' : orderId,
						'result' : 0,
						'state' : 'REFUNDED' //修改的订单状态
					},
					success : function(res) {
						if(res.status == 'success'){
							bootbox.alert("提交成功！");
							$('#table_report').DataTable().clear();
							$('#table_report').DataTable().draw();
						}else if(res.status == 'error'){
							bootbox.alert("审核失败！");
						} else {
							bootbox.alert("服务器异常！");
						}
					}
				});
			}
		});
	}
	
	//打开退款失败弹出框
	function openFailModel(orderId){
		$("#orderId").val(orderId);
		$("#failModal").modal("show");
	}
	
	//提交退款失败
	function doRefundFail(){
		var json = {
			'orderId' : $("#orderId").val(),
			'reason' : $("#failReason").val(),
			'result' : 1,
			'state' : 'REFUNDING_FAIL' //修改的订单状态
		};
		$.post('admin/refund/depth/saveRefund', json ,function(res){
			if(res.status == 'success'){
				bootbox.alert("提交成功！");
				$('#table_report').DataTable().clear();
				$('#table_report').DataTable().draw();
			}else if(res.status == 'error'){
				bootbox.alert("提交失败！");
			} else {
				bootbox.alert("服务器异常！");
			}
			$("#failModal").modal("hide");
		});
	}
	
	//查看审核记录
	function openExamineModel(orderId){
		$.post('admin/refund/depth/examineList', {'orderId': orderId} ,function(res){
			if(res.status == 'success'){
				var table = $("#examineListTable").empty();
				var user = res.refundInfo;
				var list = res.examineList;
				$("#examineListDetial .nickName").html(user.nickname);
				$("#examineListDetial .name").html(user.person_name);
				$("#examineListDetial .phone").html(user.person_phone);
				$("#examineListDetial .bankName").html(user.bank_name);
				$("#examineListDetial .bankCard").html(user.bank_no);
				for(var i in list){
					var item = $("#examineListModel").children().clone();
					item.find(".createTime").html(new Date(list[i].create_time).format("yyyy-MM-dd hh:mm:ss"));
					item.find(".reason").html(list[i].reason);
					var state = "";
					if(list[i].result == 1){
						state = "退款失败";	
					}else{
						state = "退款成功"
					}
					item.find(".state").html(state);
					table.append(item);
				}
				
			}else {
				bootbox.alert("服务器异常！");
			}
		});
		$("#recordModal").modal("show");
	}
	
	//删除
	function doDelete(id){
		bootbox.confirm("确定要删除吗?", function(result) {
			if (result) {
				$.ajax({
					url : "admin/refund/depth/deleteOrder",
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
