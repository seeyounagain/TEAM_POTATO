/* 페이지 로딩 후(jsp 내용 모두 실행) 실행 */
	$(document).ready(function(){
		
		//엔터키 눌러서 로그인 실행
		$('#goLogin').keydown(function(e){
			if(e.keyCode == 13){
				login(); 
			}
		});
		
		$(document).on('click', '#loginBtn' , function() {
		
			var pw = $('#pw').val();
			var id = $('#id').val();
			
			if (id == '' || pw == '') {
				
				$('#loginAlertModal').modal('show');
				return ;
				
			}
			
			else {
		
			/* 로그인 Ajax 시작 */
			
			$.ajax({
		        url: '/member/login', // 요청경로
		        type: 'post', // post 메소드 방식
		        data: {'id':id,'pw':pw}, // 필요한 데이터를 status라는 이름으로 status 데이터를 넘긴다. 데이터가 여러개일 경우 쉼표로 연결.
		        success: function(result) { // result 값에 컨트롤러에서 돌려준 데이터가 들어간다.
		        	// ajax 실행 성공 후 실행할 코드 작성, 컨트롤러 이동 후 코드 실행, 완료 후 다시 돌아와 실행 됨 (페이지 이동 x)
		     		
					// 로그인 되었으며, 탈퇴한 회원이 아닐 경우 경우
					if (result.isDelete == 'N') {
						
						// 연체도서 없는 회원
						if (result.overCnt == 0) {
							
							$('#loginModalBody').text(result.name + '님 환영합니다 :)');
							//엔터키 눌러서 이동
							$('#loginModal').keydown(function(e){
								if(e.keyCode == 13){
									location.href='/common/main'
								}
							});
							$('.loginModalClose').attr('onclick','location.href="/common/main"');
							
						}
						// 없는 회원
						else {
							
							$('#loginModalBody').text(result.name + '님, 연체중인 도서가 있습니다. 반납기한을 확인해주세요.');
							$('.loginModalClose').attr('onclick','location.href="/myPage/myPage?menuCode=MENU_005"');
							
						}
			
					}
					// 탈퇴한 회원일 경우
					else if (result.isDelete == 'Y') {
						
						$('#loginModalBody').text('이미 탈퇴한 회원의 정보입니다.');
						
					}
					// 로그인 되지 않았을 경우
					else {
						
						$('#loginModalBody').text('아이디 또는 비밀번호를 확인해주세요');
						
					}
			
		        },
		        error: function(){
		       		// ajax 실행 실패 시 실행되는 구간
		       		alert('실패');
		        }
			});
			/* 로그인 Ajax 종료 */			
		
			}
			
			$('#loginModal').modal('show');
			
		});
		
		
	});

/* 함수선언 영역

	순서 주의 !
	함수명 = 함수선언(){};

*/
	(function($){
		login = function(){
			
			var pw = $('#pw').val();
			var id = $('#id').val();
			
			if (id == '' || pw == '') {
				
				$('#loginAlertModal').modal('show');
				return ;
				
			}
			
			else {
		
			/* 로그인 Ajax 시작 */
			
			$.ajax({
		        url: '/member/login', // 요청경로
		        type: 'post', // post 메소드 방식
		        data: {'id':id,'pw':pw}, // 필요한 데이터를 status라는 이름으로 status 데이터를 넘긴다. 데이터가 여러개일 경우 쉼표로 연결.
		        success: function(result) { // result 값에 컨트롤러에서 돌려준 데이터가 들어간다.
		        	// ajax 실행 성공 후 실행할 코드 작성, 컨트롤러 이동 후 코드 실행, 완료 후 다시 돌아와 실행 됨 (페이지 이동 x)
		     		
					// 로그인 되었으며, 탈퇴한 회원이 아닐 경우 경우
					if (result.isDelete == 'N') {
						
						// 연체도서 없는 회원
						if (result.overCnt == 0) {
							
							$('#loginModalBody').text(result.name + '님 환영합니다 :)');
							//엔터키 눌러서 이동
							$('#loginModal').keydown(function(e){
								if(e.keyCode == 13){
									location.href='/common/main'
								}
							});
							$('.loginModalClose').attr('onclick','location.href="/common/main"');
							
						}
						// 없는 회원
						else {
							
							$('#loginModalBody').text(result.name + '님, 연체중인 도서가 있습니다. 반납기한을 확인해주세요.');
							$('.loginModalClose').attr('onclick','location.href="/myPage/myPage?menuCode=MENU_005"');
							
						}
			
					}
					// 탈퇴한 회원일 경우
					else if (result.isDelete == 'Y') {
						
						$('#loginModalBody').text('이미 탈퇴한 회원의 정보입니다.');
						
					}
					// 로그인 되지 않았을 경우
					else {
						
						$('#loginModalBody').text('아이디 또는 비밀번호를 확인해주세요');
						
					}
			
		        },
		        error: function(){
		       		// ajax 실행 실패 시 실행되는 구간
		       		alert('실패');
		        }
			});
			/* 로그인 Ajax 종료 */			
		
			}
			
			$('#loginModal').modal('show');
		};
		
		
	})(jQuery);