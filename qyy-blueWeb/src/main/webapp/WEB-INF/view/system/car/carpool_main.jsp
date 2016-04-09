<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="${system.basePath }">
<%@ include file="/static/inc.jsp"%>
<style type="text/css">
.oper_btn{
	margin: 8px 9px;
}

td select{
	width: 120px;
}

.btn_div{
	margin-bottom: 5px;
}
.btnmenu{
	padding: 0px;
	margin: 0px;
}
.btnmenu tr td{
	padding:  10px;
}
</style>
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
			<li class="active">车辆管理</li>
		</ul>
		<!--.breadcrumb-->
	</div>
	<!--#breadcrumbs-->

	<div class="row-fluid">
		<div class="table-header">车辆及路线</div>
		<ul class="nav nav-tabs" id="otherInfoTab">
			<li><a href="admin/cart/rent/listPage">租车车辆信息</a></li>
			<li><a href="admin/cart/wrap/main">包车车辆信息</a></li>
			<li><a href="admin/cart/bus/main">班车车辆信息及路线</a></li>
			<li class="active"><a href="admin/cart/carpool/main">拼车路线</a></li>
		</ul>
		<ul class="nav nav-tabs" id="priceOrLine">
			<li><a href="#tab_1">拼车路线</a></li>
			<li><a href="#tab_2">拼车价格</a></li>
		</ul>
		<div class="tab-content">
			<!-- 拼车路线列表-->
		    <div class="tab-pane active" id="tab_1">
		    	<div style="height: 50px;">
					<table class="btnmenu" id="btnmenu">
						<tbody>
							<tr>
								<td width="60px">
									出发地：
								</td>
								<td width="390px">
									<select id="fromCity" name="fromCityId">
										<option value="">请选择城市</option>
										<c:forEach items="${cityList }" var="city">
											<option value="${city.id }">${city.name }</option>
										</c:forEach>
									</select>
									<select id="fromCounty" name="fromCountyId">
										<option value="">请选择地区</option>
									</select>
									<select id="fromStore" name="fromAddrId">
										<option value="">请选择地点</option>
									</select>
								</td>
							
								<td width="60px">
									目的地：
								</td>
								<td width="390px">
									<select id="toCity" name="toCityId">
										<option value="">请选择城市</option>
										<c:forEach items="${cityList }" var="city">
										<option value="${city.id }">${city.name }</option>
										</c:forEach>
									</select>
									<select id="toCounty" id="toCounty" name="toCountyId">
										<option value="">请选择地区</option>
									</select>
									<select id="toStore" name="toAddrId">
										<option value="">请选择地点</option>
									</select>
								</td>
								<td width="60px">
									公里数：
								</td>
								<td width="60px">
									<input type="text" id="mileage" name="mileage" class="form-control"  style="width: 55px;" placeholder="公里数">
								</td>
							</tr>
						</tbody>
					</table>
				</div>
		    	
		    	<div class="oper_btn">
					<a title="新增" onclick="addAddrLine();" href="javascript:;" target="mainFrame" class="btn btn-mini btn-info"><i class="icon-plus"></i> 新增</a>
					<!--<a title="上架" onclick="onOffLine(0)" href="javascript:;" class="btn btn-mini btn-info"><i class="icon-check"></i> 上架</a>
					<a title="下架" onclick="onOffLine(1)" href="javascript:;" class="btn btn-mini btn-info"><i class="icon-check-empty"></i>下架</a> 
					<a title="删除" onclick="doDeletes()" href="javascript:;" class="btn btn-mini btn-info"><i class="icon-trash"></i> 删除</a> -->
					<a title="查询" onclick="" class="btn btn-mini btn-success" id="searchBtn"><i class="icon-search"></i>查询</a>
				</div>
				<table id="line_table" class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>
								序号
							</th>
							<th>出发城市</th>
							<th>出发地区</th>
							<th>出发地点</th>
							<th>到达城市</th>
							<th>到达地区</th>
							<th>到达地点</th>
							<th>公里数</th>
							<th style="width: 56px">上架状态</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
		    </div>
			<!-- 拼车价格列表-->
		    <div class="tab-pane active" id="tab_2">
		    	<div style="height: 50px;">
					<table class="btnmenu" id="btnmenu_price">
						<tbody>
							<tr>
								<td>
									品牌：
								</td>
								<td>
									<select id="brand" name="brandId">
										<option value="">请选择品牌</option>
										<c:forEach items="${brandList }" var="brand">
											<option value="${brand.id }">${brand.brand }</option>
										</c:forEach>
									</select>
								</td>
							
								<td>
									车系：
								</td>
								<td>
									<select id="carSys" name="carSysId">
										<option value="">请选择车系</option>
									</select>
								</td>
								
								<td>
									座位区间：
								</td>
								<td>
									<input type="text" id="seatSt" name="seatSt" class="form-control"  style="width: 55px;" >
									~
									<input type="text" id="seatEd" name="seatEd" class="form-control"  style="width: 55px;" >
								</td>
								
								<td>
									单价：
								</td>
								<td>
									<input type="text" id="price" name="price" class="form-control"  style="width: 55px;" >
								</td>
							</tr>
						</tbody>
					</table>
				</div>
		    	
		    	<div class="oper_btn">
					<a title="新增" onclick="addAddrPrice();" href="javascript:;" target="mainFrame" class="btn btn-mini btn-info"><i class="icon-plus"></i> 新增</a>
					<a title="查询" onclick="" class="btn btn-mini btn-success" id="searchPriceBtn"><i class="icon-search"></i>查询</a>
				</div>
				<table id="price_table" class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>
								序号
							</th>
							<th>品牌</th>
							<th>车系</th>
							<th>座位数</th>
							<th>单价(元/公里)</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
		    </div>
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
			    <li class="active"><a href="javascript:;" id="modalTitle">添加拼车路线</a></li>
			</ul>
			<div class="tab-content">
				<form id="modalForm">
			    	<div class="modal-body">
	                	<table class="mytable-detail">
	                		<tr> 
	                			<th width="70">
	                				出发地：
	                			</th>
	                			<td>
	                				<input id="addrType" name="addrType" type="hidden" value="rent">
	                				<input id="addrId" name="id" type="hidden" value="">
	                			 	<select id="efromCity" name="efromCityId">
	                			 		<option value="">请选择城市</option>
										<c:forEach items="${cityList }" var="city">
											<option value="${city.id }">${city.name }</option>
										</c:forEach>
	                			 	</select>
	                			 	<select id="efromCounty" name="efromCountyId" >
	                			 		<option>请选择地区</option>
	                			 	</select>
	                			 	<select id="efromAddr" name="efromAddrId" >
	                			 		<option>请选择地点</option>
	                			 	</select>
	                			</td>
	                		</tr>
	                		<tr>
	                			<th>
	                				目的地：
	                			</th>
	                			<td>
	                			 	<select id="etoCity" name="etoCityId">
	                			 		<option value="">请选择城市</option>
										<c:forEach items="${cityList }" var="city">
											<option value="${city.id }">${city.name }</option>
										</c:forEach>
	                			 	</select>
	                			 	<select id="etoCounty" name="etoCountyId" >
	                			 		<option>请选择地区</option>
	                			 	</select>
	                			 	<select id="etoAddr" name="etoAddrId" >
	                			 		<option>请选择地点</option>
	                			 	</select>
	                			</td>
	                		</tr>
	                		<tr>
	                			<th>
	                				公里数：
	                			</th>
	                			<td>
	                			 	<input type="text" class="form-control span3" id="emileage" name = "emileage" placeholder="请输入公里数">
	                			</td>
	                		</tr>
	                		<tr>
	                			<th>
	                				是否上架：
	                			</th>
	                			<td>
	                			 	<div class="span3">
	                			 			<input type="hidden" id="eisShelves" name="eisShelves" value="0" />
										<label><input id="isShelvesCheck" class="ace-switch ace-switch-6" type="checkbox"><span class="lbl"></span></label>
									</div>
	                			</td>
	                		</tr>
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



