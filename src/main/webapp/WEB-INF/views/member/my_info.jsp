<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/member/js/my_info.js?ver=14"></script>
</head>
<body>
<div class="row justify-content-center">
	<div class="col-10" style="background-color: white;">
	<!-- 제일 윗줄 -->
		<div class="row mb-4" style="border-bottom: 2px solid #0b70b9 ;">
			<div class="col-6 text-start">
				<h3 style="font-weight: bold;">내정보</h3>
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
		</div>
				<!-- 타이틀 끝 -->
				<input type="radio" checked>
			<c:choose>
				<c:when test="">
				
				</c:when>
				<c:when test="">
				
				</c:when>
				<c:otherwise>
				
				</c:otherwise>
			</c:choose>
		
		<!-- 아이작스로 하위태크 지우기 위해 추가 -->
		<div class="row">
			<div class="col" id="ajaxStart">
	
				<!-- 내 정보 -->
				<div class="row justify-content-center">
					<div class="col-10 mb-4">
						<h3>개인정보</h3>
						<table class="table mt-2" style="border-top: 2px solid #0b70b9;">
							<colgroup>
								<col width="20%">
								<col width="80%">
							</colgroup>
								<tr>
									<td class="table-secondary">이름</td>
									<td id="name">${memberInfo.name }</td>
								</tr>
								<tr>
									<td class="table-secondary">성별</td>
									<td id="gender">${memberInfo.gender }</td>
								</tr>
						</table>
					</div>
				</div>
				<!-- 내정보 테이블 끝 -->
				
				<input type="radio" name="gender">
					<!-- 내 정보 -->
				<div class="row justify-content-center">
					<div class="col-10 mb-4">
						<h3>회원정보</h3>
						<table class="table mt-2" style="border-top: 2px solid #0b70b9;">
							<colgroup>
								<col width="20%">
								<col width="80%">
							</colgroup>
								<tr>
									<td class="table-secondary">아이디</td>
									<td id="id">${memberInfo.id }</td>
								</tr>
								<tr>
									<td class="table-secondary">휴대전화</td>
									<td id="tell">${memberInfo.tell }</td>
								</tr>
								<tr>
									<td class="table-secondary">주소</td>
									<td id="addr">${memberInfo.addr }</td>
								</tr>
								<tr>
									<td class="table-secondary">관심카테고리</td>
									<td>${memberInfo.favorite }</td>
								</tr>
						</table>
					</div>
				</div>
				<!-- 내정보 테이블 끝 -->
				
				<!-- 수정버튼 -->
				<div class="row  justify-content-center">
					<div class="col-2 d-grid">
						<button type="submit" id="changeBtn" class="btn btn-primary">수정하기</button>
					</div>
				</div>
				<!-- 수정버튼 끝 -->
			</div>
		</div>
	</div>
</div>
</body>