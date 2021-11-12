/* 페이지 로딩 후(jsp 내용 모두 실행) 실행 */
	$(document).ready(function(){
		
		// 현재 날짜
		function getToday(){
			var date = new Date();
			var year = date.getFullYear();
			var month = ("0" + (1 + date.getMonth())).slice(-2);
			var day = ("0" + date.getDate()).slice(-2);
			
			return year + "-" + month + "-" + day;
		};
		
		// 14년전 날짜
		function get14yearAgo(){
			var date = new Date();
			var year = date.getFullYear() - 14;
			var month = ("0" + (1 + date.getMonth())).slice(-2);
			var day = ("0" + date.getDate()).slice(-2);
			
			return year + "-" + month + "-" + day;
		};
		
		var nowDate = getToday();
		
		var minDate = get14yearAgo();
		
		// 생년월일 최대값 만 14세 이상 날짜로 지정
		$('#birth').attr('max', minDate);
		
		// 아이디 입력칸에 마우스 클릭 시 가입버튼 비활성화
		$(document).on('mousedown', '#id' , function() {
		
			$('#idAlert').text('');
			$('#joinBtn').addClass('disabled');
			
		});
		
		// 비밀번호 확인 칸에 마우스 클릭 시 경고문 해제
		$(document).on('mousedown', '#checkPw' , function() {
		
			$('#pwCheck').text('');
			
		});
		
		// 비밀번호 확인 칸에 입력 했을 경우 동일한지 체크
		$(document).on('keyup', '#checkPw' , function() {
		
			var pw = $('#pw').val();
			var checkPw = $('#checkPw').val();
			
			if (pw != checkPw) {
				
				$('#pwCheck').css('color', 'red');
				$('#pwCheck').text('* 비밀번호를 확인해주세요.');
				return ;
				
			}
			
			else {
				
				$('#joinBtn').removeClass('disabled');
				$('#pwCheck').text('');
				return ;				
				
			}
			
		});
		
		// 아이디 정규식
		$(document).on('keyup', '#id' , function() {
		
			//아이디 정규식 소문자a~z,0~9로 4~12자리 만들기
			var idJ = /^[a-z0-9]{4,12}$/;
				
				// 조건에 부합하지않다면
				if(!idJ.test($('#id').val())){
					
					$('#idAlert').text('* 4자~12자리의 영소문자, 숫자 / @,#$등 특수문자는 제외한 아이디로 입력해주세요.');
					$('#joinBtn').addClass('disabled');
					return ;
				}
				
				else {
					
					$('#idAlert').css('color', 'blue');
					$('#idAlert').text('아이디 중복확인을 해주세요.');
					$('#joinBtn').addClass('disabled');
					
				}
			
		});
		
		//이름 정규식
		$(document).on('keyup', '#name', function() {
		     
		     //한글로 이뤄진 문자 2~10자리 만들기
		      var nameJ = /^[가-힣]{2,10}$/;
		      
		      // 조건에 부합할경우
		      if(nameJ.test($('#name').val())){
		      
		         $('#nameAlert').text('');
		         $('#joinBtn').addClass('disabled');
		         return ;
		      }
		      
		      else{
		      	
		      	 $('#nameAlert').text('* 10자리 내의 한글로 입력해주세요.');
		         $('#joinBtn').addClass('disabled');
		         return ;
		      }
		});
		
		//비밀번호 정규식
		$(document).on('keyup', '#pw', function() { 
			
			//소대문자a~z,0~9로 4~12자리 만들기
			var pwJ = /^[A-Za-z0-9]{8,20}$/;
			
			// 조건에 부합하다면
			if(pwJ.test($('#pw').val())){
			
				$('#pwAlert').text('');
				$('#joinBtn').addClass('disabled');
				return ;
			}
			
			else{
			
				$('#pwAlert').text('* 영문 대문자, 소문자, 숫자를 사용하여 8자 이상, 20자 이하로 설정하십시오');
				$('#joinBtn').addClass('disabled');
				return ;
			}
		});
		
		//휴대번호 정규식
		$(document).on('keyup', '.tells', function() { 
			var tell1J = /^01[0||1||6||8]{1}$/;
			var tell2J = /^[0-9]{3,4}$/;
			var tell3J = /^[0-9]{4}$/;
      		
      		// 모든 조건에 부합한다면
			if(tell1J.test($('#tell1').val()) && tell2J.test($('#tell2').val()) && tell3J.test($('#tell3').val())){
				
				$('#tellCheck').text('');
				$('#joinBtn').addClass('disabled');
				$('#smsBtn').removeClass('disabled');
				return ;
			}
			else{
				
				$('#tellCheck').text('* 휴대전화 번호를 확인해주세요.');
				$('#joinBtn').addClass('disabled');
				$('#smsBtn').addClass('disabled');
				return ;
			}
		});


	var isRunning = false;
	
	
		//휴대번호 인증 클릭 시
		$(document).on('click', '#smsBtn' , function() {
			
			var toNumber = $('#tell1').val() + $('#tell2').val() + $('#tell3').val();
			
			/* 문자 전송 Ajax 시작 */
			$.ajax({
				url: '/libManage/sendSMSRandomNumberAjax', // 요청경로
				type: 'post', // post 메소드 방식
				data: {'toNumber':toNumber}, // 필요한 데이터를 status라는 이름으로 status 데이터를 넘긴다. 데이터가 여러개일 경우 쉼표로 연결.
				success: function(result) { // result 값에 컨트롤러에서 돌려준 데이터가 들어간다.
				// ajax 실행 성공 후 실행할 코드 작성, 컨트롤러 이동 후 코드 실행, 완료 후 다시 돌아와 실행 됨 (페이지 이동 x)

				$('#smsCheck').remove();
				
				var str = '';
				
				str += '<div class="col-12 mt-2" id="smsCheck" >';
				str += '<div class="row">';
				str += '<div class="col-8">';
				str += '<input type="text" id="smsNum" class="form-control" name="smsNum" placeholder="문자로 받으신 인증번호를 입력해주세요." required>';
				str += '</div>';
				str += '<div class="col-2 mt-2" id="timeAlert" style="color: red; font-size: 18px; vertical-align: middle;"></div>';
				str += '<div class="col-2 d-grid" style="padding-left: 3px;">';
				str += '<button type="button" class="btn btn-primary " id="checkSmsBtn" data-randomNumber="' + result + '" >확인</button>';
				str += '</div>';
				str += '</div>';
				str += '</div>';
	
				$('#smsBtn').parent().parent().parent().after(str);
					
				},
				error: function(){
				// ajax 실행 실패 시 실행되는 구간
				alert('문자 전송 실패!');
				}
			});
			/* 문자 전송 Ajax 종료 */
			
			$('#smsBtn').addClass('disabled');
			
			var leftSec = 180;
    		// 남은 시간
    		// 이미 타이머가 작동중이면 중지
    		if (isRunning){
    		clearInterval(timer);
    		$('#timeAlert').text('');
    		startTimer(leftSec);
    		}else{
    		startTimer(leftSec);
    		}
			
		});
		
		/* 인증번호 체크 */
		$(document).on('click', '#checkSmsBtn' , function() {
		
			var randomNumber = $(this).attr('data-randomNumber');
			var checkNum = $('#smsNum').val();
			
			if (randomNumber == checkNum) {
				
				$('#tellCheck').css('color', 'blue');
				$('#tellCheck').text('인증이 완료되었습니다.');
	        	clearInterval(timer);
	        	$('#timeAlert').text('');
				$('.tells').attr('readonly','readonly');
				$('#smsNum').attr('readonly','readonly');
				$('#joinBtn').removeClass('disabled');
				$('#checkSmsBtn').addClass('disabled');
				$('#smsBtn').addClass('disabled');
				
			}
			else {
				
				$('#tellCheck').css('color', 'red');
				$('#tellCheck').text('인증번호를 확인해주세요.');
				
			}
			
		});		
		
		/* 회원가입 */
		$(document).on('click', '#joinBtn' , function() {
		
			var pw = $('#pw').val();
			var checkPw = $('#checkPw').val();
				
				if ($('#name').val() == null || $('#name').val() == '') {
					$('#joinBtn').addClass('disabled');
					$('#joinCheckModalText').text('이름을 확인해주세요.');
					$('#joinCheckModal').modal('show');
					$(document).on('click', '#joinCheckModalBtn' , function() {
						$('#name').focus();
					});
					return ;
				}
				if ($('#id').val() == null || $('#id').val() == '') {
					$('#joinBtn').addClass('disabled');
					$('#joinCheckModalText').text('아이디를 확인해주세요.');
					$('#joinCheckModal').modal('show');
					$(document).on('click', '#joinCheckModalBtn' , function() {
						$('#id').focus();
					});
					return ;
				}
				if ($('#pw').val() == null || $('#pw').val() == '' || $('#checkPw').val() == null || $('#checkPw').val() == '') {
					$('#joinBtn').addClass('disabled');
					$('#joinCheckModalText').text('비밀번호를 확인해주세요.');
					$('#joinCheckModal').modal('show');
					$(document).on('click', '#joinCheckModalBtn' , function() {
						$('#pw').focus();
					});
					return ;
				}
				if ($('#pw').val() != $('#checkPw').val() || pw != checkPw) {
					$('#joinCheckModalText').text('비밀번호를 확인해주세요.');
					$('#joinCheckModal').modal('show');
					$(document).on('click', '#joinCheckModalBtn' , function() {
						$('#pw').focus();
					});
					return ;
				}
				if ($('#checkPw').val() == null || $('#checkPw').val() == '') {
					$('#joinBtn').addClass('disabled');
					$('#joinCheckModalText').text('비밀번호를 확인해주세요.');
					$('#joinCheckModal').modal('show');
					$(document).on('click', '#joinCheckModalBtn' , function() {
						$('#checkPw').focus();
					});
					return ;
				}
				if ($('#birth').val() == null || $('#birth').val() == '') {
					$('#joinBtn').addClass('disabled');
					$('#joinCheckModalText').text('생년월일을 확인해주세요.');
					$('#joinCheckModal').modal('show');
					$(document).on('click', '#joinCheckModalBtn' , function() {
						$('#birth').focus();
					});
					return ;
				}
				if ($('#tell2').val() == null || $('#tell2').val() == '') {
					$('#joinBtn').addClass('disabled');
					$('#joinCheckModalText').text('연락처를 확인해주세요.');
					$('#joinCheckModal').modal('show');
					$(document).on('click', '#joinCheckModalBtn' , function() {
						$('#tell2').focus();
					});
					return ;
				}
				if ($('#tell3').val() == null || $('#tell3').val() == '') {
					$('#joinBtn').addClass('disabled');
					$('#joinCheckModalText').text('연락처를 확인해주세요.');
					$('#joinCheckModal').modal('show');
					$(document).on('click', '#joinCheckModalBtn' , function() {
						$('#tell3').focus();
					});
					return ;
				}
				if ($('#postcode').val() == null || $('#postcode').val() == '') {
					$('#joinBtn').addClass('disabled');
					$('#joinCheckModalText').text('주소를 확인해주세요.');
					$('#joinCheckModal').modal('show');
					$(document).on('click', '#joinCheckModalBtn' , function() {
						$('#postcode').focus();
					});
					return ;
				}
				if ($('#address').val() == null || $('#address').val() == '') {
					$('#joinBtn').addClass('disabled');
					$('#joinCheckModalText').text('주소를 확인해주세요.');
					$('#joinCheckModal').modal('show');
					$(document).on('click', '#joinCheckModalBtn' , function() {
						$('#address').focus();
					});
					return ;
				}
				if ($('#smsNum').val() == null || $('#smsNum').val() == '' || !$('#tellCheck').text('인증이 완료되었습니다.')) {
					$('#joinBtn').addClass('disabled');
					$('#joinCheckModalText').text('인증번호를 확인해주세요.');
					$('#joinCheckModal').modal('show');
					$(document).on('click', '#joinCheckModalBtn' , function() {
						$('#smsBtn').focus();
					});
					return ;
				}
				
				else {
				
					$('#joinBtn').removeClass('disabled');
					$('form').submit();
					
				}

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

	startTimer = function (count) {
			
            timer = setInterval(function () {
            var minutes, seconds;
            minutes = parseInt(count / 60, 10);
            seconds = parseInt(count % 60, 10);
     
            minutes = minutes < 10 ? "0" + minutes : minutes;
            seconds = seconds < 10 ? "0" + seconds : seconds;
     
            $('#timeAlert').text(minutes + ":" + seconds);
     
            // 타이머 끝
            if (--count < 0) {
    	     clearInterval(timer);
    	     $('#timeAlert').text("시간초과");
    	     $('#checkSmsBtn').addClass('disabled');
    	     $('#smsBtn').removeClass('disabled');
    	     isRunning = false;
            }
        }, 1000);
             isRunning = true;
	}

		
	})(jQuery);