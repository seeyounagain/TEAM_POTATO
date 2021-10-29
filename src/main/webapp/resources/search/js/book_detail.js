/* 페이지 로딩 후(jsp 내용 모두 실행) 실행 */
	$(document).ready(function(){
		
		$('#backIcon').hover(function () {
		    $(this).attr("src", $(this).attr("src").replace("/resources/img/back_off.png", "/resources/img/back_on.png"));
		}, function () {
		    $(this).attr("src", $(this).attr("src").replace("/resources/img/back_on.png", "/resources/img/back_off.png"));
		});
				
		/* 이벤트 시작 */
		// 예약 버튼 클릭 시
		$(document).on('click', '#reserveBtn' , function() {
			
			var id = $('#id').val();
			var menuCode = $('#menuCode').val();
			var bookCode = $('#bookCode').val();
			
			if (!id) {
				
				alert('로그인이 필요합니다.');
				location.href = '/member/memberLoginForm?menuCode=' + menuCode;
				
			}
			
			else {
				
				var result = confirm('도서를 예약하시겠습니까?\n도서가 반납되면 대출 가능합니다.');
				/* if 시작 */
				if (result) {
					
					/* 대출&예약중인 권수 조회 Ajax 시작 */
					$.ajax({
				    url: '/libManage/selectUserBookCntAjax', // 요청경로
				    type: 'post', // post 메소드 방식
				    async : false, // 다중 Ajax 실행 시 success 실행 후에도 다음 Ajax 실행
				    data: {'id':id}, // 필요한 데이터를 status라는 이름으로 status 데이터를 넘긴다. 데이터가 여러개일 경우 쉼표로 연결.
				    success: function(result) { // result 값에 컨트롤러에서 돌려준 데이터가 들어간다.
				    	// ajax 실행 성공 후 실행할 코드 작성, 컨트롤러 이동 후 코드 실행, 완료 후 다시 돌아와 실행 됨 (페이지 이동 x)
				
					if (result < 3) {
					
							/* 예약 Ajax 시작 */
							// 페이지 이동 없이 쿼리 실행 Ajax
							$.ajax({
								url: '/member/reserveBookAjax', // 요청경로
								type: 'post', // post 메소드 방식
								data: {'id':id,'bookCode':bookCode,'status':4}, // 필요한 데이터를 status라는 이름으로 status 데이터를 넘긴다. 데이터가 여러개일 경우 쉼표로 연결.
								success: function(result) { // result 값에 컨트롤러에서 돌려준 데이터가 들어간다.
								// ajax 실행 성공 후 실행할 코드 작성, 컨트롤러 이동 후 코드 실행, 완료 후 다시 돌아와 실행 됨 (페이지 이동 x)
									alert('도서가 예약되었습니다.');
									location.href='/search/bookDetail?bookCode=' + bookCode  + '&menuCode=' + menuCode;
								},
								error: function(){
								// ajax 실행 실패 시 실행되는 구간
									alert('실패');
								}
							});
							/* Ajax 종료 */
						}
						else {
							
							alert('대출 또는 예약가능 권수를 초과하셨습니다.');
							
						}											
		            },
		            error: function(){
		           		// ajax 실행 실패 시 실행되는 구간
		           		alert('실패');
		            }
				});
				/* Ajax 종료 */					

			}
			/* else in if 종료 */
				
			}
			
		});
		/* 이벤트 종료 */
		
	
		
	});

/* 함수선언 영역

	순서 주의 !
	함수명 = 함수선언(){};

*/
	(function($){
		
		
		

	})(jQuery);