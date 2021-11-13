<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/board/js/notice_form.js?ver=47" ></script>
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
}
.table{
	width: 100%;
	height: 400px;
}
.table tr > td:first-child{
	background-color: #dddddd;
}
.table tr > td:last-child{
	padding-left: 20px;
	text-align: left;
}
input{
	width: 100%;
}
</style>
<!-- <script src="https://cdn.ckeditor.com/ckeditor5/11.0.1/classic/ckeditor.js"></script> -->
<script src="//cdn.ckeditor.com/4.16.2/standard/ckeditor.js"></script>
</head>
<body>

<div class="row justify-content-center">
   <div class="col-12 mainDiv">
   		<div class="titleDiv">
   			<h2 class="text-first fw-bold">공지사항 등록</h2>
   			<hr>
   		</div>
			<div class="tableDiv">
  			<form action="/board/insertNotice?menuCode=${menuVO.menuCode }" method="post" enctype="multipart/form-data" id="insertNoticeSubmit">
  				<input type="hidden" value="${sessionScope.loginInfo.id}" name="id">
					<table class="table text-center">
						<tr>
							<td class="w-10">제목</td>
							<td class="w-90"><input type="text" name="title" id="title"></td>
						</tr>
						<tr>
							<td>작성자</td>
							<td><input type="hidden" value="${sessionScope.loginInfo.name}" name="name" id="name">${sessionScope.loginInfo.name}</td>
						</tr>
						<tr>
							<td>등록일</td>
							<td><input type="hidden" value="${nowDate }" name="createDate" id="createDate">${nowDate }
								
							</td>
						</tr>
						<tr>
							<td>내용</td>
							<td>
								<div class="form-floating">
								
								  <textarea class="ckeditor" id="content" name="content" style="height: 100px" required></textarea>
								   <script>
								    // 3. CKEditor5를 생성할 textarea 지정
								    ClassicEditor
							        .create( document.querySelector( '#content' )
							        		
							        .catch( error => {
							            console.error( error );
							        } );
								    </script>
								
								</div>
							</td>
						</tr>
						<tr>
							<td>첨부파일</td>
							<td> 
								<input class="form-control" type="file" id="formFile" name="file">
  							</td>
						</tr>
					</table>
					<div class="btnDiv text-center">
						<input class="btn btn-primary" type="button" value="등록" onclick="noticeSubmit();">
					</div>
				</form>
				</div>
			</div>
		</div>
		
		
<!-- 알림 모달 -->
		<div class="modal fade" id="noticeCompleteModal" tabindex="-1" aria-labelledby="noticeCompleteModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" style="color: black;" id="noticeCompleteModalLabel">알림</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body" id="noticeCompleteModalContent">

		      </div>
		      <div class="modal-footer">
		      	 <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="backBtn">취소</button>
		        <button type="button" class="btn btn-primary modalClose" data-bs-dismiss="modal" id="confirmBtn" >확인</button>
		      </div>
		    </div>
		  </div>
		</div>
		  		
		
		
</body>
</html>
