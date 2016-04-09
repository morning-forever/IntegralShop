<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="${system.basePath }">
<%@ include file="/static/inc.jsp"%>

</head>
<style type="text/css">
form label {
	width: 220px;
}

#myform2 th {
	padding-left: 0px;
}

#myform5 th {
	padding-left: 0px;
}

#myform6 th {
	padding-left: 0px;
}
</style>
<body>
	<div class="container-fluid" id="main-container">
		<div id="breadcrumbs">
			<ul class="breadcrumb">
				<li><i class="icon-home"></i> <a
					href="javascript:alert('index');">当前</a><span class="divider"><i
						class="icon-angle-right"></i></span></li>
				<li class="active">车辆管理</li>
			</ul>
			<!--.breadcrumb-->
		</div>
		<!--#breadcrumbs-->
		<div class="row-fluid">
			<div class="table-header">新增/编辑包车</div>
			<div style="height: 30px;"></div>
			<ul class="nav nav-tabs" id="otherInfoTab">
				<li class="active"><a href="#tab_1">车辆基本信息</a></li>
				<li><a href="#tab_2">包车价格</a></li>
				<li><a href="#tab_3">上传图片</a></li>
			</ul>
			<form id="wrapInfo">
				<div class="tab-content">
					<input type="hidden" name="carId" value="${carWrap.id }">
					<!-- 车辆基本信息 -->
					<div class="tab-pane active" id="tab_1">
						<table class="mytable-detail">
							<tbody>
								<tr>
									<th><span class="red f12">* </span>车辆品牌：</th>
									<td><select id="brandId" name="brandId" notNull="请输入车辆品牌"
										onchange="getSys()">
											<option value="">--请选择--</option>
											<c:forEach items="${brandList }" var="brand">
												<c:choose>
													<c:when test="${carWrap.brand_id == brand.id }">
														<option value="${brand.id }" selected="selected">${brand.brand }</option>
													</c:when>
													<c:otherwise>
														<option value="${brand.id }">${brand.brand }</option>
													</c:otherwise>
												</c:choose>
											</c:forEach>
									</select></td>
									<th><span class="red f12">* </span>车系:</th>
									<td><input type="hidden" id="sysIdExist"
										value="${carWrap.sys_id }"> <select id="sysId"
										name="sysId" notNull="请输入车系">
											<option value="">--请选择--</option>
									</select></td>
									<th><span class="red f12">* </span>年代:</th>
									<td><input type="hidden" id="yearExist"
										value="${carWrap.year }"> <select id="carYear"
										name="carYear" notNull="请输入年代">
									</select></td>
								</tr>
								<tr>
									<th><span class="red f12">* </span>配置：</th>
									<td><input id="car_configure" name="carConfigure"
										value="${carWrap.car_configure }" notNull="请输入配置"></td>
									<th><span class="red f12">* </span>座位数:</th>
									<td><input name="seating" id="seating" notNull="请输入座位数"
										value="${carWrap.seating }"></td>
									<th><span class="red f12">* </span>数量:</th>
									<td><input name="counts" id="counts"
										value="${carWrap.counts }"></td>
								</tr>
								<tr>
									<th><span class="red f12">* </span>是否上架：</th>
									<td>
										<div class="span3">
											<label><input id="isShelves" name="isShelves"
												value="0" class="ace-switch ace-switch-5" type="checkbox">
												<span class="lbl"></span> </label>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					
					<div class="tab-pane" id="tab_2">
						<input name="defaultPrice" id="defaultPrice"> <input
							type="button" class="btn btn-info" value="保存" onclick="saveThreePrice()">
						<div id='calendar' style="margin: 0px"></div>
					</div>
					
					<!-- 上传图片 -->
					<div class="tab-pane" id="tab_3" style="min-height: 200px">

						<!-- 图片1 -->
				    	<div style="float: left;">
				    	<img id="img1" style="width: 200px;height: 200px;z-index: 0;position: relative;" onclick="inputClick(this)" src="uploadFiles/uploadImgs/zanwutupian.jpg">
				    	<input type="file" name="img" id="input1" style="display: none;" onchange="ajaxFileUpload(this)">
				    	<input type="text" name="url" id="url1" style="display:none;">
				    	<img id="delete1" width="20" height="20" onclick="deleteUpload(this)" src="uploadFiles/uploadImgs/X.png" style="z-index: 10;position: relative;right: 20px;bottom: 100px">
				    	</div>
				    	<!-- 图片2 -->
				    	<div  style="float: left;">
				    	<img id="img2" style="width: 200px;height: 200px;z-index: 0;position: relative;" onclick="inputClick(this)" src="uploadFiles/uploadImgs/zanwutupian.jpg">
				    	<input type="file" name="img" id="input2" style="display: none;" onchange="ajaxFileUpload(this)">
				    	<input type="text" name="url" id="url2" style="display:none;">
				    	<img id="delete2" width="20" height="20" onclick="deleteUpload(this)" src="uploadFiles/uploadImgs/X.png" style="z-index: 10;position: relative;right: 20px;bottom: 100px">
				    	</div>
				    	<!-- 图片3 -->
				    	<div  style="float: left;">
				    	<img id="img3"  style="width: 200px;height: 200px;z-index: 0;position: relative;" onclick="inputClick(this)" src="uploadFiles/uploadImgs/zanwutupian.jpg">
				    	<input type="file" name="img" id="input3" style="display: none;" onchange="ajaxFileUpload(this)">
				    	<input type="text" name="url" id="url3" style="display:none;">
				    	<img id="delete3" width="20" height="20" onclick="deleteUpload(this)" src="uploadFiles/uploadImgs/X.png" style="z-index: 10;position: relative;right: 20px;bottom: 100px">
				    	</div>
				    	<!-- 图片4 -->
				    	<div  style="float: left;">
				    	<img id="img4" style="width: 200px;height: 200px;z-index: 0;position: relative;" onclick="inputClick(this)" src="uploadFiles/uploadImgs/zanwutupian.jpg">
				    	<input type="file" name="img" id="input4" style="display: none;" onchange="ajaxFileUpload(this)">
				    	<input type="text" name="url" id="url4" style="display:none;">
				    	<img id="delete4" width="20" height="20" onclick="deleteUpload(this)" src="uploadFiles/uploadImgs/X.png" style="z-index: 10;position: relative;right: 20px;bottom: 100px">
				    	</div>
					</div>
				</div>
			</form>
			<br>
			<div>
				<input class="btn btn-info" style="margin-left: 5%"
					onclick="saveReturn()" type="button" value="保存并返回"> <input
					class="btn btn-info" style="margin-left: 1%" onclick="saveAdd()"
					type="button" value="保存并继续添加"> <input class="btn"
					style="margin-left: 1%" onclick="cancel()" type="button" value="取消">
			</div>
		</div>
	</div>
	<%@ include file="/static/foot.jsp"%>
