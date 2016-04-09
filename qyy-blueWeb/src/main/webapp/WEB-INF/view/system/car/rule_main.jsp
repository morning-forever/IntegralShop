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
form label{
	width: 220px;
}
#myform2 th{
	padding-left: 0px;
}
#myform5 th{
	padding-left: 0px;
}
#myform6 th{
	padding-left: 0px;
}

table tr td textarea{
	min-width:400px;
	width: 800px;
	height: 200px;
}

</style>
<body>
<div class="container-fluid" id="main-container">
	<div id="breadcrumbs">
		<ul class="breadcrumb">
			<li><i class="icon-home"></i> <a href="javascript:;">当前</a><span class="divider"><i class="icon-angle-right"></i></span></li>
			<li class="active">车辆规则</li>
		</ul><!--.breadcrumb-->
	</div><!--#breadcrumbs-->
	<div class="row-fluid">
		<!-- <h3 class="header smaller lighter blue">会员管理</h3> -->
		<div class="table-header">
			车辆规则
		</div>
		
		<ul class="nav nav-tabs" id="otherInfoTab">
		    <li class="active" ><a href="#tab_1">租车规则</a></li>
		    <li ><a href="#tab_2">包车规则</a></li>
		    <li ><a href="#tab_3">班车规则</a></li>
		    <li ><a href="#tab_4">拼车规则</a></li>
		</ul>
		<div class="tab-content">
		    
		    <div class="tab-pane active" id="tab_1">
		    	<table class="mytable-detail" >
	    			<tbody>
		    			<tr>
		    				<th style="width: 100px">
                				租车规则：
                			</th>
                			<td>
               			 		<textarea id="rent_depict" >${rent.depict }</textarea>
                			</td>
		    			</tr>
		    			<tr>
		    				<th>
		    					退改规则：
		    				</th>
		    				<td>
		    					<textarea id="rent_back_depict" >${rent.backDepict }</textarea>
		    				</td>
		    			</tr>
		    			<tr>
		    				<th>
		    					超时计费：
		    				</th>
		    				<td>
		    					<textarea id="rent_timeout_depict" >${rent.timeoutDepict }</textarea>
		    				</td>
		    			</tr>
		    			<tr>
		    				<th>温馨提示：</th>
		    				<td >
		    					<textarea id="rent_reminder" >${rent.reminder }</textarea>
		    				</td>
		    			</tr>
		    			<tr>
		    				<th></th>
		    				<td >&nbsp;</td>
		    			</tr>
	    			</tbody>
	    		</table>
	    		<div>
			    	<input class="btn" style="margin-left: 47%;" onclick="doSubmit('rent');" type="button" value="保存">
			    </div>
		    </div>
		    
		    <div class="tab-pane" id="tab_2">
		    	<table class="mytable-detail" >
	    			<tbody>
		    			<tr>
		    				<th style="width: 100px">
                				包车规则：
                			</th>
                			<td>
               			 		<textarea id="wrap_depict" >${wrap.depict }</textarea>
                			</td>
		    			</tr>
		    			<tr>
		    				<th>
		    					退改规则：
		    				</th>
		    				<td>
		    					<textarea id="wrap_back_depict" >${wrap.backDepict }</textarea>
		    				</td>
		    			</tr>
		    			<tr>
		    				<th>
		    					超时计费：
		    				</th>
		    				<td>
		    					<textarea id="wrap_timeout_depict" >${wrap.timeoutDepict }</textarea>
		    				</td>
		    			</tr>
		    			<tr class="storeTr">
		    				<th>温馨提示：</th>
		    				<td >
		    					<textarea id="wrap_reminder" >${wrap.reminder }</textarea>
		    				</td>
		    			</tr>
		    			<tr class="storeTr">
		    				<th>支付成功提示：</th>
		    				<td >
		    					<textarea id="wrap_apply_depict" >${wrap.applyDepict }</textarea>
		    				</td>
		    			</tr>
	    				<tr>
		    				<th></th>
		    				<td >&nbsp;</td>
		    			</tr>
	    			</tbody>
	    		</table>
	    		<div>
			    	<input class="btn" style="margin-left: 47%;" onclick="doSubmit('wrap');" type="button" value="保存">
			    </div>
		    </div>
		    
		    <div class="tab-pane" id="tab_3" >
		    	<table class="mytable-detail" >
	    			<tbody>
		    			<tr>
		    				<th style="width: 100px">
                				班车规则：
                			</th>
                			<td>
               			 		<textarea id="bus_depict" >${bus.depict }</textarea>
                			</td>
		    			</tr>
		    			<tr>
		    				<th>
		    					退改规则：
		    				</th>
		    				<td>
		    					<textarea id="bus_back_depict" >${bus.backDepict }</textarea>
		    				</td>
		    			</tr>
		    			<tr class="storeTr">
		    				<th>温馨提示：</th>
		    				<td >
		    					<textarea id="bus_reminder" >${bus.reminder }</textarea>
		    				</td>
		    			</tr>
	    				<tr>
		    				<th></th>
		    				<td >&nbsp;</td>
		    			</tr>
	    			</tbody>
	    		</table>
	    		<div>
			    	<input class="btn" style="margin-left: 47%;" onclick="doSubmit('bus');" type="button" value="保存">
			    </div>
		    </div>
		    
		    <div class="tab-pane" id="tab_4" >
		    	<table class="mytable-detail" >
	    			<tbody>
		    			<tr>
		    				<th style="width: 100px">
                				拼车规则：
                			</th>
                			<td>
               			 		<textarea id="carpool_depict" >${carpool.depict }</textarea>
                			</td>
		    			</tr>
		    			<tr>
		    				<th>
		    					退改规则：
		    				</th>
		    				<td>
		    					<textarea id="carpool_back_depict" >${carpool.backDepict }</textarea>
		    				</td>
		    			</tr>
		    			<tr class="storeTr">
		    				<th>温馨提示：</th>
		    				<td >
		    					<textarea id="carpool_reminder" >${carpool.reminder }</textarea>
		    				</td>
		    			</tr>
	    				<tr>
		    				<th></th>
		    				<td >&nbsp;</td>
		    			</tr>
	    			</tbody>
	    		</table>
	    		<div>
			    	<input class="btn" style="margin-left: 47%;" onclick="doSubmit('carpool');" type="button" value="保存">
			    </div>
		    </div>
	    </div>
	</div>
