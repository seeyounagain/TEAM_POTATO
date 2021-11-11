<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/service/js/readingSeat.js?ver=1"></script>
<style type="text/css">
.miniTitle {
	font-size: 20px;
}
.container{
 background-color: white;
 margin: 0 auto;
}

.seat{
height: 100px;
width: 100px;
vertical-align: middle;
}
.seatNone{
height: 100px;
width: 100px;
vertical-align: middle;
}

.deskColor {
	width: 85px;
	height: 35px;
	border-radius: 9px;
}

.map{
width: 80%;
height: 200px;
background-color: white;

}
.miniSeatBox:hover{
	cursor: pointer;
}

.image-seat {
    width:100%;
    height:80%;
    display: block;
}

</style>

<!-- // 천화  -->
</head>
<body>

	
<h2 class="text-first fw-bold">열람실좌석현황</h2><hr>	
<input type="hidden" value="${menuCode }" class="menuCode">
<div class="row position-relative justify-content-center">
	<div class="col-12">
			<div class="row justify-content-center">
				<div class="col-12 text-center mt-5 mb-3"><h2>좌석현황</h2></div>
				<div class="row justify-content-center mb-5">
					<div class="col-9">
						<div class="row justify-content-end">
							<div class="col-5 bg-warning fs-5 deskColor p-2 align-middle text-center me-1">대기중</div>
							<div class="col-5 fs-5 deskColor p-2 text-center ml-3" style="background-color: #0371ba;" >사용중</div>								
						</div>
					</div>
				</div>
			</div>
			<div class="row justify-content-center text-center mb-5"  style="width: 1100px; margin: 0 auto;">
				<div class="col-1 miniSeatBox seatForm seat">
					<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y'}"></c:if>
					<input type="hidden" value="${seatList.get(0).seatCode }">
					<span class="align-middle" id="seatForm">${index+ 1 }<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y' }">${seat.id }</c:if>
					<c:if test="${seatList.get(0).seatStatus == 0 }"><img class="image-seat" src="/resources/img/seatOrange02.png"></c:if>
					<c:if test="${seatList.get(0).seatStatus == 1 }"><img class="image-seat" src="/resources/img/seatBlue.png"></c:if>
					</span>
				</div>
				<div class="col-1 miniSeatBox seatForm seat">
					<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y'}"></c:if>
					<input type="hidden" value="${seatList.get(1).seatCode }">
					<span class="align-middle" id="seatForm">${index+2 }
					<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y' }">${seat.id }</c:if>
					<c:if test="${seatList.get(1).seatStatus == 0 }"><img class="image-seat" src="/resources/img/seatOrange02.png"></c:if>
					<c:if test="${seatList.get(1).seatStatus == 1 }"><img class="image-seat" src="/resources/img/seatBlue.png"></c:if>
					</span>
				</div>
				<div class="col-1 seatNone">
					<img class="image-seat" src="/resources/img/seat빈공간.png">
				</div>
				
				
				<div class="col-1 miniSeatBox seatForm seat">
					<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y'}"></c:if>
					<input type="hidden" value="${seatList.get(6).seatCode }">
					<span class="align-middle" id="seatForm">${index+ 7 }<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y' }">${seat.id }</c:if>
					<c:if test="${seatList.get(6).seatStatus == 0 }"><img class="image-seat" src="/resources/img/seatOrange02.png"></c:if>
					<c:if test="${seatList.get(6).seatStatus == 1 }"><img class="image-seat" src="/resources/img/seatBlue.png"></c:if>
					</span>
				</div>
				<div class="col-1 miniSeatBox seatForm seat">
					<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y'}"></c:if>
					<input type="hidden" value="${seatList.get(7).seatCode }">
					<span class="align-middle" id="seatForm">${index+8 }
					<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y' }">${seat.id }</c:if>
					<c:if test="${seatList.get(7).seatStatus == 0 }"><img class="image-seat" src="/resources/img/seatOrange02.png"></c:if>
					<c:if test="${seatList.get(7).seatStatus == 1 }"><img class="image-seat" src="/resources/img/seatBlue.png"></c:if>
					</span>
				</div>
				<div class="col-1 seatNone">
					<img class="image-seat" src="/resources/img/seat빈공간.png">
				</div>
				
				<div class="col-1 miniSeatBox seatForm seat">
					<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y'}"></c:if>
					<input type="hidden" value="${seatList.get(12).seatCode }">
					<span class="align-middle" id="seatForm">${index+13 }
					<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y' }">${seat.id }</c:if>
					<c:if test="${seatList.get(12).seatStatus == 0 }"><img class="image-seat" src="/resources/img/seatOrange02.png"></c:if>
					<c:if test="${seatList.get(12).seatStatus == 1 }"><img class="image-seat" src="/resources/img/seatBlue.png"></c:if>
					</span>
				</div>
				<div class="col-1 miniSeatBox seatForm seat">
					<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y'}"></c:if>
					<input type="hidden" value="${seatList.get(13).seatCode }">
					<span class="align-middle" id="seatForm">${index+14 }<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y' }">${seat.id }</c:if>
					<c:if test="${seatList.get(13).seatStatus == 0 }"><img class="image-seat" src="/resources/img/seatOrange02.png"></c:if>
					<c:if test="${seatList.get(13).seatStatus == 1 }"><img class="image-seat" src="/resources/img/seatBlue.png"></c:if>
					</span>
				</div>
				
				<div class="col-1 seatNone">
					<img class="image-seat" src="/resources/img/seat빈공간.png">
				</div>
				
				<div class="col-1 miniSeatBox seatForm seat">
					<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y'}"></c:if>
					<input type="hidden" value="${seatList.get(18).seatCode }">
					<span class="align-middle" id="seatForm">${index+19 }<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y' }">${seat.id }</c:if>
					<c:if test="${seatList.get(18).seatStatus == 0 }"><img class="image-seat" src="/resources/img/seatOrange02.png"></c:if>
					<c:if test="${seatList.get(18).seatStatus == 1 }"><img class="image-seat" src="/resources/img/seatBlue.png"></c:if>
					</span>
				</div>
				<div class="col-1 miniSeatBox seatForm seat">
					<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y'}"></c:if>
					<input type="hidden" value="${seatList.get(19).seatCode }">
					<span class="align-middle" id="seatForm">${index+20 }
					<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y' }">${seat.id }</c:if>
					<c:if test="${seatList.get(19).seatStatus == 0 }"><img class="image-seat" src="/resources/img/seatOrange02.png"></c:if>
					<c:if test="${seatList.get(19).seatStatus == 1 }"><img class="image-seat" src="/resources/img/seatBlue.png"></c:if>
					</span>
				</div>	
				
				<!-- //////////////////////////////////////////////////////////// -->
				<div class="col-1 miniSeatBox seatForm seat">
					<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y'}"></c:if>
					<input type="hidden" value="${seatList.get(2).seatCode }">
					<span class="align-middle" id="seatForm">${index+ 3 }<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y' }">${seat.id }</c:if>
					<c:if test="${seatList.get(2).seatStatus == 0 }"><img class="image-seat" src="/resources/img/seatOrange02.png"></c:if>
					<c:if test="${seatList.get(2).seatStatus == 1 }"><img class="image-seat" src="/resources/img/seatBlue.png"></c:if>
					</span>
				</div>
				<div class="col-1 miniSeatBox seatForm seat">
					<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y'}"></c:if>
					<input type="hidden" value="${seatList.get(3).seatCode }">
					<span class="align-middle" id="seatForm">${index+4 }
					<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y' }">${seat.id }</c:if>
					<c:if test="${seatList.get(3).seatStatus == 0 }"><img class="image-seat" src="/resources/img/seatOrange02.png"></c:if>
					<c:if test="${seatList.get(3).seatStatus == 1 }"><img class="image-seat" src="/resources/img/seatBlue.png"></c:if>
					</span>
				</div>
				<div class="col-1 seatNone">
					<img class="image-seat" src="/resources/img/seat빈공간.png">
				</div>
				
				<div class="col-1 miniSeatBox seatForm seat">
					<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y'}"></c:if>
					<input type="hidden" value="${seatList.get(8).seatCode }">
					<span class="align-middle" id="seatForm">${index+9 }<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y' }">${seat.id }</c:if>
					<c:if test="${seatList.get(8).seatStatus == 0 }"><img class="image-seat" src="/resources/img/seatOrange02.png"></c:if>
					<c:if test="${seatList.get(8).seatStatus == 1 }"><img class="image-seat" src="/resources/img/seatBlue.png"></c:if>
					</span>
				</div>
				<div class="col-1 miniSeatBox seatForm seat">
					<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y'}"></c:if>
					<input type="hidden" value="${seatList.get(9).seatCode }">
					<span class="align-middle" id="seatForm">${index+10 }
					<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y' }">${seat.id }</c:if>
					<c:if test="${seatList.get(9).seatStatus == 0 }"><img class="image-seat" src="/resources/img/seatOrange02.png"></c:if>
					<c:if test="${seatList.get(9).seatStatus == 1 }"><img class="image-seat" src="/resources/img/seatBlue.png"></c:if>
					</span>
				</div>					

				<div class="col-1 seatNone">
					<img class="image-seat" src="/resources/img/seat빈공간.png">
				</div>
				
				<div class="col-1 miniSeatBox seatForm seat">
					<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y'}"></c:if>
					<input type="hidden" value="${seatList.get(14).seatCode }">
					<span class="align-middle" id="seatForm">${index+ 15 }<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y' }">${seat.id }</c:if>
					<c:if test="${seatList.get(14).seatStatus == 0 }"><img class="image-seat" src="/resources/img/seatOrange02.png"></c:if>
					<c:if test="${seatList.get(14).seatStatus == 1 }"><img class="image-seat" src="/resources/img/seatBlue.png"></c:if>
					</span>
				</div>
				<div class="col-1 miniSeatBox seatForm seat">
					<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y'}"></c:if>
					<input type="hidden" value="${seatList.get(15).seatCode }">
					<span class="align-middle" id="seatForm">${index+16 }
					<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y' }">${seat.id }</c:if>
					<c:if test="${seatList.get(15).seatStatus == 0 }"><img class="image-seat" src="/resources/img/seatOrange02.png"></c:if>
					<c:if test="${seatList.get(15).seatStatus == 1 }"><img class="image-seat" src="/resources/img/seatBlue.png"></c:if>
					</span>
				</div>
						
				<div class="col-1 seatNone">
					<img class="image-seat" src="/resources/img/seat빈공간.png">
				</div>
				
				<div class="col-1 miniSeatBox seatForm seat">
					<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y'}"></c:if>
					<input type="hidden" value="${seatList.get(20).seatCode }">
					<span class="align-middle" id="seatForm">${index+21 }<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y' }">${seat.id }</c:if>
					<c:if test="${seatList.get(20).seatStatus == 0 }"><img class="image-seat" src="/resources/img/seatOrange02.png"></c:if>
					<c:if test="${seatList.get(20).seatStatus == 1 }"><img class="image-seat" src="/resources/img/seatBlue.png"></c:if>
					</span>
				</div>
				<div class="col-1 miniSeatBox seatForm seat">
					<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y'}"></c:if>
					<input type="hidden" value="${seatList.get(21).seatCode }">
					<span class="align-middle" id="seatForm">${index+22 }
					<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y' }">${seat.id }</c:if>
					<c:if test="${seatList.get(21).seatStatus == 0 }"><img class="image-seat" src="/resources/img/seatOrange02.png"></c:if>
					<c:if test="${seatList.get(21).seatStatus == 1 }"><img class="image-seat" src="/resources/img/seatBlue.png"></c:if>
					</span>
				</div>	
				
				<!-- //////////////////////////////////////////////////////////// -->
				<div class="col-1 miniSeatBox seatForm seat">
					<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y'}"></c:if>
					<input type="hidden" value="${seatList.get(4).seatCode }">
					<span class="align-middle" id="seatForm">${index+ 5 }<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y' }">${seat.id }</c:if>
					<c:if test="${seatList.get(4).seatStatus == 0 }"><img class="image-seat" src="/resources/img/seatOrange02.png"></c:if>
					<c:if test="${seatList.get(4).seatStatus == 1 }"><img class="image-seat" src="/resources/img/seatBlue.png"></c:if>
					</span>
				</div>
				<div class="col-1 miniSeatBox seatForm seat">
					<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y'}"></c:if>
					<input type="hidden" value="${seatList.get(5).seatCode }">
					<span class="align-middle" id="seatForm">${index+6 }
					<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y' }">${seat.id }</c:if>
					<c:if test="${seatList.get(5).seatStatus == 0 }"><img class="image-seat" src="/resources/img/seatOrange02.png"></c:if>
					<c:if test="${seatList.get(5).seatStatus == 1 }"><img class="image-seat" src="/resources/img/seatBlue.png"></c:if>
					</span>
				</div>
				<div class="col-1 seatNone">
					<img class="image-seat" src="/resources/img/seat빈공간.png">
				</div>
				<div class="col-1 miniSeatBox seatForm seat">
					<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y'}"></c:if>
					<input type="hidden" value="${seatList.get(10).seatCode }">
					<span class="align-middle" id="seatForm">${index+11 }
					<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y' }">${seat.id }</c:if>
					<c:if test="${seatList.get(10).seatStatus == 0 }"><img class="image-seat" src="/resources/img/seatOrange02.png"></c:if>
					<c:if test="${seatList.get(10).seatStatus == 1 }"><img class="image-seat" src="/resources/img/seatBlue.png"></c:if>
					</span>
				</div>
				<div class="col-1 miniSeatBox seatForm seat">
					<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y'}"></c:if>
					<input type="hidden" value="${seatList.get(11).seatCode }">
					<span class="align-middle" id="seatForm">${index+ 12 }<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y' }">${seat.id }</c:if>
					<c:if test="${seatList.get(11).seatStatus == 0 }"><img class="image-seat" src="/resources/img/seatOrange02.png"></c:if>
					<c:if test="${seatList.get(11).seatStatus == 1 }"><img class="image-seat" src="/resources/img/seatBlue.png"></c:if>
					</span>
				</div>
				
				<div class="col-1 seatNone">
					<img class="image-seat" src="/resources/img/seat빈공간.png">
				</div>
				<div class="col-1 miniSeatBox seatForm seat">
					<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y'}"></c:if>
					<input type="hidden" value="${seatList.get(16).seatCode }">
					<span class="align-middle" id="seatForm">${index+17 }<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y' }">${seat.id }</c:if>
					<c:if test="${seatList.get(16).seatStatus == 0 }"><img class="image-seat" src="/resources/img/seatOrange02.png"></c:if>
					<c:if test="${seatList.get(16).seatStatus == 1 }"><img class="image-seat" src="/resources/img/seatBlue.png"></c:if>
					</span>
				</div>
				<div class="col-1 miniSeatBox seatForm seat">
					<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y'}"></c:if>
					<input type="hidden" value="${seatList.get(17).seatCode }">
					<span class="align-middle" id="seatForm">${index+18 }
					<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y' }">${seat.id }</c:if>
					<c:if test="${seatList.get(17).seatStatus == 0 }"><img class="image-seat" src="/resources/img/seatOrange02.png"></c:if>
					<c:if test="${seatList.get(17).seatStatus == 1 }"><img class="image-seat" src="/resources/img/seatBlue.png"></c:if>
					</span>
				</div>		
						
				<div class="col-1 seatNone">
					<img class="image-seat" src="/resources/img/seat빈공간.png">
				</div>
				
				<div class="col-1 miniSeatBox seatForm seat">
					<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y'}"></c:if>
					<input type="hidden" value="${seatList.get(22).seatCode }">
					<span class="align-middle" id="seatForm">${index+23 }<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y' }">${seat.id }</c:if>
					<c:if test="${seatList.get(22).seatStatus == 0 }"><img class="image-seat" src="/resources/img/seatOrange02.png"></c:if>
					<c:if test="${seatList.get(22).seatStatus == 1 }"><img class="image-seat" src="/resources/img/seatBlue.png"></c:if>
					</span>
				</div>
				<div class="col-1 miniSeatBox seatForm seat">
					<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y'}"></c:if>
					<input type="hidden" value="${seatList.get(23).seatCode }">
					<span class="align-middle" id="seatForm">${index+24 }
					<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y' }">${seat.id }</c:if>
					<c:if test="${seatList.get(23).seatStatus == 0 }"><img class="image-seat" src="/resources/img/seatOrange02.png"></c:if>
					<c:if test="${seatList.get(23).seatStatus == 1 }"><img class="image-seat" src="/resources/img/seatBlue.png"></c:if>
					</span>
				</div>	
				
				<!-- //////////////////////////////////////////////////////////// -->								
				
				
			</div>
			<div class="row justify-content-center text-center mb-5" style="width: 1100px; margin: 0 auto;">
				<c:choose>
				<c:when test="${not empty seatList }">
				
				</c:when>
					<c:otherwise>
						좌석정보를 확인할 수 없습니다.
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	
	


