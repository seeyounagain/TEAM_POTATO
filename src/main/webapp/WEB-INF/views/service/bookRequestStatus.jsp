<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/service/js/bookRequestStatus.js?ver=2"></script>
<style type="text/css">


</style>
</head>
<body>


<h2 class="text-first fw-bold">도서비치신청현황</h2><hr>
<input type="hidden" value="${menuVO.menuCode }" class="menuCode">
<div class="row justify-content-center">
	<!-- 이모티콘 구획 -->
	<div class="col-12 container mb-5">
		<div class="row justify-content-center align-middle">
			
			
<!-- 안내구획 -->			
<div class="col-12">



	<div class="col text-center mt-5">	
		<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-emoji-smile" viewBox="0 0 16 16">
  			<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
  			<path d="M4.285 9.567a.5.5 0 0 1 .683.183A3.498 3.498 0 0 0 8 11.5a3.498 3.498 0 0 0 3.032-1.75.5.5 0 1 1 .866.5A4.498 4.498 0 0 1 8 12.5a4.498 4.498 0 0 1-3.898-2.25.5.5 0 0 1 .183-.683zM7 6.5C7 7.328 6.552 8 6 8s-1-.672-1-1.5S5.448 5 6 5s1 .672 1 1.5zm4 0c0 .828-.448 1.5-1 1.5s-1-.672-1-1.5S9.448 5 10 5s1 .672 1 1.5z"/>
		</svg>
	</div>	
	

	
<!-- 리스트 구획 -->
	<div class="row justify-content-center mb-3 mt-2">
		<div class="col-12 text-center mb-3">
			<div>
				<h4>도서비치신청현황</h4><br>
				<h5>신청중 도서 : ${requestCnt } / 5 </h5>
			</div>			
		</div>
<!-- 도서비치 신청 이동 a태그 구획 -->	
	<div class="row justify-content-end"> 	
		<div class="col-11 text-end mb-1">
		<svg style="vertical-align: middle" xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-arrow-right" viewBox="0 0 16 16"><path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z"/></svg>
		<a href="/service/bookRequest?menuCode=MENU_003&sideMenuCode=SIDE_MENU_006" >도서비치신청 안내 페이지 이동</a>
		</div>
	</div>
<!-- 도서비치 신청 이동 a태그 구획 -->	
	<div class="row justify-content-end"> 	
		<div class="col-11 text-end mb-1">
		<svg style="vertical-align: middle" xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-arrow-right" viewBox="0 0 16 16"><path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z"/></svg>
		<a href="/service/bookRequestRegForm?menuCode=MENU_003" >도서비치신청 검색 페이지 이동</a>
		</div>
	</div>	
		
		
			<c:if test="${empty requestBoardList }">
			<tr><td colspan="7">(도서비치신청 내역이 없습니다.)</td></tr>
			</c:if>	
			
	<hr>	
	<c:choose>
	<c:when test="${not empty sessionScope.loginInfo }">		
	<c:forEach items="${requestBoardList }" var="a" varStatus="status">
		<div class="col-12 mt-3 mb-3">
		<table class="table text-center border border-5 border-light">
		<colgroup>
			<col width="15%">
			<col width="20%">
			<col width="20%">
			<col width="20%">
			<col width="15%">
			<col width="10%">
		</colgroup>
    	<tr class="text-center">
     		<th>신청번호</th>
     		<th>책제목</th>
     		<th>저자</th>
     		<th>신청일</th>
     		<th>신청자</th>
     		<th>진행상황</th>
    	</tr>
    	<tr>
			<td id="requestCodeTd">${a.requestCode }</td>	
			<td>${a.title }</td> 
			<td>${a.writer }</td>   		
			<td>${a.createDate }</td> 
			<td>${a.id }</td> 
			<td class="border-bottom-0"> 
			<c:if test="${a.requestStatus == 0 }">접수중</c:if>
			<c:if test="${a.requestStatus == 1 }">접수완료</c:if>
			<c:if test="${a.requestStatus == 2 }">진행중</c:if>
			<c:if test="${a.requestStatus == 3 }">완료</c:if>
			<c:if test="${a.requestStatus == 4 }">비치불가</c:if>
			</td>
		</tr>
		<tr class="text-center">
     		<th>발행년도</th>
     		<th>ISBN코드</th>
     		<th>카테고리</th>
     		<th>KDC분류번호</th>
     		<th>KDC분류명칭</th>
     		<td rowspan="2" style="font-weight: bold;">
     		<input type="button" class="btn btn-primary" value="신청취소"
     		<c:if test="${a.requestStatus == 0}">"신청취소"</c:if>
     		<c:if test="${a.requestStatus != 0}">"진행중" disabled </c:if> 		
     		 id="canselRequest" >
     		</td>
    	</tr>
		<tr>						
			<td>${a.pubDate }</td> 	
			<td>${a.isbn }</td>
			<td>${a.category }</td>
			<td>${a.kdcCode }</td>
			<td>${a.kdcName }</td>	
		</tr>
	</table>	
	</div><hr>                                             		
	</c:forEach>
	</c:when>
	<c:otherwise>
	
	</c:otherwise>
	</c:choose>
	</div>





</div>

		</div>
	</div>
	
</div>
<!-- deleteBookRequestConfirm -->
<div class="modal fade" id="deleteBookRequestConfirm" tabindex="-1" aria-labelledby="deleteConfirmModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="deleteConfirmModalLabel" style="color: black;">알림</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" style="color: black;">
			<p>해당 도서비치 신청을 취소하시겠습니까?<span id="requestCodeP" style="display:none"></span></p>
      </div>
      <div class="modal-footer" style="display: block;">
		<div class="row">
      		<div class="col-12 text-end">
      			<button type="button" class="btn btn-primary px-4" onclick="deleteBookRequest('${menuVO.menuCode}')" >확인</button>
      			<button type="button" class="btn btn-secondary px-4" data-bs-dismiss="modal">취소</button>
      		</div>
      	</div>
      </div>
    </div>
  </div>
</div>


</body>
</html>