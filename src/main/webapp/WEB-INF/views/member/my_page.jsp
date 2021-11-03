<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 나의도서관 member폴더 -> my_lib.jsp 추가 --봉 -->
<div class="row justify-content-center">
	<div class="col-12" style="background-color: white;">
		<h2 class="text-first fw-bold">나의 도서관</h2>
		<hr>
	<!-- 제일 윗줄 -->
<%-- 		<div class="row mb-4" style="border-bottom: 2px solid #0b70b9 ;">
			<div class="col-6 text-start">
				<h3 style="font-weight: bold;">나의 도서관</h3>
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
		</div> --%>
		<!-- 타이틀 끝 -->
		
		
		<div class="row mb-2">
			<div class="col-3" style="border-bottom: 1px solid  #e2e3e5;">
				<h5>나의 도서관 현황</h5>
			</div>
		</div>
		<!-- 대여현황 테이블 -->
		<div class="row justify-content-center text-center mb-4 mt-4">	
			<div class="col-8">
				<table class="table table-borderless">
					<colgroup>
						<col width="33.3%">
						<col width="33.3%">
						<col width="33.3%">
					</colgroup>
					<thead>
						<tr>
							<td><a href="/myPage/myLibrary?menuCode=${menuVO.menuCode }&sideMenuCode=SIDE_MENU_012"><img width="120px;" src="/resources/img/대출.png"></a></td>
							<td><a href="/myPage/myLibrary?menuCode=${menuVO.menuCode }&sideMenuCode=SIDE_MENU_012"><img width="120px;" src="/resources/img/예약.png"></a></td>
							<td><a href="/myPage/myLibrary?menuCode=${menuVO.menuCode }&sideMenuCode=SIDE_MENU_012"><img width="120px;" src="/resources/img/반납.png"></a></td>
						</tr>
						<tr>
							<th><a href="/myPage/myLibrary?menuCode=${menuVO.menuCode }&sideMenuCode=SIDE_MENU_012">대여중</a></th>
							<th><a href="/myPage/myLibrary?menuCode=${menuVO.menuCode }&sideMenuCode=SIDE_MENU_012">예약중</a></th>
							<th><a href="/myPage/myLibrary?menuCode=${menuVO.menuCode }&sideMenuCode=SIDE_MENU_012">반납</a></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><a href="/myPage/myLibrary?menuCode=${menuVO.menuCode }&sideMenuCode=SIDE_MENU_012">${memberBookSituationCnt.rentalCnt }</a></td>
							<td><a href="/myPage/myLibrary?menuCode=${menuVO.menuCode }&sideMenuCode=SIDE_MENU_012">${memberBookSituationCnt.reserveCnt }</a></td>
							<td><a href="/myPage/myLibrary?menuCode=${menuVO.menuCode }&sideMenuCode=SIDE_MENU_012">${memberBookSituationCnt.returnCnt }</a></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<!-- 끝 -->
				
				
		<!-- 도서관련 -->
		<div class="row mb-4">
			<div class="col-3 mb-2" style="border-bottom: 1px solid  #e2e3e5;">
				<h3>도서관련</h3>
			</div>
			<div class="col-12 mb-2">
				<a href="/myPage/myLibrary?menuCode=${menuVO.menuCode }&sideMenuCode=SIDE_MENU_012">대출내역</a>
			</div>
			<div class="col-12">
				<a href="/myPage/myLibrary?menuCode=${menuVO.menuCode }&sideMenuCode=SIDE_MENU_012">예약현황</a>
			</div>
		</div>
	
		<!-- 도서관련끝 -->
		
		
		<!-- 회원관련 -->
		<div class="row mb-4">
			<div class="col-3 mb-2" style="border-bottom: 1px solid  #e2e3e5;">
				<h3>회원관련</h3>
			</div>
			<div class="col-12 mb-2">
				<a href="/myPage/myInfo?menuCode=${menuVO.menuCode }&sideMenuCode=SIDE_MENU_011">내정보</a>
			</div>
			<div class="col-12">
				<a href="/myPage/myQnaList?menuCode=${menuVO.menuCode }&sideMenuCode=SIDE_MENU_015">문의내역</a>
			</div>
		</div>
		<!-- 회원관련끝 -->
	</div>		
</div>
</body>
</html>