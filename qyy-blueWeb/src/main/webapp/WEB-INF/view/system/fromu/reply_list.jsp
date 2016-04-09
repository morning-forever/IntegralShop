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
				<li class="active">会员评论信息</li>
			</ul><!--.breadcrumb-->
		</div><!--#breadcrumbs-->
		<div class="table-header">
			会员评论信息
		</div>
			<!-- 达人攻略 -->
				<div class="row-fluid">
					<!-- <h3 class="header smaller lighter blue">会员管理</h3> -->
					<form action="">
						<table style="margin-left: 5px;" id="btnmenu">
							<tbody>
								<tr>
									<td>
										<span>内容:</span>
										<input name="title" class="small-input">
										<span>昵称:</span>
										<input name="nickName" class="small-input">
										<a title="搜索" href="javascript:;" target="mainFrame" class="btn btn-mini btn-success searchBtn" ><i class="icon-search"></i> 搜索</a>
									</td>
								</tr>
								<tr>
									<td>
										<a title="删除" onclick="doDeletes(${type})" href="javascript:;" class="btn btn-mini btn-info" ><i class="icon-trash"></i> 删除</a>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
					<table>
						<tr>
							<td colspan="5"><b>${map.title }</b></td>
						</tr>
						<tr>
							<td>
								类型：
								<c:if test="${type==1 }">精彩游记|</c:if>
								<c:if test="${type==2 }">达人攻略|</c:if>
								<c:if test="${type==3 }">玩伴招募|</c:if>
								<c:if test="${type==4 }">旅行问答|</c:if>
								<c:if test="${type==5 }">吐槽专区|</c:if>
							</td>
							<td>
								浏览:
								${map.browse }|
							</td>
							<c:if test="${type<4 }">
							<td>
								点赞:
								${map.praise }|
							</td>
							</c:if>
							<td>
								评论:
								${map.countReply }|
							</td>
							<c:if test="${type<4 }">
							<td>
								收藏:
								${map.collectionCount }|
							</td>
							</c:if>
							<td class="createTime">
								${map.create_time }
							</td>
						</tr>
					</table>
					<table id="table_reply" type="2" class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th class='center'>
									<label><input type='checkbox' id="tableCheckbox" class="tableCheckbox" onchange="changeAllCheckbox()" /><span class="lbl"></span></label>
								</th>
								<th>ID</th>
								<th>内容</th>
								<th style="width: 180px">时间</th>
								<th>昵称</th>
								<th>等级</th>
								<th>角色</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody></tbody> 
					</table>
				</div>
			</div>
			
			
	<!-- #main-content -->
	<div class="modal fade" id="dialogModal" tabindex="-1" role="dialog" aria-labelledby="addBrandModalLabel" aria-hidden="true" style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times; </span>
					</button>
				</div>
				<input type="hidden" name="travelsId" id="examineTravelsId">
				<input type="hidden" name="type" id="type">
				<div class="modal-body">
					<div class="form-group">
						<table style="margin-left: 5px;margin: 0 auto;" id="btnmenu">
							<tr>
								<td>
									评论内容：<textarea readonly="readonly" id="content" name="content" style="width: 400px;height: 80px" placeholder="填写审核失败原因"></textarea>
								</td>
							</tr>
						</table>
					</div>
				</div>
				<div style="margin: 0 auto;width: 250px">
				<a title="关闭" onclick="closeDialog()" href="javascript:;" class="btn btn-mini btn-danger"><i class="icon-remove"></i> 关闭</a>
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
	
	$("#dialogModal").modal("hide");
	
	//初始化Tab页

    $('#otherInfoTab a').click(function(e) {
        e.preventDefault();//阻止a链接的跳转行为
        $(this).tab('show');//显示当前选中的链接及关联的content
    });
    $('#otherInfoTab a').click();
    $('#otherInfoTab a:first').click();
    
    $("#examineModal").modal("hide");

    initMainList('table_reply');
    
    $(".createTime").each(function(){
		var stamp=parseInt($(this).html());
		$(this).html(getTimeTxt(stamp,16));
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
		$(this).parents(".row-fluid").find("table.table-hover").DataTable().search(json).draw();
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
		url="admin/fromuOperation/deleteReply";
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
						$("#table_reply").DataTable().clear();
						$("#table_reply").DataTable().draw();
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
	url="admin/fromuOperation/deleteReply";
	$("#table_reply input[flag=row]").each(function(){
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
						$("#table_reply").DataTable().clear();
						$("#table_reply").DataTable().draw();
					}else{
						bootbox.alert("服务器忙，请稍后重试");
					}
				}
				
			});
		}
	});
}





function initMainList(id){
	var url="";
	var tableType=$("#"+id).attr("type");
	$('#'+id).DataTable( {
		"columns": [
            { "data": null },//0
            { "data": "id" },//1
            { "data": "content" },//2
            { "data": "create_time" },//3
            { "data": "nickname" },//4
            { "data": "level" },//5
            { "data": "is_master" },//6
            { "data": null }//7
            ],
            "columnDefs": [{
            	"targets":0,
            	render:function(data,type,row){
            		var str="<label><input type='checkbox'  flag='row' value='"+row.id+"' /><span class='lbl'></span></label>";
            		return str;
            	}
            },{
            	"targets":3,
            	render:function(data,type,row){
            		return getTimeTxt(data,19);
            	}
            },{
            	"targets":6,
            	render:function(data,type,row){
            		var str="";
            		if(data==0){
            			str="达人";
            		}else if(data==1){
            			str="普通会员";
            		}else{
            			str=data;
            		}
            		return str;
            	}
            },{
            	"targets": 7,
            	render: function (data, type, row, d) {
            		var context =
            		{
            			func: [
            			{"name": "查看", "fn": "doCheck(\'" + row.content + "\')", "type": "purple", "icon":"search"},
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
			url:"admin/fromuOperation/replyList",
			data:{type:"${type}",id:"${map.travelsId}"},
			type: "POST"
		}
	} );
}


function doCheck(str){
	$("#content").val(str);
	$("#dialogModal").modal("show");
}

function closeDialog(){
	$("#dialogModal").modal("hide");
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
