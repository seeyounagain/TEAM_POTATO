/* 페이지 로딩 후(jsp 내용 모두 실행) 실행 */
	$(document).ready(function(){
		
		// caps lock
		$('#goLogin').on('keydown focus blur', function (e) {
		    if (e.originalEvent.getModifierState("CapsLock")) {
		        $('#capsLockCheck').text('<Caps Lock>이 켜져있습니다.');
		    } else {
		        $('#capsLockCheck').text('');
		    };
		});

		
		//엔터키 눌러서 로그인 실행
		$('#goLogin').keydown(function(e){
			if(e.keyCode == 13){
				login(); 
			}
		});
		//엔터키 눌러서 모달창 닫기
		$('#goLogin').keydown(function(e){
			if(e.keyCode == 13){
				$('#loginAlertModal').modal('hide');
			}
		});
		
		//모달창 닫으면 인풋태그 내용 지우고 포커스주기
		var loginAlertModal = document.getElementById('loginAlertModal');
		
		loginAlertModal.addEventListener('hidden.bs.modal', function (event) {
			$('#id').val('');
			$('#pw').val('');
			
			$('#id').focus();
 		})
 		
 		//모달창 닫으면 인풋태그 내용 지우고 포커스주기
 		var loginModal = document.getElementById('loginModal');
		
		loginModal.addEventListener('hidden.bs.modal', function (event) {
			$('#id').val('');
			$('#pw').val('');
			
			$('#id').focus();
		})
		
		
		
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
							$('.loginModalClose').attr('onclick','location.href="/myPage/myLibrary?menuCode=MENU_005"');

							//엔터키 눌러서 모달창 닫기
							$('#goLogin').keydown(function(e){
								if(e.keyCode == 13){
									$('#loginModal').modal('hide');
									
									var loginModal = document.getElementById('loginModal')
									
									//loginModal 모달창을 닫으면
					            	loginModal.addEventListener('hidden.bs.modal', function (event) {
					            		   location.href = '/myPage/myLibrary?menuCode=MENU_005';
					            	})
								}
							});
							
						}
			
					}
					// 탈퇴한 회원일 경우
					else if (result.isDelete == 'Y') {
						
						$('#loginModalBody').text('이미 탈퇴한 회원의 정보입니다.');
						$('#goLogin').keydown(function(e){
							if(e.keyCode == 13){
								$('#loginModal').modal('hide');
							}
						});
						
					}
					// 로그인 되지 않았을 경우
					else {
						
						$('#loginModalBody').text('아이디 또는 비밀번호를 확인해주세요');
						$('#goLogin').keydown(function(e){
							if(e.keyCode == 13){
								$('#loginModal').modal('hide');
							}
						});
						
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
		
		// 아이디찾기 버튼 클릭 시
		findId = function(){
			
			$('#findIdname').val('');
			$('#findIdbirth').val('');
			$('#findIdCheck').text('');
			$('#findIdModal').modal('show');
			
			$(document).on('click', '#findIdBtn' , function() {
			
				var findIdname = $('#findIdname').val();
				var findIdbirth = $('#findIdbirth').val();
				
				/* 아이디 찾기 Ajax 시작 */
				$.ajax({
					url: '/member/findIdAjax', // 요청경로
					type: 'post', // post 메소드 방식
					data: {'name':findIdname,'birth':findIdbirth}, // 필요한 데이터를 status라는 이름으로 status 데이터를 넘긴다. 데이터가 여러개일 경우 쉼표로 연결.
					success: function(result) { // result 값에 컨트롤러에서 돌려준 데이터가 들어간다.
					// ajax 실행 성공 후 실행할 코드 작성, 컨트롤러 이동 후 코드 실행, 완료 후 다시 돌아와 실행 됨 (페이지 이동 x)
						
						if (result == null || result == '') {
							
							$('#findIdCheck').css('color', 'red');
							$('#findIdCheck').text('이름과 생년월일에 해당하는 회원정보가 없습니다.');
							
						}
						
						else {
							
								var originStr = result; 
								var maskingStr;
								var strLength;

								strLength = originStr.length; 
								if(strLength < 4){ 
									maskingStr = originStr.replace(/(?<=.{2})./gi, "*"); 
								}
								else {
									maskingStr = originStr.replace(/(?<=.{3})./gi, "*"); 
								} 
								
							
							$('#findIdCheck').css('color', 'black');
							$('#findIdCheck').text('회원님의 아이디는 [' + maskingStr + '] 입니다.');
							
						}
						
					},
					error: function(){
					// ajax 실행 실패 시 실행되는 구간
					alert('아이디 찾기 실패!');
					}
				});
				/* 아이디 찾기 Ajax 종료 */
				
			});
			
		};
		
		// 비밀번호 찾기 버튼 클릭 시
		findPw = function(){
			
			$('#findPwId').val('');
			$('#findPwBirth').val('');
			$('#tell2').val('');
			$('#tell3').val('');
			$('#findPwCheck').text('');
			$('#findPwModal').modal('show');
			
			$(document).on('click', '#findPwBtn' , function() {
			
			var tell = $('#tell1').val() + '-' + $('#tell2').val() + '-' + $('#tell3').val();
			var findPwId = $('#findPwId').val();
			var findPwBirth = $('#findPwBirth').val();

			/* 비밀번호 찾기 Ajax 시작 */
			$.ajax({
				url: '/member/findPwAjax', // 요청경로
				type: 'post', // post 메소드 방식
				async : false,
				data: {'tell':tell,'birth':findPwBirth,'id':findPwId}, // 필요한 데이터를 status라는 이름으로 status 데이터를 넘긴다. 데이터가 여러개일 경우 쉼표로 연결.
				success: function(result) { // result 값에 컨트롤러에서 돌려준 데이터가 들어간다.
				// ajax 실행 성공 후 실행할 코드 작성, 컨트롤러 이동 후 코드 실행, 완료 후 다시 돌아와 실행 됨 (페이지 이동 x)
					
					if (result == null || result == '') {
						
						$('#findPwCheck').css('color', 'red');
						$('#findPwCheck').text('아이디와 생년월일, 연락처에 해당하는 회원정보가 없습니다.');
						
					}
					
					else {
						
						var toNumber = $('#tell1').val() + $('#tell2').val() + $('#tell3').val();
						
						/* 문자 전송 Ajax 시작 */
						$.ajax({
							url: '/libManage/sendSMSMemberPwAjax', // 요청경로
							type: 'post', // post 메소드 방식
							data: {'toNumber':toNumber,'pw':result}, // 필요한 데이터를 status라는 이름으로 status 데이터를 넘긴다. 데이터가 여러개일 경우 쉼표로 연결.
							success: function(result) { // result 값에 컨트롤러에서 돌려준 데이터가 들어간다.
							// ajax 실행 성공 후 실행할 코드 작성, 컨트롤러 이동 후 코드 실행, 완료 후 다시 돌아와 실행 됨 (페이지 이동 x)

								$('#findPwCheck').css('color', 'black');
								$('#findPwCheck').text('회원님의 연락처로 비밀번호를 전송했습니다.');
								
							},
							error: function(){
							// ajax 실행 실패 시 실행되는 구간
							alert('문자 전송 실패!');
							}
						});
						/* 문자 전송 Ajax 종료 */
						
						
					}
					
				},
				error: function(){
				// ajax 실행 실패 시 실행되는 구간
				alert('비밀번호 찾기 실패!');
				}
			});
			/* 비밀번호 찾기 Ajax 종료 */
			
			
			});
			
		};
		
})(jQuery);