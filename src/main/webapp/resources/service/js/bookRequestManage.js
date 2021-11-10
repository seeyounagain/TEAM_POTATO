//화면 로딩 후 바로 실행
$(document).ready(function(){

		

		var month = getMonth();
		var inMonth = $('#inMonth').val();
		var inYear = $('#inYear').val();
	
		function getMonth(){
			var date = new Date();
			var month = ("0" + (1 + date.getMonth())).slice(-2);
			return month;
		}		
		
		if(inMonth == ''){
		$('#windowMonth').val(month);
		}else{
		$('#windowMonth').val(inMonth);	
		$('#windowYear').val(inYear);	
		}
		

		$(document).on('click','#chooseMonthYearRequestBoard',function(){	
			var selectYearMonth = $('#windowYear').val() + '-' + $('#windowMonth').val();
			
			location.href='/libManage/bookRequestManage2?'
							+'selectYearMonth='+selectYearMonth		
							+'&year=' + $('#windowYear').val()
							+'&month='+ $('#windowMonth').val()
							+'&menuCode='+$('#menuCode').val();
		})
		
		
	
	

	$(document).on('change','#status',function(){
		if($(this).val() != '' ){
			$(this).parent().next().children().removeClass('disabled');
		}
		
		if($(this).val() == ''){
			$(this).parent().next().children().addClass('disabled');
		}
		
	})
		
	$(document).on('click','.requestStatusChange',function(){
	var status 		= $(this).parent().prev().children().val();
	var requestCode = $(this).parent().prev().prev().prev().prev().prev().prev().prev().prev().text();
 	var toId 		= $(this).parent().prev().prev().prev().text();
		$.ajax({
			url: '/service/ajaxRequestStatusChange', //요청경로
			type: 'post',
			data:{'requestStatus':status,'requestCode':requestCode}, //필요한 데이터
			success: function(result) {
				//isbn이 DB에 있다면
		if (result){
					
		var str = '';
		var statusPack = '';	
		
		$('.requestTableDiv').empty();
		
str+='		<table class="table text-center">		                                                                                                                                                                                                                                   ';
str+='		<thead>                                                                                                                                                                                                                                                                    ';
str+='    	<tr class="text-center">                                                                                                                                                                                                                                                   ';
str+='	     	<th scope="col">No.</th>                                                                                                                                                                                                                                               ';
str+='	     	<th scope="col">제목 (발행년도)</th>                                                                                                                                                                                                                                   ';
str+='	     	<th scope="col">저자	</th>                                                                                                                                                                                                                                          ';
str+='	     	<th scope="col">ISBN</th>		                                                                                                                                                                                                                                       ';
str+='	     	<th scope="col">신청일</th>	                                                                                                                                                                                                                                           ';
str+='	     	<th scope="col">신청인</th>	                                                                                                                                                                                                                                           ';
str+='	     	<th scope="col">상태</th>	                                                                                                                                                                                                                                           ';
str+='	     	<th scope="col" colspan="2">업무</th>	                                                                                                                                                                                                                               ';
str+='		</tr>	                                                                                                                                                                                                                                                                   ';
str+='		</thead>	                                                                                                                                                                                                                                                               ';
str+='		<tbody>                                                                                                                                                                                                                                                                    ';
str+='		<colgroup>                                                                                                                                                                                                                                                                 ';
str+='			<col width="*">                                                                                                                                                                                                                                                        ';
str+='			<col width="25%">                                                                                                                                                                                                                                                      ';
str+='			<col width="20%">                                                                                                                                                                                                                                                      ';
str+='			<col width="12%">                                                                                                                                                                                                                                                      ';
str+='			<col width="13%">                                                                                                                                                                                                                                                      ';
str+='			                                                                                                                                                                                                                                                                       ';
str+='			<col width="6%">                                                                                                                                                                                                                                                       ';
str+='			<col width="7%">                                                                                                                                                                                                                                                       ';
str+='			<col width="15%">                                                                                                                                                                                                                                                      ';
str+='		</colgroup>                                                                                                                                                                                 								';
				$(result).each(function(index, a){                                                                                                                                                                        										
str+='		<tr class="text-center">                                       		                                                                                                                                             								';
str+='			<td>'+a.requestCode +'</td> 			                                                                                                                            																';
str+='			<td>'+a.title+'</td>                                                                      		                                                                                                     										';
str+='			<td>'+a.writer+'</td>   		                                                                                     		                                                                                                   											';                                                    		                                                                                                     
str+='			<td>'+a.isbn+'</td>                                                	                                                                                                                                   												';
str+='			<td>'+a.createDate+'</td>																																																													';
str+='			<td>'+a.id+'</td>  																																																														';
		if(a.requestStatus == 0){
		statusPack = '신규신청'
		}else if(a.requestStatus == 1){
		statusPack = '접수완료'
		}else if(a.requestStatus == 2){
		statusPack = '진행중'
		}else if(a.requestStatus == 3){
		statusPack = '완료'	
		}else if(a.requestStatus == 4){
		statusPack = '비치불가'
		}
str+='			<td id="statusPack">'+statusPack+'</td>  																																		';	
str+='			<td><select class="form-select" name="requestStatus" id="status"><option value="">상태변경</option><option value="1">접수완료</option><option value="2">진행중</option><option value="3">완료</option><option value="4">비치불가</option></select></td>	               			';
str+='			<td><input type="button" value="확인" class="btn btn-primary disabled requestStatusChange" ></td>                                                                                                                                                                       ';
 				});
str+='		</tr>                                                                                                                                                                                                                                                                      '                                                                                                                                                                                                                                                              
str+='		</tbody>                                                                                                                                                                                                                                                                   ';
str+='		</table>                                                                                                                                                                                                                                                                   ';

		$('.requestTableDiv').append(str);
		
		
		
		if ($('#statusPack').text() == '완료'){
			$('#toId').val(toId);
			$('#content').val('도서비치신청이 완료되었습니다.\n신청번호'+requestCode);
			$('#messageModal1').modal('show');
			
		}
		else if($('#statusPack').text() == '비치불가'){
			$('#toId2').val(toId);
			$('#content2').val('해당 도서는 "비치불가" 처리 되었습니다.\n사유 : \n신청번호'+requestCode);
			$('#messageModal2').modal('show');
		}
		
		
		
	}
},
			error: function(){
				//ajax 실행 실패 시 실행되는 구간
				alert('실패');
			}
		})	
	
	
	
	})
	// 알림보내기
	$(document).on('click', '.sendMessage' , function() {
		
		$('#messageModal1').modal('hide');
		
		var toId = $('#toId').val();
		var content = $('#content').val();
		
		/* 알림보내기 Ajax 시작 */
		$.ajax({
			url: '/libManage/sendMessageAjax', // 요청경로
			type: 'post', // post 메소드 방식
			data: {'toId':toId,'content':content}, // 필요한 데이터를 status라는 이름으로 status 데이터를 넘긴다. 데이터가 여러개일 경우 쉼표로 연결.
			success: function(result) { // result 값에 컨트롤러에서 돌려준 데이터가 들어간다.
			// ajax 실행 성공 후 실행할 코드 작성, 컨트롤러 이동 후 코드 실행, 완료 후 다시 돌아와 실행 됨 (페이지 이동 x)
			
			if (result == 1) {
				
				$('#completeModal').modal('show');
				
			}
			else {
				
				$('#failModal').modal('show');
				
			}
			
			},
			error: function(){
			// ajax 실행 실패 시 실행되는 구간
			$('#failModal').modal('show');
			}
		});
		/* 알림보내기 Ajax 종료 */			
		
	});

	
})


//함수 선언 영역
(function($){
	//aaa = function(){
	//};
   
})(jQuery);







