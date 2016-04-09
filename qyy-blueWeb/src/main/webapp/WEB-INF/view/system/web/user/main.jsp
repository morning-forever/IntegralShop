<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="${system.basePath }">
<%@ include file="/static/inc.jsp" %>

<style type="text/css">
#table_report thead th{
  display:run-in;
  overflow-y:auto;
/* "sScrollXInner": "1160",
		"bScrollCollapse": true,
		"scrollX": true, */
}

</style>

</head>
<body>
<div class="container-fluid" id="main-container">
	<div id="breadcrumbs">
		<ul class="breadcrumb">
			<li><i class="icon-home"></i> <a href="javascript:;">当前</a><span class="divider"><i class="icon-angle-right"></i></span></li>
			<li class="active">会员管理</li>
		</ul><!--.breadcrumb-->
	</div><!--#breadcrumbs-->
	<div class="row-fluid">
		<!-- <h3 class="header smaller lighter blue">会员管理</h3> -->
		<div class="table-header">
			会员管理
		</div>
		<div class="tab-content">
			<table style="margin-left: 5px;" id="btnmenu">
				<tbody>
					<tr>
						<td>
							昵称：
						</td>
						<td>
							<span style="margin-top: 7px;" class="input-icon">
								<input  type="text" placeholder="这里输入昵称" class="mysearch" data-cmd="1" id="nickname">
								<i class="icon-search"></i>
							</span>
						</td>
					
						<td>
							手机号：
						</td>
						<td>
							<span style="margin-top: 7px;" class="input-icon">
								<input  type="text" placeholder="这里输入手机号" class="mysearch" data-cmd="1" id="phone">
								<i class="icon-search"></i>
							</span>
						</td>
						<td>
							邮箱：
						</td>
						<td>
							<span style="margin-top: 7px;" class="input-icon">
								<input  type="text" placeholder="这里输入邮箱" class="mysearch" data-cmd="4" id="email">
								<i class="icon-search"></i>
							</span>
						</td>
						
						<td>
							状态：
						</td>
						<td>
							<span style="margin-top: 7px;" class="input-icon">
								<select id="isBan" style="width: 110px;">
									<option value="">所有</option>
									<option value="1">启用</option>
									<option value="0">禁用</option>
								</select>
							</span>
						</td>
						
						
						<td>
							<a title="查询" onclick="" class="btn btn-mini btn-light" id="searchBtn"><i class="icon-search"></i>查询</a>
						</td>
						<!-- <td>
							<a title="密码重置" href="javascript:;" class="btn btn-mini btn-success" id="repwdBtn"><i class="icon-pencil"></i> 密码重置</a>
						</td> -->
						<!-- <td>
							<a title="删除" href="javascript:;" class="btn btn-mini btn-danger" id="trashBtn"><i class="icon-trash"></i> 删除</a>
						</td> -->
					</tr>
				</tbody>
			</table>
			<table id="table_report" class="table table-striped table-bordered table-hover" style="margin-left: 0px; ">
				<thead>
					<tr>
						<th >序号</th>
						<th >昵称</th>
						<th >性别</th>
						<th >生日</th>
						<th >手机号</th>
						<th >邮箱</th>
						<th >等级</th>
						<th >桃子</th>
						<th >角色</th>
						<th >注册时间</th>
						<th >第三方登录</th>
						<th >启/禁用</th>
						<th >操作</th>
					</tr>
				</thead>
				<tbody></tbody> 
			</table>
		</div>
	</div>
</div>
<!-- #main-content -->

