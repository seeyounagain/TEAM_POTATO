<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/search/js/search_form.js?ver=1" ></script>
<script type="text/javascript" src="/resources/service/js/recommendDetail.js?ver=1" ></script>


<style type="text/css">
#topBtn{
	position: fixed;
	right: 25px; 
	bottom: 25px;
	display: none;
	z-index: 9;
}
</style>
</head>
<body>
<h2 class="text-first fw-bold">추천도서</h2>
<hr>
	<div class="row">
		<div class="col-3">
			<div class="row">
				<div class="input-group mb-3" >
					<input type="button" value="추천도서리스트" class="btn btn-sm btn-outline-secondary">
					<input type="button" value="접기" id="closeRcBtn" class="btn btn-sm btn-primary" style="display: flex;">
					<input type="button" value="열기" id="openRcBtn" class="btn btn-sm btn-primary" style="display: none;">
				</div>
			</div>
		</div>
		<div class="col-6">
		
		</div>
		<div class="col-3 text-end">
			<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y' }">
			<div class="row justify-content-end">	
					<div class="input-group">
						<input type="button" value="관리자" class="btn btn-sm btn-outline-secondary">
						<input type="button" value="수정" class="btn btn-sm btn-primary" 		onclick="location.href='/service/recommendUpdate?rcCode=${recommend.rcCode}&menuCode=${menuCode }'"> 
						<input type="button" value="삭제" class="btn btn-sm btn-primary"		onclick="location.href='#'" id="recommendDeleteModal">
						<input type="button" value="새글등록" class="btn btn-sm btn-primary" 	onclick="location.href='/service/recommendRegForm?menuCode=${menuCode}'">
					</div>
			</div>
			</c:if>
		</div>	
		<div class="col-12 mt-3" id="rcListForUser">
			<c:choose>
				<c:when test="${not empty rcList }">
					<c:forEach items="${rcList }" var="a">
						<a href="/service/recommend?menuCode=${menuCode }&rcCode=${a.rcCode}" style="text-decoration: underline;">${a.title }./.</a> 
					</c:forEach>	
				</c:when>
			<c:otherwise>
						추천도서 데이터를 입력해주세요.
			</c:otherwise>
			</c:choose>
		</div>
	</div>

<div class="row">
	<div class="col-2">
		
	</div>
</div>

<a id="topBtn" href="#"><img src="/resources/img/top_b.png" width="50px;" title="위로"></a> 



<div class="row justify-content-center mt-5 mb-5">
	<div class="col-12">
		<div class="row justify-content-center">
			<div class="col-12 text-center mt-5 mb-5" style="font-weight:bold; ">
				<span>
				<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-bookmark-star" viewBox="0 0 16 16">
  					<path d="M7.84 4.1a.178.178 0 0 1 .32 0l.634 1.285a.178.178 0 0 0 .134.098l1.42.206c.145.021.204.2.098.303L9.42 6.993a.178.178 0 0 0-.051.158l.242 1.414a.178.178 0 0 1-.258.187l-1.27-.668a.178.178 0 0 0-.165 0l-1.27.668a.178.178 0 0 1-.257-.187l.242-1.414a.178.178 0 0 0-.05-.158l-1.03-1.001a.178.178 0 0 1 .098-.303l1.42-.206a.178.178 0 0 0 .134-.098L7.84 4.1z"/>
					<path d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z"/>
				</svg>	<span class="fs-1">${recommend.title } </span>
				</span>
			</div>
			<div class="col-8 text-center mb-5 fs-3">
				<br><br><br><br><br><br>
			</div>
			<div class="col-8 text-center mb-5" style="    font-family: 'GimpoTitle00';
    src: url('');
    font-weight: bold;">
    
				<span>
					${recommend.content1 }
				</span>
			
			
			</div>
			
		</div>
	</div>
	
	<div class="col-12 mt-5 mb-5" style="font-family: 'GimpoTitle00'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/GimpoTitle00.woff') format('woff');">
		<div class="row justify-content-center mt-5 mb-5">
			<div class="col-8 text-center">
				<img id="photo1" src="/resources/service/img/${recommend.imgOne }" style="width: 500px;">
				<div class="mt-3" id="photo1" style="font-size: 13px;">IMAGE</div>
			</div>
			
			<div class="col-8">
				<span class="text-center mt-3 mb-5" style="line-height: 15px; line-height: 30px;">　
					${recommend.content2 }
				</span>
			</div>
			
		</div>
		
		
		
		<div class="row justify-content-center mt-5 mb-5">
			<div class="col-8 text-center mt-5">
				<img id="photo1" src="/resources/service/img/${recommend.imgTwo }" style="width: 500px;">
				<div class="mt-3" id="photo1" style="font-size: 14px;">IMAGE</div>
			</div>
			
			<div class="col-8 mb-5">
				<span class="text-center mb-5" style="line-height: 15px; line-height: 30px;">　
					${recommend.content3 }	
 				</span>
			</div>
			
		</div>
		
		<div class="row justify-content-center mt-5 mb-5">
			<div class="col-8 text-center">
				<img id="photo1" src="/resources/service/img/${recommend.imgThree }" style="width: 500px;">
				<div class="mt-3" id="photo1" style="font-size: 14px;">IMAGE</div>
			</div>
			
			<div class="col-8">
				<span class="text-center mt-3 mb-5" style="line-height: 15px; line-height: 30px;">　
					${recommend.content4 }
 				</span>
			</div>
		</div>
		
		
		
		
	</div>	
</div>



</body>
</html>