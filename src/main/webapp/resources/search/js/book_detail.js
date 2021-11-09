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
			
			// 로그인 하지 않았을 경우
			if (!id) {
				
				$('#bookDetailAlertModal').modal('hide');
				$('#bookDetailConfirmModal').modal('hide');
				$('#bookDetailAlertText').text('로그인이 필요합니다.');
				$('.bookDetailModalBtn').text('확인');
				$('.bookDetailModalBtn').attr('onclick','memberLoginForm();');
				$('#bookDetailAlertModal').modal('show');

			}
			
			// 로그인 했을 경우
			else {
				
				$('#bookDetailConfirmModal').modal('hide');
				$('#bookDetailAlertModal').modal('hide');
				$('#bookDetailConfirmModal').modal('show');
				
			}
			
		});
		/* 이벤트 종료 */
		
	
		
	});

/* 함수선언 영역

	순서 주의 !
	함수명 = 함수선언(){};

*/
	(function($){
		
		memberLoginForm = function() {
			
			var menuCode = $('#menuCode').val();
			
			location.href = '/member/memberLoginForm?menuCode=' + menuCode;
			
		}
		
		goBookDetail = function() {
			
			var menuCode = $('#menuCode').val();
			var bookCode = $('#bookCode').val();
			
			location.href ='/search/bookDetail?bookCode=' + bookCode  + '&menuCode=' + menuCode;
			
		}
		
		goReserve = function() {
			
			var menuCode = $('#menuCode').val();
			var bookCode = $('#bookCode').val();
			var id = $('#id').val();
			
			/* 대출&예약중인 권수 조회 Ajax 시작 */
			$.ajax({
		    url: '/libManage/selectUserBookCntAjax', // 요청경로
		    type: 'post', // post 메소드 방식
		    async : false, // 다중 Ajax 실행 시 success 실행 후에도 다음 Ajax 실행
		    data: {'id':id}, // 필요한 데이터를 status라는 이름으로 status 데이터를 넘긴다. 데이터가 여러개일 경우 쉼표로 연결.
		    success: function(result) { // result 값에 컨트롤러에서 돌려준 데이터가 들어간다.
		    	// ajax 실행 성공 후 실행할 코드 작성, 컨트롤러 이동 후 코드 실행, 완료 후 다시 돌아와 실행 됨 (페이지 이동 x)
			
			// 대출&예약 권수 초과가 아닐 경우
			if (result < 3) {
					
				/* 대출중인 도서인지 아닌지 Ajax 시작 */
				// 페이지 이동 없이 쿼리 실행 Ajax
				$.ajax({
					url: '/member/isMemeberRentalAjax', // 요청경로
					type: 'post', // post 메소드 방식
					async : false, // 다중 Ajax 실행 시 success 실행 후에도 다음 Ajax 실행
					data: {'id':id,'bookCode':bookCode}, // 필요한 데이터를 status라는 이름으로 status 데이터를 넘긴다. 데이터가 여러개일 경우 쉼표로 연결.
					success: function(result) { // result 값에 컨트롤러에서 돌려준 데이터가 들어간다.
					// ajax 실행 성공 후 실행할 코드 작성, 컨트롤러 이동 후 코드 실행, 완료 후 다시 돌아와 실행 됨 (페이지 이동 x)
						
						// 대출중인 도서가 아니라면
						if (result == 0 || result == null) {
							
								/* 예약 Ajax 시작 */
								// 페이지 이동 없이 쿼리 실행 Ajax
								$.ajax({
									url: '/member/reserveBookAjax', // 요청경로
									type: 'post', // post 메소드 방식
									data: {'id':id,'bookCode':bookCode,'status':4}, // 필요한 데이터를 status라는 이름으로 status 데이터를 넘긴다. 데이터가 여러개일 경우 쉼표로 연결.
									success: function(result) { // result 값에 컨트롤러에서 돌려준 데이터가 들어간다.
									// ajax 실행 성공 후 실행할 코드 작성, 컨트롤러 이동 후 코드 실행, 완료 후 다시 돌아와 실행 됨 (페이지 이동 x)
										
										$('#bookDetailConfirmModal').modal('hide');
										$('.bookDetailModalBtn').removeAttr('onclick');
										$('#bookDetailAlertText').text('도서가 예약되었습니다.');
										$('.bookDetailModalBtn').text('확인');
										$('.bookDetailModalBtn').attr('onclick','goBookDetail();');
										$('#bookDetailAlertModal').modal('show');
										
									},
									error: function(){
									// ajax 실행 실패 시 실행되는 구간
										alert('실패');
									}
								});
								/* Ajax 종료 */
							
						}
						
						else {
							
							$('#bookDetailConfirmModal').modal('hide');
							$('#bookDetailAlertModal').modal('hide');
							$('.bookDetailModalBtn').removeAttr('onclick');
							$('#bookDetailAlertText').text('이미 대출중인 도서입니다.');
							$('.bookDetailModalBtn').attr('data-bs-dismiss','modal');
							$('#bookDetailAlertModal').modal('show');
							return ;
						}
						
						
					},
					error: function(){
					// ajax 실행 실패 시 실행되는 구간
						alert('실패');
					}
				});
				/* 대출중인 도서인지 아닌지 Ajax 종료 */
				

			}
				else {
					
					$('#bookDetailConfirmModal').modal('hide');
					$('#bookDetailAlertModal').modal('hide');
					$('.bookDetailModalBtn').removeAttr('onclick');
					$('#bookDetailAlertText').text('대출 또는 예약가능 권수를 초과하셨습니다.');
					$('.bookDetailModalBtn').attr('data-bs-dismiss','modal');
					$('#bookDetailAlertModal').modal('show');
						
				}
														
            },
            error: function(){
           		// ajax 실행 실패 시 실행되는 구간
           		alert('실패');
            }
		});
		/* Ajax 종료 */					

			
	}
		

	})(jQuery);