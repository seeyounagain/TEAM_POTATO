<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/member/js/my_qna_detail.js?ver=26"></script>
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
</style>
</head>
<body>
	
<!-- 제일 윗줄 -->	
<div class="row justify-content-center">
	<div class="col-12 mainDiv">
		<div class="titleDiv">
			<h2 class="text-first fw-bold">상담 / 문의</h2>
			<hr>
		</div>
		
		
		<!-- 상담 문의 테이블 -->
		<div class="qnaTableDiv">
			<table class="table qnaTable">
				<tr>
					<td class="w-10">문의 제목</td>
					<td class="w-90">${qna.title}</td>
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
   		
   		
   	 	<!-- 댓글 테이블 -->
		<c:forEach items="${answer }" var="info">
			<div class="answerTableDiv">
				<table class="table answerTable">
					<tr>
						<td height="100px;">작성자: ${info.name }</td>
						<td align="right">답변일: ${info.createDate }</td>
					</tr>
					<tr>
						<td colspan="2" height="200px;" style="padding: 15px;">${info.content }</td>   				
					</tr>
				</table>
			</div>
		</c:forEach>
   
   		
   		<!-- 삭제 뒤로가기 -->
   		<div class="deleBtnDiv text-center">
			<input type="hidden" value="${menuVO.menuCode}" name ="menuCode" id="menuCode">
			<input type="hidden" value="${qnaVO.qnaCode}" name="qnaCode" id="qnaCode">
			<!-- 게시글 삭제 -->
			<input class="btn btn-primary" type="button" value="게시글 삭제" data-bs-toggle="modal" data-bs-target="#myQnaDeleteCheck">
			
			<!-- 뒤로가기 = 회원, 비번 여부 상관없이 보여짐 -->	
			<input class="btn btn-primary btn-md" type="button" value="목록" onclick="location.href='/myPage/myQnaList?menuCode=${menuVO.menuCode}';">
   		</div>
	</div>
</div>

<!-- 모달창 -->
<div class="modal fade" id="myQnaDeleteCheck" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">알림</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
        		상담 / 문의 글을 삭제하시겠습니까?
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="goMyQnaDelete">확인</button>
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>

<!-- 모달창확인후 모달창-->
<div class="modal fade" id="alertModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">알림</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
        		삭제되었습니다.
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
			</div>
		</div>
	</div>
</div>

</body>
</html>