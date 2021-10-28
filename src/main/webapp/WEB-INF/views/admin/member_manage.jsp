<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/admin/js/member_manage.js?ver=3" ></script>
<style type="text/css">
#bookT > caption {
	text-align: right;
}
.cap {
	color: black;
}
</style>
</head>
<body>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">회원정보</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
		<div class="modal-body">
		  <div class="container-fluid">
		    <table class="table table-hover table-bordered text-center caption-top" style="width: 100%;">
		    	<caption class="cap" >&lt;대여도서정보&gt;</caption>
		    	<tr id="rentalTr">
		    		<td>표제 / 저자</td>
		    		<td>도서상태</td>
		    		<td>대여일시</td>
		    		<td>반납기한</td>
		    	</tr>
		    </table>
		    <table class="table table-hover table-bordered text-center caption-top" style="width: 100%;">
		    	<caption class="cap" >&lt;예약도서정보&gt;</caption>
		    	<tr id="reserveTr">
		    		<td>표제 / 저자</td>
		    		<td>도서상태</td>
		    		<td>대여가능일시</td>
		    	</tr>
		    </table>
		  </div>
		</div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
<!-- modal 종료 -->

<h1 class="text-center">회원관리</h1>
<hr>

<table id="bookT" class="table table-hover table-bordered caption-top text-center">
	
	<caption>현재 대여 또는 예약중인 도서의 수 입니다. (반납 완료, 예약 종료 등은 제외)</caption>
		
	<colgroup>
		<col width="10%">
		<col width="20%">
		<col width="20%">
		<col width="20%">
		<col width="10%">
		<col width="10%">
		<col width="10%">
	</colgroup>
		
	<thead>
		<tr>
			<td>No.</td>
			<td>ID</td>
			<td>이름</td>
			<td>생년월일</td>
			<td>대여권수</td>
			<td>예약권수</td>
			<td>도서정보</td>
		</tr>
	</thead>
	<tbody>
		<c:choose>
			<c:when test="${not empty memberList }">
			<c:forEach var="member" items="${memberList }" varStatus="status">
				<tr>
					<td>${status.count }</td>
					<td>${member.id }</td>
					<td>${member.name }</td>
					<td>${member.birth }</td>
					<td>${member.rentalCnt }</td>
					<td>${member.reserveCnt }</td>
					<td>
					<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-id="${member.id }" >도서정보조회</button>
					</td>
				</tr>
			</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="6">회원정보가 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</tbody>
</table>
</body>
</html>