<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<% request.setCharacterEncoding("UTF-8");%> 
<% response.setContentType("text/html; charset=UTF-8");%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>

<script type="text/javascript" src="/resources/service/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>  
<script type="text/javascript" src="/resources/service/js/editor.js?ver=1"></script>

</head> 
<body>
<br><br><br><br><br><br>

${testString }

<form action="/service/test" method="post" enctype="multipart/form-data" id="testSubmit">
	<div class="row justify-content-center">
		<div class="col-10">                                                                
    		<div class="input-group text-start">                                                           
				<span class="input-group-text gap-2 col-5 btn-primary" id="inputGroupPrepend1">추천도서 게시글 TITLE</span>            
				<input type="text" name="title" class="form-control" placeholder="제목">                                  
	  		</div>                                                                                         
	    </div> 
	</div>



	<!-- SmartEditor2 --> 
	<div class="row justify-content-center">
		<div class="col-10">
			<div class="jsx-2303464893 editor"> 
				<div class="fr-box fr-basic fr-top" role="application"> 
					<div class="fr-wrapper show-placeholder" dir="auto" style="overflow: scroll;"> 
							<textarea class="form-control" name="contentTitle" id="smartEditor" style="width: 100%; height: 200px; resize: none"  >
							1호
							</textarea> 
					</div> 
				</div> 
			</div>
		</div>
		<div class="col-10">
			<div class="jsx-2303464893 editor"> 
				<div class="fr-box fr-basic fr-top" role="application"> 
					<div class="fr-wrapper show-placeholder" dir="auto" style="overflow: scroll;"> 
							<textarea class="form-control" name="contentOne" id="smartEditor2" style="width: 100%; height: 200px; resize: none"  > 
							2호
							</textarea> 
					</div> 
				</div> 
			</div>
		</div>
		
		
		
		
		
		
		
		
		
		
		<div class="col-10">
		<input type="button" class="formBtn" value="확인">
		</div>

</div>















</form>






    ,TITLE VARCHAR2(500)
    ,CONTENT_TITLE BLOB
    ,IMG_ONE VARCHAR2(100) -- IMG_001
    ,CONTENT_ONE BLOB
    ,IMG_TWO VARCHAR2(100) -- IMG_001
    ,CONTENT_TWO BLOB
    ,IMG_THREE VARCHAR2(100) --IMG_001
    ,CONTENT_THREE BLOB
<!-- SmartEditor2 --> 
<script type="text/javascript">

var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
 oAppRef: oEditors,
 elPlaceHolder: "smartEditor",
 sSkinURI: "/resources/service/se2/SmartEditor2Skin.html",
 fCreator: "createSEditor2"
});

var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
 oAppRef: oEditors,
 elPlaceHolder: "smartEditor2",
 sSkinURI: "/resources/service/se2/SmartEditor2Skin.html",
 fCreator: "createSEditor2"
});

</script>

</body>
</html>