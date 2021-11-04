//화면 로딩 후 바로 실행
$(document).ready(function(){
	
		$('html,body').animate({
			scrollTop:150
		},100);
		
	$(document).on('click','#goRequestStatus',function(){
        var loginInfo = $('.loginInfo').val();
		if(loginInfo){
		location.href='/myPage/bookRequestStatus?menuCode=MENU_005';		
				
		}else{
			var login = confirm('홈페이지에 확인된 ID 정보가 없습니다. \n로그인화면으로 이동하시겠습니까?');
			if(login){
				location.href='/member/memberLoginForm';				
			}
		}
	});	
	
	$(document).on('click','#goRequest',function(){
		var menuCode = $('.menuCode').val();
		
        var loginInfo = $('.loginInfo').val();
		if(loginInfo){
		$('#goRegModal').modal('show');	
				
		}else{
			var login = confirm('홈페이지에 확인된 ID 정보가 없습니다. \n로그인화면으로 이동하시겠습니까?');
			if(login){
				location.href='/member/memberLoginForm';				
			}
		}
	});
	
	$(document).on('click','#deleteRequest',function(){
		var requestCode = $(this).parent().parent().prev().children().eq(0).text();
		
		$('#requestCodeP').text(requestCode);
		$('#deleteBookRequestConfirm').modal('show');	
		
		
	});

});	

//함수 선언 영역
(function($){
	goRequestRegFormFunction = function(menuCode){
		location.href='/service/bookRequestRegForm?menuCode='+menuCode;
	}
	
	deleteBookRequest = function(menuCode){
		var requestCode = $('#requestCodeP').text();
		location.href='/service/deleteBookRequest?menuCode='+menuCode+'&&requestCode='+requestCode;
	}
   
})(jQuery);








