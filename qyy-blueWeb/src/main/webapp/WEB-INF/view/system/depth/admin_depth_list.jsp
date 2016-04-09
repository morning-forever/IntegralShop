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
form label {
	width: 220px;
}

#myform2 th {
	padding-left: 0px;
}

#myform5 th {
	padding-left: 0px;
}

#myform6 th {
	padding-left: 0px;
}
</style>
<body>
	<div class="container-fluid" id="main-container">
		<div id="breadcrumbs">
			<ul class="breadcrumb">
				<li><i class="icon-home"></i> <a
					href="javascript:alert('index');">当前</a><span class="divider"><i
						class="icon-angle-right"></i></span></li>
				<li class="active">主题深度游管理</li>
			</ul>
			<!--.breadcrumb-->
		</div>
		<!--#breadcrumbs-->
		<div class="row-fluid">
			<div class="table-header">新增/编辑主题深度游</div>
				<div class="tab-content">
					<table style="margin-left: 5px;" id="btnmenu">
						<tbody>
							<tr>
								<td>
									主题名称：
								</td>
								<td>
									<input type="text" placeholder="请输入主题名称" class="mysearch" id="depthName"> 
								</td>
								<td>
									所在地：
								</td>
								<td>
									<select id="cityId" style="width: 180px">
										<option value="">全部</option>
										<c:forEach items="${cityList }" var="city">
											<option value="${city.id }">${city.city }</option>
										</c:forEach>
									</select>
								</td>
								<td>
									行程天数：
								</td>
								<td>
									<select id="days" style="width: 180px">
										<option value="">全部</option>
										<c:forEach items="${dayList }" var="day">
											<option value="${day.days }">${day.days }</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<td>
									成人价格：
								</td>
								<td>
									<input type="text" placeholder="请输入成人价格" class="mysearch" id="adultPrice"> 
								</td>
								<td>
									儿童价格：
								</td>
								<td>
									<input type="text" placeholder="请输入儿童价格" class="mysearch" id="childPrice"> 
								</td>
								<td>
									推荐指数：
								</td>
								<td>
									<select id="expon" style="width: 150px">
										<option value="">全部</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>
									方位：
								</td>
								<td>
									<select id="azimuthId" style="width: 150px">
										<option value="">全部</option>
										<c:forEach items="${azimuthList }" var="azimuth">
											<option value="${azimuth.id }">${azimuth.azimuth }</option>
										</c:forEach>
									</select>
								</td>
								<td>
									主题：
								</td>
								<td>
									<select id="subjectId" style="width: 150px">
										<option value="">全部</option>
										<c:forEach items="${subjectList }" var="subject">
											<option value="${subject.id }">${subject.subject }</option>
										</c:forEach>
									</select>
								</td>
								<td>
									<a title="查询" class="btn btn-mini btn-success" id="searchBtn"><i class="icon-search"></i>查询</a>
									<a title="清空" class="btn btn-mini btn-success" id="clearBtn"><i class="icon-refresh"></i>清空</a>
								</td>
							</tr>
							<tr>
								<td colspan="5"><a title="新增" href="admin/depth/detail/0" target="mainFrame"
									class="btn btn-mini btn-info"><i class="icon-plus"></i> 新增</a>
								</td>
							</tr>
						</tbody>
					</table>
					<table id="table_report" class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>序号</th>
								<th>主题名称</th>
								<th>所在地</th>
								<th>行程天数</th>
								<th>成人价</th>
								<th>儿童价</th>
								<th>标签</th>
								<th>推荐指数</th>
								<th>方位</th>
								<th>主题</th>
								<th>上架状态</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</div>
		</div>
	</div>
	<%@ include file="/static/foot.jsp"%>
</body>
<script type="text/javascript" charset="utf-8"
	src="plugins/ueditor1.4.3/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="plugins/ueditor1.4.3/ueditor.all.min.js"></script>
