<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약하기</title>
</head>
<body>
	<table border="1">
		<tr>
			<!-- 이전달 버튼 만들기 -->
			<th>
				<input type="button" value="이전 달" onclick="location.href='?year=${year}-1&month=${month }-1'">
			</th>
			<th id="title" colspan="5">${year }년 ${month }</th>
			<!-- 다음달 버튼 만들기 -->
			<th>
				<input type="button" value="다음 달" onclick="location.href='?year=${year}+1&month=${month }+1'">
			</th>
		</tr>
		<tr>
			<td class="sunday">일</td>
			<td class="etcday">월</td>
			<td class="etcday">화</td>
			<td class="etcday">수</td>
			<td class="etcday">목</td>
			<td class="etcday">금</td>
			<td class="saturday">토</td>
		</tr>
		<%--<tr>
			<c:forEach var="i" begin="0" end="${monthEnd }">
				<td>i</td>
			</c:forEach>
		</tr> --%>
	</table>
</body>
</html>