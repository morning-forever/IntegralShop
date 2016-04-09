<ul class="nav nav-list">
	<li id="homeindex" class="active">
	  <a href="admin/home/index">
		<i class="icon-dashboard"></i>
		<span>后台首页</span>
	  </a>
	</li>
	<c:forEach items="${system.meMenus}" var="menu">
	<li id="${menu.menuKey }">
		<a href="javascript:;" class="dropdown-toggle" >
			<i class="${menu.menuIcon == null ? 'icon-desktop' : menu.menuIcon}"></i>
			<span>${menu.menuName }</span>
			<b class="arrow icon-angle-down"></b>
		</a>
		<ul class="submenu">
			<c:forEach items="${menu.subMenu}" var="sub">
			<c:choose>
			<c:when test="${not empty sub.menuPath}">
			<li id="${sub.menuKey }"><a href="javascript:;" onclick="sideMenu('${sub.menuKey }','${menu.menuKey }','${sub.menuName }','${sub.menuPath }');" target="mainFrame"><i class="icon-double-angle-right"></i> ${sub.menuName }</a></li>
			 	</c:when>
			<c:otherwise>
			<li><a href="javascript:;"><i class="icon-double-angle-right"></i> ${sub.menuName }</a></li>
		  	</c:otherwise>
		  	</c:choose>
		  	</c:forEach>
		</ul>
	</li>
	</c:forEach>
</ul><!--/.nav-list-->
<script>
//菜单状态切换
var fmid = "fhindex";
var mid = "fhindex";
function sideMenu(id,fid,menuName,menuPath){
	if(id != mid){
		$("#"+mid).removeClass();
		mid = id;
	}
	if(fid != fmid){
		$("#"+fmid).removeClass();
		fmid = fid;
	}
	$("#"+fid).attr("class","active open");
	$("#"+id).attr("class","active");
	$("#mainFrame").attr("src",''+menuPath+'');
	//tabAddHandler(id,menuName,menuPath);
	if(menuPath != "admin/home/index"){
		$("#homeindex").attr("class","");
		$("#"+id).attr("class","active");
		//jzts();
	}
}

//清除加载进度
function hangge(){
	$("#jzts").hide();
}

//显示加载进度
function jzts(){
	$("#jzts").show();
}


</script>
