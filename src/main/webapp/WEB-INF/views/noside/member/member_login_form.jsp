<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/member/js/member_login_form.js?ver=36" ></script>
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
					<input type="text" class="form-control" id="id" name="id" autofocus required>
					<span id="capsLockCheck" style="font-size: 14px;"></span>
				</div>	
				<div class="col-7 pt-1">
					<label for="pw" class="form-label">비밀번호</label>
					<input type="password" class="form-control" id="pw" name="pw" required>
				</div>
				<div class="col-7 mt-2 pt-1 text-center">
					<span>회원이 아니십니까?</span>
					<a id="goJoin" href="/member/memberJoinInfo">회원가입</a>
				</div>
				<div class="col-7 mt-2 pt-1 text-center">
					<a id="goJoin" onclick="findId();">아이디찾기</a>
					<a id="goJoin" onclick="findPw();">비밀번호찾기</a>
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

<!-- 아이디찾기01 modal 시작 -->
<div class="modal fade" id="findIdModal" tabindex="-1" aria-labelledby="findIdModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="findIdModalLabel">아이디 찾기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id="findIdModalText">
      		<p>회원정보에 등록한 이름과 생년월일을 입력해주세요.</p>
      		<label for="name" class="form-label mt-3">이름</label>
			<input type="text" class="form-control" id="findIdname" name="findIdname" autofocus required>
			<label for="birth" class="form-label mt-3">생년월일</label>
			<input type="date" class="form-control" id="findIdbirth" name="findIdbirth" required>
			<div class="col-12 mt-3 text-center" id="findIdCheck"></div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="findIdBtn">확인</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>s
</div>
<!-- 아이디찾기01 modal 종료 -->

<!-- 비밀번호찾기01 modal 시작 -->
<div class="modal fade" id="findPwModal" tabindex="-1" aria-labelledby="findPwModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="findPwModalLabel">비밀번호 찾기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id="findPwModalText">
      		<p>회원정보에 등록한 아이디와 생년월일, 연락처를 입력해주세요.</p>
      		<label for="id" class="form-label mt-3">아이디</label>
			<input type="text" class="form-control" id="findPwId" name="findPwId" autofocus required>
			<label for="birth" class="form-label mt-3">생년월일</label>
			<input type="date" class="form-control" id="findPwBirth" name="findPwBirth" required>
      		<label for="tell" class="form-label mt-3">연락처</label>
	       		<div class="row">
				<div class="col">
				<select class="form-select inCheck" name="tells" id="tell1">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="018">018</option>
				</select>
				</div>
				<div class="col">
					<input type="text" id="tell2" class="form-control tells inCheck" name="tells" required>
				</div>
				<div class="col">
					<input type="text" id="tell3" class="form-control tells inCheck" name="tells" required>
				</div>
			</div>
			<div class="col-12 mt-3 text-center" id="findPwCheck"></div>     
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="findPwBtn">확인</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
<!-- 비밀번호찾기01 modal 종료 -->

</body>
</html>