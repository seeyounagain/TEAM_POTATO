<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#col1 {
	height: 15rem;
	background-color: blue;
}
#col2 {
	height: 23rem;
	background-color: yellow;
}
#col3 {
	height: 23rem;
	background-color: green;
}
.carousel {
	width: 590px;
	height: 380px;
}
.carousel-item > img {
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
}
</style>
</head>
<body>
<div class="row justify-content-center">
    <div class="col-10 g-5" id="col1">1</div>
    <div class="col-5 g-5" id="col2">2</div>
    
    <div class="col-5 g-5" id="col3">
    	<div class="row justify-content-center">
				<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
				  <div class="carousel-inner">
				    <div class="carousel-item active">
				      <img src="/resources/img/notice1.png" class="d-block" alt="#">
				    </div>
				    <div class="carousel-item">
				      <img src="/resources/img/notice2.png" class="d-block" alt="#">
				    </div>
				    <div class="carousel-item">
				      <img src="/resources/img/notice3.png" class="d-block" alt="#">
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

</body>
</html>
