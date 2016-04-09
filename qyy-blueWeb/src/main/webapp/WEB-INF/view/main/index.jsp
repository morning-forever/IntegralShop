﻿<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="${system.basePath}">
<meta charset="utf-8" />
<title>${system.webappName}</title>
<meta name="description" content="overview & stats" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
<meta http-equiv="X-UA-Compatible" content="IE=9" />
<!-- basic styles -->
<link rel="stylesheet" href="static/css/bootstrap.min.css" />
<link rel="stylesheet" href="static/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="static/css/font-awesome.min.css" />
<!--[if IE 7]>
  <link rel="stylesheet" href="static/css/font-awesome-ie7.min.css" />
<![endif]-->
<!-- page specific plugin styles -->

<!-- ace styles -->
<link rel="stylesheet" href="static/css/ace.min.css" />
<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
<link rel="stylesheet" href="static/css/ace-skins.min.css" />

<!--[if lt IE 9]>
  <link rel="stylesheet" href="static/css/ace-ie.min.css" />
<![endif]-->
<style type="text/css">
#sidebar { height:100%; overflow-y:auto; overflow-x:hidden; }
</style>
</head>
<body>
<div class="navbar navbar-inverse">
	<%@ include file="head.jsp"%>
</div><!--/.navbar-->
<div class="container-fluid" id="main-container">
	<a href="#" id="menu-toggler"><span></span></a><!-- menu toggler -->
	<div id="sidebar">
		<%@ include file="left.jsp"%>
		<div id="sidebar-collapse"><i class="icon-double-angle-left"></i></div>
	</div><!--/#sidebar-->
		
	<div id="main-content" class="clearfix">
		<iframe name="mainFrame" id="mainFrame" frameborder="0" src="admin/home/defaults" style="padding: 0 0;" width="100%">
		</iframe>
	</div><!-- #main-content -->
	<div id="jzts" style="display:block; width:100%; position:fixed; z-index:99999999;">
		<div class="commitopacity" id="bkbgjz"></div>
		<div style="padding-left: 70%;padding-top: 1px;">
			<div style="float: left;margin-top: 3px;"><img src="static/images/loading.gif" /> </div>
			<div style="margin-top: -5px;"><h4 class="lighter block red">&nbsp;加载中 ...</h4></div>
		</div>
	</div>
	
	<div id="ace-settings-container">
		<div class="btn btn-app btn-mini btn-warning" id="ace-settings-btn">
			<i class="icon-cog"></i>
		</div>
		<div id="ace-settings-box">
			<div>
				<div class="pull-left">
					<select id="skin-colorpicker" class="hidden">
						<option data-class="default" value="#438EB9">#438EB9</option>
						<option data-class="skin-1" value="#222A2D">#222A2D</option>
						<option data-class="skin-2" value="#C6487E">#C6487E</option>
						<option data-class="skin-3" value="#D0D0D0">#D0D0D0</option>
					</select>
				</div>
				<span>&nbsp; Choose Skin</span>
			</div>
			<!-- 
			<div><input type="checkbox" class="ace-checkbox-2" id="ace-settings-header" /><label class="lbl" for="ace-settings-header"> Fixed Header</label></div>
			<div><input type="checkbox" class="ace-checkbox-2" id="ace-settings-sidebar" /><label class="lbl" for="ace-settings-sidebar"> Fixed Sidebar</label></div>
			 -->
		</div>
	</div><!--/#ace-settings-container-->
</div><!--/.fluid-container#main-container-->
<a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse">
	<i class="icon-double-angle-up icon-only"></i>
