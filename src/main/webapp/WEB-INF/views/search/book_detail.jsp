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
		<table>
			<tr>
				<td colspan="2">
					${bookVO.title }
				</td>
			</tr>
			<tr>
				<td>
					지은이 / 옮긴이
				</td>
				<td>
					${bookVO.writer }
				</td>
			</tr>
			<tr>
				<td>
					출판사
				</td>
				<td>
					${bookVO.publisher }
				</td>
			</tr>
			<tr>
				<td>
					발행년
				</td>
				<td>
					${bookVO.pubDate }
				</td>
			</tr>
			<tr>
				<td>
					청구기호
				</td>
				<td>
					${bookVO.kdc }
				</td>
			</tr>
		</table>
	<img src="/resources/bookImgUpload/${bookVO.bookImgVO.attachedImgName }"><br>
	${bookVO.bookCode }<br>
	<br>
	<br>
	${bookVO.page }<br>
	${bookVO.bookSize }<br>
	${bookVO.keyword }<br>
	<br>
	<br>
	${bookVO.summary }<br>
	${bookVO.intro }<br>
	${bookVO.area }<br>
	${bookVO.status }<br>
	</div>
</div>
</body>
</html>