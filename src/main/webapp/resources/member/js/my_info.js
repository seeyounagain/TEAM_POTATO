//화면 로딩 후 바로 실행
$(document).ready(function(){
	//이벤트 처리
	$(document).on('click', '#changeBtn', function() {
	    var id = $('#id').text();
	    var menuCode = $('#menuCode').val();
	    var male = '남';
	    var female = '여';
	    var none = '';
    
	    $.ajax({
		        url: '/myPage/myInfoAjax', //요청경로
		        type: 'post',
		        data:{'id':id,'menuCode':menuCode}, //필요한 데이터/        
		        success: function(result) {
		        	//ajax 실행 성공 시 실행되는 구간
		        	$('#ajaxStart').empty();
		        	var str = '';
		        	str += '<form action="/myPage/updateMyInfo" method="post">'; 
					str += '<div class="row justify-content-center">';
					str += '<div class="col-10 mb-4">';
					str += '<h3>개인정보</h3>';
					str += '<table class="table mt-2" style="border-top: 2px solid #0b70b9;">';
					str += '<colgroup>';
					str += '<col width="20%">';
					str += '<col width="80%">';
					str += '</colgroup>';
					str += '<tr>';
					str += '<td class="table-secondary">이름</td>';
					str += '<td>' + result.name + '</td>';
					str += '</tr>';
					str += '<tr>';
					str += '<td class="table-secondary">성별</td>';
					
					if(result.gender == '남'){
						str += '<td><div class="form-check form-check-inline"><input class="form-check-input" type="radio" name="gender" id="male" value="'+male+'" checked><label class="form-check-label" for="male">남</label></div><div class="form-check form-check-inline"><input class="form-check-input" type="radio" name="gender" id="female" value="'+female+'"><label class="form-check-label" for="female">여</label></div><div class="form-check form-check-inline"><input class="form-check-input" type="radio" name="gender" id="none" value="'+none+'"><label class="form-check-label" for="none">선택안함</label></div></td>';      
					}
					else if(result.gender == '여'){
						str += '<td><div class="form-check form-check-inline"><input class="form-check-input" type="radio" name="gender" id="male" value="'+male+'"><label class="form-check-label" for="male">남</label></div><div class="form-check form-check-inline"><input class="form-check-input" type="radio" name="gender" id="female" value="'+female+'" checked><label class="form-check-label" for="female">여</label></div><div class="form-check form-check-inline"><input class="form-check-input" type="radio" name="gender" id="none" value="'+none+'"><label class="form-check-label" for="none">선택안함</label></div></td>';      
					}
					else if(result.gender == '' || result.gender == null){
						str += '<td><div class="form-check form-check-inline"><input class="form-check-input" type="radio" name="gender" id="male" value="'+male+'"><label class="form-check-label" for="male">남</label></div><div class="form-check form-check-inline"><input class="form-check-input" type="radio" name="gender" id="female" value="'+female+'"><label class="form-check-label" for="female">여</label></div><div class="form-check form-check-inline"><input class="form-check-input" type="radio" name="gender" id="none" value="'+none+'" checked><label class="form-check-label" for="none">선택안함</label></div></td>';
					}
					str += '</tr>';
					str += '</table>';
					str += '</div>';
					str += '</div>';
				
				
					str += '<div class="row justify-content-center">';
					str += '<div class="col-10 mb-4">';
					str += '<h3>회원정보</h3>';
					str += '<table class="table mt-2" style="border-top: 2px solid #0b70b9;">';
					str += '<colgroup>';
					str += '<col width="20%">';
					str += '<col width="80%">';
					str += '</colgroup>';
					str += '<tr>';
					str += '<td class="table-secondary"><span style="color: #ff5058">*</span>아이디</td>';
					str += '<td>'+result.id+'</td>';
					str += '</tr>';
					str += '<tr>';
					str += '<td class="table-secondary"><span style="color: #ff5058">*</span>비밀번호 변경</td>';
					str += '<td><button type="button" id="changePwBtn" class="btn btn-primary" data-bs-toggle="modal"data-bs-target="#changePwModal">비밀번호 변경</button>';
					str += '</tr>';
					str += '<tr>';
					
					var tellTell = result.tell.split('-');
					str += '<td class="table-secondary"><span style="color: #ff5058">*</span>연락처</td>';
					str += '<td><div class="row"><div class="col"><select class="form-select" name="tells" id="tell1" value="'+ tellTell[0] +'"><option value="010">010</option><option value="011">011</option><option value="016">016</option><option value="018">018</option></select></div><div class="col"><input type="text" id="tell2" class="form-control" name="tells" value="'+ tellTell[1] +'" required></div><div class="col"><input type="text" id="tell3" class="form-control" name="tells" value="'+ tellTell[2] +'" required></div><div class="col-12 mt-2" id="tellCheck" style="color: red; font-size: 14px;"></div><div></td>';     
					str += '</tr>';
					str += '<tr>';
					str += '<td class="table-secondary"><span style="color: #ff5058">*</span>주소</td>';
					str += '<td><div class="row"><div class="col-10 text-start"><input type="text" class="post form-control" name="addrs" id="postcode" value="'+ result.postCode +'" readonly required></div><div class="col-2 text-end"><input type="button" class="post btn btn-primary" id="openPostcode" value="우편번호찾기"></div><div class="col-12"><input type="text" style="margin-top: 5px;" class="post form-control" name="addrs" id="address" value="'+ result.addr +'" readonly required><input type="text" style="margin-top: 5px;" class="post form-control" name="addrs" id="detailAddress" placeholder="상세주소"></div></div></td>';
					str += '</tr>';
					str += '<tr>';
					str += '<td class="table-secondary"><span style="color: #ff5058">*</span>생년월일</td><td id="birth">'+result.birth+'</td>';
					str += '</tr>';
					str += '<tr>';
					str += '<td class="table-secondary">관심카테고리</td>';
					
					if(result.favorite != null){
						var checkedCheck1 = '';
						var checkedCheck2 = '';
						var checkedCheck3 = '';
						var checkedCheck4 = '';
						var checkedCheck5 = '';
						var checkedCheck6 = '';
						var checkedCheck7 = '';
						
						var favoriteArr = result.favorite.split(',');
						
						for(var i = 0; i < favoriteArr.length; i++){
							if(favoriteArr[i] == '소설'){
								checkedCheck1 = 'checked';
							}
							if(favoriteArr[i] == '시/에세이'){
								checkedCheck2 = 'checked';
							}
							if(favoriteArr[i] == '요리/건강'){
								checkedCheck3 = 'checked';
							}
							if(favoriteArr[i] == '취미/실용'){
								checkedCheck4 = 'checked';
							}
							if(favoriteArr[i] == '경제/경영'){
								checkedCheck5 = 'checked';
							}
							if(favoriteArr[i] == '자기계발'){
								checkedCheck6 = 'checked';
							}
							if(favoriteArr[i] == '역사/문화'){
								checkedCheck7 = 'checked';
							}
							
						}
						str += '<td><div class="col-12"><div class="form-check form-check-inline"><input class="form-check-input" type="checkbox" name="favorite" value="소설"'+ checkedCheck1 +'><label class="form-check-label" for="inlineCheckbox1">소설</label></div><div class="form-check form-check-inline"><input class="form-check-input" type="checkbox" name="favorite" value="시/에세이"'+ checkedCheck2 +'><label class="form-check-label" for="inlineCheckbox1">시/에세이</label></div><div class="form-check form-check-inline"><input class="form-check-input" type="checkbox" name="favorite" value="요리/건강"'+ checkedCheck3 +'><label class="form-check-label" for="inlineCheckbox1">요리/건강</label></div><div class="form-check form-check-inline"><input class="form-check-input" type="checkbox" name="favorite" value="취미/실용"'+ checkedCheck4 +'><label class="form-check-label" for="inlineCheckbox1">취미/실용</label></div><div class="form-check form-check-inline"><input class="form-check-input" type="checkbox" name="favorite" value="경제/경영"'+ checkedCheck5 +'><label class="form-check-label" for="inlineCheckbox1">경제/경영</label></div><div class="form-check form-check-inline"><input class="form-check-input" type="checkbox" name="favorite" value="자기계발"'+ checkedCheck6 +'><label class="form-check-label" for="inlineCheckbox1">자기계발</label></div><div class="form-check form-check-inline"><input class="form-check-input" type="checkbox" name="favorite" value="역사/문화"'+ checkedCheck7 +'><label class="form-check-label" for="inlineCheckbox1">역사/문화</label></div></div></td>';                   
					}
					else{
						str += '<td><div class="col-12"><div class="form-check form-check-inline"><input class="form-check-input" type="checkbox" name="favorite" value="소설"><label class="form-check-label" for="inlineCheckbox1">소설</label></div><div class="form-check form-check-inline"><input class="form-check-input" type="checkbox" name="favorite" value="시/에세이"><label class="form-check-label" for="inlineCheckbox1">시/에세이</label></div><div class="form-check form-check-inline"><input class="form-check-input" type="checkbox" name="favorite" value="요리/건강"><label class="form-check-label" for="inlineCheckbox1">요리/건강</label></div><div class="form-check form-check-inline"><input class="form-check-input" type="checkbox" name="favorite" value="취미/실용"><label class="form-check-label" for="inlineCheckbox1">취미/실용</label></div><div class="form-check form-check-inline"><input class="form-check-input" type="checkbox" name="favorite" value="경제/경영"><label class="form-check-label" for="inlineCheckbox1">경제/경영</label></div><div class="form-check form-check-inline"><input class="form-check-input" type="checkbox" name="favorite" value="자기계발"><label class="form-check-label" for="inlineCheckbox1">자기계발</label></div><div class="form-check form-check-inline"><input class="form-check-input" type="checkbox" name="favorite" value="역사/문화"><label class="form-check-label" for="inlineCheckbox1">역사/문화</label></div></div></td>';                   
					}
					
					str += '</tr>';
					str += '</table>';
					str += '</div>';
					str += '</div>';
					str += '<input type="hidden" id="ajaxId" name="id" value="'+ result.id +'">';
					str += '<input type="hidden" id="ajaxExistingPw" value="'+ result.pw +'">';
					str += '<input type="hidden" id="menuCode" name="menuCode" value="'+ menuCode +'">';
					str += '<div class="row  justify-content-center">';
					str += '<div class="col-2 d-grid">';
					str += '<button type="submit" class="btn btn-primary" id="updateBtn">수정하기</button>';
					str += '</div>';
					str += '<div class="col-2 d-grid">';
					str += '<button type="button" class="btn btn-secondary" onclick="location.href=\'/myPage/myInfo?menuCode='+ menuCode +'\'">취소</button>';
					str += '</div>';
					str += '</form>';
					
					$('#ajaxStart').append(str);
		        	
		        },
		        error: function(){
		        	//ajax 실행 실패 시 실행되는 구간
		        	alert('실패');
		        }
		  });
	});
	
	//휴대번호 정규식
	$(document).on('keyup', '#tell, #tell2, #tell3', function() { 
		var tell1J = /^01[0||1||6||8]{1}$/;
		var tell2J = /^[0-9]{3,4}$/;
		var tell3J = /^[0-9]{4}$/;
  		
  		// 모든 조건에 부합한다면
		if(tell1J.test($('#tell1').val()) && tell2J.test($('#tell2').val()) && tell3J.test($('#tell3').val())){
			
			$('#tellCheck').text('');
			$('#updateBtn').removeClass('disabled');
			return ;
		}
		else{
			
			$('#tellCheck').text('* 휴대전화 번호를 확인해주세요.');
			$('#updateBtn').addClass('disabled');
			return ;
		}
	});
	
	//우편번호 버튼클릭
	$(document).on('click','#openPostcode', function() {
		new daum.Postcode({
			oncomplete: function(data) {
			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('postcode').value = data.zonecode;
			document.getElementById("address").value = data.roadAddress;
			// 커서를 주소 필드로 이동한다.
			document.getElementById("detailAddress").focus();
			}
		}).open();
	});
	//우편번호 창클릭
	$(document).on('mousedown','#postcode, #address, #detailAddress', function() {
		new daum.Postcode({
			oncomplete: function(data) {
				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('postcode').value = data.zonecode;
				document.getElementById("address").value = data.roadAddress;
				// 커서를 주소 필드로 이동한다.
				document.getElementById("detailAddress").focus();
			}
		}).open();
	});
	
	//비밀번호 변경 모달창이 열리면
	$("#changePwModal").on("shown.bs.modal", function () { 
		
		$("#pw1").focus(); 
	
	});
	
	//새비밀번호 정규식
	$(document).on('keyup', '#newPw', function() { 
		//소대문자a~z,0~9,특수문자로 8~20자리 만들기
		var pwJ = /^[a-zA-z0-9$`~!@$!%*#^?&\\(\\)\-_=+]{8,20}$/;
		
		// 조건에 부합하다면
		if(pwJ.test($('#newPw').val())){
			$('#pwCheck1').text('');
			
			
			//비밀번호 변경에서 비밀번호 확인 칸에 입력 했을 경우 동일한지 체크
				var newPw = $('#newPw').val();
				var checkPw = $('#checkPw').val();
				
				if (newPw != checkPw) {
					$('#pwCheck2').text('* 비밀번호를 확인해주세요.');
					$('#changePwBtn2').addClass('disabled');
					return ;
				}
				else {
					$('#pwCheck2').text('');
					$('#changePwBtn2').removeClass('disabled');
					return ;				
				}
			
			return ;
		}
		else{
		
			$('#pwCheck1').text('* 영문 대문자, 소문자, 숫자, 특수문자를 사용하여 8자 이상, 20자 이하로 설정하십시오');
			$('#changePwBtn2').addClass('disabled');
			return ;
		}
	});
	//비밀번호확인 정규식
	$(document).on('keyup', '#checkPw', function() { 
		//소대문자a~z,0~9,특수문자로 8~20자리 만들기
		var pwJ = /^[a-zA-z0-9$`~!@$!%*#^?&\\(\\)\-_=+]{8,20}$/;
		
		// 조건에 부합하다면
		if(pwJ.test($('#checkPw').val())){
			$('#pwCheck3').text('');
			$('#changePwBtn2').removeClass('disabled');
			
			//비밀번호 변경에서 비밀번호 확인 칸에 입력 했을 경우 동일한지 체크
				var newPw = $('#newPw').val();
				var checkPw = $('#checkPw').val();
				
				if (newPw != checkPw) {
					$('#pwCheck2').text('* 비밀번호를 확인해주세요.');
					$('#changePwBtn2').addClass('disabled');
					return ;
				}
				else {
					$('#pwCheck2').text('');
					$('#changePwBtn2').removeClass('disabled');
					return ;				
				}
			
			return ;
		}
		else{
			
			$('#pwCheck3').text('* 영문 대문자, 소문자, 숫자, 특수문자를 사용하여 8자 이상, 20자 이하로 설정하십시오');
			$('#changePwBtn2').addClass('disabled');
			return ;
		}
	});
	

	
	//비밀번호 변경에서 capslpck 확인
	$(document).on('keyup','#pw1, #newPw, #checkPw', function() { 
		  if (event.getModifierState("CapsLock")) {
			    document.getElementById("checkCapsLock2").innerText 
			      = "Caps Lock이 켜져 있습니다."
			    		$(document).on('keyup', '#checkPw' , function() {
			    			var newPw = $('#newPw').val();
			    			var checkPw = $('#checkPw').val();
			    			
			    			if (newPw != checkPw) {
			    				$('#pwCheck2').text('* 비밀번호를 확인해주세요.');
			    				$('#changePwBtn2').addClass('disabled');
			    				return ;
			    			}
			    			else {
			    				$('#pwCheck2').text('');
			    				$('#changePwBtn2').removeClass('disabled');
			    				return ;				
			    			}
			    		});
			    	  
			  }else {
			    document.getElementById("checkCapsLock2").innerText 
			      = ""
			  }
		}); 
	
	//모달창 닫으면
	var changePwModal = document.getElementById('changePwModal');
	//var loginModal = $('#loginModal');위에거가 이거랑 같은거임
	changePwModal.addEventListener('hidden.bs.modal', function (event) {
	 	 // do something...
		$('#pwCheck1').text('');
		$('#pwCheck2').text('');
		$('#pwCheck3').text('');
		$('#checkCapsLock2').text('');
		$('.modal input[type="password"]').val('');
	})
	
	//모달창 열리면
	var changePwModal = document.getElementById('changePwModal');
	//var loginModal = $('#loginModal');위에거가 이거랑 같은거임
	changePwModal.addEventListener('show.bs.modal', function (event) {
		// do something...
		$('#changePwBtn2').addClass('disabled');
	})
	
	//기존 비밀번호 확인 후 모달창 닫는거까지
	$(document).on('click', '#changePwBtn2' , function() {
		$('#changePwBtn2').addClass('disabled');
		var id = $('#ajaxId').val();
		var ajaxExistingPw = $('#ajaxExistingPw').val();
		var pw1 = $('#pw1').val();
		var newPw = $('#newPw').val();
		var checkPw = $('#checkPw').val();
		
		
		
		if (ajaxExistingPw != pw1) {
			
			$('.myInfoAlertModalBtn2').text('닫기');
			$(".myInfoAlertModalBtn1").hide();
			$("#myInfoAlertModal").modal('show');
			$('#myInfoAlertText').text('비밀번호를 다시 확인해 주세요.');
			$('.modal input[type="password"]').val('');
			return ;
			
		}

		
		else {
			$.ajax({
				 url: '/myPage/updatePw', //요청경로
				type: 'post',
				async : false,
			 	data:{'pw':newPw,'id':id}, //필요한 데이터/        
			 success: function(result) {
			        	//ajax 실행 성공 시 실행되는 구간
						
						if (newPw != checkPw) {
							$('.myInfoAlertModalBtn2').text('닫기');
							$(".myInfoAlertModalBtn1").hide();
							$("#myInfoAlertModal").modal('show');
							$('#myInfoAlertText').text('새로운 비밀번호를 확인해주세요.');
							$('.modal input[type="password"]').val('');
							return ;
						}
						else {
							$('#pwCheck2').text('');
							$('#changePwBtn2').removeClass('disabled');
							$('.myInfoAlertModalBtn2').text('확인');
							$('.myInfoAlertModalBtn2').attr('data-bs-dismiss','modal');
							$(".myInfoAlertModalBtn1").hide();
							$("#myInfoAlertModal").modal('show');
							$('#myInfoAlertText').text('비밀번호가 변경되었습니다.');
							$('.modal input[type="password"]').val('');
						 	$('#changePwModal').modal("hide");
						 	
						    var menuCode = $('#menuCode').val();
						    var male = '남';
						    var female = '여';
						    var none = '';
					    
						    $.ajax({
							        url: '/myPage/myInfoAjax', //요청경로
							        type: 'post',
							        data:{'id':id,'menuCode':menuCode}, //필요한 데이터/        
							        success: function(result) {
							        	//ajax 실행 성공 시 실행되는 구간
							        	$('#ajaxStart').empty();
							        	var str = '';
							        	str += '<form action="/myPage/updateMyInfo" method="post">'; 
										str += '<div class="row justify-content-center">';
										str += '<div class="col-10 mb-4">';
										str += '<h3>개인정보</h3>';
										str += '<table class="table mt-2" style="border-top: 2px solid #0b70b9;">';
										str += '<colgroup>';
										str += '<col width="20%">';
										str += '<col width="80%">';
										str += '</colgroup>';
										str += '<tr>';
										str += '<td class="table-secondary">이름</td>';
										str += '<td>' + result.name + '</td>';
										str += '</tr>';
										str += '<tr>';
										str += '<td class="table-secondary">성별</td>';
										
										if(result.gender == '남'){
											str += '<td><div class="form-check form-check-inline"><input class="form-check-input" type="radio" name="gender" id="male" value="'+male+'" checked><label class="form-check-label" for="male">남</label></div><div class="form-check form-check-inline"><input class="form-check-input" type="radio" name="gender" id="female" value="'+female+'"><label class="form-check-label" for="female">여</label></div><div class="form-check form-check-inline"><input class="form-check-input" type="radio" name="gender" id="none" value="'+none+'"><label class="form-check-label" for="none">선택안함</label></div></td>';      
										}
										else if(result.gender == '여'){
											str += '<td><div class="form-check form-check-inline"><input class="form-check-input" type="radio" name="gender" id="male" value="'+male+'"><label class="form-check-label" for="male">남</label></div><div class="form-check form-check-inline"><input class="form-check-input" type="radio" name="gender" id="female" value="'+female+'" checked><label class="form-check-label" for="female">여</label></div><div class="form-check form-check-inline"><input class="form-check-input" type="radio" name="gender" id="none" value="'+none+'"><label class="form-check-label" for="none">선택안함</label></div></td>';      
										}
										else if(result.gender == ''){
											str += '<td><div class="form-check form-check-inline"><input class="form-check-input" type="radio" name="gender" id="male" value="'+male+'"><label class="form-check-label" for="male">남</label></div><div class="form-check form-check-inline"><input class="form-check-input" type="radio" name="gender" id="female" value="'+female+'"><label class="form-check-label" for="female">여</label></div><div class="form-check form-check-inline"><input class="form-check-input" type="radio" name="gender" id="none" value="'+none+'" checked><label class="form-check-label" for="none">선택안함</label></div></td>';
										}
										str += '</tr>';
										str += '</table>';
										str += '</div>';
										str += '</div>';
									
									
										str += '<div class="row justify-content-center">';
										str += '<div class="col-10 mb-4">';
										str += '<h3>회원정보</h3>';
										str += '<table class="table mt-2" style="border-top: 2px solid #0b70b9;">';
										str += '<colgroup>';
										str += '<col width="20%">';
										str += '<col width="80%">';
										str += '</colgroup>';
										str += '<tr>';
										str += '<td class="table-secondary"><span style="color: #ff5058">*</span>아이디</td>';
										str += '<td>'+result.id+'</td>';
										str += '</tr>';
										str += '<tr>';
										str += '<td class="table-secondary"><span style="color: #ff5058">*</span>비밀번호 변경</td>';
										str += '<td><button type="button" id="changePwBtn" class="btn btn-primary" data-bs-toggle="modal"data-bs-target="#changePwModal">비밀번호 변경</button>';
										str += '</tr>';
										str += '<tr>';
										
										var tellTell = result.tell.split('-');
										str += '<td class="table-secondary"><span style="color: #ff5058">*</span>연락처</td>';
										str += '<td><div class="row"><div class="col"><select class="form-select" name="tells" id="tell1" value="'+ tellTell[0] +'"><option value="010">010</option><option value="011">011</option><option value="016">016</option><option value="018">018</option></select></div><div class="col"><input type="text" id="tell2" class="form-control" name="tells" value="'+ tellTell[1] +'" required></div><div class="col"><input type="text" id="tell3" class="form-control" name="tells" value="'+ tellTell[2] +'" required></div><div class="col-12 mt-2" id="tellCheck" style="color: red; font-size: 14px;"></div><div></td>';     
										str += '</tr>';
										str += '<tr>';
										str += '<td class="table-secondary"><span style="color: #ff5058">*</span>주소</td>';
										str += '<td><div class="row"><div class="col-10 text-start"><input type="text" class="post form-control" name="addrs" id="postcode" value="'+ result.postCode +'" readonly required></div><div class="col-2 text-end"><input type="button" class="post btn btn-primary" id="openPostcode" value="우편번호찾기"></div><div class="col-12"><input type="text" style="margin-top: 5px;" class="post form-control" name="addrs" id="address" value="'+ result.addr +'" readonly required><input type="text" style="margin-top: 5px;" class="post form-control" name="addrs" id="detailAddress" placeholder="상세주소"></div></div></td>';
										str += '</tr>';
										str += '<tr>';
										str += '<td class="table-secondary"><span style="color: #ff5058">*</span>생년월일</td><td id="birth">'+result.birth+'</td>';
										str += '</tr>';
										str += '<tr>';
										str += '<td class="table-secondary">관심카테고리</td>';
										
										if(result.favorite != null){
											var checkedCheck1 = '';
											var checkedCheck2 = '';
											var checkedCheck3 = '';
											var checkedCheck4 = '';
											var checkedCheck5 = '';
											var checkedCheck6 = '';
											var checkedCheck7 = '';
											
											var favoriteArr = result.favorite.split(',');
											
											for(var i = 0; i < favoriteArr.length; i++){
												if(favoriteArr[i] == '소설'){
													checkedCheck1 = 'checked';
												}
												if(favoriteArr[i] == '시/에세이'){
													checkedCheck2 = 'checked';
												}
												if(favoriteArr[i] == '요리/건강'){
													checkedCheck3 = 'checked';
												}
												if(favoriteArr[i] == '취미/실용'){
													checkedCheck4 = 'checked';
												}
												if(favoriteArr[i] == '경제/경영'){
													checkedCheck5 = 'checked';
												}
												if(favoriteArr[i] == '자기계발'){
													checkedCheck6 = 'checked';
												}
												if(favoriteArr[i] == '역사/문화'){
													checkedCheck7 = 'checked';
												}
												
											}
											str += '<td><div class="col-12"><div class="form-check form-check-inline"><input class="form-check-input" type="checkbox" name="favorite" value="소설"'+ checkedCheck1 +'><label class="form-check-label" for="inlineCheckbox1">소설</label></div><div class="form-check form-check-inline"><input class="form-check-input" type="checkbox" name="favorite" value="시/에세이"'+ checkedCheck2 +'><label class="form-check-label" for="inlineCheckbox1">시/에세이</label></div><div class="form-check form-check-inline"><input class="form-check-input" type="checkbox" name="favorite" value="요리/건강"'+ checkedCheck3 +'><label class="form-check-label" for="inlineCheckbox1">요리/건강</label></div><div class="form-check form-check-inline"><input class="form-check-input" type="checkbox" name="favorite" value="취미/실용"'+ checkedCheck4 +'><label class="form-check-label" for="inlineCheckbox1">취미/실용</label></div><div class="form-check form-check-inline"><input class="form-check-input" type="checkbox" name="favorite" value="경제/경영"'+ checkedCheck5 +'><label class="form-check-label" for="inlineCheckbox1">경제/경영</label></div><div class="form-check form-check-inline"><input class="form-check-input" type="checkbox" name="favorite" value="자기계발"'+ checkedCheck6 +'><label class="form-check-label" for="inlineCheckbox1">자기계발</label></div><div class="form-check form-check-inline"><input class="form-check-input" type="checkbox" name="favorite" value="역사/문화"'+ checkedCheck7 +'><label class="form-check-label" for="inlineCheckbox1">역사/문화</label></div></div></td>';                   
										}
										else{
											str += '<td><div class="col-12"><div class="form-check form-check-inline"><input class="form-check-input" type="checkbox" name="favorite" value="소설"><label class="form-check-label" for="inlineCheckbox1">소설</label></div><div class="form-check form-check-inline"><input class="form-check-input" type="checkbox" name="favorite" value="시/에세이"><label class="form-check-label" for="inlineCheckbox1">시/에세이</label></div><div class="form-check form-check-inline"><input class="form-check-input" type="checkbox" name="favorite" value="요리/건강"><label class="form-check-label" for="inlineCheckbox1">요리/건강</label></div><div class="form-check form-check-inline"><input class="form-check-input" type="checkbox" name="favorite" value="취미/실용"><label class="form-check-label" for="inlineCheckbox1">취미/실용</label></div><div class="form-check form-check-inline"><input class="form-check-input" type="checkbox" name="favorite" value="경제/경영"><label class="form-check-label" for="inlineCheckbox1">경제/경영</label></div><div class="form-check form-check-inline"><input class="form-check-input" type="checkbox" name="favorite" value="자기계발"><label class="form-check-label" for="inlineCheckbox1">자기계발</label></div><div class="form-check form-check-inline"><input class="form-check-input" type="checkbox" name="favorite" value="역사/문화"><label class="form-check-label" for="inlineCheckbox1">역사/문화</label></div></div></td>';                   
										}
										
										str += '</tr>';
										str += '</table>';
										str += '</div>';
										str += '</div>';
										str += '<input type="hidden" id="ajaxId" name="id" value="'+ result.id +'">';
										str += '<input type="hidden" id="ajaxExistingPw" value="'+ result.pw +'">';
										str += '<input type="hidden" id="menuCode" name="menuCode" value="'+ menuCode +'">';
										str += '<div class="row  justify-content-center">';
										str += '<div class="col-2 d-grid">';
										str += '<button type="submit" class="btn btn-primary" id="updateBtn">수정하기</button>';
										str += '</div>';
										str += '<div class="col-2 d-grid">';
										str += '<button type="button" class="btn btn-secondary" onclick="location.href=\'/myPage/myInfo?menuCode='+ menuCode +'\'">취소</button>';
										str += '</div>';
										str += '</form>';
										
										$('#ajaxStart').append(str);
							        	
							        },
							        error: function(){
							        	//ajax 실행 실패 시 실행되는 구간
							        	alert('실패');
							        }
							  });						 	
						 	
						}
		    	
		    },
		    error: function(){
		    	//ajax 실행 실패 시 실행되는 구간
		    	alert('새 비밀번호를 입력하세요');
		    }
					
			
		})		
			
		}
		
	});
	
	
	//회원탈퇴 모달창 열리면
	$("#memberquitModal").on("shown.bs.modal", function () { 
		
		$("#memberquitPw").focus(); 
	
	});
	
	var myInfoAlertModal = document.getElementById('myInfoAlertModal')
	
	//회원탈퇴 모달창
	$(document).on('click', '#checkMemberquitBtn' , function() {
			var id = $('#id').text();
			var existingPw = $('#existingPw').val();
			var memberquitPw = $('#memberquitPw').val();
			
			$.ajax({
				 url: '/myPage/checkMemberquitPw', //요청경로
				type: 'post',
				async: false, //다중 Ajax 실행 시 success 실행 후에도 다음 Ajax 실행 ,비동기 푸는건가?
			 	data:{'existingPw':existingPw,'memberquitPw':memberquitPw}, //필요한 데이터/        
			 success: function(result) {
			        	//ajax 실행 성공 시 실행되는 구간
						if (result) {
							$("#myInfoAlertModal").modal('show');
							$(".myInfoAlertModalBtn1").show();
							$('#myInfoAlertText').text('정말 탈퇴하시겠습니까?');
							$('.myInfoAlertModalBtn2').text('취소');
							myInfoAlertModal.addEventListener('hidden.bs.modal', function (event) {
								$("#memberquitModal").modal('hide');
							})
							
							//확인 클릭시
							$(document).on('click', '.myInfoAlertModalBtn1', function() {
								$.ajax({
									url: '/myPage/checkMemberquit', //요청경로
									type: 'post',
									async: false, //다중 Ajax 실행 시 success 실행 후에도 다음 Ajax 실행 ,비동기 푸는건가?
									data:{'id':id}, //필요한 데이터/        
									success: function(result) {
										if(result){
											$(".myInfoAlertModalBtn1").hide();
											$('.myInfoAlertModalBtn2').text('닫기');
											$('#myInfoAlertText').text('탈퇴하였습니다');
											//두번째 모달창 닫으면
											myInfoAlertModal.addEventListener('hidden.bs.modal', function (event) {
												location.href = '/common/main';
											})
											
										}
										else{
											$(".myInfoAlertModalBtn1").hide();
											$('#myInfoAlertText').text('대출중인 책이 있습니다.반납후 진행가능합니다');
											//두번째 모달창 닫으면
											myInfoAlertModal.addEventListener('hidden.bs.modal', function (event) {
												$("#memberquitModal").modal('hide');
											})
										}
										
									},
									error: function(){
										//ajax 실행 실패 시 실행되는 구간
									}
									
								});							
							});
						
						}
						else {
							$("#myInfoAlertModal").modal('show');
							$(".myInfoAlertModalBtn1").hide();
							$('#myInfoAlertText').text('비밀번호를 다시 확인해 주세요.');
							$('.myInfoAlertModalBtn2').text('닫기');
							$('.modal input[type="password"]').val('');
							
							//두번째 모달창을 닫으면
							myInfoAlertModal.addEventListener('hidden.bs.modal', function (event) {
								$("#memberquitModal").modal('show');
								$("#memberquitPw").focus()
							})
						 	
						}
		    	
		    },
		    error: function(){
		    	//ajax 실행 실패 시 실행되는 구간
		    	alert('여기오면 오류다');
		    }
					
			
		})	
	});

	var changePwModal = document.getElementById('memberquitModal');
	//var loginModal = $('#loginModal');위에거가 이거랑 같은거임
	
	//회원탈퇴창 모달 닫으면
	changePwModal.addEventListener('hidden.bs.modal', function (event) {
	 	 // do something...
		$('#checkCapsLock1').text('');
		$('.modal input[type="password"]').val('');
	})
	
	//회원탈퇴창에서 capslpck 확인
	$(document).on('keyup','#memberquitPw', function() { 
		  if (event.getModifierState("CapsLock")) {
			    document.getElementById("checkCapsLock1").innerText 
			      = "Caps Lock이 켜져 있습니다."
			  }else {
			    document.getElementById("checkCapsLock1").innerText 
			      = ""
			  }
		}); 
	
	
	
});



//함수 선언 영역
(function($){
	//aaa = function(){
	//};
	

	
   
})(jQuery);