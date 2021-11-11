
/* 페이지 로딩 후(jsp 내용 모두 실행) 실행 */
	$(document).ready(function(){
	
	/*data-bs-target="#completeModal" data-bs-toggle="modal"*/
	
		
	// 아이디 검색 클릭 시 아이디 조회
	$(document).on('click', '#goSearchBtn' , function() {
		
		var searchValue = $('#searchValue').val();
		
		location.href = '/libManage/memberManage?searchValue=' + searchValue + '&menuCode=MENU_006';	
		
	});
	
	// 검색어 리셋
	$(document).on('click', '#searchValue' , function() {
		
		$('#searchValue').val('');
		
	});
	
	// 알림발신내역 버튼 클릭 시 modal show
	$(document).on('click', '#adminMessageList' , function() {
		
		$('#adminMessageModal').modal('show');
		
	});
	
	// 알림 클릭 시 상세조회 modal show
	$(document).on('click', '.adminMessageDetail' , function() {
		
			var content = $(this).children().eq(0).text();
			var toId = $(this).children().eq(1).text();
			var sendDate = $(this).children().eq(2).text();
			var isRead = $(this).children().eq(3).text();

			$('#adminToIdText').text(toId);
			$('#adminSendDateText').text(sendDate);
			$('#adminContentText').text(content);
			$('#adminIsReadText').text(isRead);
		
		$('#adminMessageModal').modal('hide');
		$('#adminDetailModal').modal('show');
		
	});

	// 목록 버튼 클릭 시 목록 조회 modal toggle
	$(document).on('click', '.adminMessageListBtn' , function() {
			
			
		$('#adminDetailModal').modal('hide');
		$('#adminMessageModal').modal('show');
			
			
	});
	
	// 알림 내용 byte 체크
	$(document).on('keyup', '#content' , function() {
		
		var maxByte = 3000; //최대 3000바이트
		var text_val = $(this).val(); //입력한 문자
		var text_len = text_val.length; //입력한 문자수
		var maxStr = 0; //문자열 길이
		    
		var totalByte = 0;
		for(var i = 0; i < text_len; i++){
			var each_char = text_val.charAt(i);
			var uni_char = escape(each_char) //유니코드 형식으로 변환
				if(uni_char.length > 4){
					// 한글 : 2Byte
					totalByte += 2;
					maxStr += 1;
				}else{
			        // 영문,숫자,특수문자 : 1Byte
		            totalByte += 1;
		            maxStr += 1;
		        }

		    $('#byteCheck').text(totalByte + ' / 3000Byte ');
		    $('#byteCheck').css('color', 'blue');
		    
			    if(totalByte >= maxByte){
			    	 $('#byteAlert').text('최대 3000Byte까지 입력가능합니다. ');
			    	 $('#byteAlert').css('color', 'red');
			    	 $('#byteCheck').css('color', 'red');
					cutStr = text_val.substr(0,maxStr); //문자열 자르기
					$(this).val(cutStr);
					return ;
				}else{
			        $('#byteCheck').css('color', 'blue');
			        $('#byteAlert').text('');
				}

		    }

		    
		
	});	
	
	// 알림보내기 버튼 클릭 시 아이디 지정
	$(document).on('click', '.messageBtn' , function() {
		
		var toId = $(this).attr('data-id');
		// toId 설정
		$('#toId').val(toId);
		// 내용 리셋
		$('#content').val('');
		
	});
	
	// 알림보내기
	$(document).on('click', '.sendMessage' , function() {
		
		$('#messageModal').modal('hide');
		
		var toId = $('#toId').val();
		var content = $('#content').val();
		
		/* 알림보내기 Ajax 시작 */
		$.ajax({
			url: '/libManage/sendMessageAjax', // 요청경로
			type: 'post', // post 메소드 방식
			data: {'toId':toId,'content':content}, // 필요한 데이터를 status라는 이름으로 status 데이터를 넘긴다. 데이터가 여러개일 경우 쉼표로 연결.
			success: function(result) { // result 값에 컨트롤러에서 돌려준 데이터가 들어간다.
			// ajax 실행 성공 후 실행할 코드 작성, 컨트롤러 이동 후 코드 실행, 완료 후 다시 돌아와 실행 됨 (페이지 이동 x)
			
			if (result == 1) {
				
				$('#completeModal').modal('show');
				
			}
			else {
				
				$('#failModal').modal('show');
				
			}
			
			},
			error: function(){
			// ajax 실행 실패 시 실행되는 구간
			$('#failModal').modal('show');
			}
		});
		/* 알림보내기 Ajax 종료 */			
		
	});
	
	// 도서정보조회 버튼 클릭 시 정보 조회
	$(document).on('click', '.infoBtn' , function() {
		
		var id = $(this).attr('data-id');
		
		/* 대여 정보 조회 Ajax 시작 */
		$.ajax({
			url: '/libManage/selectMemberRentalListAjax', // 요청경로
			type: 'post', // post 메소드 방식
			async : false, // 다중 Ajax 실행 시 success 실행 후에도 다음 Ajax 실행
			data: {'id':id}, // 필요한 데이터를 status라는 이름으로 status 데이터를 넘긴다. 데이터가 여러개일 경우 쉼표로 연결.
			success: function(result) { // result 값에 컨트롤러에서 돌려준 데이터가 들어간다.
			// ajax 실행 성공 후 실행할 코드 작성, 컨트롤러 이동 후 코드 실행, 완료 후 다시 돌아와 실행 됨 (페이지 이동 x)
				
				var str1 = '';
				
				$('.rentalInfo').remove();
				
				if (result.length != 0) {
					
					// list,array each 사용해서 값 빼내기
					$(result).each(function(index, element){
					
						str1 += '<tr class="rentalInfo">';
						str1 += '<td><a class="titleA" href="/search/bookDetail?bookCode=' + element.bookVO.bookCode + '&menuCode=MENU_002">' + element.bookVO.title + '&nbsp;/&nbsp;<br>' + element.bookVO.writer + '</a></td>';
				        
				         if (element.bookVO.status == 1) {
							str1 += '<td>대출 가능</td>';
						}
				         else if (element.bookVO.status == 2) {
							str1 += '<td>대출중</td>';
						}
				         else if (element.bookVO.status == 3) {
							str1 += '<td>연체중</td>';
						}
				         else if (element.bookVO.status == 4) {
							str1 += '<td>예약중</td>';
						}
				         else if (element.bookVO.status == 5) {
							str1 += '<td>대출대기중</td>';
						}
						
						str1 += '<td>' + element.rentalDate + '</td>';
						str1 += '<td>' + element.limitDate + '</td>';
				    		
						str1 += '</tr>';
					});
					// list,array each 사용해서 값 빼내기 종료
				}
					
				else {
					str1 += '<tr class="rentalInfo">';
					str1 += '<td colspan="4">대여중인 도서가 없습니다.</td>';
					str1 += '</tr>';						
				}
					
				$('#rentalTr').after(str1);
				
				/* 예약 정보 조회 Ajax 시작 */
				$.ajax({
					url: '/libManage/selectMemberReserveListAjax', // 요청경로
					type: 'post', // post 메소드 방식
					async : false, // 다중 Ajax 실행 시 success 실행 후에도 다음 Ajax 실행
					data: {'id':id}, // 필요한 데이터를 status라는 이름으로 status 데이터를 넘긴다. 데이터가 여러개일 경우 쉼표로 연결.
					success: function(result) { // result 값에 컨트롤러에서 돌려준 데이터가 들어간다.
					// ajax 실행 성공 후 실행할 코드 작성, 컨트롤러 이동 후 코드 실행, 완료 후 다시 돌아와 실행 됨 (페이지 이동 x)
						
						var str2 = '';
						
						$('.reserveInfo').remove();
						
						if (result.length != 0) {
						
						// list,array each 사용해서 값 빼내기
						$(result).each(function(index, element){
							
								str2 += '<tr class="reserveInfo">';
								str2 += '<td><a class="titleA" href="/search/bookDetail?bookCode=' + element.bookVO.bookCode + '&menuCode=MENU_002">' + element.bookVO.title + '&nbsp;/&nbsp;' + element.bookVO.writer + '</a></td>';
						        
						         if (element.bookVO.status == 1) {
									str2 += '<td>대출 가능</td>';
								}
						         else if (element.bookVO.status == 2) {
									str2 += '<td>대출중</td>';
								}
						         else if (element.bookVO.status == 3) {
									str2 += '<td>연체중</td>';
								}
						         else if (element.bookVO.status == 4) {
									str2 += '<td>예약중</td>';
								}
						         else if (element.bookVO.status == 5) {
									str2 += '<td>대출대기중</td>';
								}
								
								if (element.rentableStartDate != null || element.rentableEndDate != null) {
								
								str2 += '<td colspan="2">' + element.rentableStartDate + '&nbsp;~&nbsp;' + element.rentableEndDate + '</td>';
								
								}
								
								else {
								
								str2 += '<td colspan="2">반납대기중</td>';
								
								}
								
						    		
								str2 += '</tr>';
						
							});
							// list,array each 사용해서 값 빼내기 종료
						}
						else {
							str2 += '<tr class="reserveInfo">';
							str2 += '<td colspan="4">예약중인 도서가 없습니다.</td>';
							str2 += '</tr>';						
						}							
						
						$('#reserveTr').after(str2);						
						
					},
					error: function(){
					// ajax 실행 실패 시 실행되는 구간
					alert('실패');
					}
				});
				/* 예약 정보 조회 Ajax 종료 */					
				
			},
			error: function(){
			// ajax 실행 실패 시 실행되는 구간
			alert('실패');
			}
		});
		/* 대여 정보 조회 Ajax 종료 */	
		
		
	});
	

	});