</div>
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
<script type="text/javascript">
$(document).ready(function(){
	/*tab页*/
	$('#otherInfoTab a:eq(0)').tab('show');//初始化显示哪个tab

    $('#otherInfoTab a').click(function(e) {
        e.preventDefault();//阻止a链接的跳转行为
        $(this).tab('show');//显示当前选中的链接及关联的content
    });
});	

var param = param | {};

function doSubmit(type){
	//alert(2+type);
	if(checkForm(type)){
		$.post("admin/cart/rule/save",param,function(req){
			if(type=='rent'){
				if('success' == req.status){
					bootbox.alert("保存租车规则成功。");
					$('#otherInfoTab a:eq(0)').tab('show');
				}else{
					bootbox.alert("保存租车规则失败，请检查输入。");
				}
			}else if(type=='wrap'){
				if('success' == req.status){
					bootbox.alert("保存包车规则成功。");
					$('#otherInfoTab a:eq(1)').tab('show');
				}else{
					bootbox.alert("保存包车规则失败，请检查输入。");
				}
			}else if(type=='bus'){
				if('success' == req.status){
					bootbox.alert("保存班车规则成功。");
					$('#otherInfoTab a:eq(2)').tab('show');
				}else{
					bootbox.alert("保存班车规则失败，请检查输入。");
				}
			}else{
				if('success' == req.status){
					bootbox.alert("保存拼车规则成功。");
					$('#otherInfoTab a:eq(3)').tab('show');
				}else{
					bootbox.alert("保存拼车规则失败，请检查输入。");
				}
			}
		},"JSON");
	}
}

function checkForm(type){
	debugger
	if('rent' == type){
		var depict = $("#rent_depict").val();
		var backDepict = $("#rent_back_depict").val();
		var timeoutDepict = $("#rent_timeout_depict").val();
		var reminder = $("#rent_reminder").val();
		if(!checkField(depict)){
			valTips("rent_depict", "请输入租车的规则.");
			return false;
		}else if(!checkField(backDepict)){
			valTips("rent_back_depict", "请输入租车的退改规则.");
			return false;
		}else if(!checkField(timeoutDepict)){
			valTips("rent_timeout_depict", "请输入租车的超时规则.");
			return false;
		}else if(!checkField(reminder)){
			valTips("rent_reminder", "请输入租车的温馨提示.");
			return false;
		}
		param = {
			"ruleType" : type,
			'depict' : depict,
			'backDepict' : backDepict,
			'timeoutDepict' : timeoutDepict,
			'reminder' : reminder
		};
	}else if("wrap" == type){
		var depict = $("#wrap_depict").val();
		var backDepict = $("#wrap_back_depict").val();
		var timeoutDepict = $("#wrap_timeout_depict").val();
		var reminder = $("#wrap_reminder").val();
		var applyDepict = $("#wrap_apply_depict").val();
		if(!checkField(depict)){
			valTips("wrap_depict", "请输入包车的规则.");
			return false;
		}else if(!checkField(backDepict)){
			valTips("wrap_back_depict", "请输入包车的退改规则.");
			return false;
		}else if(!checkField(timeoutDepict)){
			valTips("wrap_timeout_depict", "请输入包车的超时规则.");
			return false;
		}else if(!checkField(applyDepict)){
			valTips("wrap_apply_depict", "请输入包车的温馨提示.");
			return false;
		}else if(!checkField(reminder)){
			valTips("wrap_reminder", "请输入包车的温馨提示.");
			return false;
		}
		param = {
			"ruleType" : type,
			'depict' : depict,
			'backDepict' : backDepict,
			'timeoutDepict' : timeoutDepict,
			'reminder' : reminder,
			'applyDepict' :applyDepict
		};
		
	}else if("bus" == type){
		var depict = $("#bus_depict").val();
		var backDepict = $("#bus_back_depict").val();
		var reminder = $("#bus_reminder").val();
		if(!checkField(depict)){
			valTips("bus_depict", "请输入班车的规则.");
			return false;
		}else if(!checkField(backDepict)){
			valTips("bus_back_depict", "请输入班车的退改规则.");
			return false;
		}else if(!checkField(reminder)){
			valTips("bus_reminder", "请输入班车的温馨提示.");
			return false;
		}
		param = {
			"ruleType" : type,
			'depict' : depict,
			'backDepict' : backDepict,
			'reminder' : reminder
		};
	}else if("carpool" == type ){
		var depict = $("#carpool_depict").val();
		var backDepict = $("#carpool_back_depict").val();
		var reminder = $("#carpool_reminder").val();
		if(!checkField(depict)){
			valTips("carpool_depict", "请输入拼车的规则.");
			return false;
		}else if(!checkField(backDepict)){
			valTips("carpool_back_depict", "请输入拼车的退改规则.");
			return false;
		}else if(!checkField(reminder)){
			valTips("carpool_reminder", "请输入拼车的温馨提示.");
			return false;
		}
		param = {
			"ruleType" : type,
			'depict' : depict,
			'backDepict' : backDepict,
			'reminder' : reminder
		};
	}
	return true;
}









</script>
</html>
