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

<!-- 정보 수정 confirm modal 시작 -->
<div class="modal fade" id="updateCompleteModal" tabindex="-1" aria-labelledby="updateCompleteModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="updateCompleteModalLabel">알림</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id="updateCompleteModalText">
      	도서 정보 수정이 완료되었습니다.
      </div>
      <div class="modal-footer">
		 <button type="button" class="btn btn-primary updateCompleteBtn">확인</button>     
      </div>
    </div>
  </div>
</div>
<!-- 정보 수정 confirm modal 종료 -->
	
	
	<script type="text/javascript">
	
		
		$(window).on('load',function(){
			
			$('#updateCompleteModal').modal('show');
			
	    });
		
		
		$(document).on('click', '.updateCompleteBtn' , function() {
			
			var menuCode = document.getElementById('menuCode').value;
			var bookCode = document.getElementById('bookCode').value;

			location.href = '/search/bookDetail?menuCode=' + menuCode + '&bookCode=' + bookCode;
			
		});
		
		$('#updateCompleteModal').on('hidden', function () {
			
			var menuCode = document.getElementById('menuCode').value;
			var bookCode = document.getElementById('bookCode').value;

			location.href = '/search/bookDetail?menuCode=' + menuCode + '&bookCode=' + bookCode;
			
		})
	
		
	</script>
	
</body>
</html>