<script type="text/javascript" src="static/js/jquery.form.js"></script>
<script type="text/javascript" src="static/js/daterangepicker.min.js"></script>
<script type="text/javascript" src="static/js/bootstrap-timepicker.min.js"></script>
<script type="text/javascript" src="static/js/base.js"></script>
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
		//初始化加载列表
		initMainList();
		
		//设置table的宽度
		$("#table_report").on('draw.dt',function() {
	    	$(".dataTables_wrapper").css("width","1700px");
	    });
		
		//查询
		var table = $("#table_report").DataTable();
		$("#searchBtn").click(function() {
			var json = '{';
			$("#btnmenu select,#btnmenu input").each(function() {
				json += '"' + this.id + '":"' + $(this).val() + '",';
			});
			json = json.substr(0, json.length - 1);
			json += '}';
			var flag = true;
			var adultPrice = $("#adultPrice").val();
			var childPrice = $("#childPrice").val();
			if(isNaN(adultPrice)){
				valTips('adultPrice',"请输入数字");
				flag = false;
			}
			if(isNaN(childPrice)){
				valTips('childPrice',"请输入数字");
				flag = false;
			}
			if(flag){
				table.search(json).draw();
			}
		});	
		
		//清空
		$("#clearBtn").click(function(){
			$("#btnmenu input,#btnmenu select").val("");
		});
	});

	//初始化加载列表
	function initMainList(){
		$('#table_report').DataTable( {
			"bDestroy": true,
	        "ajax": {
	        	url:"admin/depth/list",	
	        	type: "POST"
	        },
			"columns": [
	            { "data": null },//序号
	            { "data": "name" },//主题名称
	            { "data": "addrNames" },//所在地
	            { "data": "days" },//行程天数
	            { "data": "adult_price" },//成人价
	            { "data": "child_price" },//儿童价
	            { "data": "label" },//标签
	            { "data": "expon" },//推荐指数
	            { "data": "azimuth" },//方位
	            { "data": "subjectNames" },//主题
	            { "data": "is_shelves" },//上架状态
	            { "data": null }//操作
	        ],
	        "columnDefs": [
				{
					"targets": 0,
					render: function (a, b, c, d) {
		                return d.row+1;
					}
				},
				{
					"targets":10,
					render:function(data,type,row){
						var str="";
						if(data==0){
							str="上架";
						}else{
							str="下架";
						}
						return str;
					}
        		},
				{
	 	            "targets": 11,
	 	            render: function (a, b, c, d) {
	 	            	var context;
	 	            	if(c.is_shelves == 1){
	 	            		context =
		 	 	                {
		 	 	                    func: [
		 	 	                        {"name": "编辑", "fn": "doEdit(\'" + c.id + "\')", "type": "purple", "icon":"edit"},
		 	 	                       	{"name": "上架", "fn": "onOffLine(\'" + c.id + "\',0)", "type": "info", "icon":"check"},
		 	 	                        {"name": "删除", "fn": "doDelete(\'" + c.id + "\')", "type": "danger", "icon":"trash"}
		 	 	                    ]
		 	 	                };
	 	            	}else{
	 	            		context =
		 	 	                {
		 	 	                    func: [
		 	 	                        {"name": "编辑", "fn": "doEdit(\'" + c.id + "\')", "type": "purple", "icon":"edit"},
		 	 	                       	{"name": "下架", "fn": "onOffLine(\'" + c.id + "\',1)", "type": "info", "icon":"check-empty"},
		 	 	                        {"name": "删除", "fn": "doDelete(\'" + c.id + "\')", "type": "danger", "icon":"trash"}
		 	 	                    ]
		 	 	                };
	 	            	}
	 	            	return template(context);
	           		}
	  	        }
	   		]
	    });
	}
	
	//编辑
	function doEdit(depthId){
		location.href = "admin/depth/detail/"+depthId;
	}
	
	//上架和下架
	function onOffLine(depthId,isShelves){
		var tip = "";
		if(isShelves == 0){
			tip= "上架";
		}else if(isShelves == 1){
			tip= "下架";
		}
		bootbox.confirm("确定要"+tip+"吗?", function(result) {
			if (result) {
				$.ajax({
					url : "admin/depth/onOffLine",
					post : "post",
					data : {
						"depthId" : depthId,
						"isShelves" : isShelves
					},
					success : function(data) {
						if (data.status == "success") {
							bootbox.alert(tip+"成功！");
							$('#table_report').DataTable().clear();
							$('#table_report').DataTable().draw();
						} else {
							bootbox.alert("服务器异常！");
						}
					}
				});
			}
		});
	}
	
	//删除
	function doDelete(depthId){
		bootbox.confirm("确定要删除吗?", function(result) {
			if (result) {
				$.ajax({
					url : "admin/depth/deleteDepth",
					post : "post",
					data : {
						"depthId" : depthId
					},
					success : function(data) {
						if (data.status == "success") {
							bootbox.alert("删除成功！");
							$('#table_report').DataTable().clear();
							$('#table_report').DataTable().draw();
						} else {
							bootbox.alert("服务器异常！");
						}
					}
				});
			}
		});
	}
	
</script>
</html>
