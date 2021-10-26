//화면 로딩 후 바로 실행
$(document).ready(function(){
	//이벤트 처리
	$(document).on('click', '#changeBtn', function() {
    var id = $('#id').text();
    alert(id);
   
		$.ajax({
	        url: '/myPage/myInfoAjax', //요청경로
	        type: 'post',
	        data:{'id':id}, //필요한 데이터/        
	        success: function(result) {
	        	//ajax 실행 성공 시 실행되는 구간
	        	alert('성공');
	        	$('#ajaxStart').empty();
	        	var str = '';
	        	
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
					str += '<td>input class="form-check-input" type="radio" name="gender" id="male" value="남"><label class="form-check-label" for="male">남<input class="form-check-input" type="radio" name="gender" id="female" value="여"><label class="form-check-label" for="female">여</label><input class="form-check-input" type="radio" name="gender" id="none" value="" checked><label class="form-check-label" for="none">선택안함</label></td>';      
				}
				else if(result.gender == '여'){
					str += '<td><input type="radio" name="gender" value = "남">남<input type="radio" name="gender" value = "여" checked>여<input type="radio" name="gender" value="선택안함">선택안함</td>';      
				}
				else if(result.gender == ''){
					str += '<td><input type="radio" name="gender" value = "남">남<input type="radio" name="gender" value = "여">여<input type="radio" name="gender" value="선택안함" checked>선택안함</td>';
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
				str += '<td class="table-secondary">아이디</td>';
				str += '<td id="id"><input type="text" name="id" placeholder="'+ result.id + '"></td>';
				str += '</tr>';
				str += '<tr>';
				str += '<td class="table-secondary">연락처</td>';
				str += '<td><div class="row"><div class="col"><select class="form-select" name="tells" id="tell1"><option value="010">010</option><option value="011">011</option><option value="016">016</option><option value="018">018</option></select></div><div class="col"><input type="text" id="tell2" class="form-control" name="tells" required></div><div class="col"><input type="text" id="tell3" class="form-control" name="tells" required></div><div></td>';     
				str += '</tr>';
				str += '<tr>';
				str += '<td class="table-secondary">주소</td>';
				str += '<td><input type="text" name="addr" placeholder="'+ result.addr +'"></td>';
				str += '</tr>';
				str += '<tr>';
				str += '<td class="table-secondary">관심카테고리</td>';
				str += '<td><input type="text" name="favorite" placeholder="'+ result.favorite +'"></td>';
				str += '</tr>';
				str += '</table>';
				str += '</div>';
				str += '</div>';
			
				str += '<div class="row  justify-content-center">';
				str += '<div class="col-2 d-grid">';
				str += '<button type="submit" id="changeBtn" class="btn btn-primary">수정하기</button>';
				str += '</div>';
				str += '</div>';
	        	
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