
/* 페이지 로딩 후(jsp 내용 모두 실행) 실행 */
	$(document).ready(function(){
	
	
	$(document).on('click', '#goSearchBtn' , function() {
		
		var searchValue = $('#searchValue').val();
		
		location.href = '/libManage/memberManage?searchValue=' + searchValue + '&menuCode=MENU_006';	
		
	});
	
	$(document).on('click', '#searchValue' , function() {
		
		$('#searchValue').val('');
		
	});
	
	
	// 도서정보조회 버튼 클릭 시 정보 조회
	$(document).on('click', '.modalBtn' , function() {
		
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
						str1 += '<td><a class="titleA" href="/search/bookDetail?bookCode=' + element.bookVO.bookCode + '&menuCode=MENU_002">' + element.bookVO.title + '&nbsp;/&nbsp;' + element.bookVO.writer + '</a></td>';
				        
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
								
								str2 += '<td colspan="2">' + element.rentableStartDate + '&nbsp;~&nbsp;' + element.rentableEndDate + '</td>';
						    		
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
	
	

	})(jQuery);
	
	
	
	
	
	