</a>
<!-- basic scripts -->
<script src="static/1.9.1/jquery.min.js"></script>
<script type="text/javascript">
window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");
</script>
<script src="static/js/bootstrap.min.js"></script>
<!-- page specific plugin scripts -->
<!--[if lt IE 9]>
<script type="text/javascript" src="static/js/excanvas.min.js"></script>
<script src="http://apps.bdimg.com/libs/html5shiv/3.7/html5shiv.min.js"></script>
<script src="http://apps.bdimg.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<script type="text/javascript" src="static/js/jquery-ui-1.10.2.custom.min.js"></script>
<script type="text/javascript" src="static/js/jquery.ui.touch-punch.min.js"></script>
<script type="text/javascript" src="static/js/jquery.slimscroll.min.js"></script>
<script type="text/javascript" src="static/js/jquery.easy-pie-chart.min.js"></script>
<script type="text/javascript" src="static/js/jquery.sparkline.min.js"></script>
<!-- <script type="text/javascript" src="static/js/jquery.flot.min.js"></script>
<script type="text/javascript" src="static/js/jquery.flot.pie.min.js"></script>
<script type="text/javascript" src="static/js/jquery.flot.resize.min.js"></script> -->
<!-- ace scripts -->
<script type="text/javascript" src="static/js/ace-elements.min.js"></script>
<script type="text/javascript" src="static/js/ace.min.js"></script>
<!-- inline scripts related to this page -->
<script type="text/javascript" src="static/js/target/frame-index.js"></script>
<script type="text/javascript">
$(function() {
	var frameHeight = $(window).height() - $("#main-content").offset().top;
	$("#main-container").css({height:frameHeight,"min-height":frameHeight});
	$("#mainFrame").css({height:frameHeight});
	$('.dialogs,.comments').slimScroll({
        height: '300px'
    });
	
	var oldie = $.browser.msie && $.browser.version < 9;
	$('.easy-pie-chart.percentage').each(function(){
		var $box = $(this).closest('.infobox');
		var barColor = $(this).data('color') || (!$box.hasClass('infobox-dark') ? $box.css('color') : 'rgba(255,255,255,0.95)');
		var trackColor = barColor == 'rgba(255,255,255,0.95)' ? 'rgba(255,255,255,0.25)' : '#E2E2E2';
		var size = parseInt($(this).data('size')) || 50;
		$(this).easyPieChart({
			barColor: barColor,
			trackColor: trackColor,
			scaleColor: false,
			lineCap: 'butt',
			lineWidth: parseInt(size/10),
			animate: oldie ? false : 1000,
			size: size
		});
	})
	$('.sparkline').each(function(){
		var $box = $(this).closest('.infobox');
		var barColor = !$box.hasClass('infobox-dark') ? $box.css('color') : '#FFF';
		$(this).sparkline('html', {tagValuesAttribute:'data-values', type: 'bar', barColor: barColor , chartRangeMin:$(this).data('min') || 0} );
	});
	
	 var data = [
		{ label: "social networks",  data: 38.7, color: "#68BC31"},
		{ label: "search engines",  data: 24.5, color: "#2091CF"},
		{ label: "ad campaings",  data: 8.2, color: "#AF4E96"},
		{ label: "direct traffic",  data: 18.6, color: "#DA5430"},
		{ label: "other",  data: 10, color: "#FEE074"}
	 ];
/*  var placeholder = $('#piechart-placeholder').css({'width':'90%' , 'min-height':'150px'});
 $.plot(placeholder, data, {
	
	series: {
        pie: {
            show: true,
			tilt:0.8,
			highlight: {
				opacity: 0.25
			},
			stroke: {
				color: '#fff',
				width: 2
			},
			startAngle: 2
			
        }
    },
    legend: {
        show: true,
		position: "ne", 
	    labelBoxBorderColor: null,
		margin:[-30,15]
    }
	,
	grid: {
		hoverable: true,
		clickable: true
	},
	tooltip: true, //activate tooltip
	tooltipOpts: {
		content: "%s : %y.1",
		shifts: {
			x: -30,
			y: -50
		}
	}
	
 }); */
 
	/* var $tooltip = $("<div class='tooltip top in' style='display:none;'><div class='tooltip-inner'></div></div>").appendTo('body');
	placeholder.data('tooltip', $tooltip);
	var previousPoint = null;
	placeholder.on('plothover', function (event, pos, item) {
		if(item) {
			if (previousPoint != item.seriesIndex) {
				previousPoint = item.seriesIndex;
				var tip = item.series['label'] + " : " + item.series['percent']+'%';
				$(this).data('tooltip').show().children(0).text(tip);
			}
			$(this).data('tooltip').css({top:pos.pageY + 10, left:pos.pageX + 10});
		} else {
			$(this).data('tooltip').hide();
			previousPoint = null;
		}
	
	}); */
	
	var d1 = [];
	for (var i = 0; i < Math.PI * 2; i += 0.5) {
		d1.push([i, Math.sin(i)]);
	}
	var d2 = [];
	for (var i = 0; i < Math.PI * 2; i += 0.5) {
		d2.push([i, Math.cos(i)]);
	}
	var d3 = [];
	for (var i = 0; i < Math.PI * 2; i += 0.2) {
		d3.push([i, Math.tan(i)]);
	}
		
	/* var sales_charts = $('#sales-charts').css({'width':'100%' , 'height':'220px'});
	$.plot("#sales-charts", [
		{ label: "Domains", data: d1 },
		{ label: "Hosting", data: d2 },
		{ label: "Services", data: d3 }
	], {
		hoverable: true,
		shadowSize: 0,
		series: {
			lines: { show: true },
			points: { show: true }
		},
		xaxis: {
			tickLength: 0
		},
		yaxis: {
			ticks: 10,
			min: -2,
			max: 2,
			tickDecimals: 3
		},
		grid: {
			backgroundColor: { colors: [ "#fff", "#fff" ] },
			borderWidth: 1,
			borderColor:'#555'
		}
	}); */
	$('[data-rel="tooltip"]').tooltip();
});

</script>
</body>
</html>
