<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/service/js/bookRequestRegForm.js?ver=6"></script>
<style type="text/css">

table{
	width: 100%;
	font-size: 14px;
}
.imogiDiv:hover{
	cursor: pointer;
}
.dataTr > td:hover{
	cursor: pointer;
	color: blue;
}
</style>
</head>
<body>
<h2 class="text-first fw-bold">도서비치신청 검색 및 신청</h2><hr>
<div class="row justify-content-center text-center scrollTop">
<div class="col-12">
	<!-- 이모티콘 구획 -->
			<div class="imogiDiv row justify-content-center align-middle" onclick="location.href='/service/bookRequestRegForm?menuCode=${menuVO.menuCode }'">
			<div class="col-6 text-center">	
			<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-emoji-smile" viewBox="0 0 16 16">
  				<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
  				<path d="M4.285 9.567a.5.5 0 0 1 .683.183A3.498 3.498 0 0 0 8 11.5a3.498 3.498 0 0 0 3.032-1.75.5.5 0 1 1 .866.5A4.498 4.498 0 0 1 8 12.5a4.498 4.498 0 0 1-3.898-2.25.5.5 0 0 1 .183-.683zM7 6.5C7 7.328 6.552 8 6 8s-1-.672-1-1.5S5.448 5 6 5s1 .672 1 1.5zm4 0c0 .828-.448 1.5-1 1.5s-1-.672-1-1.5S9.448 5 10 5s1 .672 1 1.5z"/>
			</svg>
			</div>
<!-- Ajax 시연구간 -->

			<div class="col-12 text-center mt-2">	
				<span id="searchTitle1" style="display:inline;"><h3>희망도서검색</h3></span>
				<span id="searchTitle2" style="display:none;"><h3>도서비치신청서</h3></span>
			</div>
			</div>
			
<!-- 도서비치신청 검색관련 -->
<div class="row justify-content-center text-center">
	
	<div class="row mx-auto justify-content-center">

	<!-- 검색관련/입력구획 -->
	<div class="col-8">
	<form action="/service/bookRequestRegForm" method="post" id="searchAction" enctype="multipart/form-data"><input type="hidden" id="menuCode" name="menuCode" value="${menuVO.menuCode}"> 
	<div class="row mb-3 justify-content-center" id="searchForm" style="display: flex;">    
		<div class="col-10">                                                                                
    		<div class="input-group text-start">                                                                                                                                                  
				<span class="input-group-text gap-2 col-3 btn-primary" id="inputGroupPrepend1">검색키워드</span>                                                           
				<input type="text" name="kwd" id="kwdInput" class="form-control" placeholder="검색할 항목을 입력해주세요" <c:if test="${not empty keyword }">value="${keyword }"</c:if>>
	  		</div>                                                                                                    
	    </div>                                                                                                   
		<div class="col-5 mt-2">                                                                        			                                                                        
    		<div class="input-group">                                                                       	 
				<span class="input-group-text gap-2 col-5 btn-primary" id="inputGroupPrepend3">검색목록</span>        
					 <select class="form-select" name="srchTarget" aria-label="select example">
     	 				<option value="total">전체</option>
      					<option value="title">제목</option>
      					<option value="author">저자</option>
      					<option value="publisher">발행처</option>
      					<option value="cheonggu">청구기호</option>
    				</select>                  		
    		</div>                                                                                          		
    	</div>                                                                                             
    	<div class="col-5 mt-2">                                                                                
    		<div class="input-group text-start">                                                           
				<span class="input-group-text gap-2 col-5 btn-primary" id="inputGroupPrepend1">카테고리</span>        
					<select class="form-select" name="category" aria-label="select example">
     	 				<option value="도서">도서</option>
      					<option value="고서/고문서">고서/고문서</option>
      					<option value="잡지/학술지">저자</option>
      					<option value="멀티미디어">멀티미디어</option>
      					<option value="장애인자료">장애인자료</option>
      					<option value="기타">기타</option>
      					<option value="해외한국관련기록물">해외한국관련기록물</option>
    				</select>                                 
	  		</div>                                                                                         
	    </div>                                                      
		<div class="col-5 mt-2">                                                                        			 
    		<div class="input-group">                                                                       	 
				<span class="input-group-text gap-2 col-5 btn-primary" id="inputGroupPrepend3">정렬기준</span>            
				    <select class="form-select" name="sort" aria-label="select example">
     	 				<option value="">정확도순</option>
      					<option value="ititle">제목</option>
      					<option value="iauthor">저자</option>
      					<option value="ipublisher">발행처</option>
      					<option value="ipub_year">발행년도</option>
      					<option value="cheonggu">청구기호</option>
    				</select>                        			 
    		</div>                                                                                          			 
    	</div>                                                                                             
    	<div class="col-5 mt-2">                                                                                
    		<div class="input-group text-start">                                                           
				<span class="input-group-text gap-2 col-5 btn-primary" id="inputGroupPrepend1">*ISBN CODE</span>            
				<input type="text" name="isbnCode" id="isbnInput" class="form-control" placeholder="선택사항">                                  
	  		</div>                                                                                         
	    </div>  
	    <div class="col-10 mt-2">                                                                                
    		<div class="text-center fs-15">                                                           
                *ISBN 코드를 입력하시면 정확한 검색을 할 수 있습니다.
	  		</div>                                                                                         
	    </div> 
		<div class="col-8 mt-2">                                                                                
    		<div class="text-center">                                                           
                <input class="btn btn-primary" type="submit" id="submit" value="국립중앙도서관 연계검색" style="width: 100%;"></input>                
	  		</div>                                                                                         
	    </div> 
	</div>
	</form>
	</div>
	
	<!-- 등록관련구획 -->
	<div class="col-8">
	<form action="/service/regBookRequest" method="post"><input type="hidden" id="menuCode" name="menuCode" value="${menuVO.menuCode}"> 
	<div class="row mb-3 justify-content-center" id="regForm" style="display: none;"> 
		<div class="col-10">                                                                                
    		<div class="input-group text-start">                                                                                                                                                  
				<span class="input-group-text gap-2 col-3 btn-primary" id="inputGroupPrepend1">책제목</span>                                                           
				<input type="text" name="title" class="form-control bg-white" readonly>
	  		</div>                                                                                                    
	    </div>  									                                                                                                                                                                           
    	<div class="col-10 mt-2">                                                                                
    		<div class="input-group text-start">                                                           
				<span class="input-group-text gap-2 col-3 btn-primary" id="inputGroupPrepend1">저자</span>  
				<input type="text" name="writer"  class="form-control bg-white" readonly>                                    
	  		</div>                                                                                         
	    </div>                                                                                                                                                  
    	<div class="col-10 mt-2">                                                                                
    		<div class="input-group text-start">                                                           
				<span class="input-group-text gap-2 col-3 btn-primary" id="inputGroupPrepend1">발행일</span>            
				<input type="text" name="pubDate" class="form-control bg-white" readonly>                                  
	  		</div>                                                                                         
	    </div>  
		<div class="col-10 mt-2">                                                                                
    		<div class="input-group text-start">                                                           
				<span class="input-group-text gap-2 col-3 btn-primary" id="inputGroupPrepend1">카테고리</span>            
				<input type="text" name="category" class="form-control bg-white" readonly>                                  
	  		</div>                                                                                         
	    </div>  
		<div class="col-10 mt-2">                                                                                
    		<div class="input-group text-start">                                                           
				<span class="input-group-text gap-2 col-3 btn-primary" id="inputGroupPrepend1">ISBN코드</span>            
				<input type="text" name="isbn" class="form-control bg-white" readonly>                                  
	  		</div>                                                                                         
	    </div>  
		<div class="col-10 mt-2 ms-0">                                                                                
    		<div class="input-group text-start">                                                           
				<span class="input-group-text gap-2  col-3 btn-primary" id="inputGroupPrepend1">KDC코드</span>            
				<input type="text" name="kdcCode" class="form-control bg-white" readonly>                                  
				<span class="input-group-text gap-2  col-3 btn-primary" id="inputGroupPrepend1">KDC분류명칭</span>            
				<input type="text" name="kdcName" class="form-control bg-white" readonly>                                                                    
	  		</div>                                                                                         
	    </div>  
	    <div class="col-10 mt-2">                                                                                
    		<div class="input-group text-start">                                                           
				<span class="input-group-text gap-2 col-3 btn-primary" id="inputGroupPrepend1">신청인ID</span>            
				<input type="text" name="id" value="${sessionScope.loginInfo.id }" class="form-control bg-white" readonly>                                  
	  		</div>                                                                                         
	    </div>
	    <div class="col-8 mt-2">                                                                                
    		<div class="text-center">                                                           
                   해당 자료에대한 신청서자동작성이 완료되었습니다.
	  		</div>                                                                                         
	    </div>   
	    <div class="col-8 mt-2">                                                                                
    		<div class="text-center">                                                           
                <input class="btn btn-primary" type="submit" value="신청" style="width: 100%;"></input>                
	  		</div>                                                                                         
	    </div> 
	</div>	
	</form>	
	</div>

	
	
	
	
  	</div>
