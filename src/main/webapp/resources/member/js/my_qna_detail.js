//화면 로딩 후 바로 실행
$(document).ready(function(){
	var aa = document.getElementById('aa')
	
	//모달창 확인버튼 누르면
	$(document).on('click', '#goMyQnaDelete', function() {
		var menuCode = $('#menuCode').val();
		var qnaCode = $('#qnaCode').val();
		
		$.ajax({
            url: '/myPage/deleteMyQna', //요청경로
            type: 'post',
            async: false,
            data:{'qnaCode':qnaCode}, //필요한 데이터,'넘어갈데이터의 이름':값,값,값
            success: function(result) {
               if(result){
            	   $('#myQnaDeleteCheck').modal("hide");
            	   $('#aa').modal('show');
            	   
            	   aa.addEventListener('hidden.bs.modal', function (event) {
            		   location.href = '/myPage/myQnaList';
            		 })
            	   
               }
               else{
            	   alert('삭제실패 왜?');
            	   
            	   
               }
               
               
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

	
   
})(jQuery);

