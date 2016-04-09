<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="${system.basePath }">
<%@ include file="/static/inc.jsp" %>

</head>
<body>
<div class="container-fluid" id="main-container">
	<div id="breadcrumbs">
		<ul class="breadcrumb">
			<li><i class="icon-home"></i> <a href="javascript:;">当前</a><span class="divider"><i class="icon-angle-right"></i></span></li>
			<li class="active">城市信息管理</li>
		</ul><!--.breadcrumb-->
	</div><!--#breadcrumbs-->
	<div class="row-fluid">
		<!-- <h3 class="header smaller lighter blue">会员管理</h3> -->
		<div class="table-header">
			城市信息管理
		</div>
		<table style="margin-left: 5px;" id="btnmenu">
			<tbody>
				<tr>
					<td>
						省：
					</td>
					<td>
						<span style="margin-top: 7px;" class="input-icon">
							<select id="province" style="width: 110px;">
								<option value="">---请选择---</option>
							</select>
						</span>
					</td>
				
					<td>
						市：
					</td>
					<td>
						<span style="margin-top: 7px;" class="input-icon">
							<select id="city" style="width: 110px;">
								<option value="">---请选择---</option>
							</select>
						</span>
					</td>
					<td>
						区域：
					</td>
					<td>
						<span style="margin-top: 7px;" class="input-icon">
							<select id="county" style="width: 110px;">
								<option value="">---请选择---</option>
							</select>
						</span>
					</td>
					
					<td>
						<a title="查询" onclick="" class="btn btn-mini btn-light" id="searchBtn"><i class="icon-search"></i>查询</a>
						
						<a title="添加省市区" onclick="" class="btn btn-mini btn-info" id="openModel"><i class="icon-edit"></i>添加</a>
						<a title="编辑省份" onclick="" class="btn btn-mini btn-info" id="openEditModel"><i class="icon-edit"></i>编辑省份</a>
						
					</td>
				</tr>
			</tbody>
		</table>
		<table id="table_report" class="table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th>序号</th>
					<th>省</th>
					<th>市</th>
					<th>区/县</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody></tbody> 
		</table>
	</div>
</div>
<!-- #main-content -->


<!-- Modal -->
<div class="modal fade" id="addCitysModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
   <div class="modal-dialog">
       <div class="modal-content">
           <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                       aria-hidden="true">&times;</span></button>
           </div>
       	<ul class="nav nav-tabs" id="otherInfoTab">
		    <li class="active" data-cmd="userinfo"><a href="javascript:;">添加省市区</a></li>
		</ul>
		<div class="tab-content">
			<!-- 基础属性 -->
		    <div class="tab-pane active" id="tab_1">
		    	<div class="modal-body">
                	<form id="addCitysForm">
	                	<table class="mytable-detail" >
	                		<tr> 
	                			<th width="80">
	                				添加类型：
	                			</th>
	                			<td>
	                			 	<select id="ctype" name="ctype">
	                			 		<option value="">---请选择---</option>
	                			 		<option value="province">省</option>
	                			 		<option value="city">市</option>
	                			 		<option value="county">区域</option>
	                			 	</select>
	                			</td>
	                		</tr>
	                	</table>
	                	<table class="mytable-detail" id="open-detail" >
	                	</table>
                	</form>
	            </div>
		    </div>
		</div>
		<div style = "padding:10px 350px;">
				<button type="button" class="btn btn-primary" onclick="saveCitys();">保存</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			</div>
        </div>
    </div>
</div>

