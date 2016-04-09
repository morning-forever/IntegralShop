<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../../static/inc_web.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="static/web/js/base.js"></script>
</head>
<body>
<form action="" id="1">
	<input name="id">
	<input name="name">
</form>
<form action="" id="2">
	<input name="phone">
	<input name="email">
</form>
<input type="submit" value="提交" id="submit">
<script type="text/javascript">
	$("#submit").click(function(){
		var data=serializeObject($("#1,#2"));
		$.post("pc/test",data,function(data){
			if(data=="success"){
				alert("成功")
			}else{
				alert("失败");
			}
		});
	});
</script>

</body>
</html>