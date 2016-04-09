<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>    
<html>
<html lang="en">
<head>
<base href="${system.basePath }">
<%@ include file="/static/inc.jsp" %>

</head>
<body>
<div class="container-fluid" id="main-container">
				    	<div class="row-fluid">
			                <div>
			                	<form id="myform" enctype="multipart/form-data">
			                		<input type="hidden" id="id" name="id" value="${wb.id }"/>
				                	<table class="mytable-detail">
				                		<tr>
				                			<th colspan="4" style="text-align: center;">首页banner修改</th>
				                		</tr>
				                		<tr>
				                		 <td>&nbsp;</td></tr>
				                		<tr> 
				                			<th>
						                                                      所属页面：
										</th>
										<td>
											<select id="bannerType" style="width: 150px">
												<option value=""></option>
												<option value="home">首页Banner PC、APP端</option>
												<option value="depth">首页主题深度游推荐  PC、APP端</option>
												<option value="recruit">首页玩伴召募推荐  PC、APP端</option>
												<option value="hot">首页热门攻略推荐  PC、APP端</option>
											</select>
											</td>
				                		</tr>
				                		<tr>
				                		 <td>&nbsp;</td></tr>
				                		<tr>
				                		<tr> 
				                			<th>
						                                                      序号：
										</th>
										<td>
											<select id="bannerOrder" style="width: 150px">
												<option value=""></option>
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
												<option value="5">5</option>
											</select>
											</td>
				                		</tr>
				                		<tr>
				                		 <td>&nbsp;</td></tr>
				                			<th>
				                				开始时间：
				                			</th>
				                			<td>
				                			 	<div class="input-prepend">
													<input type="text" id="startTime"  name="startTime" placeholder="请选择开始时间"  style="width: 150px" readonly="readonly" class="mydate-picker" data-date-format="yyyy-mm-dd HH:mm:ss">
												</div>
				                			</td>
				                			<tr>
				                		 <td>&nbsp;</td></tr>
				                			<th>
				                				结束时间：
				                			</th>
				                			<td>
				                			 	<div class="input-prepend">
													<input type="text" id="endTime" name="endTime" placeholder="请选择结束时间" style="width: 150px"  readonly="readonly" class="mydate-picker" data-date-format="yyyy-mm-dd">
												</div>
				                			</td>
				                		</tr>
				                		<tr>
				                		 <td>&nbsp;</td></tr>
				                		<tr>
				                			<th>
				                				图片上传：
				                			</th>
				                			<td>
			                			 		<input type="file" id="imageFile" name = "cover">
			                			 		<label for="imageFile" data-title="Choose" class="">
			                			 			<span data-title="No File ..." class=""></span>
			                			 		</label>
				                			</td>
				                			<tr>
				                		 <td>&nbsp;</td></tr>
				                			
				                		</tr>
				                		<tr>
				                		<th>
						                                                      链接栏目：
										</th>
										<td>
											<select id="bannerLink" style="width: 150px">
												<option value="0">请选择链接栏目</option>
												<option value="1">主题深度游</option>
												<option value="2">快旅出行</option>
												<option value="3">漫游商城</option>
												<option value="4">景区</option>
												<option value="5">酒店</option>
												<option value="6">餐饮</option>
												<option value="7">装备</option>
												<option value="8">互动社区</option>
												<option value="9">达人攻略</option>
												<option value="10">精彩游记</option>
												<option value="11">玩伴召募</option>
												<option value="12">广告</option>
											</select>
											</td>
				                		
				                		</tr>
				                		<tr>
				                		 <td>&nbsp;</td></tr>
				                		 <tr>
				                		 <td>&nbsp;</td>
				                		 <td>
				                		 <input id="bannerLinkSpecific"  name="bannerLinkSpecific"   type="hidden" />
                                         <input id="bannerName" onclick="selectType();" name="bannername"  class="form-control" type="text" placeholder="点击选择" />
				                		 </td>
				                		 </tr>
				                		 <tr>
				                		 <td>&nbsp;</td></tr>
				                		<tr>
				                		<th>
				                				状态：
				                			</th>
				                			<td>
				                				<input type="hidden" name="stauts" id="stautsVal">
												<label><input type="checkbox" class="ace-switch" id="stauts"><span class="lbl"></span></label>
				                			</td>
				                		</tr>
				                		<tr>				                		
				                			<td colspan="4">
			                			 		<a target="_blank"><img id="imageSrc" src="" width="100px" style="padding-left: 110px"></a>
				                			</td>
				                		</tr>
				                	</table>
			                	</form>
			                </div>
			                <div style = "padding:10px 350px;">
					<button type="button" class="btn btn-primary" id="save-btn" onclick="save();" >保存</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			           
				    </div>
				    
			<!-- 选择栏目 -->	  
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
	                        aria-hidden="true">&times;</span></button>
	            </div>
				 <ul class="nav nav-tabs" id="add_otherInfoTab">
				    <li class="active"><a href="javescript:;">主題深度游</a></li>
				</ul>
				<div class="tab-content">
			    	<div class="modal-body">
		                <div class="form-group">
		           <table style="margin-left: 5px;" id="btnmenu">
					<tbody>
						<tr>
						<td>
						主题深度游名称：
					</td>
					<td>
						<span style="margin-top: 2px;" class="input-icon">
							<input  type="text" placeholder="这里输入主题深度游名称" class="mysearch" id="name">
							<i class="icon-search"></i>
						</span>
					</td>
							<td>
								<a title="查询" onclick="" class="btn btn-mini btn-light" id="searchBtn"><i class="icon-search"></i>查询</a>
							</td>
								
						</tr>
					</tbody>
				</table>     
		          <table id="table_report" class="table table-striped table-bordered table-hover">
			     <thead>
				<tr>
					<th>序号</th>
					<th>主题深度游名称</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody></tbody> 
		</table>
		                </div>
		            </div>
				</div>
	        </div>
	    </div>
	</div>
				    
		</div>		    
				    

