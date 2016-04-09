<%@include file="../../../../static/qyy_inc.jsp" %>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>订单记录</title>
<style>
	*{
		margin:0;
		padding:0;
	}
	body{
		font-family:微软雅黑;
		font-size:12px;
		width:1000px;
		margin:0 auto;
	}
	.all{
		width:1000px;
		margin:0 auto;
	}

	#bgPic{
		
		width:1000px;
		height:200px;
		background-image:url("<%=basePath%>static/images/beijing.jpg");
		background-size:100%;	
		 
	}
	 #frosted-glass{   
        width: 1000px;   
        height: 200px;   
        background: inherit;   
        -webkit-filter: blur(3px);   
        -moz-filter: blur(3px);   
        -ms-filter: blur(3px);   
        -o-filter: blur(3px);   
        filter: blur(3px);   
        filter: progid:DXImageTransform.Microsoft.Blur(PixelRadius=4, MakeShadow=false);   
    }
	 
	a{
		color:#000;
		text-decoration:none;
	}
	
	.transbox{
		width: 600px;
		height: 90px;
		position:absolute;
		top:90px;
		left:500px;
	 	color:#FFF;
		background-color:#e4e4e4;;
	 	border: 1px solid #e4e4e4;;
	 	opacity:0.3;
	 	filter:alpha(opacity=30);
		border-radius:50px 0px 0px 50px;
	 }
	#nav{
		position:absolute;
		top:15px;
		left:300px;
		
		
		
	}

	#headPic{
		width:90px;
		height:90px;
		position:absolute;
		top:90px;
		left:500px;
		
		
	}
	#headPic img{
		width:90px;
		height:90px;
		border-radius:50px;
	}
	.myMsg{
		width:500px;
		position:absolute;
		top:110px;
		left:600px;
		
	}
	.myMsg p{
		color:#fff;	
	}
	.goodsBox{
		width:880px;
		height:500px;
		border:1px solid #e4e4e4;;
		position:relative;
		top:50px;
		left:60px;
		min-height:200px;
		height:auto;
		min-width:100px;

	}
	.MsgBox{
		width:880px;
		height:20px;
		border-bottom:1px solid #e4e4e4;	
	}
	.MsgBox p{
		color:#999;	
		
	}
	.click{
		width:10px;
		height:10px;
		border:1px solid #e4e4e4;
		margin-top:5px;
		margin-left:5px;
	}
	.goodsMsgBox{
		width:880px;
		height:100px;
		margin-top:15px;
		
	}
	.goodsMsgBox p{
		color:#999;
	}
	#clickBox{
		width:10px;
		height:10px;	
		position:relative;
		top:-30px;
		border:1px solid #e4e4e4;
		background-color:#FFF;
	}

	.record{
		float:left;
		width:1000px;                   
	}
	
	.iicon{
		background: url(<%=basePath%>static/web/images/sprites.png);
		display: inline-block;
		vertical-align: middle;
	}
	.iicon-trash{
		background-position:-118px -570px;
		height:20px;	
		width:20px;
	}
	.goods-details{
		border:1px solid #e4e4e4;
		height:80px;
	}
	#goodsImg{
		
		position:relative;
		
	}
	#goodsImg img{
		position:relative;
		
	}
	#goodsName{
		width:300px;
		position:relative;
		left:120px; 
		top:-48px;
		font-size:14px;
		color:#000;
	}
	#goodsDescribe{
		width:100px;
		color:#999;
		white-space:nowrap; 
		overflow:hidden; 
		text-overflow:ellipsis;
		position:relative;
		left:120px;
		top:-40px;
	}
	#orderNum{
		width:100px;
		position:relative;
		left:280px;
		top:-63px;	
	}
	#goodsBuyNum{
		width:50px;
		position:relative;
		left:460px;
		top:-82px;	
	}
	#goodsScore{
		width:100px;
		position:relative;
		left:590px;
		top:-95px;
	}
	#deal{
		width:100px;
		position:relative;
		left:705px;
		top:-113px;	
	}
	.see{
		position:relative;
		left:800px;
		top:-145px;
		width:100px;
	}
	.waybillNumber{
		width:100px;
		height:20px;
		position:absolute;
		left:770px;
		top:-10px;
		display:none;
		color:#55F;
	}
	
	
	
</style>

