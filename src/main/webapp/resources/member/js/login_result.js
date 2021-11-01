/* 페이지 로딩 후(jsp 내용 모두 실행) 실행 */
	$(document).ready(function(){
		
		var isDelete = $('#isDelete').val();
		var overCnt = $('#overCnt').val();
		var name = $('#name').val();
		
		/* 회원일 경우 */
		if (name != '') {
			
			/* 연체도서 없는 회원 */
			if (overCnt == 0) {
			
				$('#loginModalBody').text(name + '님 환영합니다 :)');
						
			}
			/* 연체도서 있는 회원 */
			else {
				
				$('#loginModalBody').text(name + '님, 연체중인 도서가 있습니다.\n반납기한을 확인해주세요.');
				
			}			
			
		}
		/* 탈퇴한 회원일 경우 */
		else if (isDelete == 'Y') {
			
			$('#loginModalBody').text('이미 탈퇴한 회원의 정보입니다.');
			
		}
		/* 잘못된 값을 입력했을 경우 */
		else {
			
			$('#loginModalBody').text('아이디 또는 비밀번호를 확인해주세요');
			
		}
		
		
	});

/* 함수선언 영역

	순서 주의 !
	함수명 = 함수선언(){};

*/
	(function($){

		
	})(jQuery);
	
	