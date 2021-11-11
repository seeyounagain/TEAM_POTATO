<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%> 
<% response.setContentType("text/html; charset=UTF-8");%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/admin/js/reg_book_form.js?ver=40" ></script>
<script src="//cdn.ckeditor.com/4.16.2/full/ckeditor.js"></script>
<style type="text/css">
textarea {
    resize: none;
  }
 #backIcon:hover {
	cursor: pointer;
}
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

<a id="topBtn" href="#"><img src="/resources/img/top_b.png" width="50px;" title="위로"></a> 

<form class="row g-0 mb-5" action="/libManage/regBook?menuCode=${menuVO.menuCode }" method="post" enctype="multipart/form-data" id="regBookForm">
	<div class="col-6">
	<h2 class="text-first fw-bold">신규도서등록</h2>
	</div>
		<div class="col-sm-6 text-end">
			<img id="backIcon" src="/resources/img/back_off.png" onclick="javascript:history.back();" width="30px;" title="뒤로가기">
		</div>
	<div class="row g-0 justify-content-center">
		
		<div class="col-12">
		<hr>
			<div class="mt-4 text-end" style="color: red; font-size: 16px;">* 필수사항</div>
			<hr style="background-color: gray; height: 1px;">
			
			<div class="col-12 mt-2">
				<label for="isbn" class="form-label">ISBN</label>
				<input type="text" class="form-control" id="isbn" name="isbn" placeholder="ISBN" required>
				<div class="col-12 mt-2" id="isbnAlert" style="color: red; font-size: 14px;"></div>
			</div>
			<div class="col-12 mt-2">
				<label for="name" class="form-label">표제</label>
				<input type="text" class="form-control" id="title" name="title" placeholder="표제" required>
			</div>
			<div class="col-12 mt-2">
				<label for="kdc" class="form-label">청구기호</label>
				<input type="text" class="form-control" id="kdc" name="kdc" placeholder="청구기호" required>
			</div>
			<div class="col-12 mt-2">
				<label for="writer" class="form-label">지은이</label>
				<input type="text" class="form-control" id="writer" name="writer" placeholder="저자" required>
			</div>
			<div class="col-12 mt-2">
				<label for="translator" class="form-label">옮긴이</label>
				<input type="text" class="form-control" id="translator" name="translator" placeholder="역자 / 없을 경우 생략">
			</div>
			<div class="col-12 mt-2">
				<label for="publisher" class="form-label">발행자</label>
				<input type="text" class="form-control" id="publisher" name="publisher" placeholder="발행자" required>
			</div>
			<div class="col-12 mt-2">
				<label for="pubDate" class="form-label">발행년도</label>
				<input type="text" class="form-control" id="pubDate" name="pubDate" placeholder="예) 2021 " required>
				<div class="col-12 mt-2" id="pubDateAlert" style="color: red; font-size: 14px;"></div>
			</div>
			<div class="col-12 mt-2">
				<label for="summary" class="form-label">한줄소개</label>
				<input type="text" class="form-control" id="summary" name="summary" placeholder="한줄소개" required>
			</div>
			<div class="col-12 mt-2">
			<label for="intro" class="form-label">소개글</label>
				<textarea class="intro" name="intro" id="editor1" rows="10" cols="80">
	            </textarea>
	            <script>
	                CKEDITOR.replace( 'editor1' );
	         	</script>
			</div>
			<div class="col-12 mt-2">
				<label for="area" class="form-label">자료위치</label>
				<input type="text" class="form-control" id="area" name="area" placeholder="자료위치" required>
			</div>
			
			<div class="mt-4 text-end" style="color: gray; font-size: 16px;">선택사항</div>
			<hr style="background-color: gray; height: 1px;">
			<div class="col-12 mt-2">
				<label for="page" class="form-label">페이지</label>
				<input type="text" class="form-control" id="page" name="page" placeholder="숫자로 입력해주세요.">
				<div class="col-12 mt-2" id="pageAlert" style="color: red; font-size: 14px;"></div>
			</div>
			<div class="col-12 mt-2">
				<label for="bookSize" class="form-label">크기</label>
				<input type="text" class="form-control" id="bookSize" name="bookSize" placeholder="가로 크기를 숫자로 입력해주세요. (cm 제외) ">
				<div class="col-12 mt-2" id="sizeAlert" style="color: red; font-size: 14px;"></div>
			</div>
			<div class="col-12 mt-2">
				<label for="keyword" class="form-label">주제</label>
				<input type="text" class="form-control" id="keyword" name="keyword" placeholder="예) 연애소설, 판타지 ">
			</div>
			<div class="col-12 mt-2">
				<label for="file" class="form-label">표지이미지</label>
				<input type="file" name="file" class="form-control" id="inputGroupFile01 file">
				<div class="mt-2">* 이미지를 등록하지 않을 시, 기본 이미지로 보여집니다.</div>		
			</div>
			<div class="d-grid mt-3">
				<button type="button" class="btn btn-primary" onclick="regBookSubmit();">등록</button>
			</div>
		</div>
	</div>

</form>


<!-- 도서등록 modal 시작 -->
<div class="modal fade" id="regBookConfirmModal" tabindex="-1" aria-labelledby="regBookConfirmModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="regBookConfirmModalLabel">알림</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id="regBookConfirmText">
			
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary" onclick="regBook();">등록</button>
      </div>
    </div>
  </div>
</div>
<!-- 도서등록 modal 종료 -->

<!-- 도서등록완료 modal 시작 -->
<div class="modal fade" id="regBookCompleteModal" tabindex="-1" aria-labelledby="regBookCompleteModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="regBookCompleteModalLabel">알림</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
		도서 등록이 완료되었습니다.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" onclick="regBookFin();">확인</button>
      </div>
    </div>
  </div>
</div>
<!-- 도서등록완료 modal 종료 -->


</body>
</html>