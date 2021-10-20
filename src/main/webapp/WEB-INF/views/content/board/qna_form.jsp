<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.titleDiv{
	width: 100%;
	margin: 0 auto;
	padding-top: 10px;
	padding-bottom: 5px;
	margin-bottom: 15px;
	background-color: white;
}
.table{
	width: 100%;
}
</style>
</head>
<body>
<div class="row justify-content-center">
   <div class="col-8 mainDiv" style="background-color: olive;">
   		<div class="titleDiv">
   			<h3>문의&상담 남기기</h3>
   		</div>
  			<form action="/board/qnaForm">
			<div class="tableDiv">
					<table class="table table-striped text-center">
						<tr>
							<td class="w-20">문의 제목</td>
							<td class="w-50">
								<select name="title">
									<option value="문의">문의드립니다.</option>
									<option>상담합니다.</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>작성자</td>
							<td>login한 멤버의 이름</td>
						</tr>
						<tr>
							<td>문의 내용</td>
							<td>
								<div class="form-floating">
								  <textarea class="form-control" id="floatingTextarea2" name="content" style="height: 100px"></textarea>
								  <label for="floatingTextarea2">문의사항을 입력해주세요. 답변은 해당 문의글에서 확인 가능합니다.</label>
								</div>
							</td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="qnaPw"></td>
						</tr>
					</table>
					<div class="btnDiv">
						<input class="btn btn-primary" type="submit" value="등록">
					</div>
				</div>
				</form>
			</div>
		</div>
</body>
</html>
