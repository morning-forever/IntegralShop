<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../../../static/qyy_inc.jsp" %>

<!doctype html>
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="<%=basePath %>static/web/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" >
	var currentIndex=0;
	$(document).ready(function(){
		//商品描述超出固定字符数省略号代替
		$(".goodsDesc").each(function(index){
			var str=$(this).text();
			if(str.length>55){
				$(this).text(str.substring(0,50)+"……");	
			}
		});
		
		//点击左箭头滑动banner
		$(".prev").click(function(){
			changeTo(currentIndex+1)
		});
		
		//当鼠标放在左箭头上时
		$(".prev").hover(function(){
			clearInterval(autoSlide);
		},function(){
			autoSlideRestart();
		});
		
		//点击右箭头滑动banner
		$(".next").click(function(){
			changeTo(currentIndex-1);
		});
		
		//当鼠标放在右箭头上时
		$(".next").hover(function(){
			clearInterval(autoSlide);
		},function(){
			autoSlideRestart();
		});
		
		//给索引圆圈绑定事件
		$("#indexList").find("li").each(function(index){
			
			//点击事件
			$(this).click(function(){
				changeTo(index);
			});	
			
			//hover事件
			$(this).hover(function(){
				clearInterval(autoSlide);
			},function(){
				autoSlideRestart();
			});
			
		});
		
		
		//自动切换
		var autoSlide= setInterval(function(){
			
			if(currentIndex<${fn:length(banners)-1}){
				index=currentIndex+1;
				changeTo(index);
			}else{
				index=0;
				changeTo(index);
			};
		}, 3000);
		
		/* $("#indexList").find("li").each(function(index){
			
		}); */
		
		//重新开启自动滑动
		function autoSlideRestart(){
			autoSlide= setInterval(function(){
				
				if(currentIndex<${fn:length(banners)-1}){
					index=currentIndex+1;
					changeTo(index);
				}else{
					index=0;
					changeTo(index);
				};
			}, 3000);
		}
	});
	
	//根据索引切换图片
	function changeTo(index){
		if(0<=index && index<${fn:length(banners)}){
			
			//修改前将当前索引变白
			$("#"+currentIndex).css("background-color","#fff");
			
			//修改当前索引
			currentIndex=index;
			
			//设置左边距离
			var left=currentIndex*1000;
			
			//滑动
			$("#imgList").animate({left:"-"+left+"px"},500);
			
			//索引圆圈变色
			$("#"+currentIndex).css("background-color","green");
		}
	}
	
	//进入商品详情页
	function enterGoodsDetail(id){
		window.parent.container.location.href="<%=basePath %>integralShop/goodsDetail/"+id;
	}
</script>
<link rel="stylesheet" type="text/css" href="<%=basePath %>static/web/css/qyy_css/index.css">

<title>首页</title>
</head>
<body >
	<div id="first">
		<div id="banner" >
			<ul id="imgList" style="width:${fn:length(banners)*1000}px;"> 
				<c:forEach items="${banners}"  var="banner" varStatus="st">
					<li><img alt="banner${st.index}" src="<%=basePath %>${banner.url}" width="1000px" height="400px"></li>
				</c:forEach>
			</ul>
			<a class="iicon prev"></a><a class="iicon next"></a>
			<ul id="indexList">
				<c:forEach items="${banners}" varStatus="st">
					<li id="${st.index}" class="indexFollow-up index"></li>
				</c:forEach>
			</ul>
		</div>
		 <div id="user">
			 <c:if test="${empty system.webUser}">
			 	<img id="headImg" alt="" src="<%=basePath %>static/web/images/headimg.png"  border="1px">
				<a id="loginBtn" href="<%=basePath %>integralShopLogin" target="container">立即登录</a>
				<span id="register">还没有账号？<a id="registBtn">立即注册</a></span>
			 </c:if>
			 <c:if test="${!empty system.webUser}">
			 	<img id="headImg" alt="" src="<%=basePath %>${system.webUser.headImg}"  border="1px">
			 	<span style="margin-left: 52px;margin-right: 55px;margin-top: 30px;display: block;">你好,<a href="pc/user/home">${system.webUser.nickname}</a></span>
			 	<br>
			 	<a style="margin-left: 52px" href="integralShop/exchangeRecord" target="container">兑换记录</a>
			 </c:if>
				
		</div>
	</div>
	
	<div id="content" >
			<!-- 推荐商品 -->
			<div><img alt="startImage" src="<%=basePath %>static/web/images/start_image.png" style="vertical-align: middle;"><span style="vertical-align: middle; margin-left: 3px; color:black; "><b>推荐商品</b></span></div>
			<c:if test="${!empty rcmdGoods }">
				<div id="rcmdGoods">
					<div id="rcmdGoodsImage" >
						<img class="rcmdGoodsImage" alt="图片"  src="<%=basePath %>${rcmdGoods.goodsImages[0].imgUrl }" width="400px" height="240px">
					</div>
					<div id="rcmdGoodsDetail">
						<span id="rcmdGoodsName">${ rcmdGoods.name}</span><br>
						<p id="rcmdGoodsDesc">&nbsp;&nbsp;&nbsp;&nbsp;${rcmdGoods.summary }</p><br>
						<span id="exchBtn"  onclick="enterGoodsDetail(${rcmdGoods.id})">立即兑换</span>
					</div>
				</div>
			</c:if>
			
			<br>
			
			<!-- 新品上架-->
			<div><img alt="startImage" src="<%=basePath %>static/web/images/start_image.png" style="vertical-align: middle;"><span style="vertical-align: middle; margin-left: 3px; color:black; "><b>新品上架</b></span></div>
		  	<div id="newShelves">
		  		<c:forEach items="${newShevelsGoods}" var="goods" >
		  			<div class="goodsItem">
						<img alt="" src="<%=basePath %>${goods.goodsImages[0].imgUrl }"  height="200px" class="goodsImg">
						<span class="goodsName">${goods.name }</span><br>
						<p class="goodsDesc">&nbsp;&nbsp;&nbsp;&nbsp;${goods.summary }</p>
						<a class="exchBtn" href="<%=basePath %>integralShop/goodsDetail/${goods.id}" target="container">立即兑换</a>
					</div>
		  		</c:forEach>
			</div>
		<!--创意商品 -->
			<br>
			<div><img alt="startImage" src="<%=basePath %>static/web/images/start_image.png" style="vertical-align: middle;"><span style="vertical-align: middle; margin-left: 3px; color:black; "><b>创意商品</b></span></div>
		  	<div id="newShelves">
		  		<c:forEach items="${originalityGoods }" var="goods">
		  			<div class="goodsItem">
						<img alt="" src="<%=basePath %>${goods.goodsImages[0].imgUrl } "  height="200px" class="goodsImg">
						<span class="goodsName">${goods.name }</span><br>
						<p class="goodsDesc">&nbsp;&nbsp;${goods.summary }</p>
						<a class="exchBtn" href="integralShop/goodsDetail/${goods.id}" target="container">立即兑换</a>
					</div>
		  		</c:forEach>
			</div>	
			<div style="height: 20px"></div>
	</div>
	
</body>
</html>