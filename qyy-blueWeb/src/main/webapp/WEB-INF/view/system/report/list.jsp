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
	text-align: center;
}
table.dataTable tbody td{
	text-align: center;
}
.dialogBottom{
	margin: 0 auto 5px;
	width: 250px
}
.center{
	width: 5%;
}
</style>
<body>
	<div class="container-fluid" id="main-container">
		<div id="breadcrumbs">
			<ul class="breadcrumb">
				<li><i class="icon-home"></i> <a href="javascript:;">当前</a><span class="divider"><i class="icon-angle-right"></i></span></li>
				<li class="active">举报信息</li>
			</ul><!--.breadcrumb-->
		</div><!--#breadcrumbs-->
		<div class="table-header">
			举报信息
		</div>
		<ul class="nav nav-tabs" id="otherInfoTab">
			<li class="active" ><a href="#tab_1">精彩游记/玩伴招募/达人攻略</a></li>
			<li ><a href="#tab_2">问答专区</a></li>
			<li ><a href="#tab_3">吐槽专区</a></li>
		</ul>
		<div class="tab-content">
			<!-- 达人攻略 -->
			<div class="tab-pane active" id="tab_1">
				<div class="row-fluid">
					<!-- <h3 class="header smaller lighter blue">会员管理</h3> -->
					<form action="">
						<table style="margin-left: 5px;" id="btnmenu">
							<tbody>
								<tr>
									<td>
										<!-- <a title="评论列表" onclick="replyList(2)" href="javascript:;" target="mainFrame" class="btn btn-mini btn-info" ><i class="icon-plus"></i> 评论列表</a> -->
										<a title="删除" onclick="doDeletes(1)" href="javascript:;" class="btn btn-mini btn-info" ><i class="icon-trash"></i> 删除</a>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
					<table id="web_travels_reply" type="web_travels_reply" class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th class='center'>
									<label><input type='checkbox' id="tableCheckbox" class="tableCheckbox" onchange="changeAllCheckbox()" /><span class="lbl"></span></label>
								</th>
								<th style="width: 100px">时间</th>
								<th>评论内容</th>
								<th>举报原因</th>
								<th>操作</th>
								<th>ID</th>
							</tr>
						</thead>
						<tbody></tbody> 
					</table>
				</div>
			</div>
			
			
			<!-- 问答专区 -->
			<div class="tab-pane active" id="tab_2">
				<div class="row-fluid">
					<!-- <h3 class="header smaller lighter blue">会员管理</h3> -->
					<form action="">
						<table style="margin-left: 5px;" id="btnmenu">
							<tbody>
								<tr>
									<td>
										<!-- <a title="评论列表" onclick="replyList(4)" href="javascript:;" target="mainFrame" class="btn btn-mini btn-info" ><i class="icon-plus"></i> 评论列表</a> -->
										<a title="删除" onclick="doDeletes(2)" href="javascript:;" class="btn btn-mini btn-info" ><i class="icon-trash"></i> 删除</a>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
					<table id="web_question_answer" type="web_question_answer" class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th class='center'>
									<label><input type='checkbox' id="tableCheckbox" class="tableCheckbox" onchange="changeAllCheckbox()" /><span class="lbl"></span></label>
								</th>
								<th style="width:  100px">时间</th>
								<th>评论内容</th>
								<th>举报原因</th>
								<th>操作</th>
								<th>ID</th>
							</tr>
						</thead>
						<tbody></tbody> 
					</table>
				</div>
			</div>
			
			<!-- 吐槽专区 -->
			<div class="tab-pane active" id="tab_3">
				<div class="row-fluid">
					<!-- <h3 class="header smaller lighter blue">会员管理</h3> -->
					<form action="">
						<table style="margin-left: 5px;" id="btnmenu">
							<tbody>
								<tr>
									<td>
										<!-- <a title="评论列表" onclick="replyList(5)" href="javascript:;" target="mainFrame" class="btn btn-mini btn-info" ><i class="icon-plus"></i> 评论列表</a> -->
										<a title="删除" onclick="doDeletes(3)" href="javascript:;" class="btn btn-mini btn-info" ><i class="icon-trash"></i> 删除</a>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
					<table id="web_complaint_ment" type="web_complaint_ment" class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th class='center'>
									<label><input type='checkbox' id="tableCheckbox" class="tableCheckbox" onchange="changeAllCheckbox()" /><span class="lbl"></span></label>
								</th>
								<th style="width:  100px">时间</th>
								<th>评论内容</th>
								<th>举报原因</th>
								<th>操作</th>
								<th>ID</th>
							</tr>
						</thead>
						<tbody></tbody> 
					</table>
				</div>
			</div>
			
			
		</div>




	</div>


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

var typeStrArr=["web_travels_reply","web_question_answer","web_complaint_ment"];

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
    

    initMainList("web_travels_reply");
    initMainList("web_question_answer");
    initMainList("web_complaint_ment");
    
    //initOtherMainList("table_question");
    //initOtherMainList("table_complaint");
	
	
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
});	



function doDelete(id,type){
	var url="";
	// if(type==1){
		url="admin/report/deletes";
	// }else{
	// 	url="";
	// }
	
	bootbox.confirm("确定要删除该回复么?", function(result) {
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
						$("#"+type).DataTable().clear();
						$("#"+type).DataTable().draw();
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
	url="admin/report/deletes";
	$("#"+typeStrArr[parseInt(type)-1]+" input[flag=row]").each(function(){
		if(this.checked){
			idStr+=this.value+",";
		}
	});
	if(idStr==""){
		bootbox.alert("请选择需要删除的内容");
		return;
	}
	bootbox.confirm("确定要删除选中的回复么?", function(result) {
		if(result){
			$.ajax({
				url : url,
				post : "post",
				data:{
					"ids":idStr,
					"type":typeStrArr[parseInt(type)-1]
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

function changeTop(id,type,top){
	console.info("changeTop");
	$.post("admin/fromuOperation/changeTop",{travelsId:id,top:top},function(data){
		if(data.status == "success"){
			bootbox.alert("修改置顶状态成功！");
		}else{
			bootbox.alert("服务器忙，请稍后重试");
		}
		$("#"+typeStrArr[parseInt(type)-1]).DataTable().clear();
		$("#"+typeStrArr[parseInt(type)-1]).DataTable().draw();
	});
}




function initMainList(id){
	var url="";
	var tableType=$("#"+id).attr("type");
	$('#'+id).DataTable( {
		"columns": [
            { "data": null },//0
            { "data": "create_date" },//1
            { "data": "content" },//2
            { "data": "report_reason" },//3
            { "data": null },//4
            { "data": "id" }//5
            ],
            "columnDefs": [{
            	"targets":0,
            	render:function(data,type,row){
            		var str="<label><input type='checkbox'  flag='row' value='"+row.id+"' /><span class='lbl'></span></label>";
            		return str;
            	}
            },{
            	"targets":1,
            	render:function(data,type,row){
            		return getTimeTxt(data,19);
            	}
            },{
            	"targets": 4,
            	render: function (data, type, row, d) {
            		var context =
            		{
            			func: [
            			{"name": "删除", "fn": "doDelete(\'" + row.id + "\',\'"+tableType+"\')", "type": "danger", "icon":"trash"}
            			]
            		};
            		var html = template(context);
            		return html;
            	}
            }
            ],
            fnInitComplete:function(){
    			$('#'+id).DataTable().column(5).visible(false);//隐藏ID行
			},
		"bDestroy": true,
		"ajax": {
			url:"admin/report/list",
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
