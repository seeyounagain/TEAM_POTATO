//화면 로딩 후 바로 실행
$(document).ready(function(){
	
	//이벤트 처리
	$(document).on('focusout','.seatForm',function(){
		$('#minimin').css('display','none');
	})
	
	$(document).on('click','.seatForm', function() {
		var sc = $(this).children().eq(0).val();
		
		alert(sc);
		
				$.ajax({
			      url: '/service/chooseSeat', //요청경로
			      type: 'post',
			      data:{'seatCode':sc}, //필요한 데이터
			      success: function(result) {
			      	//ajax 실행 성공 시 실행되는 구간
			      	alert(result.seatCode);
			      	$('#minimin').empty();
		var str = '';
   str+='<div class="row justify-content-center mt-5 align-middle">                      '    ;
   str+='	<div class="col-6 text-center mt-5 mb-5">                                       '    ;
   str+='	좌석상태변경 mini                                                                    '    ;
   str+='<table class="table">                                                               '    ;
   str+='	<thead>                                                                         '    ;
   str+='		<tr class="text-center mt-5">                                               '    ;
   str+='  			<th scope="col">좌석번호</th>                                              '    ;
   str+=' 			<th scope="col">이용자</th>                                               '    ;
   str+='  			<th scope="col">상태</th>                                                '    ;
   str+='  			<th scope="col">상태변경</th>                                              '    ;
   str+='		</tr>                                                                       '    ;
   str+='	</thead>                                                                        '    ;
   str+='	<tbody>                                                                         '    ;
   str+='		<tr class="text-center">    												'    ;
   str+='			<th class="align-middle" scope="row">'+result.seatCode+'</th>	     '    ;
   str+='			<td class="text-center align-middle">'+result.id+'</td>       '    ;
   str+='			<td class="text-center align-middle">'+result.seatStatus+'</td>       '    ;
   str+='			<td class="text-center align-middle"></td>       '    ;
   str+='		</tr>                                                                       '    ;
   str+='	</tbody>                                                                        '    ;
   str+='</table>                                                                            '    ;
   str+='	</div>                                                                          '    ;
   str+='</div>                                                                         		'    ;
	   $('#minimin').append(str);
	   
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