</body>
<%@ include file="/static/foot.jsp" %>
<script type="text/javascript" src="static/js/jquery.form.js"></script>
<script type="text/javascript" charset="utf-8" src="plugins/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="plugins/ueditor/ueditor.all.min.js"></script>
<script id="tpl" type="text/x-handlebars-template">
	{{#each func}}
	<a class="btn btn-mini btn-{{this.type}}" href="javascript:;" title="{{this.name}}" target="mainFrame" onclick="{{this.fn}}"><i class="icon-{{this.icon}}"></i></a>
	{{/each}}
</script>
<script type="text/javascript">
var tpl = $("#tpl").html();
//预编译模板
var template = Handlebars.compile(tpl);
$(function(){
	
	 initDepthList();
	
     var table = $("#table_report").DataTable();
	
	  $("#searchBtn").click(function(){
		var name = $("#name").val();
		
		
		var json = '{"name":"'+name+'"}';
		
    	table.search(json).draw();
	});
	$('.mydate-picker').datepicker();
	$("#myModal").modal("hide");
});


function selectType(){
	var select=$("#bannerLink").val();
	if(select==0){
		bootbox.alert("请先选择栏目");
		return;
	}
	
	$("#myModal").modal("show");
}


//深度主题游
function initDepthList(){
	$('#table_report').DataTable( {
	    "columns": [
            { "data": "id" },
            { "data": "subject" },
            { "data": null }
        ],
        "columnDefs": [ {
            "targets":2,
            render: function (a, b, c, d) {
            	
                var context =
                {
                    func: [
                        {"name": "选择", "fn": "selectDepth(\'" + c.id + "\',\'" + c.subject + "\')", "type": "info", "icon":"eye-open"},
                    ]
                };
                var html = template(context);
                return html;
            }
        }],
        "bDestroy": true,
        "ajax": {
        	url:"home/getWebDepthList",	
        	type: "POST"
        }
    } );
}


function selectDepth(id,name){
	alert(name);
	alert(id);
	$("#bannerLinkSpecific").val(id);
	$("#bannerName").val(name);
	$("#myModal").modal("hide");
}


</script>


</html>