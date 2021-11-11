<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/service/js/bookRequest.js?ver=1"></script>
<style type="text/css">
.miniTitle {
	font-size: 20px;
}
</style>
</head>
<body>

	
	
<h2 class="text-first fw-bold">도서비치신청</h2><hr>
<input type="hidden" value="${menuVO.menuCode }" class="menuCode">
<div class="row justify-content-center">
	<!-- 이모티콘 구획 -->
	<div class="col-12 container mb-5">
		<div class="row justify-content-center align-middle">
			<div class="col-6 text-center mt-5">	
			<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-emoji-smile" viewBox="0 0 16 16">
  				<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
  				<path d="M4.285 9.567a.5.5 0 0 1 .683.183A3.498 3.498 0 0 0 8 11.5a3.498 3.498 0 0 0 3.032-1.75.5.5 0 1 1 .866.5A4.498 4.498 0 0 1 8 12.5a4.498 4.498 0 0 1-3.898-2.25.5.5 0 0 1 .183-.683zM7 6.5C7 7.328 6.552 8 6 8s-1-.672-1-1.5S5.448 5 6 5s1 .672 1 1.5zm4 0c0 .828-.448 1.5-1 1.5s-1-.672-1-1.5S9.448 5 10 5s1 .672 1 1.5z"/>
			</svg>
			</div>
			<div class="col-8 text-center mt-3 mb-3">	
				<h3>이용안내</h3>
			</div>				
			
		<div class="col-12">

<div class="row justify-content-center"> <!-- 도서비치그림구획 -->		
<div class="col-11 miniTitle mb-2">
<svg style="vertical-align:text-top;" xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-book" viewBox="0 0 16 16"><path d="M1 2.828c.885-.37 2.154-.769 3.388-.893 1.33-.134 2.458.063 3.112.752v9.746c-.935-.53-2.12-.603-3.213-.493-1.18.12-2.37.461-3.287.811V2.828zm7.5-.141c.654-.689 1.782-.886 3.112-.752 1.234.124 2.503.523 3.388.893v9.923c-.918-.35-2.107-.692-3.287-.81-1.094-.111-2.278-.039-3.213.492V2.687zM8 1.783C7.015.936 5.587.81 4.287.94c-1.514.153-3.042.672-3.994 1.105A.5.5 0 0 0 0 2.5v11a.5.5 0 0 0 .707.455c.882-.4 2.303-.881 3.68-1.02 1.409-.142 2.59.087 3.223.877a.5.5 0 0 0 .78 0c.633-.79 1.814-1.019 3.222-.877 1.378.139 2.8.62 3.681 1.02A.5.5 0 0 0 16 13.5v-11a.5.5 0 0 0-.293-.455c-.952-.433-2.48-.952-3.994-1.105C10.413.809 8.985.936 8 1.783z"/></svg>
신청자격 : 도서관 회원
</div>
<div class="col-11 miniTitle mb-2">
<svg style="vertical-align:text-top;" xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-book" viewBox="0 0 16 16"><path d="M1 2.828c.885-.37 2.154-.769 3.388-.893 1.33-.134 2.458.063 3.112.752v9.746c-.935-.53-2.12-.603-3.213-.493-1.18.12-2.37.461-3.287.811V2.828zm7.5-.141c.654-.689 1.782-.886 3.112-.752 1.234.124 2.503.523 3.388.893v9.923c-.918-.35-2.107-.692-3.287-.81-1.094-.111-2.278-.039-3.213.492V2.687zM8 1.783C7.015.936 5.587.81 4.287.94c-1.514.153-3.042.672-3.994 1.105A.5.5 0 0 0 0 2.5v11a.5.5 0 0 0 .707.455c.882-.4 2.303-.881 3.68-1.02 1.409-.142 2.59.087 3.223.877a.5.5 0 0 0 .78 0c.633-.79 1.814-1.019 3.222-.877 1.378.139 2.8.62 3.681 1.02A.5.5 0 0 0 16 13.5v-11a.5.5 0 0 0-.293-.455c-.952-.433-2.48-.952-3.994-1.105C10.413.809 8.985.936 8 1.783z"/></svg>
신청책수 : 1인 월 5권 이내
</div>
<div class="col-11 miniTitle mb-2">
<svg style="vertical-align:text-top;" xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-book" viewBox="0 0 16 16"><path d="M1 2.828c.885-.37 2.154-.769 3.388-.893 1.33-.134 2.458.063 3.112.752v9.746c-.935-.53-2.12-.603-3.213-.493-1.18.12-2.37.461-3.287.811V2.828zm7.5-.141c.654-.689 1.782-.886 3.112-.752 1.234.124 2.503.523 3.388.893v9.923c-.918-.35-2.107-.692-3.287-.81-1.094-.111-2.278-.039-3.213.492V2.687zM8 1.783C7.015.936 5.587.81 4.287.94c-1.514.153-3.042.672-3.994 1.105A.5.5 0 0 0 0 2.5v11a.5.5 0 0 0 .707.455c.882-.4 2.303-.881 3.68-1.02 1.409-.142 2.59.087 3.223.877a.5.5 0 0 0 .78 0c.633-.79 1.814-1.019 3.222-.877 1.378.139 2.8.62 3.681 1.02A.5.5 0 0 0 16 13.5v-11a.5.5 0 0 0-.293-.455c-.952-.433-2.48-.952-3.994-1.105C10.413.809 8.985.936 8 1.783z"/></svg>
이용방법
</div>
<div class="col-11 mb-3">
<p class="mx-3 mb-1">- 비회원 : 회원가입 후 로그인 (필수)								</p> 	
<p class="mx-3 mb-1">- 회원 : '신청하기' 버튼을 클릭해 국립중앙도서관 연계검색 시작	</p> 
<p class="mx-3 mb-1">- 검색된 도서 정보를 클릭하면 자동으로 비치신청서 양식이 완료됨			</p>
<p class="mx-3 mb-0">- 도서비치신청 후 현황 확인										</p>
<p class="mx-3 mb-0 text-center">		
		<input type="hidden" class="loginInfo" value="${sessionScope.loginInfo.id }">
		<input type="button" class="btn btn-primary  btn-lg" value="신청하기" id="goRequest">
		<input type="button" class="btn btn-primary  btn-lg" value="신청현황" id="goRequestStatus">
