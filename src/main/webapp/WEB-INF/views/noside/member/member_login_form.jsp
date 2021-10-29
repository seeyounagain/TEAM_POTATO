<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/member/js/member_login_form.js?ver=5" ></script>
<style type="text/css">
#goJoin {
	text-decoration: underline 1px gray;
	color: gray;
	vertical-align: middle;
}
#goJoin:hover {
	color: black;
	cursor: pointer;
}
</style>
</head>
<body>
<form action="/member/login" method="post">
	<h1 class="display-6 text-center">로그인</h1>
	<hr>
	<div class="row g-0 justify-content-center">
		<div class="col-7">
			<div class="row justify-content-center">
				<div class="col-7 pt-1">
					<label for="id" class="form-label">아이디</label>
					<input type="text" class="form-control" id="id" name="id" required>
				</div>	
				<div class="col-7 pt-1">
					<label for="pw" class="form-label">비밀번호</label>
					<input type="password" class="form-control" id="pw" name="pw" required>
				</div>
				<div class="col-7 mt-2 pt-1 text-center">
					<span>회원이 아니십니까?</span>
					<a id="goJoin" href="/member/memberJoinInfo">회원가입</a>
				</div>
				<div class="col-6 d-grid mt-3">
					<button type="submit" id="loginBtn" class="btn btn-primary" >로그인</button>
				</div>
			</div>
		</div>
	</div>
</form>
</body>
</html>