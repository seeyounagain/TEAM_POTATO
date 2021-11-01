<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/admin/js/member_manage.js?ver=31" ></script>
<style type="text/css">
.rightC {
	text-align: right;
}
.leftC {
	text-align: left;
}
.cap {
	color: black;
}
.titleA:hover {
	color: black;
}
#searchValue {
	width: 250px;
	display: inline-block;
}
#goSearchBtn {
	vertical-align: baseline;
}
.leftC input[type=text]{
	background-image: url(/resources/img/search_g.png);
	background-position: 10px center;
	background-repeat: no-repeat;
	background-size: 20px;
	padding-left: 60px;
}
.leftC input[type=text]:focus{
	background-image:none;
}
textarea {
	resize: none;
	height: 150px;
	overflow: auto;
}
</style>
</head>
<body>

<!-- 회원정보 Modal -->
<div class="modal fade" id="infoModal" tabindex="-1" aria-labelledby="infoModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="infoModalLabel">회원정보</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
		<div class="modal-body">
		  <div class="container-fluid">
		    <table class="table table-hover table-bordered text-center caption-top" style="width: 100%;">
		    	<caption class="cap" >&lt;대여도서정보&gt;</caption>
		    	<tr id="rentalTr">
		    		<td>표제 / 저자</td>
		    		<td>도서상태</td>
		    		<td>대여일시</td>
		    		<td>반납기한</td>
		    	</tr>
		    </table>
		    <table class="table table-hover table-bordered text-center caption-top" style="width: 100%;">
		    	<caption class="cap" >&lt;예약도서정보&gt;</caption>
		    	<tr id="reserveTr">
		    		<td>표제 / 저자</td>
		    		<td>도서상태</td>
		    		<td colspan="2">대여가능일시</td>
		    	</tr>
		    </table>
		  </div>
		</div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
<!-- 회원정보 modal 종료 -->


<!-- 알림전송 Modal -->
<div class="modal fade" id="messageModal" tabindex="-1" aria-labelledby="messageModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="messageModalLabel">알림 보내기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">받는 사람 : </label>
            <input type="text" class="form-control" id="toId" readonly>
          </div>
          <div class="mb-3">
            <label for="message-text" class="col-form-label">내용 : </label>
            <textarea class="form-control" id="content" ></textarea>
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary sendMessage">보내기</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="completeModal" tabindex="-1" aria-labelledby="completeModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="completeModalLabel">알림 보내기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
			<p>알림 전송이 완료되었습니다.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="failModal" tabindex="-1" aria-labelledby="failModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="failModalLabel">알림 보내기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
			<p>알림 전송에 실패했습니다.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
<!-- 알림전송 modal 종료 -->


<h2 class="text-first fw-bold">회원관리</h2>
<hr>

<table id="bookT" class="table table-hover table-bordered caption-top text-center">
	
	
	<caption class="leftC">
	<input type="text" class="form-control p-2" id="searchValue" name="searchValue" placeholder="         회원 아이디를 입력해주세요." <c:if test="${not empty memberVO.searchValue }">value="${memberVO.searchValue}"</c:if> >
	<input type="button" value="검색" id="goSearchBtn" class="btn btn-primary px-5 py-2">
	</caption>
	
	<caption class="rightC">현재 대여 또는 예약중인 도서의 수 입니다. (반납 완료, 예약 종료 등은 제외)</caption>
		
	<colgroup>
		<col width="5%">
		<col width="15%">
		<col width="20%">
		<col width="20%">
		<col width="10%">
		<col width="10%">
		<col width="10%">
		<col width="10%">
	</colgroup>
		
	<thead>
		<tr>
			<td>No.</td>
			<td>ID</td>
			<td>이름</td>
			<td>생년월일</td>
			<td>대여권수</td>
			<td>예약권수</td>
			<td>도서정보</td>
			<td>알림</td>
		</tr>
	</thead>
	<tbody>
		<c:choose>
			<c:when test="${not empty memberList }">
			<c:forEach var="member" items="${memberList }" varStatus="status">
				<tr>
					<td>${status.count }</td>
					<td>${member.id }</td>
					<td>${member.name }</td>
					<td>${member.birth }</td>
					<td>${member.rentalCnt }</td>
					<td>${member.reserveCnt }</td>
					<td>
					<button type="button" class="btn btn-primary infoBtn" data-bs-toggle="modal" data-bs-target="#infoModal" data-id="${member.id }" >도서정보조회</button>
					</td>
					<td>
					<button type="button" class="btn btn-primary messageBtn" data-bs-toggle="modal" data-bs-target="#messageModal" data-id="${member.id }" >알림보내기</button>
					</td>
				</tr>
			</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="7">회원정보가 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</tbody>
</table>

	<div class="col-12">
		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
			 <c:if test="${memberVO.prev }">
				<li class="page-item">
				<a class="page-link" href="/libManage/memberManage?nowPage=${memberVO.startPage - 1 }&menuCode=${menuVO.menuCode}" aria-label="Previous">
				<span aria-hidden="true">&laquo;</span>
				</a>
				</li>
			 </c:if> 
				<c:forEach var="pageNum" begin="${memberVO.startPage }" end="${memberVO.endPage }">
					<li class="page-item  <c:if test="${memberVO.nowPage eq pageNum }">active</c:if>  ">
					<a class="page-link" href="/libManage/memberManage?nowPage=${pageNum }&menuCode=${menuVO.menuCode}">${pageNum }</a>
					</li>
				</c:forEach>
			<c:if test="${memberVO.next }">
				<li class="page-item">
				<a class="page-link" href="/libManage/memberManage?nowPage=${memberVO.endPage + 1 }&menuCode=${menuVO.menuCode}" aria-label="Next">
				<span aria-hidden="true">&raquo;</span>
				</a>
				</li>
			</c:if>
			</ul>
		</nav>
	</div>	

</body>
</html>