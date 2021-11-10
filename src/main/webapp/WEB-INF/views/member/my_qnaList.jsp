<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.mainDiv{
	background-color: white;
}
.titleDiv{
	width: 100%;
	margin: 0 auto;
	padding-top: 10px;
	padding-bottom: 5px;
	margin-bottom: 15px;
	background-color: white;
}
.table{
	width: 100%;
}
.titleA:hover{
	color: black;
	text-decoration: underline;
	font-weight: bold;
}
.answerCnt{
	padding-left: 10px;
	color: gray;
	font-size: small;
}
.complete {
	color: gray;
	font-size: 14px;
	text-decoration: underline 1px gray;
	vertical-align: baseline;
}
</style>
</head>
<body>
<!-- <div class="row justify-content-center">
	<div class="col-12" style="background-color: white;"> -->
		<!-- <h2 class="text-first fw-bold">나의 도서관</h2>
		<hr> -->
	<!-- 제일 윗줄 -->
<%-- 		<div class="row mb-4" style="border-bottom: 2px solid #0b70b9 ;">
			<div class="col-6 text-start">
				<h3 style="font-weight: bold;">상담 / 문의 내역</h3>
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
		
		
		<!-- 테이블 시작 -->
		<div class="row justify-content-center">
			<div class="col-12 mb-4">
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
							<th class="table-secondary">제목</th>
							<th class="table-secondary">작성자</th>
							<th class="table-secondary">작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty qnaList}">
								<tr style="height: 200px;">
									<td colspan="4">등록된 글이 없습니다.</td>
								</tr>
							</c:when>
							
							<c:otherwise>
								<c:forEach items="${qnaList }" var="info" varStatus="status">
									<tr>
										<td>${status.count }</td>
										<td>
										<!-- 관리자 혹은 비밀번호가 없는 title 클릭하면 비밀번호 확인 없이 바로 detail로 이동 -->
											<a href="/board/qnaDetail?qnaCode=${info.qnaCode}&menuCode=${menuVO.menuCode}">${info.title }
												<c:if test="${info.answerCnt != 0}">
													<span class="m-2 complete">답변완료</span>
												</c:if>
											</a>	
										</td>
										<td>${info.name }</td>
										<td>${info.createDate }</td>
									</tr>
									</c:forEach>
								</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
		</div>
		<!-- 끝-->
		
		
		<!-- 민휘씨 테이블 스틸 -->
		<div class="tableDiv">
			<table class="table table-striped text-center">
				<thead>
					<tr>
						<th class="w-10">번호</th>
						<th class="w-60">제목</th>
						<th class="w-10">작성자</th>
						<th class="w-20">작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty qnaList}">
							<tr style="height: 200px;">
								<td colspan="4">등록된 글이 없습니다.</td>
							</tr>
						</c:when>
						
						<c:otherwise>
							<c:forEach items="${qnaList }" var="info" varStatus="status">
								<tr>
									<td>${status.count }</td>
									<td>
										<a href="/board/qnaDetail?qnaCode=${info.qnaCode}&menuCode=${menuVO.menuCode}">${info.title }
											<c:if test="${info.answerCnt != 0}">
												<span class="m-2 complete">답변완료</span>
											</c:if>
										</a>	
									</td>
									<td>${info.name }</td>
									<td>${info.createDate }</td>
								</tr>
								</c:forEach>
							</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>	
	</div>		
</div> --%>


<!-- ---------------------------------------------------------------민휘씨꺼--------------------------------------------------------------- -->
<div class="row justify-content-center">
   <div class="col-12 mainDiv">
   		<div class="titleDiv">
   			<h2 class="text-first fw-bold">문의 내역</h2>
			<hr>
   		</div>
			<div class="tableDiv">
					<table class="table table-striped text-center">
						<thead>
							<tr>
								<th class="w-10">번호</th>
								<th class="w-60">제목</th>
								<th class="w-10">작성자</th>
								<th class="w-20">작성일</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty qnaList}">
									<tr style="height: 200px;">
										<td colspan="4">등록된 글이 없습니다.</td>
									</tr>
								</c:when>
								
								<c:otherwise>
									<c:forEach items="${qnaList }" var="info" varStatus="status">
										<tr>
											<td>${status.count }</td>
											<td>
												<c:if test="${not empty info.qnaPw}">
													<img src="/resources/img/icon_secret.png" width="13px;"> 
												</c:if>
												<a class="titleA" href="/myPage/myQnaDetail?qnaCode=${info.qnaCode}&menuCode=${menuVO.menuCode}&id=${info.id}">${info.title }
													<c:if test="${info.answerCnt != 0}">
														<span class="m-2 complete">답변완료</span>
													</c:if>
												</a>	
											</td>
											<td>${info.name }</td>
											<td>${info.createDate }</td>
										</tr>
										</c:forEach>
									</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
				<!-- 문의 테이블 끝 -->
				
				<!-- 페이징 처리 -->
				<div class="col-12 pageDiv">
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">
							<c:if test="${memberVO.prev }">
								<li class="page-item">
									<a class="page-link" href="/myPage/myQnaList?nowPage=${memberVO.startPage - 1 }&menuCode=${menuVO.menuCode}" aria-label="Previous">
										<span aria-hidden="true">&laquo;</span>
									</a>
								</li>
							</c:if> 
							<c:forEach var="pageNum" begin="${memberVO.startPage }" end="${memberVO.endPage }">
								<li class="page-item  <c:if test="${memberVO.nowPage eq pageNum }">active</c:if>">
									<a class="page-link" href="/myPage/myQnaList?nowPage=${pageNum }&menuCode=${menuVO.menuCode}">${pageNum }</a>
								</li>
							</c:forEach>
							<c:if test="${memberVO.next }">
								<li class="page-item">
									<a class="page-link" href="/myPage/myQnaList?nowPage=${memberVO.endPage + 1 }&menuCode=${menuVO.menuCode}" aria-label="Next">
										<span aria-hidden="true">&raquo;</span>
									</a>
								</li>
							</c:if>
						</ul>
					</nav>
				</div>
			<!-- 페이징 끝 -->
			<div class="col-12 text-center">
				<button type="button" class="btn btn-secondary" onclick="history.back(0);">뒤로가기</button>
			</div>
			
	</div>
</div>						
</body>
</html>