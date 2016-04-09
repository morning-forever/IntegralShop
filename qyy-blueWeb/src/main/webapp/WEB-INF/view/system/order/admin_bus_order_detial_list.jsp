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
</style>
<body>
	<div class="container-fluid" id="main-container">
		<div id="breadcrumbs">
			<ul class="breadcrumb">
				<li><i class="icon-home"></i> <a href="javascript:;">当前</a><span class="divider"><i class="icon-angle-right"></i></span></li>
				<li class="active">班车订单详情列表</li>
			</ul><!--.breadcrumb-->
		</div><!--#breadcrumbs-->
		<div class="table-header">班车订单详情列表</div>
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
										<a title="返回" onclick="doBack()" href="javascript:;" class="btn btn-mini btn-info" ><i class="icon-trash"></i> 返回</a>
										<a title="删除" onclick="doDeletes(1)" href="javascript:;" class="btn btn-mini btn-info" ><i class="icon-trash"></i> 删除</a>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
					<table id="table" type="1" class="table table-striped table-bordered table-hover">
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
								<th>人数</th>
								<th>订单时间</th>
								<th>订单状态</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody></tbody> 
					</table>
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

var typeStrArr=["table_rent","table_master","table_friend","table_question","table_complaint"];

$(document).ready(function(){
	
	//初始化时间插件
	$('.mydate-picker').datepicker();
	
	//初始化Tab页

    

    
    initList("table");
	
	
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
		$(this).addClass("btn-inverse").siblings().removeClass("btn-inverse");
		$("#limit").val($(this).attr("_val"));
	});
	
});	



function doDelete(id,type){
	var url="";
	// if(type==1){
		url="admin/order/cart/deletes";
	// }else{
	// 	url="";
	// }
	
	bootbox.confirm("确定要删除该推荐么?", function(result) {
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
	bootbox.confirm("确定要删除选中的推荐么?", function(result) {
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



function doCheck(id){
	window.location.href="admin/order/cart/check_"+id+"_3";
}


function doBack(){
	window.location.href="admin/order/cart/index";
}




function initList(id){
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
            { "data": "person_phone" },//7
            { "data": "real_price" },//8
            { "data": "peopleNumber" },//9
            { "data": "create_time" },//10
            { "data": "order_state" },//11
            { "data": null }//12
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
            		return row.fromAddr+"-"+ row.toAddr;
            	}
            },{
            	"targets":10,
            	render:function(data,type,row){
            		return getTimeTxt(data,19);
            	}
            },{
            	"targets":11,
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
            	"targets": 12,
            	render: function (data, type, row, d) {
            		var context =
            		{
            			func: [
            			{"name": "查看", "fn": "doCheck(\'" + row.id + "\')", "type": "purple", "icon":"search"},
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
			url:"admin/order/cart/detialList",
			data:{type:tableType,busId:"${busId}",date:"${date}"},
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
