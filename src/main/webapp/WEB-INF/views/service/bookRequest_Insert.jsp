<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
<div class="row justify-content-center text-center">
	<!-- 이모티콘 구획 -->
	<div class="col-10 container">
		<div class="row justify-content-center align-middle">
			<div class="col-6 text-center mt-5">	
<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-emoji-angry" viewBox="0 0 16 16">
  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
  <path d="M4.285 12.433a.5.5 0 0 0 .683-.183A3.498 3.498 0 0 1 8 10.5c1.295 0 2.426.703 3.032 1.75a.5.5 0 0 0 .866-.5A4.498 4.498 0 0 0 8 9.5a4.5 4.5 0 0 0-3.898 2.25.5.5 0 0 0 .183.683zm6.991-8.38a.5.5 0 1 1 .448.894l-1.009.504c.176.27.285.64.285 1.049 0 .828-.448 1.5-1 1.5s-1-.672-1-1.5c0-.247.04-.48.11-.686a.502.502 0 0 1 .166-.761l2-1zm-6.552 0a.5.5 0 0 0-.448.894l1.009.504A1.94 1.94 0 0 0 5 6.5C5 7.328 5.448 8 6 8s1-.672 1-1.5c0-.247-.04-.48-.11-.686a.502.502 0 0 0-.166-.761l-2-1z"/>
</svg>
			</div>
			<div class="col-8 text-center mt-3">	
				<h3>인사등록 SYSTEM</h3>
			</div>
		</div>
	</div>
	
	<form action="/board/regMember" method="POST">
	<div class="row mt-3 justify-content-center mb-5"> 
	<div class="col-9">
	
	<table class="table" style="border-bottom-color: white" >
		<colgroup>
			<col width="15%">
			<col width="35%">
			<col width="15%">
			<col width="35%">
		</colgroup>
		<tr>
			<td class="text-end mb-3">사원명</td> 
			<td colspan="3" class="text-start"><input type="text" name="eName" style="width:100%;margin-left: 5px;"></td>
		</tr>
		<tr>
			<td class="text-end">직급</td> 
			<td class="text-start">
					<select name="job" style="width: 100%; margin-left: 5px;">
						<option value="부장">부장</option>
						<option value="과장">과장</option>
						<option value="대리">대리</option>
						<option value="사원">사원</option>
					</select>
			</td>
			<td class="text-end">부서</td>
			<td class="text-start">
			<select name="deptNo" style="width:100%; margin-left: 5px;">
			<c:choose>
				<c:when test="${not empty deptList }">
					<c:forEach items="${deptList }" var="a" >
						<option value="${a.deptNo}">${a.deptName}</option>	
					</c:forEach>
				</c:when>
				<c:otherwise>
						<option>없음</option>
				</c:otherwise>
			</c:choose>
			</select>
			</td>
		</tr>	
		<tr>
			<td class="text-end">성별</td> 
			<td class="text-start">
			<input type="radio" name="gender" value="남자" style="margin-left: 5px;">남
			<input type="radio" name="gender" value="여자" style="margin-left: 5px;">여
			</td>
			<td class="text-end">나이</td>
			<td class="text-start"><input type="number" name="age" max="70" min="0" value="20"  style="width:100%;margin-left: 5px;"></td>
		</tr>	
		<tr>
			<td class="text-end">연락처</td> 
			<td class="text-start" colspan="3">
				<input type="text" name="tells" style="width:25%;margin-left: 5px;">
				<input type="text" name="tells" style="width:34%;margin-left: 5px;">
				<input type="text" name="tells" style="width:34%;margin-left: 5px;">
			</td>
		</tr>	
	</table>
		<div class="row mt-0">
			<div class="col-12 text-center">
				<input type="submit" value="등록">
			</div> 
		</div>

		</div>
	</div>
	</form>	
	</div>
	</div>
</body>
</html>