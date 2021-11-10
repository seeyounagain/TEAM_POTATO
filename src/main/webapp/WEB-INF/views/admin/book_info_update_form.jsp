<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/admin/js/book_info_update_form.js?ver=9" ></script>
<script src="//cdn.ckeditor.com/4.16.2/standard/ckeditor.js"></script>
<style type="text/css">
textarea {
    resize: none;
  }
</style>
</head>
<body>

<h2 class="text-first fw-bold">도서정보수정</h2>
<hr>
	<div class="text-end">
		<button type="button" id="deleteBtn" class="btn btn-danger px-5">도서삭제</button>
	</div>
<form class="row g-0 mt-3 mb-5" action="/libManage/updateBookInfo?menuCode=${menuVO.menuCode }&bookCode=${bookVO.bookCode}" method="post" id="updateBook">
	<div class="row g-0 justify-content-center">
		<div class="col-12">
			<div class="col-12 mt-2">
				<label for="isbn" class="form-label">ISBN</label>
				<input type="text" value="${bookVO.isbn }" class="form-control" id="isbn" name="isbn" placeholder="ISBN" required>
			</div>
			<div class="col-12 mt-2">
				<label for="title" class="form-label">표제</label>
				<input type="text" value="${bookVO.title }" class="form-control" id="title" name="title" placeholder="표제" required>
			</div>
			<div class="col-12 mt-2">
				<label for="kdc" class="form-label">청구기호</label>
				<input type="text" value="${bookVO.kdc }" class="form-control" id="kdc" name="kdc" placeholder="청구기호" required>
			</div>
			<div class="col-12 mt-2">
				<label for="writer" class="form-label">지은이</label>
				<input type="text" value="${bookVO.writer }" class="form-control" id="writer" name="writer" placeholder="저자" required>
			</div>
			<div class="col-12 mt-2">
				<label for="translator" class="form-label">옮긴이</label>
				<input type="text" value="${bookVO.translator }" class="form-control" id="translator" name="translator" placeholder="역자">
			</div>
			<div class="col-12 mt-2">
				<label for="publisher" class="form-label">발행자</label>
				<input type="text" value="${bookVO.publisher }" class="form-control" id="publisher" name="publisher" placeholder="발행자" required>
			</div>
			<div class="col-12 mt-2">
				<label for="pubDate" class="form-label">발행년도</label>
				<input type="text" value="${bookVO.pubDate }" class="form-control" id="pubDate" name="pubDate" placeholder="예) 20211021 " required>
			</div>
			<div class="col-12 mt-2">
				<label for="page" class="form-label">페이지</label>
				<input type="text" value="${bookVO.page }" class="form-control" id="page" name="page" placeholder="숫자로 입력해주세요. " required>
			</div>
			<div class="col-12 mt-2">
				<label for="bookSize" class="form-label">크기</label>
				<input type="text" value="${bookVO.bookSize }" class="form-control" id="bookSize" name="bookSize" placeholder="예) 가로*세로 또는 가로 (cm 제외) " required>
			</div>
			<div class="col-12 mt-2">
				<label for="keyword" class="form-label">주제</label>
				<input type="text" value="${bookVO.keyword }"  class="form-control" id="keyword" name="keyword" placeholder="예) 연애소설, 판타지 " required>
			</div>
			<div class="col-12 mt-2">
				<label for="summary" class="form-label">한줄소개</label>
				<input type="text" value="${bookVO.summary }" class="form-control" id="summary" name="summary" placeholder="한줄소개" required>
			</div>
			<div class="col-12 mt-2">
				<label for="intro" class="form-label">소개글</label>
				<textarea class="intro" name="intro" id="editor2" rows="10" cols="80">
	            	${bookVO.intro }
	            </textarea>
	            <script>
	                CKEDITOR.replace( 'editor2' );
	         	</script>
			</div>
			<div class="col-12 mt-2">
				<label for="area" class="form-label">자료위치</label>
				<input type="text" value="${bookVO.area }" class="form-control" id="area" name="area" placeholder="자료위치" required>
			</div>
			<div class="col-12 mt-2">
				<label for="file" class="form-label">표지이미지</label>
				<img height="220px;" width="180px;" src="/resources/bookImgUpload/${bookVO.bookImgVO.attachedImgName }">
			</div>
			<div class="d-grid mt-3">
				<button type="button" id="regBtn" class="btn btn-primary">수정</button>
			</div>
		</div>
	</div>

</form>

<input type="hidden" id="bookCode" name="bookCode" value="${bookVO.bookCode }">

<!-- 정보 수정 confirm modal 시작 -->
<div class="modal fade" id="bookInfoUpdateModal" tabindex="-1" aria-labelledby="bookInfoUpdateModalLabel" aria-hidden="true"  data-backdrop="static" data-keyboard="false">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="bookInfoUpdateModalLabel">알림</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id="bookInfoUpdateText">
      	도서 정보를 수정하시겠습니까?
      </div>
      <div class="modal-footer">
		 <button type="button" class="btn btn-primary bookInfoUpdateBtn">수정</button>     
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
<!-- 정보 수정 confirm modal 종료 -->

<!-- 정보 삭제 confirm modal 시작 -->
<div class="modal fade" id="bookDeleteModal" tabindex="-1" aria-labelledby="bookDeleteModalLabel" aria-hidden="true"  data-backdrop="static" data-keyboard="false">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="bookDeleteModalLabel">알림</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id="bookDeleteModalText">
      	도서 정보를 정말 삭제하시겠습니까?
      </div>
      <div class="modal-footer">
		 <button type="button" class="btn btn-primary" id="bookDeleteBtn">삭제</button>     
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
<!-- 정보 삭제 confirm modal 종료 -->

<!-- 정보 삭제 alert modal 시작 -->
<div class="modal fade" id="bookDeleteAlertModal" tabindex="-1" aria-labelledby="bookDeleteAlertModalLabel" aria-hidden="true"  data-backdrop="static" data-keyboard="false">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="bookDeleteAlertModalLabel">알림</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id="bookDeleteAlertModalText">
      	
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" id="bookDeleteAlertModalCloseBtn" data-bs-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>
<!-- 정보 삭제 alert modal 종료 -->

</body>
</html>