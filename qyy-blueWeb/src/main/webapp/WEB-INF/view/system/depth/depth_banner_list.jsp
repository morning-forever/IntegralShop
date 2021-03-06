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
				<li class="active">主题深度游</li>
			</ul><!--.breadcrumb-->
		</div><!--#breadcrumbs-->
		<div class="table-header">
			主题深度游布局
		</div>
		<ul class="nav nav-tabs" id="otherInfoTab">
			<li class="active" ><a href="#tab_1">推荐列表</a></li>
			<li ><a href="#tab_2">Banner列表</a></li>
		</ul>
		<div class="tab-content">
			<!-- tab1-推荐列表 -->
			<div class="tab-pane active" id="tab_1">
				<div class="row-fluid">
					<form action="">
						<table style="margin-left: 5px;" id="btnmenu">
							<tbody>
								<tr>
									<td>
										开始时间：
									</td>
									<td>
										<div class="input-prepend">
											<span class="add-on"><i class="icon-calendar"></i></span>
											<input type="text" id="startDate1" name="startDate" readonly="readonly" class="span11 mydate-picker" data-date-format="yyyy-mm-dd">
										</div>
									</td>
									<td>
										结束时间：
									</td>
									<td>
										<div class="input-prepend">
											<span class="add-on"><i class="icon-calendar"></i></span>
											<input type="text" id="endDate1" name="endDate" readonly="readonly" class="span11 mydate-picker" data-date-format="yyyy-mm-dd">
										</div>
									</td>
									<td>
										<a title="查询" class="btn btn-mini btn-success searchBtn" type="1"><i class="icon-search"></i>查询</a>
										<a title="清空" class="btn btn-mini btn-success clearBtn"><i class="icon-refresh"></i>清空</a>
									</td>
								</tr>
								<tr>
									<td colspan="5">
										<a title="新增" onclick="doAdd(1)" href="javascript:;" target="mainFrame" class="btn btn-mini btn-info" ><i class="icon-plus"></i> 新增</a>
										<a title="启用" onclick="onLine(1)" href="javascript:;" class="btn btn-mini btn-info" ><i class="icon-check"></i> 启用</a>
										<a title="禁用" onclick="offLine(1)" href="javascript:;" class="btn btn-mini btn-info" ><i class="icon-check-empty"></i> 禁用</a>
										<a title="删除" onclick="doDeletes(1)" href="javascript:;" class="btn btn-mini btn-info" ><i class="icon-trash"></i> 删除</a>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
					<table id="table_report_recommend" class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th class='center'>
									<label><input type='checkbox' id="tableCheckbox" class="tableCheckbox" onchange="changeAllCheckbox()" /><span class="lbl"></span></label>
								</th>
								<th>ID</th>
								<th>图片</th>
								<th>发部位</th>
								<th>生效时间</th>
								<th>结束时间</th>
								<th>序号</th>
								<th>状态</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody></tbody> 
					</table>
				</div>
			</div>
			<div class="tab-pane" id="tab_2">
				<div class="row-fluid">
					<form action="">
						<table style="margin-left: 5px;" id="btnmenu">
							<tbody>
								<tr>
									<td>
										开始时间：
									</td>
									<td>
										<div class="input-prepend">
											<span class="add-on"><i class="icon-calendar"></i></span>
											<input type="text" id="startDate2" name="startDate" readonly="readonly" class="span11 mydate-picker" data-date-format="yyyy-mm-dd">
										</div>
									</td>
									<td>
										结束时间：
									</td>
									<td>
										<div class="input-prepend">
											<span class="add-on"><i class="icon-calendar"></i></span>
											<input type="text" id="endDate2" name="endDate" readonly="readonly" class="span11 mydate-picker" data-date-format="yyyy-mm-dd">
										</div>
									</td>
									<!-- <td>
										发部位：
									</td>
									<td>
										<select id="fromType" name="fromType">
											<option value="">全部</option>
											<option value="'master_travels_banner'">达人攻略Banner</option>
											<option value="'travels_banner'">精彩游记Banner</option>
											<option value="'bbs_banner'">会员互动Banner</option>
										</select>
									</td> -->
									<td>
										<a title="查询" onclick="" class="btn btn-mini btn-success searchBtn" type="2"><i class="icon-search"></i>查询</a>
										<a title="清空" onclick="" class="btn btn-mini btn-success clearBtn"><i class="icon-refresh"></i>清空</a>
									</td>
								</tr>
								<tr>
									<td colspan="5">
										<a title="新增" onclick="doAdd(2)" href="javascript:;" target="mainFrame" class="btn btn-mini btn-info" ><i class="icon-plus"></i> 新增</a>
										<a title="启用" onclick="onLine(2)" href="javascript:;" class="btn btn-mini btn-info" ><i class="icon-check"></i> 启用</a>
										<a title="禁用" onclick="offLine(2)" href="javascript:;" class="btn btn-mini btn-info" ><i class="icon-check-empty"></i> 禁用</a>
										<a title="删除" onclick="doDeletes(2)" href="javascript:;" class="btn btn-mini btn-info" ><i class="icon-trash"></i> 删除</a>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
					<table id="table_report_banner" class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th class='center'>
									<label><input type='checkbox' id="tableCheckbox"  class="tableCheckbox" onchange="changeAllCheckbox()" /><span class="lbl"></span></label>
									<!-- <label><input type='checkbox' id="tableCheckbox" onchange="changeAllCheckbox()" /><span class="lbl"></span></label> -->
								</th>
								<th>ID</th>
								<th>图片</th>
								<th>发部位</th>
								<th>生效时间</th>
								<th>结束时间</th>
								<th>序号</th>
								<th>状态</th>
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

    $('#otherInfoTab a').click(function(e) {
        e.preventDefault();//阻止a链接的跳转行为
        $(this).tab('show');//显示当前选中的链接及关联的content
    });
    $('#otherInfoTab a:eq('+"${tabIndex}"+")").click();

	initMainList("table_report_recommend",1);
	initMainList("table_report_banner",2);
	
	var r_table = $("#table_report_recommend").DataTable();
	var b_table = $("#table_report_banner").DataTable();
	
	$(".searchBtn").click(function(){
		
		var json='{';
		var valueArr=$(this).parents("form").serialize().split("&");
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
		var type = $(this).attr("type");
		var startDate = $("#startDate"+type).val();
		var endDate = $("#endDate"+type).val();
		if(startDate > endDate){
			valTips('startDate'+type,"开始时间不能大于结束时间");
			return ;
		}
		if(type == "1"){
			r_table.search(json).draw();
		}else{
			b_table.search(json).draw();
		}
	});
	
	//清空
	$(".clearBtn").click(function(){
		$(this).parents("form").find("input").val("");
	});
	
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