<div class="modal fade" id="priceModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
            </div>
        	<ul class="nav nav-tabs" id="otherInfoTab">
			    <li class="active"><a href="javascript:;" id="modalTitle">添加拼车价格</a></li>
			</ul>
			<div class="tab-content">
				<form id="modalForm_price">
			    	<div class="modal-body">
	                	<table class="mytable-detail">
	                		<tr> 
	                			<th width="70">
	                				车辆品牌：
	                			</th>
	                			<td>
	                				<input id="priceId" name="eid" type="hidden" value="">
	                			 	<select id="ebrand" name="ebrandId">
	                			 		<option value="">请选择品牌</option>
										<c:forEach items="${brandList }" var="brand">
											<option value="${brand.id }">${brand.brand }</option>
										</c:forEach>
	                			 	</select>
	                			</td>
	                		</tr>
	                		<tr>
	                			<th>
	                				车系：
	                			</th>
	                			<td>
	                			 	<select id="ecarSys" name="ecarSysId" >
	                			 		<option>请选择车系</option>
	                			 	</select>
	                			</td>
	                		</tr>
	                		<tr>
	                			<th>
	                				座位区间：
	                			</th>
	                			<td>
	                			 	<input type="text" class="form-control span2" id="eseatSt" name = "eseatSt">
	                			 	~
	                			 	<input type="text" class="form-control span2" id="eseatEd" name = "eseatEd">
	                			</td>
	                		</tr>
	                		<tr>
	                			<th>
	                				单价：
	                			</th>
	                			<td>
               			 			<input type="text" class="form-control span2" id="eprice" name = "eprice">&nbsp;元/公里
	                			</td>
	                		</tr>
	                	</table>
		            </div>
	            </form>
			</div>
			<div style = "padding:10px 350px;">
				<button type="button" class="btn btn-primary" id="save-btn" onclick="savePrice();" >保存</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			</div>
        </div>
    </div>
