<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#col1 {
	height: 15rem;
   	position: relative;
}
#col1:after {
    content : "";
    display: block;
    position: absolute;
    top: 0;
    left: 0;
    background-image: url('/resources/img/main_image03.jpg'); 
    background-position: 20% 70%;
    width: 100%;
    height: 100%;
    opacity : 0.8;
    z-index: -1;
}
#col2 {
	height: 450px;
}
#col3 {
	height: 450px;
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
.welcomeTitle {
	text-shadow: 2px 2px 4px black;
}
#myModal{
	width: 500px;
	position: fixed;
	top: 50%;
	left: 50%;
	-webkit-transform: translate(-50%, -50%);
	-moz-transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
	-o-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
	display: none;
}
#goSearchBtn {
	border: 1px solid #dddddd;
}
.carousel-item:hover {
	cursor: pointer;
}
.carousel .carousel-item {
  height: 100%;
}
.carousel-item img {
    object-fit:cover;
    top: 0;
    left: 0;
    height: 340px;
}

.card {
    transition: transform 0.2s ease;
    box-shadow: 0 4px 6px 0 rgba(22, 22, 26, 0.18);
    border-radius: 0;
    border: 0;
    margin-bottom: 1.5em;
}
.card:hover {
    transform: scale(1.1);
    cursor: pointer;
}
.newBookCard {
	background-image: url('/resources/img/new.png'); 
	background-size: 60px;
	background-repeat: no-repeat;
	background-position: 100% 0%;
}
</style>
</head>
<body>
<input type="hidden" value="${noticeVO.noticeCode}" id="noticeCode">
<!-- 팝업 모달창 -->
	<div class="modal" id="notice" tabindex="-1" role="dialog" style="width: 600px;">
	    <div class="modal-dialog modal-lg" role="document">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h5 class="modal-title" style="font-weight: bold;">도담도서관 공지사항</h5>
	            </div>
	           
	            <div class="modal-body">
					<table class="table">
						<tr style="border-bottom-color: white;">
							<td id="title" style="font-size: 20px; font-weight: bold;"></td>
						</tr>
						<tr style="border-bottom-color: white;">
							<td id="content" style="height: 100px;"></td>
						</tr>
					</table>
					
	            </div>
	            <div class="modal-footer" style="display: block;">
					<div class="row">
			      		<div class="col-9 text-start p-0">
			      			<label for="chkBox"><input type="checkbox" id="chkBox">오늘 하루 다시 이 창을 열지 않음</label>
			      		</div>
			      		<div class="col-3 text-end p-0">
			       			<button type="button" class="btn btn-primary btn-sm" id="popEnd" data-dismiss="modal" >닫기</button>
			      		</div>
			      	</div>	            
	            </div>
	        </div>
	    </div>
	</div>
 <script type="text/javascript" src="/resources/board/js/main_notice.js?ver=14" ></script>


<div class="row justify-content-center mb-5">
	<!-- 검색 -->
    <div class="col-10 g-5" id="col1">
