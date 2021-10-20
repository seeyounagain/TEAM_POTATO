<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TITLE</title>
<script type="text/javascript" src="/resources/search/js/search_form.js?ver=1" ></script>
<style type="text/css">
.keyword {
	width: 10%;
}
#searchBox {
	visibility: hidden;
}
</style>
</head>
<body>

	<h1 class="display-6 text-center">자료검색</h1>
	<hr>

<div class="row justify-content-center">
	<div class="col-6">
		<div class="row justify-content-center">
			<div class="col-8">
				<input type="text" class="form-control" id="id" name="id" placeholder="검색어를 입력해주세요.">
			</div>
			<div class="col-2 d-grid checkId" style="padding-left: 3px;">
				<button type="button" class="btn btn-primary">검색</button>
			</div>
			<div class="col-2 d-grid checkId" style="padding-left: 3px;">
				<button id="detailBtn" type="button" class="btn btn-primary">상세검색</button>
			</div>
			<div id="searchBox">
			<div class="input-group mt-5 mb-3">
			  <select name="KDC_NAME" class="form-select" id="inputGroupSelect02">
			    <option selected>분류</option>
			    <option value="1">One</option>
			    <option value="2">Two</option>
			    <option value="3">Three</option>
			  </select>
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text keyword" id="inputGroup-sizing-default">제목</span>
			  <input type="text" name="TITLE" class="form-control" aria-describedby="inputGroup-sizing-default">
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text keyword" id="inputGroup-sizing-default">저자</span>
			  <input type="text" name="WRITER" class="form-control" aria-describedby="inputGroup-sizing-default">
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text keyword" id="inputGroup-sizing-default">출판사</span>
			  <input type="text" name="PUBLISHER" class="form-control" aria-describedby="inputGroup-sizing-default">
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text keyword" id="inputGroup-sizing-default">ISBN</span>
			  <input type="text" name="ISBN" class="form-control" aria-describedby="inputGroup-sizing-default">
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text keyword" id="inputGroup-sizing-default">발행년</span>
			  <input type="date" class="form-control" aria-describedby="inputGroup-sizing-default">
			  <span style="align-self: center;">&nbsp;~&nbsp;</span><input type="date" class="form-control" aria-describedby="inputGroup-sizing-default">
			</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>