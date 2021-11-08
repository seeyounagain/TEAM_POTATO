/* 페이지 로딩 후(jsp 내용 모두 실행) 실행 */
	$(document).ready(function(){
		
		// 수정 버튼 클릭시 modal toggle
		$(document).on('click', '#regBtn' , function() {
		
			$('#bookInfoUpdateModal').modal('show');
			
		});
		
		// modal 수정 버튼 클릭시 도서정보 수정
		$(document).on('click', '.bookInfoUpdateBtn' , function() {

			$('#updateBook').submit();
			
		});
		
	
	});

/* 함수선언 영역

	순서 주의 !
	함수명 = 함수선언(){};

*/
	(function($){
		
	

	})(jQuery);