<%@ include file="/static/foot.jsp" %>
</body>
<!--定义操作列按钮模板-->
<script id="tpl" type="text/x-handlebars-template">
	{{#each func}}
	<a class="btn btn-mini btn-{{this.type}}" {{this.property}} href="javascript:;" title="{{this.name}}" target="mainFrame" onclick="{{this.fn}}"><i class="icon-{{this.icon}}"></i></a>
	{{/each}}
</script>
<script type="text/javascript">

var tpl = $("#tpl").html();
//预编译模板
var template = Handlebars.compile(tpl);

$(document).ready(function(){
	initList();
	
	//设置table的宽度
	$("#table_report").on('draw.dt',function() {
    	$(".dataTables_wrapper").css("width","1500px");
    });
	var table = $("#table_report").DataTable();
	$("#searchBtn").click(function(){
		/* var data = data|{};
		data = {
			"nickname" : $("#nickname").val(),
			"phone": $("#phone").val(),
			"email": $("#email").val(),
			"isBan": $("#isBan").val()
		} */		
		var json = '{"nickname":"'+$("#nickname").val()+'","phone":"'+$("#phone").val()+'","email":"'+$("#email").val()+'","isBan":"'+$("#isBan").val()+'"}';
    	table.search(json).draw();
	});
});

var initList = function(){
	$('#table_report').DataTable( {
		/* "sScrollX":"100%",
		"scrollX": true, 
        "scrollCollapse": true, 
        "scrollXInner": "110%",
        
		"sScrollY":350,
		"scrollY": true, */
		"bDestroy": true,
        "ajax": {
        	url:"admin/webusermngr/list",	
        	type: "POST"
        },
		"columns": [
            { "data": null  },
            { "data": "nickname" },
            { "data": "sex" },
            { "data": "birthday" },
            { "data": "phone" },
            { "data": "email" },
            { "data": "parentLevelDesc" },
            { "data": "score" },
            { "data": "isMaster" },
            { "data": "createTime" },
            { "data": "thirdLogin" },
            { "data": "isBan" },
            { "data": null }
        ],
        "columnDefs": [
			{
				"targets": 0,
				render: function (a, b, c, d) {
			        return d.row+1;
				}
			},
			{
				"targets": 11,
				render: function (a, b, c, d) {
					var context = {};
					if(a==1){
						context =
	 	                {
	 	                    func: [
	 	                        {"type":"danger","name": "点击禁用", "fn": "banUser(\'" + c.id + "\')", "type": "danger", "icon":"remove"}
	 	                    ]
	 	                };
					}else{
						context =
	 	                {
	 	                    func: [
	 	                        {"type":"success","name": "点击启用", "fn": "banUser(\'" + c.id + "\')", "type": "success", "icon":"ok"}
	 	                    ]
	 	                };
					}
 	                var html = template(context);
 	            	return html;
				}
			},
			{
 	            "targets": 12,
 	            render: function (a, b, c, d) {
 	            	var context =
 	                {
 	                    func: [
							{"name": "重置密码", "fn": "resetPwd(\'" + c.id + "\')", "type": "success", "icon":"pencil"},
 	                        {"name": "编辑", "fn": "infoUser(\'" + c.id + "\')", "type": "purple", "icon":"edit"},
 	                        {"name": "删除", "fn": "delUser(\'" + c.id + "\')", "type": "danger", "icon":"trash"}
 	                    ]
 	                };
 	                var html = template(context);
 	            	return html;
           		}
  	        }
   		]
    });
}

var infoUser = function(id){
	targetMainFrame("admin/webusermngr/infoUser?id="+id);
};

var delUser =function(id){
	bootbox.confirm("您确定要删除此用户，删除后不能恢复！",function(b){
		if(b){
			var data = {'id':id};
			$.post("admin/webusermngr/delUser",data,function(res){
				if('success' == res.status){
					bootbox.alert("操作成功！");
				}else{
					bootbox.alert("操作失败！");
				}
				$("#searchBtn").click();
			},"JSON");
		}
	});
};

var resetPwd = function(id){
	bootbox.confirm("您在重置此用户的密码，重置后请及时的通知对方！",function(b){
		if(b){
			var data = {'id':id};
			$.post("admin/webusermngr/resetPwd",data,function(res){
				if('success' == res.status){
					bootbox.alert("操作成功！重置后密码是：‘888888’,请告知对方！");
				}else{
					bootbox.alert("操作失败！");
				}
				$("#searchBtn").click();
			},"JSON");
		}
	});
};

var banUser = function(id){
	bootbox.confirm("您将操作用户登录权限！",function(b){
		if(b){
			var data = {'id':id};
			$.post("admin/webusermngr/banUser",data,function(res){
				var str = "";
				if('success' == res.status){
					str = (res.isBan == 0)?"禁用成功！":"启用成功！";
				}else{
					str = (res.isBan == 0 || typeof(res.isBan)==undefined )?"禁用成功！":"启用成功！";
				}
				bootbox.alert(str,function(){
					$("#searchBtn").click();
				});
			},"JSON");
		}
	});
};


</script>
</html>
