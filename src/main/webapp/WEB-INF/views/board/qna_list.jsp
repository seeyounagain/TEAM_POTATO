<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
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
</style>
</head>
<body>
<div class="row justify-content-center">
   <div class="col-8 mainDiv" style="background-color: #dddddd;">
   		<div class="titleDiv">
   			<h3>문의&상담</h3>
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
							<c:forEach items="${list }" var="info">
							<tr>
								<td>${info.qnaCode }</td>
								<td><a data-bs-toggle="modal" href="#pwModal">${info.title }</a></td>
								<td>${info.writer }</td>
								<td>${info.createDate }</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<c:if test="${sessionScope.loginInfo.isAdmin eq 'N' }">
					<div class="btnDiv">
						<button type="button" class="btn btn-primary btn-lg" onclick="location.href='/board/qnaForm?menuCode=${menuVO.menuCode}';">문의/상담 등록하기</button>
					</div>                                                
				</c:if>
			</div>
		</div>


		<div class="modal fade" id="pwModal" tabindex="-1">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="">상담/문의글 비밀번호</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		     <form action="/board/checkQnaPw" method="post">
			      <div class="modal-body">
			      	<div class="form-floating mb-3">
					  <input type="password" class="form-control" id="pwInput" name="pw" required>
					  <label for="idInput">비밀번호</label>
					</div>
			      </div>
			      <div class="col-12 d-grid p-1">
		          		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
		          		<input type="submit" class="btn btn-primary btn-block" value="확인">
		          </div>
				</form>
		      
		    </div>
		  </div>
		</div>



</body>
</html>
