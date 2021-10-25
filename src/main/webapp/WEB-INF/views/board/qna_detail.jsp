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
<div class="row justify-content-center">
   <div class="col-8 mainDiv" style="background-color: #dddddd;">
   		<div class="titleDiv">
   			<h3>상담/문의</h3>
   		</div>
   		<div class="tableDiv">
   			<table class="table contentTable">
   				<tr>
   					<td>문의 제목</td>
   					<td>${qna.title}</td>
   				</tr>
   				<tr>
   					<td>작성자</td>
   					<td>${qna.writer}</td>
   				</tr>
   				<tr>
   					<td>등록일</td>
   					<td>${qna.createDate}</td>
   				</tr>
   				<tr>
   					<td>문의 내용</td>
   					<td>${qna.content}</td>
   				</tr>
   			</table>
   		</div>
   		<div class="tableDiv">
   			<table class="table answerTable">
   				<tr>
   					<td>${qna.content }</td>
   					<td>${qna.createDate }</td>
   				</tr>
   			</table>
   		</div>
   		<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y'}">
   			<div class="tableDiv">
   			<form action="/board/insertAnswer" method="post">
   			<input type="hidden" value="${sessionScope.loginInfo.id }" name="writer">
   			<input type="hidden" value="${nowDate }" name="createDate">
   			<input type="hidden" value="${qna.qnaCode}" name="qnaCode">
   			<table class="table adminAnswerTable">
   				<tr>
   					<td>${sessionScope.loginInfo.id }</td>
   					<td>
   						<div class="form-floating">
						  <textarea class="form-control" id="floatingTextarea" name="content" style="height: 100px"></textarea>
						  <label for="floatingTextarea">답변을 등록해주세요.</label>
						</div>
   					</td>
   					<td><input class="btn btn-primary" type="submit" value="등록"></td>
   				</tr>
   			</table>
   			</form>
   		</div>
   		</c:if>
	</div>
</div>
</body>
</html>