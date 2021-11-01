<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function deleNotice(noticeCode) {
		var noticeCode = document.getElementById('noticeCode').value;
		var menuCode = document.getElementById('menuCode').value;
		
		if(	confirm("공지사항을 삭제하시겠습니까?") == true){
			
			location.href = '/board/deleteNotice?noticeCode=' + noticeCode + '&menuCode=' + menuCode;
		
		}else{
			return;
		}
	}
</script>
</head>
<body>
<div class="row justify-content-center">
   <div class="col-12 mainDiv">
   		<div class="titleDiv">
   			<h1 class="display-6 text-center">공지사항</h1>
   			<hr>
   		</div>
   		
   		<div class="tableDiv">
   			<table class="table">
   				<thead>
   					<tr>
	   					<td colspan="6" style="font-size: x-large;">${notice.title }</td>
   					</tr>
   				</thead>
   				<tbody>
	   				<tr>
	   					<td>작성자</td>
	   					<td>${notice.name }</td>
	   					<td>작성일</td>
	   					<td>${notice.createDate }</td>
	   					<td>조회수</td>
	   					<td>${notice.readCnt }</td>
	   				</tr>
	   				<tr>
	   					<td colspan="6">${notice.content }</td>
	   				</tr>
	   				<c:if test="${not empty notice.attachFileVO.attachedFileName }" >
					<tr>
						<td colspan="6">
	   						<div class="row justify-content-center">
				    			<img id="noticeImg" src="/resources/noticeFileUpload/${notice.attachFileVO.attachedFileName }">
				    		</div>
	   					</td>
					</tr>
	   				</c:if>
   				</tbody>
   			</table>
   		</div>
   		<div class="btnDiv text-center">
	   		<c:if test="${sessionScope.loginInfo.isAdmin  eq 'Y' }">
	   			<input type="hidden" value="${notice.noticeCode }" id="noticeCode">
	   			<input type="hidden" value="${menuVO.menuCode }" id=menuCode>
	   			<input class="btn btn-primary btn-md" type="button" value="삭제" onclick="deleNotice();">
	   		</c:if>
	   			<input class="btn btn-primary btn-md" type="button" value="목록" onclick="location.href='/board/notice?menuCode=${menuVO.menuCode}';">
   		</div>
   	</div>
</div>
</body>
</html>