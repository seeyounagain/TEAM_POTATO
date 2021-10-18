/* 페이지 로딩 후(jsp 내용 모두 실행) 실행 */
	$(document).ready(function(){
		
		$(document).on('mousedown', '#id' , function() {
		
			$('#idAlert').text('');
			$('#joinBtn').addClass('disabled');
			
		});
		
		
	});

/* 함수선언 영역

	순서 주의 !
	함수명 = 함수선언(){};

*/
	(function($){
		
		// 우편번호
		openPostcode = function() {
			new daum.Postcode({
				oncomplete: function(data) {
				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('postcode').value = data.zonecode;
				document.getElementById("address").value = data.roadAddress;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("detailAddress").focus();
				}
			}).open();
		};
		
		// 회원가입 버튼 함수
		goJoin = function() {
			
			var pw = $('#pw').val();
			var checkPw = $('#checkPw').val();
			
			if (pw != checkPw) {
				
				alert('비밀번호를 확인해주세요');
				$('input[type="password"]').val('');
				$('#pw').focus();
				return ;
				
			}
			
			else {
				
				$('form').submit();
				
			}
			
		};
		
		// 아이디 중복체크 alert
		checkId = function() {
			
			var id = $('#id').val();
			
			if (id == '') {
				
				$('#idAlert').css('color', 'red');
				$('#idAlert').text('* 아이디를 입력해주세요.');
				return ;
				
			}
			
		// 아이디 중복체크 Ajax
			$.ajax({
				url: '/member/checkId', //요청경로
				type: 'post',
				data:{'id':id}, //필요한 데이터
				success: function(result) {
					//ajax 실행 성공 후 실행할 코드 작성
					if (result) {
						$('#idAlert').css('color', 'red');
						$('#idAlert').text('! 이미 사용중인 아이디입니다.');
						$('#joinBtn').addClass('disabled');
						$('#id').val('');
						$('#id').focus();
						return ;
					}
					else {
						$('#idAlert').css('color', 'blue');
						$('#idAlert').text('사용가능한 아이디입니다.');
						$('#joinBtn').removeClass('disabled');

						return ;
					}	
	
				},
				error: function(){
					//ajax 실행 실패 시 실행되는 구간
					alert('실패');
				}
			});
		
		
		
		};

	})(jQuery);