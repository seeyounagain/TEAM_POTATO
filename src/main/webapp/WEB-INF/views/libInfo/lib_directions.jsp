<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1f504c174530a2ab6c9cf1f6e2b5b488"></script>
<script type="text/javascript" src="/resources/libInfo/js/lib_directions.js?ver=9"></script>
<style type="text/css">
table td{
	border: 1px solid #dddddd;
	
}
.lib_drections li{
	margin-bottom: 10px;
}
.parkingTableDiv2 tr > td:last-child{
	text-align: left;
}
.busTableDiv1 tr > td:last-child{
	text-align: left;
}
.busTableDiv2 tr > td:last-child{
	text-align: left;
}
</style>
</head>
<body>
<div class="row lib_drections justify-content-center">
	<div class="col-12" style="background-color: white;">
			
	<!-- 제일 윗줄 -->
		<h2 class="text-first fw-bold">찾아오시는길</h2>
		<hr>
	<%-- 	<div class="row mb-4" style="border-bottom: 2px solid #0b70b9 ;">
			<div class="col-6 text-start">
				<h3 style="font-weight: bold;">찾아오시는길</h3>
			</div>
			<!-- 자료현황 화면 우측위에 글자 클릭시 이동 
				menu.jsp에서 menuVO.menuCode 랑 sideMenuVO.sideMenuCode 데이터 들고옴
				sideMenu.jsp에서도 들고옴
				-->
			<div class="col-6 text-end" style="font-size: 14px;">
				<p>
					<a href="/common/main">
						홈 >
					</a>&nbsp;
					<c:forEach items="${menuList }" var="menu">
						<c:if test="${menuVO.menuCode eq menu.menuCode }">
							<a href="/${menu.menuUri }/${sideMenuList[0].sideMenuUri }?menuCode=${menuVO.menuCode }&sideMenuCode=${sideMenuList[0].sideMenuCode }"> 
								${menu.menuName } >
							</a>&nbsp;
						</c:if>
					</c:forEach>
					<c:forEach items="${sideMenuList }" var="sideMenu">
						<c:if test="${sideMenuVO.sideMenuCode eq sideMenu.sideMenuCode }">
							<a href="/${sideMenu.menuUri }/${sideMenu.sideMenuUri }?menuCode=${menuVO.menuCode }&sideMenuCode=${sideMenuVO.sideMenuCode }">
								${sideMenu.sideMenuName } >
							</a>
						</c:if>
					</c:forEach>
				<p>
			</div>
		</div> --%>
<!-- 타이틀 끝 -->

<!-- 지도 칸 -->
		<div class="row mb-4">
			<div class="col">
				<!-- 지도 넣을 div만듬-->
				<div id="map1" style="width:100%; height:300px;"></div>
			</div>
		</div>
<!-- 지도 끝 -->

<!-- 지도 아래 위치칸 -->
		<div class="row mb-4">
			<div class="col">
				<h5>위치</h5>
				<ul>
					<li>도로명주소 : 울산 남구 삼산로29번길 19-1<li>
					<li>지번주소 : 울산 남구 신정동 680-1</li>
				</ul>
			</div>
		</div>
<!-- 위치 끝 -->

