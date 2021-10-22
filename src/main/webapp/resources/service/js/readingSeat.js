
//화면 로딩 후 바로 실행
$(document).ready(function(){
	
	$(document).on('click','#seatOn',function(){
		alert('dd');
	});
	
	$(document).on('click','.seatIdCheck',function(){
			var id = $('.seatUpdateId').val();

 	 		$.ajax({
            url: '/service/seatIdCheck', //요청경로
            type: 'post',
            data:{'id':id}, //필요한 데이터
            success: function(result) {
	
               //ajax 실행 성공 후 실행할 코드 작성
                if(result==id){
				alert('중복된 아이디입니다.');
				}
				//아이디가 다르고 널이 아닐때 (다른 회원의 아이디일때)
				else if(result != id && result != null){
				alert('id를 확인해주세요.');
				}
				else{
				alert('회원가입을 해주세요.');	
				}
            },
            error: function(){
             //ajax 실행 실패 시 실행되는 구간
               alert('실패');
            }
      	});

 		});
 		
 	});

	
	//이벤트 처리
	$(document).on('focusout','.seatForm',function(){
		$('#minimin').css('display','none');
	})
	
	$(document).on('click','.seatForm', function() {
		var sc = $(this).children().eq(0).val();
		
		alert('hi');
		
				$.ajax({
			      url: '/service/chooseSeat', //요청경로
			      type: 'post',
			      data:{'seatCode':sc}, //필요한 데이터
			      success: function(result) {
			      	//ajax 실행 성공 시 실행되는 구간
			      	$('#minimin').empty();
   var str = '';
   str+='<div class="row justify-content-center mt-5 align-middle">                                              			';
   str+='	<div class="col-6 text-center mt-5 mb-5">                                                            			';
   str+='	좌석상태변경 mini                                                                                    				';
   str+='<table class="table">                                                                                   			';
   str+='	<thead>                                                                                              			';
   str+='		<tr class="text-center mt-5">                                                                    			';
   str+='  			<th scope="col">좌석번호</th>                                                                				';
   str+=' 			<th scope="col">이용자</th>                                                                  				';
   str+='  			<th scope="col">상태</th>                                                                    				';
   str+='  			<th scope="col">상태변경</th>                                                                				';
   str+='		</tr>                                                                                            			';
   str+='	</thead>                                                                                             			';
  // str+='	<tbody>  <input type="hidden" name="menuCode" value="${menuCode }">                                   			';
   str+='		<tr class="text-center">    																				';
   str+='			<th class="align-middle miniSeatCode" scope="row">'+result.seatCode+'</th>	     									';
   str+='			<td class="text-center align-middle">'+result.id+'</td>       								           	';
   str+='			<td class="text-center align-middle">'+result.seatStatus+'</td>       									';
   str+='			<td class="text-center align-middle"><input type="button" value="변경" onclick="statusChange();"</td>    ';
   str+='		</tr>                                                                      									';                  
   str+='	</tbody>                                                                       									';
   str+='</table>                                                                          									';
   str+='	</div>                                                                         									';
   str+='</div>                                                                         									';
   $('#minimin').append(str);
	   
			      },
			      error: function(){
			      	//ajax 실행 실패 시 실행되는 구간
			      	alert('실패');
			      }
			});
		
    });


//함수 선언 영역
(function($){
	//aaa = function(){
	//};
	
	
	
	
	closeMinimin = function() {
	$('#minimin').empty();		
	}
	
	statusChange = function() {
		var sc = $('.miniSeatCode').text();
		var menuCode = $('.menuCode').val();
		
				$.ajax({
			      url: '/service/chooseSeat', //요청경로
			      type: 'post',
			      data:{'seatCode':sc}, //필요한 데이터
			      success: function(result) {
				
			      	//ajax 실행 성공 시 실행되는 구간
			      	$('#minimin').empty();

			      	
			      	
			      	var inputOrSpan ='';
			      	
			      	//리절트 아이디가 널이면
			      	if(result.id == null || result.id == ''){
						inputOrSpan = 
	'<input type="text" name="id" class="seatUpdateId" style="width:100px"><input type="button" value="체크" class="mx-1 seatIdCheck">';
					}else{
						inputOrSpan = result.id;
					}
			      	
			      	
   var str = '';
   
   str+='<div class="row justify-content-center mt-5 align-middle">                                              			';
   str+='	<div class="col-6 text-center mt-5 mb-5">                                                            			';
   str+='<form action="/service/seatUpdate" method="post"> 				                                            		';
   str+='	좌석상태변경 mini                                                                                    				';
   str+='<table class="table">                                                                                   			';
   str+='	<thead>                                                                                              			';
   str+='		<tr class="text-center mt-5">                                                                    			';
   str+='  			<th scope="col">좌석번호</th>                                                                				';
   str+=' 			<th scope="col">이용자</th>                                                                  				';
   str+='  			<th scope="col">상태</th>                                                                    				';
   str+='  			<th scope="col">상태변경</th>                                                                				';
   str+='		</tr>                                                                                            			';
   str+='	</thead>                                                                                             			';
   str+='	<tbody>                                                                                              			';
   str+='		<tr class="text-center">   																					';
   str+='			<th class="align-middle miniSeatCode" scope="row">'+result.seatCode+'</th>	     						';
   str+='			<input type="hidden" name="seatCode" value="'+result.seatCode+'">			     						';
   str+='			<input type="hidden" name="menuCode" value="'+menuCode+'">			     								';
   str+='			<td class="text-center align-middle">'+inputOrSpan+'</td>       								        ';
   str+='			<td class="text-center align-middle">																	';
   str+='<input type="radio" name="seatStatus" value="0" >퇴실																';
   str+='<input type="radio" name="seatStatus" value="1" checked>배정															';   
   str+='<td class="text-center align-middle"><input type="submit" value="확인"> </td>    									';
   str+='		</tr>                                                                      									';                  
   str+='	</tbody>                                                                       									';
   str+='</table>                                                                          									';
   str+='</form>                                                                         									';
   str+='	<div class="text-center">                                                            							';
   str+='	<input type="button" onclick="closeMinimin();" value="닫기">                                                		';
   str+='	</div>                                                                         									';
   str+='	</div>                                                                         									';
   str+='</div>                                                                         									';
   $('#minimin').append(str);
	   
			      },
			      error: function(){
			      	//ajax 실행 실패 시 실행되는 구간
			      	alert('실패');
			      }
			});
		
	}
		
		
		
	
		
   
})(jQuery);
