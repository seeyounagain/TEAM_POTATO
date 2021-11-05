<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/board/js/notice_form.js?ver=23" ></script>
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
</head>
<body>

<div class="row justify-content-center">
   <div class="col-12 mainDiv">
   		<div class="titleDiv">
   			<h1 class="display-6 text-center">공지사항 등록</h1>
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
							<td><input type="hidden" value="${nowDate }" name="createDate" id="createDate">${nowDate }</td>
						</tr>
						<tr>
							<td>내용</td>
							<td>
								<div class="form-floating">
								  <textarea class="form-control" id="content" name="content" style="height: 100px" required></textarea>
								  <label for="floatingTextarea2">공지사항을 입력하세요.</label>
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
		      <div class="modal-body" id="modalContent">
				공지사항을 등록하겠습니까?
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary modalClose" data-bs-dismiss="modal" onclick="confirmNotice();">확인</button>
		      </div>
		    </div>
		  </div>
		</div>
		  		
		
		
</body>
</html>
