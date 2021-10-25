
/* 페이지 로딩 후(jsp 내용 모두 실행) 실행 */
	$(document).ready(function(){
		
		/* 대여 버튼 클릭 시 대여자 아이디 입력칸 생성 */
		$(document).on('click', '#rentalBtn', function() { 
			
			$('#rental').remove();
			
			var str = "";
			
			str += '<tr class="justify-content-center text-center" id="rental" >';
			str += '<td colspan="3">';
			str += '대여자 정보&nbsp;';
			str += '<input type="text" id="id" name="id" placeholder="회원아이디" required style="width: 200x;">';
			str += '<button type="button" class="btn btn-primary px-3 mx-3" id="rentalB">대출</button>';
			str += '</td>';
			str += '</tr>';
			
			$(this).parent().parent().after(str);
		
			
		});
		
		/* 반납 버튼 클릭 시 반납자 아이디 확인칸 생성 */
		$(document).on('click', '#returnBtn', function() { 
			
			$('#return').remove();
			
			var str = "";
			
			str += '<tr class="justify-content-center text-center" id="return" >';
			str += '<td colspan="3">';
			str += '반납자 정보&nbsp;';
			str += '<input type="text" id="id" name="id" placeholder="회원아이디" readonly style="width: 200x;">';
			str += '<button type="button" class="btn btn-warning px-3 mx-3" id="returnB">반납</button>';
			str += '</td>';
			str += '</tr>';		
			
			$(this).parent().parent().after(str);
			
		
		});
		
		/* 대여 버튼 클릭 시 대여자 아이디 입력 체크 후 대여처리 */
		$(document).on('click', '#rentalB', function() {
			
			var id = $(this).prev().val();
			var bookCode = $(this).parent().parent().prev().children().last().children().attr('data-bookCode');
			
			if (id == '') {
				alert('대여자의 아이디를 입력해주세요.');
				return ;
			}
			
			
			var result = confirm('도서를 대여하시겠습니까?')
			
			if (result) {
			
				// 페이지 이동 없이 쿼리 실행 Ajax
		   		$.ajax({
		            url: '/libManage/selectUserBookCntAjax', // 요청경로
		            type: 'post', // post 메소드 방식
		            data: {'id':id}, // 필요한 데이터를 status라는 이름으로 status 데이터를 넘긴다. 데이터가 여러개일 경우 쉼표로 연결.
		            success: function(result) { // result 값에 컨트롤러에서 돌려준 데이터가 들어간다.
		            	// ajax 실행 성공 후 실행할 코드 작성, 컨트롤러 이동 후 코드 실행, 완료 후 다시 돌아와 실행 됨 (페이지 이동 x)

						if (result < 3) {
							location.href = '/libManage/rentalBook?id=' + id + '&bookCode=' + bookCode + '&menuCode=MENU_006&sideMenuCode=SIDE_MENU_013';
						}
						
						else {
							alert('대출 또는 예약가능 권수를 초과하셨습니다.');
						}
		         		
		            },
		            error: function(){
		           		// ajax 실행 실패 시 실행되는 구간
		           		alert('실패');
		            }
				});
	   		/* Ajax 종료 */
				
		}
			
		});
		
		/* 반납 버튼 클릭 시 확인 체크 후 반납처리 */
		$(document).on('click', '#returnB', function() {
			
			var id = $(this).prev().val();
			var bookCode = $(this).parent().parent().prev().children().last().children().attr('data-bookCode');
			
			var result = confirm('도서를 반납하시겠습니까?')
			
			if (result) {
			
			location.href = '/libManage/returnBook?id=' + id + '&bookCode=' + bookCode + '&menuCode=MENU_006&sideMenuCode=SIDE_MENU_013';
				
			}
			
			
		});
		
		/* Ajax 시작 */
		// 셀렉트 박스 값 변경 시 (상태별 조회)
		$(document).on('change', '#statusSelect', function() { 
      		
      		var status = $('#statusSelect').val();
      		
      		// 페이지 이동 없이 쿼리 실행 Ajax
	   		$.ajax({
	            url: '/libManage/selectStatusBookListAjax', // 요청경로
	            type: 'post', // post 메소드 방식
	            data: {'status':status}, // 필요한 데이터를 status라는 이름으로 status 데이터를 넘긴다. 데이터가 여러개일 경우 쉼표로 연결.
	            success: function(result) { // result 값에 컨트롤러에서 돌려준 데이터가 들어간다.
	            	// ajax 실행 성공 후 실행할 코드 작성, 컨트롤러 이동 후 코드 실행, 완료 후 다시 돌아와 실행 됨 (페이지 이동 x)
	         		
	         		// list,array each 사용해서 값 빼내기
	         		//$(result).each(function(index, element){
						// element 사용
					//	console.log(element.stuNum + ' / ' + element.stuName);
						// index 사용
					//	console.log(result[index].stuNum + ' / ' + result[index].stuName);
	 				//});
	         		
	         		// remove : 선택자와 그 하위태그 모두를 지운다
	         		// empty : 선택자의 하위태그를 모두 지운다
	         		$('#bookT tbody').empty();
	         		
	         		// 테이블 그리기
	         		str = "";
	         		
	         		$(result).each(function(index,element){
	         		
		         		str += '<tr>';
						str += '<td>';
						str += '<span>' + (index+1) + ' .</span>';
						str += '<div class="bookTitle"><a class="titleA" href="/search/bookDetail?bookCode=' + element.bookCode + '">' + element.title + '</a></div>';
		         		str += '<div class="mt-2">' + element.writer + ' / ' + element.publisher + ' / ' + element.pubDate + '</div>';
		         		
		         		
		         		if (element.status == 1) {
							str += '<div class="mt-2">대출 가능';
						}
		         		else if (element.status == 2) {
							str += '<div class="mt-2">대출중';
						}
		         		else if (element.status == 3) {
							str += '<div class="mt-2">연체중';
						}
		         		else if (element.status == 4) {
							str += '<div class="mt-2">예약중';
						}
		         		
		         		str += '&nbsp;/&nbsp;' + element.area + '</div>'
		         		str += '</td>';
		         		str += '<td class="text-center">';
		         		
		         		if (element.status == 1 || element.status == 4) {
							str += '<button type="button" class="btn btn-primary px-5">대출</button>';
						}
						else {
							str += '<button type="button" class="btn btn-warning px-5">반납</button>';
						}

		         		str += '</td>';
		         		
		         		str += '<td class="text-center">';
		         		str += '<button type="button" class="btn btn-danger px-5">도서정보수정</button>';
						str += '</td>';
						
		         		str += '</tr>';
		         		
					});
					
	         		$('#bookT tbody').prepend(str);
	         		
	            },
	            error: function(){
	           		// ajax 실행 실패 시 실행되는 구간
	           		alert('실패');
	            }
			});
			
   		});
   		/* Ajax 종료 */

		
	});

/* 함수선언 영역

	순서 주의 !
	함수명 = 함수선언(){};

*/
	(function($){
	
	

	})(jQuery);
	
	
	
	
	
	