<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

.container{
 background-color: white;
}

.seat{
background-color: black;
color: white;
height: 50px;
}

.map{
width: 80%;
height: 150px;
background-color: white;

}

</style>

<!-- // 천화  -->
</head>
<body>

	
	
<div class="container">
	
<div class="row position-relative map justify-content-center">

<c:choose>

<c:when test="${not empty seatList }">
<c:forEach items="${seatList }" var="seat" varStatus="status">
		<div class="col-2 seat mx-1 ${seat.seatCode }">열람- ${status.index +1 }</div>
</c:forEach>
</c:when>
<c:otherwise>
dd
</c:otherwise>
</c:choose>
</div>	

</div>
	<div class="col-8">
	<table class="table">
  <thead>
    <tr class="text-center mt-5">
      <th scope="col">#NO</th><th scope="col">#제목</th><th scope="col">#작성자</th><th scope="col">#작성일</th>
    </tr>
  </thead>
  <tbody>
  <c:choose>
  <c:when test="${not empty seatList }">
<c:forEach items="${seatList }" var="seat2" varStatus="status">
		<tr>
		<td class="seat mx-1 ${seat2.seatCode }">열람- ${status.index +1 }</td>
		<td>${seat2.seatStatus }</td>
		<td> 
		<c:if test="${seat2.id eq null }">
		빈좌석
		</c:if>
		${seat2.id } 
		</td>
		<td></td>
		</tr>
</c:forEach>
</c:when>
</c:choose>
  </tbody>
</table>
</div>
	
	
	
	

</body>
</html>