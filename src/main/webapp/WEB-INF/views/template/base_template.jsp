<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:insertAttribute name="title"/></title>

<link rel="icon" type="image/png" sizes="32x32" href="/resources/img/planet_b_b.jpg">

<!-- 태그 초기화 작업 -->
<link rel="stylesheet" href="/resources/common/reset.css?ver=8">

<!-- 제이쿼리 문법을 로딩 -->
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<!-- 부트스트랩 사용을 위해 css, js를 로딩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>

<style type="text/css">
.container-fluid{
	width: 90%;
	margin-top: 20px;
	margin-bottom: 20px;
}
body {
	line-height: 1;
    font-family: 'SF_HailSnow';
	font-size: 18px;
}
.menu {
	background-color: #0b70b9;
	color: white;
	font-size: 20px;
}
.content {
	/* background-color: gray; */
}
a , .nav-link {
	color: inherit;
	text-decoration: none;
}
a:visited {
	color: inherit;
	text-decoration: none;
}
a:hover , button:hover {
	cursor: pointer;
	color: #fff584;
}
.btn-primary {
    background-color: #0b70b9;
    border-color: #0b70b9;
    color: #FFF; }
.btn-primary:hover,
.btn-primary:focus {
    border-color: #0f8ae6;
    background-color: #0f8ae6;
    color: #FFF; }
.btn-primary:active,
.btn-primary:visited,
.btn-primary:active:focus,
.btn-primary:active:hover {
    border-color: #0f8ae6;
    background-color: #0f8ae6;
    color: #FFF; }
hr , hr:not([size]) {
	background-color: #0b70b9;
	height: 3px;
	opacity: 1;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col menu">
			<tiles:insertAttribute name="menu"/></div>
		</div>
		<div class="row" style="padding-top: 10px;">
			<div class="col-2"><tiles:insertAttribute name="side"/></div>
			<div class="col-10 content"><tiles:insertAttribute name="body"/></div>
		</div>
		<div class="row" style="padding-top: 40px;">
			<div class="col footer"><tiles:insertAttribute name="foot"/></div>
		</div>
	</div>
</body>
</html>


