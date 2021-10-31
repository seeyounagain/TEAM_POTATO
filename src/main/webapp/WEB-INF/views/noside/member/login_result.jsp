<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>POTATO_LIBRARY</title>
<script type="text/javascript" src="/resources/member/js/login_result.js?ver=9" ></script>
</head>
<body>

<input type="hidden" id="overCnt" name="overCnt" value="${overCnt }">
<input type="hidden" id="isDelete" name="isDelete" value="${sessionScope.loginInfo.isDelete }">
<input type="hidden" id="name" name="name" value="${sessionScope.loginInfo.name }">

<%-- <c:choose>
	<c:when test="${not empty sessionScope.loginInfo }">
		<c:if test="${empty overCnt or overCnt eq 0 }">
		<script type="text/javascript">
			
			$('#loginModalBody').text('${loginInfo.name }님 환영합니다 :)');
			
			$('#detailModal').modal('show');
			
			function loginModalClose() {
					
			location.href = '/common/main';
			
			}
		</script>
		</c:if>
		<c:if test="${not empty overCnt or overCnt > 0 }">
		<script type="text/javascript">
			
			$('#loginModalBody').text('${loginInfo.name }님, 연체중인 도서가 있습니다.\n반납기한을 확인해주세요.');
			
			$('#detailModal').modal('show');
			
			function loginModalClose() {
					
			location.href = '/myPage/myPage?menuCode=MENU_005';
			
			}			
		</script>
		</c:if>
	</c:when>
	<c:when test="${isDelete eq 'Y' }">
		<script type="text/javascript">
		
			$('#loginModalBody').text('이미 탈퇴한 회원의 정보입니다.');
			
			$('#detailModal').modal('show');
			
			function loginModalClose() {
					
			location.href = '/member/memberLoginForm';		
			
			}			
		</script>
	</c:when>
	<c:otherwise>
		<script type="text/javascript">

			$('#loginModalBody').text('아이디 또는 비밀번호를 확인해주세요');
			
			$('#detailModal').modal('show');
			
			function loginModalClose() {
					
			location.href = '/member/memberLoginForm';		
			
			}			
		</script>
	</c:otherwise>
</c:choose>

 --%>
<!-- 로그인 alert Modal -->
<div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" style="color: black;" id="loginModalLabel">알림</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id="loginModalBody">
        
      </div>
      <div class="modal-footer">
        <button type="button" id="loginModalClose" 
			<c:choose>
				<c:when test="${not empty sessionScope.loginInfo }">
					<c:if test="${empty overCnt or overCnt eq 0 }">
						onclick="location.href='/common/main'"
					</c:if>
					<c:if test="${not empty overCnt or overCnt > 0 }">
						onclick="location.href='/myPage/myPage?menuCode=MENU_005'"
					</c:if>
				</c:when>
				<c:when test="${isDelete eq 'Y' }">
						onclick="location.href='/member/memberLoginForm'"
				</c:when>
				<c:otherwise>
						onclick="location.href='/member/memberLoginForm'"	
				</c:otherwise>
			</c:choose>
        class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>
<!-- 로그인 alert Modal 종료 -->

</body>
<script type="text/javascript">
    $(window).on('load',function(){
        $('#loginModal').modal('show');
    });
</script>
</html>



