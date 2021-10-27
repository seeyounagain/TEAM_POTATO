//화면 로딩 후 바로 실행
$(document).ready(function(){
	//이벤트 처리
	$(document).on('click', '#changeBtn', function() {
    var id = $('#id').text();
    var menuCode = $('#menuCode').val();
    alert(id);
    alert(menuCode);
   
		$.ajax({
	        url: '/myPage/myInfoAjax', //요청경로
	        type: 'post',
	        data:{'id':id,'menuCode':menuCode}, //필요한 데이터/        
	        success: function(result) {
	        	//ajax 실행 성공 시 실행되는 구간
	        	alert('성공');
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
					str += '<td><div class="form-check form-check-inline"><input class="form-check-input" type="radio" name="gender" id="male" value="남" checked><label class="form-check-label" for="male">남</label></div><div class="form-check form-check-inline"><input class="form-check-input" type="radio" name="gender" id="female" value="여"><label class="form-check-label" for="female">여</label></div><div class="form-check form-check-inline"><input class="form-check-input" type="radio" name="gender" id="none" value=""><label class="form-check-label" for="none">선택안함</label></div></td>';      
				}
				else if(result.gender == '여'){
					str += '<td><div class="form-check form-check-inline"><input class="form-check-input" type="radio" name="gender" id="male" value="남"><label class="form-check-label" for="male">남</label></div><div class="form-check form-check-inline"><input class="form-check-input" type="radio" name="gender" id="female" value="여" checked><label class="form-check-label" for="female">여</label></div><div class="form-check form-check-inline"><input class="form-check-input" type="radio" name="gender" id="none" value=""><label class="form-check-label" for="none">선택안함</label></div></td>';      
				}
				else if(result.gender == ''){
					str += '<td><div class="form-check form-check-inline"><input class="form-check-input" type="radio" name="gender" id="male" value="남"><label class="form-check-label" for="male">남</label></div><div class="form-check form-check-inline"><input class="form-check-input" type="radio" name="gender" id="female" value="여"><label class="form-check-label" for="female">여</label></div><div class="form-check form-check-inline"><input class="form-check-input" type="radio" name="gender" id="none" value="" checked><label class="form-check-label" for="none">선택안함</label></div></td>';
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
				str += '<td id="id">'+result.id+'</td>';
				str += '</tr>';
				str += '<tr>';
				str += '<td class="table-secondary"><span style="color: #ff5058">*</span>비밀번호 변경</td>';
				str += '<td><button type="submit" id="changeBtn" class="btn btn-primary">비밀번호 변경</button>';
				str += '</tr>';
				str += '<tr>';
				str += '<td class="table-secondary"><span style="color: #ff5058">*</span>연락처</td>';
				str += '<td><div class="row"><div class="col"><select class="form-select" name="tells" id="tell1" value="'+ result.tell1 +'"><option value="010">010</option><option value="011">011</option><option value="016">016</option><option value="018">018</option></select></div><div class="col"><input type="text" id="tell2" class="form-control" name="tells" value="'+ result.tell2 +'" required></div><div class="col"><input type="text" id="tell3" class="form-control" name="tells" value="'+ result.tell3 +'" required></div><div></td>';     
				str += '</tr>';
				str += '<tr>';
				str += '<td class="table-secondary"><span style="color: #ff5058">*</span>주소</td>';
				str += '<td><div class="row"><div class="col-10 text-start"><input type="text" class="post form-control" name="addrs" id="postcode" value="'+ result.postCode +'" readonly required></div><div class="col-2 text-end"><input type="button" class="post btn btn-primary" onclick="openPostcode()" value="우편번호찾기"></div><div class="col-12"><input type="text" style="margin-top: 5px;" class="post form-control" name="addrs" id="address" value="'+ result.addr +'" required></div></div></td>';
				str += '</tr>';
				str += '<tr>';
				str += '<td class="table-secondary">관심카테고리</td>';
				str += '<td><div class="col-12"><div class="form-check form-check-inline"><input class="form-check-input" type="checkbox" name="favorite" value="소설"><label class="form-check-label" for="inlineCheckbox1">소설</label></div><div class="form-check form-check-inline"><input class="form-check-input" type="checkbox" name="favorite" value="시/에세이"><label class="form-check-label" for="inlineCheckbox1">시/에세이</label></div><div class="form-check form-check-inline"><input class="form-check-input" type="checkbox" name="favorite" value="요리/건강"><label class="form-check-label" for="inlineCheckbox1">요리/건강</label><div class="form-check form-check-inline"><input class="form-check-input" type="checkbox" name="favorite" value="요리/건강"><label class="form-check-label" for="inlineCheckbox1">취미/실용</label></div><div class="form-check form-check-inline"><input class="form-check-input" type="checkbox" name="favorite" value="요리/건강"><label class="form-check-label" for="inlineCheckbox1">경제/경영</label></div><div class="form-check form-check-inline"> <input class="form-check-input" type="checkbox" name="favorite" value="자기계발"> <label class="form-check-label" for="inlineCheckbox1">자기계발</label></div><div class="form-check form-check-inline"><input class="form-check-input" type="checkbox" name="favorite" value="역사/문화"><label class="form-check-label" for="inlineCheckbox1">역사/문화</label></div></div></td>';                   
				

				str += '</table>';
				str += '</div>';
				str += '</div>';
			
				str += '<input type="hidden" id="menuCode" name="menuCode" value="'+ menuCode +'">';
				str += '<div class="row  justify-content-center">';
				str += '<div class="col-2 d-grid">';
				str += '<button type="submit" class="btn btn-primary">수정하기</button>';
				str += '</div>';
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
});

//함수 선언 영역
(function($){
	//aaa = function(){
	//};
   
})(jQuery);