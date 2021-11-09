<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<% request.setCharacterEncoding("UTF-8");%> 
<% response.setContentType("text/html; charset=UTF-8");%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KIVIEW &mdash; 글쓰기</title>
<!-- js --> 
<!-- SmartEditor2 라이브러리 --> 
아래 2개의 라이브러리를 추가해줍니다. 
<link rel="stylesheet" href="/resources/service/css/smart_editor2.css">

<script type="text/javascript" src="/resources/service/js/HuskyEZCreator.js" charset="utf-8"></script> 
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script> 
</head> 
<body>
<br><br><br><br><br><br>

<!-- SmartEditor2 --> 
<div class="jsx-2303464893 editor"> 
	<div class="fr-box fr-basic fr-top" role="application"> 
		<div class="fr-wrapper show-placeholder" dir="auto" style="overflow: scroll;"> 
			<textarea name="notice_content" id="smartEditor" style="width: 100%; height: 412px;"></textarea> 
		</div> 
	</div> 
</div>


</body>
</html>
<!-- SmartEditor2 --> 
<script type="text/javascript" src ="/resources/service/js/notice-write.js?ver=7"></script>

