<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/board/js/qna_detail.js?ver=13" ></script>
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
}
.qnaTable, .answerTable, .aFormTable{
	width: 100%;
}
.qnaTable tr > td:first-child{
	background-color: #dddddd;
	text-align: center;
}
.qnaTable tr > td:last-child{
	padding-left: 20px;
	text-align: left;
}
.answerTable tr:first-child{
	border-top: 3px solid #0b70b9;
	border-bottom: 3px solid #0b70b9;	
}
.aFormTable{
	background-color: #dddddd;
}
.submitBtn{
	width: 80%;
	height: 80%;
}
.form-control{
	resize: none;
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
   		<div class="qnaTableDiv">
   			<table class="table qnaTable">
   				<colgroup>
   					<col width="20%">
   					<col width="80%">
   				</colgroup>
   				<tr>
   					<td>문의 제목</td>
   					<td>${qna.title}</td>
   				</tr>
   				<tr>
   					<td>작성자</td>
   					<td>${qna.name}</td>
   				</tr>
   				<tr>
   					<td>등록일</td>
   					<td>${qna.createDate}</td>
   				</tr>
   				<tr>
   					<td  style="height: 200px;">문의 내용</td>
   					<td>${qna.content}</td>
   				</tr>
   			</table>
   		</div>
   		
   	 
   				<c:forEach items="${answer }" var="info">
   					<div class="answerTableDiv">
			   			<table class="table answerTable">
			   				<colgroup>
			   					<col width="10%">
			   					<col width="60%">
			   					<col width="30%">
			   				</colgroup>
			   				<tr>
			   					<td height="100px;">작성자: ${info.name }</td>
			   					<td>답변일: ${info.createDate }</td>
			   					<td align="right">
			   					<input type="hidden" value="${info.qnaCode }" name="qnaCode" id="qnaCode">
			   					<input class="btn btn-secondary btn-sm" type="button" value="답변 삭제" onclick="deleAnswer();">
			   					</td>
			   				</tr>
			   				<tr>
			   					<td colspan="3" height="200px;" style="padding: 15px;">${info.content }</td>   				
			   				</tr>
			   			</table>
			   		</div>
   				</c:forEach>
   			
   		
   
   		
   		<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y' and qna.answerCnt eq 0}">
   			<div class="tableDiv">
	   			<form action="/board/insertAnswer?menuCode=${menuVO.menuCode }" method="post">
	   			<input type="hidden" value="${sessionScope.loginInfo.id}" name="id">
	   			<input type="hidden" value="${sessionScope.loginInfo.name}" name="name">
	   			<input type="hidden" value="${nowDate }" name="createDate">
	   			<input type="hidden" value="${qnaVO.qnaCode}" name="qnaCode" id="qnaCode">
		   			<table class="table aFormTable text-center">
		   				<tr>
		   					<td class="w-95">
		   						<div class="form-floating">
								  <textarea class="form-control" id="floatingTextarea" name="content" style="height: 100px" required></textarea>
								  <label for="floatingTextarea">답변을 등록해주세요.</label>
								</div>
		   					</td>
		   					<td class="w-5"><input class="btn btn-primary submitBtn" type="submit" value="등록"></td>
		   				</tr>
		   			</table>
	   			</form>
   		</div>
   		</c:if>
   		
   		<div class="deleBtnDiv text-center">
				<input type="hidden" value="${menuVO.menuCode}" id="menuCode">
				<input type="hidden" value="${qnaVO.qnaCode}" name="qnaCode" id="qnaCode">
				<input type="hidden" value="${qna.qnaPw}" name="qnaPw" id="qnaPw">
				<!-- 관리자로 로그인 했을 때, 답변 삭제 / 게시글 삭제-->
				<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y'}">
					<!-- <input class="btn btn-primary" type="button" value="답변 삭제" onclick="deleAnswer();"> -->
					<input class="btn btn-primary" type="button" value="게시글 삭제" onclick="deleQna();">
				</c:if>
				<!-- 일반  회원으로 로그인 했을 때-->
				<!-- 로그인 아이디와 게시글 아이디가 일치할 때만 삭제 가능-->
				<c:if test="${qna.id eq sessionScope.loginInfo.id}">
					<input class="btn btn-primary" type="button" value="게시글 삭제" onclick="deleQna();">
				</c:if>
				
				<!-- 뒤로가기 = 회원, 비번 여부 상관없이 보여짐 -->	
				<input class="btn btn-primary btn-md" type="button" value="목록" onclick="location.href='/board/qna?menuCode=${menuVO.menuCode}';">
				
				
   		</div>
	</div>
</div>
<!-- 알림 모달 -->
		<div class="modal fade" id="qnaModal" tabindex="-1" aria-labelledby="qnaModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" style="color: black;" id="qnaModalLabel">알림</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body" id="qnaModalContent">
				
		      </div>
		      <div class="modal-footer">
		      	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
		        <button type="button" class="btn btn-primary deleModalClose" data-bs-dismiss="modal" onclick="deleQnaModal(menuCode,qnaCode);">확인</button>
		      </div>
		    </div>
		  </div>
		</div>
		
		
		<div class="modal fade" id="answerModal" tabindex="-1" aria-labelledby="qnaModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" style="color: black;" id="qnaModalLabel">알림</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body" id="answerModalContent">
				
		      </div>
		      <div class="modal-footer">
		      	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
		        <button type="button" class="btn btn-primary deleModalClose" data-bs-dismiss="modal" onclick="deleAnswerModal(menuCode,qnaCode);">확인</button>
		      </div>
		    </div>
		  </div>
		</div>
		
</body>
</html>