<c:choose>
<c:when test="${sessionScope.loginInfo.isAdmin eq 'Y' }">
	
	
	<div class="col-12" id="minimin" style="margin: 0 auto;"></div>
	
	<!-- 이모티콘 구획 -->
	<div class="col-12 container" style="width: 1100px; margin: 0 auto;">
		<div class="row justify-content-center mt-5 align-middle">
			<div class="col-6 text-center">	
			<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-emoji-smile" viewBox="0 0 16 16">
  				<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
  				<path d="M4.285 9.567a.5.5 0 0 1 .683.183A3.498 3.498 0 0 0 8 11.5a3.498 3.498 0 0 0 3.032-1.75.5.5 0 1 1 .866.5A4.498 4.498 0 0 1 8 12.5a4.498 4.498 0 0 1-3.898-2.25.5.5 0 0 1 .183-.683zM7 6.5C7 7.328 6.552 8 6 8s-1-.672-1-1.5S5.448 5 6 5s1 .672 1 1.5zm4 0c0 .828-.448 1.5-1 1.5s-1-.672-1-1.5S9.448 5 10 5s1 .672 1 1.5z"/>
			</svg>
			</div>
			<div class="col-8 text-center mt-3 mb-5">	
				Admin's work table area 
			</div>
		</div>
	</div>
	
	<!-- 스크롤 구획 -->
	<div class="row justify-content-center mb-3 mt-3">
		<div class="col-11 text-center recordListTitleDiv" style="width: 1100px; margin: 0 auto;">
			<div><h3>열람실좌석 이용기록</h3></div>
			<div>(전체기록 조회)</div>		
		
		</div>
	</div>
