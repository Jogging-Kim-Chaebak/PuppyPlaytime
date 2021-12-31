<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 목록</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>



</head>
<body>

	<div class="contentContainer">
		<div class="contentTit"><h3>예약 관리</h3></div>
	
		
		<!-- 예약리스트 시작 -->
		<form name="userFoam">
		<div id="reservationList">		
		<table border="1" summary="예약 리스트">
			<colgroup>
				<col width="25%" />
				<col width="25%" />
				<col width="25%" />
				<col width="25%" />
			</colgroup>
			<thead>
				<tr>
					<th>예약번호</th>
					<th>예약시작날짜</th>
					<th>예약종료날짜</th>
					<th>케이지 번호</th>
				</tr>
			</thead>
			<tbody>
			<!-- 데이터 출력 -->
				<c:if test="${not empty reservationList}">
					<c:forEach var="list" items="${reservationList}" varStatus="status">
					<tr>
						<td>${list.r_no}</td>
						<td>${list.r_startDate}</td>
						<td>${list.r_endDate}</td>
						<td>${list.c_no}</td>
					</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		</div>
		<!-- 예약리스트 종료 -->
	</form>
	</div>
	
</body>
</html>