<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
				<h5>신청중 도서 : </h5>
			</div>			
		</div>
<!-- 도서비치 신청 이동 a태그 구획 -->	
	<div class="row justify-content-end"> 	
		<div class="col-11 text-end mb-1">
		<svg style="vertical-align:text-top;" xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-book" viewBox="0 0 16 16"><path d="M1 2.828c.885-.37 2.154-.769 3.388-.893 1.33-.134 2.458.063 3.112.752v9.746c-.935-.53-2.12-.603-3.213-.493-1.18.12-2.37.461-3.287.811V2.828zm7.5-.141c.654-.689 1.782-.886 3.112-.752 1.234.124 2.503.523 3.388.893v9.923c-.918-.35-2.107-.692-3.287-.81-1.094-.111-2.278-.039-3.213.492V2.687zM8 1.783C7.015.936 5.587.81 4.287.94c-1.514.153-3.042.672-3.994 1.105A.5.5 0 0 0 0 2.5v11a.5.5 0 0 0 .707.455c.882-.4 2.303-.881 3.68-1.02 1.409-.142 2.59.087 3.223.877a.5.5 0 0 0 .78 0c.633-.79 1.814-1.019 3.222-.877 1.378.139 2.8.62 3.681 1.02A.5.5 0 0 0 16 13.5v-11a.5.5 0 0 0-.293-.455c-.952-.433-2.48-.952-3.994-1.105C10.413.809 8.985.936 8 1.783z"/></svg>
		<a href="/service/bookRequest?menuCode=MENU_003&sideMenuCode=SIDE_MENU_006" >도서비치신청 페이지 이동</a>
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
     		<th>신청자</th>
     		<th>신청일</th>
     		<th>진행상황</th>
    	</tr>
    	<tr>
			<td id="requestCodeTd">${a.requestCode }</td>	
			<td>${a.title }</td> 
			<td>${a.writer }</td>   		
			<td>${a.createDate }</td> 
			<td>${a.id }</td> 
			<td class="border-bottom-0"> 접수중 </td>
		</tr>
		<tr class="text-center">
     		<th>발행년도</th>
     		<th>ISBN코드</th>
     		<th>카테고리</th>
     		<th>KDC분류번호</th>
     		<th>KDC분류명칭</th>
     		<td rowspan="2" class="border-bottom-0"><input type="button" class="btn btn-primary" value="신청취소" id="deleteRequest"></td>
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



</body>
</html>