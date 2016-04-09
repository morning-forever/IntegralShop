<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="${system.basePath }">
<%@ include file="/static/inc.jsp"%>

</head>
<style type="text/css">
.oper_btn{
	margin: 8px 9px;
}

td select{
	width: 120px;
}
.modal-body{
	max-height: 300px;
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
.table-bordered tbody tr td {
    text-align: center;
}
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
			<li class="active"><a href="admin/cart/bus/main">班车车辆信息及路线</a></li>
			<li><a href="admin/cart/carpool/main">拼车路线</a></li>
		</ul>
		<ul class="nav nav-tabs" id="priceOrLine">
			<li><a href="#tab_1">班车路线</a></li>
			<li><a href="#tab_2">车辆信息</a></li>
		</ul>
		<div class="tab-content">
			<!-- 班车路线列表-->
		    <div class="tab-pane active" id="tab_1">
		    	<div>
					<table class="btnmenu" id="btnmenu">
						<tbody>
							<tr>
								<td width="70px">
									车辆品牌：
								</td>
								<td>
									<select name="brandId">
										<option value="">请选择品牌</option>
										<c:forEach items="${brandList }" var="brand">
											<option value="${brand.id }">${brand.brand }</option>
										</c:forEach>
									</select>
								</td>
								<td width="60px">
									车牌号：
								</td>
								<td>
									<select name="carCard">
										<option value="">请选择车牌号</option>
										<c:forEach items="${cardList }" var="c">
											<option value="${c.car_card }">${c.car_card }</option>
										</c:forEach>
									</select>
								</td>
								<td width="60px">
									座位数：
								</td>
								<td>
									<select name="seating">
										<option value="">请选择座位数</option>
										<c:forEach items="${seatings }" var="c">
											<option value="${c.seating }">${c.seating }</option>
										</c:forEach>
									</select>
								</td>
								<td width="70px">
									单程价格：
								</td>
								<td>
									<input type="text" name="price" class="form-control"  style="width: 110px;" placeholder="请输入单程价格">
								</td>
							</tr>
							<tr>
								<td width="60px">
									出发地：
								</td>
								<td width="390px" colspan="3">
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
								<td width="390px" colspan="3">
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
							</tr>
							<tr>
								<td colspan="10">
									<a title="新增" onclick="addAddrLine();" href="javascript:;" target="mainFrame" class="btn btn-mini btn-info"><i class="icon-plus"></i> 新增</a>
									<a title="上架" onclick="onOffLine(0)" href="javascript:;" class="btn btn-mini btn-info"><i class="icon-check"></i> 上架</a>
									<a title="下架" onclick="onOffLine(1)" href="javascript:;" class="btn btn-mini btn-info"><i class="icon-check-empty"></i>下架</a>
									<a title="删除" onclick="deleteRoute()" href="javascript:;" class="btn btn-mini btn-danger"><i class="icon-trash"></i> 删除</a>
									<a title="查询" onclick="doSearch()" class="btn btn-mini btn-success" id="searchBtn"><i class="icon-search"></i>查询</a>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
		    	
				<table id="line_table" class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th class='center'>
								<label><input type='checkbox' name="tableCheckbox" /><span class="lbl"></span></label>
							</th>
							<th>序号</th>
							<th>图片</th>
							<th>品牌</th>
							<th>车牌号</th>
							<th>座位数</th>
							<th>出发城市</th>
							<th>出发区域</th>
							<th>出发站点</th>
							<th>到达城市</th>
							<th>到达区域</th>
							<th>到达地点</th>
							<th>价格</th>
							<th>出发时间</th>
							<th>预计到达时间</th>
							<th style="width: 56px">上架状态</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
		    </div>
			<!-- 车辆信息列表-->
		    <div class="tab-pane active" id="tab_2">
		    	<div>
					<table class="btnmenu" id="btnmenu_price">
						<tbody>
							<tr>
								<td width="70px">
									车辆品牌：
								</td>
								<td>
									<select id="brand" name="brandId">
										<option value="">请选择品牌</option>
										<c:forEach items="${brandList }" var="brand">
											<option value="${brand.id }">${brand.brand }</option>
										</c:forEach>
									</select>
								</td>
								<td width="70px">
									车系：
								</td>
								<td>
									<select id="sys" name="sysId">
										<option value="">请选择车系</option>
										<c:forEach items="${sysList }" var="c">
											<option value="${c.id }">${c.sys }</option>
										</c:forEach>
									</select>
								</td>
								<td width="60px">
									车牌号：
								</td>
								<td>
									<select name="carCard">
										<option value="">请选择车牌号</option>
										<c:forEach items="${cardList }" var="c">
											<option value="${c.car_card }">${c.car_card }</option>
										</c:forEach>
									</select>
								</td>
								<td width="60px">
									座位数：
								</td>
								<td>
									<select name="seating">
										<option value="">请选择座位数</option>
										<c:forEach items="${seatings }" var="c">
											<option value="${c.seating }">${c.seating }</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<td colspan="15">
									<a title="新增" onclick="addAddrPrice();" href="javascript:;" target="mainFrame" class="btn btn-mini btn-info"><i class="icon-plus"></i> 新增</a>
									<a title="删除" onclick="doDeletes();" class="btn btn-mini btn-danger"><i class="icon-trash"></i>删除</a>
									<a title="查询" onclick="priceSearch();" class="btn btn-mini btn-success"><i class="icon-search"></i>查询</a>
								<td>
							</tr>
						</tbody>
					</table>
				</div>

				<table id="price_table" class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th class='center'>
								<label><input type='checkbox' name="tableCheckbox" /><span class="lbl"></span></label>
							</th>
							<th>序号</th>
							<th>图片</th>
							<th>品牌</th>
							<th>车系</th>
							<th>年代</th>
							<th>座位数</th>
							<th>数量</th>
							<th>车牌号</th>
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
			    <li class="active"><a href="javascript:;" id="modalTitle">班车路线</a></li>
			</ul>
			<div class="tab-content">
				<form id="modalForm">
					<input id="routeId" name="routeId" type="hidden" value="">
			    	<div class="modal-body">
	                	<table class="mytable-detail">
	                		<tr>
	                			<th width="95">
									车牌号：
								</th>
								<td>
									<select id="ecarCard" name="busId">
										<option value="">请选择车牌号</option>
									</select>
								</td>
	                		</tr>
	                		<tr> 
	                			<th>
	                				出发地：
	                			</th>
	                			<td>
	                			 	<select id="efromCity" name="efromCityId">
	                			 		<option value="">请选择城市</option>
										<c:forEach items="${cityList }" var="city">
											<option value="${city.id }">${city.name }</option>
										</c:forEach>
	                			 	</select>
	                			 	<select id="efromCounty" name="efromCountyId" >
	                			 		<option>请选择地区</option>
	                			 	</select>
	                			 	<select id="efromAddr" name="fromAddrId" >
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
	                			 	<select id="etoAddr" name="toAddrId" >
	                			 		<option>请选择地点</option>
	                			 	</select>
	                			</td>
	                		</tr>
	                		<tr>
	                			<th>
	                				价格：
	                			</th>
	                			<td>
	                			 	<input type="text" class="form-control span3" id="eprice" name = "price" placeholder="请输入价格">元
	                			</td>
	                		</tr>
	                		<tr>
	                			<th>
	                				发车时间：
	                			</th>
	                			<td>
	                			 	<input type="text" class="form-control span3" id="efromTime" name = "fromTime" placeholder="请输入预计到达时间">
	                			</td>
	                		</tr>
	                		<tr>
	                			<th>
	                				预计到达时间：
	                			</th>
	                			<td>
	                			 	<input type="text" class="form-control span3" id="etoTime" name = "toTime" placeholder="请输入预计到达时间">
	                			</td>
	                		</tr>
	                		<tr>
	                			<th>
	                				是否上架：
	                			</th>
	                			<td>
	                			 	<div class="span3">
	                			 			<input type="hidden" id="eisShelves" name="isShelves" value="0" />
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
        	<ul class="nav nav-tabs" id="busInfoTab">
			    <li class="active"><a href="#tab2_1">车辆信息</a></li>
			    <li><a href="#tab2_2">上传图片</a></li>
			</ul>
			<div class="tab-content">
				<!-- 基础属性 -->
			    <div class="tab-pane active" id="tab2_1">
					<form id="modalForm_price">
				    	<div class="modal-body">
		                	<table class="mytable-detail">
		                		<input id="ecarId" name="carId" type="hidden" value="">
		                		<tr> 
		                			<th>
		                				车辆品牌：
		                			</th>
		                			<td>
		                			 	<select id="ebrand" name="brandId">
		                			 		<option value="">请选择品牌</option>
											<c:forEach items="${brandList }" var="c">
												<option value="${c.id }">${c.brand }</option>
											</c:forEach>
		                			 	</select>
		                			</td>
		                			<th>
		                				车系：
		                			</th>
		                			<td>
		                			 	<select id="esys" name="sysId">
		                			 		<option value="">请选择车系</option>
		                			 	</select>
		                			</td>
		                			<th>
		                				年代：
		                			</th>
		                			<td>
		                			 	<select id="ecarYear" name="carYear">
		                			 		<option value="">请选择年代</option>
		                			 		<c:forEach var="c" begin="2010" end="2030">
		                			 			<option value="${c }">${c }</option>
		                			 		</c:forEach>
		                			 	</select>
		                			</td>
		                		</tr>
		                		<tr> 
		                			<th>
		                				配置：
		                			</th>
		                			<td>
		                			 	<select id="ecarConfigure" name="carConfigure">
		                			 		<option value="">请选择配置</option>
		                			 		<option value="配置">配置</option>
		                			 	</select>
		                			</td>
		                			<th>
		                				数量：
		                			</th>
		                			<td>
		                			 	<input type="text" style="width: 110px;" class="form-control" id="ecounts" name = "counts" placeholder="请输入数量">
		                			</td>
		                			<th>
		                				座位数：
		                			</th>
		                			<td>
		                			 	<input type="text" style="width: 110px;" class="form-control" id="eseating" name = "seating" placeholder="请输入座位数">
		                			</td>
		                		</tr>
		                		<tr name="carCardBox">
		                			<th>
		                				车牌号：
		                			</th>
		                		</tr>
		                	</table>
			            </div>
		            </form>
		        </div>
		        <div class="tab-pane" id="tab2_2">
		        	<div><span style="color: red">第一张图片即为封面图</span></div>
		        	<!-- 图片1 -->
			    	<div style="float: left;">
				    	<form>
					    	<img id="img1" name="imgSrc" style="width:160px;height: 160px;z-index: 0;position: relative;" onclick="inputClick(this)" src="uploadFiles/uploadImgs/zanwutupian.jpg">
					    	<input type="file" name="img" id="input1" style="display: none;" onchange="ajaxFileUpload(this)">
					    	<input type="text" name="url" id="url1" style="display:none;">
					    	<img id="delete1" width="20" height="20" onclick="deleteUpload(this)" src="uploadFiles/uploadImgs/X.png" style="z-index: 10;position: relative;right: 15px;bottom: 75px">
				    	</form>
			    	</div>
			    	<!-- 图片2 -->
			    	<div  style="float: left;">
				    	<form>
					    	<img id="img2" name="imgSrc" style="width:160px;height: 160px;z-index: 0;position: relative;" onclick="inputClick(this)" src="uploadFiles/uploadImgs/zanwutupian.jpg">
					    	<input type="file" name="img" id="input2" style="display: none;" onchange="ajaxFileUpload(this)">
					    	<input type="text" name="url" id="url2" style="display:none;">
					    	<img id="delete2" width="20" height="20" onclick="deleteUpload(this)" src="uploadFiles/uploadImgs/X.png" style="z-index: 10;position: relative;right: 15px;bottom: 75px">
				    	</form>
			    	</div>
			    	<!-- 图片3 -->
			    	<div  style="float: left;">
				    	<form>
					    	<img id="img3" name="imgSrc" style="width:160px;height: 160px;z-index: 0;position: relative;" onclick="inputClick(this)" src="uploadFiles/uploadImgs/zanwutupian.jpg">
					    	<input type="file" name="img" id="input3" style="display: none;" onchange="ajaxFileUpload(this)">
					    	<input type="text" name="url" id="url3" style="display:none;">
					    	<img id="delete3" width="20" height="20" onclick="deleteUpload(this)" src="uploadFiles/uploadImgs/X.png" style="z-index: 10;position: relative;right: 15px;bottom: 75px">
				    	</form>
			    	</div>
			    	<!-- 图片4 -->
			    	<div  style="float: left;">
				    	<form>
					    	<img id="img4" name="imgSrc" style="width:160px;height: 160px;z-index: 0;position: relative;" onclick="inputClick(this)" src="uploadFiles/uploadImgs/zanwutupian.jpg">
					    	<input type="file" name="img" id="input4" style="display: none;" onchange="ajaxFileUpload(this)">
					    	<input type="text" name="url" id="url4" style="display:none;">
					    	<img id="delete4" width="20" height="20" onclick="deleteUpload(this)" src="uploadFiles/uploadImgs/X.png" style="z-index: 10;position: relative;right: 15px;bottom: 75px">
				    	</form>
			    	</div>
		        </div>
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
<script type="text/javascript" src="static/js/ajaxfileupload.js"></script>
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

var cardModal = '<td><input type="text" style="width: 110px;" class="form-control" name = "carCard" placeholder="请输入车牌号"></td>';

$(document).ready(function() {
	$('#priceOrLine a:eq(0)').tab('show');//初始化显示哪个tab
	$('#priceOrLine a').click(function(e) {
		e.preventDefault();//阻止a链接的跳转行为
		$(this).tab('show');//显示当前选中的链接及关联的content
	})
	
	/*tab页*/
	$('#busInfoTab a:eq(0)').tab('show');//初始化显示哪个tab

    $('#busInfoTab a').click(function(e) {
        e.preventDefault();//阻止a链接的跳转行为
        $(this).tab('show');//显示当前选中的链接及关联的content
    });
	
	$("input[name=tableCheckbox]").click(function(){
		var flag=this.checked;
		$(this).parent().parent().parent().parent().parent().find("input[flag=row]").each(function(){
			this.checked=flag;
		});
	});
	
	$("#isShelvesCheck").click(function(){
		if(this.checked){
			$("#eisShelves").val(0);
		}else{
			$("#eisShelves").val(1);
		}
		console.info($("#eisShelves").val());
	});
	
	/*根据城市的改变来获取区域*/
	$("#fromCity").change(function(){
		var fromCounty = $("#fromCounty");
		fromCounty.empty();
		fromCounty.append("<option value>请选择地区</option>");
		$.post("pc/cart/rent/getCounty",{'id':this.value,'type':'bus'},function(req){
			var itemP = "";
			var list = req.list;
			for(var i in list){
				var item = list[i];
				itemP = "<option value="+item.id+">"+item.name+"</option>";
				fromCounty.append(itemP);
			}
			$("#fromCounty").change();
		},"JSON");
	});
	
	$("#fromCounty").change(function(){
		var fromStore = $("#fromStore");
		fromStore.empty();
		fromStore.append("<option value>请选择地点</option>");
		$.post('pc/cart/rent/getStore',{"id":this.value,"type":"bus"},function(req){
			var itemP = "";
			var list = req.list;
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
		$.post("pc/cart/rent/getCounty",{'id':this.value,'type':'bus'},function(req){
			var itemP = "";
			var list = req.list;
			for(var i in list){
				var item = list[i];
				itemP = "<option value="+item.id+">"+item.name+"</option>";
				toCounty.append(itemP);
			}
			$("#toCounty").change();
		},"JSON");
	});
	
	$("#toCounty").change(function(){
		var toStore = $("#toStore");
		toStore.empty();
		toStore.append("<option value>请选择地点</option>");
		$.post('pc/cart/rent/getStore',{"id":this.value,"type":"bus"},function(req){
			var itemP = "";
			var list = req.list;
			for(var i in list){
				var item = list[i];
				itemP = "<option value="+item.id+">"+item.store+"</option>";
				toStore.append(itemP);
			}
		},"JSON");
	});
	
	initList();
	
	//设置table的宽度
	$("#line_table").on('draw.dt',function() {
    	$(".dataTables_wrapper").css("width","1700px");
    });
	
	priceInitList();
	/*根据城市的改变来获取区域*/
	$("#efromCity").change(function(){
		var fromCounty = $("#efromCounty");
		fromCounty.empty();
		fromCounty.append("<option value>请选择地区</option>");
		$.post("pc/cart/rent/getCounty",{'id':this.value,'type':'bus'},function(req){
			var itemP = "";
			var list = req.list;
			for(var i in list){
				var item = list[i];
				itemP = "<option value="+item.id+">"+item.name+"</option>";
				fromCounty.append(itemP);
			}
			$("#efromCounty").change();
		},"JSON");
	});
	
	$("#efromCounty").change(function(){
		var fromStore = $("#efromAddr");
		fromStore.empty();
		fromStore.append("<option value>请选择地点</option>");
		$.post('pc/cart/rent/getStore',{"id":this.value,"type":"bus"},function(req){
			var itemP = "";
			var list = req.list;
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
		$.post("pc/cart/rent/getCounty",{'id':this.value,'type':'bus'},function(req){
			var itemP = "";
			var list = req.list;
			for(var i in list){
				var item = list[i];
				itemP = "<option value="+item.id+">"+item.name+"</option>";
				toCounty.append(itemP);
			}
			$("#etoCounty").change();
		},"JSON");
	});
	
	$("#etoCounty").change(function(){
		var toStore = $("#etoAddr");
		toStore.empty();
		toStore.append("<option value>请选择地点</option>");
		$.post('pc/cart/rent/getStore',{"id":this.value,"type":"bus"},function(req){
			var itemP = "";
			var list = req.list;
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
	$("#btnmenu select,#btnmenu input").each(function() {
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
        	url:"admin/cart/bus/routelist",	
        	type: "POST"
        },
		"columns": [
            { "data": null },
            { "data": null },
            { "data": null },
            { "data": "brand" },
            { "data": "car_card" },
            { "data": "seating" },
            { "data": "from_addr" },
            { "data": "from_area" },
            { "data": "from_store" },
            { "data": "to_addr" },
            { "data": "to_area" },
            { "data": "to_store" },
            { "data": "price" },
            { "data": "from_time" },
            { "data": "to_time" },
            { "data": null },
            { "data": null }
        ],
        "columnDefs": [
			{
				"targets":0,
				render:function(data,type,row){
					var str="<label><input type='checkbox'  flag='row' value='"+row.id+"' /><span class='lbl'></span></label>";
					return str;
				}
			},
			{
				"targets": 1,
				render: function (a, b, c, d) {
	                return d.settings._iDisplayStart+d.row+1;
				}
			},
			{
				"targets": 2,
				render: function (a, b, c, d) {
	                var html = '<a href="'+c.pic_url+'" target="_blank"><img  width="50" height="50" src="'+c.pic_url+'" /></a>'
	                return html;
				}
			},
			{
 	            "targets": 15,
 	            render: function (a, b, c, d) {
 	            	if(c.is_shelves == 1)
 	            		return "否";
 	            	return '是';
           		}
  	        },
			{
 	            "targets": 16,
 	            render: function (a, b, c, d) {
 	            	var context;
	            		context =
 	 	                {
 	 	                    func: [
 	 	                        {"name": "编辑", "fn": "modAddrLine(\'" + c.id + "\')", "type": "purple", "icon":"edit"}
 	 	                    ]
 	 	                };
 	            	return template(context);
           		}
  	        }
   		]
    });
};

var zbusId="";
var zcarCard="";

var addAddrLine = function(){
	$("#modalForm")[0].reset();
	$("#efromCounty").empty().append("<option value>请选择地区</option>");
	$("#efromAddr").empty().append("<option value>请选择地点</option>");
	$("#etoCounty").empty().append("<option value>请选择地区</option>");
	$("#etoAddr").empty().append("<option value>请选择地点</option>");
	$("#isShelvesCheck").attr("checked",false);
	$("#eisShelves").val(0);
	zbusId="";
	zcarCard="";
	resetCards();
	$("#myModal").modal("show");
};

var resetCards = function(){
	$.post("admin/cart/bus/getFreeCard",{},function(req){
		var list = req.cardlist;
		$("#ecarCard").find("option").not(":first").remove();
		
		if(zbusId != "" && zbusId != null && zcarCard != "" && zcarCard != null){
			$("#ecarCard").append("<option value="+zbusId+" selected=selected>"+zcarCard+"</option>");
		}
		for(var i in list){
			var item = list[i];
			itemP = "<option value="+item.id+">"+item.car_card+"</option>";
			
			$("#ecarCard").append(itemP);
		}
	},"JSON");
}


var modEFromCity = function(fromCityId,countyId){
	var fromCounty = $("#efromCounty");
	fromCounty.empty();
	fromCounty.append("<option value>请选择地区</option>");
	$.post("pc/cart/rent/getCounty",{'id':fromCityId,'type':'bus'},function(req){
		var itemP = "";
		var list = req.list;
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
	$.post('pc/cart/rent/getStore',{"id":countyId,"type":"bus"},function(req){
		var itemP = "";
		var list = req.list;
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
	$.post("pc/cart/rent/getCounty",{'id':fromCityId,'type':'bus'},function(req){
		var itemP = "";
		var list = req.list;
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
	$.post('pc/cart/rent/getStore',{"id":countyId,"type":"bus"},function(req){
		var itemP = "";
		var list = req.list;
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
	$("#routeId").val(id);
	$.post("admin/cart/bus/detailRoute",{"id":id},function(req){
		var data = req.data;
		zbusId = data.bus_id;
		zcarCard = data.car_card;

		resetCards();
		$("#ecarCard").val(data.bus_id);
		$("#efromCity").val(data.fromCityId);
		modEFromCity(data.fromCityId,data.fromCountyId);
		modEFromCounty(data.fromCountyId,data.fromStoreId);
		$("#etoCity").val(data.toCityId);
		modEToCity(data.toCityId,data.toCountyId);
		modEToCounty(data.toCountyId,data.toStoreId);
		$("#eprice").val(data.price);
		$("#eisShelves").val(data.is_shelves);
		$("#efromTime").val(data.from_time);
		$("#etoTime").val(data.to_time);
		if(data.is_shelves == 0)
			$("#isShelvesCheck").attr("checked",true);
		else
			$("#isShelvesCheck").attr("checked",false);
		
		$("#myModal").modal("show");
		
	},"JSON");
	
};

//上架和下架
function onOffLine(is_shelves) {
	var idStr = "";
	$("input[flag=row]").each(function() {
		if (this.checked) {
			idStr += this.value + ",";
		}
	});
	var mes = "";
	if (is_shelves == 0) {
		mes = "上架";
	} else if (is_shelves == 1) {
		mes = "下架";
	}
	bootbox.confirm("确定要" + mes + "选中的商品么?", function(result) {
		if (result) {
			$.post('admin/cart/bus/onOffLine', {
				"is_shelves" : is_shelves,
				"ids" : idStr.substr(0, idStr.length - 1)
			}, function(res) {
				if (res.status == 'success') {
					bootbox.alert(mes + "成功！");
					doSearch();
				}
			}, "JSON");
		}
	});
}

function deleteRoute(){
	var idStr="";
	$("input[flag=row]").each(function(){
		if(this.checked){
			idStr+=this.value+",";
		}
	});
	bootbox.confirm("你确定要删除这条路线么，删除后不能恢复。", function(result) {
		if(result){
			$.ajax({
				url : "admin/cart/bus/deleteRoute",
				post : "post",
				data:{
					"ids":idStr
				},
				success:function(data){
					if(data.status == "success"){
						bootbox.alert("删除成功！");
						doSearch();
					}
				}
				
			});
		}
	});
}

/*保存数据到后台*/
var save = function(){
	var ecarCard = $("#ecarCard").val();
	if(!checkField(ecarCard)){
		valTips("ecarCard", "请选择车牌号码");
		return;
	}
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
	var eprice = $("#eprice").val();
	if(!checkField(eprice, new RegExp('^([1-9][\\d]{0,7}|0)(\\.[\\d]{1,2})?$') )){
		valTips("eprice", "请输入正确的价格");
		return;
	}
	var efromTime = $("#efromTime").val();
	if(!checkField(efromTime, 5, 5, new RegExp("^((0?[1-9])|[0-1]\\d|2[0-3])\:((0?[1-9])|[0-5]\\d)$"))){
		valTips("efromTime", "请输入正确的时间，格式： HH:mm");
		return;
	}
	var etoTime = $("#etoTime").val();
	if(!checkField(etoTime, 5, 5, new RegExp("^((0?[1-9])|[0-1]\\d|2[0-3])\:((0?[1-9])|[0-5]\\d)$"))){
		valTips("etoTime", "请输入正确的时间，格式： HH:mm");
		return;
	}
	
	$.post("admin/cart/bus/saveRoute",$("#modalForm").serialize(),function(req){
		if('success' == req.status){
			$("#myModal").modal("hide");
			bootbox.alert("保存成功。");
		}else{
			bootbox.alert("保存失败,请检查数据后重试。");
		}
		doSearch();
	},"json");
};
/************************************************************************************************************************/


var beforeCounts = 0;

var priceSearch = function(){
	var table = $("#price_table").DataTable();
	var json = '{';
	$("#btnmenu_price select,#btnmenu_price input").each(function() {
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
        	url:"admin/cart/bus/buslist",	
        	type: "POST"
        },
		"columns": [
            { "data": null },
            { "data": null },
            { "data": null },
            { "data": "brand" },
            { "data": "sys" },
            { "data": "car_year" },
            { "data": "seating" },
            { "data": "counts" },
            { "data": "car_card" },
            { "data": null }
        ],
        "columnDefs": [
			{
				"targets":0,
				render:function(data,type,row){
					var str="<label><input type='checkbox'  flag='row' value='"+row.car_id+"' /><span class='lbl'></span></label>";
					return str;
				}
			},
			{
				"targets": 1,
				render: function (a, b, c, d) {
	                return d.settings._iDisplayStart+d.row+1;
				}
			},
			{
				"targets": 2,
				render: function (a, b, c, d) {
	                var html = '<a href="'+c.pic_url+'" target="_blank"><img  width="50" height="50" src="'+c.pic_url+'" /></a>'
	                return html;
				}
			},
			{
 	            "targets": 9,
 	            render: function (a, b, c, d) {
 	            	var context;
            		context =
	 	                {
	 	                    func: [
	 	                        {"name": "编辑", "fn": "modAddrPrice(\'" + c.car_id + "\')", "type": "purple", "icon":"edit"}
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
	$("#esys").empty().append('<option value="">请选择车系</option>');
	$("#modalForm_price").find("tr[name=carCardBox]").not(":first").remove();
	$("#modalForm_price").find("tr[name=carCardBox]").children("td").remove();
	$("#tab2_2").find("img[name=imgSrc]").attr("src","uploadFiles/uploadImgs/zanwutupian.jpg");
	$("#tab2_2").find("input").val("");
};

var modAddrPriceSys = function(brandId,carSysId){
	var ecarSys = $("#esys");
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
	$.post("admin/cart/bus/detail",{"id":id},function(res){
		var detail = res.detail;
		
		$("#ecarId").val(id);
		$("#ebrand").val(detail.brand_id);
		modAddrPriceSys(detail.brand_id,detail.sys_id);
		$("#esys").val(detail.sys_id);
		$("#ecounts").val(detail.counts);
		beforeCounts = detail.counts;
		$("#ecounts").change();
		$("#eseating").val(detail.seating);
		$("#ecarYear").val(detail.car_year);
		$("#ecarConfigure").val(detail.car_configure);
		var cards = detail.car_card.split(",");
		$("#modalForm_price").find("input[name=carCard]").each(function(i,c){
			$(this).val(cards[i]);
			$(this).attr("readonly","readonly");
		});
		
		var imgs = detail.imgs.split(",");
		for (var i = 1; i <= 4; i++) {
			$("#url"+i).val(imgs[i-1]);
			$("#img"+ i).attr({
				src:imgs[i-1]
			});
		}
		$("#priceModal").modal("show");
	},"JSON");
};

$("#ebrand").change(function(){
	var ecarSys = $("#esys");
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
	var ecarSys = $("#sys");
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

$("#ecounts").change(function(){
	var $this = $(this);
	var $cardBox = $this.parent().parent().next();
	var $table = $cardBox.parent();
	var vals = new Array();
	$("#modalForm_price").find("input[name=carCard]").each(function(i,c){
		var $this = $(this);
		vals[i] = $this.val();
	});
	
	var counts = $this.val();
	if(counts < beforeCounts){
		valTips("ecounts", "车牌号码不可更改");
		return ;
	}
	
	$cardBox.children("td").remove();
	$table.find("tr[name=carCardBox]").not(":first").remove();
	
	counts = parseInt(counts);
	
	if(!checkField(counts ,new RegExp('^[1-9]+[0-9]*]*$'))){
		valTips("ecounts", "请正确的数量");
		return ;
	}
	var line = counts%5==0?counts/5:parseInt(counts/5)+1;
	var $clone = $cardBox.clone();
	$clone.children("th").text("");
	
	var index = 0;
	
	if(line == 1){
		for (var i = 0; i < counts; i++) {
			var modal = $(cardModal);
			var param = vals[index];
			if(param != null && param != '' && index<beforeCounts){
				modal.find("input").attr("readonly","readonly");
			}
			modal.find("input").val(param);
			
			$cardBox.append(modal);
			index++;
		}
	}else{
		for (var i = 0; i < 5; i++) {
			var modal = $(cardModal);
			var param = vals[index];
			if(param != null && param != '' && index<beforeCounts){
				modal.find("input").attr("readonly","readonly");
			}
			modal.find("input").val(param);
			$cardBox.append(modal);
			index++;
		}
		for (var i = 0; i < line-2; i++) {
			var $m = $clone.clone();
			$table.append($m);
			for (var j = 0; j < 5; j++) {
				var modal = $(cardModal);
				var param = vals[index];
				if(param != null && param != '' && index<beforeCounts){
					modal.find("input").attr("readonly","readonly");
				}
				modal.find("input").val(param);
				$m.append(modal);
				index++;
			}
		}
		var $m = $clone.clone();
		$table.append($m);
		for (var i = 0; i < counts-((line-1)*5); i++) {
			var modal = $(cardModal);
			var param = vals[index];
			if(param != null && param != '' && index<beforeCounts){
				modal.find("input").attr("readonly","readonly");
			}
			modal.find("input").val(param);
			$m.append(modal);
			index++;
		}
	}
	
});

var savePrice = function(){
	var sysId =  $("#esys").val();
	if(!checkField(sysId )){
		valTips("esys", "请选择车辆品牌和车系");
		return ;
	}
	
	var ecarYear = $("#ecarYear").val();
	if(!checkField(ecarYear)){
		valTips("ecarYear", "请选择车辆年代");
		return ;
	}
	
	var ecarConfigure = $("#ecarConfigure").val();
	if(!checkField(ecarConfigure)){
		valTips("ecarConfigure", "请选择车辆配置");
		return ;
	}
	
	var ecounts = $("#ecounts").val();
	if(!checkField(ecounts)){
		valTips("ecounts", "请输入车辆数量");
		return ;
	}
	
	var eseating = $("#eseating").val();
	if(!checkField(eseating)){
		valTips("eseating", "请输入座位数");
		return ;
	}
	
	var flag = true;
	$("#modalForm_price").find("input[name=carCard]").each(function(i,c){
		var $this = $(this);
		var card = $this.val();
		if(!checkField(card)){
			valTips($this, "请输入车牌号码");
			flag = false;
			return ;
		}
	});
	if(flag){
		for (var i = 1; i <= 4; i++) {
			var img = $("#url"+i).val();
			if(!checkField(img)){
				$("#busInfoTab a[href=#tab2_2]").tab("show");
				valTips("img"+i, "请输入选择图片");
				flag = false;
				return ;
			}
			var $input = '<input type="hidden" name="url'+i+'" value="'+img+'" />';
			$("#modalForm_price").append($input);
		}
	}
	
	if(flag){
		$.post("admin/cart/bus/save",$("#modalForm_price").serialize(),function(res){
			if(res.status == "success"){
				bootbox.alert("保存成功。");
				$("#priceModal").modal("hide");
			}else if(res.status == "error"){
				bootbox.alert("保存失败,"+res.msg);
			}else{
				bootbox.alert("保存失败,请检查数据后重试。");
			}
			priceSearch();
		},"JSON");
	}
};


function doDeletes(){
	var idStr="";
	$("input[flag=row]").each(function(){
		if(this.checked){
			idStr+=this.value+",";
		}
	});
	bootbox.confirm("确定要删除选中的班车么?", function(result) {
		if(result){
			$.ajax({
				url : "admin/cart/bus/deletesbus",
				post : "post",
				data:{
					"ids":idStr
				},
				success:function(data){
					if(data.status == "success"){
						bootbox.alert("删除成功！");
						$('#price_table').DataTable().clear();
						$('#price_table').DataTable().draw();
					}
				}
				
			});
		}
	});
}
function deleteUpload(obj){
	var id=$(obj).attr("id");
	var number=id.substring(6,id.length);
	$("#url"+number).val("");
	$("#img"+ number).attr({
		src:"uploadFiles/uploadImgs/zanwutupian.jpg"
	});
}

function inputClick(obj){
	var id=$(obj).attr("id");
	var input="input"+id.substring(3,id.length);
	$("#"+input).click();
}

function ajaxFileUpload(obj) {
	//获取欲上传的文件路径  
	var file = $(obj).val();
	/* var rs = checkPictureType(file);
	if (rs < 0) {
		$(obj).val("");
		$.messager.alert("提示", "您选择的上传文件不是有效的图片文件！");
		return;
	} */
	
	var fileId=$(obj).attr("id");
	$(obj).parent().ajaxSubmit({
		url : 'merchSystem/info/imgFileUpload', //需要链接到服务器地址
		type:'post',
		success : function(data) { //相当于java中try语句块的用法
			//var str = data;
			//console.info(str +data);
			//var nstr = str.substring( str.indexOf("["), str.indexOf("]") );
			//console.info(nstr);
			//data = data.replace(/<[^>].*?>/g, "");//对返回的数据进行转换
			//var json = eval("(" + data + ")");//对返回的数据进行转换
			var number=fileId.substring(5,fileId.length);
			$("#url"+number).val(data.imgUrl);
			$("#img"+ number).attr({
				src:data.imgUrl
			});
		}
	});

}

</script>
</html>
