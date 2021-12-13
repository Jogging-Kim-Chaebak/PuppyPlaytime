<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
/* 기본스타일  */	
	table{ background-color: #F2F2F2;}
	
	table td, table th {
    border: 1px solid black;
	}
	
	tr{height: 60px;}
	td{width: 100px; text-align: right; font-size: 15pt; font-family: D2coding;}
/* 타이틀 스타일 */
	th#title {font-size: 20pt; font-weight: bold; color: #FFBF00; font-family: D2coding; }

/* 요일 스타일 */
	td.sunday{ text-align: center; font-weight: bold; color: red; font-family: D2coding; }
	td.saturday{ text-align: center; font-weight: bold; color: blue; font-family: D2coding; }
	td.etcday{ text-align: center; font-weight: bold; color: black; font-family: D2coding; }

/* 날짜 스타일 */
	td.sun{ text-align: right; font-size: 15pt; color: red; font-family: D2coding; vertical-align: top;}
	td.sat{ text-align: right; font-size: 15pt; color: blue; font-family: D2coding; vertical-align: top;}
	td.etc{ text-align: right; font-size: 15pt; color: black; font-family: D2coding; vertical-align: top;}
	
	td.redbefore{ text-align: right; font-size: 12pt; color: red; font-family: D2coding; vertical-align: top;}
	td.before{ text-align: right; font-size: 12pt; color: gray; font-family: D2coding; vertical-align: top;}
</style>

<title>예약하기</title>
</head>
<body>
	<table border="1">
		<tr>
			<!-- 이전달 버튼 만들기 -->
			<th>
				<input type="button" value="이전 달" onclick="location.href='?year=${year-1}&month=${month-1}'">
			</th>
			<!-- 제목 만들기 -->
			<th id="title" colspan="5">${year }년 ${month }월</th>
			<!-- 다음달 버튼 만들기 -->
			<th>
				<input type="button" value="다음 달" onclick="location.href='?year=${year+1}&month=${month+1}'">
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
		<tr>
			<c:forEach var="i" begin="1" end="${monthFirst }">
				<td></td>
			</c:forEach>
			<c:forEach var="i" begin="1" end="${monthEnd }">
				<c:choose>
					<c:when test="${(i+monthFirst-1)%7==0 }">
						<td class="sun">${i}</td>
					</c:when>
					<c:when test="${(i+monthFirst-1)%7==6 }">
						<td class="sat">${i}</td>
					</c:when>
					<c:otherwise>
						<td class="etc">${i}</td>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${(i+monthFirst-1)%7==6 && i!=monthEnd }">
						<%
							out.println("</tr><tr>");
						%>
					</c:when>
				</c:choose>
			</c:forEach>
		</tr>
	</table>
</body>
</html>