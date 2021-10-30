<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TITLE</title>
<script type="text/javascript" src="/resources/search/js/search_form.js?ver=16" ></script>
<style type="text/css">
.content {
	background-color: white;
}
.keyword {
	width: 10%;
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
.searchB input{
	background-image: url(/resources/img/search_g.png);
	background-position: 10px center;
	background-repeat: no-repeat;
	background-size: 20px;
	padding-left: 60px;
}
.searchB input:focus{
	background-image:none;
}
.highlight {
	color: white;
	background-color: #0b70b9;
	font-weight: bold;
}
.page-item.active .page-link {
    z-index: 3;
    background-color: #6c757d;
    color: white;
    border-color: #6c757d;
}
</style>
</head>
<body>

<div class="row justify-content-center">
	<div class="col-12">
	<form action="/search/bookSearch" method="post">		
		<h1 class="display-6 text-center">통합검색</h1>
		<hr>
		<div class="row justify-content-center">
			<div class="col-8 p-3">
				<div class="searchB">
				<input type="text"  <c:if test="${not empty bookVO.searchValue }">value="${bookVO.searchValue} "</c:if>  class="form-control p-2" id="searchValue" name="searchValue" placeholder="       검색어를 입력해주세요.">
				</div>
			</div>
			<div class="col-2 d-grid p-3" style="padding-left: 3px;">
				<input type="hidden" value="${menuVO.menuCode }" name="menuCode">
				<input type="submit" value="검색" id="goSearchBtn" class="btn btn-primary p-2">
			</div>			
		</div>
	</form>
	</div>

	<div class="col-12">
	<table class="table table-hover table-bordered caption-top">
		
		<c:if test="${not empty searchList }">
		<caption>도서 ${searchList.size() }건의 검색결과</caption>
		</c:if>
		
		<c:choose>
			<c:when test="${not empty searchList }">
				<c:forEach var="book" items="${searchList }" varStatus="status">
				<tr>
					<td class="searchBook"><span>${status.count }.</span>
						<div class="bookTitle"><a class="titleA" href="/search/bookDetail?bookCode=${book.bookCode }&menuCode=${menuVO.menuCode}">${book.title }</a></div>
						<div class="mt-2">${book.writer } / ${book.publisher } / ${book.pubDate }</div>
						<div class="mt-2"><c:if test="${book.status eq 1 }">대출 가능</c:if><c:if test="${book.status eq 2 }">대출중</c:if><c:if test="${book.status eq 3 }">대출중 / 예약중</c:if>
						<c:if test="${book.status eq 4 }">대출중 / 연체중</c:if><c:if test="${book.status eq 5 }">대출대기중 / 예약중 </c:if>&nbsp;/&nbsp;${book.area }</div>
					</td>
					<td class="text-center">
						<img style="width: 100px;" src="/resources/bookImgUpload/${book.bookImgVO.attachedImgName }" alt="#">
					</td>
				</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr height="500px;">
					<td colspan="2" class="text-center">
						<c:if test="${not empty bookVO.searchValue }">
						해당되는 도서가 없습니다.
						</c:if>
						<c:if test="${empty bookVO.searchValue }">
						검색어를 입력해주세요.
						</c:if>
					</td>
				</tr>
			</c:otherwise>
		</c:choose>
			
	</table>
	</div>	

<c:if test="${not empty searchList }">
	
	<div class="col-12">
		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
			 <c:if test="${bookVO.prev }">
				<li class="page-item">
				<a class="page-link" href="/search/bookSearch?nowPage=${bookVO.startPage - 1 }&menuCode=${menuVO.menuCode}" aria-label="Previous">
				<span aria-hidden="true">&laquo;</span>
				</a>
				</li>
			 </c:if> 
				<c:forEach var="pageNum" begin="${bookVO.startPage }" end="${bookVO.endPage }">
					<li class="page-item  <c:if test="${bookVO.nowPage eq pageNum }">active</c:if>  ">
					<a class="page-link" href="/search/bookSearch?nowPage=${pageNum }&menuCode=${menuVO.menuCode}">${pageNum }</a>
					</li>
				</c:forEach>
			<c:if test="${bookVO.next }">
				<li class="page-item">
				<a class="page-link" href="/search/bookSearch?nowPage=${bookVO.endPage + 1 }&menuCode=${menuVO.menuCode}" aria-label="Next">
				<span aria-hidden="true">&raquo;</span>
				</a>
				</li>
			</c:if>
			</ul>
		</nav>
	</div>	

</c:if>

</div>

</body>
</html>