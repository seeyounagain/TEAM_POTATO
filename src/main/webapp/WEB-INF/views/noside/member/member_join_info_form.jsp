<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 우편번호 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="/resources/member/js/member_join_form.js?ver=5" ></script>
</head>
<body>
	<h2 class="display-6 text-center fw-bold mt-3">회원가입</h2>
	<hr>
	<div class="row g-0 justify-content-center">
		<div class="col-5">
		<div class="col-12 border border-1 mb-5" style="background-color: #f7f6f3;">
			<span>회원에 가입하시면 홈페이지에서 제공하는 강좌신청 등의 다양한 정보를 이용할 수 있습니다.
			<br>홈페이지에서 신규회원가입을 한 회원이 도서를 대출하고자 할 경우에는
			<br>도서관을 방문하여 대출증 발급을 마친 후 이용할 수 있습니다.

			<br>회원이 아니시라면 지금 가입하세요. 여러분의 꿈에 울산도서관이 함께합니다.</span>
		</div>
		<div class="d-grid mt-3">
			<button type="button" class="btn btn-primary" onclick="location.href='/member/memberJoinForm'">회원가입</button>
		</div>
		</div>
	</div>
</body>
</html>