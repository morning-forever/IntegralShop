<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.net.URLEncoder,  com.bm.webs.bean.integralShop.IntegralGoods"%>
<%@include file="../../../../static/qyy_inc.jsp" %>
<!doctype html>
<html>
<head>
<base href="<%=basePath %>">
<style>
body{
		width:1000px;
		margin:0 auto;	
	}
	.main{ 
		width:1000px; 
		margin-top:10px; 
		margin:0 auto;
	} 
	.nav{
		margin-top:20px;
		color:#999;
	}
	.product{
		margin-top:20px;
	}
	.sml_img{
		
		width:350px;
		height:60px;
		overflow:hidden;
		position:relative;
		top:-60px;
		left:25px;
		
	}
	.img{ width:400px; height:370px;}
	.img1{width:360px;border:1px solid #fff}
	.iicon{
		background:url(<%=basePath%>static/web/images/sprites.png);
		display: inline-block;
		vertical-align: middle;
	}
	.iicon-left{
			background-position:-20px -566px;
			height:60px;	
			width:15px;	
	}
	#toright{
		position:relative;
		left:390px;
		top:-160px;
	}
	#toleft{
		position:relative;
		top:-42px;	
	}
	.iicon-right{
			background-position:-39px -566px;
			height:60px;
			width:15px;
			position:relative;
			left:20px;
			top:19px;
	}
	.i-weixin {
			width: 27px;
			height: 22px;
			background-position: -258px -386px
		}

	.i-qq {
		width: 20px;
		height: 24px;
		background-position: -292px -383px
	}

	.i-weibo {
		width: 24px;
		height: 22px;
		background-position: -317px -385px
	}

	.oblong{
			border:1px solid #e4e4e4;
			width:70px;
			height:18px;
			position:relative;
			top:-30px;
			left:120px;	
	}
	#goodsScore{
			color:#e8a000;
	}
	#subtract{
		border:1px solid #e4e4e4;
		width:20px;
		height:20px;
		border-bottom:#000;
		border-left:#000;
		border-top:#000;
	}
	#add{
		border:1px solid #e4e4e4;
		width:20px;
		height:20px;
		border-bottom:#000;
		border-top:#000;
		border-right:#000;
		position:relative;
		top:-35px;
		left:50px;
	}
		
	#one{
		margin-top:-5px;
		width:30px;
		height:20px;
		position:relative;
		top:-17px;
		left:30px;
	}
	button{
		display:block;
		width:100px;
		height:30px;
		line-height:14px;
		color:#e8a000;
		border:solid 1px #e8a000;
		margin:0 auto;
		position:relative;
		top:10px;
		clear:both;
		font-size:14px;
		padding:0px 8px;
		border-radius:5px;
		background-color:#FFF;
		text-align:center;
		-moz-padding:0 0 10px 0;
	}
	.rightDiv{
		position:absolute;
		left:480px;
		top:70px;	
	}
	.Cutting_line{
		width:1000px;
		position:absolute;
		top:450px;
		color:#999;
	}
	.Cutting_line hr{
		color:#FFF;
	}
	.footprint{
			width:300px;
			border:1px solid #e4e4e4;
			position:absolute;
			left:650px;
			top:580px;
	}
	#myFoot{
		width:300px;
		height:30px;
		border:1px solid #e4e4e4;
		border-top:#000;
		border-left:#000;
	}
	 #myFoot p{
			 position:relative;
			 font-size:16px;
			 color:#666;
			 letter-spacing:2px;left:10px;
	}
	.footprint-goods{
			float:left;
			width:300px;
			height:100px;	
	}
	.footprint-goods p{
			position:relative;
			top:-140px;left:100px;		
	}
	.footprint-goods img{
			width:80px;
			height:80px;
			position:relative;
			left:10px;
			top:10px;	
	}
	.img-pic{
		width:300px;	
	}
	.img-pic p{
		width:300px;
		height:40px;
	}

	
	
