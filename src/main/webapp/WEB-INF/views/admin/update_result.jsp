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
<input type="hidden" id="menuCode" name="menuCode" value="${menuCode }">
<input type="hidden" id="bookCode" name="bookCode" value="${bookCode }">
	
	<script type="text/javascript">
		
		var menuCode = document.getElementById('menuCode').value;
		var bookCode = document.getElementById('bookCode').value;
		
		alert('도서 정보 수정이 완료되었습니다.');
		location.href = '/search/bookDetail?menuCode=' + menuCode + '&bookCode=' + bookCode;
		
	</script>
	
</body>
</html>