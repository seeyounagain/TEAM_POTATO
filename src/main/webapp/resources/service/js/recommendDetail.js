//화면 로딩 후 바로 실행
$(document).ready(function(){
	
	
	
	
	
	$(document).on('click', '#closeRcBtn', function() {
		$('#rcListForUser').css('display','none');
		$('#closeRcBtn').css('display','none');
		$('#openRcBtn').css('display','flex');
	});
	$(document).on('click', '#openRcBtn', function() {
		$('#rcListForUser').css('display','inline');
		$('#closeRcBtn').css('display','flex');
		$('#openRcBtn').css('display','none');
	});
   
   

	
});

//함수 선언 영역
(function($){
	//aaa = function(){
	//};
   
})(jQuery);



