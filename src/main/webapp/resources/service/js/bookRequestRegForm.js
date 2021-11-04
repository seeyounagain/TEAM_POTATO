//화면 로딩 후 바로 실행
$(document).ready(function(){
		
		$('html,body').animate({
			scrollTop:200
		},100);

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
			$('#regForm').css('display','none');
			$('#searchForm').css('display','flex');
			//타이틀- 인라인,논
			$('#searchTitle1').css('display','inline');
			$('#searchTitle2').css('display','none');
			
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
			scrollTop:210
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
		
		clearRequestModalAndGoStatus = function(menuCode){
			$('#clearRequestModal').modal('hide');
			
			//서브밋
			var title  =	$('input[name=title]').val();                 	
			var writer =	$('input[name=writer]').val();               	
			var pubDate =	$('input[name=pubDate]').val();             				
			var category =	$('input[name=category]').val();           	
			var isbn =		$('input[name=isbn]').val();                   				
			var kdcCode =	$('input[name=kdcCode]').val();             				
			var kdcName =	$('input[name=kdcName]').val(); 
			var id =		$('input[name=id]').val(); 
			//ajax 사용
			$.ajax({
		        url: '/service/ajaxRegRequest', //요청경로
		        type: 'post',
		        data:{'title':title,'writer':writer,'pubDate':pubDate
		        		,'category':category,'isbn':isbn,'kdcCode':kdcCode
		        		,'kdcName':kdcName,'id':id}, //필요한 데이터
		        success: function(result) {
		        	if(result){
		        	location.href='/myPage/bookRequestStatus?menuCode='+menuCode;		
					}else{
					
					}
		        },
		        error: function(){
		        	//ajax 실행 실패 시 실행되는 구간
		        	alert('실패');
		        }
		  });
			
			
		}
		
		
		clearRequestModalAndHold = function(menuCode){
			$('#clearRequestModal').modal('hide');
			
			//서브밋
			var title  =	$('input[name=title]').val();                 	
			var writer =	$('input[name=writer]').val();               	
			var pubDate =	$('input[name=pubDate]').val();             				
			var category =	$('input[name=category]').val();           	
			var isbn =		$('input[name=isbn]').val();                   				
			var kdcCode =	$('input[name=kdcCode]').val();             				
			var kdcName =	$('input[name=kdcName]').val(); 
			var id =		$('input[name=id]').val(); 
			//ajax 사용
			$.ajax({
		        url: '/service/ajaxRegRequest', //요청경로
		        type: 'post',
		        data:{'title':title,'writer':writer,'pubDate':pubDate
		        		,'category':category,'isbn':isbn,'kdcCode':kdcCode
		        		,'kdcName':kdcName,'id':id}, //필요한 데이터
		        success: function(result) {
		        	if(result){
		        	location.href='/service/bookRequestRegForm?menuCode='+menuCode;			
					}else{
					
					}
		        },
		        error: function(){
		        	//ajax 실행 실패 시 실행되는 구간
		        	alert('실패');
		        }
		  });
				
					
					
					
			
			
			
		//location.href='/service/bookRequestRegForm?menuCode='+menuCode;			
		}
	
   
})(jQuery);








