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
			<li class="active">管理员信息</li>
		</ul><!--.breadcrumb-->
	</div><!--#breadcrumbs-->
	<div class="row-fluid">
		<!-- <h3 class="header smaller lighter blue">会员管理</h3> -->
		<div class="table-header">
			管理员信息
		</div>
		<div id="div_content" class="row-fluid" style="padding-top: 10px;">
			<form class="form-horizontal" id="validation-form" method="post" >
				<input value="${user.id }" id="userId" name="userId" type="hidden" />
				
				<div class="control-group">
					<label class="control-label" for="name">登录名:</label>
					<div class="controls">
						<div class="span12">
							<input value="${loginUser.loginId }" class="span4" type="text" id="loginId" name="loginId" placeholder="请输入登录名" <c:if test="${op eq 'modSelf' }">disabled=disabled</c:if>/>
						</div>
					</div>
				</div>
			
				<div class="control-group">
					<label class="control-label" for="name">用户名:</label>
					<div class="controls">
						<div class="span12">
							<input value="${user.username }" class="span4" type="text" id="username" name="username" placeholder="请输入用户名"/>
						</div>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="phone">联系电话:</label>
					<div class="controls">
						<div class="span3 input-prepend">
							<span class="add-on"><i class="icon-phone"></i></span>
							<input value="${user.phone }" class="span12" type="tel" id="phone" name="phone" placeholder="请输入电话号码"/>
						</div>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="loginName">系统角色:</label>
					<div class="controls">
						<div class="span12">
							<select id="roleKey" name="roleKey" <c:if test="${op eq 'modSelf' }">disabled=disabled</c:if>>
								<c:forEach var="rl" items="${roleList }">
									<option value="${rl.roleKey }" <c:if test="${rl.roleKey eq user.roleKey }">selected=selected</c:if>>${rl.roleName }</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="loginName">账号状态:</label>
					<div class="controls">
						<div class="span12">
							<select id="accountState" name="accountState" disabled=disabled>
								<option value="0" <c:if test="${0 eq user.accountState }">selected=selected</c:if>>有效</option>
								<option value="1" <c:if test="${1 eq user.accountState }">selected=selected</c:if>>无效</option>
							</select>
						</div>
					</div>
				</div>
				
				<div class="hr hr-dotted"></div>
				<div class="control-group">
					<label class="control-label" for="loginName">密码:</label>
					<div class="controls">
						<div class="span12">
							<input value="" class="span4" type="password" id="password" name="password" placeholder="请输入密码"/>
						</div>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="loginName">确认密码:</label>
					<div class="controls">
						<div class="span12">
							<input value="" class="span4" type="password" id="rpassword" name="rpassword" placeholder="请输入确认密码"/>
						</div>
					</div>
				</div>
				
		  	</form>
		</div>
		<div style="text-align: center;">
			<c:if test="${op eq 'modSelf' }">
				<a title="保存" href="javascript:;" class="btn btn-mini btn-info" id="save-btn"><i class="icon-save"></i> 保存</a>
			</c:if>
			
			<c:if test="${op != 'modSelf' }">
				<a title="保存" href="javascript:;" class="btn btn-mini btn-info" id="save-btn"><i class="icon-save"></i> 保存</a>
				<a title="返回" href="javascript:;" class="btn btn-mini btn-grey" id="back-btn"><i class="icon-reply"></i> 返回</a>
			</c:if>
		</div>
	</div>
</div>
<!-- #main-content -->
<%@ include file="/static/foot.jsp" %>

</body>
<script type="text/javascript">
$(document).ready(function(){
	$("#save-btn").click(function(){
		
		if(!checkField($("#loginId").val())){
			valTips("loginId","请输入登录名");
			return ;
		}
		if(!checkField($("#username").val())){
			valTips("username","请输入用户名");
			return ;
		}
		if(!checkField($("#phone").val()) || !checkPhone($("#phone").val())){
			valTips("phone","请输入正确的联系电话");
			return ;
		}
		if(!checkField($("#password").val())){
			valTips("password","请输入密码");
			return ;
		}
		
		if($("#password").val() != $("#rpassword").val()){
			valTips("password","两次输入的密码不一致");
			return ;
		}
		
		$.post('admin/user/saveUser',$("#validation-form").serialize(),function(res){
			if(res.status == 'success'){
				bootbox.alert("修改成功");
				if('${op}'=='modSelf'){
					window.location.href='admin/login?op=outLogin';
				}
			}else if('login_user_pass_err' == res.status){
				valTips("password","密码输入错误");
				valTips("rpassword","确认密码和输入密码不一样");
			}else if('exists' == res.status){
				valTips("loginId","登录名已经存在");
			}else{
				bootbox.alert("输入异常，请检查输入")
			}
		},"JSON");
	});
	
	
	
	$("#back-btn").click(function(){
		targetMainFrame("admin/user/main");
	});
});















</script>
</html>