<!-- 		<div class="col-3" id="dateLine" class="input-group"> 
			<input type="date" name="recordStartDate" id="searchBeforeDate" class="form-control input-group" >
		</div>
		<span>~</span>
		
		<div class="col-3" id="dateLine" class="input-group"> 
			<input type="date" name="recordEndDate" id="searchNowDate" class="form-control input-group" >
		</div> -->
	<div class="row justify-content-center mb-3 mt-3">
		<div class="col-4 mt-3 justify-content-end">
			<div class="input-group mb-3 text-end">
			  <input type="date" id="searchBeforeDate" name="recordStartDate" class="form-control" aria-describedby="inputGroup-sizing-default" >
			  <span style="align-self: center;">&nbsp;~&nbsp;</span>
			  <input type="date" id="searchNowDate" name="recordEndDate" class="form-control" aria-describedby="inputGroup-sizing-default">
			</div>	
		</div>
		<div class="col-4 ml-0 ps-1 mt-3" id="searchBar">
			<div class="input-group text-center">                                                        
				<input type="text" name="searchId" id="searchId" class="form-control" placeholder="아이디를 입력하세요.">                                  
				<input type="button" value="검색" class="searchRecord input-group-text gap-2 col-2 btn-primary">
				<input type="button" value="초기화" class="searchRecordReset input-group-text gap-2 btn-primary" style="margin-left : 3px;">
	  		</div>  
		</div>
    </div>
    <div class="tableDiv overflow-auto searchRecordList" style="height: 600px;">
	<table class="table text-center">
  	<thead>
    	<tr class="text-center mt-5">
     		<th scope="col">기록번호</th>
     		<th scope="col">사용자</th>
     		<th scope="col">좌석번호</th>
     		<th scope="col">입실시간</th>
     		<th scope="col">퇴실시간</th>
    	</tr>
  	</thead>
 	 <tbody>
  		<c:choose>
		<c:when test="${not empty seatRecordList }">
		<c:forEach items="${seatRecordList }" var="record" varStatus="status">

		<tr>
			<td class="seat mx-1">${record.recordCode }</td>
			<td>${record.id }</td>
			<td>열람-${record.seatCode }</td> 
			<td>${record.seatInDate }</td>
			<td>${record.seatOutDate }</td>
		</tr>	
		
		</c:forEach>
		</c:when>
		</c:choose>

 	</tbody>
	</table>
	</div>
