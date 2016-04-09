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
.dialogBottom{
	margin: 0 auto 5px;
	width: 250px
}
</style>
<body>
	<div class="container-fluid" id="main-container">
		<div id="breadcrumbs">
			<ul class="breadcrumb">
				<li><i class="icon-home"></i> <a href="javascript:;">当前</a><span class="divider"><i class="icon-angle-right"></i></span></li>
				<li class="active">会员互动布局</li>
			</ul><!--.breadcrumb-->
		</div><!--#breadcrumbs-->
		<div class="table-header">
			会员互动布局
		</div>
			<!-- tab1-推荐列表 -->
				<div class="row-fluid">
					<!-- <h3 class="header smaller lighter blue">会员管理</h3> -->
					<form action="">
						<table style="margin-left: 5px;" id="btnmenu">
							<tbody>
								<tr>
									<td>
										姓名：
									</td>
									<td>
										<input name="realName" id="realName">
									</td>
									<td>
										手机：
									</td>
									<td>
										<input name="phone" id="phone">
									</td>
									<td>
										邮箱：
									</td>
									<td>
										<input name="email" id="email">
									</td>
								</tr>
								<tr>
									<td>
										精通地区：
									</td>
									<td>
										<select name="areaId" id="areaId">
											<option value="">全部</option>
											<c:forEach items="${areaList }" var="area">
												<option value="${area.id }">${area.name }</option>
											</c:forEach>
										</select>
									</td>
									<td>
										审核状态：
									</td>
									<td>
										<select id="isAudit" name="isAudit">
											<option value="">全部</option>
											<option value="OK">通过</option>
											<option value="NO">未通过</option>
											<option value="PLATFORM">平台添加</option>
											<option value="TO">审核中</option>
										</select>
									</td>
									<td>
										<a title="查询" class="btn btn-mini btn-success searchBtn" type="1"><i class="icon-search"></i>查询</a>
									</td>
								</tr>
								<tr>
									<td colspan="5">
										<a title="开通达人" onclick="doAdd(1)" href="javascript:;" target="mainFrame" class="btn btn-mini btn-info" ><i class="icon-plus"></i> 开通达人</a>
										<a title="删除" onclick="doDeletes(1)" href="javascript:;" class="btn btn-mini btn-info" ><i class="icon-trash"></i> 删除</a>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
					<table id="table_master" class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th class='center'>
									<label><input type='checkbox' id="tableCheckbox" class="tableCheckbox" onchange="changeAllCheckbox()" /><span class="lbl"></span></label>
								</th>
								<th>ID</th>
								<th>昵称</th>
								<th>等级</th>
								<th>姓名</th>
								<th>现居住地</th>
								<th>精通地区</th>
								<th>职业</th>
								<th>手机</th>
								<th>邮箱</th>
								<th>QQ</th>
								<th>状态</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody></tbody> 
					</table>
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
				<input type="hidden" name="id" id="id">
				<div class="modal-body">
					<div class="form-group">
						<table style="margin-left: 5px;margin: 0 auto;" id="btnmenu">
							<tr>
								<td>
									审核备注：<textarea id="reamrk" name="reamrk" style="width: 400px;height: 80px" placeholder="填写审核失败原因"></textarea>
								</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="dialogBottom">
				<a title="通过" onclick="submitExamine('OK')" href="javascript:;" class="btn btn-mini btn-success"><i class="icon-ok"></i> 通过</a>
				<a title="未通过" onclick="submitExamine('NO')" href="javascript:;" class="btn btn-mini btn-danger"><i class="icon-remove"></i> 未通过</a>
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

$(document).ready(function(){
	
	//初始化时间插件
	$('.mydate-picker').datepicker();
	
	//初始化Tab页


	initMainList("table_master");
	
	
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
		$("#table_master").DataTable().search(json).draw();
	});
	
	//$('#table_master tr').removeClass("odd");
	
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

function submitExamine(state){
	var data={};
	data.reamrk=$("#examineModal #reamrk").val();
	data.id=$("#examineModal #id").val();
	data.state=state;
	$.post("admin/fromu/master/examineMaster",data,function(result){
		$("#examineModal").modal("hide");
		if(result.status=="success"){
			bootbox.alert("提交成功！");
			$("#table_master").DataTable().clear();
			$("#table_master").DataTable().draw();
		}else{
			bootbox.alert("服务器忙，请稍后重试");
		}
	});
}

function doExamine(id){
	$("#examineModal #id").val(id);
	$("#examineModal #refund_reamrk").val("");
	$("#examineModal").modal("show");
}

function doDelete(id,type){
	var url="";
	// if(type==1){
		url="admin/fromu/master/deletes";
	// }else{
	// 	url="";
	// }
	bootbox.confirm("确定要删除该达人么?", function(result) {
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
						$('#table_master').DataTable().clear();
						$('#table_master').DataTable().draw();
					}
				}
				
			});
		}
	});
}

function doDeletes(type){
	var idStr="";
	var url="";
	// if(type==1){
		url="admin/fromu/master/deletes";
	// }else{
	// 	url="";
	// }
	$("input[flag=row]").each(function(){
		if(this.checked){
			idStr+=this.value+",";
		}
	});
	if(idStr==""){
		bootbox.alert("请选择需要删除的达人");
		return;
	}
	bootbox.confirm("确定要删除选中的达人么?", function(result) {
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
						$('#table_master').DataTable().clear();
						$('#table_master').DataTable().draw();
					}
				}
				
			});
		}
	});
}

function doAdd(type){
	window.location.href="admin/fromu/master/add";
}


function check(id){
	window.location.href="admin/fromu/master/check_"+id;
}



function initMainList(id){
	var url="";
	$('#'+id).DataTable( {
		"columns": [
            { "data": null },//0
            { "data": "id" },//1
            { "data": "nickname" },//2
            { "data": "level" },//3
            { "data": "real_name" },//4
            { "data": "nowlive" },//5
            { "data": "area" },//6
            { "data": "occupation" },//7
            { "data": "phone" },//8
            { "data": "email" },//9
            { "data": "qq_num" },//10
            { "data": "is_audit" },//11
            { "data": null }//12
            ],
            "columnDefs": [{
            	"targets":0,
            	render:function(data,type,row){
            		var str="<label><input type='checkbox'  flag='row' value='"+row.id+"' /><span class='lbl'></span></label>";
            		return str;
            	}
            },{
            	"targets":11,
            	render:function(data,type,row){
            		var str="";
            		if(data=="OK"){
            			str="通过";
            		}else if(data=="NO"){
            			str="未通过";
            		}else if(data=="TO"){
            			str="<a href='javascript:;' onclick='doExamine("+row.id+")'>待审核</a>";
            		}else if(data=="PLATFORM"){
            			str="平台添加";
            		}else{
            			str="-";
            		}
            		return str;
            	}
            },{
            	"targets": 12,
            	render: function (data, type, row, d) {
            		var context =
            		{
            			func: [
            			{"name": "查看", "fn": "check(\'" + row.id + "\')", "type": "info", "icon":"search"},
            			{"name": "删除", "fn": "doDelete(\'" + row.id + "\')", "type": "danger", "icon":"trash"}
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
			url:"admin/fromu/master/list",
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
