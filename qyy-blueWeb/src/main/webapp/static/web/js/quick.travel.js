function findGetStoreHome(obj,countyId,storeId){
	var getCityId=$(obj).val();
	$(obj).prevAll(".select-text").html($(obj).find("option[value="+getCityId+"]").html());
	var id=$(obj).attr("id").replace("City","Store");
	var o={};
	o.id=getCityId;
	o.type = "wrap";//指定地点类型
	$.post("pc/cart/rent/getCounty",o,function(data){
		var list=data.list;
		$("#"+id+" div:eq(0)").html("");
		for(var i=0;i<list.length;i++){
			if(i==0){
				$("#"+id+" div:eq(0)").append('<span  class="current" onclick="selectCountyHome(this,'+storeId+')" val='+list[i].id+'>'+list[i].name+'</span>');
			}else{
				$("#"+id+" div:eq(0)").append('<span onclick="selectCountyHome(this,'+storeId+')" val='+list[i].id+'>'+list[i].name+'</span>');
			}
		}
		initCounty(id);
		//$("#"+id+" div:eq(0) span:eq(0)").click();
		selectCountyHome($("#"+id+" div:eq(0) span[val="+countyId+"]"),storeId);
	})
}

function selectCountyHome(obj,storeId){
	var countyId=$(obj).attr("val");
	var id=$(obj).parents(".popbox").attr("id");
	var type="wrap";//地址类型
	$.post("pc/cart/rent/getStore",{id:countyId,type:type},function(data){
		var list=data.list;
		$("#"+id+" div:eq(1)").html("");
		for(var i=0;i<list.length;i++){
			if(i==0){
				$("#"+id+" div:eq(1)").append('<span class="current" onclick="selectDest(this)" openTime='+list[i].open_time+' phone='+list[i].link_tel+' addr='+list[i].addr_detail+' val='+list[i].id+'>'+list[i].store+'</span>');
			}else{
				$("#"+id+" div:eq(1)").append('<span onclick="selectDest(this)" openTime='+list[i].open_time+' phone='+list[i].link_tel+' addr='+list[i].addr_detail+' val='+list[i].id+'>'+list[i].store+'</span>');
			}
		}
		initCounty(id);
		//$("#"+id+" div:eq(1) span:eq(0)").click();
		$("#"+id+" div:eq(1) span[val="+storeId+"]").click();
	});
}

//--------------------------------------------------

function findGetStore(obj){
	var getCityId=$(obj).val();
	$(obj).prevAll(".select-text").html($(obj).find("option[value="+getCityId+"]").html());
	var id=$(obj).attr("id").replace("City","Store");
	var o={};
	o.id=getCityId;
	o.type = "wrap";//指定地点类型
	$.post("pc/cart/rent/getCounty",o,function(data){
		var list=data.list;
		$("#"+id+" div:eq(0)").html("");
		for(var i=0;i<list.length;i++){
			if(i==0){
				$("#"+id+" div:eq(0)").append('<span  class="current" onclick="selectCounty(this)" val='+list[i].id+'>'+list[i].name+'</span>');
			}else{
				$("#"+id+" div:eq(0)").append('<span onclick="selectCounty(this)" val='+list[i].id+'>'+list[i].name+'</span>');
			}
		}
		initCounty(id);
		$("#"+id+" div:eq(0) span:eq(0)").click();
		//selectCounty($("#"+id+" div:eq(0) span[val="+countyId+"]"),storeId);
	})
}

function selectCounty(obj){
	var countyId=$(obj).attr("val");
	var id=$(obj).parents(".popbox").attr("id");
	var type="wrap";//地址类型
	$.post("pc/cart/rent/getStore",{id:countyId,type:type},function(data){
		var list=data.list;
		$("#"+id+" div:eq(1)").html("");
		for(var i=0;i<list.length;i++){
			if(i==0){
				$("#"+id+" div:eq(1)").append('<span class="current" onclick="selectDest(this)" openTime='+list[i].open_time+' phone='+list[i].link_tel+' addr='+list[i].addr_detail+' val='+list[i].id+'>'+list[i].store+'</span>');
			}else{
				$("#"+id+" div:eq(1)").append('<span onclick="selectDest(this)" openTime='+list[i].open_time+' phone='+list[i].link_tel+' addr='+list[i].addr_detail+' val='+list[i].id+'>'+list[i].store+'</span>');
			}
		}
		initCounty(id);
		$("#"+id+" div:eq(1) span:eq(0)").click();
		//$("#"+id+" div:eq(1) span[val="+storeId+"]").click();
	});
}

var destCount = 0;

