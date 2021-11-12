<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
}
.table{
	width: 100%;
	text-align: center;
}
.table > tr, td{
	border-style: none;
}
.table tr > td:first-child{
	background-color: #dddddd;
}
input[type="password"]{
	width: 100%;
}
input[type="button"] {
	text-align: left;
}
.table tr > td:nth-child(3n,4n) {
	padding-left: 0px;
}
</style>
<script type="text/javascript" src="/resources/board/js/qna_password.js?ver=1"></script>
</head>
<body>
<div class="row justify-content-center">
	<div class="col-10 mainDiv">
		<div class="titleDiv">
   			<h2 class="text-first fw-bold">상담 / 문의</h2>
   			<hr>
   		</div>
   		<div class="tableDiv text-center">
   		<input type="hidden" value="${qnaVO.qnaPw}" id="qnaPw">
   		<input type="hidden" value="${qnaVO.qnaCode}" id="qnaCode">
   		<input type="hidden" value="${menuVO.menuCode}" id="menuCode">
   			<table class="table">
   				<colgroup>
   					<col width="20%;">
   					<col width="50%;">
   					<col width="30%;">
   				</colgroup>
   				<tr>
   					<td>비밀번호</td>
   					<td style="text-align: center;"><input type="password" id="inputPw" autofocus="autofocus" placeholder="비밀번호를 입력해 주세요."></td>
   					<td style="text-align: left;">
   						<input class="btn btn-primary" type="button" value="확인" onclick="checkPw();">
   						<input class="btn btn-primary" type="button" value="뒤로가기" onclick="location.href='/board/qna?menuCode=${menuVO.menuCode}';">
   					</td>
   				</tr>
   			</table>
   		</div>
	</div>
</div>
<!-- 알림 모달 -->
		<div class="modal fade" id="alertModal" tabindex="-1" aria-labelledby="noticeCompleteModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" style="color: black;" id="noticeCompleteModalLabel">알림</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body" id="deleModalContent">
				
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-primary deleModalClose" data-bs-dismiss="modal" >확인</button>
		      </div>
		    </div>
		  </div>
		</div>
</body>
</html>