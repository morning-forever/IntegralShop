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
			<li class="active">会员信息</li>
		</ul><!--.breadcrumb-->
	</div><!--#breadcrumbs-->
	<div class="row-fluid">
		<!-- <h3 class="header smaller lighter blue">会员管理</h3> -->
		<div class="table-header">
			会员信息
		</div>
		<div id="div_content" class="row-fluid" style="padding-top: 10px;">
			<form class="form-horizontal" id="validation-form" method="post" >
				<div class="control-group">
					<label class="control-label" for="name">头像:</label>
					<div class="controls">
						<div class="span12">
							<img style="width: 80px;height: 80px;" alt="头像" title="头像" src="${obj.headImg }" />
						</div>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="name">用户名:</label>
					<div class="controls">
						<div class="span12">
							<input value="${obj.nickname }" class="span4" type="text" id="username" name="email" placeholder="请输入用户名" disabled="disabled"/>
						</div>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="email">邮箱:</label>
					<div class="controls">
						<span class="span12">
							<input value="${obj.email }" class="span4" type="email" id="email" name="email" placeholder="请输入邮件地址" disabled="disabled"/>
						</span>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="phone">电话:</label>
					<div class="controls">
						<div class="span3 input-prepend">
							<span class="add-on"><i class="icon-phone"></i></span>
							<input value="${obj.phone }" class="span12" type="tel" id="phone" name="phone" placeholder="请输入电话号码" disabled="disabled"/>
						</div>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="loginName">生日:</label>
					<div class="controls">
						<div class="span12">
							<input value="${obj.birthday }" type="text" name="birthday" id="birthday" class="span4" placeholder="请输入生日" disabled="disabled"/>
						</div>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="loginName">会员等级:</label>
					<div class="controls">
						<div class="span12">
							<input value="${obj.levelDesc }" type="text" name="level" id="level" class="span4" placeholder="请输入会员等级" disabled="disabled"/>
						</div>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="loginName">会员积分:</label>
					<div class="controls">
						<div class="span12">
							<input value="${obj.score }" type="text" name="level" id="level" class="span4" placeholder="请输入会员积分" disabled="disabled"/>
						</div>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="loginName">会员角色:</label>
					<div class="controls">
						<div class="span12">
							<input value="${obj.isMaster }" type="text" name="level" id="level" class="span4" placeholder="请输入会员角色" disabled="disabled"/>
						</div>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="loginName">个性签名:</label>
					<div class="controls">
						<div class="span12">
							<textarea class="span4" rows="" cols="" disabled="disabled">${obj.summary }</textarea>
						</div>
					</div>
				</div>
				
				<div class="hr hr-dotted"></div>
				<div class="control-group">
					<label class="control-label" for="isBan">状态:</label>
					<div class="controls">
						<span class="span12">
							<c:if test="${obj.isBan == 0 }">
								<input value="禁用" type="text" name="level" id="level" class="span4" placeholder="请输入会员状态"  disabled="disabled"/>
							</c:if>
							<c:if test="${obj.isBan != 0 }">
								<input value="启用" type="text" name="level" id="level" class="span4" placeholder="请输入会员状态" disabled="disabled"  />
							</c:if>
						</span>
					</div>
				</div>
				
		  	</form>
		</div>
		<div style="text-align: center;">
			<a title="保存" href="javascript:;" class="btn btn-mini btn-grey" id="back-btn"><i class="icon-reply"></i> 返回</a>
		</div>
	</div>
</div>
<!-- #main-content -->
<%@ include file="/static/foot.jsp" %>

</body>
<script type="text/javascript">
	$("#back-btn").click(function(){
		targetMainFrame("admin/webusermngr/main");
	});

</script>
</html>
