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
}
</style>
</head>
<body>
<div class="row justify-content-center">
	<div class="col-12" style="background-color: white;">
	<!-- 제일 윗줄 -->
		<h2 class="text-first fw-bold">자료 현황</h2>
		<hr>
<%-- 		<div class="row mb-4" style="border-bottom: 2px solid #0b70b9 ;">
			<div class="col-6 text-start">
				<h3 style="font-weight: bold;">자료 현황</h3>
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
	
		<!-- 도서현황 -->
		<div class="row justify-content-center mb-2">
			<div class="col-6 text-start">
				도서 현황
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
		
		
		<!-- 비도서 현황 -->
		<div class="row justify-content-center mb-2">
			<div class="col-6 text-start">
				비도서 현황
			</div>
			<div class="col-6 text-end">
				${bookLastUpdate }기준(단위 : 권) <!-- 새로운책 입력하면 갱신됩니당 -->
			</div>
		</div>
		<!-- 비도서 현황 테이블 -->
		<div class="row justify-content-center mb-4">
			<div class="col text-center">
				<table class="table">
					<thead class="table-secondary">
			 			<tr>
			 				<th>DVD</th>
			 				<th>기타</th>
			 				<th>계</th>
						</tr>
					<tbody>	
						<tr>
							<td>0</td>
							<td>0</td>
							<td>0</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		
		<!-- 연속간행물 현황 -->
		<div class="row justify-content-center mb-2">
			<div class="col-6">
				연속간행물 현황
			</div>
			<div class="col-6 text-end">
				${bookLastUpdate }기준(단위 : 권) <!-- 새로운책 입력하면 갱신됩니당 -->
			</div>
		</div>
		<!-- 비도서 현황 테이블 -->
		<div class="row justify-content-center">
			<div class="col text-center">
				<table class="table">
					<thead class="table-secondary">
			 			<tr>
			 				<th rowspan="2">구분</th>
			 				<th rowspan="2">계</th>
			 				<th colspan="3">연속간행물</th>
			 				<th colspan="3">신문</th>
						</tr>
						<tr>
							<th>국내</th>
							<th>국외</th>
							<th>전자</th>
							<th>국내</th>
							<th>국외</th>
							<th>전자</th>
						</tr>
					<tbody>	
						<tr>
							<th>간행물</th>
							<td>0</td>
							<td>0</td>
							<td>0</td>
							<td>0</td>
							<td>0</td>
							<td>0</td>
							<td>0</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	
	</div>
</div>
</body>
</html>