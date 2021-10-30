<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TITLE</title>
<script type="text/javascript" src="/resources/search/js/search_form.js?ver=8" ></script>
<style type="text/css">
.keyword {
	width: 10%;
	background-color: #0b70b9;
	color: white;
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
</style>
</head>
<body>

<div class="row justify-content-center">
	<div class="col-12">
		<h2 class="text-first fw-bold">상세검색</h2>
		<hr>
<form action="/search/bookDetailSearch" method="post">		
		<div class="row justify-content-center">
			<div id="searchBox">
				<div class="input-group mt-1 mb-3">
				<span class="input-group-text keyword" id="inputGroup-sizing-default">분류</span>
				  <select name="kdcNum" class="form-select" id="inputGroupSelect02">
				    <option value="10">전체</option>
				    <c:forEach var="cate" items="${cateList }">
				    <option value="${cate.kdcNum }">${cate.kdcName }</option>
				    </c:forEach>
				  </select>
				</div>
				<div class="input-group mb-3">
				  <span class="input-group-text keyword" id="inputGroup-sizing-default">제목</span>
				  <input type="text" <c:if test="${not empty bookVO.title }">value="${bookVO.title}"</c:if> name="title" class="form-control" aria-describedby="inputGroup-sizing-default" placeholder="제목">
				</div>
				<div class="input-group mb-3">
				  <span class="input-group-text keyword" id="inputGroup-sizing-default">저자</span>
				  <input type="text" <c:if test="${not empty bookVO.writer }">value="${bookVO.writer}"</c:if> name="writer" class="form-control" aria-describedby="inputGroup-sizing-default" placeholder="글쓴이">
				  <span class="input-group-text keyword" id="inputGroup-sizing-default">역자</span>
				  <input type="text" <c:if test="${not empty bookVO.translator }">value="${bookVO.writer}"</c:if> name="translator" class="form-control" aria-describedby="inputGroup-sizing-default" placeholder="옮긴이">
				</div>
				<div class="input-group mb-3">
				  <span class="input-group-text keyword" id="inputGroup-sizing-default">출판사</span>
				  <input type="text" <c:if test="${not empty bookVO.publisher }">value="${bookVO.writer}"</c:if> name="publisher" class="form-control" aria-describedby="inputGroup-sizing-default" placeholder="출판사">
				</div>
				<div class="input-group mb-3">
				  <span class="input-group-text keyword" id="inputGroup-sizing-default">ISBN</span>
				  <input type="text" <c:if test="${not empty bookVO.isbn }">value="${bookVO.writer}"</c:if> name="isbn" class="form-control" aria-describedby="inputGroup-sizing-default" placeholder="ISBN">
				</div>
				<div class="input-group mb-3">
				  <span class="input-group-text keyword" id="inputGroup-sizing-default">발행년</span>
				  <input type="text" <c:if test="${not empty bookVO.searchBegin }">value="${bookVO.searchBegin}"</c:if> name="searchBegin" class="form-control" aria-describedby="inputGroup-sizing-default" placeholder="발행년도 4자리로 입력해주세요">
				  <span style="align-self: center;">&nbsp;~&nbsp;년도&nbsp;이후&nbsp;</span>
				  <input type="text" <c:if test="${not empty bookVO.searchEnd }">value="${bookVO.searchEnd}"</c:if> name="searchEnd" class="form-control" aria-describedby="inputGroup-sizing-default" placeholder="예) 2014">
				  <span style="align-self: center;">&nbsp;~&nbsp;년도&nbsp;이내&nbsp;</span>
				</div>
				<div class="input-group d-grid mb-3" style="padding-left: 3px;">
					<input type="hidden" value="${menuVO.menuCode }" name="menuCode">
					<input type="submit" value="상세검색" id="goDetailSearchBtn" class="btn btn-primary">
				</div>
			</div>
		</div>
</form>
		
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
						<c:if test="${not empty bookVO}">
						해당되는 도서가 없습니다.
						</c:if>
						<c:if test="${empty bookVO}">
						검색조건을 입력해주세요.
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
</div>

</body>
</html>