</style>
<script type="text/javascript" src="<%=basePath%>static/web/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){
		$("#add").click(function(){
			var number = $("#number").text();
			$("#number").text(parseInt(number)+1);
		});
		
		$("#subtract").click(function(){
			
			var number = $("#number").text();
			if(number>0){
				$("#number").text(parseInt(number)-1);
			}
			
		});
	});
	
	
	//以下是自定义弹出框
	
	function cstmPopUpBox(){
		
		
		
		//1.创建遮罩层
		var mask = $("<div> </div>");
		var width = $(document).width();
		var height = $(document).height();
		mask.css({"background-color":"black","width":width,"height":height,"position":"absolute","zIndex":"10","top":"0px","left":"0px","opacity":"0.9"});
		mask.appendTo($("body"));
		
		
		
		//2.创建弹出框
		var popUpBox = $("<div></div>");
		popUpBox.appendTo($("body"));
		var boxWidth = "230px";
		var boxHeight = "180px";
		popUpBox.css({"background-color":"white","width":boxWidth,"height":boxHeight,"position":"absolute","zIndex":"10","border":"1px solid #e8a000"});
		var top = 130;
		var left = $(document).width()/2 - popUpBox.width()/2+50;
		popUpBox.css({"top":top+"px","left":left+"px"});
		
		//3.创建标题
		var boxTitle = $("<div></div>");
		boxTitle.appendTo(popUpBox);
		boxTitle.css({"width":"100%","height":"30px","background-color":"#e8a000","text-align":"center","line-height":"30px","zIndex":"10","border":"1px,solid #EA0000"});
		boxTitle.text("提示");
		
		//4.创建内容
		var content = $("<div></div>");
		var msg = "对不起，您的桃子数不足！";
		content.css({"font-size":"14px","margin-right":"30px","margin-left":"30px","margin-top":"20px"});
		content.text(msg);
		content.appendTo(popUpBox);
		
		//5.确定按钮
		var cfmBtn = $("<button></button");
		var btnValue = "确定"
		cfmBtn.css({"margin-top":"30px","background-color":"#e8a000","color":"white"});
		cfmBtn.text(btnValue);
		cfmBtn.appendTo(popUpBox);
		cfmBtn.click(function(){
			mask.remove();
			popUpBox.remove();
		});
		
	}
	function toEditOrderUI(){
		
		if(${empty system.webUser}){
			<%
				session.setAttribute("redirect", URLEncoder.encode(basePath+"integralShop/goodsDetail/"+((IntegralGoods)request.getAttribute("goods")).getId(),"utf-8"));
			%>
			window.parent.container.location.href ="<%= request.getContextPath()%>/pc/login?op=toLogin";
			return;
		}
		
		var quantity =  $("#number").html();
		$.post(
				"<%=basePath%>integralShop/pc/exchangeGoods/${goods.id}/"+quantity,
				function(res){
					if(res.status=="success"){
						window.parent.container.location.href = "<%=basePath%>integralShop/pc/editOrderUI/${goods.id}/"+quantity;
					}else{
						cstmPopUpBox();
					}
				}); 
	}
	
	
	function changeImage(obj){
		var image = $(obj).attr("src");
		$(obj).css("border","1px solid 6FF");
		$("#bigImg").attr({"src":image});
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>商品详情</title>
</head>

<body >
<div class="main">
	<div class="nav">
    	当前位置：
        <a>积分商城</a>
            &gt;
        <a>${ goods.goodsType.goodsType}</a>
            &gt;
        <a>商品详情</a>
    </div>
    
    <div class="product">
    	<div class="left">
        	<div class="img">
            	<img  id="bigImg" src="<%=basePath%>${goods.goodsImages[0].imgUrl }" style="width:400px;height:300px; background-color:#6FF"/>
           </div>
           		<!-- <div id="toleft" class="iicon iicon-left"></div>   -->
           <div class="sml_img">
           			<div class="img1">
	           			<c:forEach items="${goods.goodsImages}" var="images">
	           				<img onclick="changeImage(this)" onmouseover="this.style.border='1px solid red'" 
	           												onmouseout="this.style.border='1px solid #FFF'" id="smallImg" 
	           				src="<%=basePath%>${images.imgUrl }"   style="width:60px;height:60px;background-color:#6FF">
	           			</c:forEach>
           			</div>
           </div>
           	<!-- <div id="toright" class="iicon iicon-right"></div> -->
        </div>
         <div class="rightDiv">
        	<p style="font-size:16px; font-weight:bold; margin-top:10px; ">${goods.name }</p>
            <p style=" text-decoration:line-through; font-size:12px; margin-left:16px">市场价：￥${goods.originalPrice }</p>
            <p style="  font-size:12px; margin-left:16px">桃子价：<span id="goodsScore">${goods.currentPrice }</span>个</p>
           		<div style="position:relative;top:40px;">
		    <p style="position:relative;left:65px;font-size:12px;color:#999;">选数量&nbsp;：</p>
            	<div class="oblong">
                	
                	<div id="subtract">
                    	<span style="position:relative;left:6px;top:-2px;color:#999;">-</span>
                    </div>
                    
                    <div id="one">
                    	<span style="font-size:12px;color:#999;" id="number">1</span>
                    </div>
                    
                    <div id="add">
                    	<span style="position:relative;left:4px;top:-2px;color:#999;">+</span>
                    </div>
                </div>
              <p style="font-size:12px;position:relative;top:-60px;left:200px;color:#999;">剩余库存：<span id="">${goods.residueNumber }</span>件</p>
			  </div>
              <button type="submit" onclick="toEditOrderUI()" onmouseover="this.style.backgroundColor='#e8a000';this.style.color='#e4e4e4'" 
              			onmouseout="this.style.backgroundColor='#FFF';this.style.color='#e8a000'"  style="backgroundColor:#FFF;" >立即兑换</button>
        		<p style="font-size:12px;color:#999;position:relative;top:20px;left:20px;">浏览数：<span >${goods.pv }</span></p>
                <p style="font-size:12px;color:#999;position:relative;top:-9px;left:150px;">兑换数：<span>${goods.allNumber-goods.residueNumber }</span></p>
                	<p style="font-size:12px;color:#999;position:relative;top:-40px;left:350px;">分享到：</p>
                    	<div style="position:relative;top:-70px;left:400px;">
                            <div class="iicon i-weixin" ></div>
                            <div class="iicon i-qq"></div>
                            <div class="iicon i-weibo"></div>
                    	</div>
                <p style="color:#999;font-size:12px;position:relative;top:-55px;left:100px;">注：本商品为纯桃子兑换的实物商品,一旦兑换成<br />功,概不退换</p>
        </div>
     </div>
     <div class="Cutting_line">
        <hr style="width:440px;float:left;"/>
        <span style="margin-left:30px;">商品详情</span>
        <hr style="width:440px;float:right;"/>
      </div>
      <div class="goodMsg">
        	<div id="goodsPic">
            	<img style="width:600px;height:auto" src="<%=basePath%>${goods.detailImage }"/>
               	
               		
                </div>
            </div>
            <div class="footprint">
                	<div id="myFoot"><p>我的足迹</p></div>
                   <c:if test="${fn:length(myTracks)>1}">
		                <c:forEach items="${myTracks}" var="track" end="${fn:length(myTracks)-2}">
		                	<c:if test="${goods.id != track.id }">
			                   	<div class="footprint-goods">
			                    	<div class="img-pic" >
			                        	<img src="<%=basePath%>${track.goodsImages[0].imgUrl }"/>
			                                <p style="margin-left:10px;position: relative;top:-70px;">${track.name }</p>
			                                <p style="overflow:hidden;text-overflow:ellipsis; -o-text-overflow:ellipsis;white-space:nowrap;width:200px;top:-100px;">${track.summary }</p>
			                        </div>   	
			                    </div>
		                    </c:if>
	                   	</c:forEach>
                    </c:if>
                  
             </div>
                   
</div>
</body>
</html>
