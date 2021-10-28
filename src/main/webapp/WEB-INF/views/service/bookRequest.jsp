<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/service/js/readingSeat.js?ver=4"></script>
<style type="text/css">

.container{
 background-color: white;
 margin: 0 auto;
}

.seat{
background-color: black;
height: 50px;
vertical-align: middle;
}


.map{
width: 80%;
height: 200px;
background-color: white;

}
.a:hover{
color: inherit;	
}

</style>
</head>
<body>

	
	
<div class="container">
<input type="hidden" value="${menuCode }" class="menuCode">
<div class="row justify-content-center text-center">


	
	<!-- 이모티콘 구획 -->
	<div class="col-12 container">
		<div class="row justify-content-center align-middle">
			<div class="col-6 text-center mt-5">	
			<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-emoji-smile" viewBox="0 0 16 16">
  				<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
  				<path d="M4.285 9.567a.5.5 0 0 1 .683.183A3.498 3.498 0 0 0 8 11.5a3.498 3.498 0 0 0 3.032-1.75.5.5 0 1 1 .866.5A4.498 4.498 0 0 1 8 12.5a4.498 4.498 0 0 1-3.898-2.25.5.5 0 0 1 .183-.683zM7 6.5C7 7.328 6.552 8 6 8s-1-.672-1-1.5S5.448 5 6 5s1 .672 1 1.5zm4 0c0 .828-.448 1.5-1 1.5s-1-.672-1-1.5S9.448 5 10 5s1 .672 1 1.5z"/>
			</svg>
			</div>
			<div class="col-8 text-center mt-3">	
				도서비치신청 게시판입니다.
			</div>
		</div>
	</div>
	
	<!-- 스크롤 구획 -->
	<div class="row justify-content-center mb-3 mt-3">
    <div class="tableDiv overflow-auto searchRecordList" style="height: 600px;">
	<table class="table text-center">
  	<thead>
    	<tr class="text-center mt-5">
     		<th scope="col">No.</th>
     		<th scope="col">ISBN코드</th>
     		<th scope="col">책제목</th>
     		<th scope="col">저자</th>
     		<th scope="col">발행/간행일</th>
     		<th scope="col">신청자ID</th>
     		<th scope="col">신청일</th>
    	</tr>
  	</thead>
 	 <tbody>
  		<c:choose>
		<c:when test="${not empty requestBoardList }">
		<c:forEach items="${requestBoardList }" var="a" varStatus="status">
		<tr>
			
			<td class="seat mx-1">도서-${a.requestCode }</td>	
			<td><a href="#">${a.isbn }</a></td>
			<td><a href="#">${a.title }</a></td> 
			<td><a href="#">${a.writer }</a></td>   		
			<td><a href="#">${a.pubDate }</a></td> 	
			<td><a href="#">${a.id }</a></td> 
			<td><a href="#">${a.createDate }</a></td> 
					
		</tr>	                                             		
		</c:forEach>
		</c:when>
		</c:choose>

 	</tbody>
	</table>
	
	</div>
	</div>
</div>
</div>
<div class="row justify-content-center">
   <div class="col-8 mainDiv">
   		<div class="titleDiv">
   			<h1 class="display-6 text-center">공지사항</h1>
   			<hr>
   		</div>
			<div class="tableDiv">
					<table class="table table-striped text-center">
						<thead>
							<tr>
								<th class="w-10">번호</th>
								<th class="w-60">제목</th>
								<th class="w-20">작성일</th>
								<th class="w-10">조회수</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty list}">
									<tr style="height: 200px;">
										<td colspan="4">등록된 글이 없습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach items="${list }" var="info" varStatus="status">
										<tr>
											<td>${status.count }</td>
											<td><a href="/board/noticeDetail?noticeCode=${info.noticeCode }&menuCode=${menuVO.menuCode}">${info.title }</a></td>
											<td>${info.createDate }</td>
											<td>${info.readCnt }</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
				<div class="btnDiv text-center">
					<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y' }">
						<button type="button" class="btn btn-primary btn-md" onclick="location.href='/board/noticeForm?menuCode=${menuVO.menuCode}';">공지사항 등록</button>
					</c:if>
			</div>
		</div>
</div>
	
</body>
</html>



