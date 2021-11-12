<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 우편번호 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="/resources/member/js/member_join_form.js?ver=73" ></script>
<style type="text/css">
.pointer:hover {
	cursor: pointer;
}
#topBtn{
	position: fixed;
	right: 25px; 
	bottom: 25px;
	display: none;
	z-index: 9;
}
</style>
</head>
<body>

<a id="topBtn" href="#"><img src="/resources/img/top_b.png" width="50px;" title="위로"></a> 

<!-- 입력 확인 alert Modal -->
<div class="modal fade" id="joinCheckModal" tabindex="-1" aria-labelledby="joinCheckModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" style="color: black;" id="joinCheckModalLabel">알림</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id="joinCheckModalText">
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" id="joinCheckModalBtn" data-bs-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>
<!-- 입력 확인 alert Modal 종료 -->


<form class="row g-0 mt-3 mb-5" action="/member/join" method="post">
	<h2 class="display-6 text-center fw-bold">회원가입</h2>
	<hr>
	<div class="row mt-3 g-0 justify-content-center">
		<div class="col-5">
		
		<p class="text-end fs-6">*필수사항</p>	
		<hr>
			<div class="col-12 mt-2">
				<label for="name" class="form-label">이름</label>
				<input type="text" class="form-control" id="name" name="name" placeholder="10자리 내의 한글로 입력" required>
				<div class="col-12 mt-2" id="nameAlert" style="color: red; font-size: 14px;"></div>
			</div>
			<div class="col-12 mt-2">
				<div class="row">
						<label for="id" class="form-label">아이디</label>
					<div class="col">
						<input type="text" class="form-control inCheck" id="id" name="id" placeholder="4자~12자리의 영문 소문자, 숫자 / @,#$등 특수문자는 제외" required>
					</div>
					<div class="col-2 d-grid checkId" style="padding-left: 3px;">
					<button type="button" class="btn btn-primary" onclick="checkId();">중복확인</button>
					</div>
					<div class="col-12 mt-2" id="idAlert" style="color: red; font-size: 14px;"></div>
				</div>	
			</div>
			<div class="col-12 mt-2">
				<label for="pw" class="form-label">비밀번호</label>
				<input type="password" class="form-control inCheck" id="pw" name="pw" placeholder="영문 대문자, 소문자, 숫자를 사용하여 8자 이상, 20자 이하로 설정하십시오." required>
				<div class="col-12 mt-2" id="pwAlert" style="color: red; font-size: 14px;"></div>			
			</div>
			<div class="col-12 mt-2">
				<label for="pw" class="form-label">비밀번호 확인</label>
				<input type="password" class="form-control inCheck" id="checkPw" placeholder="비밀번호를 다시 한번 입력해주세요." required>
				<div class="col-12 mt-2" id="pwCheck" style="color: red; font-size: 14px;"></div>
			</div>
			<div class="col-12 mt-2">
				<label for="birth" class="form-label">생년월일</label>
				<input type="date" class="form-control inCheck" id="birth" name="birth" required>
				<div class="col-12 mt-2" id="birthAlert" style="color: green; font-size: 14px;">만 14세 이상인 경우에만 가입이 가능합니다.</div>
			</div>
			<div class="col-12 mt-2">
				<div class="row">
				<label for="tell" class="form-label">연락처</label>
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
					<div class="col-2 d-grid" style="padding-left: 3px;">
					<button type="button" class="btn btn-primary disabled" id="smsBtn" >문자인증</button>
					</div>
					<div class="col-12 mt-2" id="tellCheck" style="color: red; font-size: 14px;"></div>
				</div>
			</div>
			<div class="col-12 mt-2">
				<div class="row">
					<label for="addr" class="form-label">주소</label>
					<div class="col">
					<input type="text" class="post form-control pointer inCheck" name="addrs" id="postcode" onclick="openPostcode()" placeholder="우편번호" readonly required>
					</div>
					<div class="col-2 d-grid" style="padding-left: 3px;">
					<input type="button" class="post pointer btn btn-primary" onclick="openPostcode()" value="우편번호찾기">
					</div>
					<div class="col-12">
					<input type="text" style="margin-top: 5px;" onclick="openPostcode()" class="post form-control pointer inCheck" name="addrs" id="address" placeholder="주소" readonly required>
					<input type="text" style="margin-top: 5px;" class="post form-control inCheck" name="addrs" id="detailAddress" placeholder="상세주소">
					</div>
				</div>
			</div>
			
			<p class="text-end fs-6 mt-5">선택사항</p>			
			<hr>
			<div class="col-12 mt-2">
			<label for="gender" class="form-label">성별</label>
				<div class="col-12 mt-1">
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="gender" id="male" value="남">
						<label class="form-check-label" for="male">남</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="gender" id="female" value="여">
						<label class="form-check-label" for="female">여</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="gender" id="none" value="" checked>
						<label class="form-check-label" for="none">선택안함</label>
					</div>
				</div>
			</div>
			<div class="col-12 mt-2">
			<label for="gender" class="form-label">관심 카테고리</label>
				<div class="col-12 mt-1">
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" name="favorite" value="소설">
					  <label class="form-check-label" for="inlineCheckbox1">소설</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" name="favorite" value="시/에세이">
					  <label class="form-check-label" for="inlineCheckbox1">시/에세이</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" name="favorite" value="요리/건강">
					  <label class="form-check-label" for="inlineCheckbox1">요리/건강</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" name="favorite" value="요리/건강">
					  <label class="form-check-label" for="inlineCheckbox1">취미/실용</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" name="favorite" value="요리/건강">
					  <label class="form-check-label" for="inlineCheckbox1">경제/경영</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" name="favorite" value="자기계발">
					  <label class="form-check-label" for="inlineCheckbox1">자기계발</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" name="favorite" value="역사/문화">
					  <label class="form-check-label" for="inlineCheckbox1">역사/문화</label>
					</div>
				</div>
			</div>
			<div class="d-grid mt-3">
					<input type="button" id="joinBtn" class="btn btn-primary disabled" value="회원가입">
			</div>
		</div>
	</div>

</form>
</body>
</html>