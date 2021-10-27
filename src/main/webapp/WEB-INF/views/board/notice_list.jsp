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
a:hover{
	color: black;
}
</style>
</head>
<body>
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
