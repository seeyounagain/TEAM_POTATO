<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script type="text/javascript" src="/resources/board/js/qna_detail.js?ver=3" ></script> -->
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
	function deleQna() {
		var qnaCode = document.getElementById('qnaCode').value;
		var menuCode = document.getElementById('menuCode').value;
		
		if(	confirm("상담 / 문의 글을 삭제하시겠습니까?") == true){
			
			location.href = '/board/deleteQna?qnaCode=' + qnaCode + '&menuCode=' + menuCode;
		
		}else{
			return;
		}
	}
	
	function deleAnswer() {
		var qnaCode = document.getElementById('qnaCode').value;
		var menuCode = document.getElementById('menuCode').value;
		
		if(	confirm("답변을 삭제하시겠습니까?" + menuCode) == true){

			location.href = '/board/deleteAnswer?qnaCode=' + qnaCode + '&menuCode=' + menuCode;
		
		}else{
			return;
		}
	}
	
</script>
</head>
<body>
<div class="row justify-content-center">
   <div class="col-8 mainDiv">
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
   					<td>${qna.content}</td>
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
			<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y'}">
				<input class="btn btn-primary" type="button" value="답변 삭제" onclick="deleAnswer();">
			</c:if>
 			<input class="btn btn-primary" type="button" value="상담 / 문의 삭제" onclick="deleQna();">
 			<input class="btn btn-primary btn-md" type="button" value="뒤로가기" onclick="location.href='/board/qna?menuCode=${menuVO.menuCode}';">
   		</div>
	</div>
</div>
</body>
</html>