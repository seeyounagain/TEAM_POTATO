/* 페이지 로딩 후(jsp 내용 모두 실행) 실행 */
	$(document).ready(function(){
		
		$(document).on('click', '#detailBtn' , function() {
		
			if ($('#searchBox').css('display') == 'none') {
				$('#searchBox').show();
			}
			else {
				$('#searchBox').hide();
			}
			
		});
		
		
	});

/* 함수선언 영역

	순서 주의 !
	함수명 = 함수선언(){};

*/
	(function($){
		
		
		

	})(jQuery);