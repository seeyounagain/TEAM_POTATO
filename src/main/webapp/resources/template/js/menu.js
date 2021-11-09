/* 페이지 로딩 후(jsp 내용 모두 실행) 실행 */
	$(document).ready(function(){
		
		
		
		/* 로그아웃 modal 호출 */
		$(document).on('click', '#logout', function() { 
			
			$('#logoutModal').modal('show');
	
		});
		
		/* 로그아웃  */
		$(document).on('click', '#logoutModalBtn', function() { 
			
			$('#logoutModal').modal('hide');
	
			location.href = '/member/logout';
			
		});
		
		
		/* 알림 클릭 시 상세보기 + 상태 변경 */
		$(document).on('click', '.detailMessage' , function() {
			
			/* 상태 변경 할 메세지 코드 */
			var messageCode = $(this).attr('data-messageCode');
			
			var fromId = $(this).next().text();
			var sendDate = $(this).next().next().text();
			var content = $(this).text();
			var isRead = $(this).attr('data-isRead');
		
		/* 상태가 읽지 않음 이면 상태 읽음으로 변경 */
		if (isRead == 'N') {
		
			/* 알림 상태 변경 Ajax 시작 */
			$.ajax({
				url: '/member/updateMessageIsReadAjax', // 요청경로
				type: 'post', // post 메소드 방식
				data: {'messageCode':messageCode}, // 필요한 데이터를 status라는 이름으로 status 데이터를 넘긴다. 데이터가 여러개일 경우 쉼표로 연결.
				success: function(result) { // result 값에 컨트롤러에서 돌려준 데이터가 들어간다.
				// ajax 실행 성공 후 실행할 코드 작성, 컨트롤러 이동 후 코드 실행, 완료 후 다시 돌아와 실행 됨 (페이지 이동 x)
					
				},
				error: function(){
				// ajax 실행 실패 시 실행되는 구간
				alert('알림 상태 읽음으로 변경 실패!');
				}
			});
			/* 알림 상태 변경 Ajax 종료 */
			
		}
	
			$('#fromIdText').text(fromId);
			$('#sendDateText').text(sendDate);
			$('#contentText').text(content);
			$('.messageDeleteBtn').attr('data-messageCode',messageCode);
			
			$('#myMessageModal').modal('hide');
			$('#detailModal').modal('show');
		
		});
		
		/* 목록 버튼 클릭 시 목록 조회 modal toggle */
		$(document).on('click', '.messageListBtn' , function() {
			
			
			$('#detailModal').modal('hide');
			$('#myMessageModal').modal('show');
			
			
		});
		
		/* 삭제 버튼 클릭 시 알림 삭제 modal toggle */
		$(document).on('click', '.messageDeleteBtn' , function() {
			
			var messageCode = $(this).attr('data-messageCode');
			
			$('.lastDeleteBtn').attr('data-messageCode',messageCode);
			
			$('#detailModal').modal('hide');
			$('#deleteConfirmModal').modal('show');
			
		});
		
		/* 삭제 modal 뒤로가기 버튼 클릭 시 알림 상세 modal toggle */
		$(document).on('click', '.deleteReturnBtn' , function() {
			
			$('#deleteConfirmModal').modal('hide');
			$('#detailModal').modal('show');
			
		});
		
		/* 삭제 modal 삭제 버튼 클릭 시 알림 삭제 후 완료 modal toggle */
		$(document).on('click', '.lastDeleteBtn' , function() {
			
			var messageCode = $(this).attr('data-messageCode');

			/* 알림 삭제 Ajax 시작 */
			$.ajax({
				url: '/member/deleteMessageAjax', // 요청경로
				type: 'post', // post 메소드 방식
				data: {'messageCode':messageCode}, // 필요한 데이터를 status라는 이름으로 status 데이터를 넘긴다. 데이터가 여러개일 경우 쉼표로 연결.
				success: function(result) { // result 값에 컨트롤러에서 돌려준 데이터가 들어간다.
				// ajax 실행 성공 후 실행할 코드 작성, 컨트롤러 이동 후 코드 실행, 완료 후 다시 돌아와 실행 됨 (페이지 이동 x)
					
					$('#deleteConfirmModal').modal('hide');
					$('#deleteCompleteModal').modal('show');
					
				},
				error: function(){
				// ajax 실행 실패 시 실행되는 구간
				alert('알림 삭제 실패!');
				}
			});
			/* 알림 삭제 Ajax 종료 */
			
			
		});
		
		/* 삭제완료 modal 확인 버튼 클릭 시 알림 목록 modal toggle */
		$(document).on('click', '.deleteCompleteBtn' , function() {
			
			$('#deleteCompleteModal').modal('hide');
			$('#myMessageModal').modal('show');
			
			
		});
		
		
	});

/* 함수선언 영역

	순서 주의 !
	함수명 = 함수선언(){};

*/
	(function($){
		
	// 알림 목록 조회 함수
	selectMessageList = function(id) {
		
		/* 알림 목록 조회 Ajax 시작 */
		$.ajax({
			url: '/member/selectMessageListAjax', // 요청경로
			type: 'post', // post 메소드 방식
			data: {'toId':id}, // 필요한 데이터를 status라는 이름으로 status 데이터를 넘긴다. 데이터가 여러개일 경우 쉼표로 연결.
			success: function(result) { // result 값에 컨트롤러에서 돌려준 데이터가 들어간다.
			// ajax 실행 성공 후 실행할 코드 작성, 컨트롤러 이동 후 코드 실행, 완료 후 다시 돌아와 실행 됨 (페이지 이동 x)
				
				if (result.length != 0){

					$('#myMessageT tbody').empty();
					
					var str = '';
					
	         		// list,array each 사용해서 값 빼내기
	         		$(result).each(function(index, element){

						
						str += '<tr>';
						str += '<td class="contentOver lh-lg detailMessage" data-messageCode="' + element.messageCode + '"  data-isRead="' + element.isRead + '"';
						if (element.isRead == 'Y') {
						str += 'style="color: gray;"';						
						}
						str += ' >' + element.content + '</td>';
						str += '<td>관리자</td>';
						str += '<td class="contentOver lh-lg" >' + element.sendDate + '</td>';
						str += '</tr>';
					
					});	
					
					$('#myMessageT tbody').prepend(str);
				}
				
				else {
					
					$('#myMessageT tbody').empty();
					
					var str = '';
					
					str += '<tr>';
		    		str += '<td colspan="3">';
		    		str += '알림이 없습니다.';
		    		str += '</td>';
		    		str += '</tr>';
		    		
		    		$('#myMessageT tbody').prepend(str);
				
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