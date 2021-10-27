/* 페이지 로딩 후(jsp 내용 모두 실행) 실행 */
	$(document).ready(function(){
		
		// 현재 날짜
		function getToday(){
			var date = new Date();
			var year = date.getFullYear();
			var month = ("0" + (1 + date.getMonth())).slice(-2);
			var day = ("0" + date.getDate()).slice(-2);
			
			return year + "-" + month + "-" + day;
		}
		
		// 한달 전 날짜
		function getOneMonthAgo(){
			var date = new Date();
			var year = date.getFullYear();
			var month = ("0" + (date.getMonth())).slice(-2);
			var day = ("0" + date.getDate()).slice(-2);
			
			return year + "-" + month + "-" + day;
		}
		
		// 날짜 기본값 설정
		var nowDate = getToday();
		var oneMonthAgo = getOneMonthAgo();
		
		if (!$('#searchBegin').val()) {
			
			$('#searchBegin').val(oneMonthAgo);
			$('#searchEnd').val(nowDate);
			
		}
		
		$('#searchBegin').attr('max', nowDate);
		$('#searchEnd').attr('max', nowDate);
			
			
		/* 기간 변경 시 */
		$(document).on('change', '#searchBegin, #searchEnd' , function() {
			
			var searchBegin = $('#searchBegin').val();
			var searchEnd = $('#searchEnd').val();
			var menuCode = $('#menuCode').val();
			
 			location.href='/search/newBookList?searchBegin=' + searchBegin + '&searchEnd=' + searchEnd + '&menuCode=' + menuCode;
 			
   		});
   		/* 이벤트 종료 */
				
		
	
		
	});

/* 함수선언 영역

	순서 주의 !
	함수명 = 함수선언(){};

*/
	(function($){
				

		

	})(jQuery);