
$(document).ready(function(){
		
		// 수정 버튼 클릭시 modal toggle
		$(document).on('click', '#updateBtn' , function() {
		
			$('#noticeUpdateModal').modal('show');
			
		});
		
		// modal 수정 버튼 클릭시 도서정보 수정
		$(document).on('click', '#confirmBtn' , function() {

			$('#updateNoticeSubmit').submit();
			
		});
		
	});