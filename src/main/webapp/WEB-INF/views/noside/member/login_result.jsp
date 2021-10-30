<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SHOP</title>
</head>
<body>

<input type="hidden" id="bookCode" name="overCnt" value="${overCnt }">

<c:choose>
	<c:when test="${not empty sessionScope.loginInfo }">
		<c:if test="${empty overCnt or overCnt eq 0 }">
		<script type="text/javascript">
			alert('${loginInfo.name }님 환영합니다 :)');
			location.href = '/common/main';
		</script>
		</c:if>
		<c:if test="${not empty overCnt or overCnt > 0 }">
		<script type="text/javascript">
			alert('${loginInfo.name }님, 연체중인 도서가 있습니다.\n반납기한을 확인해주세요.');
			location.href = '/myPage/myPage?menuCode=MENU_005';
		</script>
		</c:if>
	</c:when>
	<c:when test="${isDelete eq 'Y' }">
		<script type="text/javascript">
			alert('이미 탈퇴한 회원의 정보입니다.');
			location.href = '/member/memberLoginForm';
		</script>
	</c:when>
	<c:otherwise>
		<script type="text/javascript">
			alert('아이디 또는 비밀번호를 확인해주세요');
			location.href = '/member/memberLoginForm';
		</script>
	</c:otherwise>
</c:choose>
</body>
</html>