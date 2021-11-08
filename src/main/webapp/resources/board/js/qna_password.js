	function checkPw() {
		var inputPw = document.getElementById('inputPw').value;
		var qnaPw = document.getElementById('qnaPw').value;
		var qnaCode = document.getElementById('qnaCode').value;
		var menuCode = document.getElementById('menuCode').value;
		
		
		if(inputPw != qnaPw){
			
			$('#alertModal').modal('show');	
			$('#deleModalContent').text('비밀번호를 확인해 주세요.');

			document.getElementById('inputPw').value = '';
			document.getElementById('inputPw').focus();
			return;
		}
		
		location.href = '/board/qnaDetail?qnaCode=' + qnaCode +'&menuCode=' + menuCode;
	}