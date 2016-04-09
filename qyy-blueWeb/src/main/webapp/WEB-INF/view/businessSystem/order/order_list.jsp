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
</style>
<body>
<div class="container-fluid" id="main-container">
	<div id="breadcrumbs">
		<ul class="breadcrumb">
			<li><i class="icon-home"></i> <a href="javascript:;">当前</a><span class="divider"><i class="icon-angle-right"></i></span></li>
			<li class="active">订单信息</li>
		</ul><!--.breadcrumb-->
	</div><!--#breadcrumbs-->
	<div class="row-fluid">
		<!-- <h3 class="header smaller lighter blue">会员管理</h3> -->
		<div class="table-header">
			订单信息
		</div>
		<table style="margin-left: 5px;" id="btnmenu">
			<tbody>
				<tr>
					<td>
						用户账号：
					</td>
					<td>
						<span style="margin-top: 7px;" class="input-icon">
							<input  type="text" class="mysearch" id="user">
							<i class="icon-search"></i>
						</span>
					</td>
					<td>
						商品订单号：
					</td>
					<td>
						<span style="margin-top: 7px;" class="input-icon">
							<input  type="text" class="mysearch" id="orderId">
							<i class="icon-search"></i>
						</span>
					</td>
					<td>
						支付订单号：
					</td>
					<td>
						<span style="margin-top: 7px;" class="input-icon">
							<input  type="text" class="mysearch" id="payId">
							<i class="icon-search"></i>
						</span>
					</td>
					<td>
						联系电话：
					</td>
					<td>
						<span style="margin-top: 7px;" class="input-icon">
							<input  type="text" class="mysearch"  id="phone">
							<i class="icon-search"></i>
						</span>
					</td>
					</tr><tr>
					<td>
						时间：
					</td>
					<td>
						<div class="input-prepend">
							<span class="add-on"><i class="icon-calendar"></i></span>
							<input type="text" id="Serchdate" readonly="readonly" class="span11 mydate-picker" data-date-format="yyyy-mm-dd">
						</div>
					</td>
					<td>
						上架状态：
					</td>
					<td>
						<select id="status" name="status" style="width: 100px">
							<option value="">全部</option>
							<option value="WAITPAY">等待付款</option>
							<option value="CLOSED">交易关闭</option>
							<option value="REFUNDING">退款中</option>
							<option value="REFUNDED">退款完成</option>
							<option value="CONSUME">已消费</option>
							<option value="UNCONSUME">未消费</option>
						</select>
					</td>
					<td>
						<a title="查询" onclick="" class="btn btn-mini btn-success" id="searchBtn"><i class="icon-search"></i>查询</a>
					</td>
				</tr>
				<tr>
					<td colspan="5">
						<a title="删除" onclick="doDeletes()" href="javascript:;" class="btn btn-mini btn-info" ><i class="icon-trash"></i> 删除</a>
					</td>
				</tr>
			</tbody>
		</table>
		<table id="table_report" class="table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th class='center'>
						<label><input type='checkbox' id="tableCheckbox" onchange="changeAllCheckbox()" /><span class="lbl"></span></label>
					</th>
					<th>ID</th>
					<th>序号</th>
					<th width="100px">商品名称</th>
					<th>商品订单号</th>
					<th>支付订单号</th>
					<th>用户账号</th>
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
<!-- #main-content -->



<%@ include file="/static/foot.jsp" %>
</body>
<script type="text/javascript" src="static/js/jquery.form.js"></script>
<script type="text/javascript" src="static/js/daterangepicker.min.js"></script>
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
	
	$('.mydate-picker').datepicker();
	
	initMainList();
	
	var table = $("#table_report").DataTable();
	
	$("#searchBtn").click(function(){
		var user = $("#user").val();
		var payId = $("#payId").val();
		var orderId = $("#orderId").val();
		var phone = $("#phone").val();
		var Serchdate = $("#Serchdate").val();
		var status = $("#status").val();
		
		var json = '{"user":"'+user+'","payId":"'+payId+
			'","status":"'+status+'","Serchdate":"'+Serchdate+
			'","orderId":"'+orderId+'","phone":"'+phone+'"}';
		
    	table.search(json).draw();
	});
	
	//$('#table_report tr').removeClass("odd");
	
	$('#table_report').on( 'click', 'td', function () {
        //$(this).find("input[flag=row]").click();
        if($(this).find("input[flag=row]").length==0){
        	$(this).parent("tr").find("input[flag=row]").click();
        }
    } );
	
	$("#tableCheckbox").click(function(){
		var flag=this.checked;
		$("input[flag=row]").each(function(){
			this.checked=flag;
		});
	});
});	

