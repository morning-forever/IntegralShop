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
			<li class="active">商品信息</li>
		</ul><!--.breadcrumb-->
	</div><!--#breadcrumbs-->
	<div class="row-fluid">
		<!-- <h3 class="header smaller lighter blue">会员管理</h3> -->
		<div class="table-header">
			商品信息
		</div>
		<table style="margin-left: 5px;" id="btnmenu">
			<tbody>
				<tr>
					<td>
						商品ID：
					</td>
					<td>
						<span style="margin-top: 7px;" class="input-icon">
							<input  type="text" class="mysearch" id="goodsId">
							<i class="icon-search"></i>
						</span>
					</td>
					<td>
						商品名称：
					</td>
					<td>
						<span style="margin-top: 7px;" class="input-icon">
							<input  type="text" class="mysearch"  id="goodsName">
							<i class="icon-search"></i>
						</span>
					</td>
					<td>
						上架状态：
					</td>
					<td>
						<select id="status" name="status" style="width: 100px">
							<option value="">全部</option>
							<option value="0">上架</option>
							<option value="1">下架</option>
						</select>
					</td>
					<td>
						<a title="查询" onclick="" class="btn btn-mini btn-success" id="searchBtn"><i class="icon-search"></i>查询</a>
					</td>
				</tr>
				<tr>
					<td colspan="5">
						<a title="新增" onclick="" href="merchSystem/goods/addProduct" target="mainFrame" class="btn btn-mini btn-info" ><i class="icon-plus"></i> 新增</a>
						<a title="上架" onclick="onLine()" href="javascript:;" class="btn btn-mini btn-info" ><i class="icon-check"></i> 上架</a>
						<a title="下架" onclick="offLine()" href="javascript:;" class="btn btn-mini btn-info" ><i class="icon-check-empty"></i> 下架</a>
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
					<th>商品ID</th>
					<th>商品标题</th>
					<th>规格</th>
					<th>商品原价</th>
					<th>商品现价</th>
					<th>库存</th>
					<th>上架状态</th>
					<th>发布时间</th>
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
		var goodsId = $("#goodsId").val();
		var goodsName = $("#goodsName").val();
		var status = $("#status").val();
		var Serchdate = $("#Serchdate").val();
		
		var json = '{"goodsId":"'+goodsId+'","goodsName":"'+goodsName+'","status":"'+status+'","Serchdate":"'+Serchdate+'"}';
		
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
	console.info("删除ID："+id);
	bootbox.confirm("确定要删除该商品么?", function(result) {
		if(result){
			$.ajax({
				url : "merchSystem/goods/delete",
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
	bootbox.confirm("确定要删除选中的商品么?", function(result) {
		if(result){
			$.ajax({
				url : "merchSystem/goods/delete",
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
	bootbox.confirm("确定要上架选中的商品么?", function(result) {
		if(result){
			$.ajax({
				url : "merchSystem/goods/online",
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
	bootbox.confirm("确定要下架选中的商品么?", function(result) {
		if(result){
			$.ajax({
				url : "merchSystem/goods/offline",
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
            { "data": null },
            { "data": "id" },
            { "data": "number" },
            { "data": "title" },
            { "data": "spec" },
            { "data": "original_price" },
            { "data": "current_price" },
            { "data": "volume" },
            { "data": "is_shelves" },
            { "data": "create_time" },
            { "data": null }
        ],
        "columnDefs": [{
					"targets":0,
					render:function(data,type,row){
						var str="<label><input type='checkbox'  flag='row' value='"+row.id+"' /><span class='lbl'></span></label>";
						return str;
					}
				},{
					"targets":8,
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
					"targets":9,
					render:function(data,type,row){
						return getTimeTxt(data,19);
					}
        		},{
		            "targets": 10,
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
        	url:"merchSystem/goods/list",	
        	type: "POST"
        }
    } );
}





function doEdit(id){
	window.location.href="merchSystem/goods/editProduct?id="+id;
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