</div>

<!-- #main-content -->
<%@ include file="/static/foot.jsp"%>
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
$(document).ready(function() {
	$('#priceOrLine a:eq(0)').tab('show');//初始化显示哪个tab
	$('#priceOrLine a').click(function(e) {
		e.preventDefault();//阻止a链接的跳转行为
		$(this).tab('show');//显示当前选中的链接及关联的content
	})
	//查询
	$("#searchBtn").click(function() {
		doSearch();
	});
	
	$("#isShelvesCheck").click(function(){
		if(this.checked){
			$("#eisShelves").val(1);
		}else{
			$("#eisShelves").val(0);
		}
		console.info($("#eisShelves").val());
	});
	
	/*根据城市的改变来获取区域*/
	$("#fromCity").change(function(){
		var fromCounty = $("#fromCounty");
		fromCounty.empty();
		fromCounty.append("<option value>请选择地区</option>");
		$.post("allowAccess/countyList1",{'cityId':this.value},function(req){
			var itemP = "";
			var list = req.countyList;
			for(var i in list){
				var item = list[i];
				itemP = "<option value="+item.id+">"+item.name+"</option>";
				fromCounty.append(itemP);
			}
		},"JSON");
	});
	
	$("#fromCounty").change(function(){
		var fromStore = $("#fromStore");
		fromStore.empty();
		fromStore.append("<option value>请选择地点</option>");
		$.post('admin/cart/carpool/findAddrList',{"countyId":this.value,"type":"carpool_start"},function(req){
			var itemP = "";
			var list = req.addrList;
			for(var i in list){
				var item = list[i];
				itemP = "<option value="+item.id+">"+item.store+"</option>";
				fromStore.append(itemP);
			}
		},"JSON");
	});
	
	$("#toCity").change(function(){
		var toCounty = $("#toCounty");
		toCounty.empty();
		toCounty.append("<option value>请选择地区</option>");
		$.post("allowAccess/countyList1",{'cityId':this.value},function(req){
			var itemP = "";
			var list = req.countyList;
			for(var i in list){
				var item = list[i];
				itemP = "<option value="+item.id+">"+item.name+"</option>";
				toCounty.append(itemP);
			}
		},"JSON");
	});
	
	$("#toCounty").change(function(){
		var toStore = $("#toStore");
		toStore.empty();
		toStore.append("<option value>请选择地点</option>");
		$.post('admin/cart/carpool/findAddrList',{"countyId":this.value,"type":"carpool_end"},function(req){
			var itemP = "";
			var list = req.addrList;
			for(var i in list){
				var item = list[i];
				itemP = "<option value="+item.id+">"+item.store+"</option>";
				toStore.append(itemP);
			}
		},"JSON");
	});
	
	initList();
	priceInitList();
	/*根据城市的改变来获取区域*/
	$("#efromCity").change(function(){
		var fromCounty = $("#efromCounty");
		fromCounty.empty();
		fromCounty.append("<option value>请选择地区</option>");
		$.post("allowAccess/countyList1",{'cityId':this.value},function(req){
			var itemP = "";
			var list = req.countyList;
			for(var i in list){
				var item = list[i];
				itemP = "<option value="+item.id+">"+item.name+"</option>";
				fromCounty.append(itemP);
			}
		},"JSON");
	});
	
	$("#efromCounty").change(function(){
		var fromStore = $("#efromAddr");
		fromStore.empty();
		fromStore.append("<option value>请选择地点</option>");
		$.post('admin/cart/carpool/findAddrList',{"countyId":this.value,"type":"carpool_start"},function(req){
			var itemP = "";
			var list = req.addrList;
			for(var i in list){
				var item = list[i];
				itemP = "<option value="+item.id+">"+item.store+"</option>";
				fromStore.append(itemP);
			}
		},"JSON");
	});
	
	$("#etoCity").change(function(){
		var toCounty = $("#etoCounty");
		toCounty.empty();
		toCounty.append("<option value>请选择地区</option>");
		$.post("allowAccess/countyList1",{'cityId':this.value},function(req){
			var itemP = "";
			var list = req.countyList;
			for(var i in list){
				var item = list[i];
				itemP = "<option value="+item.id+">"+item.name+"</option>";
				toCounty.append(itemP);
			}
		},"JSON");
	});
	
	$("#etoCounty").change(function(){
		var toStore = $("#etoAddr");
		toStore.empty();
		toStore.append("<option value>请选择地点</option>");
		$.post('admin/cart/carpool/findAddrList',{"countyId":this.value,"type":"carpool_end"},function(req){
			var itemP = "";
			var list = req.addrList;
			for(var i in list){
				var item = list[i];
				itemP = "<option value="+item.id+">"+item.store+"</option>";
				toStore.append(itemP);
			}
		},"JSON");
	});
	
	
});

