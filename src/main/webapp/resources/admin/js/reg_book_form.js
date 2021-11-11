/* 페이지 로딩 후(jsp 내용 모두 실행) 실행 */
	$(document).ready(function(){
		
		// ISBN 정규식
		$(document).on('keyup', '#isbn', function() {
		     
		     //숫자로 이뤄진 13자리 만들기
		      var isbnJ = /^[0-9]{13}$/;
		      
		      // 조건에 부합할경우
		      if(isbnJ.test($('#isbn').val())){
		      
		         $('#isbnAlert').text('');
		         $('#regBtn').removeClass('disabled');
		         return ;
		      }
		      
		      else{
		      	
		      	 $('#isbnAlert').text('* 13자리의 숫자로 입력해주세요.');
		         $('#regBtn').addClass('disabled');
		         return ;
		      }
		});
		
		// 페이지 정규식
		$(document).on('keyup', '#page', function() {
		     
		     // 숫자로 이뤄진 1~4자리 만들기
		      var pageJ = /^[0-9]{1,4}$/;
		      
		      // 조건에 부합할경우
		      if(pageJ.test($('#page').val())){
		      
		         $('#pageAlert').text('');
		         $('#regBtn').removeClass('disabled');
		         return ;
		      }
		      
		      else{
		      	
		      	 $('#pageAlert').text('* 1~4자리의 숫자로 입력해주세요.');
		         $('#regBtn').addClass('disabled');
		         return ;
		      }
		});
		
		// 발행년도 정규식
		$(document).on('keyup', '#pubDate', function() {
		     
		     // 숫자로 이뤄진 4자리 만들기
		      var pubDateJ = /^[0-9]{4}$/;
		      
		      // 조건에 부합할경우
		      if(pubDateJ.test($('#pubDate').val())){
		      
		         $('#pubDateAlert').text('');
		         $('#regBtn').removeClass('disabled');
		         return ;
		      }
		      
		      else{
		      	
		      	 $('#pubDateAlert').text('* 4자리의 숫자로 입력해주세요.');
		         $('#regBtn').addClass('disabled');
		         return ;
		      }
		});
		
		// 크기 정규식
		$(document).on('keyup', '#bookSize', function() {
		     
		     // 숫자로 이뤄진 4자리 만들기
		      var sizeJ = /^[0-9]{1,4}$/;
		      
		      // 조건에 부합할경우
		      if(sizeJ.test($('#bookSize').val())){
		      
		         $('#sizeAlert').text('');
		         $('#regBtn').removeClass('disabled');
		         return ;
		      }
		      
		      else{
		      	
		      	 $('#sizeAlert').text('* 숫자로 입력해주세요.');
		         $('#regBtn').addClass('disabled');
		         return ;
		      }
		});
		
	
	});

/* 함수선언 영역

	순서 주의 !
	함수명 = 함수선언(){};

*/
	(function($){
		
	
		regBookSubmit = function() {
		    
			var isbn = $('#isbn').val();
			var title = $('#title').val();
			var kdc = $('#kdc').val();
			var writer = $('#writer').val();
			var publisher = $('#publisher').val();
			var pubDate = $('#pubDate').val();
			var page = $('#page').val();
			var bookSize = $('#bookSize').val();
			var keyword = $('#keyword').val();
			var summary = $('#summary').val();
			var intro = CKEDITOR.instances.editor1.getData();
			var area = $('#area').val();
			var file = $('#file').val();
			
			if (isbn == null || isbn == '') {
				$('#regBtn').addClass('disabled');
				$('#isbn').focus();
				return ;
			}
			if (title == null || title == '') {
				$('#regBtn').addClass('disabled');
				$('#title').focus();
				return ;
			}
			if (kdc == null || kdc == '') {
				$('#regBtn').addClass('disabled');
				$('#kdc').focus();
				return ;
			}
			if (writer == null || writer == '') {
				$('#regBtn').addClass('disabled');
				$('#writer').focus();
				return ;
			}
			if (publisher == null || publisher == '') {
				$('#regBtn').addClass('disabled');
				$('#publisher').focus();
				return ;
			}
			if (pubDate == null || pubDate == '') {
				$('#regBtn').addClass('disabled');
				$('#pubDate').focus();
				return ;
			}
			/*	if (page == null || page == '') {
					$('#regBtn').addClass('disabled');
					$('#page').focus();
					return ;
				}
				if (bookSize == null || bookSize == '') {
					$('#regBtn').addClass('disabled');
					$('#bookSize').focus();
					return ;
				}
				if (keyword == null || keyword == '') {
					$('#regBtn').addClass('disabled');
					$('#keyword').focus();
					return ;
				} */
			if (summary == null || summary == '') {
				$('#regBtn').addClass('disabled');
				$('#summary').focus();
				return ;
			}
			if (area == null || area == '') {
				$('#regBtn').addClass('disabled');
				$('#area').focus();
				return ;
			}
			if (intro == null || intro == '') {
				$('#regBtn').addClass('disabled');
				$('.intro').focus();
				return ;
			}
			
			else {
				
				var str = '';
				
				var length = 200; // 표시할 글자수 기준
			    if (intro.length > length) {
			    	intro = intro.substr(0, length - 2) + '...';
			    }
				
				str += '도서를 등록 하시겠습니까?<br><br>';
				str += 'ISBN : ' + isbn + '<br>';
				str += '표제 : ' + title + '<br>';
				str += '청구기호 :  ' + kdc + '<br>';
				str += '저자 :  ' + writer + '<br>';
				str += '발행처 :  ' + publisher + '<br>';
				str += '발행년도 :  ' + pubDate + '<br>';
				str += '쪽수 :  ' + page + '<br>';
				str += '크기 :  ' + bookSize + '<br>';
				str += '주제 :  ' + keyword + '<br>';
				str += '한줄소개 :  ' + summary + '<br>';
				str += '소개글 :  ' + intro + '<br>';
				str += '위치 :  ' + area;
				
				$('#regBookConfirmText').empty();
				$('#regBookConfirmText').prepend(str);
				$('#regBookConfirmModal').modal('show');
				
			}

		};
		
		regBook = function() {
			
			$('#regBookConfirmModal').modal('hide');
			
			$('#regBookCompleteModal').modal('show');
			
			$('#regBookForm').submit();
		
		};
		
		regBookFin = function() {
			
			$('#regBookForm').submit();
			
		};

	})(jQuery);