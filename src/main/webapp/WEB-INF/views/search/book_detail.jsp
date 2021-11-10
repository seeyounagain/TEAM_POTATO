<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TITLE</title>
<script type="text/javascript" src="/resources/search/js/book_detail.js?ver=23" ></script>
<style type="text/css">
.content {
	background-color: white;
}
.bookTitle {
	font-size: 22px;
	font-weight: bold;
}
.bookTitle:hover {
	text-decoration: underline 2px black;
	cursor: pointer;
	color: black;
}
.titleA:hover {
	color: black;
}
#mainImg {
	width: 460px;
}
#backIcon:hover {
	cursor: pointer;
}
#topBtn{
	position: fixed;
	right: 25px; 
	bottom: 25px;
	display: none;
	z-index: 9;
}
b, strong {
	vertical-align: top;
}
</style>
</head>
<body>

<a id="topBtn" href="#"><img src="/resources/img/top_b.png" width="50px;" title="위로"></a> 

<div class="row justify-content-center">
	<div class="col-8 mt-3">
		<div class="row">
			<div class="col-sm-12 mb-3 text-end">
				<img id="backIcon" src="/resources/img/back_off.png" onclick="javascript:history.back();" width="30px;" title="뒤로가기">
			</div>
			<div class="col-12 fs-5 mb-3 fst-italic">
				${bookVO.summary }
			</div>
			<hr>
	    	<div class="col-5">
	    		<div class="row justify-content-center">
	    			<img id="mainImg" src="/resources/bookImgUpload/${bookVO.bookImgVO.attachedImgName }">
	    		</div>
	    	</div>
	    	<div class="col-7">
		    	<div class="row mb-4 mt-4 pb-2 border-bottom">
		   		표제사항 : ${bookVO.title }
		    	</div>
		    	<div class="row mb-4 mt-4 pb-2 border-bottom">
		   		저자사항 : ${bookVO.writer }&nbsp;지음<c:if test="${not empty bookVO.translator }">&nbsp;/&nbsp;${bookVO.translator }&nbsp;옮김</c:if>
		    	</div>
		    	<div class="row mb-4 mt-4 pb-2 border-bottom">
		   		발행사항 : ${bookVO.publisher },&nbsp;${bookVO.pubDate }
		    	</div>
		    	<div class="row mb-4 mt-4 pb-2 border-bottom">
		   		형태사항 : 	${bookVO.page }&nbsp;p&nbsp;,&nbsp;${bookVO.bookSize }&nbsp;cm
		    	</div>
		    	<div class="row mb-4 mt-4 pb-2 border-bottom">
		   		청구기호 : ${bookVO.kdc } / ${bookVO.kdcName }
		    	</div>
		    	<div class="row mb-4 mt-4 pb-2 border-bottom">
		   		표준번호(ISBN) : ${bookVO.isbn }
		    	</div>
		    	<div class="row mb-4 mt-4 pb-2 border-bottom">
		   		주제 : #${bookVO.keyword }
		    	</div>
		    	<c:choose>
		    		<c:when test="${bookVO.isDelete eq 'N' }">
				    	<div class="row mb-4 mt-4 pb-2 border-bottom">
				   		자료이용장소 : ${bookVO.area }
				    	</div>
			    		<div class="row mb-4 mt-4 pb-2 border-bottom">
				   		자료상태 : <c:if test="${bookVO.status eq 1 }">대출가능 / 사서에게 문의해주세요</c:if>
				   		<c:if test="${bookVO.status eq 2 }">대출중</c:if>
				   		<c:if test="${bookVO.status eq 3 }">대출중 / 연체중</c:if>
				   		<c:if test="${bookVO.status eq 4 }">대출중 / 예약중</c:if>
				   		<c:if test="${bookVO.status eq 5 }">대출대기중 / 예약중</c:if>
				    	</div>
				   		<c:if test="${bookVO.status eq 2 }">
			    		<div class="row mb-4 mt-4 pb-2 border-bottom">
				   		<input type="button" class="btn btn-primary" id="reserveBtn" value="예약">
				    	</div>
				   		</c:if>
		    		</c:when>
		    		<c:otherwise>
		    			<div class="row mb-4 mt-4 pb-2 border-bottom">
				   		제적된 도서입니다.
				    	</div>
		    		</c:otherwise>
		    	</c:choose>
		   		<input type="hidden" id="id" value="${sessionScope.loginInfo.id }">
		   		<input type="hidden" id="menuCode" value="${menuVO.menuCode }">
		   		<input type="hidden" id="bookCode" value="${bookVO.bookCode }">
	    	</div>
	    	<div class="col-12">
	    		<div class="row mb-4 mt-4 lh-lg">
		   		${bookVO.intro }
		    	</div>
	    	</div>
	    </div>
    </div>
</div>

<!-- book detail alert modal 시작 -->
<div class="modal fade" id="bookDetailAlertModal" tabindex="-1" aria-labelledby="bookDetailAlertModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="bookDetailAlertModalLabel">알림</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id="bookDetailAlertText">
      
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary bookDetailModalBtn" >닫기</button>
      </div>
    </div>
  </div>
</div>
<!-- book detail alert modal 종료 -->

<!-- book detail confirm modal 시작 -->
<div class="modal fade" id="bookDetailConfirmModal" tabindex="-1" aria-labelledby="bookDetailConfirmModalLabel" aria-hidden="true"  data-backdrop="static" data-keyboard="false">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="bookDetailConfirmModalLabel">알림</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id="bookDetailConfirmModalText">
      	도서를 예약하시겠습니까?<br>
      	도서가 반납되면 대출 가능합니다.
      </div>
      <div class="modal-footer">
		 <button type="button" class="btn btn-primary" id="bookReserveModalBtn" onclick="goReserve();">예약</button>     
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
<!-- book detail confirm modal 종료 -->

</body>
</html>