<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/search/js/book_manage.js?ver=11" ></script>
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

<h1 class="text-center">도서관리</h1>
<hr>
	<button type="button" class="btn btn-primary mb-3" onclick="location.href='/libManage2/regBookForm?menuCode=${menuVO.menuCode}&sideMenuCode=${sideMenu.sideMenuCode}'">신규도서등록</button>
	<select name="status" class="form-select" id="statusSelect">
		<option value="5">전체</option>
		<option value="1">대출가능</option>
		<option value="2">대출중</option>
		<option value="3">연체중</option>
		<option value="4">예약중</option>
	</select>
	
<table id="bookT" class="table table-hover table-bordered caption-top">
	<thead>
		<tr class="text-center">
			<td>도서정보</td>
			<td>대출/반납</td>
			<td>도서정보수정</td>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="book" items="${bookList }" varStatus="status">
		<tr>
		<td><span>${status.count }.</span>
			<div class="bookTitle"><a class="titleA" href="/search/bookDetail?bookCode=${book.bookCode }?menuCode=${menuVO.menuCode}&sideMenuCode=${sideMenu.sideMenuCode}">${book.title }</a></div>
			<div class="mt-2">${book.writer } / ${book.publisher } / ${book.pubDate }</div>
			<div class="mt-2"><c:if test="${book.status eq 1 }">대출 가능</c:if><c:if test="${book.status eq 2 }">대출중</c:if><c:if test="${book.status eq 3 }">연체중</c:if>
			<c:if test="${book.status eq 4 }">예약중</c:if>&nbsp;/&nbsp;${book.area }</div>
		</td>
		<td class="text-center">
				<c:if test="${book.status eq 1 or book.status eq 4 }">
					<button type="button" class="btn btn-primary">대출</button>
				</c:if>
				<c:if test="${book.status eq 2 or book.status eq 3 }">
					<button type="button" class="btn btn-warning">반납</button>
				</c:if>
		</td>
		<td class="text-center">
			<button type="button" class="btn btn-danger">도서정보수정</button>
		</td>
		</tr>
	</c:forEach>
	</tbody>
</table>

</body>
</html>