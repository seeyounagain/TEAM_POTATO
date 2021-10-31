/* 페이지 로딩 후(jsp 내용 모두 실행) 실행 */
	$(document).ready(function(){
		
		$(document).on('click', '#loginBtn' , function() {
		
			var pw = $('#pw').val();
			var id = $('#id').val();
			
			if (id == '' || pw == '') {
				
				$('#loginAlertModal').modal('show');
				return ;
				
			}
			
			else {
				
				$('form').submit();				
				
			}
			
		});
		
		
	});

/* 함수선언 영역

	순서 주의 !
	함수명 = 함수선언(){};

*/
	(function($){
		
		
		
	})(jQuery);