</body>
<script type="text/javascript" charset="utf-8"
	src="plugins/ueditor1.4.3/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="plugins/ueditor1.4.3/ueditor.all.min.js"></script>
<script type="text/javascript" src="static/js/jquery.form.js"></script>
<script type="text/javascript" src="static/js/ajaxfileupload.js"></script>
<script type="text/javascript" src="static/js/daterangepicker.min.js"></script>
<script type="text/javascript" src="static/js/bootstrap-timepicker.min.js"></script>
<script type="text/javascript" src="static/js/fuelux.spinner.js"></script>
<script type="text/javascript" src="static/web/js/base.js"></script>
<script type="text/javascript" src="static/js/fullcalendar.min.js"></script>
<!--定义操作列按钮模板-->
<script id="tpl" type="text/x-handlebars-template">
	{{#each func}}
	<a class="btn btn-mini btn-{{this.type}}" href="javascript:;" title="{{this.name}}" target="mainFrame" onclick="{{this.fn}}"><i class="icon-{{this.icon}}"></i></a>
	{{/each}}
</script>
<script type="text/javascript">
	var tpl = $("#tpl").html();
	//预编译模板
	var template = Handlebars.compile(tpl);
	var calendar;
	var priceList='${datePriceList}';//价格List
	var eventArr;//价格日历控件初始化对象

	$(document).ready(
		function() {
			/*tab页*/
			$('#otherInfoTab a:eq(1)').tab('show');//初始化显示哪个tab

			$('#otherInfoTab a').click(function(e) {
				e.preventDefault();//阻止a链接的跳转行为
				$(this).tab('show');//显示当前选中的链接及关联的content
			});

			initYearSelect();//初始化年份选择框
			initNumInput();//初始化数字输入框
			getSys($("#sysIdExist").val());//初始化系别
			if("${carWrap.is_shelves}" == "0"){//初始化上架状态
				$("#isShelves").click();
			}
			
			initDatePrice();//初始化包车价格
			
			initPhoto();//初始化图片
			
	});

	//初始化年份选择框
	function initYearSelect(){
		var year = $("#yearExist").val();
		$("#carYear").append('<option value="">--请选择--</option>');
		for (var i = 2010; i < 2031; i++) {
			if (year == i) {
				$("#carYear").append(
						'<option value="'+i+'" selected="selected">'
								+ i + '</option>');
			} else {
				$("#carYear").append(
						'<option value="'+i+'">' + i + '</option>');
			}
		}
	}
	
	//初始化数字输入框
	function initNumInput(){
		var countValue = 1;
		var seatValue = 1;
		if ($("#counts").val() != "") {
			countValue = parseInt($("#counts").val());
		}
		if ($("#seating").val() != "") {
			seatValue = parseInt($("#seating").val());
		}
		$('#counts').ace_spinner({
			value : countValue,
			min : 1,
			max : 100000,
			step : 1,
			icon_up : 'icon-caret-up',
			icon_down : 'icon-caret-down'
		});
		$('#seating').ace_spinner({
			value : seatValue,
			min : 1,
			max : 100000,
			step : 1,
			icon_up : 'icon-caret-up',
			icon_down : 'icon-caret-down'
		});
	}
	
	//初始化包车价格
	function initDatePrice(){
		
		eventArr=[];
		
		if(priceList!=''){
			priceList=eval('('+priceList+')');
		}else{
			priceList=[];
		}
		
		for(var i=0;i<priceList.length;i++){
			var eventItem={};
			eventItem.title=priceList[i].price.toString();
			eventItem.start=new Date().setTime(priceList[i].dt);
			eventItem.className="label-success";
			eventArr[i]=eventItem;
		}
		
		initCalendar();
		$('#otherInfoTab a:eq(0)').click();
	}
	
	//初始化显示图片
	function initPhoto(){
		var urlArr = new Array();
		urlArr[0] = "${photoList[0].picUrl}"
		urlArr[1] = "${photoList[1].picUrl}"
		urlArr[2] = "${photoList[2].picUrl}"
		urlArr[3] = "${photoList[3].picUrl}"

		for (var i = 0; i < "${photoList.size()}"; i++) {
			var url = urlArr[i];
			console.info(url);
			$("#img" + (i + 1)).attr("src", url);
			$("#url" + (i + 1)).val(url);
		}
	}
	
	//根据品牌获取车系
	function getSys(sysid) {
		var brandId = $("#brandId").val();
		var sys = $("#sysId");
		sys.empty();
		sys.append("<option value=''>--请选择--</option>");
		$.post(
			'admin/cart/wrap/getSys',
			{
				'brandId' : brandId
			},
			function(res) {
				if (res.status == 'success') {
					var list = res.list;
					for ( var i in list) {
						var item = list[i];
						if (sysid == item.id) {
							sys.append("<option value='"+item.id+"' selected='selected'>"
											+ item.sys
											+ "</option>");
						} else {
							sys.append("<option value='"+item.id+"'>"
											+ item.sys
											+ "</option>");
						}
					}
				}
			}, "JSON");
	};

	//保存并返回
	function saveReturn() {
		if(checkForm()){
			var wrapInfoForm = serializeObject($("#wrapInfo"));
			var date = $('#calendar').fullCalendar("clientEvents");
			var dates = "";
			var prices = "";
			for(var i=0; i<date.length; i++){
				dates += date[i]._start.getTime() + ",";
				prices += date[i].title + ",";
			}
			wrapInfoForm.dates = dates.substr(0,dates.length-1);
			wrapInfoForm.prices = prices.substr(0,prices.length-1);
			
			subWebForm("admin/cart/wrap/saveReturn",wrapInfoForm);
		}
	}

	//保存并继续继续添加
	function saveAdd() {
		if(checkForm()){
			var wrapInfoForm = serializeObject($("#wrapInfo"));
			var date = $('#calendar').fullCalendar("clientEvents");
			var prices = "";
			var dates = "";
			for(var i=0; i<date.length; i++){
				prices += date[i].title + ",";
				dates += date[i]._start.getTime() + ",";
			}
			wrapInfoForm.prices = prices.substr(0,prices.length-1);
			wrapInfoForm.dates = dates.substr(0,dates.length-1);
			
			$.post('admin/cart/wrap/saveCar', wrapInfoForm , function(
					res) {
				if (res.status == 'success') {
					bootbox.alert("提交成功", function() {
						window.location.reload();
					});
				} else {
					bootbox.alert("提交失败，请重试");
				}
			}, "JSON");
		}
	}
	
	//验证表单
	function checkForm(){
		var i = 0;
		$("#wrapInfo select,#wrapInfo input[notNull]").each(function() {
			if ($(this).val().trim() == "") {
				valTips(this.id, $(this).attr("notNull"));
				i++;
				return false;
			}
		});
		if (i != 0) {
			return ;
		}
		return true;
	}

	//取消
	function cancel() {
		window.location.href = "admin/cart/wrap/main";
	}

	//保存三个月的价格
	function saveThreePrice(){
		var price=$("#defaultPrice").val();
		if(isNaN(price)){
			valTips($("#defaultPrice"),"请输入数字");
		}else{
			var date=new Date();
			date.setTime(date.getTime()-date.getTime()%(24*60*60*1000)-8*60*60*1000);
			var currentDate=new Date();
			var o=[];
			for(var i=0;i<93;i++){
				if((date.getMonth()-currentDate.getMonth())<3){
					var itemDate=new Date();
					itemDate.setTime(date.getTime());
					o[i]={	title: price,
							start: itemDate,
							allDay: true,
							className: 'label-success'};
					$('#calendar').fullCalendar('removeEvents' , function(ev){
						return (ev._start.getTime()==itemDate.getTime());
					});
					$('#calendar').fullCalendar('renderEvent',o[i],true);
					date.setTime(date.getTime()+24*60*60*1000);
				}
			} 
		}
	}
	
	//表单序列化
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

	function deleteUpload(obj) {
		var id = $(obj).attr("id");
		var number = id.substring(6, id.length);
		$("#url" + number).val("");
		$("#img" + number).attr({
			src : "uploadFiles/uploadImgs/zanwutupian.jpg"
		});
	}

	function inputClick(obj) {
		var id = $(obj).attr("id");
		var input = "input" + id.substring(3, id.length);
		$("#" + input).click();
	}

	function ajaxFileUpload(obj) {
		//获取欲上传的文件路径  
		var file = $(obj).val();
		var fileId = $(obj).attr("id");
		$.ajaxFileUpload({
			url : 'merchSystem/info/imgFileUpload', //需要链接到服务器地址
			secureuri : false,
			fileElementId : fileId, //文件选择框的id属性
			dataType : 'JSON', //服务器返回的格式，可以是json
			success : function(data) { //相当于java中try语句块的用法
				data = data.replace(/<[^>].*?>/g, "");//对返回的数据进行转换
				var json = eval("(" + data + ")");//对返回的数据进行转换
				var number = fileId.substring(5, fileId.length);
				$("#url" + number).val(json.imgUrl);
				$("#img" + number).attr({
					src : json.imgUrl
				});
			}
		});
	}

	//初始化日历
	function initCalendar(){
		var date = new Date();
		var d = date.getDate();
		var m = date.getMonth();
		var y = date.getFullYear();
		
		calendar = $('#calendar').fullCalendar({
			height:400,
			buttonText: {
				prev: '<i class="icon-chevron-left"><a href="javascript:;"></a></i>',
				next: '<i class="icon-chevron-right"><a href="javascript:;"></a></i>'
			},
			events:eventArr,
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month'
			},
			editable: true,
			droppable: true, // this allows things to be dropped onto the calendar !!!
			drop: function(date, allDay) { // this function is called when something is dropped
			
				// retrieve the dropped element's stored Event Object
				var originalEventObject = $(this).data('eventObject');
				var $extraEventClass = $(this).attr('data-class');
				
				
				// we need to copy it, so that multiple events don't have a reference to the same object
				var copiedEventObject = $.extend({}, originalEventObject);
				
				// assign it the date that was reported
				copiedEventObject.start = date;
				copiedEventObject.allDay = allDay;
				if($extraEventClass) copiedEventObject['className'] = [$extraEventClass];
				
				// render the event on the calendar
				// the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
				$('#calendar').fullCalendar('renderEvent', copiedEventObject, true);
				
				// is the "remove after drop" checkbox checked?
				if ($('#drop-remove').is(':checked')) {
					// if so, remove the element from the "Draggable Events" list
					$(this).remove();
				}
				
			},
			dayClick: function(date, allDay, jsEvent, view) {
				//只能设置今天之后的日期价格
				if(date.format("yyyy-MM-dd") >= new Date().format("yyyy-MM-dd")){
					bootbox.prompt("设置价格:", function(title) {
						if (title != null) {
							if(isNaN(title)){
								valTips($(".bootbox input"),"请输入数字");
								return false;
							}else{
								//判断当天是否有价格，如果有，则删除
								//该方法为遍历，查询所有事件事件，如果相同，则删除
								
								calendar.fullCalendar('removeEvents' , function(ev){
									return (ev._start.getTime()==date.getTime());
								});
								calendar.fullCalendar('renderEvent',
									{
										title: title,
										start: date,
										allDay: allDay,
										className: 'label-success'
									},
									true // make the event "stick"
								);
							}
						}
					});
				}
			},
			eventClick: function(calEvent, jsEvent, view) {
				//只能修改今天之后的日期价格
				if(calEvent.start.format("yyyy-MM-dd") >= new Date().format("yyyy-MM-dd")){
					var form = $("<form class='form-inline'><label>修改价格</label></form>");
					form.append("<input autocomplete=off type=text value='" + calEvent.title + "' /> ");
					form.append("<button type='submit' class='btn btn-small btn-success'><i class='icon-ok'></i> 保存</button>");
					var div = bootbox.dialog(form,
						[
						{
							"label" : "<i class='icon-trash'></i> 删除价格",
							"class" : "btn-small btn-danger",
							"callback": function() {
								calendar.fullCalendar('removeEvents' , function(ev){
									return (ev._id == calEvent._id);
								})
							}
						}
						,
						{
							"label" : "<i class='icon-remove'></i> 关闭",
							"class" : "btn-small"
						}
						]
						,
						{
							// prompts need a few extra options
							"onEscape": function(){div.modal("hide");}
						}
					);
					
					form.on('submit', function(){
						calEvent.title = form.find("input[type=text]").val();
						if(isNaN(calEvent.title)){
							valTips($(".bootbox input"),"请输入数字");
						}else{
							calendar.fullCalendar('updateEvent', calEvent);
							div.modal("hide");
						}
						return false;
					});
				}
			},
			monthNames:['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月'],
			monthNamesShort:['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月'],
			dayNames:['星期一', '星期二', '星期三', '星期四', '星期五', '星期六', '星期天'],
			dayNamesShort:['周一', '周二', '周三', '周四', '周五', '周六', '周日'],
			buttonText:{
				prev: '上月', // ‹
				next: '下月', // ›
				prevYear: '«', // «
				nextYear: '»', // »
				today: '今天',
				month: '月',
				week: '周',
				day: '日'
				}
			
		});
	}
	
	Date.prototype.format = function(format) {
		var date = {
		       "M+": this.getMonth() + 1,
		       "d+": this.getDate(),
		       "h+": this.getHours(),
		       "m+": this.getMinutes(),
		       "s+": this.getSeconds(),
		       "q+": Math.floor((this.getMonth() + 3) / 3),
		       "S+": this.getMilliseconds()
		};
		if (/(y+)/i.test(format)) {
		       format = format.replace(RegExp.$1, (this.getFullYear() + '').substr(4 - RegExp.$1.length));
		}
		for (var k in date) {
		       if (new RegExp("(" + k + ")").test(format)) {
		              format = format.replace(RegExp.$1, RegExp.$1.length == 1
		                     ? date[k] : ("00" + date[k]).substr(("" + date[k]).length));
		       }
		}
		return format;
	}
</script>
</html>
