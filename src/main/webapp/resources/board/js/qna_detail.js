

	//관리자로 로그인했을 때 답변만 삭제
	function deleAnswer() {
		var qnaCode = document.getElementById('qnaCode').value;
		var menuCode = document.getElementById('menuCode').value;
		var qnaPw = document.getElementById('qnaPw').value;
		
		if(	confirm("답변을 삭제하시겠습니까?") == true){
			
			alert("답변이 삭제되었습니다."); 
			location.href = '/board/deleteAnswer?qnaCode=' + qnaCode + '&menuCode=' + menuCode;
		
		}else{
			return;
		}
	}
	
	//게시글 비밀번호가 없을 때, 관리자가 게시글을 삭제할 때
	function deleQna() {
		var qnaCode = document.getElementById('qnaCode').value;
		var menuCode = document.getElementById('menuCode').value;
		
		if(	confirm("상담 / 문의 글을 삭제하시겠습니까?") == true){
		
			alert("게시글이 삭제되었습니다."); 
			location.href = '/board/deleteQna?qnaCode=' + qnaCode + '&menuCode=' + menuCode;
		
		}else{
			return;
		}
	}
	
	