/*tab页*/
$(function() {
    $('#otherInfoTab a:first').tab('show');//初始化显示哪个tab

    $('#otherInfoTab a').click(function(e) {
        e.preventDefault();//阻止a链接的跳转行为
        $(this).tab('show');//显示当前选中的链接及关联的content
    })
    
    
})



function doDelete(id){
	bootbox.confirm("确定要删除该订单么?", function(result) {
		if(result){
			$.ajax({
				url : "merchSystem/order/delete",
				post : "post",
				data:{
					"ids":id
				},
				success:function(data){
					if(data.status == "success"){
						bootbox.alert("删除成功！");
						$('#table_report').DataTable().clear();
						$('#table_report').DataTable().draw();
					}else{
						bootbox.alert("删除失败，请稍后重试");
					}
				}
				
			});
		}
	});
}

function doDeletes(){
	var idStr="";
	$("input[flag=row]").each(function(){
		if(this.checked){
			idStr+=this.value+",";
		}
	});
	bootbox.confirm("确定要删除选中的订单么?", function(result) {
		if(result){
			$.ajax({
				url : "merchSystem/order/delete",
				post : "post",
				data:{
					"ids":idStr
				},
				success:function(data){
					if(data.status == "success"){
						bootbox.alert("删除成功！");
						$('#table_report').DataTable().clear();
						$('#table_report').DataTable().draw();
					}else{
						bootbox.alert("删除失败，请稍后重试");
					}
				}
				
			});
		}
	});
}

function doClose(id){
	bootbox.confirm("确定要关闭该订单么?", function(result) {
		if(result){
			$.ajax({
				url : "merchSystem/order/close",
				post : "post",
				data:{
					"id":id
				},
				success:function(data){
					if(data.status == "success"){
						bootbox.alert("关闭成功！");
						$('#table_report').DataTable().clear();
						$('#table_report').DataTable().draw();
					}else{
						bootbox.alert("关闭失败，请稍后重试");
					}
				}
				
			});
		}
	});
}


 

function initMainList(){
	$('#table_report').DataTable( {
	    "columns": [
            { "data": null },
            { "data": null },
            { "data": "id" },
            { "data": "title" },
            { "data": "order_code" },
            { "data": "pay_order_id" },
            { "data": "nickname" },
            { "data": "phone" },
            { "data": "count_price" },
            { "data": "create_time" },
            { "data": "order_state" },
            { "data": null }
        ],
        "columnDefs": [{
					"targets":0,
					render:function(data,type,row){
						var str="<label><input type='checkbox'  flag='row' value='"+row.id+"' /><span class='lbl'></span></label>";
						return str;
					}
				},{
					"targets":1,
					render:function(data,type,row,meta){
						return meta.row;
					}
				},{
					"targets":10,
					render:function(data,type,row,meta){
						var str="";
						if(data=='WAITPAY'){
							str="等待付款";
						}else if(data=='CLOSED'){
							str="交易关闭";
						}else if(data=='REFUNDING'){
							str="退款中";
						}else if(data=='REFUNDED'){
							str="退款完成";
						}else if(data=='CONSUME'){
							str="已消费";
						}else if(data=='UNCONSUME'){
							str="未消费";
						}else{
							str="-";
						}
						return str;
					}
				},{
					"targets":9,
					render:function(data,type,row){
						return getTimeTxt(data,19);
					}
        		},{
		            "targets": 11,
		            render: function (data, type, row, d) {
		                var context =
		                {
		                    func: [
		                        {"name": "查看", "fn": "doCheck(\'" + row.id + "\')", "type": "purple", "icon":"search"}
		                    ]
		                };
		                var context2="";
		                if(row.order_state=='WAITPAY'){
		                	context2={
		 		                func:[
		 		                	{"name": "关闭订单", "fn": "doClose(\'" + row.id + "\')", "type": "danger", "icon":"off"}
		 		             	]	
		 		             };
		                	 context2=template(context2);
		                }
		                var context3={
		                	func:[
		                	      {"name": "删除", "fn": "doDelete(\'" + row.id + "\')", "type": "danger", "icon":"trash"}
		                	]	
		                };
		                return template(context)+context2+template(context3);
		            }
		        }
        ],
		fnInitComplete:function(){
			$('#table_report').DataTable().column(1).visible(false);//隐藏ID行
		},
        "bDestroy": true,
        "ajax": {
        	url:"merchSystem/order/list",	
        	type: "POST"
        }
    } );
}





function doCheck(id){
	window.location.href="merchSystem/order/check?id="+id;
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
