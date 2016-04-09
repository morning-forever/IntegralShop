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
			<li class="active">车辆管理</li>
		</ul><!--.breadcrumb-->
	</div><!--#breadcrumbs-->
	<div class="table-header">
		车辆及路线
	</div>
	<ul class="nav nav-tabs" id="otherInfoTab">
	    <li class="active" ><a href="javascript:;">租车车辆信息</a></li>
	    <li ><a href="admin/cart/wrap/main">包车车辆信息</a></li>
	    <li ><a href="admin/cart/bus/main">班车车辆信息及路线</a></li>
	    <li ><a href="admin/cart/carpool/main">拼车路线</a></li>
	</ul>
	<div class="row-fluid">
		<!-- <h3 class="header smaller lighter blue">会员管理</h3> -->
		<form action="">
		<table style="margin-left: 5px;" id="btnmenu">
			<tbody>
				<tr>
					<td>
						车辆品牌：
					</td>
					<td>
						<select id="brandId" name="brandId" style="width: 100px" onchange="getSys()">
							<option value="">全部</option>
							<c:forEach items="${brandList }" var="brand">
								<option value="${brand.id }">${brand.brand }</option>
							</c:forEach>
						</select>
					</td>
					<td>
						车系：
					</td>
					<td>
						<select id="sysId" name="sysId" style="width: 100px">
							<option value="">全部</option>
						</select>
					</td>
					<td>
						座位数：
					</td>
					<td>
						<select id="seating" name="seating" style="width: 100px">
							<option value="">请选择</option>
							<option value="5">5</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="17">17</option>
							<option value="37">37</option>
							<option value="57">57</option>
						</select>
					</td>
					<td>
						日均价：
					</td>
					<td>
						<span style="margin-top: 7px;" class="input-icon">
							<input  type="text" name="price"  id="price">
							<i class="icon-search"></i>
						</span>
					</td>
					<td>
						<a title="查询" onclick="" class="btn btn-mini btn-success" id="searchBtn"><i class="icon-search"></i>查询</a>
					</td>
				</tr>
				<tr>
					<td colspan="5">
						<a title="新增" onclick="" href="admin/cart/rent/goAdd" target="mainFrame" class="btn btn-mini btn-info" ><i class="icon-plus"></i> 新增</a>
						<a title="上架" onclick="onLine()" href="javascript:;" class="btn btn-mini btn-info" ><i class="icon-check"></i> 上架</a>
						<a title="下架" onclick="offLine()" href="javascript:;" class="btn btn-mini btn-info" ><i class="icon-check-empty"></i> 下架</a>
						<a title="删除" onclick="doDeletes()" href="javascript:;" class="btn btn-mini btn-info" ><i class="icon-trash"></i> 删除</a>
					</td>
				</tr>
			</tbody>
		</table>
		</form>
		<table id="table_report" class="table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th class='center'>
						<label><input type='checkbox' id="tableCheckbox" onchange="changeAllCheckbox()" /><span class="lbl"></span></label>
					</th>
					<th>ID</th>
					<th>图片</th>
					<th>品牌</th>
					<th>车系</th>
					<th>年代</th>
					<th>座位数</th>
					<th>数量</th>
					<th>日均价</th>
					<th style="width: 50px">市</th>
					<th>区</th>
					<th>门户</th>
					<th style="width: 56px">上架状态</th>
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
		
		if(isNaN($("#price").val())){
			$("#price").val("");
		}
		
		var json='{';
		var valueArr=$("form").serialize().split("&");
		//console.info(valueArr);
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

    /* $('#otherInfoTab a').click(function(e) {
        e.preventDefault();//阻止a链接的跳转行为
        $(this).tab('show');//显示当前选中的链接及关联的content
    }) */
    
    
})


function getSys(){
	var id=$("#brandId").val();
	$.post("admin/cart/rent/getSysList",{id:id},function(data){
		var list=data.list;
		$("#sysId").html("");
		$("#sysId").append('<option value="">全部</option>');
		for(var i=0;i<list.length;i++){
			$("#sysId").append('<option value="'+list[i].id+'">'+list[i].sys+'</option>');
		}
	})
}