var doSearch =function(){
	var table = $("#line_table").DataTable();
	var json = '{';
	$("#btnmenu select,input").each(function() {
		json += '"' + this.name + '":"' + $(this).val() + '",';
	});
	json = json.substr(0, json.length - 1);
	json += '}';
	console.info(json);
	table.search(json).draw();
};


//页面首先初始化数据
var initList = function(){
	$('#line_table').DataTable( {
		"bDestroy": true,
        "ajax": {
        	url:"admin/cart/carpool/list",	
        	type: "POST"
        },
		"columns": [
            { "data": null },
            { "data": "fromCity" },
            { "data": "fromCounty" },
            { "data": "fromStore" },
            { "data": "toCity" },
            { "data": "toCounty" },
            { "data": "toStore" },
            { "data": "mileage" },
            { "data": null },
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
 	            "targets": 8,
 	            render: function (a, b, c, d) {
 	            	if(c.isShelves == 1)
 	            		return "是";
 	            	return '否';
           		}
  	        },
			{
 	            "targets": 9,
 	            render: function (a, b, c, d) {
 	            	var context;
 	            	if(c.isShelves == 1){
 	            		context =
	 	 	                {
	 	 	                    func: [
	 	 	                        {"name": "编辑", "fn": "modAddrLine(\'" + c.id + "\')", "type": "purple", "icon":"edit"},
	 	 	                       	{"name": "下架", "fn": "ofsAddrLine(\'" + c.id + "\')", "type": "info", "icon":"check-empty"},
	 	 	                        {"name": "删除", "fn": "delAddrLine(\'" + c.id + "\')", "type": "danger", "icon":"trash"}
	 	 	                    ]
	 	 	                };
 	            	}else{
 	            		context =
	 	 	                {
	 	 	                    func: [
	 	 	                        {"name": "编辑", "fn": "modAddrLine(\'" + c.id + "\')", "type": "purple", "icon":"edit"},
	 	 	                       	{"name": "上架", "fn": "ofsAddrLine(\'" + c.id + "\')", "type": "info", "icon":"check"},
	 	 	                        {"name": "删除", "fn": "delAddrLine(\'" + c.id + "\')", "type": "danger", "icon":"trash"}
	 	 	                    ]
	 	 	                };
 	            	}
 	            	return template(context);
           		}
  	        }
   		]
    });
};

