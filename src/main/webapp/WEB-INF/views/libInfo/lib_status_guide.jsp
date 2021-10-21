<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.container{
	width: 100%;
	margin-top: 20px;
	background: aqua;
}

.titleDiv {
	background-color: white;
	margin-bottom: 20px;
}
.tableTitleDiv{
	background-color: white;
	margin-bottom: 5px;
}
.bookCateTableDiv{
	background-color: white;
	margin-bottom: 20px;
}
</style>
</head>
<body>
<div class="container">
	<!-- 제일 윗줄 -->
	<div class="row titleDiv" style="border-bottom: 2px solid #0b70b9 ;">
		<div class="col-6">
			<h3 style="font-weight: bold;">자료 현황</h3>
		</div>
		<!-- 자료현황 화면 우측위에 글자 클릭시 이동 
			menu.jsp에서 menuVO.menuCode 랑 sideMenuVO.sideMenuCode 데이터 들고옴
			sideMenu.jsp에서도 들고옴(아직안들고옴)
			-->
		<div class="col-6 text-end" style="font-size: 14px;">
			<p>
				<a href="/common/main">
					홈 >
				</a>&nbsp;
					<c:forEach items="${menuList }" var="menu">
						<c:if test="${menuVO.menuCode eq menu.menuCode }">
							<a href="/${menu.menuUri }/locaInfo?menuCode=${menuVO.menuCode }&sideMenuCode=${sideMenuVO.sideMenuCode }"> <!-- 이거 uri 어카누...아 -->
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
	<!-- 도서현황 -->
	<div class="row tableTitleDiv">
		<div class="col-6">
			도서 현황
		</div>
		<div class="col-6 text-end">
			${bookLastUpdate }기준(단위 : 권) <!-- 새로운책 입력하면 갱신됩니당 -->
		</div>
	</div>
	<!-- 도서현황 테이블 -->
	<div class="bookCateTableDiv text-center">
		<table class="table">
			<thead class="table-secondary">
	 			<tr>
					<c:forEach items="${bookCateList }" var="bookCate">
						<td>${bookCate.kdcName}</td>
					</c:forEach>
					<td>합계</td>	
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
	
	
	<!-- 비도서 현황 -->
	<div class="row tableTitleDiv">
		<div class="col-6">
			비도서 현황
		</div>
		<div class="col-6 text-end">
			${bookLastUpdate }기준(단위 : 권) <!-- 새로운책 입력하면 갱신됩니당 -->
		</div>
	</div>
	<!-- 비도서 현황 테이블 -->
	<div class="bookCateTableDiv text-center">
		<table class="table">
			<thead class="table-secondary">
	 			<tr>
	 				<td>DVD</td>
	 				<td>기타</td>
	 				<td>계</td>
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
	
	
	<!-- 연속간행물 현황 -->
	<div class="row tableTitleDiv">
		<div class="col-6">
			연속간행물 현황
		</div>
		<div class="col-6 text-end">
			${bookLastUpdate }기준(단위 : 권) <!-- 새로운책 입력하면 갱신됩니당 -->
		</div>
	</div>
	<!-- 비도서 현황 테이블 -->
	<div class="bookCateTableDiv text-center">
		<table class="table">
			<thead class="table-secondary">
	 			<tr>
	 				<td rowspan="2">구분</td>
	 				<td rowspan="2">계</td>
	 				<td colspan="3">연속간행물</td>
	 				<td colspan="3">신문</td>
				</tr>
				<tr>
					<td>국내</td>
					<td>국외</td>
					<td>전자</td>
					<td>국내</td>
					<td>국외</td>
					<td>전자</td>
				</tr>
			<tbody>	
				<tr>
					<td scope="row">간행물</td>
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
</body>
</html>