<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="indexfooter footer">
	<div class="content tc">
		<div class="olinks_wrap">
			<h3>合作伙伴<br/>Partner</h3>
			<div class="olinks">
				<c:forEach var="friend" items="${friendsLinkList }">
					<a target="_blank" href="${friend.friendLink }">${friend.friendName }</a>
				</c:forEach>
			</div>
		</div>
		<p class="mb20 fourlinks"><a href="pc/aboutWe">关于我们</a><span class="divid-line"></span><a href="pc/contactWe">联系我们</a><span class="divid-line"></span><a href="pc/helpMain">帮助中心</a><span class="divid-line"></span><a href="pc/protocol">用户协议</a></p>
		<p class="copyright">Copyright @ 2015 贵州黔易游商务有限公司。 著作权所有，并保留一切权利。 黔ICP备15014846号-1</p>
	</div>
</div>