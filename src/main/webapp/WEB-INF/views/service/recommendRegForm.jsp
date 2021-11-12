<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<% request.setCharacterEncoding("UTF-8");%> 
<% response.setContentType("text/html; charset=UTF-8");%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="/resources/service/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>  
<script type="text/javascript" src="/resources/service/js/editor.js?ver=5"></script>
</head> 
<body>
<h2 class="text-first fw-bold">추천도서 등록페이지</h2>
<hr>






<form action="/service/registerRecommend" method="post" enctype="multipart/form-data" id="testSubmit">
<div class="master">
	<div class="row justify-content-center">
		<div class="col-8">                                                                
    		<div class="input-group text-start">                                                           
				<span class="input-group-text gap-2 col-3 btn-primary" id="inputGroupPrepend1">추천도서 게시글 TITLE</span>            
				<input type="text" name="title" class="form-control" placeholder="제목">                                  
	  		</div>                                                                                         
	    </div> 
	</div>
	


	<!-- SmartEditor2 --> 
	<div class="row justify-content-center mb-3">
		<div class="col-8">
			<div class="jsx-2303464893 editor"> 
				<div class="fr-box fr-basic fr-top" role="application"> 
					<div class="fr-wrapper show-placeholder" dir="auto" style="overflow: scroll;"> 
							<textarea class="form-control" name="contentTitle" id="smartEditor" style="width: 100%; height: 200px; resize: none"  >
							타이틀 
							</textarea> 
					</div> 
				</div> 
			</div>
		</div>
	</div>
	


    
    

    
    

	
	
		
	<div class="row justify-content-center">	
		<div class="col-8">	
			<div id="imgViewArea1" style="margin-top:10px; display:none;">
				<img id="imgArea1" style="width:200px; height:100px;" onerror="imgAreaError()"/>
			</div>
		   		<input name="file1" type="file" class="form-control" aria-label="file example" id="Product" multiple required="required"  accept="image/*">
		    <div class="invalid-feedback">Example invalid form file feedback</div>		
		</div>
	</div>	
	<div class="row justify-content-center mb-3">	
		<div class="col-8">
			<div class="jsx-2303464893 editor"> 
				<div class="fr-box fr-basic fr-top" role="application"> 
					<div class="fr-wrapper show-placeholder" dir="auto" style="overflow: scroll;"> 
						<textarea class="form-control" name="contentOne" id="smartEditor2" style="width: 100%; height: 200px; resize: none"  > 
						1호 서론
						</textarea> 
					</div> 
				</div> 
			</div>
		</div>
	</div>
	<div class="row justify-content-center">	
		<div class="col-8">
			<div id="imgViewArea2" style="margin-top:10px; display:none;">
			<img id="imgArea2" style="width:200px; height:100px;" onerror="imgAreaError()"/>
			</div>
		    <input name="file2" type="file" class="form-control" aria-label="file example" id="Product" multiple accept="image/*" >
		    <div class="invalid-feedback">Example invalid form file feedback</div>	
    	</div>
    </div>	

	<div class="row justify-content-center mb-3">	
		<div class="col-8">
			<div class="jsx-2303464893 editor"> 
				<div class="fr-box fr-basic fr-top" role="application"> 
					<div class="fr-wrapper show-placeholder" dir="auto" style="overflow: scroll;"> 
							<textarea class="form-control" name="contentTwo" id="smartEditor3" style="width: 100%; height: 200px; resize: none"  > 
							2호 본론
							</textarea> 
					</div> 
				</div> 
			</div>
		</div>
	</div>
    
    <div class="row justify-content-center">	
		<div class="col-8">
		    <div id="imgViewArea3" style="margin-top:10px; display:none;">
			<img id="imgArea3" style="width:200px; height:100px;" onerror="imgAreaError()"/>
			</div>  
		    <input name="file3" type="file" class="form-control" aria-label="file example" id="Product" multiple accept="image/*"  >
		    <div class="invalid-feedback">Example invalid form file feedback</div>	
    	</div>
    </div>	
  
	<div class="row justify-content-center mb-3">	
		<div class="col-8">
			<div class="jsx-2303464893 editor"> 
				<div class="fr-box fr-basic fr-top" role="application"> 
					<div class="fr-wrapper show-placeholder" dir="auto" style="overflow: scroll;"> 
							<textarea class="form-control" name="contentThree" id="smartEditor4" style="width: 100%; height: 200px; resize: none"  > 
							3호	결론
							</textarea> 
					</div> 
				</div> 
			</div>
		</div>
	</div>	
	<div class="row justify-content-center">
		<div class="col-8 text-center">
			<input type="hidden" name="menuCode" value="${menuCode }" id="menuCode">
			<input type="button" class="formBtn btn btn-primary" value="등록">
			<input type="button" class="btn btn-primary" value="취소" onclick="location.href='/service/recommend?menuCode=${menuCode}'">
		</div>
	</div>
















</div>
</form>











<!-- SmartEditor2 --> 
<script type="text/javascript">

var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
 oAppRef: oEditors,
 elPlaceHolder: "smartEditor",
 sSkinURI: "/resources/service/se2/SmartEditor2Skin.html",
 fCreator: "createSEditor2"
});

var oEditors2 = [];
nhn.husky.EZCreator.createInIFrame({
 oAppRef: oEditors2,
 elPlaceHolder: "smartEditor2",
 sSkinURI: "/resources/service/se2/SmartEditor2Skin.html",
 fCreator: "createSEditor2"
});

var oEditors3 = [];
nhn.husky.EZCreator.createInIFrame({
 oAppRef: oEditors3,
 elPlaceHolder: "smartEditor3",
 sSkinURI: "/resources/service/se2/SmartEditor2Skin.html",
 fCreator: "createSEditor2"
});

var oEditors4 = [];
nhn.husky.EZCreator.createInIFrame({
 oAppRef: oEditors4,
 elPlaceHolder: "smartEditor4",
 sSkinURI: "/resources/service/se2/SmartEditor2Skin.html",
 fCreator: "createSEditor2"
});

</script>

</body>
</html>