<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/admin/js/book_manage.js?ver=103" ></script>
<script type="text/javascript">
$(function() {
	$(window).scroll(function() { 
		if ($(this).scrollTop() > 150) { 
			$('#topBtn').fadeIn(); } 
		else { $('#topBtn').fadeOut(); }
	}); 
	$("#topBtn").click(function() { 
   	$('html, body').animate({ scrollTop : 0  }, 150); 
    return false; });
});
</script>
<style type="text/css">
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
.rentalB {
    padding-right: 2.2rem!important;
    padding-left: 2.2rem!important;
}
#bookT {
	max-height: 1000px;
	min-height: 200px;
	overflow: scroll;
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

<h2 class="text-first fw-bold">도서관리</h2>
<hr>
	<div class="row mb-3">
		<div class="col-6">
			<button type="button" class="btn btn-primary px-4" onclick="location.href='/libManage/regBookForm?menuCode=${menuVO.menuCode}'">신규도서등록</button>
		</div>		
	    <div class="col-5 align-self-center">
			<div class="input-group searchB">
				<span class="input-group-text keyword" id="inputGroup-sizing-default">
					<img width="20px;" src="/resources/img/search_g.png">
				</span>
				<input type="text" class="form-control p-2" id="searchValue" name="searchValue" placeholder="검색어를 입력해주세요.">
			</div>
		</div>
		<div class="col-1 d-grid align-self-center" style="padding-left: 3px;">
			<input type="button" value="검색" id="goSearchBtn" class="btn btn-primary p-2">
		</div>
	</div>
	
	<div class="col-12">
	<select name="status" class="form-select" id="statusSelect">
		<option value="0">전체</option>
		<option value="1">대출가능</option>
		<option value="2">대출중</option>
		<option value="3">연체중</option>
		<option value="4">예약중</option>
		<option value="5">대출대기중</option>
	</select>
	</div>
	
<table id="bookT" class="table table-hover table-bordered caption-top">

	<caption id="bookTcap">도서 ${bookList.size() }건</caption>

	<colgroup>
		<col width="70%">
		<col width="15%">
		<col width="15%">
	</colgroup>

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
		<td>
			<div class="bookTitle"><a class="titleA" href="/search/bookDetail?bookCode=${book.bookCode }&menuCode=${menuVO.menuCode}&sideMenuCode=SIDE_MENU_013">${book.title }</a></div>
			<div class="mt-2">${book.writer } / ${book.publisher } / ${book.pubDate }</div>
			<div class="mt-2">
			<c:if test="${book.status eq 1 }">대출 가능</c:if>
			<c:if test="${book.status eq 2 }">대출중&nbsp;<span class="mb-2" style="color: blue;">(&nbsp;${book.rentalDate }&nbsp;~&nbsp;${book.limitDate }&nbsp;)&nbsp;</span></c:if>
			<c:if test="${book.status eq 3 }">연체중&nbsp;<span class="mb-2" style="color: red;">(&nbsp;${book.rentalDate }&nbsp;~&nbsp;${book.limitDate }&nbsp;)&nbsp;</span></c:if>
			<c:if test="${book.status eq 4 }">예약중&nbsp;<span class="mb-2" style="color: blue;">(&nbsp;${book.rentalDate }&nbsp;~&nbsp;${book.limitDate }&nbsp;)&nbsp;</span></c:if>
			<c:if test="${book.status eq 5 }">대출대기중&nbsp;<span class="mb-2" style="color: blue;">(&nbsp;${book.rentableStartDate }&nbsp;~&nbsp;${book.rentableEndDate }&nbsp;)&nbsp;</span></c:if>
			</div>
			<div class="mt-2">${book.area }</div>
		</td>
		<td class="text-center">
				<c:if test="${book.status eq 1 }">
					<button type="button" class="btn btn-primary px-5" id="rentalBtn">대출</button>
				</c:if>
				<c:if test="${book.status eq 2 or book.status eq 3}">
					<button type="button" class="btn btn-warning px-5 " id="returnBtn">반납</button>
					<input type="hidden" id="rentalId" value="${book.rentalId }">
				</c:if>
				<c:if test="${book.status eq 4 }">
					<button type="button" class="btn btn-warning px-5 " id="returnBtn">반납</button>
					<input type="hidden" id="rentalId" value="${book.rentalId }">
					<input type="hidden" id="reserveId" value="${book.reserveId }">
				</c:if>
				<c:if test="${book.status eq 5 }">
					<button type="button" class="btn btn-primary rentalB " id="rentalBtn">대출대기</button>
					<input type="hidden" id="reserveId" value="${book.reserveId }">
				</c:if>
		</td>
		<td class="text-center">
			<button type="button" class="btn btn-danger px-5" data-bookCode="${book.bookCode }" onclick="location.href='/libManage/updateBookInfo?bookCode=${book.bookCode }&menuCode=${menuVO.menuCode}'">도서정보수정</button>
		</td>
	</c:forEach>
	</tbody>
</table>

<!-- modal 시작 -->
<div class="modal fade" id="bookManageAlertModal" tabindex="-1" aria-labelledby="bookManageAlertModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="bookManageAlertModalLabel">알림</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id="bookManageAlertText">
      
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
<!-- modal 종료 -->

</body>
</html>