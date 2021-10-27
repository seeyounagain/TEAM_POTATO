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
	height: 400px;
}
.table tr > td:first-child{
	background-color: #dddddd;
}
.table tr > td:last-child{
	padding-left: 20px;
	text-align: left;
}
select{
	width: 100%;
}
input{
	width: 100%;
}

</style>
</head>
<body>
<div class="row justify-content-center">
   <div class="col-8 mainDiv">
   		<div class="titleDiv">
   			<h1 class="display-6 text-center">상담 / 문의 남기기</h1>
   			<hr>
   		</div>
  			<form action="/board/insertQna?menuCode=${menuVO.menuCode}" method="post">
			<div class="tableDiv">
					<input type="hidden" value="${sessionScope.loginInfo.id}" name="id">
					<table class="table text-center">
						<tr>
							<td class="w-10">문의 제목</td>
							<td class="w-90">
								<select name="title">
									<option value="문의드립니다.">문의드립니다.</option>
									<option value="상담합니다.">상담합니다.</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>작성자</td>
							<td><input type="hidden" value="${sessionScope.loginInfo.name}" name="name">${sessionScope.loginInfo.name}</td>
						</tr>
						<tr>
							<td>등록일</td>
							<td><input type="hidden" value="${nowDate }" name="createDate">${nowDate }</td>
						</tr>
						<tr>
							<td>문의 내용</td>
							<td>
								<div class="form-floating">
								  <textarea class="form-control" id="floatingTextarea2" name="content" style="height: 100px"></textarea>
								  <label for="floatingTextarea2">답변은 해당 문의글에서 확인 가능합니다.</label>
								</div>
							</td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="qnaPw"></td>
						</tr>
					</table>
					<div class="btnDiv text-center">
						<input class="btn btn-primary" type="submit" value="등록">
					</div>
				</div>
				</form>
			</div>
		</div>
</body>
</html>