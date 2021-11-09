 //쿠키여부 확인
var checkCookie = getCookie("popUp=Potato");
	if(checkCookie == 'popUp=Potato') {
		$('#notice').modal('hide');
	};
//팝업 모달창 띄우기
$(window).on('load',function(){ 
	$('#notice').modal('show');
	
	var noticeCode = $('#noticeCode').val();
	
	$.ajax({
		url: '/common/popupAjax', //요청경로
		type: 'post',
		data:{'noticeCode': noticeCode},
		success: function(result){ 
			
			$('#title').text(result.title);
			$('#content').prepend(result.content);
			
		},
		error: function(){
		// ajax 실행 실패 시 실행되는 구간
		alert('실패');
		}
		
	});
	
});

//닫기를 클릭하면
$('#popEnd').click(function() {
	$('#notice').modal('hide'); //창 닫기
	
	//만약 체크속성이 있다면, 쿠키 만들어주기
	 if(document.getElementById("chkBox").checked){
		setCookie('popUp', 'Potato', 1);
	}else{
		delCookie('Potato');
	}
	
});

	
	//쿠키생성
	function setCookie(name, value, day){
		var date = new Date();
		date.setDate(date.getDate() + 1);
		
		var myCookie = '';
		myCookie += name + '=' + value + ';';
		myCookie += 'Expires=' + date.toUTCString();
		
		document.cookie = myCookie; 
	}
	
	
	//쿠키삭제
	function delCookie(name){
		var date = new Date();
		date.setDate(date.getDate() - 1);
		
		var setCookie = '';
		
		setCookie += name+'=Potato;';
		setCookie += 'Expires=' + date.toUTCString();
		
		document.cookie = setCookie;
	}

	//쿠키확인
	function getCookie(name){
		var cookie = document.cookie;
		
		if(document.cookie != ""){
			var cookie_array = cookie.split(';');
			console.log(cookie_array)
			for(var index in cookie_array){
				var cookie_name = cookie_array[index];
					console.log(cookie_name);
				if(cookie_name == "popUp=Potato") {
					console.log(cookie_name);
					return cookie_name;
				}
			}
		}
		return;
	}
	
		
		