</p> 
</div>
<div class="col-11 miniTitle">
<svg style="vertical-align:text-top;" xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-book" viewBox="0 0 16 16"><path d="M1 2.828c.885-.37 2.154-.769 3.388-.893 1.33-.134 2.458.063 3.112.752v9.746c-.935-.53-2.12-.603-3.213-.493-1.18.12-2.37.461-3.287.811V2.828zm7.5-.141c.654-.689 1.782-.886 3.112-.752 1.234.124 2.503.523 3.388.893v9.923c-.918-.35-2.107-.692-3.287-.81-1.094-.111-2.278-.039-3.213.492V2.687zM8 1.783C7.015.936 5.587.81 4.287.94c-1.514.153-3.042.672-3.994 1.105A.5.5 0 0 0 0 2.5v11a.5.5 0 0 0 .707.455c.882-.4 2.303-.881 3.68-1.02 1.409-.142 2.59.087 3.223.877a.5.5 0 0 0 .78 0c.633-.79 1.814-1.019 3.222-.877 1.378.139 2.8.62 3.681 1.02A.5.5 0 0 0 16 13.5v-11a.5.5 0 0 0-.293-.455c-.952-.433-2.48-.952-3.994-1.105C10.413.809 8.985.936 8 1.783z"/></svg>
신청결과
</div>
<div class="col-11 mb-3">
<p class="mx-3 mb-1">- (회원)서비스 → 도서비치신청 → 현황 								</p> 	
<p class="mx-3 mb-1">- 소요기간 : 2개월												</p> 	
<p class="mx-3 mb-1">- 도서비치신청 후 현황 확인										</p>
<p class="mx-3 mb-1">- 진행상태안내													</p>
<p class="mx-4 mb-1">· 접수중 → 접수완료 → 진행중 → 완료(자료 열람 및 대출 가능)			</p>
<p class="mx-4 mb-1">· 접수중 : 회원의 도서비치신청 완료								</p>
<p class="mx-4 mb-1">· 접수완료 : 관리자의 도서비치신청 확인								</p>
<p class="mx-4 mb-1">· 진행중 : 도서 구입, 자료의 주제 분류 및 목록작성 등					</p>
<p class="mx-4 mb-1">· 완료 :  자료실에서 열람 및 대충가능								</p>
</div>		

