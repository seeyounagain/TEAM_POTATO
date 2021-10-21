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
	width: 90%;
	margin-top: 20px;
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
<!-- 큰 div 안에 도서현황div과 테이블div넣음.위에껀 쌩테이블 아래껀은 부트스트랩테이블 -->
<div class="container">
	<!-- 제일 윗줄 -->
	<div class="row titleDiv">
		<div class="col-6">
			<h5>자료 현황</h5>
		</div>
		<!-- 자료현황 화면 우측위에 글자 클릭시 이동 
			menu.jsp에서 menuVO.menuCode 랑 sideMenuVO.sideMenuCode 데이터 들고옴
			side
			-->
		<div class="col-6 text-end" style="font-size: 14px;">
			<p>
				<a href="/common/main">
					홈 >
				</a>&nbsp;
					<c:forEach items="${menuList }" var="menu">
						<c:if test="${menuVO.menuCode eq menu.menuCode }">
							<a href="/${menu.menuUri }/locaInfo?menuCode=${menuVO.menuCode}"> <!-- 이거 uri 어카누...아 -->
							${menu.menuName } >
							</a>&nbsp;
						</c:if>
					</c:forEach>
				<a>
					<c:forEach items="${sideMenuList }" var="sideMenu">
						<c:if test="${sideMenuVO.sideMenuCode eq sideMenu.sideMenuCode }">
							${sideMenu.sideMenuName } >
						</c:if>
					</c:forEach>
				</a>
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
			<thead class="table-dark">
	 			<tr>
					<c:forEach items="${bookCateList }" var="bookCate">
						<td>${bookCate.kdcName}</td>
					</c:forEach>
					<td>합계</td>	
				</tr>
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
			<thead class="table-dark">
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
			<thead class="table-dark">
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