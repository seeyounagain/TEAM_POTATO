<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TITLE</title>
<script type="text/javascript" src="/resources/search/js/search_form.js?ver=1" ></script>
<style type="text/css">
.content {
	background-color: white;
}
.bookTitle {
	font-size: 22px;
	font-weight: bold;
}
.bookTitle:hover {
	text-decoration: underline 2px black;
	cursor: pointer;
	color: black;
}
.titleA:hover {
	color: black;
}
</style>
</head>
<body>

<div class="row justify-content-center">
	<div class="col-8">
	<img src="/resources/bookImgUpload/${bookVO.bookImgVO.attachedImgName }"><br>
	${bookVO.bookCode }<br>
	${bookVO.title }<br>
	${bookVO.writer }<br>
	${bookVO.kdc }<br>
	${bookVO.page }<br>
	${bookVO.bookSize }<br>
	${bookVO.keyword }<br>
	${bookVO.publisher }<br>
	${bookVO.pubDate }<br>
	${bookVO.summary }<br>
	${bookVO.intro }<br>
	${bookVO.area }<br>
	${bookVO.status }<br>
	</div>
</div>
</body>
</html>