<div class="col-11 miniTitle mb-1">
<svg style="vertical-align:text-top;" xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-book" viewBox="0 0 16 16"><path d="M1 2.828c.885-.37 2.154-.769 3.388-.893 1.33-.134 2.458.063 3.112.752v9.746c-.935-.53-2.12-.603-3.213-.493-1.18.12-2.37.461-3.287.811V2.828zm7.5-.141c.654-.689 1.782-.886 3.112-.752 1.234.124 2.503.523 3.388.893v9.923c-.918-.35-2.107-.692-3.287-.81-1.094-.111-2.278-.039-3.213.492V2.687zM8 1.783C7.015.936 5.587.81 4.287.94c-1.514.153-3.042.672-3.994 1.105A.5.5 0 0 0 0 2.5v11a.5.5 0 0 0 .707.455c.882-.4 2.303-.881 3.68-1.02 1.409-.142 2.59.087 3.223.877a.5.5 0 0 0 .78 0c.633-.79 1.814-1.019 3.222-.877 1.378.139 2.8.62 3.681 1.02A.5.5 0 0 0 16 13.5v-11a.5.5 0 0 0-.293-.455c-.952-.433-2.48-.952-3.994-1.105C10.413.809 8.985.936 8 1.783z"/></svg>
신청 제한 도서
</div>
<div class="col-11 mb-3">
<p class="mx-3 mb-1">- 도서관에 소장되어있는 자료, 구입·정리 중인 자료 		           		</p> 	
<p class="mx-3 mb-1">- 50페이지 미만 도서, 도서의 형태를 취하지만 내용이 거의 없는 자료   		</p> 	
<p class="mx-3 mb-1">- 이용과 관리가 어려운 형태의 자료                         			</p>
<p class="mx-4 mb-1">· 낱장자료(리플릿), 엽서형, 카드형, 병풍형, 스프링 제본, 소책자 등    		</p>
<p class="mx-4 mb-1">· 입체도서 등 교구자료, 장난감책, 사운드북                      			</p>
<p class="mx-4 mb-1">· 스티커북, 퍼즐북, 색칠공부 등                            			</p>
<p class="mx-4 mb-1">· 필사도서 및 워크북                                   				</p>

<p class="mx-3 mb-1">- 지나치게 폭력적이거나 선정성을 띠는 장르소설(무협, 판타지, 로맨스 등), 각종 오락용 출판물(게임, 만화, 퍼즐 등)          		</p> 
<p class="mx-3 mb-1">- 문제집 및 수험서, 초‧중‧고 학습 참고서, 강의·교재용 자료, 문제 및 해설(풀이)이 다량 포함된 일반 도서 		           		</p> 
<p class="mx-3 mb-1">- 가격이 현저하게 고가인 자료 		           						</p> 
<p class="mx-3 mb-1">- ISBN 정보가 부정확한 도서, 품절 및 절판 도서, 출판 예정 도서 		    </p> 
<p class="mx-3 mb-1">- 최근 5년 이전에 발행된 외국 도서 		           					</p> 
<p class="mx-3 mb-1">- 비도서(CD-ROM, DVD, 블루레이 디스크 등), 연속간행물(신문, 잡지) 		</p> 
<p class="mx-3 mb-1">- 기타 도서관 자료 선정 기준에 적합하지 않은 자료 		           		</p> 
<p class="mx-3 mb-1">- ※ 전자책과 오디오북: 해당 홈페이지에서 비치희망자료 신청 가능 		        </p> 
</div>

