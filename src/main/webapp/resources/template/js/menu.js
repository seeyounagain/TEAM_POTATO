/* 페이지 로딩 후(jsp 내용 모두 실행) 실행 */
	$(document).ready(function(){
		
		$(document).on('click', '#logout', function() { 
			
			var result = confirm('로그아웃 하시겠습니까?');
	
				if (result) {
				 	location.href = '/member/logout';
				}
			
		});
		
	});

/* 함수선언 영역

	순서 주의 !
	함수명 = 함수선언(){};

*/
	(function($){
		

		
	})(jQuery);