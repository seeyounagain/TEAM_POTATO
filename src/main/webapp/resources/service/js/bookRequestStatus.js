//화면 로딩 후 바로 실행
$(document).ready(function(){


 
 
 	$(document).on('click','#canselRequest',function(){
		var requestCode = $(this).parent().parent().prev().children().eq(0).text();
		
		$('#requestCodeP').text(requestCode);
		
		$('#deleteBookRequestConfirm').modal('show');	
		
		
	});

	
});

//함수 선언 영역
(function($){
	//aaa = function(){
	//};	
		deleteBookRequest = function(menuCode){
		var requestCode = $('#requestCodeP').text();
		location.href='/service/deleteBookRequest?menuCode='+menuCode+'&&requestCode='+requestCode;
	}
   
   
})(jQuery);


