<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<style type="text/css">
#col1 {
	height: 15rem;
	background-color: #0b70b9;
}
#col2 {
	height: 23rem;
	background-color: #0b70b9;
}
#col3 {
	height: 23rem;
	background-color: #0b70b9;
}
.carousel , .carousel-inner {
	width: 590px;
	height: 350px;
}
.carousel-item > img {
	top: 0;
	left: 0;
	width: 100%;
	height: 80%;
}
.titleA {
	color: black;
}
.titleA:hover {
	text-decoration: underline 1px black;
	color: black;
}
.keyword {
	text-align: center;
    white-space: nowrap;
    background-color: white;
}
.modal{
	width: 300px;
	position: fixed;
	top: 50%;
	left: 50%;
	-webkit-transform: translate(-50%, -50%);
	-moz-transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
	-o-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
}
</style>
<script type="text/javascript">
	//팝업 모달창
	$(window).on('load',function(){
	    $('#myModal').modal('show');
	});
	
	 function close_pop() {
         $('#myModal').modal('hide');
    };

</script>
</head>
<body>
<div class="row justify-content-center">
	<!-- 검색 -->
    <div class="col-10 g-5" id="col1">
<form action="/search/bookSearch" method="post">
	    <div class="row justify-content-center pt-5 mt-2">
    		<div class="col-8 text-center fs-1 mb-3">
    			<div style="color: white;"> 울산 도서관에 오신 것을 환영합니다.</div>
    		</div>
		    <div class="col-6 align-self-center">
				<div class="input-group searchB">
					<span class="input-group-text keyword" id="inputGroup-sizing-default">
						<img width="20px;" src="/resources/img/search_b.png">
					</span>
					<input type="text" class="form-control p-3" id="searchValue" name="searchValue" placeholder="검색어를 입력해주세요.">
					<input type="hidden" value="MENU_002" name="menuCode">
				</div>
			</div>
			<div class="col-2 d-grid align-self-center" style="padding-left: 3px;">
				<input type="submit" value="검색" id="goSearchBtn" class="btn btn-light p-3">
			</div>
	    </div>
</form>
    </div>
    
    <!-- 신착도서 목록 테이블 -->
    <div class="col-5 g-5" id="col2">
    <h1 class="display-6 text-center mt-1" style="color: white;">신착도서</h1>
    <div class="row"  style="background-color: white;">
    	<c:choose>
    		<c:when test="${not empty bookList }">
    	<div class="col-5">
    		<div class="row">
    			<a class="titleA" href="/search/bookDetail?bookCode=${bookList[0].bookCode }&menuCode=MENU_002"><img height="220px;" width="180px;" src="/resources/bookImgUpload/${bookList[0].bookImgVO.attachedImgName }"><br>
    			<span>${bookList[0].title }</span><br>
    			<span>${bookList[0].writer }</span></a>
    		</div>
    	</div>
    	<div class="col-7">
	    	<div class="row mb-4 mt-4"><a class="titleA" href="/search/bookDetail?bookCode=${bookList[1].bookCode }&menuCode=MENU_002">${bookList[1].title } / ${bookList[1].writer }</a></div>
	    	<div class="row mb-4 mt-4"><a class="titleA" href="/search/bookDetail?bookCode=${bookList[2].bookCode }&menuCode=MENU_002">${bookList[2].title } / ${bookList[2].writer }</a></div>
	    	<div class="row mb-4 mt-4"><a class="titleA" href="/search/bookDetail?bookCode=${bookList[3].bookCode }&menuCode=MENU_002">${bookList[3].title } / ${bookList[3].writer }</a></div>
	    	<div class="row mb-4 mt-4"><a class="titleA" href="/search/bookDetail?bookCode=${bookList[4].bookCode }&menuCode=MENU_002">${bookList[4].title } / ${bookList[4].writer }</a></div>
    	</div>
    		</c:when>
    		<c:otherwise>
    	<div class="col-12 text-center px-5 py-5">
    		신착도서가 없습니다.
    	</div>
    		</c:otherwise>
    	</c:choose>
    </div>
 </div>   

    <!-- 공지사항 이미지 슬라이드 -->
    <div class="col-5 g-5" id="col3">
    	<div class="row justify-content-center">
    		
				<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
				  <div class="carousel-inner">
				    <div class="carousel-item active">
				      <a href="/board/noticeDetail?noticeCode=${noticeList[0].noticeCode }&menuCode=MENU_004">
				     	<img  height="100%;" width="100%;" src="/resources/noticeFileUpload/${noticeList[0].attachFileVO.attachedFileName }" class="d-block" alt="#">
				      </a>
				    </div>
				    <div class="carousel-item">
				    	<a href="/board/noticeDetail?noticeCode=${noticeList[1].noticeCode }&menuCode=MENU_004">
				      		<img height="100%;" width="100%;" src="/resources/noticeFileUpload/${noticeList[1].attachFileVO.attachedFileName }" class="d-block" alt="#">
				    	</a>
				    </div>
				    <div class="carousel-item">
				    	<a href="/board/noticeDetail?noticeCode=${noticeList[2].noticeCode }&menuCode=MENU_004">
				    		<img height="100%;" width="100%;" src="/resources/noticeFileUpload/${noticeList[2].attachFileVO.attachedFileName }" class="d-block" alt="#">
				    	</a>
				    </div>
				  </div>
				  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
				    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
				    <span class="visually-hidden">Previous</span>
				  </button>
				  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
				    <span class="carousel-control-next-icon" aria-hidden="true"></span>
				    <span class="visually-hidden">Next</span>
				  </button>
				</div>
    	</div>
    </div>
</div>

	<!-- 팝업 모달창 -->
	<div class="modal" id="myModal" tabindex="-1" role="dialog">
	    <div class="modal-dialog" role="document">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h5 class="modal-title">공지</h5>
	            </div>
	            <div class="modal-body">
	                <p>공지내용</p>
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-primary" id = "modal-today-close">오늘만 닫기</button>
	                <button type="button" class="btn btn-secondary" data-dismiss="modal" onClick="close_pop();">닫기</button>
	            </div>
	        </div>
	    </div>
	</div>
</body>

</html>
