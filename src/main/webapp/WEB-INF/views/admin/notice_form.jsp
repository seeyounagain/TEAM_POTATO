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
input{
	width: 100%;
}
</style>
</head>
<body>
<div class="row justify-content-center">
   <div class="col-8 mainDiv">
   		<div class="titleDiv">
   			<h1 class="display-6 text-center">공지사항 등록</h1>
   			<hr>
   		</div>
			<div class="tableDiv">
  			<form action="/board/insertNotice?menuCode=${menuVO.menuCode }" method="post" enctype="multipart/form-data">
  				<input type="hidden" value="${sessionScope.loginInfo.id}" name="id">
					<table class="table text-center">
						<tr>
							<td class="w-10">제목</td>
							<td class="w-90"><input type="text" name="title"></td>
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
							<td>내용</td>
							<td>
								<div class="form-floating">
								  <textarea class="form-control" id="floatingTextarea2" name="content" style="height: 100px"></textarea>
								  <label for="floatingTextarea2">공지사항을 입력하세요.</label>
								</div>
							</td>
						</tr>
						<tr>
							<td>첨부파일</td>
							<td> 
								<input class="form-control" type="file" id="formFile" name="file">
  							</td>
						</tr>
					</table>
					<div class="btnDiv text-center">
						<input class="btn btn-primary" type="submit" value="등록">
					</div>
				</form>
				</div>
			</div>
		</div>
</body>
</html>
