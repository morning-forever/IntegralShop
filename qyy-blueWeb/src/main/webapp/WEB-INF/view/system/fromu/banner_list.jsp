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
				<li class="active">会员互动布局</li>
			</ul><!--.breadcrumb-->
		</div><!--#breadcrumbs-->
		<div class="table-header">
			会员互动布局
		</div>
		<ul class="nav nav-tabs" id="otherInfoTab">
			<li class="active" ><a href="#tab_1">推荐列表</a></li>
			<li ><a href="#tab_2">Banner列表</a></li>
		</ul>
		<div class="tab-content">
			<!-- tab1-推荐列表 -->
			<div class="tab-pane active" id="tab_1">
				<div class="row-fluid">
					<!-- <h3 class="header smaller lighter blue">会员管理</h3> -->
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
											<input type="text" id="startDate" name="startDate" readonly="readonly" class="span11 mydate-picker" data-date-format="yyyy-mm-dd">
										</div>
									</td>
									<td>
										结束时间：
									</td>
									<td>
										<div class="input-prepend">
											<span class="add-on"><i class="icon-calendar"></i></span>
											<input type="text" id="endDate" name="endDate" readonly="readonly" class="span11 mydate-picker" data-date-format="yyyy-mm-dd">
										</div>
									</td>
									<td>
										发部位：
									</td>
									<td>
										<select id="fromType" name="fromType">
											<option value="">全部</option>
											<option value="master_travels">达人攻略推荐</option>
											<option value="travels">精彩游记推荐</option>
											<option value="bbs">会员互动推荐</option>
										</select>
									</td>
									<td>
										<a title="查询" onclick="" class="btn btn-mini btn-success searchBtn" type="1"><i class="icon-search"></i>查询</a>
									</td>
								</tr>
								<tr>
									<td colspan="5">
										<a title="新增" onclick="doAdd(1)" href="javascript:;" target="mainFrame" class="btn btn-mini btn-info" ><i class="icon-plus"></i> 新增</a>
										<a title="上架" onclick="onLine(1)" href="javascript:;" class="btn btn-mini btn-info" ><i class="icon-check"></i> 上架</a>
										<a title="下架" onclick="offLine(1)" href="javascript:;" class="btn btn-mini btn-info" ><i class="icon-check-empty"></i> 下架</a>
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
			<div class="tab-pane active" id="tab_2">
				<div class="row-fluid">
					<!-- <h3 class="header smaller lighter blue">会员管理</h3> -->
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
											<input type="text" id="startDate" name="startDate" readonly="readonly" class="span11 mydate-picker" data-date-format="yyyy-mm-dd">
										</div>
									</td>
									<td>
										结束时间：
									</td>
									<td>
										<div class="input-prepend">
											<span class="add-on"><i class="icon-calendar"></i></span>
											<input type="text" id="endDate" name="endDate" readonly="readonly" class="span11 mydate-picker" data-date-format="yyyy-mm-dd">
										</div>
									</td>
									<td>
										发部位：
									</td>
									<td>
										<select id="fromType" name="fromType">
											<option value="">全部</option>
											<option value="'master_travels_banner'">达人攻略Banner</option>
											<option value="'travels_banner'">精彩游记Banner</option>
											<option value="'bbs_banner'">会员互动Banner</option>
										</select>
									</td>
									<td>
										<a title="查询" onclick="" class="btn btn-mini btn-success searchBtn" type="2"><i class="icon-search"></i>查询</a>
									</td>
								</tr>
								<tr>
									<td colspan="5">
										<a title="新增" onclick="doAdd(2)" href="javascript:;" target="mainFrame" class="btn btn-mini btn-info" ><i class="icon-plus"></i> 新增</a>
										<a title="上架" onclick="onLine(2)" href="javascript:;" class="btn btn-mini btn-info" ><i class="icon-check"></i> 上架</a>
										<a title="下架" onclick="offLine(2)" href="javascript:;" class="btn btn-mini btn-info" ><i class="icon-check-empty"></i> 下架</a>
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
    $('#otherInfoTab a').click();
    $('#otherInfoTab a:first').click();

	initMainList("table_report_recommend",1);
	initMainList("table_report_banner",2);
	
	var r_table = $("#table_report_recommend").DataTable();
	var b_table = $("#table_report_banner").DataTable();
	
	$(".searchBtn").click(function(){
		
		var dateStr=[$("#startDate").val(),$("#endDate").val()];
		var date=[new Date(),new Date()];
		for(var i=0;i<dateStr.length;i++){
			var dateItem=dateStr[i].split("-");
			date[i].setFullYear(dateItem[0]);
			date[i].setMonth(parseInt(dateItem[1])-1);
			date[i].setDate(dateItem[2]);
		}
		if(date[0].getTime()>date[1].getTime()){
			valTips("endDate","开始时间不能大于结束时间");
			return ;
		}
		
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
		if($(this).attr("type")=="1"){
			r_table.search(json).draw();
		}else{
			b_table.search(json).draw();
		}
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
		url="admin/fromu/deletes";
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
						if(type==1){
							$('#table_report_recommend').DataTable().clear();
							$('#table_report_recommend').DataTable().draw();
						}else{
							$('#table_report_banner').DataTable().draw();
							$('#table_report_banner').DataTable().clear();
						}
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
	// if(type==1){
		url="admin/fromu/deletes";
	// }else{
	// 	url="";
	// }
	$("#tab_"+type+" input[flag=row]").each(function(){
		if(this.checked){
			idStr+=this.value+",";
		}
	});
	if(idStr==""){
		bootbox.alert("请选择需要删除的推荐");
		return;
	}
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
						if(type==1){
							$('#table_report_recommend').DataTable().clear();
							$('#table_report_recommend').DataTable().draw();
						}else{
							$('#table_report_banner').DataTable().draw();
							$('#table_report_banner').DataTable().clear();
						}
					}else{
						bootbox.alert("服务器忙，请稍后重试");
					}
				}
				
			});
		}
	});
}