//选择目的地时
function selectDest(obj){
	
	if(destCount == 0){
		destCount++;
		return;
	}
	
	//如果从主页面传过来
	if($("#wrapDiv").find("#fromHomeTag").length > 0){
		destCount++;
		//页面的元素没加载完，则不执行
		if(destCount <= parseInt($("#fromHomeTag").val()) ){
			return;
		}
	}
	
	//如果选择的目的地下面还有出发地，则选择目的地时，下面的出发地和目的地都清空
	if( $(obj).parents(".fitemwrap").next(".fitemwrap").find(".item-title").length != 0 ){
		$(obj).parents(".fitemwrap").nextAll(".fitemwrap").remove();
		var template = $("#selectCarBtn").clone();
		template.show();
		$(obj).parents(".fitemwrap").find("div.form-item:eq(1)").after('<span name="addaim" class="addbtn iicon" style="margin-right: 5px;"></span>');
		$(obj).parents(".fitemwrap").find("[name=addaim]").click(addAim);
	}
}

function initCounty(areaDiv){
	$("#"+areaDiv+" .spanwrap span").click(function(e){
		var _text = $(this).text();
		var _phone=$(this).attr("phone");
		var _addr=$(this).attr("addr");
		var _openTime=$(this).attr("openTime");
		stopPropagation(e);
		$(this).parent(".spanwrap").find("span.current").removeClass("current");
		$(this).addClass("current");
		if( $(this).parent(".spanwrap").hasClass("showvalue") ){
			var str="地址："+_addr+"<br>电话："+_phone+"<br>营业时间:"+_openTime;
			$(this).parents(".haspopbox").find(".select-text").text( _text );
			$(this).parents(".showvalue").next(".lh2").html(str);
		}
	});
}
var i = 0;
//增加目的地
function addAim(e){
	var _self = $(e.target);	
	var $dom;	
	$dom = $($("#addaimitem").html()).insertAfter( _self.parent(".fitemwrap") );
	popBoxInit();
	refreshPrevAddr( _self.parent(".fitemwrap") );
	//initSelect( $dom.last() );
	_self.parents(".fitemwrap").find(".resbtn").remove();
	_self.insertBefore( $dom.last().find(".resbtn") );	
	$dom.last().find(".resbtn").click(deleteAim);	
}

//删除目的地
function deleteAim(e){
	var _self = $(e.target);
	var prevAddr = _self.parent(".fitemwrap").prev(".fitemwrap").find(".prevaddr").text();
	_self.parent(".fitemwrap").next(".fitemwrap").find(".prevaddr").text( prevAddr );
	if( _self.prev(".addbtn").length ) {
		_self.prev(".addbtn").insertAfter( _self.parent(".fitemwrap").prev(".fitemwrap").prev(".fitemwrap").find(".select-item:last") );
		//如果只有一个出发地和目的地时，后面的减号不需要
		if($("#wrapDiv [name=startAddrId]").length > 2){
			_self.parent(".fitemwrap").prev(".fitemwrap").prev(".fitemwrap").find("[name=addaim]").after(_self.clone());
		}
	}
	$("#wrapDiv [name=deleteaim]").click(deleteAim);
	_self.parent(".fitemwrap").prev(".fitemwrap").remove();
	_self.parent(".fitemwrap").remove();
	i--;
}

function refreshPrevAddr( $dom ){
	$dom.next(".fitemwrap").find(".prevaddr").text( $dom.find("span[name=destArea]").text()+'(上一个地点的目的地)' );
	$dom.next(".fitemwrap").find("input").val($dom.find("div[name=endAddrId]").find("span.current").attr("val"));
	$dom.next(".fitemwrap").next(".fitemwrap").find("select").attr("id","getCityId"+i);//给每个目的地的市下拉框id命名
	$dom.next(".fitemwrap").next(".fitemwrap").find(".popbox").attr("id","getStoreId"+i);//给每个目的地的目的地下拉框id命名
	findGetStore("#"+$dom.next(".fitemwrap").next(".fitemwrap").find("select").attr("id"));
	i++;
}

/*function initSelect($dom){
	var $parentNode = $dom || $("body");
	//下拉框
	$parentNode.find(".select-item .select-text").each(function(){
		if( $(this).next("select").find("option:selected").length != 0 ){
			$(this).text( $(this).next("select").find("option:selected").text() );
		}
	});
	$parentNode.find(".select-item select").change(function(){
		var _val = $(this).find("option:selected").text();
		$(this).parent(".select-item").find(".select-text").text(_val);
		refreshPrevAddr( $parentNode );
	});
}*/

