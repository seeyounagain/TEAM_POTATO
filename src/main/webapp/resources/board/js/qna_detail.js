
	//게시글 비밀번호가 없을 때 +  관리자가 게시글을 삭제할 때
	(function($){
		deleQna = function(){
			
			$('#qnaModal').modal('show');	
			$('#qnaModalContent').text("상담 / 문의 글을 삭제하시겠습니까?");
		};
		
		deleQnaModal = function(menuCode, qnaCode){
			
			var qnaCode = document.getElementById('qnaCode').value;
			var menuCode = document.getElementById('menuCode').value;
			
			location.href = '/board/deleteQna?qnaCode=' + qnaCode + '&menuCode=' + menuCode;
		}
		
	})(jQuery);
	
	
	//관리자가 로그인 했을 때 답변만 삭제
	//모달창 오픈
	(function($){
		deleAnswer = function(){
			
			$('#answerModal').modal('show');	
			$('#answerModalContent').text('답변을 삭제하시겠습니까?');
		};
		
		deleAnswerModal = function(menuCode, qnaCode){

			var menuCode = document.getElementById('menuCode').value;
			var qnaCode = document.getElementById('qnaCode').value;

			location.href = '/board/deleteAnswer?qnaCode=' + qnaCode + '&menuCode=' + menuCode;
		};
		
	})(jQuery);
	
	
	
	
	
	
	