function onLine(type){
	var idStr="";
	var url="";
	// if(type==1){
		url="admin/fromu/changeEnable";
	// }else{
	// 	url="";
	// }
	$("#tab_"+type+" input[flag=row]").each(function(){
		if(this.checked){
			idStr+=this.value+",";
		}
	});
	if(idStr==""){
		bootbox.alert("请选择需要上架的推荐");
		return;
	}
	bootbox.confirm("确定要上架选中的推荐么?", function(result) {
		if(result){
			$.ajax({
				url : url,
				post : "post",
				data:{
					"ids":idStr,
					"state":0,
					"type":type
				},
				success:function(data){
					if(data.status == "success"){
						bootbox.alert("上架成功！");
						if(type==1){
							$('#table_report_recommend').DataTable().clear();
							$('#table_report_recommend').DataTable().draw();
						}else{
							$('#table_report_banner').DataTable().draw();
							$('#table_report_banner').DataTable().clear();
						}
					}else{
						bootbox.alert("服务器忙，请稍后重试");
					}
				}
				
			});
		}
	});
}

function offLine(type){
	var idStr="";
	var url="";
	// if(type==1){
		url="admin/fromu/changeEnable";
	// }else{
	// 	url="";
	// }
	$("#tab_"+type+" input[flag=row]").each(function(){
		if(this.checked){
			idStr+=this.value+",";
		}
	});
	if(idStr==""){
		bootbox.alert("请选择需要下架的推荐");
		return;
	}
	bootbox.confirm("确定要下架选中的推荐么?", function(result) {
		if(result){
			$.ajax({
				url : url,
				post : "post",
				data:{
					"ids":idStr,
					"state":1,
					"type":type
				},
				success:function(data){
					if(data.status == "success"){
						bootbox.alert("下架成功！");
						if(type==1){
							$('#table_report_recommend').DataTable().clear();
							$('#table_report_recommend').DataTable().draw();
						}else{
							$('#table_report_banner').DataTable().draw();
							$('#table_report_banner').DataTable().clear();
						}
					}else{
						bootbox.alert("服务器忙，请稍后重试");
					}
				}
				
			});
		}
	});
}

function doAdd(type){
	window.location.href="admin/fromu/add?type="+type;
}

function doEdit(id,type){
	window.location.href="admin/fromu/edit_"+id+"_"+type;
}




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
            	"targets":3,
            	render:function(data,type,row){
            		var str="";
            		if(data=="travels"){
            			str="精彩游记推荐";
            		}else if(data=="travels_banner"){
            			str="精彩游记Banner";
            		}else if(data=="master_travels"){
            			str="达人攻略推荐";
            		}else if(data=="master_travels_banner"){
            			str="达人攻略Banner";
            		}else if(data=="bbs"){
            			str="会员互动推荐";
            		}else if(data=="bbs_banner"){
            			str="会员互动Banner";
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
            			str="上架";
            		}else if(data==1){
            			str="下架";
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
			url:"admin/fromu/recommendList",
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
