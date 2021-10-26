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
   <div class="col-8 mainDiv">
   		<div class="titleDiv">
   			<h3>공지사항</h3>
   		</div>
   		
   		<div class="tableDiv">
   			<table class="table">
   				<thead>
   					<tr>
	   					<th colspan="6">${notice.title }</th>
   					</tr>
   				</thead>
   				<tbody>
	   				<tr>
	   					<td>작성자</td>
	   					<td>${notice.name }</td>
	   					<td>작성일</td>
	   					<td>${notice.createDate }</td>
	   					<td>조회수</td>
	   					<td>100</td>
	   				</tr>
	   				<tr>
	   					<td>
	   						<div class="row justify-content-center">
				    			<img id="noticeImg" src="/resources/noticeFileUpload/${noticeVO.attachFileVO.attachedImgName }">
				    		</div>
	   					</td>
	   					<td>${notice.content }</td>
	   				</tr>
   				</tbody>
   			</table>
   		</div>
   		<div class="btnDiv">
	   		<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y' }">
	   			<input type="button" value="삭제" onclick="location.href='/board/deleteNotice?noticeCode=${notice.noticeCode}&menuCode=${menuVO.menuCode }';">
	   		</c:if>
	   			<input type="button" value="뒤로가기" onclick="history.back();">
   		</div>
   		
   			
   		
   	</div>
</div>
</body>
</html>