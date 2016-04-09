<%@include file="../../../../static/qyy_inc.jsp" %>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>兑换成功</title>
<style type="">
		*{
		margin:0;
		padding:0;
		}
	body{
		
		font-family:微软雅黑;
		font-size:12px;
		
		
		}
    	
		.hx{
			
			margin-top:40px;
			width:1500px;
			}
		hr{
			color:#e4e4e4;
			}
		
		li{
			float:left;
			list-style:none;
			text-align:center;
			}
		.wire{
			width:270px;
			margin-top: 8px;
			margin:10px;
		}
		.rec{
			margin-left: 175px;
		}
		.pic1{
			margin-left: 150px;
		}
		.hot{
			margin-top: 50px;
			
			font-size: 14px;
		}
		.hot_pic{
			width:250px;
			height:250px;
			background-color:#3FF;
		}
		.hot_goods{
			float: left;
		}
		.pic{
			width:320px;
			height:300px;
			margin:10px;
			}
		#else{
			float:left;
			width:330px;
			height:300px;
			
			}
		.iicon{background:url(<%=basePath%>static/web/images/sprites.png);
				display: inline-block;
				vertical-align: middle;
			
			}
		.iicon-right{
			background-position:-390px -566px;
			height:28px;	
			width:28px;
			
		}
		.back_ble{margin-left:18%;}
		
		
</style>
<script type="text/javascript" src="<%=basePath%>static/web/js/jquery-1.11.1.min.js"></script>
</head>


<body>
<div style="margin:0 auto;width:1000px;">
	<div style="margin-top:20px">
        	<a src="#"> 当前位置:</a>
            <a src="#">积分商城&gt;</a>
            <a src="#">旅行装备&gt;</a>
            <a src="#">商品详情&gt;</a>
            <a src="#">确认订单</a>

    </div>
    <div class="hx" >
    	<ul>
        	<li class="wire"><hr/></li>
            <li>填写订单</li>
            <li class="wire"><hr/></li>
            <li>确认兑换</li>
            <li class="wire"><hr style="color:#0F0;"/></li>
            <li  style="color:#3F0">完成兑换</li>
        </ul>
    </div><br />
    	
    <div class="back_ble">
    	<div class="iicon iicon-right" style="position:relative;top:20px;right:700px;"></div>
    	<p style="position:relative;left:130px;">恭喜您兑换成了,小黔将尽快为您配送!</p>
    	<p style="margin-top: 20px">收货地址：<span>${orderView.address } &nbsp;&nbsp;&nbsp; ${orderView.consignee } &nbsp;&nbsp;&nbsp;  ${orderView.tel }</span></p>
    	
    	<p class="rec" style="margin-top: 50px;"><span>您还可以  
    	<a href="integralShop/exchangeRecord" style="color: blue;cursor: pointer" target="container" >兑换记录</a>
    	<a href="javascript:void(0)" style="color: blue;">查看订单详情</a>
    	</span></p>
    </div><br />
    <div style="margin-top:30px;">
    	<p><span style="position:relative;left:10px;">其他热门兑换</span></p>
        <div id="else">
           <a href="#"> <img class="pic" src="../../../../static/img/macbook_pro-007.jpg"/></a>
         </div>
         <div id="else">
           <a href="#"> <img class="pic" src="../../../../static/img/macbook_pro-007.jpg"/></a>
         </div>
         <div id="else">
            <a href="#"><img class="pic" src="../../../../static/img/macbook_pro-007.jpg"/></a>
         </div>
    </div><br />
    	
</div>
</body>
</html>
