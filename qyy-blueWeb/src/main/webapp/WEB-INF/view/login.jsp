<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/static/inc.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<base href="<%=basePath%>/static/">
	<meta charset="utf-8" />
	<title>xxx后台登录</title>
	<meta name="description" content="User login page" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<!-- basic styles -->
	<link href="css/bootstrap.min.css" rel="stylesheet" />
	<link href="css/bootstrap-responsive.min.css" rel="stylesheet" />
	<link rel="stylesheet" href="css/font-awesome.min.css" />
	<!--[if IE 7]>
	  <link rel="stylesheet" href="css/font-awesome-ie7.min.css" />
	<![endif]-->
	<!-- page specific plugin styles -->
	
	<!-- ace styles -->
	<link rel="stylesheet" href="css/ace.min.css" />
	<link rel="stylesheet" href="css/ace-responsive.min.css" />
	<!--[if lt IE 9]>
	  <link rel="stylesheet" href="css/ace-ie.min.css" />
	<![endif]-->
</head>
<body class="login-layout">
	<div class="container-fluid" id="main-container">
		<div id="main-content">
			<div class="row-fluid">
				<div class="span12">
<div class="login-container">
<div class="row-fluid">
	<div class="center">
		<h1><i class="icon-leaf green"></i> <span class="red"></span> <span class="white">管理后台</span></h1>
		<h4 class="blue">&copy; xxx公司</h4>
	</div>
</div>
<div class="space-6"></div>
<div class="row-fluid">
<div class="position-relative">
	<div id="login-box" class="visible widget-box no-border">
		<div class="widget-body">
		 <div class="widget-main">
			<h4 class="header lighter bigger"><i class="icon-coffee green"></i> 请输入您的登录信息</h4>
			<div class="space-6"></div>
			<form action="<%=basePath %>/home/login">
				 <fieldset>
					<label>
						<span class="block input-icon input-icon-right">
							<input type="text" class="span12" placeholder="Username" />
							<i class="icon-user"></i>
						</span>
					</label>
					<label>
						<span class="block input-icon input-icon-right">
							<input type="password" class="span12" placeholder="Password" />
							<i class="icon-lock"></i>
						</span>
					</label>
					<div class="space"></div>
					<div class="row-fluid">
						<label class="span8">
							<input type="checkbox"><span class="lbl"> 记住我</span>
						</label>
						<button onclick="return true;" class="span4 btn btn-small btn-primary"><i class="icon-key"></i> 登录</button>
					</div>
					
				  </fieldset>
			</form>
		 </div><!--/widget-main-->
		</div><!--/widget-body-->
	</div><!--/login-box-->
</div><!--/position-relative-->
</div>
</div>
			</div><!--/span-->
		</div><!--/row-->
	</div>
</div><!--/.fluid-container-->
<!-- basic scripts -->
<script src="1.9.1/jquery.min.js"></script>
<script type="text/javascript">
window.jQuery || document.write("<script src='js/jquery-1.9.1.min.js'>\x3C/script>");
</script>
<!-- page specific plugin scripts -->
<!-- inline scripts related to this page -->
<script type="text/javascript">
	function show_box(id) {
	 $('.widget-box.visible').removeClass('visible');
	 $('#'+id).addClass('visible');
	}
</script>
	</body>
</html>

