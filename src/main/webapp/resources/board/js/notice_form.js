
(function($){
	noticeSubmit = function(){
		var title = $('#title').val();
		var content = CKEDITOR.instances.content.getData();
		
		if(title == ''){
			$('#noticeCompleteModalContent').text("제목을 입력해 주세요.");
			$('#comfirmBtn').attr('onclick', '');
			$('#noticeCompleteModal').modal('show');
		}
		else if(content == ''){
			$('#noticeCompleteModalContent').text("내용을 입력해 주세요.");
			$('#comfirmBtn').attr('onclick', '');
			$('#noticeCompleteModal').modal('show');
		}
		else{

			$('#noticeCompleteModalContent').text("공지사항을 등록하시겠습니까?");
			$('#confirmBtn').attr('onclick', 'confirmNotice();');
			$('#noticeCompleteModal').modal('show');
		};
		
    };
    
    confirmNotice = function(){
    	$('#insertNoticeSubmit').submit();
    };
    
    
    
})(jQuery);