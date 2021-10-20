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
body {
	background-color: white;
}
.keyword {
	width: 10%;
}
#searchBox {
	visibility: hidden;
}
#bookT {
	border-collapse: collapse;
	border: 1px black solid;
}
</style>
</head>
<body>

	<h1 class="display-6 text-center">자료검색</h1>
	<hr>

<div class="row justify-content-center">
	<div class="col-6">
		<div class="row justify-content-center">
			<div class="col-8">
				<input type="text" class="form-control" id="id" name="id" placeholder="검색어를 입력해주세요.">
			</div>
			<div class="col-2 d-grid checkId" style="padding-left: 3px;">
				<button type="button" class="btn btn-primary">검색</button>
			</div>
			<div class="col-2 d-grid checkId" style="padding-left: 3px;">
				<button id="detailBtn" type="button" class="btn btn-primary">상세검색</button>
			</div>
			<div id="searchBox">
			<div class="input-group mt-5 mb-3">
			  <select name="KDC_NAME" class="form-select" id="inputGroupSelect02">
			    <option selected>분류</option>
			    <option value="1">One</option>
			    <option value="2">Two</option>
			    <option value="3">Three</option>
			  </select>
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text keyword" id="inputGroup-sizing-default">제목</span>
			  <input type="text" name="TITLE" class="form-control" aria-describedby="inputGroup-sizing-default">
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text keyword" id="inputGroup-sizing-default">저자</span>
			  <input type="text" name="WRITER" class="form-control" aria-describedby="inputGroup-sizing-default">
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text keyword" id="inputGroup-sizing-default">출판사</span>
			  <input type="text" name="PUBLISHER" class="form-control" aria-describedby="inputGroup-sizing-default">
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text keyword" id="inputGroup-sizing-default">ISBN</span>
			  <input type="text" name="ISBN" class="form-control" aria-describedby="inputGroup-sizing-default">
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text keyword" id="inputGroup-sizing-default">발행년</span>
			  <input type="date" class="form-control" aria-describedby="inputGroup-sizing-default">
			  <span style="align-self: center;">&nbsp;~&nbsp;</span><input type="date" class="form-control" aria-describedby="inputGroup-sizing-default">
			</div>
			</div>
		</div>
	</div>
</div>

	<table id="bookT">
		<caption id="cap">도서 ${bookList.size() }건</caption>
	<c:choose>
		<c:when test="${not empty bookList }">
		<c:forEach var="book" items="${bookList }" varStatus="status">
		<tr>
			<td>
				${book.isbn }
			</td>
			<td>
				${book.bookCode }
			</td>
			<td>
				${book.kdcNum },${book.kdc }
			</td>
			<td>
				${book.writer }
			</td>
			<td>
				${book.title }
			</td>
			<td>
				${book.page }p
			</td>
			<td>
				${book.bookSize }cm
			</td>
			<td>
				#${book.keyword }
			</td>
			<td>
				${book.publisher }
			</td>
			<td>
				${book.pubDate }
			</td>
			<td>
				${book.summary }
			</td>
			<td>
				${book.intro }
			</td>
			<td>
				${book.inputDate }
			</td>
			<td>
				${book.area }
			</td>
			<td>
				${book.status }
			</td>
			<td>
				<img style="width: 200px;" src="/resources/bookImgUpload/${book.bookImgVO.attachedImgName }" alt="#">
			</td>
		</tr>
		</c:forEach>
		</c:when>
		<c:otherwise>
		<tr>
			<td>검색된 결과가 없습니다.</td>
		</tr>
		</c:otherwise>
		</c:choose>
	</table>


</body>
</html>