<div class="modal fade" id="editModel" tabindex="-1" role="dialog" aria-labelledby="editModelLabel" aria-hidden="true" style="display: none;">
   <div class="modal-dialog">
       <div class="modal-content">
           <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                       aria-hidden="true">&times;</span></button>
           </div>
       	<ul class="nav nav-tabs" id="otherInfoTab">
		    <li class="active" data-cmd="userinfo"><a href="javascript:;">编辑省市区</a></li>
		</ul>
		<div class="tab-content">
			<!-- 基础属性 -->
		    <div class="tab-pane active" id="tab_1">
		    	<div class="modal-body">
                	<form id="editForm">
	                	<table class="mytable-detail" >
	                		<tr> 
	                			<th width="80">
	                				省：
	                			</th>
	                			<td>
	                				<input type="hidden" id="eprovinceId" name="eprovinceId" >
	                			 	<input type="text" class="form-control" id="eprovinceName" name="eprovinceName" placeholder="请输入省名称">
	                			</td>
	                		</tr>
	                		<tr> 
	                			<th width="80">
	                				市：
	                			</th>
	                			<td>
	                				<input type="hidden" id="ecityId" name="ecityId" >
	                			 	<input type="text" class="form-control" id="ecityName" name="ecityName" placeholder="请输入市名称">
	                			</td>
	                		</tr>
	                		<tr> 
	                			<th width="80">
	                				区域：
	                			</th>
	                			<td>
	                				<input type="hidden" id="ecountyId" name="ecountyId" >
	                			 	<input type="text" class="form-control" id="ecountyName" name="ecountyName" placeholder="请输入区名称">
	                			</td>
	                		</tr>
	                	</table>
	                	<table class="mytable-detail" id="open-detail" >
	                	</table>
                	</form>
	            </div>
		    </div>
		</div>
		<div style = "padding:10px 350px;">
				<button type="button" class="btn btn-primary" onclick="saveEdit();">保存</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			</div>
        </div>
    </div>
</div>

<div class="modal fade" id="editProviceModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
   <div class="modal-dialog">
       <div class="modal-content">
           <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                       aria-hidden="true">&times;</span></button>
           </div>
       	<ul class="nav nav-tabs" id="otherInfoTab">
		    <li class="active" data-cmd="userinfo"><a href="javascript:;">修改省份名</a></li>
		</ul>
		<div class="tab-content">
			<!-- 基础属性 -->
		    <div class="tab-pane active" id="tab_1">
		    	<div class="modal-body">
                	<form id="addCitysForm">
	                	<table class="mytable-detail" >
	                		<tr> 
	                			<th width="80">
	                				省份：
	                			</th>
	                			<td>
	                			 	<select id="oldProvince" name=""oldProvince"">
	                			 		<option value="">---请选择---</option>
	                			 		<c:forEach items="${provinceList }" var="province">
	                			 			<option value="${province.id}">${province.province }</option>
	                			 		</c:forEach>
	                			 	</select>
	                			</td>
	                		</tr>
	                		<tr>
	                			<th width="80">
	                				新名字：
	                			</th>
	                			<td>
	                			 	<input name="newProvinceName" id="newProvinceName">
	                			</td>
	                		</tr>
	                	</table>
	                	<table class="mytable-detail" id="open-detail" >
	                	</table>
                	</form>
	            </div>
		    </div>
		</div>
		<div style = "padding:10px 350px;">
				<button type="button" class="btn btn-primary" onclick="submitEdit();">保存</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			</div>
        </div>
    </div>
</div>