var addAddrLine = function(){
	$("#modalForm")[0].reset();
	$("#efromCounty").empty().append("<option value>请选择地区</option>");
	$("#efromAddr").empty().append("<option value>请选择地点</option>");
	$("#etoCounty").empty().append("<option value>请选择地区</option>");
	$("#etoAddr").empty().append("<option value>请选择地点</option>");
	$("#isShelvesCheck").attr("checked",false);
	$("#eisShelves").val(0);
	$("#myModal").modal("show");
};


var modEFromCity = function(fromCityId,countyId){
	var fromCounty = $("#efromCounty");
	fromCounty.empty();
	fromCounty.append("<option value>请选择地区</option>");
	$.post("allowAccess/countyList1",{'cityId':fromCityId},function(req){
		var itemP = "";
		var list = req.countyList;
		for(var i in list){
			var item = list[i];
			if(countyId == item.id){
				itemP = "<option value="+item.id+" selected=selected>"+item.name+"</option>";
			}else{
				itemP = "<option value="+item.id+">"+item.name+"</option>";
			}
			fromCounty.append(itemP);
		}
	},"JSON");
};

var modEFromCounty = function(countyId,storeId){
	var fromStore = $("#efromAddr");
	fromStore.empty();
	fromStore.append("<option value>请选择地点</option>");
	$.post('admin/cart/carpool/findAddrList',{"countyId":countyId,"type":"carpool_start"},function(req){
		var itemP = "";
		var list = req.addrList;
		debugger
		for(var i in list){
			var item = list[i];
			if(storeId == item.id){
				itemP = "<option value="+item.id+" selected=selected>"+item.store+"</option>";
			}else{
				itemP = "<option value="+item.id+">"+item.store+"</option>";
			}
			fromStore.append(itemP);
		}
	},"JSON");
};

var modEToCity = function(fromCityId,countyId){
	var fromCounty = $("#etoCounty");
	fromCounty.empty();
	fromCounty.append("<option value>请选择地区</option>");
	$.post("allowAccess/countyList1",{'cityId':fromCityId},function(req){
		var itemP = "";
		var list = req.countyList;
		for(var i in list){
			var item = list[i];
			if(countyId == item.id){
				itemP = "<option value="+item.id+" selected=selected>"+item.name+"</option>";
			}else{
				itemP = "<option value="+item.id+">"+item.name+"</option>";
			}
			fromCounty.append(itemP);
		}
	},"JSON");
};

var modEToCounty = function(countyId,storeId){
	var fromStore = $("#etoAddr");
	fromStore.empty();
	fromStore.append("<option value>请选择地点</option>");
	$.post('admin/cart/carpool/findAddrList',{"countyId":countyId,"type":"carpool_end"},function(req){
		var itemP = "";
		var list = req.addrList;
		debugger
		for(var i in list){
			var item = list[i];
			if(storeId == item.id){
				itemP = "<option value="+item.id+" selected=selected>"+item.store+"</option>";
			}else{
				itemP = "<option value="+item.id+">"+item.store+"</option>";
			}
			fromStore.append(itemP);
		}
	},"JSON");
};


