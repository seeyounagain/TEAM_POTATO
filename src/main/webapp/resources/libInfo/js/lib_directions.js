/* 페이지 로딩 후 실행 */
$(document).ready(function(){
	var container = document.getElementById('map1');
	var options = {
		center: new kakao.maps.LatLng(35.5350087, 129.310217),// 지도의 중심 좌표
		level: 3// 확대 레벨
	};

	var map = new kakao.maps.Map(container, options);// 지도 생성
	
	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	var mapTypeControl = new kakao.maps.MapTypeControl();

	// 지도 타입 컨트롤을 지도에 표시합니다
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
	
	// 지도 우측 확대 축소 컨트롤생성
	var zoomControl = new kakao.maps.ZoomControl();
	// 지도 우측 확대 축소 컨트롤추가
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	
	// 지도에 표시할 마커 생성
	var marker = new kakao.maps.Marker({
		map: map, // 마커를 표시할 지도
		position: new kakao.maps.LatLng(35.5350087, 129.310217)// 마커를 표시할 위치
	});
	
	var iwContent = '<div class="text-center" style="padding:5px;"><a href="https://map.kakao.com/link/to/도담도서관,35.5350087,129.310217" style="color:black; text-align: center;" target="_blank">도담도서관</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    iwPosition = new kakao.maps.LatLng(35.5350087, 129.310217); //인포윈도우 표시 위치입니다

	// 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({
		position : iwPosition, 
		content : iwContent
	});
	infowindow.open(map, marker);
		
});

/* 함수선언 영역*/
(function($){
     aaa = function(){
	
     };
})(jQuery);
