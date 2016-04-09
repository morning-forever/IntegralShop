<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="${system.basePath }">
<%@ include file="/static/inc.jsp"%>
</head>
<style type="text/css">
</style>
<body>
	<div class="container-fluid" id="main-container">
		<div id="breadcrumbs">
			<ul class="breadcrumb">
				<li><i class="icon-home"></i> <a
					href="javascript:alert('index');">当前</a><span class="divider"><i
						class="icon-angle-right"></i></span></li>
				<li class="active">订单管理</li>
			</ul>
			<!--.breadcrumb-->
		</div>
		<!--#breadcrumbs-->
		<div class="row-fluid">
			<div class="table-header">评价列表</div>
			<div class="tab-content">
					<table style="margin-left: 5px;" id="btnmenu">
						<tbody>
							<tr>
								<td>
									昵称：
								</td>
								<td>
									<span style="margin-top: 7px;" class="input-icon">
										<input type="text" placeholder="请输入昵称" class="mysearch"
										id="nickName"> <i class="icon-search"></i>
									</span>
								</td>
								<td>
									评价：
								</td>
								<td>
									<span style="margin-top: 7px;" class="input-icon">
									<input type="text" class="mysearch" id="comment" placeholder="请输入评价"> <i class="icon-search"></i>
									</span>
								</td>
								<td>
									评论时间：
								</td>
								<td>
									<div class="input-prepend">
										<span class="add-on"><i class="icon-calendar"></i></span>
										<input type="text" id="timeFrom" readonly="readonly" class="span11 mydate-picker" data-date-format="yyyy-mm-dd">
									</div>
								</td>
								<td>
									至：
								</td>
								<td>
									<div class="input-prepend">
										<span class="add-on"><i class="icon-calendar"></i></span>
										<input type="text" id="timeTo" readonly="readonly" class="span11 mydate-picker" data-date-format="yyyy-mm-dd">
									</div>
								</td>
								<td>
									<a title="查询" class="btn btn-mini btn-light" id="searchBtn"><i class="icon-search"></i>查询</a>
									<a title="清空" class="btn btn-mini btn-light" id="clearBtn"><i class="icon-search"></i>清空</a>
								</td>
							</tr>
						</tbody>
					</table>
					<h4>路线名称：${depthName }</h4>
					<h4>总评分：${avgScore }</h4>
					<table id="table_report"
						class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>序号</th>
								<th>昵称</th>
								<th>评价分数</th>
								<th>评价内容</th>
								<th>评价时间</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</div>
			</div>
		</div>
		
		<!-- Modal 评论详情-->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true"
			style="display: none;">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div>
							<table class="mytable-detail">
								<tr>
									<th>昵称：</th>
									<td>aaaa</td>
									<th>评论时间：</th>
									<td>bbbb</td>
								</tr>
								<tr>
									<td colspan="4" align="center">kkkk</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<div style="padding: 10px 350px;">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
		
	<!-- #main-content -->
	<%@ include file="/static/foot.jsp"%>
</body>
<script type="text/javascript" src="static/js/jquery.form.js"></script>
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

	$(document).ready(function() {
		
		initMainList();
		
		//初始化时间插件
		$('.mydate-picker').datepicker();
		
		//查询
		var table = $("#table_report").DataTable();
		$("#searchBtn").click(function() {
			var json = '{';
			$("#btnmenu input").each(function() {
				json += '"' + this.id + '":"' + $(this).val() + '",';
			});
			json = json.substr(0, json.length - 1);
			json += '}';
			table.search(json).draw();
		});	
		
		//清空
		$("#clearBtn").click(function(){
			$("#btnmenu input").val("");
		});

	});

	//加载评价
	function initMainList() {
		$('#table_report').DataTable({
			"columns" : [ 
			{"data" : null}, //0-序号
			{"data" : "nickname"}, //1-昵称
			{"data" : "score"} ,//2-评价分数
			{"data" : "comment"} ,//3-评价内容
			{"data" : "create_time"} ,//4-评价时间
			{"data" : null} //5-操作
			],
			"columnDefs" : [ 
			{
				"targets" : 0,
				render : function(a, b, c, d) {
					return d.row + 1;
				}
			},
			{
				"targets" : 1,
				render : function(a, b, c, d) {
					var name = "<a href='admin/webusermngr/infoUser?id="+c.userId+"'>"+c.nickname+"</a>";
					return name;
				}
			}, 
			{
				"targets" : 3,
				render : function(a, b, c, d) {
					var comment = "";
					if(a.length > 30){
						comment = a.substr(0,30)+"..."
					}else{
						comment = a;
					}
					return comment;
				}
			},
			{
				"targets" : 4,
				render : function(a, b, c, d) {
					var date = new Date(a).format("yyyy-MM-dd");
					return date;
				}
			},
			{
				"targets" : 5,
				render : function(a, b, c, d) {
					var context = {func : [ 
						   {"name" : "查看","fn" : "openModel(\'" + c.nickname + "'\," + c.create_time + ",\'" + c.comment + "'\)","type" : "light","icon" : "eye-open"}, 
						   {"name" : "删除","fn" : "doDelete(\'" + c.id + "'\)","type" : "danger","icon" : "trash"} 
						]};
					var html = template(context);
					return html;
				}
			} ],
			"bDestroy" : true,
			"ajax" : {
				url : "admin/evaluate/listByDepth",
				data : {'depthId' : "${depthId}"},
				type : "POST"
			}
		});
	}
	
	//打开弹出框
	function openModel(nickname, create_time, comment) {
		$("#myModal").find("table tr:eq(0) td:eq(0)").text(nickname);//昵称
		$("#myModal").find("table tr:eq(0) td:eq(1)").text( new Date(create_time).format("yyyy-MM-dd") );//评论时间
		$("#myModal").find("table tr:eq(1) td:eq(0)").text(comment);//评论内容
		$("#myModal").modal("show");
	}
	
	
	//删除
	function doDelete(id) {
		bootbox.confirm("确定要删除吗?", function(result) {
			if (result) {
				$.ajax({
					url : "admin/evaluate/deleteEvaluate",
					post : "post",
					data : {
						"id" : id
					},
					success : function(data) {
						if (data.status == "success") {
							bootbox.alert("删除成功！");
							$('#table_report').DataTable().clear();
							$('#table_report').DataTable().draw();
						}
					}

				});
			}
		});
	}
	
	Date.prototype.format = function(format) {
	    var date = {
	           "M+": this.getMonth() + 1,
	           "d+": this.getDate(),
	           "h+": this.getHours(),
	           "m+": this.getMinutes(),
	           "s+": this.getSeconds(),
	           "q+": Math.floor((this.getMonth() + 3) / 3),
	           "S+": this.getMilliseconds()
	    };
	    if (/(y+)/i.test(format)) {
	           format = format.replace(RegExp.$1, (this.getFullYear() + '').substr(4 - RegExp.$1.length));
	    }
	    for (var k in date) {
	           if (new RegExp("(" + k + ")").test(format)) {
	                  format = format.replace(RegExp.$1, RegExp.$1.length == 1
	                         ? date[k] : ("00" + date[k]).substr(("" + date[k]).length));
	           }
	    }
	    return format;
	}
	
</script>
</html>