<%@ include file="/static/foot.jsp" %>
</body>
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
	initList();
	initSelects();
	var table = $("#table_report").DataTable();
	$("#searchBtn").click(function(){
		var json = '{"provinceId":"'+$("#province").val()+'","cityId":"'+$("#city").val()+'","countyId":"'+$("#county").val()+'"}';
		table.search(json).draw();
	});
	
	$("#openModel").click(function(){
		$("#addCitysModel").modal("show");
	});
	
	$("#openEditModel").click(function(){
		$("#editProviceModel").modal("show");
	});
	
	
	
	
	$("#ctype").change(function(){
		var ctype = this.value;
		console.info(ctype);
		var openDetail = $("#open-detail");
		openDetail.empty();
		if("province"==ctype){
			var item = "<tr>";
			item += '<th width="80">省名称：</th>';
			item += '<td><input name="parentId" value="0" type="hidden"><input type="text" class="form-control" id="name" name="name" placeholder="请输入省名称"></td>';
			item += '</tr>';
			openDetail.append(item);
		}else if('city'==ctype){
			$.post('admin/webcitymngr/provinceList',null,function(res){
				if(res.status=='success'){
					var item = '<tr><th width="80">省名称：</th>';
					item += '<td>';
					item += '<select id="parentId" name="parentId">';
					var list = res.list;
					for(var i in list){
						var p = list[i];
						item += "<option value='"+p.id+"'>"+p.province+"</option>";
					}
					item += '</select>';
					item += '</td></tr>';
					openDetail.append(item);
					
					item = "<tr>";
					item += '<th width="80">市名称：</th>';
					item += '<td><input type="text" class="form-control" id="name" name="name" placeholder="请输入市名称"></td>';
					item += '</tr>';
					openDetail.append(item);
				}
			},"JSON");
		}else if('county'==ctype){
			$.post('admin/webcitymngr/provinceList',null,function(res){
				if(res.status=='success'){
					var item = '<tr><th width="80">省名称：</th>';
					item += '<td>';
					item += '<select id="cprovince" name="cprovince" onchange="cprovinceChange(this);">';
					var list = res.list;
					for(var i in list){
						var p = list[i];
						item += "<option value='"+p.id+"'>"+p.province+"</option>";
					}
					item += '</select>';
					item += '</td></tr>';
					openDetail.append(item);
					
					item = '<tr><th width="80">市名称：</th>';
					item += '<td>';
					item += '<select id="parentId" name="parentId">';
					item += '</select>';
					item += '</td></tr>';
					openDetail.append(item);
					
					item = "<tr>";
					item += '<th width="80">区域名称：</th>';
					item += '<td><input type="text" class="form-control" id="name" name="name" placeholder="请输入区名称"></td>';
					item += '</tr>';
					openDetail.append(item);
					cprovinceChange(null);
				}
			},"JSON");
		}
	});
});

var initList = function(){
	$('#table_report').DataTable( {
	    "columns": [
			{ "data": null },
            { "data": "province" },
            { "data": "city" },
            { "data": "county" },
            { "data": null }
        ],
        "bDestroy": true,
        "ajax": {
        	url:"admin/webcitymngr/list",	
        	type: "POST"
        },
        "columnDefs": [
            {
            	"targets": 0,
            	render: function (a, b, c, d) {
	                return d.row+1;
            	}
            },
            {
	            "targets": 4,
	            render: function (a, b, c, d) {
	            	var context =
	                {
	                    func: [
	                        {"name": "编辑", "fn": "editCitys(\'" + c.id + "\')", "type": "purple", "icon":"edit"},
	                        {"name": "删除", "fn": "delCitys(\'" + c.id + "\')", "type": "danger", "icon":"trash"}
	                    ]
	                };
	                var html = template(context);
	            	return html;
            	}
	        }
		]
    });
};
//DataColumn.AutoIncreament=true;
var initSelects = function(){
	initProvinceList();
	changeProvince();
	changeCity();
};
//初始化省
var initProvinceList =function(){
	var province = $("#province");
	$.post('admin/webcitymngr/provinceList',null,function(res){
		if(res.status=='success'){
			province.empty();
			province.append("<option value=''>---请选择---</option>");
			var list = res.list;
			for(var i in list){
				var item = list[i];
				province.append("<option value='"+item.id+"'>"+item.province+"</option>");
			}
		}
	},"JSON");
};

//获取市
var changeProvince = function(){
	$("#province").change(function(){
		var provinceId = this.value;
		var city = $("#city");
		city.empty();
		city.append("<option value=''>---请选择---</option>");
		var county = $("#county");
		county.empty();
		county.append("<option value=''>---请选择---</option>");
		$.post('admin/webcitymngr/cityList',{'provinceId':provinceId},function(res){
			if(res.status=='success'){
				var list = res.list;
				for(var i in list){
					var item = list[i];
					city.append("<option value='"+item.id+"'>"+item.city+"</option>");
				}
			}
		},"JSON");
	});
};
//获取区域
var changeCity = function(){
	$("#city").change(function(){
		var cityId = this.value;
		var county = $("#county");
		county.empty();
		county.append("<option value=''>---请选择---</option>");
		$.post('admin/webcitymngr/countyList',{'cityId':cityId},function(res){
			if(res.status=='success'){
				var list = res.data;
				for(var i in list){
					var item = list[i];
					county.append("<option value='"+item.id+"'>"+item.county+"</option>");
				}
			}
		},"JSON");
	});
};

