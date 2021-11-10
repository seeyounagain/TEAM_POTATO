<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.mainDiv{
	background-color: white;
}
.titleDiv{
	width: 100%;
	margin: 0 auto;
	padding-top: 10px;
	padding-bottom: 5px;
	margin-bottom: 15px;
	background-color: white;
}
.table{
	width: 100%;
}
.tableA:hover{
	color: black;
	text-decoration: underline;
	font-weight: bold;
}
.tableDiv{
	padding-top: 30px;
}
.form-select{
	width: 100px;
}
.pageDiv{
	padding-top: 10px;
}
</style>
</head>
<body>
<div class="row justify-content-center">
   <div class="col-12 mainDiv">
   		<div class="titleDiv">
   			<h2 class="text-first fw-bold">공지사항</h2>
   			<hr>
   		</div>
			<form action="/board/notice?menuCode=${menuVO.menuCode }" method="post">
						<div class="input-group" style="width: 100%;">
						<select class="form-select" name ="searchKeyword" id="searchKeyword" style="width: 50px;">
						  <option value="title">제목</option>
						  <option value="content"  <c:if test="${noticeVO.searchKeyword eq 'content'}">
							  	selected
							  </c:if> >내용</option>
						</select>
						  <input class="form-control me-2" value="${noticeVO.searchValue }" name="searchValue" placeholder="검색어를 입력하세요" aria-label="Search">
						  <input class="btn btn-primary" type="submit" value="검색">
						</div>
			</form>
			<div class="tableDiv">
					<table class="table table-striped text-center">
							<colgroup>
								<col width="15%">
								<col width="55%">
								<col width="20%">
								<col width="10%">
							</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성일</th>
								<th>조회수</th>
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
											<td align="left"><a class="tableA" href="/board/noticeDetail?noticeCode=${info.noticeCode }&menuCode=${menuVO.menuCode}">${info.title }</a></td>
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
		
			<div class="col-12 pageDiv">
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
					 <c:if test="${noticeVO.prev }">
						<li class="page-item">
						<a class="page-link" href="/board/notice?nowPage=${noticeVO.startPage - 1 }&menuCode=${menuVO.menuCode}" aria-label="Previous">
						<span aria-hidden="true">&laquo;</span>
						</a>
						</li>
					 </c:if> 
						<c:forEach var="pageNum" begin="${noticeVO.startPage }" end="${noticeVO.endPage }">
							<li class="page-item  <c:if test="${noticeVO.nowPage eq pageNum }">active</c:if>  ">
							<a class="page-link" href="/board/notice?nowPage=${pageNum }&menuCode=${menuVO.menuCode}">${pageNum }</a>
							</li>
						</c:forEach>
					<c:if test="${noticeVO.next }">
						<li class="page-item">
						<a class="page-link" href="/board/notice?nowPage=${noticeVO.endPage + 1 }&menuCode=${menuVO.menuCode}" aria-label="Next">
						<span aria-hidden="true">&raquo;</span>
						</a>
						</li>
					</c:if>
					</ul>
				</nav>
			</div>
</div>
</body>
</html>