</c:when>
<c:otherwise>
	<div class="col-12 container mb-5">
		<div class="row justify-content-center mb-5 align-middle">
			<div class="col-12">
				<div class="row justify-content-center mb-5">
					<div class="col-6 text-center mt-5">	
					<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-emoji-smile" viewBox="0 0 16 16">
  						<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
  						<path d="M4.285 9.567a.5.5 0 0 1 .683.183A3.498 3.498 0 0 0 8 11.5a3.498 3.498 0 0 0 3.032-1.75.5.5 0 1 1 .866.5A4.498 4.498 0 0 1 8 12.5a4.498 4.498 0 0 1-3.898-2.25.5.5 0 0 1 .183-.683zM7 6.5C7 7.328 6.552 8 6 8s-1-.672-1-1.5S5.448 5 6 5s1 .672 1 1.5zm4 0c0 .828-.448 1.5-1 1.5s-1-.672-1-1.5S9.448 5 10 5s1 .672 1 1.5z"/>
					</svg>
					</div>
					<div class="col-8 text-center mt-3 mb-3">	
						<h3>열람실 이용안내</h3>
					</div>
					<div class="col-7 miniTitle mt-3 mb-2">
						<svg style="vertical-align:text-top;" xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-book" viewBox="0 0 16 16"><path d="M1 2.828c.885-.37 2.154-.769 3.388-.893 1.33-.134 2.458.063 3.112.752v9.746c-.935-.53-2.12-.603-3.213-.493-1.18.12-2.37.461-3.287.811V2.828zm7.5-.141c.654-.689 1.782-.886 3.112-.752 1.234.124 2.503.523 3.388.893v9.923c-.918-.35-2.107-.692-3.287-.81-1.094-.111-2.278-.039-3.213.492V2.687zM8 1.783C7.015.936 5.587.81 4.287.94c-1.514.153-3.042.672-3.994 1.105A.5.5 0 0 0 0 2.5v11a.5.5 0 0 0 .707.455c.882-.4 2.303-.881 3.68-1.02 1.409-.142 2.59.087 3.223.877a.5.5 0 0 0 .78 0c.633-.79 1.814-1.019 3.222-.877 1.378.139 2.8.62 3.681 1.02A.5.5 0 0 0 16 13.5v-11a.5.5 0 0 0-.293-.455c-.952-.433-2.48-.952-3.994-1.105C10.413.809 8.985.936 8 1.783z"/></svg>
						도담도서관 회원이면 누구나 이용가능합니다.
					</div>
					<div class="col-7 miniTitle mb-2">
						<svg style="vertical-align:text-top;" xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-book" viewBox="0 0 16 16"><path d="M1 2.828c.885-.37 2.154-.769 3.388-.893 1.33-.134 2.458.063 3.112.752v9.746c-.935-.53-2.12-.603-3.213-.493-1.18.12-2.37.461-3.287.811V2.828zm7.5-.141c.654-.689 1.782-.886 3.112-.752 1.234.124 2.503.523 3.388.893v9.923c-.918-.35-2.107-.692-3.287-.81-1.094-.111-2.278-.039-3.213.492V2.687zM8 1.783C7.015.936 5.587.81 4.287.94c-1.514.153-3.042.672-3.994 1.105A.5.5 0 0 0 0 2.5v11a.5.5 0 0 0 .707.455c.882-.4 2.303-.881 3.68-1.02 1.409-.142 2.59.087 3.223.877a.5.5 0 0 0 .78 0c.633-.79 1.814-1.019 3.222-.877 1.378.139 2.8.62 3.681 1.02A.5.5 0 0 0 16 13.5v-11a.5.5 0 0 0-.293-.455c-.952-.433-2.48-.952-3.994-1.105C10.413.809 8.985.936 8 1.783z"/></svg>
						빈 좌석을 확인하신 후 프론트의 사서에게 좌석을 신청해주세요.
					</div>
					<div class="col-7 miniTitle mb-5">
						<svg style="vertical-align:text-top;" xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-book" viewBox="0 0 16 16"><path d="M1 2.828c.885-.37 2.154-.769 3.388-.893 1.33-.134 2.458.063 3.112.752v9.746c-.935-.53-2.12-.603-3.213-.493-1.18.12-2.37.461-3.287.811V2.828zm7.5-.141c.654-.689 1.782-.886 3.112-.752 1.234.124 2.503.523 3.388.893v9.923c-.918-.35-2.107-.692-3.287-.81-1.094-.111-2.278-.039-3.213.492V2.687zM8 1.783C7.015.936 5.587.81 4.287.94c-1.514.153-3.042.672-3.994 1.105A.5.5 0 0 0 0 2.5v11a.5.5 0 0 0 .707.455c.882-.4 2.303-.881 3.68-1.02 1.409-.142 2.59.087 3.223.877a.5.5 0 0 0 .78 0c.633-.79 1.814-1.019 3.222-.877 1.378.139 2.8.62 3.681 1.02A.5.5 0 0 0 16 13.5v-11a.5.5 0 0 0-.293-.455c-.952-.433-2.48-.952-3.994-1.105C10.413.809 8.985.936 8 1.783z"/></svg>
						비회원은 프론트에서 도서관 회원가입을 해주세요.
					</div>	
				</div>

			</div>
			
	

			
			
		</div>
	</div>
