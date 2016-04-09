<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath();
	String contextPath = request.getContextPath();
	System.out.print(basePath+"  --  "+contextPath);
%>

<link href="static/css/bootstrap.min.css" rel="stylesheet" />
<link href="static/css/bootstrap-responsive.min.css" rel="stylesheet" />
<link rel="stylesheet" href="static/css/font-awesome.min.css" />
<link rel="stylesheet" href="static/css/jquery.dataTables.css" />
<!--
[if IE 7]>
  <link rel="stylesheet" href="static/css/font-awesome-ie7.min.css" />
<![endif]-->
<!-- page specific plugin styles -->

<link rel="stylesheet" href="static/css/jquery-ui-1.10.2.custom.min.css" />
<link rel="stylesheet" href="static/css/jquery.gritter.css" />

<!-- ace styles -->
<link rel="stylesheet" href="static/css/ace.min.css" />
<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
<link rel="stylesheet" href="static/css/ace-skins.min.css" />
<!--
[if lt IE 9]>
  <link rel="stylesheet" href="static/css/ace-ie.min.css" />
<![endif]-->


<style type="text/css">

#btnmenu tr td{
	padding: 1px 10px;
	//margin: 5px 5px;
}

#table_report thead tr th{
	text-align: center;
}

#table_report tbody tr td{
	text-align: center;
}

.input-icon input{
	width: 100px;
}

.form-group input{
	height: 15px;
}

.mytable-detail th{
	text-align: right;
	padding-left: 40px;
}
</style>

<script type="text/javascript">
	var sys = sys || {};
	sys.contextPath = "<%=contextPath%>";
	sys.basePath = "<%=basePath%>";
</script>