function doDelete(id){
	bootbox.confirm("确定要删除该商品么?", function(result) {
		if(result){
			$.ajax({
				url : "admin/cart/rent/deletes",
				post : "post",
				data:{
					"ids":id
				},
				success:function(data){
					if(data.status == "success"){
						bootbox.alert("删除成功！");
						$('#table_report').DataTable().clear();
						$('#table_report').DataTable().draw();
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
	if(idStr==""){
		bootbox.alert("请选择需要删除的车辆品牌");
		return;
	}
	bootbox.confirm("确定要删除选中的商品么?", function(result) {
		if(result){
			$.ajax({
				url : "admin/cart/rent/deletes",
				post : "post",
				data:{
					"ids":idStr
				},
				success:function(data){
					if(data.status == "success"){
						bootbox.alert("删除成功！");
						$('#table_report').DataTable().clear();
						$('#table_report').DataTable().draw();
					}
				}
				
			});
		}
	});
}

function onLine(){
	var idStr="";
	$("input[flag=row]").each(function(){
		if(this.checked){
			idStr+=this.value+",";
		}
	});
	if(idStr==""){
		bootbox.alert("请选择需要上架的车辆品牌");
		return;
	}
	bootbox.confirm("确定要上架选中的商品么?", function(result) {
		if(result){
			$.ajax({
				url : "admin/cart/rent/onLine",
				post : "post",
				data:{
					"ids":idStr
				},
				success:function(data){
					if(data.status == "success"){
						bootbox.alert("上架成功！");
						$('#table_report').DataTable().clear();
						$('#table_report').DataTable().draw();
					}
				}
				
			});
		}
	});
}

function offLine(){
	var idStr="";
	$("input[flag=row]").each(function(){
		if(this.checked){
			idStr+=this.value+",";
		}
	});
	if(idStr==""){
		bootbox.alert("请选择需要下架的车辆品牌");
		return;
	}
	bootbox.confirm("确定要下架选中的商品么?", function(result) {
		if(result){
			$.ajax({
				url : "admin/cart/rent/offLine",
				post : "post",
				data:{
					"ids":idStr
				},
				success:function(data){
					if(data.status == "success"){
						bootbox.alert("下架成功！");
						$('#table_report').DataTable().clear();
						$('#table_report').DataTable().draw();
					}
				}
				
			});
		}
	});
}


 

function initMainList(){
	$('#table_report').DataTable( {
	    "columns": [
            { "data": null },//0
            { "data": "id" },//1
            { "data": "url" },//2
            { "data": "brand" },//3
            { "data": "sys" },//4
            { "data": "year" },//5
            { "data": "seating" },//6
            { "data": "counts" },//7
            { "data": "price" },//8
            { "data": "city" },//9
            { "data": "county" },//10
            { "data": "store" },//11
            { "data": "is_shelves" },//12
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
						return '<img src="'+data+'" width="50" height="50">';
					}
				},{
					"targets":12,
					render:function(data,type,row){
						var str="";
						if(data==0){
							str="上架";
						}else if(data==1){
							str="下架";
						}else{
							str="-";
						}
						return str;
					}
        		},{
		            "targets": 13,
		            render: function (data, type, row, d) {
		                var context =
		                {
		                    func: [
		                        {"name": "编辑", "fn": "doEdit(\'" + row.id + "\')", "type": "purple", "icon":"edit"},
		                        {"name": "删除", "fn": "doDelete(\'" + row.id + "\')", "type": "danger", "icon":"trash"}
		                    ]
		                };
		                var html = template(context);
		                return html;
		            }
		        }
        ],
		fnInitComplete:function(){
			$('#table_report').DataTable().column(1).visible(false);//隐藏ID行
		},
        "bDestroy": true,
        "ajax": {
        	url:"admin/cart/rent/list",
        	type: "POST"
        }
    } );
}





function doEdit(id){
	window.location.href="admin/cart/rent/editRent"+id;
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
