<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TITLE</title>
<script type="text/javascript" src="/resources/search/js/new_book_list.js?ver=13" ></script>
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
#topBtn{
	position: fixed;
	right: 25px; 
	bottom: 25px;
	display: none;
	z-index: 9;
}
</style>
</head>
<body>

<a id="topBtn" href="#"><img src="/resources/img/top_b.png" width="50px;" title="위로"></a> 

<div class="row justify-content-center">
	<div class="col-12">
		<h2 class="text-first fw-bold">신착도서</h2>
		<hr>
		<h5>도서관에 새로 들어온 책을 안내해드립니다.</h5>
		<div class="row justify-content-center">
			<div class="input-group mb-3">
			  <input type="date" <c:if test="${not empty bookVO.searchBegin }">value="${bookVO.searchBegin }"</c:if> id="searchBegin" name="searchBegin" class="form-control" aria-describedby="inputGroup-sizing-default">
			  <span style="align-self: center;">&nbsp;~&nbsp;이후&nbsp;</span>
			  <input type="date" <c:if test="${not empty bookVO.searchEnd }">value="${bookVO.searchEnd }"</c:if> id="searchEnd" name="searchEnd" class="form-control" aria-describedby="inputGroup-sizing-default">
			  <span style="align-self: center;">&nbsp;~&nbsp;이내&nbsp;에 들어온 도서는 총 ${bookVO.totalCnt } 권입니다.</span>
			  <input type="hidden" id="menuCode" value="${menuVO.menuCode}">
			</div>		
			<div class="col-12">
			<table class="table table-hover table-bordered caption-top">
				<c:choose>
					<c:when test="${not empty bookList }">
						<c:forEach var="book" items="${bookList }" varStatus="status">
						<tr>
							<td>
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
						<tr>
							<td colspan="2" class="text-center">
								해당되는 도서가 없습니다.
							</td>
						</tr>
					</c:otherwise>
				</c:choose>
					
			</table>
			</div>
			<div class="col-12">
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
					 <c:if test="${bookVO.prev }">
						<li class="page-item">
						<a class="page-link" href="/search/newBookList?nowPage=${bookVO.startPage - 1 }&menuCode=${menuVO.menuCode}&searchBegin=${bookVO.searchBegin }&searchEnd=${bookVO.searchEnd }" aria-label="Previous">
						<span aria-hidden="true">&laquo;</span>
						</a>
						</li>
					 </c:if> 
						<c:forEach var="pageNum" begin="${bookVO.startPage }" end="${bookVO.endPage }">
							<li class="page-item  <c:if test="${bookVO.nowPage eq pageNum }">active</c:if>  ">
							<a class="page-link" href="/search/newBookList?nowPage=${pageNum }&menuCode=${menuVO.menuCode}&searchBegin=${bookVO.searchBegin }&searchEnd=${bookVO.searchEnd }">${pageNum }</a>
							</li>
						</c:forEach>
					<c:if test="${bookVO.next }">
						<li class="page-item">
						<a class="page-link" href="/search/newBookList?nowPage=${bookVO.endPage + 1 }&menuCode=${menuVO.menuCode}&searchBegin=${bookVO.searchBegin }&searchEnd=${bookVO.searchEnd }" aria-label="Next">
						<span aria-hidden="true">&raquo;</span>
						</a>
						</li>
					</c:if>
					</ul>
				</nav>
			</div>			
		</div>
	</div>
</div>
</body>
</html>


