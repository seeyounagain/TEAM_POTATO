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
width: 60%;
height: 20%;
background-color: black;
color: white;
}

.map{
width: 80%;
height: 300px;
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
<c:forEach items="seatList" var="seat" varStatus="status">
		<div class="col-1 seat ${seat.seatCode }">열람- ${status.index }</div>
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
      <th scope="col">#NO</th>
      <th scope="col">#제목</th>
      <th scope="col">#작성자</th>
      <th scope="col">#작성일</th>
    </tr>
  </thead>
  <tbody>
  
  </tbody>
</table>
</div>
	
	
	
	

</body>
</html>