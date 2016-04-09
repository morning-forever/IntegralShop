// JavaScript Document
$(function(){
	
	$(".chose a.not").click(function(){
		$(".popup-wrap").css("display","none");
	});
	$(".checkbox").click(function(){
		$(this).hasClass("checkedbox")?$(this).removeClass("checkedbox"):$(this).addClass("checkedbox");
	});
	$(".agree i.i-ok").click(function(){
		$(this).hasClass("i-yes")?$(this).removeClass("i-yes"):$(this).addClass("i-yes");
	});
	//下拉框
	$(".select-wrap .select-text").each(function(){
		if( $(this).next("select").find('option').not(function(){ return !this.selected }).length != 0 ){
			$(this).text( $(this).next("select").find('option').not(function(){ return !this.selected }).text() );
		}
	});
	$(".select-wrap select").change(function(){
		var _val = $(this).find('option').not(function(){ return !this.selected }).text();
		$(this).parent(".select-wrap").find(".select-text").text(_val);
	});
	$(".add-rep li,.add-news li").last().addClass("last");
	

});

