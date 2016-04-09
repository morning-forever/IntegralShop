<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<base href="${system.basePath }">
	<%@ include file="/static/inc.jsp" %>

</head>
<link href="static/web/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
<style type="text/css">
.small-input{
	width: 180px;
}
table.dataTable thead th{
	padding: 10px 0px;
	text-align: center;
}
</style>
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
			<li><a href="admin/order/depth/main">旅游</a></li>
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
										<span>昵称:</span>
										<input name="nickName" class="small-input">
										<span>商品订单号:</span>
										<input name="orderCode" class="small-input">
										<span>支付订单号:</span>
										<input name="payOrderId" class="small-input">
										<span>联系电话:</span>
										<input name="phone" class="small-input">
										</td>
									</tr>
									<tr>
										<td>
										<span>订单状态:</span>
										<select name="orderType">
											<option value="">全部</option>
											<option value="WAITPAY">等待付款</option>
											<option value="PAY_OK">交易成功</option>
											<option value="CLOSED">交易关闭</option>
											<option value="REFUNDING">退款中</option>
											<option value="REFUNDING_UNPOOL">退款中-拼单失败</option>
											<option value="REFUNDING_FAIL">退款失败</option>
											<option value="REFUNDED">退款完成</option>
										</select>
										<span>订单时间:</span>
										<div class="input-prepend">
											<span class="add-on"><i class="icon-calendar"></i></span>
											<input type="text" id="startDate" name="startDate" readonly="readonly" class="span11 mydate-picker" data-date-format="yyyy-mm-dd" tips="请选择开始时间">
										</div>&nbsp;&nbsp;&nbsp;
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
								<th style="width: 150px">标题</th>
								<th>商品订单号</th>
								<th>支付订单号</th>
								<th>昵称</th>
								<th>联系人姓名</th>
								<th>联系人电话</th>
								<th>订单金额</th>
								<th>订单时间</th>
								<th>订单状态</th>
								<th>操作</th>
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
										<span>昵称:</span>
										<input name="nickName" class="small-input">
										<span>商品订单号:</span>
										<input name="orderCode" class="small-input">
										<span>支付订单号:</span>
										<input name="payOrderId" class="small-input">
										<span>联系电话:</span>
										<input name="phone" class="small-input">
										</td>
									</tr>
									<tr>
										<td>
										<span>订单状态:</span>
										<select name="orderType">
											<option value="">全部</option>
											<option value="WAITPAY">等待付款</option>
											<option value="PAY_OK">交易成功</option>
											<option value="CLOSED">交易关闭</option>
											<option value="REFUNDING">退款中</option>
											<option value="REFUNDING_UNPOOL">退款中-拼单失败</option>
											<option value="REFUNDING_FAIL">退款失败</option>
											<option value="REFUNDED">退款完成</option>
										</select>
										<span>订单时间:</span>
										<div class="input-prepend">
											<span class="add-on"><i class="icon-calendar"></i></span>
											<input type="text" id="startDate" name="startDate" readonly="readonly" class="span11 mydate-picker" data-date-format="yyyy-mm-dd" tips="请选择开始时间">
										</div>&nbsp;&nbsp;&nbsp;
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
								<th style="width: 150px">标题</th>
								<th>车系</th>
								<th>座位数</th>
								<th>商品订单号</th>
								<th>支付订单号</th>
								<th>昵称</th>
								<th>联系人姓名</th>
								<th>联系人电话</th>
								<th>订单金额</th>
								<th>订单时间</th>
								<th>订单状态</th>
								<th>操作</th>
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
										<div class="limitDiv">
										<span class="btn" _val="1">今日</span>
										<span class="btn btn-inverse" _val="0">最近30天</span>
										<input type="hidden" class="limit" name="limit" value="0">
										</div>
									</td>
									<td>
										<span>商品标题:</span>
										<input name="title" class="small-input">
									</td>
									<td>
										<span>订单发起时间:</span>
										<div class="input-prepend">
											<span class="add-on"><i class="icon-calendar"></i></span>
											<input type="text" id="startDate" name="startDate" readonly="readonly" class="span11 mydate-picker" data-date-format="yyyy-mm-dd" tips="请选择开始时间">
										</div>
									</td>
									<td>
										<span>发车时间:</span>
										<div class="input-append bootstrap-timepicker">
										<div class="bootstrap-timepicker-widget dropdown-menu">
										 </div>
											<input id="timeEnd" name="timeEndStr" value="${endTime }" type="text" class="input-small">
											<span class="add-on"><i class="icon-time"></i></span>
										</div>
										<a title="搜索" href="javascript:;" target="mainFrame" class="btn btn-mini btn-success searchBtn" ><i class="icon-search"></i> 搜索</a>
									</td>
								</tr>
								<tr>
									<td>
										<a title="删除" onclick="doDeletesCar(3)" href="javascript:;" class="btn btn-mini btn-info" ><i class="icon-trash"></i> 删除</a>
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
								<th>座位数</th>
								<th>剩余</th>
								<th>已支付</th>
								<th>未支付</th>
								<th>单程价</th>
								<th>出发日期</th>
								<th>出发时间</th>
								<th>预计到达时间</th>
								<th>操作</th>
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
										<div class="limitDiv">
										<span class="btn" _val="1">今日</span>
										<span class="btn btn-inverse" _val="0">最近30天</span>
										<input type="hidden" class="limit" name="limit" value="0">
										</div>
									</td>
									<td>
										<span>商品标题:</span>
										<input name="title" class="small-input">
									</td>
									<td>
										<span>订单发起时间:</span>
										<div class="form-item inline" style="width: 186px;">
											<i class="iicon i-date"></i> <input style="width: 150px;" class="datetime form-control" name="createDate" id="startDate" readonly type="text" placeholder="请选择日期" />
										</div>
									</td>
									<td>
										<span>发车时间:</span>
										<div class="form-item inline" style="width: 186px;">
											<i class="iicon i-date"></i> <input style="width: 150px;" class="datetime form-control" name="startDate" id="startTime" readonly type="text" placeholder="请选择日期" />
										</div> 
										<a title="搜索" href="javascript:;" target="mainFrame" class="btn btn-mini btn-success searchBtn" ><i class="icon-search"></i> 搜索</a>
									</td>
								</tr>
								<tr>
									<td>
										<a title="删除" onclick="doDeletesCar(4)" href="javascript:;" class="btn btn-mini btn-info" ><i class="icon-trash"></i> 删除</a>
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
								<th style="width: 150px">标题</th>
								<th>昵称</th>
								<th>姓名</th>
								<th>联系方式</th>
								<th>单笔最高金额</th>
								<th>拼单人数</th>
								<th>拼单金额合计</th>
								<th>已支付人数</th>
								<th>已支付金额</th>
								<th>未支付人数</th>
								<th>未支付金额</th>
								<th>实际需人数</th>
								<th>实际需单价</th>
								<th>实际需总计</th>
								<th>退款人数</th>
								<th>退款单价</th>
								<th>退款总计</th>
								<th>拼单发起时间</th>
								<th>发车时间</th>
								<th>拼车状态</th>
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


	<%@ include file="/static/foot.jsp" %>
