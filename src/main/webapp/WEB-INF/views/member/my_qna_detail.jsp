<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script type="text/javascript">
	//비밀번호가 있는 상담글 삭제 시, 비밀번호 확인
	function checkPw() {
		$('#myModal').modal('show');
		
		var qnaCode = document.getElementById('qnaCode').value;
		var menuCode = document.getElementById('menuCode').value;
		var qnaPw = document.getElementById('qnaPw').value;
		//var inputPw = document.getElementById('inputPw').value;
		
		if(	confirm("상담 / 문의 글을 삭제하시겠습니까?") == true){
			
			 var inputPw = prompt("상담 / 문의글 비밀 번호 확인");
			 
			 if(inputPw == qnaPw){
				
				alert("게시글이 삭제되었습니다."); 
			 	location.href = '/board/deleteQna?qnaCode=' + qnaCode + '&menuCode=' + menuCode;
				 
			 }
			 else{
			 	alert("비밀번호가 일치하지 않습니다.");
			 	
			 }			
		
		}else{
			return;
			
		}
	}
</script>
</head>
<body>
<!-- 비번 확인 모달창 -->
	<div class="modal" id="notice" tabindex="-1" role="dialog">
	    <div class="modal-dialog" role="document">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h5 class="modal-title">게시글 비밀번호 확인</h5>
	            </div>
	            <div class="modal-body">
	            	<input type="password" name="qnaPw">
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn" id="" data-dismiss="modal" >확인</button>
	            </div>
	        </div>
	    </div>
	</div>
	
	
<div class="row justify-content-center">
   <div class="col-12 mainDiv">
   		<div class="titleDiv">
   			<h1 class="display-6 text-center">상담 / 문의</h1>
   			<hr>
   		</div>
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
   					<td>${qna.content} ${qna.qnaPw }</td>
   				</tr>
   			</table>
   		</div>
   		
   	 
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
   			
   		
   
   		
   		<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y'}">
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
								  <textarea class="form-control" id="floatingTextarea" name="content" style="height: 100px"></textarea>
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
					<input class="btn btn-primary" type="button" value="답변 삭제" onclick="deleAnswer();">
					<input class="btn btn-primary" type="button" value="게시글 삭제" onclick="deleQna();">
				</c:if>
				<!-- 일반  회원으로 로그인 했을 때-->
				<!-- 로그인 아이디와 게시글 아이디가 일치할 때 -> 1. 비번이 있을 때 / 2. 비번이 없을 때-->
				<c:if test="${qna.id eq sessionScope.loginInfo.id}">
					<c:choose>
						<c:when test="${not empty qna.qnaPw }">
							<input class="btn btn-primary" type="button" value="게시글 삭제" onclick="checkPw();">
						</c:when>
						<c:otherwise>
							<input class="btn btn-primary" type="button" value="게시글 삭제" onclick="deleQna();">
						</c:otherwise>
					</c:choose>
				</c:if>
				
				<!-- 뒤로가기 = 회원, 비번 여부 상관없이 보여짐 -->	
				<input class="btn btn-primary btn-md" type="button" value="목록" onclick="location.href='/myPage/myQnaList?menuCode=${menuVO.menuCode}';">
				
				
   		</div>
	</div>
</div>

</body>
</html>