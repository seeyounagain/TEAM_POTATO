<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<input type="hidden" name="menuCode" value="">
<body>
도서관 현황
<div>
	<div>
		<h5>도서현황(최종 업데이트 기준)</h5>
	</div>
	<div class="text-center">
		<table>
		<!-- 책 종류 넣는듯? -->
 		<%-- 	<tr>
				<c:forEach items="" var="">
					<td>책종류</td>
				</c:forEach>
			</tr>
			<tr>
			<c:forEach items="" var="">
				<td>책 숫자</td>
			</c:forEach>
			</tr> --%>
			<tr>
				<td>총류</td>
				<td>철학</td>
				<td>종교</td>
				<td>사회과학</td>
				<td>순수과학</td>
				<td>기술과학</td>
				<td>예술</td>
				<td>언어</td>
				<td>문학</td>
				<td>계</td>
			</tr>
			<tr>
				<td>1</td>
				<td>2</td>
				<td>3</td>
				<td>4</td>
				<td>5</td>
				<td>6</td>
				<td>7</td>
				<td>8</td>
				<td>9</td>
				<td>총합</td>
			</tr>
		</table>
		<table class="table">
			<thead>
<%-- 				<tr>
					<c:forEach items="" var="">
						<td>책종류</td>
					</c:forEach>
				</tr>
				<tr>
				<c:forEach items="" var="">
					<td>책 권수</td>
				</c:forEach>
				</tr> --%>
				<tr>
					<th scope="col">000 총류</th>
					<th scope="col">100 철학</th>
					<th scope="col">200 종교</th>
					<th scope="col">300 사회과학</th>
					<th scope="col">400 자연과학</th>
					<th scope="col">500 기술과학</th>
					<th scope="col">600 예술</th>
					<th scope="col">700 언어</th>
					<th scope="col">800 문학</th>
					<th scope="col">900 역사</th>
					<th scope="col">합계</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td scope="row">??</td>
					<td>100</td>
					<td>200</td>
					<td>300</td>
					<td>400</td>
					<td>500</td>
					<td>600</td>
					<td>700</td>
					<td>800</td>
					<td>900</td>
					<td>??</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
</body>
</html>