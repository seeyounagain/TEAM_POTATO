<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/board/js/qna_list.js?ver=1" ></script>

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
.tableAtag:hover{
	color: black;
	text-decoration: underline;
	font-weight: bold;
}
.answerCnt{
	padding-left: 10px;
	color: gray;
	font-size: small;
}
.complete {
	color: gray;
	font-size: 14px;
	text-decoration: underline 1px gray;
	vertical-align: baseline;
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
   			<h2 class="text-first fw-bold">상담 / 문의</h2>
   			<hr>
   		</div>
			<div class="tableDiv">
					
					<table class="table table-striped text-center">
						<thead>
							<tr>
								<th class="w-10">번호</th>
								<th class="w-60">제목</th>
								<th class="w-10">작성자</th>
								<th class="w-20">작성일</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty list}">
								<tr style="height: 200px;">
									<td colspan="4">등록된 글이 없습니다.</td>
								</tr>
							</c:if>
							
							<c:forEach items="${list }" var="info" varStatus="status">
							<tr>
								<td>${status.count }</td>
								<td>
									 <c:choose>
										<c:when test="${sessionScope.loginInfo.isAdmin eq 'Y' or empty info.qnaPw}">
											<input type="hidden" value="${info.qnaCode}" name="qnaCode">
											<input type="hidden" value="${menuVO.menuCode}" name="qnaCode">
												<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y' and not empty info.qnaPw}">
												<img src="/resources/img/icon_secret.png" width="13px;"> 
												</c:if>
											<a class="tableAtag" href="/board/qnaDetail?qnaCode=${info.qnaCode}&menuCode=${menuVO.menuCode}">${info.title }</a>
												<c:if test="${info.answerCnt != 0}">
													<span class="m-2 complete">답변완료</span>
												</c:if>
										</c:when>
										<c:otherwise>
											<form action="/board/qnaPassword" method="post">
												<input type="hidden"  name="qnaCode" value="${info.qnaCode}">
												<input type="hidden"  name="qnaPw" value="${info.qnaPw }">
												<input type="hidden"  name="menuCode" value="${menuVO.menuCode}">
												<img src="/resources/img/icon_secret.png" width="13px;"> 
												<a class="tableAtag" href="#">${info.title }
												<c:if test="${info.answerCnt != 0}">
													<span class="m-2 complete">답변완료</span>
												</c:if>
												</a>
											</form>
										</c:otherwise>
									</c:choose> 
				
								</td>
								<td>${info.name }</td>
								<td>${info.createDate }</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<c:if test="${sessionScope.loginInfo.isAdmin eq 'N' }">
					<div class="btnDiv text-center">
						<button type="button" class="btn btn-primary btn-md" onclick="location.href='/board/qnaForm?menuCode=${menuVO.menuCode}';">상담 / 문의 등록</button>
					</div>                                                
				</c:if>
			</div>
		
			<div class="col-12 pageDiv">
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
					 <c:if test="${qnaVO.prev }">
						<li class="page-item">
						<a class="page-link" href="/board/qna?nowPage=${qnaVO.startPage - 1 }&menuCode=${menuVO.menuCode}" aria-label="Previous">
						<span aria-hidden="true">&laquo;</span>
						</a>
						</li>
					 </c:if> 
						<c:forEach var="pageNum" begin="${qnaVO.startPage }" end="${qnaVO.endPage }">
							<li class="page-item  <c:if test="${qnaVO.nowPage eq pageNum }">active</c:if>  ">
							<a class="page-link" href="/board/qna?nowPage=${pageNum }&menuCode=${menuVO.menuCode}">${pageNum }</a>
							</li>
						</c:forEach>
					<c:if test="${qnaVO.next }">
						<li class="page-item">
						<a class="page-link" href="/board/qna?nowPage=${qnaVO.endPage + 1 }&menuCode=${menuVO.menuCode}" aria-label="Next">
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