<!-- 위치 아래 주차장안내칸 -->
		<div class="row mb-4">
			<div class="col">
				<h5>주차장안내</h5>
				<ul>
					<li>도보나 대중교통을 이용해 주시기 바랍니다.</li>
					<li>개방시간 : 09:00 ~21:00</li>
					<li>주차요금
						<!-- 주차장 테이블 -->
						<div class="parkingTableDiv1 text-center">
							<table class="table mt-2 mb-4">
								<colgroup>
									<col width="33.3%">
									<col width="33.3%">
									<col width="33.3%">
								</colgroup>
								<thead class="table-secondary">
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
						<div class="parkingTableDiv2">
							<table class="table text-center mt-2">
								<colgroup>
									<col width="35%">
									<col width="65%">
								</colgroup>
								<thead class="table-secondary">
									<tr>
										<th>할인·면제</th>
										<th>대상</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>할인(50%)</td>
										<td>
											<ul>
												<li>-장애인등록증을 소지한 자</li>
												<li>-국가유공자증서를 소지한 자</li>
												<li>-고엽제후유증 등에 관한 국가보훈처장이 발행한 차량표지를 부착한 자</li>
												<li>-민주화운동부상자로서 5·18민주유공자증을 소지한 자</li>
												<li>-경형 자동차, 환경친화적 자동차를 운전하는 자</li>
											</ul>
										</td>
									</tr>
									<tr>
										<td>면제</td>
										<td>
											<ul>
												<li>-긴급자동차</li>
												<li>-관용차량, 공무수행차량, 언론기관 명(로고)이 부착된 취재차량</li>
												<li>-1시간 이내 주차한 차량</li>
												<li>-도서관과 용역 및 임대차 계약을 체결한 입주업체 업무수행 차량</li>
												<li>-도서관 직원, 자원봉사자 차량</li>
											</ul>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</li>
					<li>
						※ 주차요금을 할인받고자 하는 경우에는 관련서류를 구비하여 주차요원에게 제시하여 주시기 바랍니다.
					</li>
					<li>
						※ 삼성페이 및 50% 할인은 무인정산 불가하오니 출차 시 주차요원을 통해 정산하여 주시기 바랍니다.
					</li>
				</ul>
			</div>
		</div>
		<!-- 주차장안내 div 끝 -->
		
		
		<!-- 버스안내 -->
		<div class="row">
			<div class="col">
				<div class="col">
					<h5>시내버스 이용안내</h5>
				</div>
				<!-- 버스안내 테이블 -->
				<div class="col busTableDiv1">
					<ul>
						<li>
							<table class="table text-center mt-4">
								<colgroup>
									<col width="20%">
									<col width="20%">
									<col width="60%">
								</colgroup>
								<thead class="table-secondary">
									<tr>
										<th>정류소명</th>
										<th>버스번호</th>
										<th>주요노선</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td rowspan="7">공업탑</td>
										<td>107</td>
										<td>꽃바위-학성공원-공업탑-태화강역</td>
									</tr>
									<tr>
										<td>257</td>
										<td>농소차고지-중구청-고속터미널-태화강역</td>
									</tr>
									<tr>
										<td>407</td>
										<td>율리-성남동-학성공원-고속터미널-태화강역</td>
									</tr>
									<tr>
										<td>713</td>
										<td>쌍용하나빌리지-신복로터리-공업탑-시청-고속터미널-태화강역</td>
									</tr>
									<tr>
										<td>724</td>
										<td>산현-신복로터리-공업탑-시청-학성공원-고속터미널 -태화강역</td>
									</tr>
									<tr>
										<td>744</td>
										<td>한솔그린빌-공업탑-시청-학성공원-고속터미널-태화강역</td>
									</tr>
									<tr>
										<td>927(지선)</td>
										<td>현대백화점-아데라움아파트-이마트-현대백화점</td>
									</tr>
									<tr>
										<td rowspan="2">롯데마트방향<br></td>
										<td>701</td>
										<td>월성원자력-북구청-고속터미널-울산세무서-태화강역</td>
									</tr>
									<tr>
										<td>702</td>
										<td>매곡-북구청-고속터미널-울산세무서-태화강역</td>
									</tr>
									<tr>
										<td rowspan="5">MG새마을금고<br>(도보 10분)</td>
										<td>246</td>
										<td>연암—병영사거리-고속터미널-시외터미널-연암</td>
									</tr>
									<tr>
										<td>1401</td>
										<td>율리-신복로터리-공업탑-고속터미널-시외터미널-꽃바위</td>
									</tr>
									<tr>
										<td>920(지선)</td>
										<td>현대백화점-고속터미널-시외터미널-한라훼미리</td>
									</tr>
									<tr>
										<td>926(지선)</td>
										<td>현대백화점-고속터미널-시외터미널-태광산업</td>
									</tr>
									<tr>
										<td>976(지선)</td>
										<td>현대백화점-시외터미널-선암복지관</td>
									</tr>
									<tr>
										<td rowspan="3">달동사거리<br>(도보 10분)</td>
										<td>910(지선)</td>
										<td>농수산물유통센터-종합운동장-보람병원-고속터미널</td>
									</tr>
									<tr>
										<td>922(지선)</td>
										<td>신정홈타운-롯데마트-시청-고속터미널</td>
									</tr>
									<tr>
										<td>923(지선)</td>
										<td>선암복지관-달동사거리-보람병원-고속터미널</td>
									</tr>
								</tbody>
							</table>
						</li>
					</ul>
				</div>
				<!-- busTableDiv 끝 -->
				<div class="col busTableDiv2">
					<ul>
						<li>
				
							<table class="table text-center mt-2">
								<colgroup>
									<col width="20%">
									<col width="20%">
									<col width="60%">
								</colgroup>
								<thead class="table-secondary">
									<tr>
										<th>정류소명</th>
										<th>주요방면</th>
										<th>버스번호</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td rowspan="10">신정2동주민센터<br>(도보 10분)</td>
										<td>신복로터리</td>
										<td>124,307,401,417,453,482,712,733,743,1713,1723</td>
									</tr>
									<tr>
										<td>공업탑</td>
										<td>124,134,307,401,417,453,482,527,537,705733,743,847,1137,1703,1713,1723</td>
									</tr>
									<tr>
										<td>시청</td>
										<td>127,147,357,708,728,807,837</td>
									</tr>
									<tr>
										<td>울산역</td>
										<td>357,807,1703</td>
									</tr>
									<tr>
										<td>성안</td>
										<td>108,827,837,847</td>
									</tr>
									<tr>
										<td>덕신</td>
										<td>527,537</td>
									</tr>
									<tr>
										<td>남창</td>
										<td>705</td>
									</tr>
									<tr>
										<td>언양, 범서</td>
										<td>307,327,357,728,733,743</td>
									</tr>
									<tr>
										<td>다운동</td>
										<td>708,718</td>
									</tr>
									<tr>
										<td>꽃바위</td>
										<td>108,126,127</td>
									</tr>
								</tbody>
							</table>
						</li>
						<li>
							※ 환승안내 : 공업탑, 시청, 학성공원 등에 하차 후 울산도서관 정류소 경유 시내버스로 환승가능
						</li>
					</ul>
				</div>
				<!-- busTableDiv2끝 -->
			</div>
		</div>
	<!-- 버스안내 div 끝 -->	
	</div>
</div>


</body>
</html>