</body>
<script type="text/javascript" src="static/js/jquery.form.js"></script>
<script type="text/javascript" src="static/js/daterangepicker.min.js"></script>
<script type="text/javascript" src="static/js/bootstrap-timepicker.min.js"></script>
<script type="text/javascript" src="static/web/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="static/web/js/base.js"></script>
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
	$('.datetime').datetimepicker({
		autoclose:1,
		format:"yyyy-mm-dd hh:ii",
		//minView: 2,
		todayBtn: true,
		language : "zh-CN"
	});
	
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
	
    $("#table_pool").on('draw.dt', function() {
    	$(".dataTables_wrapper").css("width","1500px");
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
		if($(this).hasClass("btn-inverse")){
			$(this).removeClass("btn-inverse");
			$(this).siblings(".limit").val("");
		}else{
			$(this).addClass("btn-inverse").siblings().removeClass("btn-inverse");
			$(this).siblings(".limit").val($(this).attr("_val"));
		}
	});
	
});	

function doDeleteCar(id,type){
	var url="";
	url="admin/order/cart/deletesCar";
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

function doDeletesCar(type){
	var idStr="";
	var url="";
	url="admin/order/cart/deletesCar";
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


function doDelete(id,type){
	var url="";
	// if(type==1){
		url="admin/order/cart/deletes";
	// }else{
	// 	url="";
	// }
	
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



function doCheck(id,type){
	window.location.href="admin/order/cart/check_"+id+"_"+type;
}

function doCheckBusList(id,data){
	window.location.href="admin/order/cart/checkBusList_"+id+"_"+data;
}

function doCheckPoolList(id){
	window.location.href="admin/order/cart/checkPoolList_"+id;
}




function initRentList(id){
	var url="";
	var tableType=$("#"+id).attr("type");
	$('#'+id).DataTable( {
		"columns": [
            { "data": null },//0
            { "data": "id" },//1
            { "data": "title" },//2
            { "data": "order_code" },//3
            { "data": "pay_order_id" },//4
            { "data": "nickname" },//5
            { "data": "person_name" },//6
            { "data": "phone" },//7
            { "data": "real_price" },//8
            { "data": "create_time" },//9
            { "data": "order_state" },//10
            { "data": null }//11
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
            		return row.brand+ row.sys+"/"+ row.car_type+"/"+ row.outputs+ row.gearbox;;
            	}
            },{
            	"targets":9,
            	render:function(data,type,row){
            		return getTimeTxt(data,19);
            	}
            },{
            	"targets":10,
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
            	"targets": 11,
            	render: function (data, type, row, d) {
            		var context =
            		{
            			func: [
            			{"name": "查看", "fn": "doCheck(\'" + row.id + "\',"+tableType+")", "type": "purple", "icon":"search"},
            			{"name": "删除", "fn": "doDelete(\'" + row.id + "\',"+tableType+")", "type": "danger", "icon":"trash"}
            			]
            		};
            		var html = template(context);
            		return html;
            	}
            }
            ],
            fnInitComplete:function(){
			$('#'+id).DataTable().column(1).visible(false);//隐藏ID行
		},
		"bDestroy": true,
		"ajax": {
			url:"admin/order/cart/list",
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
            { "data": "phone" },//9
            { "data": "real_price" },//10
            { "data": "create_time" },//11
            { "data": "order_state" },//12
            { "data": null }//13
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
            	"targets":11,
            	render:function(data,type,row){
            		return getTimeTxt(data,19);
            	}
            },{
            	"targets":12,
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
            	"targets": 13,
            	render: function (data, type, row, d) {
            		var context =
            		{
            			func: [
            			{"name": "查看", "fn": "doCheck(\'" + row.id + "\',"+tableType+")", "type": "purple", "icon":"search"},
            			{"name": "删除", "fn": "doDelete(\'" + row.id + "\',"+tableType+")", "type": "danger", "icon":"trash"}
            			]
            		};
            		var html = template(context);
            		return html;
            	}
            }
            ],
            fnInitComplete:function(){
			$('#'+id).DataTable().column(1).visible(false);//隐藏ID行
		},
		"bDestroy": true,
		"ajax": {
			url:"admin/order/cart/list",
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
            { "data": "seating" },//4
            { "data": "surplus" },//5
            { "data": "payOrder" },//6
            { "data": "unPayOrder" },//7
            { "data": "price" },//8
            { "data": "start_date" },//9
            { "data": "from_time" },//10
            { "data": "to_time" },//11
            { "data": null }//12
            ],
            "columnDefs": [{
            	"targets":0,
            	render:function(data,type,row){
            		var str="<label><input type='checkbox'  flag='row' value='"+row.id+"' /><span class='lbl'></span></label>";
            		return str;
            	}
            },{
            	"targets": 12,
            	render: function (data, type, row, d) {
            		var context =
            		{
            			func: [
            			{"name": "查看", "fn": "doCheckBusList(\'" + row.id + "\',\'"+row.start_date+"\')", "type": "purple", "icon":"search"},
            			{"name": "删除", "fn": "doDeleteCar(\'" + row.id + "\',"+tableType+")", "type": "danger", "icon":"trash"}
            			]
            		};
            		var html = template(context);
            		return html;
            	}
            }
            ],
            fnInitComplete:function(){
			$('#'+id).DataTable().column(1).visible(false);//隐藏ID行
		},
		"bDestroy": true,
		"ajax": {
			url:"admin/order/cart/list",
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
            { "data": "nickname" },//3
            { "data": "publish_name" },//4
            { "data": "publish_phone" },//5
            { "data": "max_price" },//6
            { "data": "peopleNumber" },//7 拼单总人数
            { "data": null },//8
            { "data": "payPeople" },//9 已支付人数
            { "data": null },//10
            { "data": "unPayPeople" },//11 未支付人数
            { "data": null },//12
            { "data": "payPeople" },//13 实际需支付人数
            { "data": null },//14
            { "data": null },//15
            { "data": "payPeople" },//16 退款
            { "data": null },//17
            { "data": null },//18
            { "data": "create_time" },//19 
            { "data": "start_time" },//20
            { "data": "flag" },//21
            { "data": null }//22
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
	        		return row.startCity+"-"+row.endCity;
	        	}
            },{
	            "targets":8,
	        	render:function(data,type,row){
	        		return row.max_price.mul(row.peopleNumber);
	        	}
            },{
	            "targets":10,
	        	render:function(data,type,row){
	        		return row.max_price.mul(row.payPeople);
	        	}
            },{
	            "targets":12,
	        	render:function(data,type,row){
	        		return row.max_price.mul(row.unPayPeople);
	        	}
            },{
	            "targets":13,
	        	render:function(data,type,row){
	        		if(row.flag=='0'){
	        			return row.payPeople;
	        		}else{
	        			return '';
	        		}
	        	}
            },{
	            "targets":14,
	        	render:function(data,type,row){
	        		if(row.flag=='0'){
	        			if(row.payPeople==0){
	        				return 0;
	        			}else{
	        				return row.max_price.mul(6).div(row.payPeople);
	        			}
	        		}else{
	        			return '';
	        		}
	        	}
            },{
	            "targets":15,
	        	render:function(data,type,row){
	        		if(row.flag=='0'){
	        			return row.max_price.mul(6);
	        		}else{
	        			return '';
	        		}
	        	}
            },{
	            "targets":16,
	        	render:function(data,type,row){
        			return row.payPeople;
	        	}
            },{
	            "targets":17,
	        	render:function(data,type,row){
	        		if(row.flag=='0'){
	        			if(row.payPeople==0){
	        				return 0;
	        			}else{
	        				return parseInt(row.payPeople.sub(6)).div(row.payPeople).mul(row.max_price);//(x-6)/x*price
	        			}
	        		}else{
	        			return row.max_price;
	        		}
	        	}
            },{
	            "targets":18,
	        	render:function(data,type,row){
	        		if(row.flag=='0'){
        				return parseInt(row.payPeople.sub(6)).mul(row.max_price);//(x-6)*price
	        		}else{
	        			return row.max_price.mul(row.payPeople);
	        		}
	        	}
            },{
	            "targets":19,
	        	render:function(data,type,row){
	        		return getTimeTxt(data,19);
	        	}
            },{
	            "targets":20,
	        	render:function(data,type,row){
	        		return getTimeTxt(data,19);
	        	}
            },{
	            "targets":21,
	        	render:function(data,type,row){
	        		var str="";
	        		if(data==2){
	        			str="拼车中";
	        		}else if(data==1){
	        			str="拼车失败";
	        		}else if(data==0){
	        			str="拼车成功";
	        		}else{	        			
	        			str=data;
	        		}
	        		return str;
	        	}
            },{
            	"targets": 22,
            	render: function (data, type, row, d) {
            		var context =
            		{
            			func: [
            			{"name": "查看", "fn": "doCheckPoolList(\'" + row.id + "\')", "type": "purple", "icon":"search"},
            			{"name": "删除", "fn": "doDeleteCar(\'" + row.id + "\',"+tableType+")", "type": "danger", "icon":"trash"}
            			]
            		};
            		var html = template(context);
            		return html;
            	}
            }
            ],
            fnInitComplete:function(){
			$('#'+id).DataTable().column(1).visible(false);//隐藏ID行
		},
		"bDestroy": true,
		"ajax": {
			url:"admin/order/cart/list",
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
