//화면 로딩 후 바로 실행
$(document).ready(function(){

	$('#searchAction').submit(function(){
		var kwd = $('#kwdInput').val();
		var isbn = $('#isbnInput').val();
		if(kwd == '' && isbn == ''){
		$('#allNullModal').modal('show');
		return false;
		}
		
		
	});	
	
	
	$(document).on('click','#regBookSubmit1',function(){
		$('#clearRequestModal').modal('show');
	});
		
	
	$(document).on('click','#cancel',function(){
			result = confirm('취소하시겠습니까?');
			if(result){
			//디브 - 플렉스,논
			$('#regForm').css('display','none');
			$('#searchForm').css('display','flex');
			//타이틀- 인라인,논
			$('#searchTitle1').css('display','inline');
			$('#searchTitle2').css('display','none');
			} 	
	});
	
	$(document).on('click','.dataTr',function(){
		var category    = $(this).children().eq(1).text();    
		var title		= $(this).children().eq(4).text();    
		var writer		= $(this).children().eq(5).text();    
		var pubDate		= $(this).children().eq(6).text();    
		var isbn		= $(this).children().eq(7).text();    
		var kdcCode     = $(this).children().eq(8).text();    
		var kdcName     = $(this).children().eq(9).text();  
		  
		$('input[name=category]').val(category);           	
		$('input[name=title]').val(title);                 	
		$('input[name=writer]').val(writer);               	
		$('input[name=isbn]').val(isbn);                   				
		$('input[name=pubDate]').val(pubDate);             				
		$('input[name=kdcCode]').val(kdcCode);             				
		$('input[name=kdcName]').val(kdcName);  
		           				
		$('#regFormModalText').text(title);		           				
		                                                   				
		$('#goRegFormModal').modal('show');                				
		                                                   				
	
    });
	//이벤트 처리	
});	

//함수 선언 영역
(function($){

	goRegFormFunction = function(){
		$('#goRegFormModal').modal('hide');
		//디브 - 플렉스,논
		$('#regForm').css('display','flex');
		$('#searchForm').css('display','none');
		//타이틀- 인라인,논
		$('#searchTitle1').css('display','none');
		$('#searchTitle2').css('display','inline');
		
		$('html,body').animate({
			scrollTop:150
		},100);

		var isbn = $('input[name=isbn]').val();
		$.ajax({
			url: '/service/checkISBN', //요청경로
			type: 'post',
			data:{'isbn':isbn}, //필요한 데이터
			success: function(result) {
				
				//isbn이 DB에 있다면
				if (result){
					$('#checkISBN').modal('show');
					$('#regBookSubmit1').css('display','none');
					$('#regBookSubmit2').css('display','inline');
				}else{ //없다면
					$('#regBookSubmit1').css('display','inline');
					$('#regBookSubmit2').css('display','none');
				}	
			},
			error: function(){
				//ajax 실행 실패 시 실행되는 구간
				alert('실패');
			}
		})	
		
		}
		
		clearRequestModal = function(){
		$('#regBookRequestAction').submit();			
		}
	
   
})(jQuery);








