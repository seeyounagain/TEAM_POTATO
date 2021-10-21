<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
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
</style>
</head>
<body>
<div class="row justify-content-center">
   <div class="col-8 mainDiv" style="background-color: olive;">
   		<div class="titleDiv">
   			<h3>문의&상담</h3>
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
							<c:forEach items="${qnaList }" var="qnaInfo">
							<tr>
								<td>${qnaInfo.qnaCode }</td>
								<td><a href="/content/qnaDetail">${qnaInfo.title }</a></td>
								<td>${qnaInfo.writer }</td>
								<td>${qnaInfo.createDate }</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<c:if test="${sessionScope.loginInfo.isAdmin eq 'N' }">
					<div class="btnDiv">
						<button type="button" class="btn btn-primary btn-lg" onclick="location.href='/board/qnaForm?menuCode=${menuVO.menuCode}';">문의/상담 등록하기</button>
					</div>                                                
				</c:if>
			</div>
		</div>
</body>
</html>
