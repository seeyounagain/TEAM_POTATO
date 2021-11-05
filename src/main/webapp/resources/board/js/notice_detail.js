
(function($){
	deleNotice = function(menuCode,noticeCode){
		
		
		$('#noticeCompleteModal').modal('show');	
		$('#deleModalContent').text('공지사항을 삭제하시겠습니까?');
    };
    
    confirmDele = function(){
    	var noticeCode = document.getElementById('noticeCode').value;
		var menuCode = document.getElementById('menuCode').value;
		
		location.href='/board/deleteNotice?noticeCode=' + noticeCode + '&menuCode=' + menuCode;
    
    };
    
})(jQuery);