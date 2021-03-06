<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/template/js/menu.js?ver=42"></script>
<script>
$(function() {
	$(window).scroll(function() { 
		if ($(this).scrollTop() > 200) { 
			$('#topBtn').fadeIn(); } 
		else { $('#topBtn').fadeOut(); }
	}); 
	$("#topBtn").click(function() { 
   	$('html, body').animate({ scrollTop : 0  }, 300); 
    return false; });
	
	$(window).load(function() {
		$('.modal').modal({backdrop: 'static', keyboard: false});	
	}); 
	
});
</script>
<style type="text/css">
.dropdown-toggle::after {
    display:none;
}
.title {
	color: white;
	margin-left: 15px;
	margin-right: 15px;
}
.logo:hover {
	cursor: pointer;
}
.dropdown-item:active {
	background-color: #0b70b9;
}
.page-item .page-link {
    z-index: 3;
    color: black;
}
.page-item.active .page-link {
    z-index: 3;
    background-color: #0b70b9;
    color: white;
    border-color: #0b70b9;
}
.contentOver {
	text-overflow: ellipsis;
	overflow: hidden;
	 display: -webkit-box;
  	-webkit-line-clamp: 1;
  	-webkit-box-orient: vertical;
}
#myMessageT tr:hover {
	cursor: pointer;
}
#messageMenu:before {
    content: ' \2709';
    color: white;
}
.modal.modal-center {
  text-align: center;
}
#myMessageT th {
	background: none;
}
.modal {
	position: fixed;
	top: 50%;
	left: 50%;
	-webkit-transform: translate(-50%, -50%);
	-moz-transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
	-o-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
}
.messageDiv {
	max-height: 300px;
	overflow-y: scroll;
	-ms-overflow-style: none; /* IE and Edge */
    scrollbar-width: none; /* Firefox */
}
.messageDiv::-webkit-scrollbar {
    display: none; /* Chrome, Safari, Opera*/
    width: 0 !important;
}
</style>
</head>
<body>

<!-- ????????? ????????? ?????? -->
<div class="row mt-3 mb-1 menu1" style="font-size: 16px;">
		<div class="col">
		<!-- ???????????? -->
		<c:choose>
			<c:when test="${not empty sessionScope.loginInfo and sessionScope.loginInfo.isAdmin eq 'N' }">
	 			<ul class="nav justify-content-end">

				<li class="nav-item">
					<a class="title" aria-current="page" href="/myPage/myInfo?menuCode=MENU_005">???????????????, <span style="text-decoration: underline 1px white; vertical-align: baseline;">${loginInfo.name }</span>??? :)</a>
				</li>
				<li class="nav-item">
					<img class="line" src="/resources/img/top_line.jpg">
				</li>
				<li class="nav-item">
					<a class="title" id="messageMenu" onclick="selectMessageList('${sessionScope.loginInfo.id}');" data-bs-toggle="modal" data-bs-target="#myMessageModal" >
					<c:choose>
						<c:when test="${unReadCnt eq 0 }">?????????</c:when>
						<c:when test="${unReadCnt ne 0 }"><span style="text-decoration: underline 1px white; vertical-align: baseline;">${unReadCnt }</span>?????? ????????? ??????</c:when>
					</c:choose>
					</a>
				</li>
				<li class="nav-item">
					<img class="line" src="/resources/img/top_line.jpg">
				</li>				
				<li class="nav-item">
					<a class="title" aria-current="page" id="logout">????????????</a>
				</li>
				</ul>
			</c:when>
			<c:when test="${not empty sessionScope.loginInfo and sessionScope.loginInfo.isAdmin eq 'Y' }">
	 			<ul class="nav justify-content-end">
				<li class="nav-item">
					<a class="title" aria-current="page" href="/libManage/bookManage?menuCode=MENU_006">???????????????, <span style="text-decoration: underline 1px white; vertical-align: baseline;">${loginInfo.name }</span>??? :)</a>
				</li>
				<li class="nav-item">
					<img class="line" src="/resources/img/top_line.jpg">
				</li>
				<li class="nav-item">
					<a class="title" aria-current="page" id="logout">????????????</a>
				</li>
				</ul>
			</c:when>
			
			<c:otherwise>
		<!-- ??????????????? -->
			<ul class="nav justify-content-end">
			<li class="nav-item">
				<a class="title" aria-current="page" href="/member/memberJoinInfo" >????????????</a>
			</li>
			<li class="nav-item">
				<img class="line" src="/resources/img/top_line.jpg">
			</li>
			<li class="nav-item">
				<a class="title" aria-current="page" href="/member/memberLoginForm">?????????</a>
			</li>
			</ul>
			</c:otherwise>
		</c:choose>
		</div>
</div>

