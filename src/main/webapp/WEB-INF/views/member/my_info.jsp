<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 우편번호 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="/resources/member/js/my_info.js?ver=56"></script>
</head>
<body>
<div class="row justify-content-center">
	<div class="col-12" style="background-color: white;">
	<!-- 제일 윗줄 -->
		<h2 class="text-first fw-bold">내정보</h2>
		<hr>
<%-- 		<div class="row mb-4" style="border-bottom: 2px solid #0b70b9 ;">
			<div class="col-6 text-start">
				<h3 style="font-weight: bold;">내정보</h3>
			</div>
			<!-- 자료현황 화면 우측위에 글자 클릭시 이동 
				menu.jsp에서 menuVO.menuCode 랑 sideMenuVO.sideMenuCode 데이터 들고옴
				sideMenu.jsp에서도 들고옴
				-->
			<div class="col-6 text-end" style="font-size: 14px;">
				<p>
					<a href="/common/main">
						홈 >
					</a>&nbsp;
						<c:forEach items="${menuList }" var="menu">
							<c:if test="${menuVO.menuCode eq menu.menuCode }">
								<a href="/${menu.menuUri }/myPage?menuCode=${menuVO.menuCode }&sideMenuCode=myPage">
									${menu.menuName } >
								</a>&nbsp;
							</c:if>
						</c:forEach>
						<c:forEach items="${sideMenuList }" var="sideMenu">
							<c:if test="${sideMenuVO.sideMenuCode eq sideMenu.sideMenuCode }">
								<a href="/${sideMenu.menuUri }/${sideMenu.sideMenuUri }?menuCode=${menuVO.menuCode }&sideMenuCode=${sideMenuVO.sideMenuCode }">
									${sideMenu.sideMenuName } >
								</a>
							</c:if>
						</c:forEach>
				<p>
			</div>
		</div> --%>
		<!-- 타이틀 끝 -->
		<!-- 아이작스로 하위태크 지우기 위해 추가 -->
		<div class="row">
			<div class="col" id="ajaxStart">
				<!-- 내 정보 -->
				<div class="row justify-content-center">
					<div class="col-10 mb-4">
						<h3>개인정보</h3>
						<table class="table mt-2" style="border-top: 2px solid #0b70b9;">
							<colgroup>
								<col width="20%">
								<col width="80%">
							</colgroup>
								<tr>
									<td class="table-secondary">이름</td>
									<td id="name">${memberInfo.name }</td>
								</tr>
								<tr>
									<td class="table-secondary">성별</td>
									<td id="gender">${memberInfo.gender }</td>
								</tr>
						</table>
					</div>
				</div>
				<!-- 내정보 테이블 끝 -->
				
					<!-- 내 정보 -->
				<div class="row justify-content-center">
					<div class="col-10 mb-4">
						<h3>회원정보</h3>
						<table class="table mt-2" style="border-top: 2px solid #0b70b9;">
							<colgroup>
								<col width="20%">
								<col width="80%">
							</colgroup>
								<tr>
									<td class="table-secondary">아이디</td>
									<td id="id">${memberInfo.id }</td>
								</tr>
								<tr>
									<td class="table-secondary">휴대전화</td>
									<td id="tell">${memberInfo.tell }</td>
								</tr>
								<tr>
									<td class="table-secondary">주소</td>
									<td id="addr">${memberInfo.addr }</td>
								</tr>
								<tr>
									<td class="table-secondary">생년월일</td>
									<td id="birth">${memberInfo.birth }</td>
								</tr>
								<tr>
									<td class="table-secondary">관심카테고리</td>
									<td>${memberInfo.favorite }</td>
								</tr>
								<tr>
									<td class="table-secondary">회원탈퇴</td>
									<td>
										<button type="button" id="memberquitBtn" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#memberquitModal">탈퇴하기</button>
									</td>
								</tr>
						</table>
					</div>
				</div>
				<!-- 내정보 테이블 끝 -->
				
				<!-- 수정버튼 -->
				<div class="row  justify-content-center">
					<div class="col-2 d-grid">
						<button type="button" id="changeBtn" class="btn btn-primary">수정</button>
					</div>
					<div class="col-2 d-grid">
						<button type="button" class="btn btn-secondary" onclick="history.back(0);">뒤로가기</button>
					</div>
				</div>
				<input type="hidden" id="menuCode" name="menuCode" value="${menuVO.menuCode }">
				<input type="hidden" id="existingPw" value="${memberInfo.pw }">
				<!-- 수정버튼 끝 -->
			</div>
		</div>
	</div>
</div>
<!-- 여기까지끝 -->


<!-- 비밀번호 변경 모달창 -->
<form action="/myPage/updatePw" method="post">
	<div class="modal fade" id="changePwModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">비밀번호 변경하기</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="form-floating mb-4">
						<input type="password" class="form-control" id="pw1" placeholder="Password" required>
						<label for="floatingPassword">비밀번호</label>
					</div>
					<div class="form-floating mb-1">
						<input type="password" class="form-control" id="newPw" name="newPw" placeholder="Password" required> 
						<label for="floatingPassword">새 비밀번호</label>
						<div class="col-12 mt-2" id="pwCheck1" style="color: red; font-size: 14px;"></div>
					</div>
					<div class="form-floating">
						<input type="password" class="form-control" id="checkPw" placeholder="Password" required> 
						<label for="floatingPassword">비밀번호 확인</label>
						<div class="col-12 mt-2" id="pwCheck3" style="color: red;; font-size: 14px;"></div>
						<div class="col-12 mt-2" id="pwCheck2" style="color: red; font-size: 14px;"></div>
						<div class="col-12 mt-2" id="checkCapsLock2" style="color: red;; font-size: 14px;"></div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"data-bs-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary disabled" id="changePwBtn2">비밀번호 변경</button>
				</div>
			</div>
		</div>
	</div>
</form>
<!-- 비밀번호 변경 모달창 끝  -->


<!-- 회원탈퇴 모달창 시작  -->
<div class="modal" id="memberquitModal" tabindex="-1">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">비밀번호를 입력하세요</h5>
			</div>
			<div class="modal-body">
				<div class="form-floating">
					<input type="password" class="form-control" id="memberquitPw" placeholder="Password">
					<label for="floatingPassword">비밀번호 확인</label>
					<div class="col-12 mt-2" id="checkCapsLock1" style="color: red;; font-size: 14px;"></div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="checkMemberquitBtn">확인</button>
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>

<!-- 알림모달 시작 -->
<div class="modal fade" id="myInfoAlertModal" tabindex="-1" aria-labelledby="bookDetailAlertModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="bookDetailAlertModalLabel">알림</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body" id="myInfoAlertText">
      			
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary myInfoAlertModalBtn1">확인</button>
				<button type="button" class="btn btn-secondary myInfoAlertModalBtn2" data-bs-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<!-- book detail modal 종료 -->

</body>