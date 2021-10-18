<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/template/js/menu.js?ver=22"></script>
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
<!-- 			<ul class="nav justify-content-end">
			<li class="nav-item">
				<a class="nav-link" aria-current="page" href="#">환영합니다, <span style="text-decoration: underline 1px black;">이용자</span>님 :)</a>
			</li>
			<li class="nav-item">
				<img class="line" src="/resources/img/top_line.jpg">
			</li>
			<li class="nav-item">
				<a class="nav-link" aria-current="page" href="#">로그아웃</a>
			</li>
			</ul> -->
		<!-- 비로그인시 -->
			<ul class="nav justify-content-end">
			<li class="nav-item">
				<a class="title" aria-current="page" href="/user/userJoinForm">회원가입</a>
			</li>
			<li class="nav-item">
				<img class="line" src="/resources/img/top_line.jpg">
			</li>
			<li class="nav-item">
				<a class="title" aria-current="page" href="#">로그인</a>
			</li>
			</ul>
		</div>
</div>

<!-- 메뉴 -->
<div class="row mb-2 menu2">
	<div class="col-12 text-center mb-3">
		<img class="logo" width="200px" src="/resources/img/logo5.png" onclick="location.href='/content/test'">
	</div>
	<div class="col-12 pb-2">
		<ul class="nav justify-content-center">
			<li class="nav-item">
				<a class="dropdown-toggle title" href="#" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">자료검색</a>
				<ul class="dropdown-menu">
					<li><a class="dropdown-item" href="#">하위메뉴1</a></li>
					<li><a class="dropdown-item" href="#">하위메뉴2</a></li>
					<li><a class="dropdown-item" href="#">하위메뉴3</a></li>
				</ul>
			</li>
			<li class="nav-item">
				<img class="line" src="/resources/img/top_line.jpg">
			</li>
			<li class="nav-item">
				<a class="dropdown-toggle title" href="#" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">서비스</a>
				<ul class="dropdown-menu">
					<li><a class="dropdown-item" href="#">하위메뉴1</a></li>
					<li><a class="dropdown-item" href="#">하위메뉴2</a></li>
					<li><a class="dropdown-item" href="#">하위메뉴3</a></li>
				</ul>
			</li>
			<li class="nav-item">
				<img class="line" src="/resources/img/top_line.jpg">
			</li>
			<li class="nav-item">
				<a class="dropdown-toggle title" href="#" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">도서관정보</a>
				<ul class="dropdown-menu">
					<li><a class="dropdown-item" href="#">하위메뉴1</a></li>
					<li><a class="dropdown-item" href="#">하위메뉴2</a></li>
					<li><a class="dropdown-item" href="#">하위메뉴3</a></li>
				</ul>
			</li>
			<li class="nav-item">
				<img class="line" src="/resources/img/top_line.jpg">
			</li>
			<li class="nav-item">
				<a class="dropdown-toggle title" href="#" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">참여마당</a>
				<ul class="dropdown-menu">
					<li><a class="dropdown-item" href="#">하위메뉴1</a></li>
					<li><a class="dropdown-item" href="#">하위메뉴2</a></li>
					<li><a class="dropdown-item" href="#">하위메뉴3</a></li>
				</ul>
			</li>
			<li class="nav-item">
				<img class="line" src="/resources/img/top_line.jpg">
			</li>
			<!-- 이용자 / 관리자에 따라 표출할 메뉴 -->
			<li class="nav-item">
				<a class="dropdown-toggle title" href="#" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">나의도서관</a>
				<ul class="dropdown-menu">
					<li><a class="dropdown-item" href="/user/test">하위메뉴1</a></li>
					<li><a class="dropdown-item" href="#">하위메뉴2</a></li>
					<li><a class="dropdown-item" href="#">하위메뉴3</a></li>
				</ul>
			</li>
			<li class="nav-item">
				<img class="line" src="/resources/img/top_line.jpg">
			</li>
			<li class="nav-item">
				<a class="dropdown-toggle title" href="/admin/test" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">도서관관리</a>
				<ul class="dropdown-menu">
					<li><a class="dropdown-item" href="/admin/test">하위메뉴1</a></li>
					<li><a class="dropdown-item" href="#">하위메뉴2</a></li>
					<li><a class="dropdown-item" href="#">하위메뉴3</a></li>
				</ul>
			</li>
		</ul>
	</div>
</div>

</body>
</html>























