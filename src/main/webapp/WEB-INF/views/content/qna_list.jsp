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
   			<h3>문의&상담</h3>
   		</div>
			<div class="tableDiv">
					<table class="table table-striped text-center">
						<thead>
							<tr>
								<th class="w-10">번호</th>
								<th class="w-60">제목</th>
								<th class="w-10">작성자</th>
								<th class="w-20">작성일</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td><a href="/content/qnaDetail"> 문의드립니다. </a></td>
								<td>박**</td>
								<td>2021-10-01</td>
							</tr>
							<tr>
								<td>2</td>
								<td><a>문의드립니다.</a></td>
								<td>김**</td>
								<td>2021-09-27</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="btnDiv">
					<button type="button" class="btn btn-primary btn-lg">등록하기</button>
				</div>
			</div>
		</div>
</body>
</html>
