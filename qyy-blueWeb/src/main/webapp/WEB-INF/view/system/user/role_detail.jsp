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
			<li class="active">角色管理</li>
		</ul><!--.breadcrumb-->
	</div><!--#breadcrumbs-->
	<div class="row-fluid">
		<!-- <h3 class="header smaller lighter blue">会员管理</h3> -->
		<div class="table-header">
			角色详情
		</div>
		<div id="div_content" class="row-fluid" style="padding-top: 10px;">
			<form class="form-horizontal" id="validation-form" method="post" >
				<input value="${role.id }" id="roleId" name="roleId" type="hidden" />
				<input id="roleKey" name="roleKey" value="${role.roleKey }" type="hidden" />
				<div class="control-group">
					<label class="control-label" for="name">角色名:</label>
					<div class="controls">
						<div class="span12">
							<input value="${role.roleName }" class="span4" type="text" id="roleName" name="roleName" placeholder="请输入角色名" />
						</div>
					</div>
				</div>
			
				<div class="control-group">
					<label class="control-label" for="name">角色描述:</label>
					<div class="controls">
						<div class="span12">
							<input value="${role.roleDesc }" class="span4" type="text" id="roleDesc" name="roleDesc" placeholder="请输入角色描述"/>
						</div>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="loginName">角色继承:</label>
					<div class="controls">
						<div class="span12">
							<select id="parentKey" name="parentKey" <c:if test="${role != null }">disabled="disabled"</c:if>>
								<option value="SYSTEM" <c:if test="${role.roleKey eq 'SYSTEM' || role.parentKey eq 'SYSTEM' }">selected=selected</c:if>>系统管理员</option>
								<option value="SUPER" <c:if test="${role.roleKey eq 'SUPER' || role.parentKey eq 'SUPER'}">selected=selected</c:if>>超级管理员</option>
								<option value="OBSERVER" <c:if test="${role.roleKey eq 'OBSERVER' || role.parentKey eq 'OBSERVER'}">selected=selected</c:if>>观察者</option>
							</select>
						</div>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="loginName">角色状态:</label>
					<div class="controls">
						<div class="span12">
							<select id="roleState" name="roleState" <c:if test="${role != null }">disabled="disabled"</c:if>>
								<option value="0" <c:if test="${role.roleState == 0 }">selected=selected</c:if>>有效</option>
								<option value="1" <c:if test="${role.roleState == 1 }">selected=selected</c:if>>无效</option>
							</select>
						</div>
					</div>
				</div>
				
				<div class="hr hr-dotted"></div>
				
				<div class="control-group">
					<label class="control-label" for="loginName">菜单权限:</label>
					<div class="controls">
						<c:if test="${role.menuKeys eq 'ALL' }">
							<table id="menuTab">
								<tr>
									<td colspan="2"><input id="menu_all" name="menu_all" checked="checked" type="checkbox" value="ALL" /><span class="lbl">所有权限</span></td>
								</tr>
								<tr>
									<td colspan="2">&nbsp;</td>
								</tr>
								<tr>
									<td width="120">主菜单</td>
									<td>副菜单</td>
								</tr>
								<c:forEach var="pm" items="${allMenuList }">
								<tr>
									<td><input id="p_${pm.menuKey }" name="menu_check" checked="checked" type="checkbox" value="${pm.menuKey }" /><span class="lbl">${pm.menuName }</span></td>
									<td>
										<c:forEach var="sm" items="${pm.subMenu }">
											<input id="s_${sm.menuKey }" name="menu_check" checked="checked" type="checkbox" value="${sm.menuKey }" /><span class="lbl" style="margin-right: 15px;">${sm.menuName }</span>
										</c:forEach>
									</td>
								</tr>
								</c:forEach>
							</table>
						</c:if>
						<c:if test="${role.menuKeys != 'ALL' }">
							<table id="menuTab">
								<tr>
									<td colspan="2"><input id="menu_all" name="menu_all" type="checkbox" value="ALL" /><span class="lbl">所有权限</span></td>
								</tr>
								<tr>
									<td colspan="2">&nbsp;</td>
								</tr>
								<tr>
									<td width="120">主菜单</td>
									<td>副菜单</td>
								</tr>
								<c:forEach var="pm" items="${allMenuList }">
								<tr>
									<td>
										<input name="menu_check" id="p_${pm.menuKey }"
										<c:forEach items="${meMenuKeys }" var="mk">
											<c:if test="${pm.menuKey eq mk }">checked="checked"</c:if>
										</c:forEach>
										 type="checkbox" value="${pm.menuKey }" /><span class="lbl">${pm.menuName }</span>
									</td>
									<td>
										<c:forEach var="sm" items="${pm.subMenu }">
											<input name="menu_check" id="s_${sm.menuKey }"
											<c:forEach items="${meMenuKeys }" var="mk">
											<c:if test="${sm.menuKey eq mk }">checked="checked"</c:if>
											</c:forEach>
											type="checkbox" value="${sm.menuKey }" /><span class="lbl" style="margin-right: 15px;">${sm.menuName }</span>
										</c:forEach>
									</td>
								</tr>
								</c:forEach>
							</table>
						</c:if>
					</div>
				</div>
		  	</form>
		</div>
		<div style="text-align: center;">
			<a title="保存" href="javascript:;" class="btn btn-mini btn-info" id="save-btn"><i class="icon-save"></i> 保存</a>
			<a title="返回" href="javascript:;" class="btn btn-mini btn-grey" id="back-btn"><i class="icon-reply"></i> 返回</a>
		</div>
	</div>
