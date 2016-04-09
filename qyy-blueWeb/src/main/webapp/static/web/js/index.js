/* 
* 幻灯片
*/
function scrollBannerInit( $bannerList,$bannerBtnWrap,callback ){
	var curIndex = 0;
	var scrollTimer = 0;
	var animateTime = 600;
	var switchTime = 5000;
	var banner_num = $bannerList.find("li").length;
	
	// banner_btn UI init
	var s = '';
	for(var i=0; i<banner_num; i++){
		s += '<span></span>';
	}
	$bannerBtnWrap.append( s );	
	$bannerBtnWrap.find("span:first").addClass("current");
	$bannerList.find("li:first").addClass("current").show();
	
	scrollTimer = window.setInterval( bannerScroll,switchTime);

	$(".banner_wrapper").mouseenter(function(){
		$(".scroll_l").stop().animate({"marginLeft":0},300);
		$(".scroll_r").stop().animate({"marginRight":0},300);				
	}).mouseleave(function(){
		$(".scroll_l").stop().animate({"marginLeft":-40},300);
		$(".scroll_r").stop().animate({"marginRight":-40},300);
	});

	//banner_btn
	$bannerBtnWrap.find("span").mouseenter(function(){		
		curIndex = $(this).index();
		bannerScroll();
		if( scrollTimer ){
			window.clearInterval( scrollTimer );
		}
		scrollTimer = window.setInterval( bannerAutoScroll,switchTime );					
	});
	
	//leftBtn,rightBtn
	$(".scroll_l,.scroll_r").click(function(){
		if( $(this).hasClass("scroll_l") ){ // left click
			curIndex --;
			if( curIndex == -1 ){
				curIndex = banner_num-1;
			}
		} else { // right click
			curIndex ++;
			if( curIndex == banner_num  ){
				curIndex = 0;
			}
		}
		bannerScroll();	
		if( scrollTimer ){
			window.clearInterval( scrollTimer );
		}		
		scrollTimer = window.setInterval( bannerAutoScroll,switchTime );		
	});
	
	function bannerScroll(){
		if( curIndex == $bannerList.find("li.current").index() ) return;
		// flag switch		
		$bannerBtnWrap.find("span").removeClass("current");
		$bannerBtnWrap.find("span").eq( curIndex ).addClass("current");	

		//img switch
		$bannerList.find("li").removeClass("prev");
		$bannerList.find("li.current").removeClass("current").addClass("prev");	
		$bannerList.find("li").eq( curIndex ).addClass("current").fadeIn(animateTime,function(){
			$bannerList.find("li.prev").hide().removeClass("prev");
		});

		//callback
		if( callback && typeof callback ){
			callback(curIndex);
		}				
		
	}

	function bannerAutoScroll(){
		if( curIndex == banner_num ){
			curIndex = 0;
		}
		bannerScroll();
		curIndex ++;
	}
}




$(function(){
    //关闭二维码
	$(".twovcode .close").click(function(){
		$(".twovcode").hide();
	});

	//回到顶部
	$(".totop").click(function(){
		$('body,html').animate({scrollTop:0},1000);
	    return false;
	});

	//消息中心 tabs切换
	$(".tabs li").click(function(){
	 	var i = $(this).index();
	 	$(this).addClass("current");
	 	$(this).siblings().removeClass("current");
	 	$(".tabs-cont").hide();
	 	$(".tabs-cont").eq(i).show();
	 });

	//帮助中心
	$(".help-center li").find(".toggle").click(function(){
		if ($(this).prev().children(".a").is(":visible")) {
			$(this).prev().children(".a").fadeOut();
		}else{
			$(this).prev().children(".a").fadeIn();
		}
	});

	//账户设置
	$(".toStep2").click(function(){
		$(this).parent().parent().siblings(".status").find("li").eq(1).addClass("current");
		$(this).parent().parent().hide();
		$(this).parent().parent().next().show();
	});
	$(".toStep3").click(function(){
		$(this).parent().parent().siblings(".status").find("li").eq(2).addClass("current");
		$(this).parent().parent().hide();
		$(this).parent().parent().next().show();
	});
});

var serializeObject = function(form) {
	var o = {};
	$.each(form.serializeArray(), function(index) {
		if (o[this["name"]]) {
			o[this["name"]] = o[this["name"]] + "," + this["value"];
		} else {
			o[this["name"]] = this["value"];
		}
	});
	return o;
}; 