//显示文字
function getTip(type){
	var tip;
	if(type == 1){
		tip = "推荐";
	}else{
		tip = "banner";
	}
	return tip;
}

//单个删除
function doDelete(id,type){
	bootbox.confirm("确定要删除该"+getTip(type)+"么?", function(result) {
		if(result){
			$.ajax({
				url : "admin/depth/recommand/deletes",
				post : "post",
				data:{
					"ids":id,
					"type":type
				},
				success:function(data){
					if(data.status == "success"){
						bootbox.alert("删除成功！");
						if(type==1){
							$('#table_report_recommend').DataTable().clear();
							$('#table_report_recommend').DataTable().draw();
						}else{
							$('#table_report_banner').DataTable().draw();
							$('#table_report_banner').DataTable().clear();
						}
					}
				}
				
			});
		}
	});
}

//多个删除
function doDeletes(type){
	var idStr="";
	$("#tab_"+type+" input[flag=row]").each(function(){
		if(this.checked){
			idStr+=this.value+",";
		}
	});
	if(idStr == ""){
		bootbox.alert("请先选择需要操作的数据");
		return ;
	}
	bootbox.confirm("确定要删除选中的"+getTip(type)+"么?", function(result) {
		if(result){
			$.ajax({
				url : "admin/depth/recommand/deletes",
				post : "post",
				data:{
					"ids":idStr,
					"type":type
				},
				success:function(data){
					if(data.status == "success"){
						bootbox.alert("删除成功！");
						if(type==1){
							$('#table_report_recommend').DataTable().clear();
							$('#table_report_recommend').DataTable().draw();
						}else{
							$('#table_report_banner').DataTable().draw();
							$('#table_report_banner').DataTable().clear();
						}
					}
				}
				
			});
		}
	});
}

