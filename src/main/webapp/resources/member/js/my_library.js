/* 페이지 로딩 후 실행 */
$(document).ready(function(){
	var menuCode = $('#menuCode').val();
	var bookCode = $('#bookCode').val();
	
	$(document).on('click', '#myLibraryAlertModal', function() { 
		location.href = '/search/bookDetail?menuCode='+ menuCode +'&bookCode='+ bookCode;
	}); 



});

/* 함수선언 영역*/
(function($){
     aaa = function(){
	
     };
})(jQuery);