/* 함수선언 영역

	순서 주의 !
	함수명 = 함수선언(){};

*/
	(function($){
	
	// 관리자 알림 목록 조회 함수
	selectAdminMessageList = function(id) {
		
		/* 알림 목록 조회 Ajax 시작 */
		$.ajax({
			url: '/member/selectMessageListAjax', // 요청경로
			type: 'post', // post 메소드 방식
			data: {'toId':'admin'}, // 필요한 데이터를 status라는 이름으로 status 데이터를 넘긴다. 데이터가 여러개일 경우 쉼표로 연결.
			success: function(result) { // result 값에 컨트롤러에서 돌려준 데이터가 들어간다.
			// ajax 실행 성공 후 실행할 코드 작성, 컨트롤러 이동 후 코드 실행, 완료 후 다시 돌아와 실행 됨 (페이지 이동 x)
				
				if (result != null ){

					$('#adminMessageT tbody').empty();
					
					var str = '';
					
	         		// list,array each 사용해서 값 빼내기
	         		$(result).each(function(index, element){

						
						str += '<tr class="adminMessageDetail">';
						str += '<td class="contentOver lh-lg adminDetailMessage" data-messageCode="' + element.messageCode + '"';
						if (element.isRead == 'Y') {
						str += 'style="color: gray;"';						
						}
						str += ' >' + element.content + '</td>';
						str += '<td>' + element.toId + '</td>';
						str += '<td class="contentOver lh-lg" >' + element.sendDate + '</td>';
						if (element.isRead == 'Y') {
						str += '<td style="color: gray;" >읽음</td>';
						}
						else {
						str += '<td style="color: gray;" >읽지않음</td>';
						}
						str += '</tr>';
					
					});	
					
					$('#adminMessageT tbody').prepend(str);
				}
				
				else {
					
					$('#adminMessageT tbody').empty();
					
					var str = '';
					
					str += '<tr>';
		    		str += '<td colspan="4">';
		    		str += '알림이 없습니다.';
		    		str += '</td>';
		    		str += '</tr>';
		    		
		    		$('#adminMessageT tbody').prepend(str);
				
				}
					
									

			},
			error: function(){
			// ajax 실행 실패 시 실행되는 구간
			alert('알림 목록 조회 실패!');
			}
		});
		/* 알림 목록 조회 Ajax 종료 */

		
	};	

	})(jQuery);
	
	
	
	
	
	