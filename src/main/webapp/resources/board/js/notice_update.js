/*
(function($){
	noticeUpdateSubmit = function(){
		var title = $('#title').val();
		var content = CKEDITOR.instances.content2.getData();
		
		if(title == ''){
			$('#noticeUpdateModalContent').text("제목을 입력해 주세요.");
			$('#comfirmBtn').attr('onclick', '');
			$('#noticeUpdateModal').modal('show');
		}
		else if(content == ''){
			$('#noticeUpdateModalContent').text("내용을 입력해 주세요.");
			$('#comfirmBtn').attr('onclick', '');
			$('#noticeUpdateModal').modal('show');
		}
		else{

			$('#noticeUpdateModalContent').text("공지사항을 수정하시겠습니까?");
			$('#confirmBtn').attr('onclick', 'confirmUpdate();');
			$('#noticeUpdateModal').modal('show');
		};
		
    };
    
    confirmUpdate = function(){
    	$('#updateNoticeSubmit').submit();
    };
    
    
    
})(jQuery);*/

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