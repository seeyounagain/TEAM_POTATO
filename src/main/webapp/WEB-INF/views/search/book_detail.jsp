<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TITLE</title>
<script type="text/javascript" src="/resources/search/js/book_detail.js?ver=9" ></script>
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
</style>
</head>
<body>

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
</body>
</html>