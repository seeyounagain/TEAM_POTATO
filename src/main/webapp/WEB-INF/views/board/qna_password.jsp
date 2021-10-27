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
.table tr > td:first-child{
	background-color: #dddddd;
}
.table tr > td:last-child{
	padding-left: 20px;
	text-align: left;
}
input{
	width: 100%;
}
</style>
<script type="text/javascript">
	function checkPw() {
		var inputPw = document.getElementById('inputPw').value;
		var qnaPw = document.getElementById('qnaPw').value;
		var qnaCode = document.getElementById('qnaCode').value;
		var menuCode = document.getElementById('menuCode').value;

		
		if(inputPw != qnaPw){
			alert('비밀번호를 확인하세요.');
			document.getElementById('inputPw').value = '';
			document.getElementById('inputPw').focus();
			return;
		}
		
		location.href = '/board/qnaDetail?qnaCode=' + qnaCode +'&menuCode=' + menuCode;
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
   		<div class="tableDiv">
   		<input type="hidden" value="${qnaVO.qnaPw}" id="qnaPw">
   		<input type="hidden" value="${qnaVO.qnaCode}" id="qnaCode">
   		<input type="hidden" value="${menuVO.menuCode}" id="menuCode">
   			<table class="table">
   				<tr>
   					<td>비밀번호</td>
   					<td><input type="password" id="inputPw" autofocus="autofocus" placeholder="비밀번호를 입력해 주세요."></td>
   					<td><input class="btn btn-primary" type="button" value="확인" onclick="checkPw();"></td>
   				</tr>
   			</table>
   		</div>
	</div>
</div>
</body>
</html>