<script type="text/javascript" src="<%=basePath%>static/web/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
	 $(document).ready(function(){
		 $(".see").each(function(){
			 var seeId = $(this).attr("id");
			 var waybillNumId="waybillNum"+seeId.substring(3,seeId.length);
			 $(this).hover(function(){
				 $("#"+waybillNumId).show();
			 },function(){
				 $("#"+waybillNumId).hide();
			 });
			 
		 });
	 });
	 
	function  receiveGoods(id){
		$.post(
				"integralShop/userReceiveGoods/"+id,
				function(res){
					if(res.status=="success"){
						window.location="integralShop/exchangeRecord";
					}else{
						alert("确认失败");
					}
				});
	}
	
	function deleteRecord(id){
		$.post(
				"integralShop/deleteRecord/"+id,
				function(res){
					if(res.status=="success"){
						window.location="integralShop/exchangeRecord";
					}else{
						alert("删除失败");
					}
				});
	}
	
</script>
</head>

<body>
<div class="all">
	<div id="bgPic">
    	<div id='frosted-glass'></div>
        <div class="transbox"></div>
     
       	 	<div id="nav">
        		<a href="" target="parent">首页&gt;</a>
            	<a href="#">我的积分商城</a>
    		</div>
            <p style="color:#000;position:relative;left:480px;;top:-150px;color:#FFF;">个人信息</p>
            	<div id="headPic">
            		<img src="<%=basePath%>${system.webUser.headImg}"/>
             	</div>
             <div class="myMsg">
                <p style="font-size:16px;">${system.webUser.nickname }</p>
                <p style="position:relative;top:5px;">级&nbsp;&nbsp;别：<span id="level">${userLevel.levelDesc }
                </span></p>
                <p style="position:relative;top:-12px;left:250px;">桃子数：<span id="score">${user.score }</span></p>
                <p style="color:#00F;" >积分明细</p>
                
             </div>
             
             <div style=";float:left;height:50px;width:1000px; 	">
             	<hr style="width:400px;color:#e4e4e4;position:relative;top:10px;left:60px;"/>
                <p style="margin-left:48%;">兑换记录</p>
                <hr style="width:400px;color:#e4e4e4; float:right;position:relative;top:-8px;left:-55px;"/>
             </div>
         </div>  
         	
              <div class="goodsBox">
             	<div class="MsgBox">
                	<div class="click"></div>
                   		 <p style="position:absolute;left:120px;top:5px;">商品<p>
                         <p style="position:absolute;left:300px;top:5px;">订单号</p>
                   	 	 <p style="position:absolute;left:450px;top:5px;">数量</p>
                   	 	 <p style="position:absolute;left:580px;top:5px;">桃子数</p>
                   		 <p style="position:absolute;left:700px;top:5px;">交易状态</p>
                         <p style="position:absolute;left:800px;top:5px;">操作</p>
                    	 <div class="iicon iicon-trash" style="position:absolute;left:850px;top:5px;"></div>
                </div>
                <c:forEach items="${exchRcds }" var="record">
                	<div class="goodsMsgBox">
                    <div id="goodsImg">
                    	<input id="clickBox"/>
                    	<img src="<%=basePath%>${record.goods.goodsImages[0].imgUrl}" style="width:80px;height:80px;border:1px solid #55F;"/>
                    	
                           <p id="goodsName" >${record.goods.name }</p>
                            <p id="goodsDescribe">${record.goods.summary }</p>
                            <p id="orderNum">${record.orderId }</p>
                   		 <p id="goodsBuyNum">${record.quantity }</p>
                    	<p id="goodsScore">${record.quantity*record.goods.currentPrice }</p>
                    	<c:if test="${record.exchRcdStatus eq 1 }">
                    		 <p id="deal">待发货</p>
                    	</c:if>
                    	<c:if test="${record.exchRcdStatus eq 2 }">
                    		  <p id="deal">已发货</p>
                    	</c:if> 
                       <c:if test="${record.exchRcdStatus eq 3 }">
                    		  <p id="deal">交易成功</p>
                    	</c:if>
                    	<c:if test="${!(record.exchRcdStatus eq 2)}">
                    		<p id="see${record.id }" class="see" onmouseover="javascript:void(0)" >查看</p>
                       		<button style="position:relative;left:790px;top:-145px;color:gray;" onclick="javascript:void(0)" >确认收货</button>
                    	</c:if>
                    	<c:if test="${record.exchRcdStatus eq 2 }">
                    		<p id="waybillNum${record.id }" class="waybillNumber">物流号:<span>${record.waybillNumber }</span></p>
                    		<p id="see${record.id }" class="see" style="color:red" >查看</p>
                       		<button style="position:relative;left:790px;top:-145px;color:red;" onclick="receiveGoods(${record.id})">确认收货</button>
                    	</c:if>
                        
                        <div class="iicon iicon-trash" style="position:relative;top:-145px;left:795px;" onclick="deleteRecord(${record.id})"></div>
                        
                    	</div>
                 </div>
                 
         		</c:forEach>  
              
                 
                 
              </div>  
            
</div>

</body>
</html>
