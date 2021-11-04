<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/service/js/bookRequestManage.js?ver=9"></script>

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
 <!-- 리스트 구획 -->
	<div class="row justify-content-center mb-3 mt-2">
		<c:if test="${empty requestList }">
			<tr><td colspan="7">(요청된 내역이 없습니다.)</td></tr>
		</c:if>	
			
		<div class="col-12 mt-3 mb-3">
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
			<td><c:if test="${a.requestStatus == 0 }">신규신청</c:if><c:if test="${a.requestStatus == 1 }">접수완료</c:if><c:if test="${a.requestStatus == 2 }">진행중</c:if><c:if test="${a.requestStatus == 3 }">비치완료</c:if></td>		
			<td><select class="form-select" name="requestStatus" id="status"><option value="">상태변경</option><option value="1">접수완료</option><option value="2">진행중</option><option value="3">완료</option></select></td>	
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


</body>
</html>