

/* 관리자로 로그인했을 때 답변만 삭제 */
	function deleAnswer() {
		var qnaCode = document.getElementById('qnaCode').value;
		var menuCode = document.getElementById('menuCode').value;
		var qnaPw = document.getElementById('qnaPw').value;
		
		if(	confirm("답변을 삭제하시겠습니까?" + qnaPw) == true){

			location.href = '/board/deleteAnswer?qnaCode=' + qnaCode + '&menuCode=' + menuCode;
		
		}else{
			return;
		}
	}
	
	
	
	function checkPw() {
		var qnaCode = document.getElementById('qnaCode').value;
		var menuCode = document.getElementById('menuCode').value;
		var qnaPw = document.getElementById('qnaPw').value;
		
		if(	confirm("상담 / 문의 글을 삭제하시겠습니까?" + qnaPw) == true){
			
			 var inputPw = prompt("상담 / 문의글 비밀 번호 확인" + qnaPw);
			 
			 if(inputPw == qnaPw){
				 
			 	location.href = '/board/deleteQna?qnaCode=' + qnaCode + '&menuCode=' + menuCode;
				 
			 }
			
			
			/* location.href = '/board/deleteQna?qnaCode=' + qnaCode + '&menuCode=' + menuCode; */
		
		}else{
			return;
		}
	}