</div>

	</div>
	
	<div class="col-12">
		<div class="row justify-content-center mb-3 mt-5">
			<div class="col-11 text-center">
				<div><h5>국립중앙 도서관기반 자료검색 결과</h5></div>
				<c:if test="${not empty keyword }">
				<div>검색어 -- "${keyword }" -- </div>
				</c:if>	
				
				<c:if test="${not empty apiSearchList }">
				<div> (원하는 책정보를 눌러 신청을 시작하세요.)</div>	
				</c:if>
				<c:if test="${empty apiSearchList}">
				<div> (검색결과가 없습니다.)</div>	
				</c:if>
						
			</div>
   		<div class="overflow-auto mt-5" style="height: 600px;">
		<table class="table text-center">
  		<thead>
    		<tr class="text-center mt-5">
     			<th scope="col">종키</th>	             
     			<th scope="col">카테고리</th>        
     			<th scope="col">메뉴명</th>         
     			<th scope="col">매체구분</th>        
     			<th scope="col">제목</th>        
     			<th scope="col">저자	</th>        
     			<th scope="col">발행년도</th>       
     			<th scope="col">자료유형코드</th>		    
     			<th scope="col">ISBN</th>		       
     			<th scope="col">청구기호</th>	
     			<th scope="col">KDC코드</th>
     			<th scope="col">KDC분류명칭</th>	
    		</tr> 
  		</thead>
 		 <tbody>
 	 
  		<c:choose>
		<c:when test="${not empty apiSearchList }">
		<c:forEach items="${apiSearchList }" var="a" varStatus="status">
			<tr class="dataTr">
				<td>${a.id }</td>		
				<td>${a.typeName }</td>		
				<td>${a.menuName }</td>		
				<td>${a.mediaName }</td>		
				<td>${a.titleInfo }</td>		
				<td>${a.authorInfo }</td>		
				<td>${a.pubYearInfo }</td>		
				<td>${a.typeCode }</td>		
				<td>${a.isbn }</td>		
				<td>${a.callNo }</td>		
				<td>${a.kdcCode1s }</td>		
				<td>${a.kdcName1s }</td>			
			</tr>	                                             		
		</c:forEach>
		</c:when>
		</c:choose>

 		</tbody>
		</table>
		</div>
		</div>
	</div>
</div>


	
	
	
</body>
</html>