</div>
<!-- #main-content -->
<%@ include file="/static/foot.jsp" %>

</body>
<script type="text/javascript" src="static/web/js/base.js"></script>
<script type="text/javascript">
var menuArr = document.getElementsByName("menu_check");
$(document).ready(function(){
	//选取所有菜单信息
	$("#menu_all").click(function(){
		if(this.checked){
			for(var i=0;i<menuArr.length;i++){
				menuArr[i].checked = true;
			}
		}else{
			for(var i=0;i<menuArr.length;i++){
				menuArr[i].checked = false;
			}
		}
	});
	//点选主菜单，勾选所属的子菜单
	$("#menuTab input").click(function(){
		var id = this.id;
		if(id.indexOf("p_") == 0){
			var pk = id.substring(id.indexOf('_')+1 ,id.length);
			var skInx = "s_"+pk+"_";
			for(var i=0;i<menuArr.length;i++){
				var sid = menuArr[i].id;
				if(sid.indexOf(skInx)==0){
					if(this.checked){
						menuArr[i].checked = true;
					}else{
						menuArr[i].checked = false;
					}
				}
			}
		}
		//判断是否全选
		for(var i=0;i<menuArr.length;i++){
			if(!menuArr[i].checked){
				document.getElementById("menu_all").checked = false;
				return;
			}
		}
		document.getElementById("menu_all").checked = true;
	});
	
	//保存
	$("#save-btn").click(function(){
		var param = {
			'roleId':$("#roleId").val(),
			'roleKey':$("#roleKey").val(),
			'roleName':$("#roleName").val(),
			'roleDesc':$("#roleDesc").val(),
			'roleState':$("#roleState").val(),
			"parentKey":$("#parentKey").val(),
			'menuKeys': ''
		};
		var isCk =document.getElementById("menu_all").checked;
		if(isCk){
			param.menuKeys = "ALL";
		}else{
			var mks = $("#menuTab input[name*='menu_c']").map(function(){
					if(this.checked){
						return $(this).val();
					}
			      return;
			    }).get();
			param.menuKeys = ''+mks+'';
		}
		
		if(!checkField(param.roleName)){
			valTips("roleName", "请输入角色名");
			return ;
		}
		if(!checkField(param.roleDesc)){
			valTips("roleDesc", "请输入角色描述");
			return ;
		}
		if(!checkField(param.menuKeys)){
			valTips("menu_all", "请选择菜单权限");
			return ;
		}
		
		$.post('admin/user/saveRole',param,function(res){
			if('success' == res.status){
				bootbox.alert("保存成功",function(){
					targetMainFrame("admin/user/roleMain");
				});
			}else{
				bootbox.alert("保存失败，请检出输入");
			}
		},"JSON");
	});
	
	//返回
	$("#back-btn").click(function(){
		targetMainFrame("admin/user/roleMain");
	});
});
</script>
</html>
