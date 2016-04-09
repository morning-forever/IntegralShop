<%@include file="../../../../static/qyy_inc.jsp" %>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>确认订单</title>
<style>
	*{
		margin:0;
		padding:0;
	}
	body{
		font-family:微软雅黑;
		font-size:12px;
	}
	.all{
		width:1000px;
		margin:0 auto;
		
	}
	.nav{
		margin-top:50px;
		width:1000px;
		float:left;
		height:30px;
	}
	.nav span{
		
		float:left;
		list-style:none;
		margin:5px;
	}

	a{
		color:#999;
		text-decoration:none; /*去掉下划线*/
	}
	.box{
	width: 250px;
	height: 350px;
	border-right: 1px solid #999;
	position: absolute;
	top: 133px;
	
	}
	.box p{
		width:100px;
		height:	20px;
		border-bottom:1px solid #999;
		margin-left:140px;
		margin-top:20px;
		line-height:5px;
		color:#999;
	}
	.box span{
		float:right;	
	}	
	.goodsbox{
	width: 300px;
	height: 300px;
	position: absolute;
	left: 310px;
	top: 130px;
	}
	.goodsbox p{
		margin:20px;
	}
	.goodsbox img{
		margin-left:25px;
		width:90px;
		height:90px;
	}
	button{
		display:block;
		line-height:20px;
		width:120px;
		height:40px;
		color:#FFF;
		border:solid 1px #e8a000;
		margin:0 auto;
		clear:both;
		position:relative;
		top:420px;
		font-size:14px;
		padding:0px 8px;
		margin-top:20px;
		background-color:#e8a000;
		text-align:center;
		-moz-padding:0 0 10px 0;

	}
	
</style>
<script type="text/javascript" src="<%=basePath%>static/web/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
function submitOrder(){
	$.post("integralShop/submitOrder",
			function(res){
				if(res.status!="success"){
					alert("商品已售完！");
				}else{
					window.parent.container.location.href="integralShop/exchangeSuccess"
				}
	});
	
}
</script>
</head>

<body>
<div class="all">
	<div style="margin-top:10px;">
        	<a href="#">当前位置:</a>
            <a href="#">积分商城&gt;</a>
            <a href="#">旅行装备&gt;</a>
            <a href="#">商品详情&gt;</a>
            <a href="#">确认订单</a>
  </div>
   
  <div class="nav">
        	<span><hr style="width:250px;color:#e4e4e4; position: relative;top:8px;"/></span>
            <span >&nbsp;填写订单&nbsp;</span>
            <span><hr  style="width:250px;color:#3F0;position: relative;top:8px;""/></span>
            <span style="color:#3F0">&nbsp;确认兑换&nbsp;</span>
            <span><hr style="width:250px;color:#e4e4e4;position: relative;top:8px;""/></span>
            <span>&nbsp;完成兑换</span>
    </div>
    
    <div class="box">
    	<p><span>收货地址：</span></p>
        <p><span>邮政编码：</span></p>
        <p><span>收货人	  ：</span></p>
        <p><span>电话号码：</span></p>
        <p><span>订单信息：</span></p>
    </div>
	
    <div class="goodsbox">
    	<p>${orderView.address}</p>
        <p>${orderView.zipCode }</p>
        <p>${orderView.consignee }</p>
        <p>${orderView.tel }</p>
        <p style="position:relative;top:20px;">${orderView.goods.name }&nbsp;X&nbsp;<span style="color:#F00">${orderView.quantity }</span></p>
        <p>所需桃子&nbsp;<span id="score" style="color:#F00">${orderView.goods.currentPrice*orderView.quantity }</span>个</p>
        <div><img  src="<%=basePath%>${orderView.goods.goodsImages[0].imgUrl }"/></div>
        <p style="position:absolute;left:100px;"><a href="#" style="color:#00F" onClick="javascript:history.back(-1);">修改信息</a></p>
    </div>
  <div ><button type="submit" onclick="submitOrder()">确认无误</button></div>
</div>
</body>
</html>
