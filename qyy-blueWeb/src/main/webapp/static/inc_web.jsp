<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath()+"/";
	String contextPath = request.getContextPath();
	
	System.out.println("----------------"+basePath+"  --  "+contextPath+"  -- "+request.getRequestURL());
	
	boolean isShow = request.getRequestURI().lastIndexOf("/web/home.jsp") > 0;
	request.setAttribute("isShow", !isShow);
	
	boolean isInteract = request.getRequestURI().lastIndexOf("/interact/interact_home.jsp")>0;
	boolean isInteract1 = request.getRequestURI().lastIndexOf("/interact/master_raiders.jsp")>0;
	
	request.setAttribute("isInteract", isInteract || isInteract1);
	
	
%>
<!--
[if IE 7]>
  <link rel="stylesheet" href="static/css/font-awesome-ie7.min.css" />
<![endif]-->
<!-- page specific plugin styles -->
<!--
[if lt IE 9]>
  <link rel="stylesheet" href="static/css/ace-ie.min.css" />
<![endif]-->

<script type="text/javascript" src="<%=basePath %>static/web/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="<%=basePath %>static/login/js/jquery.cookie.js"></script>
<script type="text/javascript" src="<%=basePath %>static/js/jquery.tips.js"></script>
<script type="text/javascript">
	var sys = sys || {};
	sys.contextPath = "<%=contextPath%>";
	sys.basePath = "<%=basePath%>";
</script>