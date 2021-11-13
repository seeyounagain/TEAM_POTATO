<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/board/js/notice_detail.js?ver=5"></script>
</head>
<body>
<div class="row justify-content-center">
   <div class="col-12 mainDiv">
   		<div class="titleDiv">
   			<h2 class="text-first fw-bold">공지사항</h2>
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
	   				<c:if test="${not empty notice.attachFileVO.attachedFileName }" >
					<tr>
						<td colspan="6" style="border-bottom: none;">
	   						<div class="row justify-content-center" style="width: 600px; text-align: center;">
				    			<img id="noticeImg" src="/resources/noticeFileUpload/${notice.attachFileVO.attachedFileName }">
				    		</div>
	   					</td>
					</tr>
	   				</c:if>
	   				<tr>
	   					<td colspan="6" height="200px;">${notice.content }</td>
	   				</tr>
   				</tbody>
   			</table>
   		</div>
   		<div class="btnDiv text-center">
	   		<c:if test="${sessionScope.loginInfo.isAdmin  eq 'Y' }">
	   			<input type="hidden" value="${notice.noticeCode }" id="noticeCode">
	   			<input type="hidden" value="${menuVO.menuCode }" id=menuCode>
	   			<input class="btn btn-primary btn-md" type="button" value="수정" onclick="location.href='/board/updateNotice?noticeCode=${notice.noticeCode}&menuCode=${menuVO.menuCode}';">
	   			<input class="btn btn-primary btn-md" type="button" value="삭제" onclick="deleNotice();">
	   		</c:if>
	   			<input class="btn btn-primary btn-md" type="button" value="목록" onclick="location.href='/board/notice?menuCode=${menuVO.menuCode}';">
   		</div>
   	</div>
</div>

<!-- 알림 모달 -->
		<div class="modal fade" id="noticeCompleteModal" tabindex="-1" aria-labelledby="noticeCompleteModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" style="color: black;" id="noticeCompleteModalLabel">알림</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body" id="deleModalContent">
				
		      </div>
		      <div class="modal-footer">
		      	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
		        <button type="button" class="btn btn-primary deleModalClose" data-bs-dismiss="modal" onclick="confirmDele(menuCode,noticeCode);">확인</button>
		      </div>
		    </div>
		  </div>
		</div>
</body>
</html>