var modAddrLine = function(id){
	$("#modalForm")[0].reset();
	$("#addrId").val(id);
	$.post("admin/cart/carpool/findAllIds",{"id":id},function(req){
		var ids = req.ids;
		$("#efromCity").val(ids.fromCityId);
		modEFromCity(ids.fromCityId,ids.fromCountyId);
		modEFromCounty(ids.fromCountyId,ids.fromStoreId);
		$("#etoCity").val(ids.toCityId);
		modEToCity(ids.toCityId,ids.toCountyId);
		modEToCounty(ids.toCountyId,ids.toStoreId);
		$("#emileage").val(ids.mileage);
		$("#eisShelves").val(ids.isShelves);
		if(ids.isShelves == 1)
			$("#isShelvesCheck").attr("checked",true);
		else
			$("#isShelvesCheck").attr("checked",false);
		
		$("#myModal").modal("show");
		
	},"JSON");
	
};

var ofsAddrLine = function(id){
	$.post("admin/cart/carpool/udLine",{"id":id},function(req){
		if('success' == req.status){
			if('up' == req.msg){
				bootbox.alert("上架成功.");
			}else{
				bootbox.alert("下架成功.");
			}
			doSearch();
		}else{
			bootbox.alert("操作失败，请稍后重试.");
		}
	},"JSON");
};

