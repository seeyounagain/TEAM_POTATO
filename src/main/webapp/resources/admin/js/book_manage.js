
/* 페이지 로딩 후(jsp 내용 모두 실행) 실행 */
	$(document).ready(function(){
		
		// 새로고침 아이콘 변경
		$('.refreshBtn').hover(function () {
		    $(this).attr("src", $(this).attr("src").replace("/resources/img/refresh.png", "/resources/img/refresh_b.png"));
		}, function () {
		    $(this).attr("src", $(this).attr("src").replace("/resources/img/refresh_b.png", "/resources/img/refresh.png"));
		});
		
		//엔터키 눌러서 검색
		$('.searchGO').keydown(function(e){
			if(e.keyCode == 13){
				changeList(); 
			}
		});
		
		//검색어 리셋
		$(document).on('click', '#searchValue' , function() {
			
			$('#searchValue').val('');
			
		});
		
		/* 대출 버튼 클릭 시 대출자 아이디 입력칸 생성 */
		$(document).on('click', '#rentalBtn', function() { 
			
			$('#rental').remove();
			
			
			var str = "";
			
			str += '<tr class="justify-content-center text-center" id="rental" >';
			str += '<td colspan="3">';

			
			var reserveId = $(this).next().val();
			
			if (reserveId != null) {
				
			str += '예약자&nbsp;:&nbsp;';
			str += '<input type="text" id="reserveId" name="id" value="' + reserveId + '" readonly style="width: 200x;">';
				
			}
			
			else {
			
			str += '대출자&nbsp;:&nbsp;';
			str += '<input type="text" id="id" name="id" placeholder="회원아이디" required style="width: 200x;">';
			
			}
			
			str += '<button type="button" class="btn btn-primary px-3 mx-3" id="rentalB">대출</button>';
			str += '</td>';
			str += '</tr>';
			
			$(this).parent().parent().after(str);
		
			
		});
		
		/* 반납 버튼 클릭 시 반납자 아이디 확인칸 생성 */
		$(document).on('click', '#returnBtn', function() { 
			
			$('#return').remove();
			
			var rentalId = $(this).next().val();
			var reserveId = $(this).next().next().val();
			
			var str = "";
			
			str += '<tr class="justify-content-center text-center" id="return" >';
			str += '<td colspan="3">';
			
			if (reserveId != null) {
				
			str += '&nbsp;&nbsp;예약자&nbsp;:&nbsp;';
			str += '<input type="text" id="reserveId" name="id" value="' + reserveId + '" readonly style="width: 200x;">';
				
			}
			
			str += '&nbsp;&nbsp;반납자&nbsp;:&nbsp;';
			str += '<input type="text" id="id" name="id" value="' + rentalId + '" readonly style="width: 200x;">';
			
			str += '<button type="button" class="btn btn-warning px-3 mx-3" id="returnB">반납</button>';
			str += '</td>';
			str += '</tr>';		
			
			$(this).parent().parent().after(str);
			
		
		});
		
		/* 대출 버튼 클릭 시 대출자 아이디 입력 체크 후 대출처리 */
		$(document).on('click', '#rentalB', function() {
			
			var id = $(this).prev().val();
			var bookCode = $(this).parent().parent().prev().children().last().children().attr('data-bookCode');
			
			if (id == '') {
				$('#bookManageAlertModal').modal('hide');
				$('#bookManageConfirmModal').modal('hide');				
				$('#bookManageAlertText').text('대출자의 아이디를 입력해주세요.');
				$('#bookManageAlertModal').modal('show');
				return ;
			}
			
			var reserveId;
			
			var statusText = $(this).parent().parent().prev().children().eq(1).children().text();
			
			console.log(statusText);
			
			if (statusText == '대출대기') {
				
				reserveId = id;
				
			}
					
			var menuCode = 'MENU_006';
			var sideMenuCode = 'SIDE_MENU_013';
			
			$('#bookManageAlertModal').modal('hide');
			$('#bookManageConfirmModal').modal('hide');
			$('#bookManageConfirmModalText').text('도서를 대출하시겠습니까?');
			$('#bookManageConfirmModal').modal('show');	
			$('#bookManageConfirmBtn').addClass('bookRentalBtn');			
			
			// if 시작
			$(document).on('click', '.bookRentalBtn', function() {
			
			
				// 페이지 이동 없이 쿼리 실행 Ajax1
		   		$.ajax({
		            url: '/libManage/selectIsMemberAjax', // 요청경로
		            type: 'post', // post 메소드 방식
		            async : false, // 다중 Ajax 실행 시 success 실행 후에도 다음 Ajax 실행
		            data: {'id':id}, // 필요한 데이터를 status라는 이름으로 status 데이터를 넘긴다. 데이터가 여러개일 경우 쉼표로 연결.
		            success: function(result) { // result 값에 컨트롤러에서 돌려준 데이터가 들어간다.
		            	// ajax 실행 성공 후 실행할 코드 작성, 컨트롤러 이동 후 코드 실행, 완료 후 다시 돌아와 실행 됨 (페이지 이동 x)

						if (result == 1) {
								
								// Ajax2 
								$.ajax({
					            url: '/libManage/selectUserBookCntAjax', // 요청경로
					            type: 'post', // post 메소드 방식
					            async : false, // 다중 Ajax 실행 시 success 실행 후에도 다음 Ajax 실행
					            data: {'id':id}, // 필요한 데이터를 status라는 이름으로 status 데이터를 넘긴다. 데이터가 여러개일 경우 쉼표로 연결.
					            success: function(result) { // result 값에 컨트롤러에서 돌려준 데이터가 들어간다.
					            	// ajax 실행 성공 후 실행할 코드 작성, 컨트롤러 이동 후 코드 실행, 완료 후 다시 돌아와 실행 됨 (페이지 이동 x)
			
								if (result < 3) {
										
										/* Ajax 시작 */
							
							      		// 페이지 이동 없이 쿼리 실행 Ajax
								   		$.ajax({
								            url: '/libManage/rentalBookAjax', // 요청경로
								            type: 'post', // post 메소드 방식
								            data: {'id':id,'bookCode':bookCode,'status':2,'reserveId':reserveId}, // 필요한 데이터를 status라는 이름으로 status 데이터를 넘긴다. 데이터가 여러개일 경우 쉼표로 연결.
								            success: function(result) { // result 값에 컨트롤러에서 돌려준 데이터가 들어간다.
								            	// ajax 실행 성공 후 실행할 코드 작성, 컨트롤러 이동 후 코드 실행, 완료 후 다시 돌아와 실행 됨 (페이지 이동 x)
								            	$('#bookManageAlertModal').modal('hide');
								            	$('#bookManageConfirmModal').modal('hide');	
												$('#bookManageAlertText').text('도서가 대출되었습니다.');
												$('#closeBtn').addClass('bookRentalClose');	
												$('#bookManageAlertModal').modal('show');

								            },
								            error: function(){
								           		// ajax 실행 실패 시 실행되는 구간
								           		alert('실패');
								            }
										});
							   		/* Ajax 종료 */										
								}
									
									
								else {
									$('#bookManageAlertModal').modal('hide');
									$('#bookManageConfirmModal').modal('hide');	
									$('#bookManageAlertText').text('대출 또는 예약가능 권수를 초과하셨습니다.');
									$('#bookManageAlertModal').modal('show');
								}
					         		
					            },
					            error: function(){
					           		// ajax 실행 실패 시 실행되는 구간
					           		alert('실패');
					            }
							});
				   			/* Ajax 종료 */							
						
				}
				/* if 끝 */
						
			else {
			
				$('#bookManageAlertModal').modal('hide');
				$('#bookManageConfirmModal').modal('hide');	
				$('#bookManageAlertText').text('존재하는 회원이 아닙니다.');
				$('#bookManageAlertModal').modal('show');
				
			}
		         		
		    },
		       error: function(){
		     // ajax 실행 실패 시 실행되는 구간
		         alert('실패');
		       }
			});
		   		
				
		});
			
		});
		/* 이벤트 종료 */

		/* 반납 버튼 클릭 시 확인 체크 후 반납처리 */
		$(document).on('click', '#returnB', function() {
			
			var menuCode = 'MENU_006';
			var sideMenuCode = 'SIDE_MENU_013';		
				
			var id = $(this).prev().val();
			var reserveId = $(this).prev().prev().val();
			var bookCode = $(this).parent().parent().prev().children().last().children().attr('data-bookCode');
			
			console.log('반납자 : ' + id);
			console.log('예약자 : ' + reserveId);
			
			$('#bookManageAlertModal').modal('hide');
			$('#bookManageConfirmModal').modal('hide');
			$('#bookManageConfirmModalText').text('도서를 반납하시겠습니까?');
			$('#bookManageConfirmModal').modal('show');	
			$('#bookManageConfirmBtn').addClass('bookReturnBtn');		
			
			$(document).on('click', '.bookReturnBtn', function() {
			
				
				var status = 1;
				
				/* 예약자 있을 경우 5 */
				if (reserveId != null) {
					status = 5;
				}
				
				/* Ajax 시작 */
		   		$.ajax({
		            url: '/libManage/returnBookAjax', // 요청경로
		            type: 'post', // post 메소드 방식
		            data: {'id':id,'bookCode':bookCode,'status':status,'reserveId':reserveId}, // 필요한 데이터를 status라는 이름으로 status 데이터를 넘긴다. 데이터가 여러개일 경우 쉼표로 연결.
		            success: function(result) { // result 값에 컨트롤러에서 돌려준 데이터가 들어간다.
		            	// ajax 실행 성공 후 실행할 코드 작성, 컨트롤러 이동 후 코드 실행, 완료 후 다시 돌아와 실행 됨 (페이지 이동 x)
						
		            	$('#bookManageAlertModal').modal('hide');
						$('#bookManageConfirmModal').modal('hide');	
						$('#bookManageAlertText').text('도서가 반납되었습니다.');
						$('#closeBtn').addClass('bookReturnClose');	
						$('#bookManageAlertModal').modal('show');
		         		
		            },
		            error: function(){
		           		// ajax 실행 실패 시 실행되는 구간
		           		alert('실패');
		            }
				});
				/* Ajax 종료 */	
				
			});
			
			
		});
		
		// 셀렉트 박스 값 변경 시 (상태별 조회)
		$(document).on('change', '#statusSelect', function() { 
      		
			changeList();

		});
		
		// 검색 버튼 클릭 시 (상태별 조회) 
		$(document).on('click', '#goSearchBtn', function() { 
      		
			changeList();

		});
		
		// 제적도서목록 버튼 클릭 시
		$(document).on('click', '#deleteBookList', function() { 
			
			deleteBookList();
			
			$(document).on('click', '#goSearchBtn', function() { 
	      		
				deleteBookList();

			});
			
		});
	
	
		
	});

