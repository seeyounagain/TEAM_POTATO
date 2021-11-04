//화면 로딩 후 바로 실행
$(document).ready(function(){
	

	$(document).on('change','#status',function(){
		if($(this).val() != '' ){
			$(this).parent().next().children().removeClass('disabled');
		}
		
		if($(this).val() == ''){
			$(this).parent().next().children().addClass('disabled');
		}
		
	})
		
	$(document).on('click','.requestStatusChange',function(){
	var status = $(this).parent().prev().children().val();
	alert(status);


	})


	
})


//함수 선언 영역
(function($){
	//aaa = function(){
	//};
   
})(jQuery);







