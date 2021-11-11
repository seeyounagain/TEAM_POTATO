
//화면 로딩 후 바로 실행
$(document).ready(function(){	
	
	
		$('html,body').animate({
			scrollTop:200
		},100);
	
	
	
		// 현재 날짜
		
		function getToday(){
			var date = new Date();
			var year = date.getFullYear();
			var month = ("0" + (1 + date.getMonth())).slice(-2);
			var day = ("0" + date.getDate()).slice(-2);
			
			return year + "-" + month + "-" + day;
		}
		
		// 한달 전 날짜
		function searchBeforeDate(){
			var date = new Date();
			var year = date.getFullYear();
			var month = ("0" + (1 + date.getMonth())).slice(-2);
			var day = ("0" + (date.getDate()-7)).slice(-2);
			
			return year + "-" + month + "-" + day;
		}
		
		// 날짜 기본값 설정
		var nowDate = getToday();
		var searchBeforeDate = searchBeforeDate();
		
		if (!$('#searchBeforeDate').val()) {
			$('#searchBeforeDate').val(searchBeforeDate);
			$('#searchNowDate').val(nowDate);
		
		}
		
		
		
		$('#searchBeforeDate').attr('max', nowDate);
		$('#searchNowDate').attr('max', nowDate);
		
	
	
	
		
		//검색 초기화 ajax
		$(document).on('click','.searchRecordReset',function(){
		var searchId = '';
		
		$('#searchId').val('');

				$.ajax({
	            url: '/service/resetSearchRecord', //요청경로
	            type: 'post',
	            data:{'id':searchId}, //필요한 데이터
	            success: function(recordList) {

			
				var str2 = '';
		
				$('#dateLine').empty();

				str2 = '<input type="date" name="recordStartDate" id="searchBeforeDate"> ~ <input type="date" name="recordEndDate" id="searchNowDate" >';
				$('#dateLine').append(str2);
				
				var str3 = '';
				
				$('#searchBar').empty();
				
		str3 += '<div class="input-group text-center">                                                                                       ';
		str3 += '<input type="text" name="searchId" id="searchId" class="form-control" placeholder="아이디를 입력하세요.">                        ';          
		str3 += '<input type="button" value="검색" class="searchRecord input-group-text gap-2 col-2 btn-primary">                             ';
		str3 += '<input type="button" value="초기화" class="searchRecordReset input-group-text gap-2 btn-primary" style="margin-left : 3px;">  ';
	  	str3 += '</div>                                                                                                                      ';
	  		                                                                                                                             
				$('#searchBar').append(str3);
				  				
				
				
						
		
				$('#searchBeforeDate').val(searchBeforeDate);
				$('#searchNowDate').val(nowDate);
				
				$('.recordListTitleDiv').empty();
	var title = '';
	title+='<div><h3>열람실좌석 이용기록</h3></div>';
	title+='<div>(전체기록 조회)</div>';							
				$('.recordListTitleDiv').append(title);
				
				$('.searchRecordList').empty();
				var str='';		                                                            
   str+='	<table class="table text-center">                                           ';
   str+='  	<thead>                                                                     ';
   str+='    	<tr class="text-center mt-5">                                           ';
   str+='     		<th scope="col">기록번호</th>                       					';
   str+='     		<th scope="col">사용자</th>                                     		';
   str+='     		<th scope="col">좌석번호</th>                                        	';
   str+='     		<th scope="col">입실시간</th>                                        	';
   str+='     		<th scope="col">퇴실시간</th>                                        	';
   str+='    	</tr>                                                                   ';
   str+='  	</thead>                                                                    ';
   str+=' 	 <tbody>                                                                    ';
				$(recordList).each(function(index, record){
   str+='		<tr>                                                                    ';
   str+='			<td class="seat mx-1">'+record.recordCode+'</td>                ';
   str+='			<td>'+record.id+'</td>                                              ';
   str+='			<td>열람-'+record.seatCode+'</td>                                    ';
   str+='			<td>'+record.seatInDate+'</td>                                      ';
   					if(record.seatOutDate == null){record.seatOutDate = '';}
   str+='			<td>'+record.seatOutDate+'</td>                                     ';
   str+='		</tr>	                                                                ';
 				});
   str+='                                                                               ';
   str+=' 	</tbody>                                                                    ';
   str+='	</table>																	';
   				$('.searchRecordList').append(str);
   
	            },
	            error: function(){
	             //ajax 실행 실패 시 실행되는 구간
	               alert('실패');
	            }
	      	});	
		
		
	});
	
	
	//시트기록 검색ajax
	$(document).on('click','.searchRecord',function(){
		var searchId = $('#searchId').val();
		var	recordStartDate = $('#searchBeforeDate').val();
		var	recordEndDate	= $('#searchNowDate').val();	
			
				$.ajax({
	            url: '/service/searchRecord', //요청경로
	            type: 'post',
	            data:{'id':searchId,'recordEndDate':recordEndDate,'recordStartDate':recordStartDate}, //필요한 데이터
	            success: function(recordList) {
				
				$('.recordListTitleDiv').empty();
	var title = '';
	title+='<div><h3>열람실좌석 이용기록</h3></div>';
	title+='<div>(검색기록 조회)</div>';							
				$('.recordListTitleDiv').append(title);
				
				$('.searchRecordList').empty();
				var str='';	
				if(recordList == null || recordList == ''){

   str+='	<table class="table text-center">                                           ';
   str+='  	<thead>                                                                     ';
   str+='    	<tr class="text-center mt-5">                                           ';
   str+='     		<th scope="col">기록번호</th>                       					';
   str+='     		<th scope="col">사용자</th>                                     		';
   str+='     		<th scope="col">좌석번호</th>                                        	';
   str+='     		<th scope="col">입실시간</th>                                        	';
   str+='     		<th scope="col">퇴실시간</th>                                        	';
   str+='    	</tr>                                                                   ';
   str+='  	</thead>                                                                    ';
   str+=' 	 <tbody>                                                                    ';
   str+='		<tr>                                                        			';
   str+='			<td rowspan="2" colspan="5" class="seat mx-auto">	     			';					
   str+='			<h4>검색한 ID 또는 해당기간의 정보가 없습니다.</h4>							';
   str+='			<h5>상세한 정보조회를 위하여 자세한 ID와 기간을 입력해주세요.</h5>				';			
   str+='			</td>      															';				
   str+='		</tr>	                                                              	';
   str+=' 	</tbody>                                                                    ';
   str+='	</table>																	';					
					$('.searchRecordList').append(str);
					
					
					
					
					
					
				}else{
				
						                                                            
   str+='	<table class="table text-center">                                           ';
   str+='  	<thead>                                                                     ';
   str+='    	<tr class="text-center mt-5">                                           ';
   str+='     		<th scope="col">기록번호</th>                       					';
   str+='     		<th scope="col">사용자</th>                                     		';
   str+='     		<th scope="col">좌석번호</th>                                        	';
   str+='     		<th scope="col">입실시간</th>                                        	';
   str+='     		<th scope="col">퇴실시간</th>                                        	';
   str+='    	</tr>                                                                   ';
   str+='  	</thead>                                                                    ';
   str+=' 	 <tbody>                                                                    ';
				$(recordList).each(function(index, record){
   str+='		<tr>                                                                    ';
   str+='			<td class="seat mx-1">'+record.recordCode+'</td>          		    ';
   str+='			<td>'+record.id+'</td>                                              ';
   str+='			<td>열람-'+record.seatCode+'</td>                                    ';
   str+='			<td>'+record.seatInDate+'</td>                                      ';
   					if(record.seatOutDate == null){record.seatOutDate = '';}
   str+='			<td>'+record.seatOutDate+'</td>                                     ';
   str+='		</tr>	                                                                ';
 				});
   str+='                                                                               ';
   str+=' 	</tbody>                                                                    ';
   str+='	</table>																	';
   				$('.searchRecordList').append(str);
   				}
   
	            },
	            error: function(){
	             //ajax 실행 실패 시 실행되는 구간
	               alert('실패');
	            }
	      	});	
		
		
	});
	

	
	
	//////////////////////////////// AJAX 이벤트
	
	
	
	$(document).on('click','.seatIdCheck',function(){
			if($('.seatUpdateId').val() == '' || $('.seatUpdateId').val() == null){
				$('#ComeOnSeatIdModal').modal('show');
			}else{
				var id = $('.seatUpdateId').val();
				
				 	 		$.ajax({
            url: '/service/seatMemberIdCheck', //요청경로
            type: 'post',
            data:{'id':id}, //필요한 데이터
            success: function(memberId) {
				
				if(memberId == '' || memberId == ''){
					$('#EmptySeatIdModal').modal('show');
				}else{	
				memberId;
				
				$.ajax({
	            url: '/service/seatIdCheck', //요청경로
	            type: 'post',
	            data:{'id':memberId}, //필요한 데이터
	            success: function(seatId) {
					
					if(seatId == id && seatId != null){
						$('#imiittnunZuasuk').modal('show');
						
					}else{
						$('#clearSeatIdModal').modal('show');
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
				
			}
			
 		});
 		
 	});

	
	//이벤트 처리
	$(document).on('focusout','.seatForm',function(){
		$('#minimin').css('display','none');
	})
	
	$(document).on('click','.seatForm', function() {
		
		$('html,body').animate({
			scrollTop:450
		},100);
		
		
		var sc = $(this).children().eq(0).val();
		
				$.ajax({
			      url: '/service/chooseSeat', //요청경로
			      type: 'post',
			      data:{'seatCode':sc}, //필요한 데이터
			      success: function(result) {
			      	//ajax 실행 성공 시 실행되는 구간
			      	$('#minimin').empty();
			      	
			      	if(result.seatStatus == 0){
						result.id = '';
						result.seatStatus ='배정대기중';
					}else{
						result.seatStatus ='사용중';
					}
			      	
   var str = '';
   str+='<div class="row justify-content-center mt-5 align-middle">                                              			';
   str+='	<div class="col-7 text-center mb-5">                             		                               			';
   str+='	좌석상태변경 mini                                                                                    				';
   str+='<table class="table">                                                                                   			';
   str+='	<thead>                                                                                              			';
   str+='		<tr class="text-center">                                                                    				';
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
   str+='			<td class="text-center align-middle"><input type="button" value="변경" onclick="statusChange();" class="btn btn-primary"></td>    ';
   str+='		</tr>                                                                      									';                  
   str+='	</tbody>                                                                       									';
   str+='</table>   																										';
   str+='	<div class="text-center">                                                            							';
   str+='	<input type="button" onclick="closeMinimin();" value="닫기" class="btn btn-primary">                                                		';
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
		
	inputOrSpan ='<span class="input-group"><input type="text" name="id" class="seatUpdateId form-control gap-2 bg-white col-1" id="button-addon1" style="width:80px"><input type="button" value="체크" class="seatIdCheck btn btn-primary" id="button-addon1"></span>';
	ment += '   <div class="text-center mb-2"> 회원의 ID 정보와 중복된 좌석을 확인합니다. [체크]버튼을 눌러주세요. </div>       	';
	statusReadOr+='<input type="radio" name="seatStatus" value="1" checked>배정												';
	  
   	checkSubmit+='<span class="checkSubmit1" style="display: none"><input type="button" class="seatInfoChange btn btn-primary" value="확인" onclick="seatInfoChange();"></span>   				';
  	checkSubmit+='<span class="checkSubmit2" style="display: inline">정보확인중</span></td>    								';
	closeMinimin+='<input type="button" onclick="closeMinimin();" value="닫기" class="btn btn-primary">                                             ';
	
	//퇴실하는 에이잭스
	}else{
	inputOrSpan = '<span class="input-group"><input type="text" name="id" value="'+result.id+'" readOnly style="width:150px" class="form-control"></span>						';													
	statusReadOr +='<input type="radio" name="seatStatus" value="0" checked>퇴실												';
	checkSubmit +='<input type="submit" value="확인" class="btn btn-primary">																		';
	ment += '<div class="text-center mb-2"> 퇴실하시겠습니까? 확인 버튼을 눌러주세요.</div>		                  			';
	closeMinimin +='<input type="button" onclick="closeMinimin();" value="취소" class="btn btn-primary">                                             ';
	}
	
   var str = '';
   str+='<div class="row justify-content-center mt-5 align-middle">                                              			';
   str+='	<div class="col-7 text-center mb-5">                             		                               			';
   str+='<form action="/service/seatUpdate" method="post" id="seatUpdateFormAction"> 				                                            		';
   str+='	좌석상태변경 mini                                                                                    			';
   str+='<table class="table">                                                                                   			';
   str+='	<colgroup><col width="20%"><col width="40%"><col width="15%"><col width="25%"></colgroup>';	
   str+='	<thead>                                                                                              			';
   str+='		<tr class="text-center">                                                                    				';
   str+='  			<th scope="col">좌석번호</th>                                                                			';
   str+=' 			<th scope="col">이용자</th>                                                                  			';
   str+='  			<th scope="col">상태</th>                                                                    			';
   str+='  			<th scope="col">상태변경</th>                                                                			';
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
   str+=checkSubmit;	/*퇴실 or 입실*/
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
		
	seatInfoChange = function() {
		$('.seatInfoChange').addClass('disabled');
		$('#seatUpdateFormAction').submit();
	}
		
	
		
   
})(jQuery);
