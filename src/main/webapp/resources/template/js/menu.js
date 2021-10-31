/* 페이지 로딩 후(jsp 내용 모두 실행) 실행 */
	$(document).ready(function(){
		
		/* 로그아웃 confirm */
		$(document).on('click', '#logout', function() { 
			
			var result = confirm('로그아웃 하시겠습니까?');
	
				if (result) {
				 	location.href = '/member/logout';
				}
			
		});
		
		/* 알림 클릭 시 상세보기 + 상태 변경 */
		$(document).on('click', '.detailMessage' , function() {
			
			/* 상태 변경 할 메세지 코드 */
			var messageCode = $(this).attr('data-messageCode');
			
			var fromId = $(this).next().text();
			var sendDate = $(this).next().next().text();
			var content = $(this).text();

		/* 알림 상태 변경 Ajax 시작 */
		$.ajax({
			url: '/libManage/updateMessageIsReadAjax', // 요청경로
			type: 'post', // post 메소드 방식
			data: {'messageCode':messageCode}, // 필요한 데이터를 status라는 이름으로 status 데이터를 넘긴다. 데이터가 여러개일 경우 쉼표로 연결.
			success: function(result) { // result 값에 컨트롤러에서 돌려준 데이터가 들어간다.
			// ajax 실행 성공 후 실행할 코드 작성, 컨트롤러 이동 후 코드 실행, 완료 후 다시 돌아와 실행 됨 (페이지 이동 x)

				$('#fromIdText').text(fromId);
				$('#sendDateText').text(sendDate);
				$('#contentText').text(content);
				$('.messageDeleteBtn').attr('data-messageCode',messageCode);
				
				$('#myMessageModal').modal('hide');
				$('#detailModal').modal('show');
				
			},
			error: function(){
			// ajax 실행 실패 시 실행되는 구간
			alert('알림 상태 읽음으로 변경 실패!');
			}
		});
		/* 알림 상태 변경 Ajax 종료 */
			
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
			
			$('#deleteConfirmModal').modal('hide');
			$('#deleteCompleteModal').modal('show');
			
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
		

		
	})(jQuery);