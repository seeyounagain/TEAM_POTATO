<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function checkPw(qnaCode) {
		var inputPw = document.getElementById('inputPw').value;
		var qnaPw = document.getElementById('qnaPw').value;
		var qnaCode = document.getElementById('qnaCode').value;

		if(inputPw != qnaPw){
			alert('비밀번호를 확인하세요.');
			document.getElementById('inputPw').value = '';
			document.getElementById('inputPw').focus();
			return;
		}
		
		location.href = '/board/qnaDetail?qnaCode=' + qnaCode;
	}
</script>
</head>
<body>
<div class="row justify-content-center">
	<div class="col-8 mainDiv" style="background-color: #dddddd;">
		<div class="titleDiv">
   			<h3>상담/문의 비밀번호</h3>
   		</div>
   		<div class="tableDiv">
   		<input type="hidden" value="${qnaVO.qnaPw}" id="qnaPw">
   		<input type="hidden" value="${qnaVO.qnaCode}" id="qnaCode">
   			<table class="table">
   				<tr>
   					<td>비밀번호</td>
   					<td><input type="password" id="inputPw" autofocus="autofocus"></td>
   					<td><input type="button" value="확인" onclick="checkPw();"></td>
   				</tr>
   			</table>
   		</div>
	</div>
</div>
</body>
</html>