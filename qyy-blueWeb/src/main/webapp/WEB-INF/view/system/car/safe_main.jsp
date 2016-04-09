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
				<li class="active">快旅出行</li>
			</ul>
			<!--.breadcrumb-->
		</div>
		<!--#breadcrumbs-->
		<div class="row-fluid">
			<div class="table-header">保险管理</div>
			<ul class="nav nav-tabs" id="otherInfoTab">
				<li class="active"><a href="#tab_1">租车保险</a></li>
				<li><a href="#tab_2">包车保险</a></li>
				<li><a href="#tab_3">班车保险</a></li>
				<li><a href="#tab_4">拼车保险</a></li>
			</ul>
			<div class="tab-content">
				<!-- 租车保险 -->
				<div class="tab-pane active" id="tab_1">
					<form id="rentForm">
					<input type="hidden" name="id" value="${carRentSafe.id }">
					<input type="hidden" name="type" value="rent">
					<table id="table_report1">
						<tr>
							<td>金额：</td>
							<td><input type="text" id="price1" name="price" value="${carRentSafe.price }"
							placeholder="请输入金额"  notNull="请输入金额">
							</td>
						</tr>
						<tr>
							<td>保险说明：</td>
							<td><textarea id="remark1" name="remark" rows="7" cols="75" style="width: auto;"
							 placeholder="请输入保险说明"  notNull="请输入保险说明" maxlength="250">${carRentSafe.remark }</textarea></td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input class="btn btn-info"
								onclick="save('rent')" type="button" value="保存"></td>
						</tr>
					</table>
					</form>
				</div>
				<!-- 包车保险 -->
				<div class="tab-pane" id="tab_2">
					<form id="wrapForm">
					<input type="hidden" name="id" value="${carWrapSafe.id }">
					<input type="hidden" name="type" value="wrap">
					<table id="table_report2">
						<tr>
							<td>金额：</td>
							<td><input type="text" id="price2" name="price" value="${carWrapSafe.price }"
							placeholder="请输入金额"  notNull="请输入金额">
							</td>
						</tr>
						<tr>
							<td>保险说明：</td>
							<td><textarea id="remark2" name="remark" rows="7" cols="75" style="width: auto;"
							 placeholder="请输入保险说明"  notNull="请输入保险说明" maxlength="250">${carWrapSafe.remark }</textarea></td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input class="btn btn-info"
								onclick="save('wrap')" type="button" value="保存"></td>
						</tr>
					</table>
					</form>
				</div>
				<!-- 班车保险 -->
				<div class="tab-pane" id="tab_3">
					<form id="busForm">
					<input type="hidden" name="id" value="${carBusSafe.id }">
					<input type="hidden" name="type" value="bus">
					<table id="table_report3">
						<tr>
							<td>金额：</td>
							<td><input type="text" id="price3" name="price" value="${carBusSafe.price }"
							placeholder="请输入金额"  notNull="请输入金额">
							</td>
						</tr>
						<tr>
							<td>保险说明：</td>
							<td><textarea id="remark3" name="remark" rows="7" cols="75" style="width: auto;"
							 placeholder="请输入保险说明"  notNull="请输入保险说明" maxlength="250">${carBusSafe.remark }</textarea></td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input class="btn btn-info"
								onclick="save('bus')" type="button" value="保存"></td>
						</tr>
					</table>
					</form>
				</div>
				<!-- 拼车保险 -->
				<div class="tab-pane" id="tab_4">
					<form id="carpoolForm">
					<input type="hidden" name="id" value="${carPoolSafe.id }">
					<input type="hidden" name="type" value="carpool">
					<table id="table_report4">
						<tr>
							<td>金额：</td>
							<td><input type="text" id="price4" name="price" value="${carPoolSafe.price }"
							placeholder="请输入金额"  notNull="请输入金额">
							</td>
						</tr>
						<tr>
							<td>保险说明：</td>
							<td><textarea id="remark4" name="remark" rows="7" cols="75" style="width: auto;"
							 placeholder="请输入保险说明"  notNull="请输入保险说明" maxlength="250">${carPoolSafe.remark }</textarea></td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input class="btn btn-info"
								onclick="save('carpool')" type="button" value="保存"></td>
						</tr>
					</table>
					</form>
				</div>
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

	});

	//tab页
	$(function() {
		$('#otherInfoTab a:first').tab('show');//初始化显示哪个tab

		$('#otherInfoTab a').click(function(e) {
			e.preventDefault();//阻止a链接的跳转行为
			$(this).tab('show');//显示当前选中的链接及关联的content
		})
	})
	
	//保存
	function save(type){
		var formObj = $("#"+type+"Form");
		if(checkForm(formObj)){
			$.post("admin/cart/safe/save",formObj.serialize(),function(res){
				if(res.status == 'success'){
					bootbox.alert("保存成功！");
				}else{
					bootbox.alert("保存失败！");
				}
			});
		}
	}
	
	//表单验证
	function checkForm(formObj){
		var i = 0;
		formObj.find("input[notNull],textarea[notNull]").each(function(){
			var val = $(this).val().trim();
			if( val == ""){
				valTips(this.id,$(this).attr("notNull"));
				i++;
			}else{
				if(this.name == "price"){
					if(!/^\d+(\.\d{1,2})?$/.test(val)){
						valTips(this.id,"请输入有效的金额，保留两位小数");
						i++;
					}
				}
			}
		});
		if(i > 0){
			return false;
		}
		return true;
	}

</script>
</html>
