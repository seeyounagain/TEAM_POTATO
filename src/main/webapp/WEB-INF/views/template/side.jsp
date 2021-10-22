<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>POTATO_LIBRARY</title>
<style type="text/css">
.list-group-item.active {
    color: #fff;
    background-color: #0b70b9;
    border-color: #0b70b9;
}
</style>
</head>
<body>
	<div class="list-group" style="padding-right: 5%;">
		<c:forEach var="side" items="${sideMenuList }">
			<a href="/${side.menuUri }/${side.sideMenuUri }?menuCode=${side.menuCode}&sideMenuCode=${side.sideMenuCode}" class="list-group-item list-group-item-action active" >${side.sideMenuName }</a>
		</c:forEach>
	</div>
</body>
</html>