<form action="/search/bookSearch" method="post">
	    <div class="row justify-content-center pt-5 mt-2">
    		<div class="col-8 text-center fs-1 mb-3">
    			<div class="welcomeTitle" style="color: white;"> 도담 도서관에 오신 것을 환영합니다.</div>
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
    <h4 class="text-first mt-1" >신착도서</h4>
 <div id="carouselExampleIndicators" class="carousel carousel-dark slide" data-bs-ride="carousel" style="max-width: 100%; height: 90%;">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active" onclick="location.href='/search/bookDetail?bookCode=${bookList[0].bookCode }&menuCode=MENU_002'">
		<div class="card newBookCard mb-8">
		  <div class="row g-0">
		    <div class="col-4">
		      <img src="/resources/bookImgUpload/${bookList[0].bookImgVO.attachedImgName }" class="img-fluid rounded-start">
		    </div>
		    <div class="col-8">
		      <div class="card-body">
		        <h5 class="card-title fs-4">${bookList[0].title }</h5>
		        <p class="card-text">${bookList[0].summary }</p>
		        <p class="card-text"><small class="text-muted">${bookList[0].writer }</small></p>
		      </div>
		    </div>
		  </div>
		</div>
    </div>
    <div class="carousel-item" onclick="location.href='/search/bookDetail?bookCode=${bookList[1].bookCode }&menuCode=MENU_002'">
		<div class="card newBookCard mb-8">
		  <div class="row g-0">
		    <div class="col-md-4">
		      <img src="/resources/bookImgUpload/${bookList[1].bookImgVO.attachedImgName }" class="img-fluid rounded-start">
		    </div>
		    <div class="col-md-8">
		      <div class="card-body">
		        <h5 class="card-title fs-4">${bookList[1].title }</h5>
		        <p class="card-text">${bookList[1].summary }</p>
		        <p class="card-text"><small class="text-muted">${bookList[1].writer }</small></p>
		      </div>
		    </div>
		  </div>
		</div>
    </div>
    <div class="carousel-item" onclick="location.href='/search/bookDetail?bookCode=${bookList[2].bookCode }&menuCode=MENU_002'">
		<div class="card newBookCard mb-8">
		  <div class="row g-0">
		    <div class="col-md-4">
		      <img src="/resources/bookImgUpload/${bookList[2].bookImgVO.attachedImgName }" class="img-fluid rounded-start" >
		    </div>
		    <div class="col-md-8">
		      <div class="card-body">
		        <h5 class="card-title fs-4">${bookList[2].title }</h5>
		        <p class="card-text">${bookList[2].summary }</p>
		        <p class="card-text"><small class="text-muted">${bookList[2].writer }</small></p>
		      </div>
		    </div>
		  </div>
		</div>
    </div>
  </div>
</div>
 
 </div>   




    <!-- 공지사항 이미지 슬라이드 -->
<div class="col-5 g-5" id="col2">
  <h4 class="text-first mt-1" >공지사항</h4>
	<div id="carouselExampleIndicators2" class="carousel carousel-dark slide" data-bs-ride="carousel" style="max-width: 100%; height: 90%;">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleIndicators2" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators2" data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators2" data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner noticeImg">
		<div class="carousel-item active" onclick="location.href='/board/noticeDetail?noticeCode=${noticeList[0].noticeCode }&menuCode=MENU_004'">
			<div class="card">
			  <div class="row">
			    <div class="col-12 text-center">
			      <img src="/resources/noticeFileUpload/${noticeList[0].attachFileVO.attachedFileName }" class="img-fluid rounded-start">
			    </div>
			  </div>
			</div>
    	</div>
		<div class="carousel-item" onclick="location.href='/board/noticeDetail?noticeCode=${noticeList[1].noticeCode }&menuCode=MENU_004'">
			<div class="card">
			  <div class="row">
			    <div class="col-12 text-center">
			      <img src="/resources/noticeFileUpload/${noticeList[1].attachFileVO.attachedFileName }" class="img-fluid rounded-start">
			    </div>
			  </div>
			</div>
    	</div>
		<div class="carousel-item" onclick="location.href='/board/noticeDetail?noticeCode=${noticeList[2].noticeCode }&menuCode=MENU_004'">
			<div class="card">
			  <div class="row">
			    <div class="col-12 text-center">
			      <img src="/resources/noticeFileUpload/${noticeList[2].attachFileVO.attachedFileName }" class="img-fluid rounded-start">
			    </div>
			  </div>
			</div>
    	</div>
	 
		<%-- <div class="carousel-item active" onclick="location.href='/board/noticeDetail?noticeCode=${noticeList[0].noticeCode }&menuCode=MENU_004'">
			<img height="100%;" width="800px;" src="/resources/noticeFileUpload/dodam_notice02.png" class="d-block" alt="#">
		</div>
	    <div class="carousel-item noticeImg" onclick="location.href='/board/noticeDetail?noticeCode=${noticeList[1].noticeCode }&menuCode=MENU_004'">
	      	<img width="800px;" src="/resources/noticeFileUpload/dodam_notice01.png" class="d-block" alt="#">
	    </div>
    <div class="carousel-item noticeImg" onclick="location.href='/board/noticeDetail?noticeCode=${noticeList[2].noticeCode }&menuCode=MENU_004'">
    		<img height="100%;" width="100%;" src="/resources/noticeFileUpload/dodam_notice01.png" class="d-block" alt="#">
    </div> --%>
	</div>
					 
	 </div>
</div>
    </div>


</body>

</html>