</c:otherwise>
</c:choose>
	</div>
	
<!-- ComeOnSeatIdModal -->
<div class="modal fade" id="ComeOnSeatIdModal" tabindex="-1" aria-labelledby="deleteConfirmModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="deleteConfirmModalLabel" style="color: black;">알림</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" style="color: black;">
			<p>ID를 입력해주세요.</p>
      </div>
      <div class="modal-footer" style="display: block;">
		<div class="row">
      		<div class="col-12 text-end">
      			<button type="button" class="btn btn-secondary px-4" data-bs-dismiss="modal">닫기</button>
      		</div>
      	</div>
      </div>
    </div>
  </div>
</div>

<!-- EmptySeatIdModal -->
<div class="modal fade" id="EmptySeatIdModal" tabindex="-1" aria-labelledby="deleteConfirmModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="deleteConfirmModalLabel" style="color: black;">알림</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" style="color: black;">
			<p>없는 ID 입니다. 회원가입을 해주세요.</p>
      </div>
      <div class="modal-footer" style="display: block;">
		<div class="row">
      		<div class="col-12 text-end">
      			<button type="button" class="btn btn-secondary px-4" data-bs-dismiss="modal">닫기</button>
      		</div>
      	</div>
      </div>
    </div>
  </div>
</div>

<!-- clearSeatIdModal -->
<div class="modal fade" id="clearSeatIdModal" tabindex="-1" aria-labelledby="deleteConfirmModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="deleteConfirmModalLabel" style="color: black;">알림</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" style="color: black;">
			<p>좌석 및 ID 확인 완료</p>
      </div>
      <div class="modal-footer" style="display: block;">
		<div class="row">
      		<div class="col-12 text-end">
      			<button type="button" class="btn btn-secondary px-4" data-bs-dismiss="modal">닫기</button>
      		</div>
      	</div>
      </div>
    </div>
  </div>
</div>

<!-- imiittnunZuasuk -->
<div class="modal fade" id="imiittnunZuasuk" tabindex="-1" aria-labelledby="deleteConfirmModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="deleteConfirmModalLabel" style="color: black;">알림</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" style="color: black;">
			<p>이미 배정된 좌석이 있습니다.</p>
      </div>
      <div class="modal-footer" style="display: block;">
		<div class="row">
      		<div class="col-12 text-end">
      			<button type="button" class="btn btn-secondary px-4" data-bs-dismiss="modal">닫기</button>
      		</div>
      	</div>
      </div>
    </div>
  </div>
</div>

</body>
</html>



