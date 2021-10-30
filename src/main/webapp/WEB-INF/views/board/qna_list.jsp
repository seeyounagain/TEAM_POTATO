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
</style>
</head>
<body>
<div class="row justify-content-center">
   <div class="col-12 mainDiv">
   		<div class="titleDiv">
   			<h1 class="display-6 text-center">상담 / 문의</h1>
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
								<!-- 관리자 혹은 비밀번호가 없는 title 클릭하면 비밀번호 확인 없이 바로 detail로 이동 -->
									<c:choose>
										<c:when test="${sessionScope.loginInfo.isAdmin eq 'Y' or empty info.qnaPw}">
											<a href="/board/qnaDetail?qnaCode=${info.qnaCode}&menuCode=${menuVO.menuCode}">${info.title }
												<c:if test="${info.answerCnt != 0}">
													<span class="m-2 complete">답변완료</span>
												</c:if>
											</a>	
										</c:when>
										<c:otherwise>
											<img src="/resources/img/icon_secret.png" width="13px;"> 
											<a href="/board/qnaPassword?qnaPw=${info.qnaPw }&qnaCode=${info.qnaCode}&menuCode=${menuVO.menuCode}">${info.title }
												<c:if test="${info.answerCnt != 0}">
													<span class="m-2 complete">답변완료</span>
												</c:if>
											</a>	
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
		</div>
</body>
</html>
