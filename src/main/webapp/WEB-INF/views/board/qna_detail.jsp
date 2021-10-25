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
   					<td>답변자</td>
   					<td>답변 내용</td>
   				</tr>
   			</table>
   		</div>
   		<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y'}">
   			<div class="tableDiv">
   			<table class="table adminAnswerTable">
   				<tr>
   					<td>${sessionScope.loginInfo.id }</td>
   					<td>답변 내용</td>
   				</tr>
   			</table>
   		</div>
   		</c:if>
	</div>
</div>
</body>
</html>