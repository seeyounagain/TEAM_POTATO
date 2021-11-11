//화면 로딩 후 바로 실행
$(document).ready(function(){
	
		
	$(document).on('click','#goRequestStatus',function(){
        var loginInfo = $('.loginInfo').val();
		if(loginInfo){
		location.href='/myPage/bookRequestStatus?menuCode=MENU_005';		
				
		}else{
			$('#loginCheckModal').modal('show');
		}
	});	
	
	$(document).on('click','#goRequest',function(){
		var menuCode = $('.menuCode').val();
		
        var loginInfo = $('.loginInfo').val();
		if(loginInfo){
		$('#goRegModal').modal('show');				
		}else{
		$('#loginCheckModal').modal('show');
		}
	});
	


});	

//함수 선언 영역
(function($){
	goRequestRegFormFunction = function(menuCode){
		location.href='/service/bookRequestRegForm?menuCode='+menuCode;
	}
	

})(jQuery);








