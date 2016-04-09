<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="${system.basePath }">
<%@ include file="/static/inc.jsp" %>
</head>
<style type="text/css">
form label{
	width: 220px;
}

table tr td textarea{
	min-width:400px;
	width: 800px;
	height: 200px;
}

span select{
	width: 128px;
}

.btn_div{
	margin-bottom: 5px;
}

</style>
<body>
<div class="container-fluid" id="main-container">
	<div id="breadcrumbs">
		<ul class="breadcrumb">
			<li><i class="icon-home"></i> <a href="javascript:;">当前</a><span class="divider"><i class="icon-angle-right"></i></span></li>
			<li class="active">地点管理</li>
		</ul><!--.breadcrumb-->
	</div><!--#breadcrumbs-->
	<div class="row-fluid">
		<!-- <h3 class="header smaller lighter blue">会员管理</h3> -->
		<div class="table-header">
			地点列表
		</div>
		<div style="height: 50px;">
			<table style="margin-left: 5px;" id="btnmenu">
				<tbody>
					<tr>
						<td>
							市：
						</td>
						<td>
							<span style="margin-top: 7px;" class="input-icon">
								<select id="city">
									<option value="">请选择城市</option>
									<c:forEach items="${cityList }" var="city">
									<option value="${city.id }">${city.name }</option>
									</c:forEach>
								</select>
							</span>
						</td>
					
						<td>
							区域：
						</td>
						<td>
							<span style="margin-top: 7px;" class="input-icon">
								<select id="county">
									<option value="">请选择地区</option>
								</select>
							</span>
						</td>
						
						<td>
							地点：
						</td>
						<td>
							<span style="margin-top: 7px;" class="input-icon">
								<select id="store">
									<option value="">请选择地点</option>
									<c:forEach items="${starList }" var="star">
									<option value="${star.id }">${star.starDetail }</option>
									</c:forEach>
								</select>
							</span>
						</td>
						
						<td>
							<a title="查询" onclick="" class="btn btn-mini btn-light" id="searchBtn"><i class="icon-search"></i>查询</a>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<ul class="nav nav-tabs" id="cart_nav_tabs">
		    <li class="active" ><a href="#tab_1" id="rent">快旅租车</a></li>
		    <li ><a href="#tab_2" id="wrap">快旅包车</a></li>
		    <li ><a href="#tab_3" id="bus">快旅班车</a></li>
		    <li ><a href="#tab_4" id="carpool">快旅拼车</a></li>
		</ul>
		<div class="tab-content">
			<div class="btn_div">
				<a title="新增地点" href="javascript:;" class="btn btn-mini btn-success" onclick="addAddrs();"><i class="icon-pencil"></i>新增地点</a>
				<!-- <a title="删除" href="javascript:;" class="btn btn-mini btn-info" onclick="delAddrs('rent');"><i class="icon-trash"></i> 删除</a> -->
			</div>	
			<!-- 车辆基本信息 -->
		    <div class="tab-pane active" id="tab_1">
		    	
		    </div>
		    
		    <!-- 车辆配置信息 -->
		    <div class="tab-pane" id="tab_2">
		    
		    </div>
		    
		    <!-- 日历控件 -->
		    <div class="tab-pane" id="tab_3" >
		    
		    </div>
		    <!-- 上传图片 -->
		    <div class="tab-pane" id="tab_4" >
		    	
		    </div>
		    
		    <table id="table_cart" class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>序号</th>
						<th>市</th>
						<th>区域</th>
						<th>地点</th>
						<th>具体地址</th>
						<th>联系电话</th>
						<th>营业时间</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody></tbody> 
			</table>
		    
	    </div>
	</div>
