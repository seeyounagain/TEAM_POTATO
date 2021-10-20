<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/template/js/menu.js?ver=2"></script>
<style type="text/css">
.dropdown-toggle::after {
    display:none;
}
.title {
	color: white;
	margin-left: 15px;
	margin-right: 15px;
}
.logo:hover {
	cursor: pointer;
}
.dropdown-item:active {
	background-color: #0b70b9;
}
</style>
</head>
<body>
<!-- 최상단 로그인 메뉴 -->
<div class="row mt-3 mb-1 menu1" style="font-size: 16px;">
		<div class="col">
		<!-- 로그인시 -->
		<c:choose>
			<c:when test="${not empty sessionScope.loginInfo and sessionScope.loginInfo.isAdmin eq 'N' }">
	 			<ul class="nav justify-content-end">
				<li class="nav-item">
					<a class="title" aria-current="page" href="/myPage/myInfo">환영합니다, <span style="text-decoration: underline 1px black; vertical-align: baseline;">${loginInfo.name }</span>님 :)</a>
				</li>
				<li class="nav-item">
					<img class="line" src="/resources/img/top_line.jpg">
				</li>
				<li class="nav-item">
					<a class="title" aria-current="page" onclick="logout();">로그아웃</a>
				</li>
				</ul>
			</c:when>
			<c:when test="${not empty sessionScope.loginInfo and sessionScope.loginInfo.isAdmin eq 'Y' }">
	 			<ul class="nav justify-content-end">
				<li class="nav-item">
					<a class="title" aria-current="page" href="/libManage/bookManage">환영합니다, <span style="text-decoration: underline 1px black; vertical-align: baseline;">${loginInfo.name }</span>님 :)</a>
				</li>
				<li class="nav-item">
					<img class="line" src="/resources/img/top_line.jpg">
				</li>
				<li class="nav-item">
					<a class="title" aria-current="page" onclick="logout();">로그아웃</a>
				</li>
				</ul>
			</c:when>
			
			<c:otherwise>
		<!-- 비로그인시 -->
			<ul class="nav justify-content-end">
			<li class="nav-item">
				<a class="title" aria-current="page" href="/member/memberJoinInfo" >회원가입</a>
			</li>
			<li class="nav-item">
				<img class="line" src="/resources/img/top_line.jpg">
			</li>
			<li class="nav-item">
				<a class="title" aria-current="page" href="/member/memberLoginForm">로그인</a>
			</li>
			</ul>
			</c:otherwise>
		</c:choose>
		</div>
</div>

<!-- 메뉴 -->
<div class="row mb-2 menu2">
	<div class="col-12 text-center mb-3">
		<img class="logo" width="200px" src="/resources/img/logo5.png" onclick="location.href='/common/main'">
	</div>
	<div class="col-12 pb-2">
		<ul class="nav justify-content-center">
			<li class="nav-item">
				<img class="line" src="/resources/img/top_line.jpg">
			</li>
		<c:forEach var="menu" items="${menuList }">
			<li class="nav-item">
				<a class="dropdown-toggle title" href="#" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">${menu.menuName}</a>
				<ul class="dropdown-menu">
				<c:forEach var="sideMenu" items="${menu.sideMenuList }">
					<li><a class="dropdown-item" href="/${menu.menuUri}/${sideMenu.sideMenuUri }?menuCode=${sideMenu.menuCode}">${sideMenu.sideMenuName }</a></li>
				</c:forEach>
				</ul>
			</li>
			<li class="nav-item">
				<img class="line" src="/resources/img/top_line.jpg">
			</li>
		</c:forEach>
		</ul>
	</div>
</div>

</body>
</html>