/* 함수선언 영역

	순서 주의 !
	함수명 = 함수선언(){};

*/
(function($){
	
	changeList = function() {
	
	    	var status = $('#statusSelect').val();
	    	var searchValue = $('#searchValue').val();
	    	
	    	
	    	// 페이지 이동 없이 쿼리 실행 Ajax
			$.ajax({
		        url: '/libManage/selectStatusBookListAjax', // 요청경로
		        type: 'post', // post 메소드 방식
		        data: {'status':status,'searchValue':searchValue}, // 필요한 데이터를 status라는 이름으로 status 데이터를 넘긴다. 데이터가 여러개일 경우 쉼표로 연결.
		        success: function(result) { // result 값에 컨트롤러에서 돌려준 데이터가 들어간다.
		        	// ajax 실행 성공 후 실행할 코드 작성, 컨트롤러 이동 후 코드 실행, 완료 후 다시 돌아와 실행 됨 (페이지 이동 x)
		     		
		     		$('#bookT tbody').empty();
		     		$('#bookHeadT thead').empty();
		     		$('.statusSelect').show();
		     		
		     		str = '';

		     	if (result.length >= 1) {
			
		     		if (searchValue != null && searchValue != '') {
		     			
		     			$('#bookTcap').text('검색어 "' + searchValue + '"에 대한 도서 ' + result.length + '건의 결과');
		     			$('#searchValue').val(searchValue);
		     			
		     		}
		     			
		     		else {
		     			
		     			$('#bookTcap').text('도서 ' + result.length + '건의 목록');
		     			
		     		}
		     		
		     		$(result).each(function(index,element){
			     		
		     		// 테이블 그리기
	         		str += '<tr>';
					str += '<td>';
					str += '<div class="bookTitle"><a class="titleA" href="/search/bookDetail?bookCode=' + element.bookCode + '&menuCode=MENU_006&sideMenuCode=SIDE_MENU_013">' + element.title + '</a></div>';
	         		str += '<div class="mt-2">' + element.writer + ' / ' + element.publisher + ' / ' + element.pubDate + '</div>';
	         		
	         		
	         		if (element.status == 1) {
						str += '<div class="mt-2">대출 가능';
					}
	         		else if (element.status == 2) {
						str += '<div class="mt-2">대출중&nbsp;<span class="mb-2" style="color: blue;">(&nbsp;' + element.rentalDate + '&nbsp;~&nbsp;' + element.limitDate + '&nbsp;)&nbsp;</span>';
					}
	         		else if (element.status == 3) {
						str += '<div class="mt-2">연체중&nbsp;<span class="mb-2" style="color: red;">(&nbsp;' + element.rentalDate + '&nbsp;~&nbsp;' + element.limitDate + '&nbsp;)&nbsp;</span>';
					}
	         		else if (element.status == 4) {
						str += '<div class="mt-2">예약중&nbsp;<span class="mb-2" style="color: blue;">(&nbsp;' + element.rentalDate + '&nbsp;~&nbsp;' + element.limitDate + '&nbsp;)&nbsp;</span>';
					}
	         		else if (element.status == 5) {
						str += '<div class="mt-2">대출대기중&nbsp;<span class="mb-2" style="color: blue;">(&nbsp;' + element.rentableStartDate + '&nbsp;~&nbsp;' + element.rentableEndDate + '&nbsp;)&nbsp;</span>';
					}
	         		
	         		str += '</div>'
	         		str += '<div class="mt-2">' + element.area + '</div>'
	         		str += '</td>';
	         		str += '<td class="text-center">';
	         		
	         		if (element.status == 1) {
						str += '<button type="button" class="btn btn-primary px-5" id="rentalBtn">대출</button>';
					}
					else if (element.status == 2 || element.status == 3) {
						str += '<button type="button" class="btn btn-warning px-5" id="returnBtn">반납</button>';
						str += '<input type="hidden" id="rentalId" value="' + element.rentalId + '">';
					}
	
					else if (element.status == 4) {
						str += '<button type="button" class="btn btn-warning px-5" id="returnBtn">반납</button>';
						str += '<input type="hidden" id="rentalId" value="' + element.rentalId + '">';
						str += '<input type="hidden" id="reserveId" value="' + element.reserveId + '">';
					}
					
					else if (element.status == 5) {
						str += '<button type="button" class="btn btn-primary rentalB" id="rentalBtn">대출대기</button>';
						str += '<input type="hidden" id="reserveId" value="' + element.reserveId + '">';
					}
					
	         		str += '</td>';
	         		
	         		str += '<td class="text-center">';
	         		str += '<button type="button" class="btn btn-danger px-5" data-bookCode="' + element.bookCode + '" onclick="updateBookInfo(\''+ element.bookCode+'\',\'MENU_006\');" >도서정보수정</button>';
					str += '</td>';
					
	         		str += '</tr>';
	         		
				});
		     		
			    }
		     		
				else {
					
					$('#bookTcap').text('');
					
					str += '<tr class="text-center">';
					str += '<td colspan="3">도서의 정보가 없습니다.</td>';
					str += '</tr>';
					
				}
				
		     	var str2 = '<tr class="text-center"><td>도서정보</td><td>대출/반납</td><td>도서정보수정</td></tr>';

				$('#bookT tbody').prepend(str);
				$('#bookHeadT thead').prepend(str2);
				$('#goSearchBtn').removeClass('disabled');
				
	     		var keyword = document.getElementById('searchValue').value;

	     		$('table').mark(keyword, {
	     		  "element": "mark",
	     		  "className": "table_highlight"
	     		});
		     		
		        },
		        error: function(){
		       		// ajax 실행 실패 시 실행되는 구간
		       		alert('실패');
		        }
		});
		/* Ajax 종료 */
		
	};	
	
	 updateBookInfo = function(bookCode,menuCode) {
		
		  location.href= '/libManage/updateBookInfo?bookCode=' + bookCode + '&menuCode=' + menuCode;
		  
	};
	  
	 deleteBookList = function() {
		 
	    var searchValue = $('#searchValue').val();
	    	
	    	// 페이지 이동 없이 쿼리 실행 Ajax
			$.ajax({
		        url: '/libManage/selectStatusBookListAjax', // 요청경로
		        type: 'post', // post 메소드 방식
		        data: {'status':8,'searchValue':searchValue}, // 필요한 데이터를 status라는 이름으로 status 데이터를 넘긴다. 데이터가 여러개일 경우 쉼표로 연결.
		        success: function(result) { // result 값에 컨트롤러에서 돌려준 데이터가 들어간다.
		        	// ajax 실행 성공 후 실행할 코드 작성, 컨트롤러 이동 후 코드 실행, 완료 후 다시 돌아와 실행 됨 (페이지 이동 x)
		     		
		     		$('#bookT tbody').empty();
		     		$('#bookHeadT thead').empty();
		     		$('.statusSelect').hide();
		     		
		     		str1 = '';

		     	if (result.length >= 1) {
			
		     		if (searchValue != null && searchValue != '') {
		     			
		     			$('#bookTcap').text('검색어 "' + searchValue + '"에 대한 도서 ' + result.length + '건의 결과');
		     			$('#searchValue').val(searchValue);
		     			
		     		}
		     			
		     		else {
		     			
		     			$('#bookTcap').text('제적도서 ' + result.length + '건의 목록');
		     			
		     		}
		     		
		     		$(result).each(function(index,element){
			     		
		     		// 테이블 그리기
	         		str1 += '<tr>';
					str1 += '<td colspan="3">';
					str1 += '<div class="bookTitle"><a class="titleA" href="/search/bookDetail?bookCode=' + element.bookCode + '&menuCode=MENU_006&sideMenuCode=SIDE_MENU_013">' + element.title + '</a></div>';
	         		str1 += '<div class="mt-2">' + element.writer + ' / ' + element.publisher + ' / ' + element.pubDate + '</div>';
					str1 += '<div class="mt-2">제적</div>';
	         		str1 += '</td>';
	         		str1 += '</tr>';
	         		
				});
		     		
			    }
		     		
				else {
					
					$('#bookTcap').text('');
					
					str1 += '<tr class="text-center">';
					str1 += '<td colspan="3">제적도서의 정보가 없습니다.</td>';
					str1 += '</tr>';
					
				}

	     		str2 = '';
	     		
	     		str2 += '<tr class="text-center"><td colspan="3">도서정보</td></tr>';
	     		
				$('#bookT tbody').prepend(str1);
				$('#bookHeadT thead').prepend(str2);
				$('#goSearchBtn').addClass('disabled');
				
				
	     		var keyword = document.getElementById('searchValue').value;

	     		$('table').mark(keyword, {
	     		  "element": "mark",
	     		  "className": "table_highlight"
	     		});
		     		
		        },
		        error: function(){
		       		// ajax 실행 실패 시 실행되는 구간
		       		alert('실패');
		        }
		});
		/* Ajax 종료 */		
		 
	};
	  
})(jQuery);
