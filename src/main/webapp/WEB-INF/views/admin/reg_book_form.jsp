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

 #{isbn}
		    , #{kdc}
		    , #{writer}
		    , #{title}
		    , #{page}
		    , #{bookSize}
		    , #{keyword}
		    , #{publisher}
		    , #{pubDate}
		    , #{summary}
		    , #{intro}
			, #{area}



<form class="row g-0 mt-3 mb-5" action="/libManage2/regBook" method="post">
	<h1 class="display-6 text-center">신규도서등록</h1>
	<div class="row g-0 justify-content-center">
		<div class="col-5">
		<hr>
			<div class="col-12 mt-2">
				<label for="name" class="form-label">표제</label>
				<input type="text" class="form-control" id="title" name="title" placeholder="표제" required>
			</div>
			<div class="d-grid mt-3">
					<button type="submit" id="regBtn" class="btn btn-primary disabled">등록</button>
			</div>
		</div>
	</div>

</form>
</body>
</html>