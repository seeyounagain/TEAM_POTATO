<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/search/js/book_manage.js?ver=11" ></script>
<style type="text/css">
.content {
	background-color: white;
}
</style>
</head>
<body>

<form class="row g-0 mt-3 mb-5" action="/libManage/regBook" method="post" enctype="multipart/form-data">
	<h1 class="display-6 text-center">신규도서등록</h1>
	<div class="row g-0 justify-content-center">
		<div class="col-7">
		<hr>
			<div class="col-12 mt-2">
				<label for="isbn" class="form-label">ISBN</label>
				<input type="text" class="form-control" id="isbn" name="isbn" placeholder="ISBN" required>
			</div>
			<div class="col-12 mt-2">
				<label for="name" class="form-label">표제</label>
				<input type="text" class="form-control" id="title" name="title" placeholder="표제" required>
			</div>
			<div class="col-12 mt-2">
				<label for="kdc" class="form-label">청구기호</label>
				<input type="text" class="form-control" id="kdc" name="kdc" placeholder="청구기호" required>
			</div>
			<div class="col-12 mt-2">
				<label for="writer" class="form-label">저자</label>
				<input type="text" class="form-control" id="writer" name="writer" placeholder="저자" required>
			</div>
			<div class="col-12 mt-2">
				<label for="publisher" class="form-label">발행자</label>
				<input type="text" class="form-control" id="publisher" name="publisher" placeholder="발행자" required>
			</div>
			<div class="col-12 mt-2">
				<label for="pubDate" class="form-label">발행년도</label>
				<input type="text" class="form-control" id="pubDate" name="pubDate" placeholder="예) 20211021 " required>
			</div>
			<div class="col-12 mt-2">
				<label for="page" class="form-label">페이지</label>
				<input type="text" class="form-control" id="page" name="page" placeholder="숫자로 입력해주세요. " required>
			</div>
			<div class="col-12 mt-2">
				<label for="bookSize" class="form-label">크기</label>
				<input type="text" class="form-control" id="bookSize" name="bookSize" placeholder="예) 가로*세로 또는 가로 (cm 제외) " required>
			</div>
			<div class="col-12 mt-2">
				<label for="keyword" class="form-label">주제</label>
				<input type="text" class="form-control" id="keyword" name="keyword" placeholder="예) 연애소설, 판타지 " required>
			</div>
			<div class="col-12 mt-2">
				<label for="summary" class="form-label">한줄소개</label>
				<input type="text" class="form-control" id="summary" name="summary" placeholder="한줄소개" required>
			</div>
			<div class="col-12 mt-2">
				<label for="intro" class="form-label">목차</label>
				<input type="text" class="form-control" id="intro" name="intro" placeholder="목차" required>
			</div>
			<div class="col-12 mt-2">
				<label for="area" class="form-label">자료위치</label>
				<input type="text" class="form-control" id="area" name="area" placeholder="자료위치" required>
			</div>
			<div class="col-12 mt-2">
				<label for="file" class="form-label">표지이미지</label>
				<input type="file" name="file" class="form-control" id="inputGroupFile01" required>
			</div>
			<div class="d-grid mt-3">
				<button type="submit" id="regBtn" class="btn btn-primary">등록</button>
			</div>
		</div>
	</div>

</form>
</body>
</html>