</div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
            </div>
        	<ul class="nav nav-tabs" id="otherInfoTab">
			    <li class="active"><a href="javascript:;" id="modalTitle">添加地点</a></li>
			</ul>
			<div class="tab-content">
				<form id="modalForm">
			    	<div class="modal-body">
	                	<table class="mytable-detail">
	                		<tr> 
	                			<th width="70">
	                				市：
	                			</th>
	                			<td>
	                				<input id="addrType" name="addrType" type="hidden" value="rent">
	                				<input id="addrId" name="id" type="hidden" value="">
	                			 	<select id="allCity" name="cityId">
	                			 		<option value="">请选择城市</option>
	                			 	</select>
	                			</td>
	                			<th width="70">
	                				区域：
	                			</th>
	                			<td>
	                			 	<select id="allCounty" name="countyId" >
	                			 		<option>请选择地区</option>
	                			 	</select>
	                			</td>
	                		</tr>
	                		<tr>
	                			<th>
	                				地点：
	                			</th>
	                			<td>
	                			 	<input type="text" class="form-control" id="store" name = "store" placeholder="请输入地点">
	                			</td>
	                		</tr>
	                		<tr>
	                			<th>
	                				具体地址：
	                			</th>
	                			<td colspan="3">
	                			 	<input type="text" class="form-control span5" id="addrDetail" name = "addrDetail" placeholder="请输入具体地址">
	                			</td>
	                		</tr>
	                		<tr>
	                			<th>
	                				电话：
	                			</th>
	                			<td>
	                			 	<input type="text" class="form-control" id="linkTel" name = "linkTel" placeholder="请输入联系电话">
	                			</td>
	                			<th>
	                				营业时间：
	                			</th>
	                			<td>
	                			 	<input type="text" class="span2" id="openStart" name = "openStart" placeholder="请输入开始时间">
	                			 	至
	                			 	<input type="text" class="span2" id="openEnd" name = "openEnd" placeholder="请输入结束时间">
	                			</td>
	                		</tr>
	                		<tr id="coolTr"><th>地点类型：</th>
							<td>
							<select id="addrTypes" name="addrTypes">
							<option value="carpool_start">出发地点</option>
							<option value="carpool_end">目的地点</option>
						 	</select>
							</td></tr>
	                	</table>
		            </div>
	            </form>
			</div>
			<div style = "padding:10px 350px;">
				<button type="button" class="btn btn-primary" id="save-btn" onclick="save();" >保存</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			</div>
        </div>
    </div>
</div>


