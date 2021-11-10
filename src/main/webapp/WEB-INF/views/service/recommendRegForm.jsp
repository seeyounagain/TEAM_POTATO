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
<!-- SmartEditor2 --> 
<div class="jsx-2303464893 editor"> 
	<div class="fr-box fr-basic fr-top" role="application"> 
		<div class="fr-wrapper show-placeholder" dir="auto" style="overflow: scroll;"> 
			<textarea name="content" id="smartEditor" style="width: 100%; height: 412px;">
			</textarea> 
		</div> 
	</div> 
</div>
<input type="button" class="formBtn" value="확인">
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
</script>

</body>
</html>