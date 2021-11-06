<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/member/js/member_login_form.js?ver=20" ></script>
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
<script type="text/javascript">
    $(window).on('load',function(){
    	$('#loginModal').modal({keyboard: false,backdrop: 'static'})
    });
</script>
</head>
<body id="goLogin">
	<h2 class="display-6 text-center fw-bold mt-3">로그인</h2>
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
					<button type="submit" id="loginBtn" class="btn btn-primary" onclick="login();">로그인</button>
				</div>
			</div>
		</div>
	</div>

<!-- 아이디 & 비밀번호 미입력 alert Modal -->
<div class="modal fade" id="loginAlertModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" style="color: black;" id="loginAlertModalLabel">알림</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        아이디와 비밀번호를 입력해주세요.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>
<!-- 아이디 & 비밀번호 미입력 alert Modal 종료 -->

<!-- 로그인 alert Modal -->
<div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" style="color: black;" id="loginModalLabel">알림</h5>
        <button type="button" class="btn-close loginModalClose" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id="loginModalBody">
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary loginModalClose" data-bs-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>
<!-- 로그인 alert Modal 종료 -->



</body>
</html>