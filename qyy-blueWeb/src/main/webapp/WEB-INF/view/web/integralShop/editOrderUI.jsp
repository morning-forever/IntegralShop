<%@include file="../../../../static/qyy_inc.jsp" %>
<!DOCTYPE html> 
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>填写订单</title>
<style>
    body{
		font-size:12px;
		font-family:微软雅黑;
	}
	.all{
		width:1000px;
		margin:0 auto;
	} 
	.nav{
		width:800px;
		height:50px;
		margin-left:-40px;
	}
	.nav ul li{
			float:left;list-style:none;color:#999;
	}
	a{
		color:#999;
		text-decoration:none; /*去掉下划线*/
	}
	.flow{
			width:1200px;
			height:50px;
			color:#FFF;
			}
	.flow hr{
				width:260px;
				float:left;
				color:#FFF;
			}
	.flow p{
			margin: 20px;
			float:left;
			margin-top:-3px;
			color:#999;
	}
	.writeMsg{
			width:1000px;
	}
	.Msg{ 
		margin-top:-50px; 
		margin-left:30px;
	}
	.Msg select{  
			margin-left:10px;
			width:80px;
	}
	.Msg td input{ 
			width:100px;
	}
	#address{
			width:260px;
			height:80px; 
			margin-top:10px;
	}
	#postcode{
			width:260px;
			margin-top:10px; 
	}
	#Username{
			width:260px;
			margin-top:10px;
	}
	#phone{
			width:260px;
			margin-top:10px;
	}
	.hint{
		color:#999;
		position:relative;
		top:-130px;
		left:550px;
	}
	.confirmMsg{
			position:relative;
			top:-40px;
			width:1100px;
			height:200px;
			
	}
	.goodsMsgName{
				float:left;
				width:1100px;
				border-bottom:1px solid #e4e4e4;
				height:40px;
	}
	.goodsMsgName p{
				float:left;
				color:#999;
	}
	.goodsPic{
			width:250px;
	}
	.goodsPic img{
				position:relative;top:20px;left:20px;
				width:80px;
				height:80px;
	}
	.goodsPic p {
				color:#999;
	}
	#goodsName{
			color:#666;font-size:16px;
	}
	.one{
		width:30px;
		height:20px;
		border:1px solid #ccc; 
		text-align:center; 
	}
	.add-subtract{
				position:relative;
				left:490px;
				top:-140px;
	}
	#score{
			color:#e8a000;
	}
	.iicon{
			background:url("<%=basePath%>static/web/images/sprites.png");
			display: inline-block;
			vertical-align: middle;
	}
	.i-score{
			background-position:-258px -115px;
			height:16px;	
			width:20px;
	}
	.peach{
			position:relative;
			top:-200px;
			left:960px;
	}
	#button{
		display:block;
		width:90px;
		height:30px;
		line-height:14px;
		color:#e8a000;
		border:solid 1px #e8a000;
		position:absolute;
		left:950px;
		top:180px;		
		clear:both;
		font-size:14px;
		padding:0px 8px;
		margin-top:6px;
		background-color:#FFF;
		text-align:center;
		-moz-padding:0 0 10px 0;
	}
	.address1{
		display:none;
		color:red;
		margin-left: 10px;
	}
	.postcode1{
		display:none;
		color:red;
		margin-left: 10px;
	}
	.username1{
		display:none;
		color:red;
		margin-left: 10px;
	}
	.phone1{
		display:none;
		color:red;
		margin-left: 10px;
	}
	
		
		
    </style>
    <script type="text/javascript" src="<%=basePath%>static/web/js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript">
    	$(document).ready(function(){
    		var summary = $("#summary").html();
    		summary = summary.substring(0,20);
    		$("#summary").html(summary);
    		
    		
    		
    		
    	});
    	
		function add(){
			var numElement = document.getElementById("num");
			var quantity = $(numElement).val();
			$(numElement).val(parseInt(quantity)+1);
			$("#score").text((parseInt(quantity)+1)*${goods.currentPrice});
			
				
		}
		function subtract(){
			var numElement = document.getElementById("num");
			var quantity = $(numElement).val();
			$(numElement).val(parseInt(quantity)-1);
			$("#score").text((parseInt(quantity)-1)*${goods.currentPrice});
		}
		function changeCityList(obj){
			$("#city").empty();
			$("#area").empty();
			$("<option></option>").appendTo($("#city"));
			$.post("integralShop/getCities/"+$(obj).val(),function(data){
				$.each(data,function(index,city){
					$("<option value="+city.cityId+">"+city.city+"</option>").appendTo($("#city"));
				});
			});
		}
		function changeAreaList(obj){
			$("#area").empty();
			$("<option></option>").appendTo($("#city"));
			$.post("integralShop/getAreas/"+$(obj).val(),function(data){
				$.each(data,function(index,area){
					$("<option value="+area.areaId+">"+area.area+"</option>").appendTo($("#area"));	
				});
				
			});
		}
		function onQuantityChange(obj){
			$("#score").text(parseInt($(obj).val())*${goods.currentPrice});
		}
		
		/*  function isAddress(){
			var address=$("#address").val();
			var reg=/[^u4E00-u9FA5]/;
			if(!reg.test(address)){
				$(".address1").show();
				$("#address").focus();
				  return false;
			}else {
			$(".address1").hide();
		} */
		function isAddress(){
			var Address=$("#address").val();
			var reg=/[\u4e00-\u9fa5]/;
			if(!reg.test(Address)){
				$(".address1").show();
				$("#address").focus();
				return false;
			}else {
				$(".address1").hide();
			}
		}
		
		function isName(){
			var Username=$("#Username").val();
			var reg=/[^u4E00-u9FA5]/;
			if(!reg.test(Username)){
				$(".username1").show();
				$("#Username").focus();
				return false;
			}else {
				$(".username1").hide();
			}
		}
		
		function isMobile(){
			var phone=$("#phone").val();
			var reg =/^(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$/;
			if(!reg.test(phone)){
				$(".phone1").show();
				$("#phone").focus();
				return false;
			}else{
				$(".phone1").hide();
			}
		}
		 
    </script>
    
</head>


<body >
<div class="all">
    <div class="nav">
     <ul>
       <li><a href="#">当前位置&nbsp;:</a></li>
       <li><a href="#">&nbsp;积分商城&nbsp;</a>&gt;</li>
       <li><a href="#">&nbsp;${goods.goodsType.goodsType} &nbsp;</a>&gt;</li>
       <li><a href="#">&nbsp;商品详情&nbsp;</a>&gt;</li>
       <li><a href="#">&nbsp;确认订单</a></li>
     </ul>
    </div>
    <div class="flow">
    	<hr style="color:#0F0;"/>
        <p style="color:#0F0;">填写订单</p>
        <hr />
        <p>确认兑换</p>
        <hr />
        <p>完成兑换</p>
    </div>
    <div class="writeMsg">
    <form id="order" name="form" action="integralShop/orderConfirm" method="post" target="container" >
			<input type="hidden" name="goods.id" value="${goods.id }">
		 	<input type="hidden" name="userId" value="${system.webUser.id}">
    		<p style="font-size:18px; ">选择收货地址</p>
    	
        	<div class="Msg">
        		<table>
            	<tr>
                	<td>所在区域<span style="color:#F00">*</span></td>
                     <td> 
                    <select style="margin-left:-1px;" onchange="changeCityList(this)">
                    		<option>
                    		<c:forEach items="${provinces}" var="province">
                    			<option value="${province.provinceId}">${province.province}</option>
                    		</c:forEach>
                    </select>
					<select id="city" onchange="changeAreaList(this)">
						
                     </select>
                     <select id="area" name="area.areaId">
                        
                  	 </select>
				</td>
                 </tr>
                 <br>
               
                <tr>
                	<td>详细街道<span style="color:#F00;">*</span></td>
                    <td ><input id="address"  name="detailStreet" onblur="isAddress()" /><span class="address1">*请输入20字以内的正确地址</span></td>
                </tr><br/>
                
                <tr>
                	<td>邮政编码</td>
                    <td ><input id="postcode" name="zipCode" /></td> 
                </tr><br/>
               		 
                 <tr>
                	<td style=" margin-right:-20px;">收货人姓名</td>
                    <td ><input id="Username" name="consignee" onblur="isName()"/><span class="username1">*请输入您的姓名</span></td>
                </tr>
                	<br/>
                <tr>
                	<td>手机号码<span style="color:#F00;">*</span></td>
                     <td ><input id="phone" name="tel" onblur="isMobile()"/><span class="phone1">*请输入正确的手机号码"</span></td>
                </tr>
               	</table>
            </div>
            <div class="hint">
            	<p>本商品为纯桃子兑换的实物商品,一旦兑换成功,概不退换!</p>
                <p><span style="color:#F00;">*</span>为必填项,请正确填写您的信息。</p>
            </div>
            
            <div class="confirmMsg">
            	<p style="font-size:18px; ">确认商品信息</p>
                <div class="goodsMsgName">
                	<p style="margin-left:30px;">商品信息</p>
                    <p style="margin-left:400px;">商品数量</p>
                    <p style="margin-left:450px;">合计</p>
                </div>
                <div>
                	<div class="goodsPic">
                    	<img src="<%=basePath%>${goods.goodsImages[0].imgUrl}"/>
                       	<div style="position:relative;top:-70px; left:120px;width:200px;">
                            <p id="goodsName">${goods.name }</p>
                            <p style="white-space:nowrap; text-overflow:ellipsis; -o-text-overflow:ellipsis; overflow: hidden;" id="summary">${goods.summary }</p>
                        </div>
                    </div>
                    
                    <div class="add-subtract">
                    	<p style="position:relative;top:32px;left:-15px;"><a href="javascript:void(0)" onClick="subtract()">-</a></p>
                        <input  onchange="onQuantityChange(this)" class="one" id="num" name="quantity" value="${goodsQuantity}">
                        
                        <p style="position:relative;top:-33px;left:40px;"><a href="javascript:void(0)" onClick="add()">+</a></p>
                    </div>
                    <div class="peach">
                  		<div class="iicon i-score" style="width:20px;height:20px;"></div>
                        <span id="score">${totalPrice}</span>
                    </div>
                    
                    <input id="button" type="submit" onmouseover="this.style.backgroundColor='#e8a000';this.style.color='#e4e4e4'" onmouseout="this.style.backgroundColor='#FFF';this.style.color='#e8a000'"  style="backgroundColor:#FFF;" value="确认兑换"></input>
                </div>
                </div>
        </form>
    </div>
	
</div>
	
</body>
</html>