<!-- ?????? -->
<div class="row mb-2 menu2">
	<div class="col-12 text-center mb-3">
		<img class="logo" width="300px" src="/resources/img/lib_logo_w.png" onclick="location.href='/common/main'">
	</div>
	<div class="col-12 pb-2">
		<ul class="nav justify-content-center">
			<li class="nav-item">
				<img class="line" src="/resources/img/top_line.jpg">
			</li>
		<c:forEach var="menu" items="${menuList }">
			<li class="nav-item">
				<!-- ????????? ????????? ????????? ?????? ????????? ???????????? ?????? --???  -->
				<a class="dropdown-toggle title" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">${menu.menuName}</a>
				<ul class="dropdown-menu">
				<c:forEach var="sideMenu" items="${menu.sideMenuList }">
					<li><a class="dropdown-item" href="/${menu.menuUri}/${sideMenu.sideMenuUri }?menuCode=${sideMenu.menuCode}&sideMenuCode=${sideMenu.sideMenuCode}">${sideMenu.sideMenuName }</a></li>
				</c:forEach>
				</ul>
			</li>
			<li class="nav-item">
				<img class="line" src="/resources/img/top_line.jpg">
			</li>
		</c:forEach>
		</ul>
	</div>
</div>


<!-- ?????? ?????? Modal -->
<div class="modal fade" style="width: 800px;" id="myMessageModal" tabindex="-1" aria-labelledby="myMessageModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" >
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="myMessageModalLabel" style="color: black;">?????????</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
		<div class="modal-body">
		  <div class="container-fluid messageDiv">
		    <table id="myMessageT" class="table table-hover table-bordered text-center caption-top" style="width: 100%;">
		    	<thead>
		    	<tr>
		    		<th width="60%">??????</th>
		    		<th width="20%">?????????</th>
		    		<th width="20%">????????????</th>
		    	</tr>
		    	</thead>
		    	<tbody style="font-size: 16px;">
		    	<tr>
		    		<td colspan="3">
		    		????????? ????????????.
		    		</td>
		    	</tr>
		    	</tbody>
		    </table>
		  </div>
		</div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary px-5" data-bs-dismiss="modal">??????</button>
      </div>
    </div>
  </div>
</div>
<!-- ???????????? modal ?????? -->

<!-- ?????? ???????????? modal -->
<div class="modal fade" style="width: 800px;" id="detailModal" tabindex="-1" aria-labelledby="detailModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="detailModalLabel" style="color: black;">??????</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
		<div class="modal-body">
			<div class="container-fluid">
			    <table class="table table-hover table-bordered text-first caption-top" style="width: 100%;">
			    	<tr>
			    		<td id="fromIdText" style="font-size: 17px;">?????????</td>
			    	</tr>
			    	<tr>
			    		<td id="sendDateText" style="font-size: 17px; color: gray;" >????????????</td>
			    	</tr>
			    	<tr>
			    		<td id="contentText">??????</td>
			    	</tr>
			    </table>
			</div>
		</div>
      <div class="modal-footer" style="display: block;">
      	<div class="row">
      		<div class="col-6 text-first">
      			<button type="button" onclick="selectMessageList('${sessionScope.loginInfo.id}');" class="btn btn-primary px-4 messageListBtn">??????</button>
      		</div>
      		<div class="col-6 text-end">
       			<button type="button" class="btn btn-danger px-4 messageDeleteBtn">??????</button>
        		<button type="button" class="btn btn-secondary px-4" data-bs-dismiss="modal">??????</button>
      		</div>
      	</div>
      </div>
    </div>
  </div>
</div>
<!-- ?????? ???????????? modal ?????? -->

<!-- ?????? contirm modal -->
<div class="modal fade" id="deleteConfirmModal" tabindex="-1" aria-labelledby="deleteConfirmModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="deleteConfirmModalLabel" style="color: black;">??????</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" style="color: black;">
			<p>????????? ?????????????????????????</p>
      </div>
      <div class="modal-footer" style="display: block;">
		<div class="row">
      		<div class="col-6 text-first">
      			<button type="button" class="btn btn-secondary px-4 deleteReturnBtn" onclick="selectMessageList('${sessionScope.loginInfo.id}');" >????????????</button>
      		</div>
      		<div class="col-6 text-end">
       			<button type="button" class="btn btn-danger px-4 lastDeleteBtn" >??????</button>
      		</div>
      	</div>
      </div>
    </div>
  </div>
</div>
<!-- ?????? contirm modal ?????? -->

<!-- ?????? ?????? modal -->
<div class="modal fade" id="deleteCompleteModal" tabindex="-1" aria-labelledby="fdeleteCompleteModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="deleteCompleteModal" style="color: black;">??????</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
			<p style="color: black;">????????? ?????????????????????.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary px-4 deleteCompleteBtn" onclick="selectMessageList('${sessionScope.loginInfo.id}');" >??????</button>
      </div>
    </div>
  </div>
</div>
<!-- ?????? ?????? modal ?????? -->


<!-- ???????????? modal -->
<div class="modal fade" id="logoutModal" tabindex="-1" aria-labelledby="logoutModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="logoutModalModal" style="color: black;">??????</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
			<p style="color: black;">???????????? ???????????????????</p>
      </div>
      <div class="modal-footer">
        <button type="button" id="logoutModalBtn" class="btn btn-primary px-4" >??????</button>
        <button type="button" class="btn btn-secondary px-4" data-bs-dismiss="modal">??????</button>
      </div>
    </div>
  </div>
</div>
<!-- ???????????? modal ?????? -->


</body>
</html>