var delAddrLine = function(id){
	bootbox.confirm("你确定要删除这条路线么，删除后不能恢复。",function(b){
		if(b){
			$.post("admin/cart/carpool/delete",{"id":id},function(req){
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

/*保存数据到后台*/
var save = function(){
	var fromAddrId = $("#efromAddr").val();
	if(!checkField(fromAddrId)){
		valTips("efromAddr", "请选择到达地点");
		return;
	}
	var toAddrId = $("#etoAddr").val();
	if(!checkField(toAddrId)){
		valTips("etoAddr", "请选择到达地点");
		return;
	}
	var mileage = $("#emileage").val();
	if(!checkField(mileage, new RegExp('^[1-9][0-9]*$') )){
		valTips("emileage", "请选择到达地点");
		return;
	}
	
	$.post("admin/cart/carpool/save",$("#modalForm").serialize(),function(req){
		if('success' == req.status){
			$("#myModal").modal("hide");
			bootbox.alert("保存成功。");
		}else if('exists'==req.status){
			valTips("efromAddr", "请修改出发地");
			valTips("etoAddr", "请修改目的地");
			bootbox.alert("保存失败，数据库中已经存在相同起始地点的数据，不能重复添加。");
		}else{
			bootbox.alert("保存失败，数据库中已经存在相同起始地点的数据，不能重复添加。");
		}
		doSearch();
	},"json");
};
/************************************************************************************************************************/

//查询
$("#searchPriceBtn").click(function() {
	priceSearch();
});

var priceSearch = function(){
	var table = $("#price_table").DataTable();
	var json = '{';
	$("#btnmenu_price select,input").each(function() {
		json += '"' + this.name + '":"' + $(this).val() + '",';
	});
	json = json.substr(0, json.length - 1);
	json += '}';
	console.info(json);
	table.search(json).draw();
};

 
var priceInitList = function(){
	$('#price_table').DataTable( {
		"bDestroy": true,
        "ajax": {
        	url:"admin/cart/carpool/priceList",	
        	type: "POST"
        },
		"columns": [
            { "data": null },
            { "data": "brand" },
            { "data": "sys" },
            { "data": null },
            { "data": "price" },
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
 	            "targets": 3,
 	            render: function (a, b, c, d) {
 	            	return c.seatSt +" - "+c.seatEd;
           		}
  	        },
			{
 	            "targets": 5,
 	            render: function (a, b, c, d) {
 	            	var context;
            		context =
	 	                {
	 	                    func: [
	 	                        {"name": "编辑", "fn": "modAddrPrice(\'" + c.id + "\')", "type": "purple", "icon":"edit"},
	 	                        {"name": "删除", "fn": "delAddrPrice(\'" + c.id + "\')", "type": "danger", "icon":"trash"}
	 	                    ]
	 	                };
 	            	return template(context);
           		}
  	        }
   		]
    });
};

var addAddrPrice = function(){
	$("#modalForm_price")[0].reset();
	$("#priceModal").modal("show");
	$("#ecarSys").empty().append('<option value=>请选择车系</option>');
	
};

var modAddrPriceSys = function(brandId,carSysId){
	var ecarSys = $("#ecarSys");
	ecarSys.empty().append('<option value=>请选择车系</option>');
	$.post("admin/cart/carpool/carsysList",{"brandId":brandId},function(req){
		var list = req.sysList;
		for(var i in list){
			var item = list[i];
			var itemP = "";
			if(carSysId == item.id){
				itemP = '<option value="'+item.id+'" selected=selected>'+item.sys+'</option>';
			}else{
				itemP = '<option value="'+item.id+'">'+item.sys+'</option>';
			}
			ecarSys.append(itemP);		
		}
	},"JSON");
};

var modAddrPrice = function(id){
	$("#modalForm_price")[0].reset();
	$.post("admin/cart/carpool/addrPriceDetail",{"id":id},function(res){
		var detail = res.detail;
		
		$("#priceId").val(id);
		$("#ebrand").val(detail.brandId);
		modAddrPriceSys(detail.brandId,detail.carSysId);
		//$("#ecarSys").val(detail.carSysId);
		$("#eseatSt").val(detail.seatSt);
		$("#eseatEd").val(detail.seatEd);
		$("#eprice").val(detail.price);
		$("#priceModal").modal("show");
	},"JSON");
};

$("#ebrand").change(function(){
	var ecarSys = $("#ecarSys");
	ecarSys.empty().append('<option value=>请选择车系</option>');
	$.post("admin/cart/carpool/carsysList",{"brandId":this.value},function(req){
		var list = req.sysList;
		for(var i in list){
			var item = list[i];
			var itemP = "";
			itemP = '<option value="'+item.id+'">'+item.sys+'</option>';
			ecarSys.append(itemP);		
		}
	},"JSON");
});

$("#brand").change(function(){
	var ecarSys = $("#carSys");
	ecarSys.empty().append('<option value=>请选择车系</option>');
	$.post("admin/cart/carpool/carsysList",{"brandId":this.value},function(req){
		var list = req.sysList;
		for(var i in list){
			var item = list[i];
			var itemP = "";
			itemP = '<option value="'+item.id+'">'+item.sys+'</option>';
			ecarSys.append(itemP);		
		}
	},"JSON");
});

var savePrice = function(){
	var sysId =  $("#ecarSys").val();
	if(!checkField(sysId )){
		valTips("ecarSys", "请选择车辆品牌和车系");
		return ;
	}
	
	var st = $("#eseatSt").val();
	if(!checkField(st , new RegExp('^[1-9][0-9]*$'))){
		valTips("eseatSt", "请输入正确的座位区间数");
		return ;
	}
	
	var eseatEd = $("#eseatEd").val();
	if(!checkField(eseatEd , new RegExp('^[1-9][0-9]*$'))){
		valTips("eseatEd", "请输入正确的座位区间数");
		return ;
	}
	
	var price = $("#eprice").val();
	if(!checkField(price, new RegExp('^[1-9][0-9]*$'))){
		valTips("eprice", "请输入正确的单价");
		return ;
	}
	
	$.post("admin/cart/carpool/saveAddrPrice",$("#modalForm_price").serialize(),function(res){
		if(res.status == "success"){
			bootbox.alert("保存成功。");
			$("#priceModal").modal("hide");
		}else if(res.status == "exists"){
			bootbox.alert("保存失败,数据库中已经存在此车系的价格信息。");
		}else{
			bootbox.alert("保存失败,请检查数据后重试。");
		}
		priceSearch();
	},"JSON");
	
};
var delAddrPrice = function(id){
	bootbox.confirm("你确定要删除这条价格信息么，删除后不能恢复。",function(b){
		if(b){
			$.post("admin/cart/carpool/deleteAddrPrice",{"id":id},function(req){
				if('success' == req.status){
					bootbox.alert("删除成功.");
					priceSearch();
				}else if('used' == req.status){
					bootbox.alert("删除失败，其他地方正在使用此条路线.");
				}else{
					bootbox.alert("删除失败，请稍后重试.");
				}
			},"JSON");
		}
	});
};


</script>
</html>
