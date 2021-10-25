
//화면 로딩 후 바로 실행
$(document).ready(function(){
	
	$(document).on('click','#seatOn',function(){
		alert('dd');
	});
	
	$(document).on('click','.seatIdCheck',function(){
			var id = $('.seatUpdateId').val();

 	 		$.ajax({
            url: '/service/seatMemberIdCheck', //요청경로
            type: 'post',
            data:{'id':id}, //필요한 데이터
            success: function(result) {
	
				if(result == null && result == ''){
					
				}else{
				var id2 = result;
				$.ajax({
	            url: '/service/seatIdCheck', //요청경로
	            type: 'post',
	            data:{'id':id2}, //필요한 데이터
	            success: function(result) {
					
					if(result == id){
						alert('이미 배정된 좌석이 있습니다.');
					}else{
						alert('좌석 및 ID 확인 완료');
						$('.checkSubmit1').css('display','inline');
						$('.checkSubmit2').css('display','none');
					}	
	            },
	            error: function(){
	             //ajax 실행 실패 시 실행되는 구간
	               alert('실패1');
	            }
	      	});
					
				}
            },
            error: function(){
             //ajax 실행 실패 시 실행되는 구간
               alert('없는 ID 입니다. 회원가입을 해주세요.');
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
   str+='			<th class="align-middle miniSeatCode" scope="row">'+result.seatCode+'</th>	     						';
   str+='			<td class="text-center align-middle">'+result.id+'</td>       								           	';
   str+='			<td class="text-center align-middle">'+result.seatStatus+'</td>       									';
   str+='			<td class="text-center align-middle"><input type="button" value="변경" onclick="statusChange();"</td>    ';
   str+='		</tr>                                                                      									';                  
   str+='	</tbody>                                                                       									';
   str+='</table>   																										';
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
			      	var checkSubmit = ''; //checkSubmit
			      	var ment = '';
			      	var statusReadOr = '';
			      	var closeMinimin = '';
		
			      	
			      	//리절트 아이디가 널이면
	if(result.id == null || result.id == ''){
	inputOrSpan ='<input type="text" name="id" class="seatUpdateId" style="width:100px"><input type="button" value="체크" class="mx-1 seatIdCheck">';
   	checkSubmit+='<span class="checkSubmit1" style="display: none"><input type="submit" value="확인"></span>   				';
  	checkSubmit+='<span class="checkSubmit2" style="display: inline">정보확인중</span></td>    								';
	ment += '   <div class="text-center mb-2"> 회원의 ID 정보와 중복된 좌석을 확인합니다. [체크]버튼을 눌러주세요. </div>                  	';
	statusReadOr+='<input type="radio" name="seatStatus" value="0" >퇴실														';
	statusReadOr+='<input type="radio" name="seatStatus" value="1" checked>배정												';  
	closeMinimin+='<input type="button" onclick="closeMinimin();" value="닫기">                                              ';
	
	}else{
	inputOrSpan = result.id;
	checkSubmit+='<input type="submit" value="확인">																			';
	ment += '<div class="text-center mb-2"> 퇴실하시겠습니까? 확인 버튼을 눌러주세요.</div>		                  					';
	statusReadOr+='<input type="radio" name="seatStatus" value="0" checked>퇴실												';
	closeMinimin+='<input type="button" onclick="closeMinimin();" value="취소">                                              ';
	
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
   str+=statusReadOr;  
   str+='<td class="text-center align-middle">																				';
   str+=checkSubmit;
   str+='		</tr>                                                                      									';                  
   str+='	</tbody>                                                                       									';
   str+='</table>                                                                          									';
   str+='</form>                                                                         									';
   str+=ment;
   str+='	<div class="text-center">                                                            							';
   str+=closeMinimin;
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