var cprovinceChange = function(obj){
	var provinceId = 0;
	if(obj==null){
		provinceId = 1;
	}else{
		provinceId = obj.value==''?1:obj.value;
	}
	var city = $("#parentId");
	city.empty();
	$.post('admin/webcitymngr/cityList',{'provinceId':provinceId},function(res){
		if(res.status=='success'){
			var list = res.list;
			for(var i in list){
				var item = list[i];
				city.append("<option value='"+item.id+"'>"+item.city+"</option>");
			}
		}
	},"JSON");
};

var saveCitys = function(){
	
	var name = $("#name").val();
	if(name == null || name == '' ){
		valTips("name", "请输入当前名称！");
		return;
	}
	
	$.post('admin/webcitymngr/saveCitys',$("#addCitysForm").serialize(),function(res){
		if(res.status=='success'){
			$("#addCitysModel").modal("hide");
			$("#name").val('');
			bootbox.alert("保存成功！",function(){
				$("#searchBtn").click();
			});
		}else if(res.status == 'exists'){
			valTips("name", "已经存在相同的名称了，请重新输入！");
		}
	},"JSON");
	
};

var editCitys = function(id){
	$("#editModel").modal("show");
	$.post("admin/webcitymngr/detail",{'id':id},function(res){
		var obj = res.obj;
		$("#ecountyId").val(obj.countyId);
		$("#ecountyName").val(obj.county);
		
		$("#ecityId").val(obj.cityId);
		$("#ecityName").val(obj.city);
		
		$("#eprovinceId").val(obj.provinceId);
		$("#eprovinceName").val(obj.province);
		
	},"JSON");
};

var saveEdit =function(){
	var eprovinceName  = $("#eprovinceName").val();
	var ecityName  = $("#ecityName").val();
	var ecountyName  = $("#ecountyName").val();
	
	if(eprovinceName==null ||  eprovinceName==''){
		valTips('eprovinceName', "省份不能为空");
		return;
	}
	if(ecityName==null || ecityName== '' ){
		valTips('ecityName', "城市不能为空");
		return
	}
	if(ecountyName==null || ecountyName==''){
		valTips('ecountyName', "区域不能为空");
		return
	}
	
	$.post("admin/webcitymngr/saveEdit",$("#editForm").serialize(),function(res){
		if('exists'==res.status){
			if('province' == res.check){
				valTips('eprovinceName', res.msg);
			}else if("city" == res.check){
				valTips('ecityName', res.msg);
			}else if('county'==res.check){
				valTips('ecountyName', res.msg);
			}			
		}else if('success'==res.status){
			bootbox.alert("修改成功！",function(){
				$("#searchBtn").click();
			});
			$("#editModel").modal("hide");
		}else{
			bootbox.alert("修改失败，请检查输入！");
		}
		
	},"JSON");
};

var delCitys =function(id){
	bootbox.confirm("确定删除一条区/县信息？",function(b){
		if(b){
			$.post('admin/webcitymngr/delCitys',{'addrId':id},function(res){
				if(res.status=='success'){
					bootbox.alert("删除成功");
				}else if(res.status == 'exists'){
					bootbox.alert("删除失败，此数据已经被占用");
				}else{
					bootbox.alert("服务器忙，请稍后重试");
				}
				$("#searchBtn").click();
			},"JSON");
		}
	});
};

function submitEdit(){
	var data={};
	data.name=$("#newProvinceName").val();
	data.id=$("#oldProvince").val();
	$.post("admin/webcitymngr/editProvince",data,function(result){
		if(result.status=="success"){
			$("#editProviceModel").modal("hide");
			bootbox.alert("修改成功",function(){
				window.location.reload();
			});
		}else{
			bootbox.alert("服务器忙，请稍后重试");
		}
	});
}

</script>
</html>
