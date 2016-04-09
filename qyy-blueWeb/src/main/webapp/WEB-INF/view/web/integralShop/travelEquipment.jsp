<%@include file="../../../../static/qyy_inc.jsp" %>
<!DOCTYPE html >
<html >
<head>
<base href="<%=basePath %>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>积分商城首页</title>
<style>
	*{
	margin:0;
	padding:0;
	}
	body{
		font-family:微软雅黑;
		font-size:12px;
		
		}
	a{
		color:#00F;
		}
	
	li{
		float:left;
		  list-style:none;
		
		}
	.my1{
		border:1px solid #e4e4e4 ;
		color:#F90;
		}
	.my{
		border:1px solid #e4e4e4 ; 
		}
	.my2{
		float:right;
		}
		
	.picture{
			width:320px;
			height:360px;
			border:1px solid #e4e4e4 ;
			float:left;
		}
	img{
		width:300px;
		height:240px;
		
		}
	.p1{
		color:#F90;
		}
	.wz{
		width:300px;
		}	
	.px{
		 position:relative;clear:both;
		 width:1000px;
		 margin:0 auto;
		 margin-top:20px;
		 }
	.cont{ width:1000px; margin-left:auto; margin-right:auto; }
	.product{ width:320px; height:360px; border:solid 1px #e4e4e4; margin-right:10px; float:left;margin-top:10px;}
	.pic{ width:300px; height:240px; margin:10px;}
	.name{ display:block; width:300px; margin-left:auto; margin-right:auto; margin-top:10px;}
	.jiage{
			float:left;
		}
	.peach{float:right;}
	
	button{
		display:block;
		width:80px;
		height:28px;
		line-height:14px;
		color:#e8a000;
		border:solid 1px #e8a000;
		 margin:0 auto;
		 clear:both;
		float:right;
		font-size:14px;
		padding:0px 8px;
		margin-top:6px;
		border-radius:5px;
		background-color:#FFF;
		text-align:center;
		-moz-padding:0 0 10px 0;
		 
		
		
		}	
	.entirety{	
	 position:relative;clear:both;
	 	width:300px;
	 }
</style>
<script type="text/javascript">
	
	function enterGoodsDetail(goodsId){
		window.parent.container.location.href="integralShop/goodsDetail/"+goodsId;
	}

</script>
</head>
<body>
<!-- page content -->
	
    <div class="cont"> 
        <div>
            <p style="margin-top:10px">当前位置：积分商城&gt;旅行装备</p><br />
            <c:if test="${!empty system.webUser}">
            	<p align="center">亲爱的 <a id="userId" name="name" >${system.webUser.nickname }</a>&nbsp;你当前的可以用桃子数为&nbsp;<span id="userId" name="score" style="color:#e8a000;">${user.score }</span>.</p> 
            </c:if>
            <c:if test="${empty system.webUser }">
           	 <p align="center">亲爱的, <a style="text-decoration: none" name="name" href="integralShop/integralShopLogin" target="container">请登录！</a></p> 
            </c:if>
        </div>
        
         <div>
    	<ul style="margin-top:10px">
        	<li>排序：</li>
        	<li class="my1" onmouseover="this.style.color='#e8a000'" onmouseout="this.style.color='#000000'"  style="color:#000000;">默认</li>
            <li class="my" onmouseover="this.style.color='#e8a000'" onmouseout="this.style.color='#000000'"  style="color:#000000;">人气∧</li>
            <li class="my" onmouseover="this.style.color='#e8a000'" onmouseout="this.style.color='#000000'"  style="color:#000000;">积分∨</li>
        </ul>
        </div>
    	</div>
       
   
    	<div class="px" >
    	
    	<c:forEach items="${travEqpmtGoods }" var="goods">
			<div class="product">
				<div class="pic">
					<img src="<%=basePath%>${goods.goodsImages[0].imgUrl }" />
				</div>

				<span class="name">
					${goods.name } </span>
				<div class="name">
					<div class="jiage">
						<ul>
							<li>还剩:</li>
							<li style="color: #C90" id="goodsId" name="name">${goods.residueNumber }</li>
							<li>件</li>
						</ul>
					</div>
					<div class="peach">
						<ul>
							<li>桃子数:</li>
							<li style="color: #C90" id="userId" name="score">${goods.currentPrice }</li>
							<li>个</li>
						</ul>

					</div>
					<button type="button"
						onmouseover="this.style.backgroundColor='#e8a000';this.style.color='#e4e4e4'"
						onmouseout="this.style.backgroundColor='#FFF';this.style.color='#e8a000'"
						style="backgroundColor: #FFF;" onclick="enterGoodsDetail(${goods.id})">立即兑换</button>

				</div>

			</div>
		</c:forEach>
    	
  
    
   		</div>
    
  
   
 
 
    	
    
    
    
    	
 	   
    
 
 
  


</body>
</html>
