<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="row justify-content-center">
	<div class="col-10" style="background-color: white;">
	<!-- 제일 윗줄 -->
		<div class="row mb-4" style="border-bottom: 2px solid #0b70b9 ;">
			<div class="col-6 text-start">
				<h3 style="font-weight: bold;">대출 / 예약 현황</h3>
			</div>
			<div class="col-6 text-end" style="font-size: 14px;">
				<p>
					<a href="/common/main">
						홈 >
					</a>&nbsp;
						<c:forEach items="${menuList }" var="menu">
							<c:if test="${menuVO.menuCode eq menu.menuCode }">
								<a href="/${menu.menuUri }/myPage?menuCode=${menuVO.menuCode }&sideMenuCode=myPage">
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
		</div>
		<!-- 타이틀 끝 -->
		
		
		<!-- 대출내역 테이블 시작 -->
		<div class="row justify-content-center">
			<div class="col-12 mb-4">
				<div class="co-12">대출 현황</div>
				<table class="table table-hover text-center mt-2" style="border-top: 2px solid #0b70b9;">
					<colgroup>
						<col width="10%">
						<col width="30%">
						<col width="20%">
						<col width="40%">
					</colgroup>
					<thead>
						<tr>
							<th class="table-secondary">번호</th>
							<th class="table-secondary">대출한책</th>
							<th class="table-secondary">대출일</th>
							<th class="table-secondary">반납일</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty rentalList}">
								<tr style="height: 100px;">
									<td colspan="4">대출 기록이 없습니다.</td>
								</tr>
							</c:when>
							
							<c:otherwise>
								<c:forEach items="${rentalList }" var="rental" varStatus="status">
									<tr>
										<td>${status.count }</td>
										<td>
											<a href="#&menuCode=${menuVO.menuCode}">${rental.bookVO.title }</a>	
										</td>
										<td>${rental.rentalDate }</td>
										<c:choose>
											<c:when test="${rental.returnDate eq '년월일'}">
												<td>대출중(${rental.limitDate }까지 반납해주세요)<td>
											</c:when>
											<c:otherwise>
												<td>${rental.returnDate }</td>
											</c:otherwise>
										</c:choose>
									</tr>
									</c:forEach>
								</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
		</div>
		<!-- 대출내역 테이블 끝 -->
		
		
		<!-- 예약 현황 -->
		<div class="row justify-content-center">
			<div class="col-10 mb-4">
				<table class="table table-hover text-center mt-2" style="border-top: 2px solid #0b70b9;">
					<colgroup>
						<col width="10%">
						<col width="60%">
						<col width="10%">
						<col width="20%">
					</colgroup>
					<thead>
						<tr>
							<th class="table-secondary">번호</th>
							<th class="table-secondary">예약한책</th>
							<th class="table-secondary">예약예정일</th>
							<th class="table-secondary">책 상태</th>
						</tr>
					</thead>
					<tbody>
						<%-- <c:choose>
							<c:when test="${empty rentalList}">
								<tr style="height: 100px;">
									<td colspan="4">예약 중인 책이 없습니다</td>
								</tr>
							</c:when>
							
							<c:otherwise>
								<c:forEach items="${rentalList }" var="rental" varStatus="status">
									<tr>
										<td>${status.count }</td>
										<td>
											<a href="#&menuCode=${menuVO.menuCode}">${info.bookCode }</a>	
										</td>
										<td>${rental.rentalDate }</td>
										<td>${rental.limitDate }</td>
									</tr>
									</c:forEach>
								</c:otherwise>
						</c:choose> --%>
					</tbody>
				</table>
			</div>
		</div>












		
	</div>
</div>



</body>
</html>