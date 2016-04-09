<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<base href="${system.basePath }">
	<%@ include file="/static/inc.jsp" %>

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

.smallTd{
	max-width: 50px;
	word-wrap:break-word;
	text-align: center;
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
				<li><i class="icon-home"></i> <a href="javascript:;">当前</a><span class="divider"><i class="icon-angle-right"></i></span></li>
				<li class="active">订单管理</li>
			</ul><!--.breadcrumb-->
		</div><!--#breadcrumbs-->
		<div class="table-header">订单信息</div>
		<ul class="nav nav-tabs">
			<li><a href="admin/refund/depth/main">旅游</a></li>
			<li class="active"><a href="javascript:;">快旅出行</a></li>
		</ul>
		<ul class="nav nav-tabs" id="otherInfoTab">
			<li class="active" ><a href="#tab_1">租车订单</a></li>
			<li ><a href="#tab_2">包车订单</a></li>
			<li ><a href="#tab_3">班车订单</a></li>
			<li ><a href="#tab_4">拼车订单</a></li>
		</ul>
		<div class="tab-content">
			<!-- 租车订单 -->
			<div class="tab-pane active" id="tab_1">
				<div class="row-fluid">
					<!-- <h3 class="header smaller lighter blue">会员管理</h3> -->
					<form action="">
						<table style="margin-left: 5px;" id="btnmenu">
							<tbody>
								<tr>
									<td>
										<span>商品标题:</span>
										<input name="title" class="small-input">
										<span>商品订单号:</span>
										<input name="orderCode" class="small-input">
										<span>支付订单号:</span>
										<input name="payOrderId" class="small-input">
										<span>退款人真实姓名:</span>
										<input name="personName" class="small-input">
									</td>
								</tr>
								<tr>
									<td>
										<span>退款银行:</span>
										<input name="bankName" class="small-input">
										<span>退款银行卡号:</span>
										<input name=bankCard class="small-input">
										<span>订单状态:</span>
										<select name="orderType">
											<option value="">全部</option>
											<option value="REFUNDING">退款中</option>
											<option value="REFUNDING_FAIL">退款失败</option>
											<option value="REFUNDED">退款成功</option>
										</select>
										<a title="搜索" href="javascript:;" target="mainFrame" class="btn btn-mini btn-success searchBtn" ><i class="icon-search"></i> 搜索</a>
									</td>
								</tr>
								<tr>
									<td>
										<a title="删除" onclick="doDeletes(1)" href="javascript:;" class="btn btn-mini btn-info" ><i class="icon-trash"></i> 删除</a>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
					<table id="table_rent" type="1" class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th class='center'>
									<label><input type='checkbox' id="tableCheckbox" class="tableCheckbox" onchange="changeAllCheckbox()" /><span class="lbl"></span></label>
								</th>
								<th>ID</th>
								<th style="width: 100px">商品标题</th>
								<th>商品订单号</th>
								<th>支付订单号</th>
								<th>昵称</th>
								<th>联系人电话</th>
								<th>订单金额</th>
								<th>申请退款时间</th>
								<th>支付方式</th>
								<th>真实姓名</th>
								<th>退款银行</th>
								<th>退款银行卡号</th>
								<th>退款完成时间</th>
								<th>退款状态</th>
								<th style="width: 200px">操作</th>
							</tr>
						</thead>
						<tbody></tbody> 
					</table>
				</div>
			</div>
			
			<!-- 包车订单 -->
			<div class="tab-pane active" id="tab_2">
				<div class="row-fluid">
					<!-- <h3 class="header smaller lighter blue">会员管理</h3> -->
					<form action="">
						<table style="margin-left: 5px;" id="btnmenu">
							<tbody>
								<tr>
									<td>
										<span>商品标题:</span>
										<input name="title" class="small-input">
										<span>商品订单号:</span>
										<input name="orderCode" class="small-input">
										<span>支付订单号:</span>
										<input name="payOrderId" class="small-input">
										<span>退款人真实姓名:</span>
										<input name="personName" class="small-input">
									</td>
								</tr>
								<tr>
									<td>
										<span>退款银行:</span>
										<input name="bankName" class="small-input">
										<span>退款银行卡号:</span>
										<input name=bankCard class="small-input">
										<span>订单状态:</span>
										<select name="orderType">
											<option value="">全部</option>
											<option value="REFUNDING">退款中</option>
											<option value="REFUNDING_FAIL">退款失败</option>
											<option value="REFUNDED">退款成功</option>
										</select>
										<a title="搜索" href="javascript:;" target="mainFrame" class="btn btn-mini btn-success searchBtn" ><i class="icon-search"></i> 搜索</a>
									</td>
								</tr>
								<tr>
									<td>
										<a title="删除" onclick="doDeletes(2)" href="javascript:;" class="btn btn-mini btn-info" ><i class="icon-trash"></i> 删除</a>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
					<table id="table_wrap" type="2" class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th class='center'>
									<label><input type='checkbox' id="tableCheckbox" class="tableCheckbox" onchange="changeAllCheckbox()" /><span class="lbl"></span></label>
								</th>
								<th>ID</th>
								<th>标题</th>
								<th>车系</th>
								<th>座位数</th>
								<th>商品订单号</th>
								<th>支付订单号</th>
								<th>昵称</th>
								<th>联系人姓名</th>
								<th>订单金额</th>
								<th>申请退款时间</th>
								<th>支付方式</th>
								<th>真实姓名</th>
								<th>退款银行</th>
								<th>退款银行卡号</th>
								<th>退款完成时间</th>
								<th>订单状态</th>
								<th style="width: 200px">操作</th>
							</tr>
						</thead>
						<tbody></tbody> 
					</table>
				</div>
			</div>
		
		<!-- 班车订单 -->
		<div class="tab-pane active" id="tab_3">
				<div class="row-fluid">
					<!-- <h3 class="header smaller lighter blue">会员管理</h3> -->
					<form action="">
						<table style="margin-left: 5px;" id="btnmenu">
							<tbody>
								<tr>
									<td>
										<span>车牌号:</span>
										<input name="carCard" class="small-input">
										<span>发车时间:</span>
										<input name="startTime" class="small-input">
										<span>商品订单号:</span>
										<input name="orderCode" class="small-input">
										<span>支付订单号:</span>
										<input name="payOrderId" class="small-input">
									</td>
								</tr>
								<tr>
									<td>
										<span>退款人真实姓名:</span>
										<input name="personName" class="small-input">
										<span>退款银行:</span>
										<input name="bankName" class="small-input">
										<span>退款银行卡号:</span>
										<input name=bankCard class="small-input">
									</td>
								</tr>
								<tr>
									<td>
										<span>订单状态:</span>
										<select name="orderType">
											<option value="">全部</option>
											<option value="REFUNDING">退款中</option>
											<option value="REFUNDING_FAIL">退款失败</option>
											<option value="REFUNDED">退款成功</option>
										</select>
										<a title="搜索" href="javascript:;" target="mainFrame" class="btn btn-mini btn-success searchBtn" ><i class="icon-search"></i> 搜索</a>
									</td>
								</tr>
								<tr>
									<td>
										<a title="删除" onclick="doDeletes(3)" href="javascript:;" class="btn btn-mini btn-info" ><i class="icon-trash"></i> 删除</a>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
					<table id="table_bus" type="3" class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th class='center'>
									<label><input type='checkbox' id="tableCheckbox" class="tableCheckbox" onchange="changeAllCheckbox()" /><span class="lbl"></span></label>
								</th>
								<th>ID</th>
								<th>车牌号</th>
								<th>商品标题</th>
								<th>出发时间</th>
								<th>商品订单号</th>
								<th>支付订单号</th>
								<th>昵称</th>
								<th>联系人电话</th>
								<th>订单金额</th>
								<th>申请退款时间</th>
								<th>支付方式</th>
								<th>真实姓名</th>
								<th>退款银行</th>
								<th>退款银行卡号</th>
								<th>退款完成时间</th>
								<th>退款状态</th>
								<th style="width: 200px">操作</th>
							</tr>
						</thead>
						<tbody></tbody> 
					</table>
				</div>
			</div>
			
			<!-- 拼车列表 -->
			<div class="tab-pane active" id="tab_4">
				<div class="row-fluid">
					<!-- <h3 class="header smaller lighter blue">会员管理</h3> -->
					<form action="">
						<table style="margin-left: 5px;" id="btnmenu">
							<tbody>
								<tr>
									<td>
										<span>商品标题:</span>
										<input name="title" class="small-input">
										<span>发车时间:</span>
										<input name="startTime" class="small-input">
										<span>商品订单号:</span>
										<input name="orderCode" class="small-input">
										<span>支付订单号:</span>
										<input name="payOrderId" class="small-input">
									</td>
								</tr>
								<tr>
									<td>
										<span>退款人真实姓名:</span>
										<input name="personName" class="small-input">
										<span>退款银行:</span>
										<input name="bankName" class="small-input">
										<span>退款银行卡号:</span>
										<input name=bankCard class="small-input">
									</td>
								</tr>
								<tr>
									<td>
										<span>订单状态:</span>
										<select name="orderType">
											<option value="">全部</option>
											<option value="REFUNDING">退款中</option>
											<option value="REFUNDING_FAIL">退款失败</option>
											<option value="REFUNDED">退款成功</option>
										</select>
										<a title="搜索" href="javascript:;" target="mainFrame" class="btn btn-mini btn-success searchBtn" ><i class="icon-search"></i> 搜索</a>
									</td>
								</tr>
								<tr>
									<td>
										<a title="删除" onclick="doDeletes(4)" href="javascript:;" class="btn btn-mini btn-info" ><i class="icon-trash"></i> 删除</a>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
					<table id="table_pool" type="4" class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th class='center'>
									<label><input type='checkbox' id="tableCheckbox" class="tableCheckbox" onchange="changeAllCheckbox()" /><span class="lbl"></span></label>
								</th>
								<th>ID</th>
								<th>商品标题</th>
								<th>出发时间</th>
								<th>商品订单号</th>
								<th>支付订单号</th>
								<th>发起人姓名</th>
								<th>发起人联系方式</th>
								<th>退款用户昵称</th>
								<th>退款联系人电话</th>
								<th>订单金额</th>
								<th>已支付金额</th>
								<th>退款金额</th>
								<th>申请退款时间</th>
								<th>支付方式</th>
								<th>真实姓名</th>
								<th>退款银行</th>
								<th>退款银行卡号</th>
								<th>退款完成时间</th>
								<th>退款状态</th>
								<th style="width: 200px">操作</th>
							</tr>
						</thead>
						<tbody></tbody> 
					</table>
				</div>
			</div>
			
			
			
		</div>




	</div>
	<!-- #main-content -->
	<div class="modal fade" id="examineModal" tabindex="-1" role="dialog" aria-labelledby="addBrandModalLabel" aria-hidden="true" style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times; </span>
					</button>
				</div>
				<input type="hidden" name="orderId" id="examineOrderId">
				<input type="hidden" name="type" id="type">
				<div class="modal-body">
					<div class="form-group">
						<table style="margin-left: 5px;margin: 0 auto;" id="btnmenu">
							<tr>
								<td>
									审核备注：<textarea id="refund_reamrk" name="refund_reamrk" style="width: 400px;height: 80px" placeholder="填写审核失败原因"></textarea>
								</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="dialogBottom">
				<a title="通过" onclick="submitExamine(0)" href="javascript:;" class="btn btn-mini btn-success"><i class="icon-ok"></i> 通过</a>
				<a title="未通过" onclick="submitExamine(1)" href="javascript:;" class="btn btn-mini btn-danger"><i class="icon-remove"></i> 未通过</a>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="refundModal" tabindex="-1" role="dialog" aria-labelledby="addBrandModalLabel" aria-hidden="true" style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times; </span>
					</button>
				</div>
				<input type="hidden" name="orderId" id="examineOrderId">
				<input type="hidden" name="type" id="type">
				<input type="hidden" name="state" id="state">
				<div class="modal-body">
					<div class="form-group">
						<table style="margin-left: 5px;margin: 0 auto;" id="btnmenu">
							<tr>
								<td>
									退款备注：<textarea id="refund_reamrk" name="refund_reamrk" style="width: 400px;height: 80px"></textarea>
								</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="dialogBottom">
				<a title="提交" onclick="submitRefund()" href="javascript:;" class="btn btn-mini btn-success"><i class="icon-ok"></i> 提交</a>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="examineListModal" tabindex="-1" role="dialog" aria-labelledby="addBrandModalLabel" aria-hidden="true" style="display: none;">
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
				<a title="关闭" onclick="closeExamineListModal()" href="javascript:;" class="btn btn-mini btn-success"><i class="icon-ok"></i> 关闭</a>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/static/foot.jsp" %>
</body>
<script type="text/javascript" src="static/js/jquery.form.js"></script>
<script type="text/javascript" src="static/js/daterangepicker.min.js"></script>
<script type="text/javascript" src="static/js/bootstrap-timepicker.min.js"></script>
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

var typeStrArr=["table_rent","table_wrap","table_bus","table_pool"];

$(document).ready(function(){
	
	//初始化时间插件
	$('.mydate-picker').datepicker();
	
	//初始化Tab页

    $('#otherInfoTab a').click(function(e) {
        e.preventDefault();//阻止a链接的跳转行为
        $(this).tab('show');//显示当前选中的链接及关联的content
    });
    $('#otherInfoTab a').click();
    $('#otherInfoTab a:first').click();
    
    $("#examineModal").modal("hide");

    $('#timeEnd').timepicker({//初始化时间选择插件
		minuteStep: 1,
		showSeconds: true,
		showMeridian: false
	});
    $("#timeEnd").val("");
    
    initRentList("table_rent");
    initWrapList("table_wrap");
    initBusList("table_bus");
    initPoolList("table_pool");
	
    $("#table_rent").on('draw.dt',
    function() {
    	$(".dataTables_wrapper").css("width","1500px");
    	//$("#table_rent").css("width","1500px");
    });
    
	
	$(".searchBtn").click(function(){
		var json='{';
		
		var valueArr=decodeURIComponent($(this).parents("form").serialize(),true).split("&");
		for(var i=0;i<valueArr.length;i++){
			var valueItem=valueArr[i].split("=");
			if(valueItem[1]!=''&&valueItem[1]!=null){
				if(i!=0){
					json+=',';	
				}
				json+='"'+valueItem[0]+'":"'+valueItem[1]+'"';
			}
		}
		json+='}';
		console.info(json);
		$(this).parents(".tab-pane").find("table.table-hover").DataTable().search(json).draw();
	});
	
	//$('#table_report_recommend tr').removeClass("odd");
	
	$('.table').on( 'click', 'td', function () {
        //$(this).find("input[flag=row]").click();
        if($(this).find("input[flag=row]").length==0){
        	$(this).parent("tr").find("input[flag=row]").click();
        }
    } );
	
	$(".tableCheckbox").click(function(){
		var flag=this.checked;
		$(this).parents(".tab-pane").find("input[flag=row]").each(function(){
			this.checked=flag;
		});
	});
	
	$(".limitDiv .btn").bind("click",function(){
		$(this).addClass("btn-inverse").siblings().removeClass("btn-inverse");
		$("#limit").val($(this).attr("_val"));
	});
	
});	



function doDelete(id,type){
	var url="";
	url="admin/order/cart/deletes";
	console.info(id);
	bootbox.confirm("确定要删除该订单么?", function(result) {
		if(result){
			$.ajax({
				url : url,
				post : "post",
				data:{
					"ids":id,
					"type":type
				},
				success:function(data){
					if(data.status == "success"){
						bootbox.alert("删除成功！");
						$("#"+typeStrArr[parseInt(type)-1]).DataTable().clear();
						$("#"+typeStrArr[parseInt(type)-1]).DataTable().draw();
					}else{
						bootbox.alert("服务器忙，请稍后重试");
					}
				}
				
			});
		}
	});
}

function doDeletes(type){
	var idStr="";
	var url="";
	url="admin/order/cart/deletes";
	$("#"+typeStrArr[parseInt(type)-1]+" input[flag=row]").each(function(){
		if(this.checked){
			idStr+=this.value+",";
		}
	});
	console.info(idStr);
	bootbox.confirm("确定要删除选中的订单么?", function(result) {
		if(result){
			$.ajax({
				url : url,
				post : "post",
				data:{
					"ids":idStr,
					"type":type
				},
				success:function(data){
					if(data.status == "success"){
						bootbox.alert("删除成功！");
						$("#"+typeStrArr[parseInt(type)-1]).DataTable().clear();
						$("#"+typeStrArr[parseInt(type)-1]).DataTable().draw();
					}else{
						bootbox.alert("服务器忙，请稍后重试");
					}
				}
				
			});
		}
	});
}

function submitExamine(state){
	var data={};
	var type=$("#examineModal #type").val();
	data.refundReamrk=$("#examineModal #refund_reamrk").val();
	data.id=$("#examineModal #examineOrderId").val();
	data.state=state;
	$.post("admin/order/cart/examineRefund",data,function(result){
		$("#examineModal").modal("hide");
		if(result.status=="success"){
			bootbox.alert("审核成功！");
			$("#"+typeStrArr[parseInt(type)-1]).DataTable().clear();
			$("#"+typeStrArr[parseInt(type)-1]).DataTable().draw();
		}else{
			bootbox.alert("服务器忙，请稍后重试");
		}
	});
}

function submitRefund(){
	var data={};
	var type=$("#refundModal #type").val();
	data.refundReamrk=$("#refundModal #refund_reamrk").val();
	data.id=$("#refundModal #examineOrderId").val();
	data.state=$("#refundModal #state").val();
	$.post("admin/order/cart/submitRefundState",data,function(result){
		$("#refundModal").modal("hide");
		if(result.status=="success"){
			bootbox.alert("审核成功！");
			$("#"+typeStrArr[parseInt(type)-1]).DataTable().clear();
			$("#"+typeStrArr[parseInt(type)-1]).DataTable().draw();
		}else{
			bootbox.alert("服务器忙，请稍后重试");
		}
	});
}

function examineList(id,type){
	var data={};
	data.id=id;
	$.post("admin/order/cart/examineList",data,function(result){
		$("#examineListModal").modal("show");
		if(result.status=="success"){
			var table=$("#examineListTable").empty();
			var user=result.map;
			var list=result.list;
			$("#examineListDetial .nickName").html(user.nickname);
			$("#examineListDetial .name").html(user.person_name);
			$("#examineListDetial .phone").html(user.person_phone);
			$("#examineListDetial .bankName").html(user.bank_name);
			$("#examineListDetial .bankCard").html(user.bank_card);
			for(var i=0;i<list.length;i++){
				var item=$("#examineListModel").children().clone();
				item.find(".createTime").html(getTimeTxt(list[i].create_time,19));
				item.find(".reason").html(list[i].reason);
				var state=list[i].result;
				if(state==1){
					state="退款失败";	
				}else{
					state="退款成功"
				}
				item.find(".state").html(state);
				table.append(item);
			}
		}else{
			bootbox.alert("服务器忙，请稍后重试");
		}
	});
}



function closeExamineListModal(){
	$("#examineListModal").modal("hide");
}

function doCheck(id,type){
	window.location.href="admin/order/cart/check_"+id+"_"+type;
}

function doRefund(id,type,state){
	$("#refundModal #examineOrderId").val(id);
	$("#refundModal #type").val(type);
	$("#refundModal #refund_reamrk").val("");
	$("#refundModal #state").val(state);
	$("#refundModal").modal("show");
	
}

function doExamine(id,type){
	$("#examineModal #examineOrderId").val(id);
	$("#examineModal #type").val(type);
	$("#examineModal #refund_reamrk").val("");
	$("#examineModal").modal("show");
}

function doCheckBusList(id,data){
	window.location.href="admin/order/cart/checkBusList_"+id+"_"+data;
}




function initRentList(id){
	var url="";
	var tableType=$("#"+id).attr("type");
	$('#'+id).DataTable( {
		"autoWidth":false,
		"columns": [
            { "data": null },//0
            { "data": "id" },//1
            { "data": "title" },//2
            { "data": "order_code" },//3
            { "data": "pay_order_id" },//4
            { "data": "nickname" },//5
            { "data": "person_phone" },//6
            { "data": "real_price" },//7
            { "data": "refund_time" },//8
            { "data": "pay_type" },//9
            { "data": "person_name" },//10
            { "data": "bank_name" },//11
            { "data": "bank_card" },//12
            { "data": "refund_over_time" },//13
            { "data": "order_state" },//14
            { "data": null }//15
            ],
            "columnDefs": [{
            	"targets":0,
            	render:function(data,type,row){
            		var str="<label><input type='checkbox'  flag='row' value='"+row.id+"' /><span class='lbl'></span></label>";
            		return str;
            	}
            },{
            	"targets":2,
            	render:function(data,type,row){
            		return row.brand+ row.sys+"/"+ row.car_type+"/"+ row.outputs+ row.gearbox;
            	}
            },{
            	"targets":8,
            	render:function(data,type,row){
            		if(data!=null){
	            		return getTimeTxt(data,19);
            		}else{
            			return '';
            		}
            	}
            },{
            	"targets":9,
            	render:function(data,type,row){
            		var str='';
            		if(data=='unPay'){
            			str='未支付';
            		}else if(data=='alipay'){
            			str='支付宝';
            		}else{
            			str='-';
            		}
            		return str;
            	}
            },{
            	"targets":13,
            	render:function(data,type,row){
            		if(data!=null){
	            		return getTimeTxt(data,19);
            		}else{
            			return '';
            		}
            	}
            },{
            	"targets":14,
            	render:function(data,type,row){
            		var str="";
            		if(data=="PAY_OK"){
            			str="交易成功";
            		}else if(data=="CLOSED"){
            			str="交易关闭";
            		}else if(data=="WAITPAY"){
            			str="等待付款";
            		}else if(data=="REFUNDING"){
            			str="退款中";
            		}else if(data=="REFUNDING_UNPOOL"){
            			str="退款中-拼单失败";
            		}else if(data=="REFUNDING_FAIL"){
            			str="退款失败";
            		}else if(data=="REFUNDED"){
            			str="退款完成";
            		}else if(data=="CONSUME"){
            			str="已消费";
            		}else if(data=="UNCONSUME"){
            			str="未消费";
            		}else{
            			str=data;
            		}
            		return str;
            	}
            },{
            	"targets": 15,
            	render: function (data, type, row, d) {
            		var context0 ={
            			func: [
							{"name": "审核记录", "fn": "examineList(\'" + row.id + "\',"+tableType+")", "type": "purple", "icon":"list"},
							{"name": "删除", "fn": "doDelete(\'" + row.id + "\',"+tableType+")", "type": "danger", "icon":"trash"}
            			]
            		};
            		var context1 ={
            			func: [
	            			{"name": "审核", "fn": "doExamine(\'" + row.id + "\',"+tableType+")", "type": "purple", "icon":"search"}
            			]
            		};
            		var context2 ={
            			func: [
	            			{"name": "退款成功", "fn": "doRefund(\'" + row.id + "\',"+tableType+",0)", "type": "purple", "icon":"ok-sign"},
	            			{"name": "退款失败", "fn": "doRefund(\'" + row.id + "\',"+tableType+",1)", "type": "purple", "icon":"remove-sign"}
            			]
            		};
            		var str0=template(context0);
            		var str1="";
            		if(row.is_examine==2){
            			str1=template(context1);
            		}
            		var str2="";
            		if(row.is_examine==0&&row.order_state=="REFUNDING"){
            			str2=template(context2);
            		}
            		var html = str0+str1+str2;
            		return html;
            	}
            }
            ],
            init:function(){
            	console.info("over");
            },
            fnInitComplete:function(){
			$('#'+id).DataTable().column(1).visible(false);//隐藏ID行
		},
		"bDestroy": true,
		"ajax": {
			url:"admin/order/cart/refundOrderList",
			data:{type:tableType},
			type: "POST"
		}
	} );
}

function initWrapList(id){
	var url="";
	var tableType=$("#"+id).attr("type");
	$('#'+id).DataTable( {
		"columns": [
            { "data": null },//0
            { "data": "id" },//1
            { "data": "title" },//2
            { "data": "sys" },//3
            { "data": "seating" },//4
            { "data": "order_code" },//5
            { "data": "pay_order_id" },//6
            { "data": "nickname" },//7
            { "data": "person_name" },//8
            { "data": "real_price" },//9
            { "data": "refund_time" },//10
            { "data": "pay_type" },//11
            { "data": "person_name" },//12
            { "data": "bank_name" },//13
            { "data": "bank_card" },//14
            { "data": "refund_over_time" },//15
            { "data": "order_state" },//16
            { "data": null }//17
            ],
            "columnDefs": [{
            	"targets":0,
            	render:function(data,type,row){
            		var str="<label><input type='checkbox'  flag='row' value='"+row.id+"' /><span class='lbl'></span></label>";
            		return str;
            	}
            },{
            	"targets":2,
            	render:function(data,type,row){
            		return row.brand+"/乘坐"+row.seating+"人";
            	}
            },{
            	"targets":10,
            	render:function(data,type,row){
            		if(data!=null){
	            		return getTimeTxt(data,19);
            		}else{
            			return '';
            		}
            	}
            },{
            	"targets":15,
            	render:function(data,type,row){
            		if(data!=null){
	            		return getTimeTxt(data,19);
            		}else{
            			return '';
            		}
            	}
            },{
            	"targets":16,
            	render:function(data,type,row){
            		var str="";
            		if(data=="PAY_OK"){
            			str="交易成功";
            		}else if(data=="CLOSED"){
            			str="交易关闭";
            		}else if(data=="WAITPAY"){
            			str="等待付款";
            		}else if(data=="REFUNDING"){
            			str="退款中";
            		}else if(data=="REFUNDING_UNPOOL"){
            			str="退款中-拼单失败";
            		}else if(data=="REFUNDING_FAIL"){
            			str="退款失败";
            		}else if(data=="REFUNDED"){
            			str="退款完成";
            		}else if(data=="CONSUME"){
            			str="已消费";
            		}else if(data=="UNCONSUME"){
            			str="未消费";
            		}else{
            			str=data;
            		}
            		return str;
            	}
            },{
            	"targets": 17,
            	render: function (data, type, row, d) {
            		var context0 ={
            			func: [
							{"name": "审核记录", "fn": "examineList(\'" + row.id + "\',"+tableType+")", "type": "purple", "icon":"list"},
							{"name": "删除", "fn": "doDelete(\'" + row.id + "\',"+tableType+")", "type": "danger", "icon":"trash"}
            			]
            		};
            		var context1 ={
            			func: [
	            			{"name": "审核", "fn": "doExamine(\'" + row.id + "\',"+tableType+")", "type": "purple", "icon":"search"}
            			]
            		};
            		var context2 ={
            			func: [
	            			{"name": "退款成功", "fn": "doRefund(\'" + row.id + "\',"+tableType+",0)", "type": "purple", "icon":"ok-sign"},
	            			{"name": "退款失败", "fn": "doRefund(\'" + row.id + "\',"+tableType+",1)", "type": "purple", "icon":"remove-sign"}
            			]
            		};
            		var str0=template(context0);
            		var str1="";
            		if(row.is_examine==2){
            			str1=template(context1);
            		}
            		var str2="";
            		if(row.is_examine==0&&row.order_state=="REFUNDING"){
            			str2=template(context2);
            		}
            		var html = str0+str1+str2;
            		return html;
            	}
            }
            ],
            fnInitComplete:function(){
			$('#'+id).DataTable().column(1).visible(false);//隐藏ID行
		},
		"bDestroy": true,
		"ajax": {
			url:"admin/order/cart/refundOrderList",
			data:{type:tableType},
			type: "POST"
		}
	} );
}


function initBusList(id){
	var url="";
	var tableType=$("#"+id).attr("type");
	$('#'+id).DataTable( {
		"columns": [
			{ "data": null },//0
			{ "data": "id" },//1
			{ "data": "car_card" },//2
			{ "data": "title" },//3
			{ "data": "create_time" },//4
			{ "data": "order_code" },//5
			{ "data": "pay_order_id" },//6
			{ "data": "nickname" },//7
			{ "data": "person_phone" },//8
			{ "data": "real_price" },//9
			{ "data": "refund_time" },//10
			{ "data": "pay_type" },//11
			{ "data": "person_name" },//12
			{ "data": "bank_name" },//13
			{ "data": "bank_card" },//14
			{ "data": "refund_over_time" },//15
			{ "data": "order_state" },//16
			{ "data": null }//17
            ],
            "columnDefs": [{
            	"targets":0,
            	render:function(data,type,row){
            		var str="<label><input type='checkbox'  flag='row' value='"+row.id+"' /><span class='lbl'></span></label>";
            		return str;
            	}
            },{
            	"targets":4,
            	render:function(data,type,row){
            		return getTimeTxt(data,10)+" "+row.from_time;
            	}
            },{
            	"targets":3,
            	render:function(data,type,row){
            		return row.fromAddr+"-"+row.toAddr;
            	}
            },{
            	"targets":10,
            	render:function(data,type,row){
            		if(data!=null){
	            		return getTimeTxt(data,19);
            		}else{
            			return '';
            		}
            	}
            },{
            	"targets":15,
            	render:function(data,type,row){
            		if(data!=null){
	            		return getTimeTxt(data,19);
            		}else{
            			return '';
            		}
            	}
            },{
            	"targets":16,
            	render:function(data,type,row){
            		var str="";
            		if(data=="PAY_OK"){
            			str="交易成功";
            		}else if(data=="CLOSED"){
            			str="交易关闭";
            		}else if(data=="WAITPAY"){
            			str="等待付款";
            		}else if(data=="REFUNDING"){
            			str="退款中";
            		}else if(data=="REFUNDING_UNPOOL"){
            			str="退款中-拼单失败";
            		}else if(data=="REFUNDING_FAIL"){
            			str="退款失败";
            		}else if(data=="REFUNDED"){
            			str="退款完成";
            		}else if(data=="CONSUME"){
            			str="已消费";
            		}else if(data=="UNCONSUME"){
            			str="未消费";
            		}else{
            			str=data;
            		}
            		return str;
            	}
            },{
            	"targets": 17,
            	render: function (data, type, row, d) {
            		var context0 ={
            			func: [
							{"name": "审核记录", "fn": "examineList(\'" + row.id + "\',"+tableType+")", "type": "purple", "icon":"list"},
							{"name": "删除", "fn": "doDelete(\'" + row.id + "\',"+tableType+")", "type": "danger", "icon":"trash"}
            			]
            		};
            		var context1 ={
            			func: [
	            			{"name": "审核", "fn": "doExamine(\'" + row.id + "\',"+tableType+")", "type": "purple", "icon":"search"}
            			]
            		};
            		var context2 ={
            			func: [
	            			{"name": "退款成功", "fn": "doRefund(\'" + row.id + "\',"+tableType+",0)", "type": "purple", "icon":"ok-sign"},
	            			{"name": "退款失败", "fn": "doRefund(\'" + row.id + "\',"+tableType+",1)", "type": "purple", "icon":"remove-sign"}
            			]
            		};
            		var str0=template(context0);
            		var str1="";
            		if(row.is_examine==2){
            			str1=template(context1);
            		}
            		var str2="";
            		if(row.is_examine==0&&row.order_state=="REFUNDING"){
            			str2=template(context2);
            		}
            		var html = str0+str1+str2;
            		return html;
            	}
            }
            ],
            fnInitComplete:function(){
			$('#'+id).DataTable().column(1).visible(false);//隐藏ID行
		},
		"bDestroy": true,
		"ajax": {
			url:"admin/order/cart/refundOrderList",
			data:{type:tableType},
			type: "POST"
		}
	} );
}

function initPoolList(id){
	var url="";
	var tableType=$("#"+id).attr("type");
	$('#'+id).DataTable( {
		"columns": [
			{ "data": null },//0
			{ "data": "id" },//1
			{ "data": null },//2
			{ "data": "create_time" },//3
			{ "data": "order_code" },//4
			{ "data": "pay_order_id" },//5
			{ "data": "publish_name" },//6
			{ "data": "publish_phone" },//7
			{ "data": "person_name" },//8
			{ "data": "person_phone" },//9
			{ "data": "real_price" },//10
			{ "data": "real_price" },//11
			{ "data": "real_price" },//12
			{ "data": "refund_time" },//13
			{ "data": "pay_type" },//14
			{ "data": "person_name" },//15
			{ "data": "bank_name" },//16
			{ "data": "bank_card" },//17
			{ "data": "refund_over_time" },//18
			{ "data": "order_state" },//19
			{ "data": null }//20
            ],
            "columnDefs": [{
            	"targets":0,
            	render:function(data,type,row){
            		var str="<label><input type='checkbox'  flag='row' value='"+row.id+"' /><span class='lbl'></span></label>";
            		return str;
            	}
            },{
            	"targets":3,
            	render:function(data,type,row){
            		if(data!=null){
	            		return getTimeTxt(data,19);
            		}else{
            			return '';
            		}
            	}
            },{
            	"targets":2,
            	render:function(data,type,row){
            		return row.startCity+"-"+row.endCity;
            	}
            },{
            	"targets":13,
            	render:function(data,type,row){
            		if(data!=null){
	            		return getTimeTxt(data,19);
            		}else{
            			return '';
            		}
            	}
            },{
            	"targets":18,
            	render:function(data,type,row){
            		if(data!=null){
	            		return getTimeTxt(data,19);
            		}else{
            			return '';
            		}
            	}
            },{
            	"targets":19,
            	render:function(data,type,row){
            		var str="";
            		if(data=="PAY_OK"){
            			str="交易成功";
            		}else if(data=="CLOSED"){
            			str="交易关闭";
            		}else if(data=="WAITPAY"){
            			str="等待付款";
            		}else if(data=="REFUNDING"){
            			str="退款中";
            		}else if(data=="REFUNDING_UNPOOL"){
            			str="退款中-拼单失败";
            		}else if(data=="REFUNDING_FAIL"){
            			str="退款失败";
            		}else if(data=="REFUNDED"){
            			str="退款完成";
            		}else if(data=="CONSUME"){
            			str="已消费";
            		}else if(data=="UNCONSUME"){
            			str="未消费";
            		}else{
            			str=data;
            		}
            		return str;
            	}
            },{
            	"targets": 20,
            	render: function (data, type, row, d) {
            		var context0 ={
            			func: [
							{"name": "审核记录", "fn": "examineList(\'" + row.id + "\',"+tableType+")", "type": "purple", "icon":"list"},
							{"name": "删除", "fn": "doDelete(\'" + row.id + "\',"+tableType+")", "type": "danger", "icon":"trash"}
            			]
            		};
            		var context1 ={
            			func: [
	            			{"name": "审核", "fn": "doExamine(\'" + row.id + "\',"+tableType+")", "type": "purple", "icon":"search"}
            			]
            		};
            		var context2 ={
            			func: [
	            			{"name": "退款成功", "fn": "doRefund(\'" + row.id + "\',"+tableType+",0)", "type": "purple", "icon":"ok-sign"},
	            			{"name": "退款失败", "fn": "doRefund(\'" + row.id + "\',"+tableType+",1)", "type": "purple", "icon":"remove-sign"}
            			]
            		};
            		var str0=template(context0);
            		var str1="";
            		if(row.is_examine==2){
            			str1=template(context1);
            		}
            		var str2="";
            		if(row.is_examine==0&&row.order_state=="REFUNDING"){
            			str2=template(context2);
            		}
            		var html = str0+str1+str2;
            		return html;
            	}
            }
            ],
            fnInitComplete:function(){
			$('#'+id).DataTable().column(1).visible(false);//隐藏ID行
		},
		"bDestroy": true,
		"ajax": {
			url:"admin/order/cart/refundOrderList",
			data:{type:tableType},
			type: "POST"
		}
	} );
}




/**
 * 将毫秒的时间转成时间字符串
 * @param mmSecond
 * @param length
 * @returns {String}
 */
 var getTimeTxt=function(mmSecond,length){
 	var t = new Date(mmSecond);
 	var r=t.getFullYear()+"-";
 	r+=(t.getMonth()+1>=10?t.getMonth()+1:"0"+(t.getMonth()+1));
 	r+="-"+(t.getDate()>=10?t.getDate():"0"+t.getDate());
 	if(length==10){
 		return r;
 	}
 	r+=" "+(t.getHours()>=10?t.getHours():"0"+t.getHours());
 	r+=":"+(t.getMinutes()>=10?t.getMinutes():"0"+t.getMinutes());

 	if(length==16){
 		return r;
 	}

 	r+=":"+(t.getSeconds()>=10?t.getSeconds():"0"+t.getSeconds());
 	if(length==19){
 		return r;
 	}
 }
 </script>
 </html>
