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
select{
	width:70px
}
</style>
<body>
<div class="container-fluid" id="main-container">
	<div id="breadcrumbs">
		<ul class="breadcrumb">
			<li><i class="icon-home"></i> <a href="javascript:;">当前</a><span class="divider"><i class="icon-angle-right"></i></span></li>
			<li class="active">评价列表</li>
		</ul><!--.breadcrumb-->
	</div><!--#breadcrumbs-->
	<div class="row-fluid">
		<!-- <h3 class="header smaller lighter blue">会员管理</h3> -->
		<div class="table-header">
			评价列表
		</div>
		<table style="margin-left: 5px;" id="btnmenu">
			<tbody>
				<tr>
					<td>
						商品名称：
					</td>
					<td>
						<span style="margin-top: 7px;" class="input-icon">
							<input  type="text" class="mysearch"  id="goodsName">
							<i class="icon-search"></i>
						</span>
					</td>
					<td>评分</td>
					<td>
						<select id="downLimit"></select>-
						<select id="upperLimit"></select>
					</td>
					<td>
						<a title="查询" onclick="" class="btn btn-mini btn-success" id="searchBtn"><i class="icon-search"></i>查询</a>
					</td>
				</tr>
			</tbody>
		</table>
		<table id="table_report" class="table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th class='center'>
						序号
					</th>
					<th>ID</th>
					<th>商品名称</th>
					<th>总评分</th>
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
	
	
	for(var i=1;i<6;i++){
		var options="<option value="+i+">"+i+"</option>";	
		$("#downLimit").append(options)
		$("#upperLimit").append(options)
	}
	$("#downLimit").val(1);
	$("#upperLimit").val(5);
	
	initMainList();
	
	var table = $("#table_report").DataTable();
	
	$("#searchBtn").click(function(){
		var goodsName = $("#goodsName").val();
		var downLimit = $("#downLimit").val();
		var upperLimit = $("#upperLimit").val();
		
		var json = '{"goodsName":"'+goodsName+'","downLimit":"'+downLimit+'","upperLimit":"'+upperLimit+'"}';
		
    	table.search(json).draw();
	});
	
	
	$('#table_report').on( 'click', 'td', function () {
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
 

function initMainList(){
	var index=1;
	$('#table_report').DataTable( {
	    "columns": [
            { "data": null },
            { "data": "id" },
            { "data": "title" },
            { "data": "score" },
            { "data": null }
        ],
        "columnDefs": [{
					"targets":0,
					render:function(data,type,row){
						return index++;
					}
				},{
		            "targets": 4,
		            render: function (data, type, row, d) {
		                var context =
		                {
		                    func: [
		                        {"name": "查看", "fn": "docheck(\'" + row.id + "\')", "type": "purple", "icon":"search"}
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
        	url:"merchSystem/evaluate/list",	
        	type: "POST"
        }
    } );
}





function docheck(id){
	window.location.href="merchSystem/evaluate/checkGoodsEvaluata?id="+id;
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