<input id="carType" type="hidden" value="rent">
<%@ include file="/static/foot.jsp" %>
</body>
<script type="text/javascript" charset="utf-8" src="plugins/ueditor1.4.3/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="plugins/ueditor1.4.3/ueditor.all.min.js"></script>
<script type="text/javascript" src="static/js/jquery.form.js"></script>
<script type="text/javascript" src="static/js/ajaxfileupload.js"></script>
<script type="text/javascript" src="static/js/daterangepicker.min.js"></script>
<script type="text/javascript" src="static/js/bootstrap-timepicker.min.js"></script>
<script type="text/javascript" src="static/js/fuelux.spinner.js"></script>
<script type="text/javascript" src="static/web/js/base.js"></script>
<script type="text/javascript" src="static/js/fullcalendar.min.js"></script>
<!--定义操作列按钮模板-->
<script id="tpl" type="text/x-handlebars-template">
	{{#each func}}
	<a class="btn btn-mini btn-{{this.type}}" {{this.property}} href="javascript:;" title="{{this.name}}" target="mainFrame" onclick="{{this.fn}}"><i class="icon-{{this.icon}}"></i></a>
	{{/each}}
</script>
<script type="text/javascript">
//预编译模板
var tpl = $("#tpl").html();
var template = Handlebars.compile(tpl);

var param = param | {};
$(document).ready(function(){
	$('.mydate-picker').datepicker();
	
	/*tab页*/
	$('#cart_nav_tabs a:eq(0)').tab('show');//初始化显示哪个tab

    $('#cart_nav_tabs a').click(function(e) {
        e.preventDefault();//阻止a链接的跳转行为
        $(this).tab('show');//显示当前选中的链接及关联的content
        $("#carType").val(this.id);
        doSearch();
    });
	
    initList();
	
	//查询
	$("#searchBtn").click(function(){
		doSearch();
	});
	
	/*根据城市的改变来获取区域*/
	$("#allCity").change(function(){
		var allCounty = $("#allCounty");
		allCounty.empty();
		allCounty.append("<option value>请选择地区</option>");
		$.post("allowAccess/countyList1",{'cityId':this.value},function(req){
			var itemP = "";
			var list = req.countyList;
			for(var i in list){
				var item = list[i];
				itemP = "<option value="+item.id+">"+item.name+"</option>";
				allCounty.append(itemP);
			}
		},"JSON");
	});
	
	
	/*区域信息*/
	$("#city").change(function(){
		var store = $("#store");
		store.empty();
		store.append("<option value>请选择地点</option>");
		var county = $("#county");
		county.empty();
		county.append("<option value>请选择地区</option>");
		county.attr({"onchange":'countyChange(this);'});
		$.post("admin/cart/addrs/countyList",{'cityId':this.value},function(req){
			var itemP = "";
			var list = req.countyList;
			for(var i in list){
				var item = list[i];
				itemP = "<option value="+item.id+">"+item.name+"</option>";
				county.append(itemP);
			}
		},"JSON");
	});
	
});

var initAllCity = function(){
	var allCity = $("#allCity");
	allCity.empty();
	allCity.append("<option value>请选择城市</option>");
	$.post("allowAccess/allCityList",{},function(req){
		var itemP = "";
		var list = req.cityAllList;
		for(var i in list){
			var item = list[i];
			itemP = "<option value="+item.id+">"+item.name+"</option>";
			allCity.append(itemP);
		}
	},"JSON");
};

var countyChange = function(county){
	var store = $("#store");
	store.empty();
	store.append("<option value>请选择地点</option>");
	$.post("admin/cart/addrs/storeList",{'countyId':county.value},function(req){
		var itemP = "";
		var list = req.storeList;
		for(var i in list){
			var item = list[i];
			itemP = "<option value="+item.store+">"+item.store+"</option>";
			store.append(itemP);
		}
	},"JSON");
};

var doSearch = function(){
	var table = $("#table_cart").DataTable();
	var json = '{"cityId":"'+$("#city").val()+'","countyId":"'+$("#county").val()+'","store":"'+$("#store").val()+'","carType":"'+$("#carType").val()+'"}';
	table.search(json).draw();
};

//页面首先初始化数据
var initList = function(){
	$('#table_cart').DataTable( {
		"bDestroy": true,
        "ajax": {
        	url:"admin/cart/addrs/list",	
        	type: "POST"
        },
		"columns": [
            { "data": null },
            { "data": "city" },
            { "data": "county" },
            { "data": "store" },
            { "data": "addrDetail" },
            { "data": "linkTel" },
            { "data": "openTime" },
            { "data": null }
        ],
        "columnDefs": [
			{
				"targets": 0,
				render: function (a, b, c, d) {
	                return d.settings._iDisplayStart+d.row+1;
				}
			},
			{
 	            "targets": 7,
 	            render: function (a, b, c, d) {
 	            	var context =
 	                {
 	                    func: [
 	                        {"name": "编辑", "fn": "modAddrs(\'" + c.id + "\')", "type": "purple", "icon":"edit"},
 	                        {"name": "删除", "fn": "delAddrs(\'" + c.id + "\')", "type": "danger", "icon":"trash"}
 	                    ]
 	                };
 	                var html = template(context);
 	            	return html;
           		}
  	        }
   		]
    });
};

var modAddrs = function(id){
	$("#modalForm")[0].reset();
	$("#myModal").find("#modalTitle").text("编辑"+getStrByType($("#carType").val())+"地点");
	$.post("admin/cart/addrs/detail",{"id":id},function(req){
		if("success" == req.status){
			$("#myModal").find("#allCity").empty();
			$("#myModal").find("#allCity").attr({"disabled":"disabled"});
			$("#myModal").find("#allCity").append("<option value=>"+(req.detail.city==null?"":req.detail.city)+"</option>");
			$("#myModal").find("#allCounty").empty();
			$("#myModal").find("#allCounty").attr({"disabled":"disabled"});
			$("#myModal").find("#allCounty").append("<option value=>"+(req.detail.county==null?"":req.detail.county)+"</option>");
			
			$("#addrId").val(id);
			$("#myModal").find("#store").val(req.detail.store);
			$("#myModal").find("#addrDetail").val(req.detail.addrDetail);
			$("#myModal").find("#openStart").val(req.detail.openStart);
			$("#myModal").find("#openEnd").val(req.detail.openEnd);
			$("#myModal").find("#linkTel").val(req.detail.linkTel);
			$("#addrType").val($("#carType").val());
			
			
			var addrType = req.detail.addrType;
				
			if("carpool" == $("#carType").val()){
				$("#coolTr #addrTypes").val(addrType);
				$("#coolTr").show();
				$("#coolTr").removeAttr("disabled");
			}else{
				$("#coolTr").attr("disabled","disabled");
				$("#coolTr").hide();
			}
			$("#myModal").modal("show");
		}else{
			bootbox.alert("数据加载失败.");
		}	
	},"JSON");
};


var delAddrs = function(id){
	bootbox.confirm("你确定要删除这条地点信息么，删除后不能恢复。",function(b){
		if(b){
			//bootbox.alert("删除失败，其他地方正在使用此条路线.");
			$.post("admin/cart/carpool/deleteAddrPrice",{"id":id},function(req){
				if('success' == req.status){
					bootbox.alert("删除成功.");
					doSearch();
				}else if('used' == req.status){
					bootbox.alert("删除失败，其他地方正在使用此条路线.");
				}else{
					bootbox.alert("删除失败，请稍后重试.");
				}
			},"JSON");
		}
	});
};
var addAddrs = function(){
	initAllCity();
	var carType = $("#carType").val();
	$("#myModal").find("#allCity").removeAttr("disabled");
	$("#myModal").find("#allCounty").removeAttr("disabled");
	
	$("#myModal").find("#modalTitle").text("新增"+getStrByType(carType)+"地点");
	if("carpool" == carType){
		$("#coolTr").show();
		$("#coolTr").removeAttr("disabled");
	}else{
		$("#coolTr").attr("disabled","disabled");
		$("#coolTr").hide();
	}
	$("#modalForm")[0].reset();
	
	$("#addrType").val($("#carType").val());
	$("#myModal").modal("show");
};

var save =function(){
	
	var id = $("#addrId").val();
	var store = $("#myModal").find("#store").val();
	var addrDetail = $("#myModal").find("#addrDetail").val();
	var openStart = $("#myModal").find("#openStart").val();
	var openEnd = $("#myModal").find("#openEnd").val();
	var linkTel = $("#myModal").find("#linkTel").val();
	if(!checkField("id")){
		var cityId = $("#allCity").val();
		var countyId = $("#allCounty").val();
		if(!checkField(cityId)){
			valTips($("#allCity"), "请选择城市。");
			return;
		}
		if(!checkField(countyId)){
			valTips($("#allCounty"), "请选择地区。");
			return;
		}	
	}
	
	if(!checkField(store)){
		valTips($("#myModal").find("#store"), "地点输入错误！");
		return;
	}
	
	if(!checkField(openStart) || !checkField(openEnd)){
		valTips($("#myModal").find("#openEnd"), "请输入正确营业时间");
		return;
	}
	
	if(!checkField(linkTel)){
		valTips($("#myModal").find("#linkTel"), "请输入正确联系电话");
		return;
	}
	
	if(checkField(openStart) || checkField(openEnd)){
		if(!checkField(openStart,new RegExp('^((0?[1-9])|[0-1]\\d|2[0-3])\:((0?[1-9])|[0-5]\\d)$'))){
			valTips($("#myModal").find("#openStart"), "请输入正确营业开始时间！格式：08:00");
			return;
		}
		if(!checkField(openEnd,new RegExp('^((0?[1-9])|[0-1]\\d|2[0-3])\:((0?[1-9])|[0-5]\\d)$'))){
			valTips($("#myModal").find("#openEnd"), "请输入正确营业结束时间！格式：18:30");
			return;
		}
	}
	$.post("admin/cart/addrs/save",$("#modalForm").serialize(),function(req){
		if(req.status =='success'){
			$("#myModal").modal("hide");
			bootbox.alert("保存成功。");
			doSearch();
		}else{
			bootbox.alert("保存失败，请检查数据后重试。");
		}
	},"JSON");
};

var getStrByType = function(type){
	if("rent"==type){
		return "租车";
	}else if("wrap"==type){
		return "包车";
	}else if("bus" == type){
		return "班车";
	}else if("carpool" == type){
		return "拼车";
	}
	return "错误";
};

</script>
</html>
