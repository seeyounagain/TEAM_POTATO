<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TITLE</title>
<script type="text/javascript" src="/resources/search/js/search_form.js?ver=17" ></script>
<!-- mark.js 추가하기 -->
<script src='https://cdnjs.cloudflare.com/ajax/libs/mark.js/8.11.1/jquery.mark.min.js'></script>
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
.keyword {
	text-align: center;
    white-space: nowrap;
    background-color: white;
}
#topBtn{
	position: fixed;
	right: 25px; 
	bottom: 25px;
	display: none;
	z-index: 9;
}
.table_highlight{
	color: white;
	background-color: #0b70b9;
	vertical-align: baseline;
}
</style>
</head>
<body>

<a id="topBtn" href="#"><img src="/resources/img/top_b.png" width="50px;" title="위로"></a> 

<div class="row justify-content-center">
	<div class="col-12">
	<form action="/search/bookSearch" method="post">		
		<h2 class="text-first fw-bold">통합검색</h2>
		<hr>
		<div class="row justify-content-center">
			<div class="col-8 p-3">
				<div class="input-group searchB">
					<span class="input-group-text keyword" id="inputGroup-sizing-default">
						<img width="20px;" src="/resources/img/search_g.png">
					</span>
					<input type="text"  <c:if test="${not empty bookVO.searchValue }">value="${bookVO.searchValue}"</c:if> aria-describedby="inputGroup-sizing-default" class="form-control p-2" id="searchValue" name="searchValue" placeholder="검색어를 입력해주세요.">
				</div>
			</div>
			<div class="col-2 d-grid p-3" style="padding-left: 3px;">
				<input type="hidden" value="${menuVO.menuCode }" name="menuCode">
				<input type="submit" value="검색" id="goSearchBtn" class="btn btn-primary">
			</div>			
		</div>
	</form>
	</div>

	<div class="col-12">
	<table class="table table-hover table-bordered caption-top searchTable">
		
		<caption>
		<c:if test="${not empty bookVO.searchValue}">검색어 "${bookVO.searchValue}"에 대한</c:if>
		도서 ${bookVO.totalCnt }건의 검색결과</caption>
		
		<c:choose>
			<c:when test="${not empty searchList }">
				<c:forEach var="book" items="${searchList }" varStatus="status">
				<tr>
					<td class="searchBook">
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
				<a class="page-link" href="/search/bookSearch?nowPage=${bookVO.startPage - 1 }&menuCode=${menuVO.menuCode}&searchValue=${bookVO.searchValue}" aria-label="Previous">
				<span aria-hidden="true">&laquo;</span>
				</a>
				</li>
			 </c:if> 
				<c:forEach var="pageNum" begin="${bookVO.startPage }" end="${bookVO.endPage }">
					<li class="page-item  <c:if test="${bookVO.nowPage eq pageNum }">active</c:if>  ">
					<a class="page-link" href="/search/bookSearch?nowPage=${pageNum }&menuCode=${menuVO.menuCode}&searchValue=${bookVO.searchValue}">${pageNum }</a>
					</li>
				</c:forEach>
			<c:if test="${bookVO.next }">
				<li class="page-item">
				<a class="page-link" href="/search/bookSearch?nowPage=${bookVO.endPage + 1 }&menuCode=${menuVO.menuCode}&searchValue=${bookVO.searchValue}" aria-label="Next">
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

<script>

var keyword = document.getElementById('searchValue').value;

if (keyword != null) {
	$('.searchTable').mark(keyword, {
	  "element": "mark",
	  "className": "table_highlight"
	});
}

</script>

</html>