<div class="col-11 miniTitle mb-1">
<svg style="vertical-align:text-top;" xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-book" viewBox="0 0 16 16"><path d="M1 2.828c.885-.37 2.154-.769 3.388-.893 1.33-.134 2.458.063 3.112.752v9.746c-.935-.53-2.12-.603-3.213-.493-1.18.12-2.37.461-3.287.811V2.828zm7.5-.141c.654-.689 1.782-.886 3.112-.752 1.234.124 2.503.523 3.388.893v9.923c-.918-.35-2.107-.692-3.287-.81-1.094-.111-2.278-.039-3.213.492V2.687zM8 1.783C7.015.936 5.587.81 4.287.94c-1.514.153-3.042.672-3.994 1.105A.5.5 0 0 0 0 2.5v11a.5.5 0 0 0 .707.455c.882-.4 2.303-.881 3.68-1.02 1.409-.142 2.59.087 3.223.877a.5.5 0 0 0 .78 0c.633-.79 1.814-1.019 3.222-.877 1.378.139 2.8.62 3.681 1.02A.5.5 0 0 0 16 13.5v-11a.5.5 0 0 0-.293-.455c-.952-.433-2.48-.952-3.994-1.105C10.413.809 8.985.936 8 1.783z"/></svg>
대출제한자료 관내 이용
</div>
<div class="col-11 mb-10">
<p class="mx-3 mb-1">-「도서관 자료대출 규정」 제3조(대출자료의 범위)에 따라 아래의 자료는 대출이 제한되며 도서관 내에서만 이용할 수 있습니다. 	   		</p> 
<p class="mx-4 mb-1">· 귀중도서, 특수자료                                                               				 			</p> 
<p class="mx-4 mb-1">· 법령집, 회의록 및 가제식자료, 신문자료                                                    					</p> 
<p class="mx-4 mb-1">· 참고도서(사전 등), 연속간행물(단, 정책자료 낱권 등록 연속간행물은 대출 가능), 비도서자료(단, 딸림자료는 대출 가능), 팝업북 		</p> 
<p class="mx-4 mb-1">· 훼손되었거나 열람빈도가 높은 자료                                                        						</p> 
<p class="mx-4 mb-1">· 기타 보존 또는 관리상 특별한 취급을 필요로 하여 대출하기에 부적당한 자료로서 서비스이용과장이 지정한 자료               		</p> 
</div>
	
		
</div>		
	
			
		</div>
		<div class="text-center mb-5">
			<input type="hidden" class="loginInfo" value="${sessionScope.loginInfo.id }">
		</div>
	</div>
	

	</div>
</div>	

<!-- goReg modal -->
<div class="modal fade" id="goRegModal" tabindex="-1" aria-labelledby="deleteConfirmModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="deleteConfirmModalLabel" style="color: black;">알림</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" style="color: black;">
			<p>도서비치신청을 시작합니다.</p>
      </div>
      <div class="modal-footer" style="display: block;">
		<div class="row">
      		<div class="col-12 text-end">
      			<button type="button" class="btn btn-primary px-4" onclick="goRequestRegFormFunction('${menuVO.menuCode}')" >확인</button>
      			<button type="button" class="btn btn-secondary px-4" data-bs-dismiss="modal">취소</button>
      		</div>
      	</div>
      </div>
    </div>
  </div>
</div>





<!-- loginCheckModal -->
<div class="modal fade" id="loginCheckModal" tabindex="-1" aria-labelledby="deleteConfirmModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="deleteConfirmModalLabel" style="color: black;">알림</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" style="color: black;">
			<p>홈페이지에 확인된 ID 정보가 없습니다.</p>
			<p>로그인화면으로 이동하시겠습니까?</p>
      </div>
      <div class="modal-footer" style="display: block;">
		<div class="row">
      		<div class="col-12 text-end">
      			<button type="button" class="btn btn-primary px-4" onclick="location.href='/member/memberLoginForm'" >확인</button>
      			<button type="button" class="btn btn-secondary px-4" data-bs-dismiss="modal">취소</button>
      		</div>
      	</div>
      </div>
    </div>
  </div>
</div>













	
</body>
</html>



