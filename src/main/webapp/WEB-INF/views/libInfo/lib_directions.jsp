<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 맨 윗줄 -->
<div class="row" style="border-bottom: 2px solid #dddddd;">
	<div class="col-6">
		찾아오시는길
	</div>
	<div class="col-6 text-end">
		홈 > 도서관 소개 > 찾아오시는 길
	</div>
</div>

<!-- 지도 칸 -->
<div class="row">
	<div class="col">
		여기 넣을수 있으면 지도 넣고
		<!-- 지도 넣을 div만듬 id는 map으로 해야됨 -->
		<div id="map" style="width:100%; height:300px;">
		<!-- 지도를 불러올 스크립트appkey는 받은거 불러와야됨 카카오개발자사이트 참고 -->
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1f504c174530a2ab6c9cf1f6e2b5b488"></script>
		<script type="text/javascript">
			var container = document.getElementById('map');
			var options = {
				center: new kakao.maps.LatLng(35.532810, 129.344748),//지도의 중심 좌표
				level: 3//확대 레벨
			};
		
			var map = new kakao.maps.Map(container, options);//지도 생성
			
			//지도 우측 확대 축소 컨트롤생성
			var zoomControl = new kakao.maps.ZoomControl();
			//지도 우측 확대 축소 컨트롤추가
			map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
			
			//지도에 표시할 마커 생성
	 		var marker = new kakao.maps.Marker({
				map: map, //마커를 표시할 지도(id가 map라 map인듯?)
				position: new kakao.maps.LatLng(35.532810, 129.344748)//마커를 표시할 위치
			});

		</script>
		</div>
	</div>
</div>
		<div>
			<button class="btn_zoom_reset hide_text">
				<span class="img_zoom"></span>
			</button>
		</div>

<!-- 지도 아래 위치칸 -->
<div class="row">
	<div class="col">
		위치
		<ul>
			<li>도로명주소 : 울산광역시 남구 꽃대나리로 140(여천동)<li>
			<li>지번주소 : 울산광역시 남구 여천동 1456</li>
		</ul>
	</div>
</div>

<!-- 위치 아래 주차장안내칸 -->
<div class="row">
	<div class="col">
				주차장안내
				<ul>
					<li>도보나 대중교통을 이용해 주시기 바랍니다.</li>
					<li>개방시간 : 09:00 ~21:00</li>
					<li>주차요금
						<div class="parkingTableDiv1 text-center">
							<table>
								<colgroup>
									<col style="width: 33.3%">
									<col style="width: 33.3%">
									<col style="width: 33.3%">
								</colgroup>
								<thead>
									<tr>
										<th>기본(1시간 이내)</th>
										<th>기본초과 1시간 단위</th>
										<th>1일 최대</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>무료</td>
										<td>500원</td>
										<td>3,000원</td>
									</tr>
								</tbody>
							</table>
						</div>
					</li>
					<li>할인 및 면제대상
						<div class="parkingTableDiv2 text-center">
						개똥같은 css 못해먹겠네 아오 씨 안해
						</div>
					</li>
				</ul>
			</div>
		</div>


</body>
</html>