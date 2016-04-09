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
									路线名称：
								</td>
								<td>
									<input type="text" placeholder="请输入路线名称" class="mysearch" id="depthName"> 
								</td>
								<td>
									总评分：
								</td>
								<td>
									<input type="text" class="mysearch" id="scoreFrom"> 
								</td>
								<td>
									至：
								</td>
								<td>
									<input type="text" class="mysearch" id="scoreTo"> 
								</td>
							</tr>
							<tr>
								<td>
									评论时间：
								</td>
								<td>
									<div class="input-prepend">
										<span class="add-on"><i class="icon-calendar"></i></span>
										<input type="text" id="startDate" name="timeFrom" readonly="readonly" class="span11 mydate-picker" data-date-format="yyyy-mm-dd">
									</div>
								</td>
								<td>
									至：
								</td>
								<td>
									<div class="input-prepend">
										<span class="add-on"><i class="icon-calendar"></i></span>
										<input type="text" id="endDate" name="timeTo" readonly="readonly" class="span11 mydate-picker" data-date-format="yyyy-mm-dd">
									</div>
								</td>
								<td colspan="2">
									<a title="查询" class="btn btn-mini btn-success" id="searchBtn"><i class="icon-search"></i>查询</a>
									<a title="清空" class="btn btn-mini btn-success" id="clearBtn"><i class="icon-refresh"></i>清空</a>
								</td>
							</tr>
						</tbody>
					</table>
					<table id="table_report"
						class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>序号</th>
								<th>路线名称</th>
								<th>总评分</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</div>
			</div>
		</div>
		
	<!-- #main-content -->
	<%@ include file="/static/foot.jsp"%>
</body>
<script type="text/javascript" src="static/js/jquery.form.js"></script>
<script type="text/javascript" src="static/js/daterangepicker.min.js"></script>
<script type="text/javascript" src="static/web/js/base.js"></script>
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
		/* $( "#startDate" ).datepicker({
	      defaultDate: "+1w",
	      changeMonth: true,
	      numberOfMonths: 3,
	      onSelect : function( selectedDate ) {
	        $( "#endDate" ).datepicker( "option", "minDate", selectedDate );
	      }
	    });
	    $( "#endDate" ).datepicker({
	      defaultDate: "+1w",
	      changeMonth: true,
	      numberOfMonths: 3,
	      onSelect: function( selectedDate ) {
	        $( "#startDate" ).datepicker( "option", "maxDate", selectedDate );
	      }
	    }); */
		
		//查询
		var table = $("#table_report").DataTable();
		$("#searchBtn").click(function() {
			var json = '{';
			$("#btnmenu input").each(function() {
				json += '"' + this.id + '":"' + $(this).val() + '",';
			});
			json = json.substr(0, json.length - 1);
			json += '}';
			var flag = true;
			var scoreFrom = $("#scoreFrom").val();
			var scoreTo = $("#scoreTo").val();
			if(isNaN(scoreFrom) || scoreFrom < 0){
				valTips('scoreFrom',"请输入正确的数字");
				flag = false;
			}
			if(isNaN(scoreTo) || scoreTo < 0){
				valTips('scoreTo',"请输入正确的数字");
				flag = false;
			}
			if(scoreFrom > scoreTo){
				valTips('scoreFrom',"起始总评分不能大于结束总评分");
				flag = false;
			}
			if($("#startDate").val() > $("#endDate").val()){
				valTips('startDate',"评论起始时间不能大于评论结束时间");
				flag = false;
			}
			if(flag){
				table.search(json).draw();
			}
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
			{"data" : "name"}, //1-路线名称
			{"data" : "avgScore"} ,//2-总评分
			{"data" : null} //3-操作
			],
			"columnDefs" : [ {
				"targets" : 0,
				render : function(a, b, c, d) {
					return d.row + 1;
				}
			}, 
			{
				"targets" : 1,
				render : function(a, b, c, d) {
					var name = "<a href='admin/depth/detail/"+c.id+"'>"+c.name+"</a>";
					return name;
				}
			},
			{
				"targets" : 3,
				render : function(a, b, c, d) {
					var context = {func : [ 
						   {"name" : "查看","fn" : "toDepthEvaluate(\'" + c.id + "'\,\'" + c.name + "'\,\'" + c.avgScore + "'\)","type" : "light","icon" : "eye-open"}, 
						   {"name" : "删除","fn" : "doDelete(\'" + c.id + "'\)","type" : "danger","icon" : "trash"} 
						]};
					var html = template(context);
					return html;
				}
			} ],
			"bDestroy" : true,
			"ajax" : {
				url : "admin/evaluate/list",
				type : "POST"
			}
		});
	}
	
	//跳转至具体深度游评价页面
	function toDepthEvaluate(id, name, avgScore){
		var json = {
			'depthId' : id,
			'depthName' :name, 
			'avgScore' : avgScore
		};
		subWebForm('admin/evaluate/toDepthEvaluate',json);
	}
	
	//删除
	function doDelete(id) {
		bootbox.confirm("删除会删除该路线相关的所有评价，确定要删除吗?", function(result) {
			if (result) {
				$.ajax({
					url : "admin/evaluate/deleteByDepth",
					post : "post",
					data : {
						"depthId" : id
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
	
</script>
</html>
