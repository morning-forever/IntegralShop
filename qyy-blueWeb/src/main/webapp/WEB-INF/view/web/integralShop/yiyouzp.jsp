<%@include file="../../../../static/qyy_inc.jsp" %>
<!DOCTYPE html> 
<html>
<head>
	<base href="<%=basePath %>">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>static/web/css/qyy_css/normalize.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>static/web/css/qyy_css/yiyouzp.css">
	<script type="text/javascript" src="<%=basePath%>static/web/js/jquery-1.11.1.min.js"></script>
	<title>填写订单</title>
	<script type="text/javascript">
		
		function enterGoodsDetail(id){
			window.parent.container.location.href="<%=basePath %>"+"integralShop/goodsDetail/"+id;
		}
	
	</script>
	
</head>
<body>
	<header id="header">
		当前位置&#58;积分商城&gt;易游专品
		<br>
		<br>
		<c:if test="${!empty system.webUser }">
			<p id="greetWithUser">亲爱的<em id="userNickName">${system.webUser.nickname }</em>，您当前可用桃子数为<em id="userScore">${user.score }</em></p>
		</c:if>
		
		<c:if test="${empty system.webUser }">
			<p id="greetWithUser">亲爱的，<a id="userNickName" style="text-decoration: none;" href="integralShopLogin" target="container">请登录!</a></p>
		</c:if>
		
		
		<ul id="orderManner">
			<li id="orderManner1"><label id="labelOfOrder">排序</label>&#58;</li>
			<li class="orderMannerFirst"><a>默认</a></li>
			<li class="orderManner"><a>人气∨</a></li>
			<li class="orderManner"><a>积分∧</a></li>
		</ul>
	</header>
	
	
	<ul id="content">
		<c:forEach items="${yyzpGoods}" var="goods">
			<li class="goodsItem">
				<img class="goodsImage" alt="" src="<%=basePath%>${goods.goodsImages[0].imgUrl }" width="300px" height="240px">
				<label class="goodsName">${goods.name }</label>
				<br>
				<br>
				<span  class="residue"><label>还剩：</label><em style="color: #e8a000;">${goods.residueNumber }</em><label>件</label></span><span class="goodsScore"><label>桃子数：</label><em style="color:#e8a000;">${goods.currentPrice }</em><label>个</label></span>
				
				<button class="exchBtn" onclick="enterGoodsDetail(${goods.id})">立即兑换</button>
			</li>
		</c:forEach>
	</ul>
	<div style="clear:left;"></div>
</body>
</html>
