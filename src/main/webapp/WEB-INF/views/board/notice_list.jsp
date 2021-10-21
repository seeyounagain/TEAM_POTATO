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
   <div class="col-8 mainDiv" style="background-color: #dddddd;">
   		<div class="titleDiv">
   			<h3>공지사항</h3>
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
							<c:forEach items="${noticeList }" var="noticeInfo">
								<tr>
									<td>${noticeInfo.noticeCode }</td>
									<td><a href="/content/noticeDetail">${noticeInfo.title }</a></td>
									<td>${noticeInfo.createDate }</td>
									<td>${noticeInfo.readCnt }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="btnDiv">
					<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y' }">
						<button type="button" class="btn btn-primary btn-lg" onclick="location.href='/libManage/noticeForm?menuCode=${menuVO.menuCode}';">공지사항 등록하기</button>
					</c:if>
			</div>
		</div>
</div>
</body>
</html>
