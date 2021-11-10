<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/service/js/bookRequestManage.js?ver=21"></script>

<style type="text/css">

table{
	font-size: 14px;
	width: 100%;
}

</style>
</head>
<body>

<h2 class="text-first fw-bold">도서비치관리</h2>
<hr>
<input type="hidden" name="inYear" id="inYear" value="${inYear }">
<input type="hidden" name="inMonth"id="inMonth" value="${inMonth }">
<input type="hidden" name="menuCode" id="menuCode" value="${menuCode }">

<div class="row">
	<div class="col-5">
		<div class="input-group text-end">
		<select name="year" id="windowYear" class="form-control-sm">
			<c:forEach items="${years }" var="y" varStatus="status">
			<option value="${y}" >${y}</option>	
			</c:forEach>
		</select>
		<select name="month" id="windowMonth" class="form-control-sm">
			<c:forEach items="${months }" var="m" varStatus="status">
			<option value="${m}">${m}</option>		
			</c:forEach>
		</select>
		<input type="button" value="조회" class="btn btn-primary btn-sm ml-3" id="chooseMonthYearRequestBoard"> 
		<input type="button" value="초기화" class="btn btn-secondary btn-sm" onclick="location.href='/libManage/bookRequestManage?menuCode=${menuCode }'"> 
		</div>
	</div>
</div>
 <!-- 리스트 구획 -->
	<div class="row justify-content-center mb-3 mt-2">
		<c:if test="${empty requestList }">
			<tr><td colspan="7">(요청된 내역이 없습니다.)</td></tr>
		</c:if>	
			
		<div class="requestTableDiv col-12 mt-3 mb-3">
		<table class="table text-center">		
		<thead>
    	<tr class="text-center">
	     	<th scope="col">No.</th>      
	     	<th scope="col">제목 (발행년도)</th>       
	     	<th scope="col">저자	</th>     
	     	<th scope="col">ISBN</th>		
	     	<th scope="col">신청일</th>	  
	     	<th scope="col">신청인</th>	  
	     	<th scope="col">상태</th>	  
	     	<th scope="col" colspan="2">업무</th>	  
		</tr>	
		</thead>	
		<tbody>
		<colgroup>
			<col width="*">
			<col width="25%">
			<col width="20%">
			<col width="12%">
			<col width="13%">
			
			<col width="6%">
			<col width="7%">
			<col width="15%">
		</colgroup>
		<c:choose>
		<c:when test="${not empty sessionScope.loginInfo }">		
		<c:forEach items="${requestList }" var="a" varStatus="status">
		<tr class="text-center">
			<td id="requestCodeTd">${a.requestCode }</td>	
			<td>${a.title }</td> 
			<td>${a.writer }</td>   		
			<td>${a.isbn }</td>
			<td>${a.createDate }</td> 

			<td>${a.id }</td> 
			<td><c:if test="${a.requestStatus == 0 }">신규신청</c:if><c:if test="${a.requestStatus == 1 }">접수완료</c:if><c:if test="${a.requestStatus == 2 }">진행중</c:if><c:if test="${a.requestStatus == 3 }">완료</c:if><c:if test="${a.requestStatus == 4 }">비치불가</c:if></td>		
			<td><select class="form-select" name="requestStatus" id="status"><option value="">상태변경</option><option value="1">접수완료</option><option value="2">진행중</option><option value="3">완료</option><option value="4">비치불가</option></select></td>	
			<td><input type="button" value="확인" class="btn btn-primary disabled requestStatusChange" ></td>
		</tr>   
		
		
		
		</c:forEach>
		</c:when>
		<c:otherwise>
	
		</c:otherwise>
		</c:choose>
		</tbody>
		</table>	
		</div>    
	</div>
	
	
<!-- 알림전송 Modal -->
<div class="modal fade" id="messageModal1" tabindex="-1" aria-labelledby="messageModalLabel" aria-hidden="true">
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
          	<div class="col-12 mt-2" id="byteCheck" style="font-size: 14px;"></div>
          	<div class="col-12 mt-2" id="byteAlert" style="font-size: 14px;"></div>
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

<!-- 알림전송 Modal -->
<div class="modal fade" id="messageModal2" tabindex="-1" aria-labelledby="messageModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="messageModalLabel">알림 보내기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">받는 사람 : </label>
            <input type="text" class="form-control" id="toId2" readonly>
          </div>
          <div class="mb-3">
            <label for="message-text" class="col-form-label">내용 : </label>
            <textarea class="form-control" id="content2" ></textarea>
          	<div class="col-12 mt-2" id="byteCheck" style="font-size: 14px;"></div>
          	<div class="col-12 mt-2" id="byteAlert" style="font-size: 14px;"></div>
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
	
	
	
	
	
	
	
	
	


</body>
</html>