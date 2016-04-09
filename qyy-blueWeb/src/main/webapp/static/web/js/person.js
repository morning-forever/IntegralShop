// JavaScript Document
$(function(){
	//点击评论
	/*$(".review span.i-comment i").click(function(){
		$(this).parents('.list_comment li').find('.details_comment').slideDown();
		$(this).parents('.list_comment li').siblings('li').find('.details_comment').slideUp();
	});
	$(".details_comment span.delete").click(function(){
		$(this).parents('.details_comment').slideUp();
	});*/
	$(".whitebg .problem:first").css("display","block");
	
	
	
	//达人主页
	$(".below").find(".list-below:first").css("display","block");
	$(".article").find(".list_article:first").css("display","block");
	$(".tab_sort li").click(function(){
		$(this).addClass("active").siblings().removeClass("active");
		var _index=$(this).index();
		$(".below .list-below").eq(_index).css("display","block").siblings().css("display","none");
	});
	$(".venda_strat li").click(function(){
		$(this).addClass("active").siblings().removeClass("active");
		var _ind=$(this).index();
	    $(this).parents(".list-below").find(".article .list_article").eq(_ind).css("display","block").siblings().css("display","none");
	});
	
	/*//个人主页添加游记
	$(document).on("click",".editing span.fold",function(){
		if($(this).hasClass("unfold")){
		   $(this).removeClass("unfold");
		   $(this).next(".edit_menu").css("display","none");
		}else{
		   $(this).addClass("unfold");	
		   $(this).next(".edit_menu").css("display","block");
		}
	});
	//添加文字
    $(document).on("click",".edit_menu span.addword",function(){
	   var t='<div class="editTxt"><p class="ellips"><i class="i-person abs alter"></i></p><div class="editText"><div class="tarea" contenteditable="true"></div><div class="oBtn tc"><button class="yes">保存</button><button class="no">取消</button></div></div></div><div class="editing clearfix"><span class="fold i-person fl"></span><div class="edit_menu fl" style="display:none;"><span class="addword"><i class="i-person"></i>添加文字</span><span class="addimg"><i class="i-person"></i>添加照片</span><span class="addtitle"><i class="i-person"></i>添加段落标题</span></div></div>'
	   //$(t).appendTo($(".list_edit"));
	   if($(this).parents(".editing").next(".editTxt").css("display","none")){
	      $(this).parents(".editing").after(t);
	   }
	});
	$(document).on("click",".oBtn button.yes",function(){
		$(this).parents(".editText").css("display","none");
        $(this).parents(".editTxt").find('p.ellips').css("display","block");
		var Txt1=$(this).parents(".editText").find(".tarea").text();
		if(Txt1.length<1){
		  $(this).parents(".editTxt").next().remove();	
		  $(this).parents(".editTxt").remove();	
		 
		}else{
		  $(this).parents(".editTxt").find("p.ellips").html('<i class="i-person abs alter"></i>'+Txt1);
		}
	});
	$(document).on("click",".oBtn button.no",function(){
		$(this).parents(".editText").css("display","none");
        $(this).parents(".editTxt").find('p.ellips').css("display","block");
		var Txt2=$(this).parents(".editTxt").find(".editTxt p.ellips").text();
		$(this).parents(".editText").find(".tarea").html(Txt2);
		if(Txt2.length<0){
		  //$(this).parents(".editTxt").remove();	
		  $(this).parents(".editTxt").next(".editing").remove();
		}else{
		  $(this).parents("editTxt").find("p.ellips").html('<i class="i-person abs alter"></i>'+Txt2);
		}
	});
	$(document).on("click",".editTxt i.alter",function(){
		$(this).parent('p.ellips').css("display","none").next(".editText").css("display","block");
		$(this)
	});
	$(document).on("click",".editTxt i.alter",function(){
		$(this).parent('p.ellips').css("display","none").next(".editText").css("display","block");
		var Txt=$(this).parents(".editTxt").find("p.ellips").text();
		$(this).parents(".editTxt").find(".tarea").html(Txt);
	});
	
	
	//添加段落标题
	var ruleDlg = new dialogBox({
		selfClass : "type2",
		title : "",
		contentHtml : $("#rulepopup").html(),
		popupBoxW : 816,
		//closeBtnshow : 0,
		initEvent : function($dom){
		}
	});
	var state = 0;// 新建
	var curOptObj = null; //当前编辑标题对象
	$(document).on("click",".edit_menu span.addtitle,.Addtitle i.editor",function(){
		var _self = $(this);
		ruleDlg.showDlg(function(){
			if(_self.hasClass("editor")){ //编辑
				var Text2=_self.parents(".Addtitle").find(".title_text").text();
				$(".addsection input.secTxt").val(Text2);
				state = 1;
				curOptObj = _self.parent(".Addtitle");
			} else { //新建
				$(".addsection input.secTxt").val("");
				state = 0;
			}
		});		
	});
	$(document).on("click",".oBtn2 button.yes",function(){
		if(state){
			var Text2=$(this).parents(".innerdiv").find("input.secTxt").val();
			curOptObj.find(".title_text").text(Text2);
		} else {
			var Text=$(this).parents(".innerdiv").find("input.secTxt").val();
			var r='<div class="Addtitle"><span class="white title_text">'+Text+'</span><i class="i-person editor"></i><i class="i-person remove"></i></div><div class="editing clearfix"><span class="fold i-person fl"></span><div class="edit_menu fl" style="display:none;"><span class="addword"><i class="i-person"></i>添加文字</span><span class="addimg"><i class="i-person"></i>添加照片</span><span class="addtitle"><i class="i-person"></i>添加段落标题</span></div></div>';
			if(Text.length>0){
			  $(".list_edit").append(r);  
			};
		};				
    });	

    $(document).on("click",".oBtn2 button.no",function(){
		if(state){
			var Text2=curOptObj.find(".title_text").text();
			//$(this).parents(".innerdiv").find("input.secTxt").val();
			curOptObj.find(".title_text").text(Text2);
			console.log(curOptObj);
		}
	});
	
	$(document).on("click",".Addtitle i.remove",function(){
		$(this).parents(".Addtitle").remove();
	});*/
	
	//支付
	$(".list1 i.checkbox").click(function(){
		$(this).addClass("checkd");
		$(this).parent("p").siblings().children("i").removeClass("checkd");
	});
	
})











