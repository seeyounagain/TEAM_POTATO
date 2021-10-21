
/* 페이지 로딩 후(jsp 내용 모두 실행) 실행 */
	$(document).ready(function(){
		
		/* Ajax 시작 */
		// 셀렉트 박스 값 변경 시 (상태별 조회)
		$(document).on('change', '#statusSelect', function() { 
      		
      		var status = $('#statusSelect').val();
      		
      		// 페이지 이동 없이 쿼리 실행 Ajax
	   		$.ajax({
	            url: '/libManage2/selectStatusBookListAjax', // 요청경로
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
							str += '<button type="button" class="btn btn-primary">대출</button>';
						}
						else {
							str += '<button type="button" class="btn btn-warning">반납</button>';
						}

		         		str += '</td>';
		         		
		         		str += '<td class="text-center">';
		         		str += '<button type="button" class="btn btn-danger">도서정보수정</button>';
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
	
	// 학생 점수 조회 기능
	selectScore = function(stuNum){
		
      		// 페이지 이동 없이 쿼리 실행 Ajax
	   		$.ajax({
	            url: '/student/stuScoreAjax', // 요청경로
	            type: 'post', // post 메소드 방식
	            data: {'stuNum':stuNum}, // 필요한 데이터를 classCode라는 이름으로 classCode 데이터를 넘긴다. 데이터가 여러개일 경우 쉼표로 연결.
	            success: function(result) { // result 값에 컨트롤러에서 돌려준 데이터가 들어간다.
	            	// ajax 실행 성공 후 실행할 코드 작성, 컨트롤러 이동 후 코드 실행, 완료 후 다시 돌아와 실행 됨 (페이지 이동 x)

	         		$('#scoreT tbody').empty();
	         		
	         		// 테이블 그리기
	         		str = "";
	         		
	         		sum = Number(result.korScore) + Number(result.engScore) + Number(result.mathScore);
	         		
		         	str += '<tr>';
					str += '<td id="korScore">' + result.korScore + '</td>';
					str += '<td id="engScore">' + result.engScore + '</td>';
					str += '<td id="mathScore">' + result.mathScore + '</td>';
					str += '<td id="sumScore">' + sum + '</td>';
		         	str += '</tr>';
		         	
		         	str += '<tr>';
					str += '<td id="btn" colspan="4"><input type="button" id="updateBTN" value="점수변경" data-stuNum="' + result.stuNum +  '"></td>';
		         	str += '</tr>';
					
					str1 = "";
					
					str1 += result.stuName + '학생의 성적정보';
					
	         		$('#scoreT tbody').prepend(str);
	         		$('#scoreT caption').text(str1);
	         		
	            },
	            error: function(){
	           		// ajax 실행 실패 시 실행되는 구간
	           		alert('실패');
	            }
			});
      		
	}

	})(jQuery);
	
	
	
	
	
	