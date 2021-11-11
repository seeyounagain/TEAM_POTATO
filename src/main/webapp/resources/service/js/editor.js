//화면 로딩 후 바로 실행
$(document).ready(function(){
	
	$(document).on('click', '.formBtn', function() {
		
 		oEditors.getById["smartEditor"].exec("UPDATE_CONTENTS_FIELD",[]);
 		oEditors2.getById["smartEditor"].exec("UPDATE_CONTENTS_FIELD",[]);
 		oEditors3.getById["smartEditor"].exec("UPDATE_CONTENTS_FIELD",[]);
 		oEditors4.getById["smartEditor"].exec("UPDATE_CONTENTS_FIELD",[]);
		$('#testSubmit').submit();
		
		
	});
});

//함수 선언 영역
(function($){
	//aaa = function(){
	//};
   
})(jQuery);

 
 