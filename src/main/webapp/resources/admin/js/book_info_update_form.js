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
		
		// 삭제 버튼 클릭시 modal toggle
		$(document).on('click', '#deleteBtn' , function() {
			
			$('#bookDeleteModal').modal('show');
			
		});		
		
		// modal 삭제 버튼 클릭시 도서 정보 조회 후 삭제
		$(document).on('click', '#bookDeleteBtn' , function() {
			
			var bookCode = $('#bookCode').val();
			
			/* Ajax 시작 */
	   		$.ajax({
	            url: '/libManage/deleteBookInfoAjax', // 요청경로
	            type: 'post', // post 메소드 방식
	            data: {'bookCode':bookCode}, // 필요한 데이터를 status라는 이름으로 status 데이터를 넘긴다. 데이터가 여러개일 경우 쉼표로 연결.
	            success: function(result) { // result 값에 컨트롤러에서 돌려준 데이터가 들어간다.
	            	// ajax 실행 성공 후 실행할 코드 작성, 컨트롤러 이동 후 코드 실행, 완료 후 다시 돌아와 실행 됨 (페이지 이동 x)
	            	
	            	if (result == 'Y') {
	            		
	            		$('#bookDeleteModal').modal('hide');
	            		$('#bookDeleteAlertModalText').text('도서 정보가 삭제되었습니다.');
	            		$('#bookDeleteAlertModal').modal('show');
	            		
	            		$(document).on('click', '#bookDeleteAlertModalCloseBtn' , function() {
	            		
	            			location.href = '/libManage/bookManage?menuCode=MENU_006&sideMenuCode=SIDE_MENU_014';
	            		
	            		});	
	            	}
	            	else if (result == 'N') {
	            		
	            		$('#bookDeleteModal').modal('hide');
	            		$('#bookDeleteAlertModalText').text('현재 대출 또는 예약중인 도서는 정보를 삭제 할 수 없습니다.');
	            		$('#bookDeleteAlertModal').modal('show');	            		
	            		
	            	}

	            },
	            error: function(){
	           		// ajax 실행 실패 시 실행되는 구간
	           		alert('실패');
	            }
			});
   		/* Ajax 종료 */			
			
			
		});		
		
	
	});

/* 함수선언 영역

	순서 주의 !
	함수명 = 함수선언(){};

*/
	(function($){
		
	

	})(jQuery);