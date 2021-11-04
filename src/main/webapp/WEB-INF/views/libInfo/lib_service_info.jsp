<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table td{
	border: 1px solid #dddddd;
}
.table th{
	background: #e2e3e5;
	border-color: #000000;
}
.lib_service_info li{
	margin-bottom: 10px;
}
</style>
</head>
<body>
<div>
<c:forEach items="${menuList }" var="menu">
</c:forEach>
</div>
<div class="row lib_service_info justify-content-center">
	<div class="col-122" style="background-color: white;">
	
	<!-- 제일 윗줄 -->
		<h2 class="text-first fw-bold">이용 안내</h2>
		<hr>
<%-- 		<div class="row mb-4" style="border-bottom: 2px solid #0b70b9 ;">
			<div class="col-6 text-start">
				<h3 style="font-weight: bold;">이용 안내</h3>
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
		<!-- 자료현황 -->
		<!-- 도서현황 -->
		<div class="row justify-content-center mb-2 mt-4">
			<div class="col-6 text-start">
				<h5>도서현황</h5>
			</div>
			<div class="col-6 text-end">
				${bookLastUpdate }기준(단위 : 권) <!-- 새로운책 입력하면 갱신됩니당 -->
			</div>
		</div>
		<!-- 도서현황 테이블 -->
		<div class="row justify-content-center mb-4">
			<div class="col text-center">
				<table class="table" style="border-top: #0b70b9;">
					<thead class="table-secondary">
			 			<tr>
							<c:forEach items="${bookCateList }" var="bookCate">
								<th>${bookCate.kdcName}</th>
							</c:forEach>
							<th>합계</th>	
						</tr>
					</thead>
					<tbody>	
						<tr>
							<c:forEach items="${bookCateList }" var="bookCate">
								<td>${bookCate.kdcCnt }</td>
							</c:forEach>
							<td>${totalBookCnt }</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		
		
		
		
		<!-- 이용 시간 -->
		<div class="row mb-4">
			<div class="col">
				<h5>이용시간</h5>
					<ul>
					<li>-휴관일 : 없음</li>
					<li>-시설이용
						<div class="text-center">
							<table class="table mt-2">
								<colgroup>
									<col width="10%">
									<col width="20%">
									<col width="35%">
									<col width="35%">
								</colgroup>
								<thead class="table-secondary">
						 			<tr>
						 				<th>구분</th>
						 				<th>실명</th>
						 				<th>내용</th>
						 				<th>이용시간</th>
									</tr>
								<tbody>	
									<tr>
										<th>1층</th>
										<td>어린이자료실</td>
										<td>아동도서/유아도서/동화구연/인터넷 및 DVD</td>
										<td>월요일 ~ 일요일 09:00 ~ 18:00</td>
									</tr>
									<tr>
										<th rowspan="3">2층</th>
										<td>종합자료실1</td>
										<td>문학/도서전문/교양도서/정기간행물/인터넷 및 DVD</td>
										<td>화요일 ~ 일요일 09:00 ~ 20:00</td>
									</tr>
									<tr>
										<td>종합자료실2</td>
										<td>문학/도서전문/교양도서/정기간행물/인터넷 및 DVD</td>
										<td>화요일 ~ 일요일 09:00 ~ 20:00</td>
									</tr>
									<tr>
										<td>열람실</td>
										<td>학습공간</td>
										<td>화요일 ~ 일요일 09:00 ~ 22:00</td>
									</tr>
								</tbody>
							</table>
						</div>
					</li>
				</ul>
			</div>
		</div>
		<!-- 시설이용 끝 -->
	
	
		<!-- 열람실 사용안내 -->
		<div class="row mb-4">
			<div class="col">
				<h5>열람실 사용안내</h5>
					<ul>
						<li>
							-방문시 누구나 이용가능
						</li>
						<li>
							<a href="/service/readingSeat?menuCode=${menuList[2].menuCode }">※클릭시 열람실 좌석현황 페이지로 이동합니다.</a>
						</li>
					</ul>
			</div>
		</div>
		<!-- 열람실 사용안내 끝 -->
		
		
		<!-- 대출 안내 -->
		<div class="row mb-4">
			<div class="col">
				<h5>대출 안내</h5>
					<ul>
						<li>
							-대출 권수 : 1인 3권
						</li>
						<li>
							-대출 기간 : 7일
						</li>
						<li>
							-자료의 대출 및 반납 시에는 반드시 신분증을 제시하여야 합니다.
						</li>
						<li>
							<c:if test="${not empty sessionScope.loginInfo and sessionScope.loginInfo.isAdmin eq 'N' }">
								<a href="/myPage/myLibrary?menuCode=${menuList[4].menuCode }">※클릭시 대출 현황 조회 페이지로 이동합니다</a>
							</c:if>
							<c:if test="${not empty sessionScope.loginInfo and sessionScope.loginInfo.isAdmin eq 'Y' }">
								<a href="/libManage/bookManage?menuCode=${menuList[4].menuCode }">※클릭시 대출 현황 조회 페이지로 이동합니다</a>
							</c:if>
							<c:if test="${empty sessionScope.loginInfo }">
								<a href="/member/memberLoginForm">※클릭시 대출 현황 조회 페이지로 이동합니다</a>
							</c:if>
								
							
						</li>
					</ul>
			</div>
		</div>
		<!-- 대출 안내 끝 -->
		
		<!-- 예약 안내 -->
		<div class="row mb-4">
			<div class="col">
				<h5>예약 안내</h5>
					<ul>
						<li>
							-원하는 도서가 대출되었을 경우 인터넷 또는 직접 방문하여 예약신청 가능 (도서예약은 1인 2권, 1권당 1명까지 가능)
						</li>
						<li>
							-예약도서처리 : 대출도서가 반납되면 알림메세지로 통보
						</li>
						<li>
							-예약유효기간 : 알림메세지 통보일로부터 3일
						</li>
					</ul>
			</div>
		</div>
		<!-- 예약 안내 끝 -->
	</div>		
</div>
</body>
</html>