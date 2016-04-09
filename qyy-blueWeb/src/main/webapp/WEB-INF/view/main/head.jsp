<div class="navbar-inner">
   <div class="container-fluid">
	  <a class="brand" href="#"><small><i class="icon-leaf"></i>${system.webappName}</small> </a>
	  <ul class="nav ace-nav pull-right">
			<li class="light-blue user-profile">
				<a class="user-menu dropdown-toggle" href="#" data-toggle="dropdown">
					<i class="icon-leaf"></i>
					<!-- <img alt="Jason's Photo" src="static/avatars/user.jpg" class="nav-user-photo" /> -->
					<span id="user_info">
						<small>---欢迎您!</small> ${system.u.username}
					</span>
					<i class="icon-caret-down"></i>
				</a>
				<ul id="user_menu" class="pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-closer">
					<li><a href="javascript:targetMainFrame('admin/user/toEdit?userId=${system.user.id}&op=modSelf');"><i class="icon-user"></i> 修改资料</a></li>
					<li class="divider"></li>
					<li><a href="javascript:targetMainFrame('admin/login?op=outLogin');"><i class="icon-off"></i> 退出</a></li>
				</ul>
			</li>
	  </ul><!--/.ace-nav-->
   </div><!--/.container-fluid-->
</div><!--/.navbar-inner-->