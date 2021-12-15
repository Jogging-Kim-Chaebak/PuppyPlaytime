<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/reserve/reserveCalendar.css">
<script src="/resources/js/reserve/reserveCalendar.js"></script>
<title>예약하기</title>
</head>
<body>
	<table id="table1">
		<tr>
			<!-- 이전달 버튼 만들기 -->
			<th>
				<input type="button" value="이전 달" disabled/>
			</th>
			<!-- 제목 만들기 -->
			<th id="title" colspan="5">${year }년 ${month }월</th>
			<!-- 다음달 버튼 만들기 -->
			<th>
				<input type="button" value="다음 달" onclick="monthNext(${yearNext}, ${monthNext})" />
			<!-- onclick="monthChange(${year}, ${month+1})" /> -->
			</th>
		</tr>
		<tr>
			<th class="sunday">일</th>
			<th class="etcday">월</th>
			<th class="etcday">화</th>
			<th class="etcday">수</th>
			<th class="etcday">목</th>
			<th class="etcday">금</th>
			<th class="saturday">토</th>
		</tr>
		<tr>
			<c:forEach var="i" begin="1" end="${monthStartFirst%7 }">
				<th></th>
			</c:forEach>
			<c:forEach var="i" begin="1" end="${monthEndFirst }">
				<c:choose>
					<c:when test="${(i+monthStartFirst-1)%7==0 }">
						<td class="sun" id="date${i }" onClick="dateClick(${i}, ${year}, ${month})">${i}</td>
					</c:when>
					<c:when test="${(i+monthStartFirst-1)%7==6 }">
						<td class="sat" id="date${i }" onClick="dateClick(${i}, ${year}, ${month})">${i}</td>
					</c:when>
					<c:otherwise>
						<td class="etc" id="date${i }" onClick="dateClick(${i}, ${year}, ${month})">${i}</td>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${(i+monthStartFirst-1)%7==6 && i!=monthEndFirst }">
						<%
							out.println("</tr><tr>");
						%>
					</c:when>
				</c:choose>
			</c:forEach>
		</tr>
	</table>
	
	<table id="table2">
		<tr>
			<!-- 이전달 버튼 만들기 -->
			<th>
				<input type="button" value="이전 달" onclick="monthPrevious(${year}, ${month })" />
				<!-- onclick="location.href='?year=${year}&month=${month-1}'"  -->
			</th>
			<!-- 제목 만들기 -->
			<th id="title" colspan="5">${yearNext}년 ${monthNext }월</th>
			<!-- 다음달 버튼 만들기 -->
			<th>
				<input type="button" value="다음 달" disabled/>
			<!-- onclick="monthChange(${year}, ${month+1})" /> -->
			</th>
		</tr>
		<tr>
			<th class="sunday">일</th>
			<th class="etcday">월</th>
			<th class="etcday">화</th>
			<th class="etcday">수</th>
			<th class="etcday">목</th>
			<th class="etcday">금</th>
			<th class="saturday">토</th>
		</tr>
		<tr>
			<c:forEach var="i" begin="1" end="${monthStartSecond%7 }">
				<th></th>
			</c:forEach>
			<c:forEach var="i" begin="1" end="${monthEndSecond }">
				<c:choose>
					<c:when test="${(i+monthStartSecond-1)%7==0 }">
						<td class="sun" id="date${i+32 }" onClick="dateClick(${i+32}, ${yearNext}, ${monthNext})">${i}</td>
					</c:when>
					<c:when test="${(i+monthStartSecond-1)%7==6 }">
						<td class="sat" id="date${i+32 }" onClick="dateClick(${i+32}, ${yearNext}, ${monthNext})">${i}</td>
					</c:when>
					<c:otherwise>
						<td class="etc" id="date${i+32 }" onClick="dateClick(${i+32}, ${yearNext}, ${monthNext})">${i}</td>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${(i+monthStartSecond-1)%7==6 && i!=monthEndSecond }">
						<%
							out.println("</tr><tr>");
						%>
					</c:when>
				</c:choose>
			</c:forEach>
		</tr>
	</table>
	<form id="dateSend" name="dateSend">
		<button type="button" class="btn btn-lg btn-outline-success" id="reservation" disabled>예약하러 가기</button>
		<input type="text" id="startDate" name="startDate" value="${year}년${month}월" />
		<input type="text" id="endDate" name="endDate" value="${year}년${month}월" />
	</form>
</body>
</html>