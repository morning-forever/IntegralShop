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
						昵称：
					</td>
					<td>
						<span style="margin-top: 7px;" class="input-icon">
							<input  type="text" class="mysearch"  id="nickName">
							<i class="icon-search"></i>
						</span>
					</td>
					<td>
						评价：
					</td>
					<td>
						<span style="margin-top: 7px;" class="input-icon">
							<input  type="text" class="mysearch"  id="comment">
							<i class="icon-search"></i>
						</span>
					</td>
					<td>
						<a title="查询" onclick="" class="btn btn-mini btn-success" id="searchBtn"><i class="icon-search"></i>查询</a>
					</td>
				</tr>
				<tr>
					<td>
						<button type="button" onclick="doDeletes()" class="btn btn-danger">删除</button>
					</td>
				</tr>
			</tbody>
		</table>
		<table id="table_report" class="table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th class='center' style="width: 50px"><label><input type='checkbox' id="tableCheckbox" onchange="changeAllCheckbox()" /><span class="lbl"></span></label></th>
					<th>ID</th>
					<th>用户ID</th>
					<th>昵称</th>
					<th>评分</th>
					<th>评价内容</th>
					<th>评价时间</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody></tbody> 
		</table>
	</div>
	
	
	
</div>
<!-- #main-content -->
<!-- 评论详情 -->
<div class="modal fade" id="evaluataDetial" tabindex="-1" role="dialog" aria-labelledby="addBrandModalLabel" aria-hidden="true" style="display: none;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<span>评论详情</span>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times; </span>
				</button>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<table style="margin-left: 5px;" id="btnmenu">
						<tr>
							<td>昵称</td>
							<td id="dialogNickName"></td>
							<td>评论时间</td>
							<td id="dialogCreateTime"></td>
						</tr>
						<tr>
							<td id="dialogContent" colspan="10"></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<div style="padding: 10px 350px;">
			<button type="button" onclick="closeEvaluataDialog();" class="btn btn-mini btn-primary">关闭</button>
		</div>
	</div>
</div>


<div class="modal fade" id="userDetial" tabindex="-1" role="dialog" aria-labelledby="addBrandModalLabel" aria-hidden="true" style="display: none;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<span>评论详情</span>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times; </span>
				</button>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<table style="margin-left: 5px;" id="btnmenu">
						<tr>
							<td>头像</td>
							<td>
								<img alt="用户头像" width="100px" height="100px" src="" id="dialogUserImg">
							</td>
						</tr>
						<tr>
							<td>用户名</td>
							<td id="dialogUserName"></td>
						</tr>
						<tr>
							<td>邮箱</td>
							<td id="dialogUserEmail"></td>
						</tr>
						<tr>
							<td>电话</td>
							<td id="dialogUserPhone"></td>
						</tr>
						<tr>
							<td>性别</td>
							<td id="dialogUserSex"></td>
						</tr>
						<tr>
							<td>生日</td>
							<td id="dialogUserBirthDay"></td>
						</tr>
						<tr>
							<td>会员等级</td>
							<td id="dialogUserVipLever"></td>
						</tr>
						<tr>
							<td>会员积分</td>
							<td id="dialogUserVipPoint"></td>
						</tr>
						<tr>
							<td>角色</td>
							<td id="dialogUserRole"></td>
						</tr>
						<tr>
							<td>个人签名</td>
							<td id="dialogUserSign"></td>
						</tr>
						<tr>
							<td>状态</td>
							<td id="dialogUserState"></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<div style="padding: 10px 350px;">
			<button type="button" onclick="closeUserDialog();" class="btn btn-mini btn-primary">关闭</button>
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
	
	$('.mydate-picker').datepicker();
	
	initMainList();
	
	var table = $("#table_report").DataTable();
	
	$("#searchBtn").click(function(){
		var nickName = $("#nickName").val();
		var comment = $("#comment").val();
		
		var json = '{"nickName":"'+nickName+'","comment":"'+comment+'"}';
		
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
	$("#evaluataDetial").modal("hide");
	$("#userDetial").modal("hide");
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
	bootbox.confirm("确定要删除该商品么?", function(result) {
		if(result){
			$.ajax({
				url : "merchSystem/evaluate/delete",
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
				url : "merchSystem/evaluate/delete",
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



 

function initMainList(){
	var index=1;
	$('#table_report').DataTable( {
	    "columns": [
            { "data": null },
            { "data": "id" },
            { "data": "userId" },
            { "data": "nickname" },
            { "data": "score" },
            { "data": "comment" },
            { "data": "create_time" },
            { "data": null }
        ],
        "columnDefs": [{
					"targets":0,
					render:function(data,type,row){
						var str = "<label><input type='checkbox'  flag='row' value='"+row.id+"' /><span class='lbl'></span></label>";
						return str;
					}
				},{
					"targets":3,
					render:function(data,type,row){
						return "<a href='javascript:;' onclick='checkUser("+row.userId+")'>"+data+"</a>";
					}
        		},{
					"targets":5,
					render:function(data,type,row){
						if(data.length<20){
							return data;
						}else{
							return data.substring(0,20)+"...";
						}
					}
        		},{
					"targets":6,
					render:function(data,type,row){
						return getTimeTxt(data,19);
					}
        		},{
		            "targets": 7,
		            render: function (data, type, row, d) {
		                var context =
		                {
		                    func: [
		                        {"name": "查看", "fn": "docheck(\'" + row.nickname + "\',\'"+row.create_time+"\',\'"+row.comment+"\')", "type": "purple", "icon":"search"},
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
			$('#table_report').DataTable().column(2).visible(false);//隐藏用户ID行
		},
        "bDestroy": true,
        "ajax": {
        	url:"merchSystem/evaluate/goodsEvaluataList?goodsId=${goodsId}",	
        	type: "POST"
        }
    } );
}





function docheck(nickname,createTime,comment){
	$("#dialogNickName").html(nickname);
	$("#dialogCreateTime").html(getTimeTxt(parseInt(createTime),19));
	$("#dialogContent").html(comment);
	$("#evaluataDetial").modal("show");
}

function closeEvaluataDialog(){
	$("#evaluataDetial").modal("hide");
}

//ajax查询用户信息显示
function checkUser(id){
	$.post("merchSystem/evaluate/checkUser",{id:id},function(data){
		console.info(data);
		if(data.status=="success"){
			var user=data.user;
			if(user.sex==1){
				user.sex="男";
			}else if(user.sex==2){
				user.sex="女";
			}else{
				user.sex="未知";
			}
			if(user.is_master==0){
				user.is_master="达人";
			}else{
				user.is_master="普通";
			}
			if(user.is_ban==0){
				user.is_ban="禁用";
			}else{
				user.is_ban="启用";
			}
			$("#dialogUserImg").attr("src",user.head_img);
			$("#dialogUserName").html(user.phone);
			$("#dialogUserEmail").html(user.email);
			$("#dialogUserPhone").html(user.phone);
			$("#dialogUserSex").html(user.sex);
			$("#dialogUserBirthDay").html(user.birthday);
			$("#dialogUserVipLever").html(user.level_name);
			$("#dialogUserVipPoint").html(user.score);
			$("#dialogUserSign").html(user.summary);
			$("#dialogUserRole").html(user.is_master);
			$("#dialogUserState").html(user.is_ban);
			$("#userDetial").modal("show");
		}
	});
}

function closeUserDialog(){
	$("#userDetial").modal("hide");
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
