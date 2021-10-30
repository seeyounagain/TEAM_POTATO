/* 페이지 로딩 후(jsp 내용 모두 실행) 실행 */
	$(document).ready(function(){
		
		
		
		// 등록할 도서 정보 체크 confirm
		$(document).on('click', '#regBtn' , function() {

			var isbn = $('#isbn').val();
			var title = $('#title').val();
			var kdc = $('#kdc').val();
			var writer = $('#writer').val();
			var publisher = $('#publisher').val();
			var pubDate = $('#pubDate').val();
			var page = $('#page').val();
			var bookSize = $('#bookSize').val();
			var keyword = $('#keyword').val();
			var summary = $('#summary').val();
			var intro = $('#intro').val();
			var area = $('#area').val();
			var file = $('#file').val();

			var result = confirm(
				'도서를 등록 하시겠습니까?\n' +
				'ISBN : ' + isbn + '\n' +
				'표제 : ' + title + '\n' +
				'청구기호 :  ' + kdc + '\n' + 
				'저자 :  ' + writer + '\n' + 
				'발행처 :  ' + publisher + '\n' + 
				'발행년도 :  ' + pubDate + '\n' + 
				'쪽수 :  ' + page + '\n' + 
				'크기 :  ' + bookSize + '\n' + 
				'주제 :  ' + keyword + '\n' + 
				'한줄소개 :  ' + summary + '\n' + 
				'소개글 :  ' + intro + '\n' + 
				'위치 :  ' + area + '\n'
			);
			
			
			if (result) {
				
				$('#regBtn').submit();
				
			}
				
			
		});
		
	
	});

/* 함수선언 영역

	순서 주의 !
	함수명 = 함수선언(){};

*/
	(function($){
		
	

	})(jQuery);