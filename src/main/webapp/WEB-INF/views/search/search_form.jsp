<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TITLE</title>
<script type="text/javascript" src="/resources/search/js/search_form.js?ver=6" ></script>
<style type="text/css">
.content {
	background-color: white;
}
.keyword {
	width: 10%;
}
#searchBox {
	display: none;
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
		<h1 class="display-6 text-center">도서검색</h1>
		<hr>
		<div class="row justify-content-center">
			<div class="col-8">
				<input type="text" class="form-control" id="id" name="id" placeholder="검색어를 입력해주세요.">
			</div>
			<div class="col-2 d-grid" style="padding-left: 3px;">
				<button type="button" class="btn btn-primary">검색</button>
			</div>
			<div class="col-2 d-grid" style="padding-left: 3px;">
				<button id="detailBtn" type="button" class="btn btn-primary">상세검색</button>
			</div>
		<div id="searchBox">
			<div class="input-group mt-5 mb-3">
			  <select name="KDC_NUM" class="form-select" id="inputGroupSelect02">
			    <option value="ALL">전체</option>
			    <c:forEach var="cate" items="${cateList }">
			    <option value="${cate.kdcNum }">${cate.kdcName }</option>
			    </c:forEach>
			  </select>
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text keyword" id="inputGroup-sizing-default">제목</span>
			  <input type="text" name="TITLE" class="form-control" aria-describedby="inputGroup-sizing-default" placeholder="제목">
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text keyword" id="inputGroup-sizing-default">저자</span>
			  <input type="text" name="WRITER" class="form-control" aria-describedby="inputGroup-sizing-default" placeholder="글쓴이">
			  <span class="input-group-text keyword" id="inputGroup-sizing-default">역자</span>
			  <input type="text" name="TRANSLATOR" class="form-control" aria-describedby="inputGroup-sizing-default" placeholder="옮긴이">
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text keyword" id="inputGroup-sizing-default">출판사</span>
			  <input type="text" name="PUBLISHER" class="form-control" aria-describedby="inputGroup-sizing-default" placeholder="출판사">
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text keyword" id="inputGroup-sizing-default">ISBN</span>
			  <input type="text" name="ISBN" class="form-control" aria-describedby="inputGroup-sizing-default" placeholder="ISBN">
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text keyword" id="inputGroup-sizing-default">발행년 ${nowDate}   </span>
			  <input type="date" class="form-control" aria-describedby="inputGroup-sizing-default" value="${nowDate }">
			  <span style="align-self: center;">&nbsp;~&nbsp;</span><input type="date" class="form-control" aria-describedby="inputGroup-sizing-default" value="${nowDate }">
			</div>
			<div class="input-group d-grid mb-3" style="padding-left: 3px;">
				<button type="button" class="btn btn-primary">상세검색</button>
			</div>
		</div>
		</div>
		
		<table class="table table-hover table-bordered caption-top text-center" style="height: 400px;">
			<tr>
				<td>검색조건을 입력해주세요.</td>
			</tr>
		</table>
		
	</div>
</div>

	
<%-- 	<table class="table table-hover table-bordered caption-top">
		<caption>도서 ${bookList.size() }건의 검색결과</caption>
	<c:choose>
		<c:when test="${not empty bookList }">
		<c:forEach var="book" items="${bookList }" varStatus="status">
		<tr>
			<td><span>${status.count }.</span>
				<div class="bookTitle"><a class="titleA" href="/search/bookDetail?bookCode=${book.bookCode }?menuCode=${menuVO.menuCode}">${book.title }</a></div>
				<div class="mt-2">${book.writer } / ${book.publisher } / ${book.pubDate }</div>
				<div class="mt-2"><c:if test="${book.status eq 0 }">대출 가능</c:if><c:if test="${book.status eq 1 }">대출중</c:if><c:if test="${book.status eq 2 }">예약중</c:if>
				&nbsp;/&nbsp;${book.area }</div>
			</td>
			<td class="text-center">
				<img style="width: 100px;" src="/resources/bookImgUpload/${book.bookImgVO.attachedImgName }" alt="#">
			</td>
		</tr>
		</c:forEach>
		</c:when>
		<c:otherwise>
		<tr>
			<td>검색어를 입력해주세요.</td>
		</tr>
		</c:otherwise>
		</c:choose>
	</table> --%>


</body>
</html>