<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<div class="col-12">
  <div class="position-absolute top-0 start-0">SEAT</div>
  <div class="position-absolute top-25 start-50 translate-middle-x"><span class="seat">SEAT</span></div>
  <div class="position-absolute top-25 end-0"><span class="seat">SEAT</span></div>
  <div class="position-absolute top-50 start-0 translate-middle-y"><span class="seat">SEAT</span></div>
  <div class="position-absolute top-50 start-50 translate-middle"><span class="seat">SEAT</span></div>
  <div class="position-absolute top-50 end-0 translate-middle-y"><span class="seat">SEAT</span></div>
  <div class="position-absolute bottom-0 start-0"><span class="seat">SEAT</span></div>
  <div class="position-absolute bottom-0 start-50 translate-middle-x"><span class="seat">SEAT</span></div>
  <div class="position-absolute bottom-0 end-0"><span class="seat">SEAT</span></div>
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
			<tr class="text-center">
				<th class="align-middle" scope="row">${board.boardNum }</th>		
				<td class="text-center align-middle">${board.title}</td>
				<td class="text-center align-middle">${board.writer}</td>
				<td class="text-center align-middle">${board.createDate}
			</td>


  </tbody>
</table>
</div>
	
	
	
	
	
</div>	
</body>
</html>