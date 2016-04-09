
$(document).ready(function(){
	/*var winH = $(window).height();
	var wrapperH = winH;
	if( $(".top-fix").length == 1 ){
		wrapperH = wrapperH - $(".top-fix").height();
	}
	if( $(".bottom-fix").length == 1 ){
		wrapperH = wrapperH - $(".bottom-fix").height();
	}
	$(".wrapper").height( wrapperH );*/
});


$(function(){
	$(".top-fix i.i-ok").click(function(){
		if($(this).hasClass("orange")){
		 $(this).removeClass("orange");
		 $(".bg-white i.i-ok").removeClass("orange");
		}else{
		 $(this).addClass("orange");
		 $(".bg-white i.i-ok").addClass("orange");	
		};	
	});
	$(".bg-white i.i-ok").click(function(){
	  if($(this).hasClass("orange")){
		  $(this).removeClass("orange");
	      $(".top-fix i.i-ok").removeClass("orange");
		}else{
		  $(this).addClass("orange");
		  if($(".bg-white i.orange").length==$(".bg-white i.i-ok").length){
			  $(".top-fix i.i-ok").addClass("orange");
			  }
		};
	});
})