//启用
function onLine(type){
	var idStr="";
	$("#tab_"+type+" input[flag=row]").each(function(){
		if(this.checked){
			idStr+=this.value+",";
		}
	});
	if(idStr == ""){
		bootbox.alert("请先选择需要操作的数据");
		return ;
	}
	bootbox.confirm("确定要启用选中的"+getTip(type)+"么?", function(result) {
		if(result){
			$.ajax({
				url : "admin/depth/recommand/changeEnable",
				post : "post",
				data:{
					"ids":idStr,
					"state":0,
					"type":type
				},
				success:function(data){
					if(data.status == "success"){
						bootbox.alert("启用成功！");
						if(type==1){
							$('#table_report_recommend').DataTable().clear();
							$('#table_report_recommend').DataTable().draw();
						}else{
							$('#table_report_banner').DataTable().draw();
							$('#table_report_banner').DataTable().clear();
						}
					}
				}
				
			});
		}
	});
}

//禁用
function offLine(type){
	var idStr="";
	$("#tab_"+type+" input[flag=row]").each(function(){
		if(this.checked){
			idStr+=this.value+",";
		}
	});
	if(idStr == ""){
		bootbox.alert("请先选择需要操作的数据");
		return ;
	}
	bootbox.confirm("确定要禁用选中的"+getTip(type)+"么?", function(result) {
		if(result){
			$.ajax({
				url : "admin/depth/recommand/changeEnable",
				post : "post",
				data:{
					"ids":idStr,
					"state":1,
					"type":type
				},
				success:function(data){
					if(data.status == "success"){
						bootbox.alert("禁用成功！");
						if(type==1){
							$('#table_report_recommend').DataTable().clear();
							$('#table_report_recommend').DataTable().draw();
						}else{
							$('#table_report_banner').DataTable().draw();
							$('#table_report_banner').DataTable().clear();
						}
					}
				}
				
			});
		}
	});
}

//新增
function doAdd(type){
	window.location.href="admin/depth/recommand/add?type="+type;
}

//编辑
function doEdit(id,type){
	window.location.href="admin/depth/recommand/edit_"+id+"_"+type;
}

//初始化加载
function initMainList(id,RBType){
	var url="";
	$('#'+id).DataTable( {
		"columns": [
            { "data": null },//0
            { "data": "id" },//1
            { "data": "img_url" },//2
            { "data": "from_type" },//3
            { "data": "start_time" },//4
            { "data": "end_time" },//5
            { "data": "order_number" },//6
            { "data": "is_enable" },//7
            { "data": null }//8
            ],
            "columnDefs": [{
            	"targets":0,
            	render:function(data,type,row,meta){
            		var str="<label><input type='checkbox'  flag='row' value='"+row.id+"' /><span class='lbl'></span></label>";
            		return str;
            	}
            },{
            	"targets":2,
            	render:function(data,type,row){
            		return '<img src="'+data+'" width="50" height="50">';
            	}
            },{
            	"targets":3,
            	render:function(data,type,row){
            		var str="";
            		if(data=="depth_recommand"){
            			str="主题深度游推荐";
            		}else if(data=="depth"){
            			str="主题深度游Banner";
            		}
            		return str;
            	}
            },{
            	"targets":4,
            	render:function(data,type,row){
            		return getTimeTxt(data,19);
            	}
            },{
            	"targets":5,
            	render:function(data,type,row){
            		return getTimeTxt(data,19);
            	}
            },{
            	"targets":7,
            	render:function(data,type,row){
            		var str="";
            		if(data==0){
            			str="启用";
            		}else if(data==1){
            			str="禁用";
            		}else{
            			str="-";
            		}
            		return str;
            	}
            },{
            	"targets": 8,
            	render: function (data, type, row, d) {
            		var context =
            		{
            			func: [
            			{"name": "编辑", "fn": "doEdit(\'" + row.id + "\',"+RBType+")", "type": "purple", "icon":"edit"},
            			{"name": "删除", "fn": "doDelete(\'" + row.id + "\',"+RBType+")", "type": "danger", "icon":"trash"}
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
			url:"admin/depth/recommand/recommendList",
			data:{type:RBType},
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
