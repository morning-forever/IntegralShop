/*页面重新绑定事件*/
$(".popbox .spanwrap span").click(initCounty());

$(document).ready(function(){
	//初始化拼车城市
	var poolFromCity = $("#poolFromCity");
	var poolToCity = $("#poolToCity");
	
	poolToCity.attr({onchange:"changeCity(this)"});
	
	$.post("allowAccess/allCityList",{},function(req){
		poolFromCity.empty();
		poolToCity.empty();
		poolFromCity.append('<option value="0">------请选择------</option>');
		poolToCity.append('<option value="0">------请选择------</option>');
		var list = req.cityAllList;
		for(var i in list){
			var item = '<option value="'+list[i].id+'">'+list[i].name+'</option>';
			if(list[i].name=='贵阳市')
				poolFromCity.append(item);
			poolToCity.append(item);
		}
	},"JSON");
	
});

/*选择城市*/
var changeCity = function(obj){
	var cityId=$(obj).val();
	var poolDiv = $("#poolDiv");
	poolDiv.find("#county").html("");
	poolDiv.find("#selectStroge").html("请选择取车门店");
	$.post("allowAccess/countyList",{"cityId" :cityId },function(data){
		var list=data.data;
		if(list == null || list == ''){
			poolDiv.find("#county").html('暂无');
			poolDiv.find("#stroge").html('暂无');
			poolDiv.find("#detail").html('暂无');
		}
		for(var i=0;i<list.length;i++){
			if(i==0){
				poolDiv.find("#county").append('<span onclick=clickCounty(this); class="current" val='+list[i].id+'>'+list[i].county+'</span>');
			}else{
				poolDiv.find("#county").append('<span onclick=clickCounty(this); val='+list[i].id+'>'+list[i].county+'</span>');
			}
		}
		poolDiv.find("#county span:eq(0)").click();
	});
};

/*选择区域*/
var clickCounty = function(obj){
	var poolDiv = $("#poolDiv");
	poolDiv.find("#stroge").html("");
	$.post("allowAccess/addrsOfCar",{"countyId":$(obj).attr("val"),"type":"bus"},function(data){
		var list=data.addrsList;
		poolDiv.find("#detail").empty();
		if(list == null || list == ''){
			poolDiv.find("#detail").html('暂无');
		}
		for(var i=0;i<list.length;i++){
			if(i==0){
				poolDiv.find("#stroge").append('<span name="strogeDetail" class="current" openTime='+list[i].openTime+' phone='+list[i].linkTel+' addr='+list[i].addrDetail+' val='+list[i].id+'>'+list[i].store+'</span>');
				poolDiv.find("#detail").append("地址："+list[i].addrDetail+"<br>电话："+list[i].linkTel+"<br>营业时间:"+list[i].openTime);
				$("#addrsId").val(list[i].id);
			}else{
				poolDiv.find("#stroge").append('<span  openTime='+list[i].openTime+' phone='+list[i].linkTel+' addr='+list[i].addrDetail+' val='+list[i].id+'>'+list[i].store+'</span>');
			}
		}
		poolDiv.find("#stroge .current").click();
		initCounty();
	});
};

/*初始弹出div层的选择联动*/
function initCounty(){
	$(".popbox .spanwrap span").click(function(e){
		var _text = $(this).text();
		var _phone=$(this).attr("phone");
		var _addr=$(this).attr("addr");
		var _openTime=$(this).attr("openTime");
		stopPropagation(e);
		if('strogeDetail' == $(this).attr("name")){
			console.info($(this).attr("val"));
			$("#addrsId").val($(this).attr("val"));
		}
		$(this).parent(".spanwrap").find("span.current").removeClass("current");
		$(this).addClass("current");
		if( $(this).parent(".spanwrap").hasClass("showvalue") ){
			var str="地址："+_addr+"<br>电话："+_phone+"<br>营业时间:"+_openTime;
			$(this).parents(".haspopbox").find(".select-text").text( _text );
			$(this).parents(".showvalue").next(".lh2").html(str);
		}
	});
}