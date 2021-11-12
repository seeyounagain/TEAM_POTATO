
(function($){
	qnaSubmit = function(){
		var content = CKEDITOR.instances.content.getData();
		
		if(content == ''){
			$('#qnaCompleteModalContent').text("내용을 입력해 주세요.");
			$('#comfirmBtn').attr('onclick', '');
			$('#qnaCompleteModal').modal('show');
		}
		else{
			$('#qnaCompleteModalContent').text("상담/문의글을 등록하시겠습니까?");
			$('#confirmBtn').attr('onclick', 'confirmQna();');
			$('#qnaCompleteModal').modal('show');
		};
		
    };
    
    confirmQna = function(){
    	$('#insertQnaSubmit').submit();
    };
    
    
    
})(jQuery);