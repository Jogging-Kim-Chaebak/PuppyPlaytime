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
<script type="text/javascript">
	$(function(){
		
		/* 목록 버튼 클릭 시 처리 이벤트 */
		$("#reservationListBtn").click(function(){
			alert("목록");
			location.href="/client/mypage/reservationList";
		});
	
		/* 예약취소 버튼 클릭 시 처리 이벤트 */
		$("#cancelBtn").click(function(){
			alert("예약취소");
			goUrl="/client/mypage/reservationCancel";
			$("#r_data").attr("action",goUrl);
			$("#r_data").submit();
		}); 
	});
	
</script>
	
</head>
<body>
	<div class="contentContainer">
		<div class="contentTit"><h3>예약정보 상세보기</h3></div>
		<form name="r_data" id="r_data" method="post">
			<input type="hidden" id="r_no" name="r_no" value="${detail.r_no}" />
			<input type="hidden" id="r_status" name="r_status" value="cancel" />
		</form>
		<!-- 상세정보 보여주기 시작 -->
		<div class="contentTB">
			<table border="1">
				<tr>
					<td>예약번호</td>
					<td>${detail.r_no}</td>
				</tr>
				<tr>
					<td>예약신청 날짜</td>
					<td><fmt:formatDate value="${detail.r_requestDate}" pattern="yyyy-MM-dd" /></td>
				</tr>
				<tr>
					<td>예약 시작일</td>
					<td><fmt:formatDate value="${detail.r_startDate}" pattern="yyyy-MM-dd" /></td>
				</tr>
				<tr>
					<td>예약 종료일</td>
					<td><fmt:formatDate value="${detail.r_endDate}" pattern="yyyy-MM-dd" /></td>
				</tr>
				<tr>
					
				<c:if test="${not empty s_nameList}">
					<td>부가서비스${count }</td><td>
					<c:forEach var="s_name" items="${s_nameList}" varStatus="status">
						${s_name}
						&nbsp;
					</c:forEach>
					</td>
				</c:if>
				<c:if test="${empty s_nameList }">
					<td>부가서비스가 없습니다.</td>
				</c:if> 
				</tr>
				<tr>
					<td>케이지 번호</td>
					<td>${detail.c_no}</td>
				</tr>
				<tr>
					<td>케이지 종류</td>
					<td>${detail.c_kind}</td>
				</tr>
				<tr>
					<td>케이지 유형</td>
					<td>${detail.c_type}</td>
				</tr>
				<tr>
					<td>예약펫 번호</td>
					<td>${detail.r_pet}</td>
				</tr>
				<tr>
					<td>결제가격</td>
					<td>${detail.r_payPrice}원</td>
				</tr>
			
			</table>
		</div>
		<!-- 상세정보 보여주기 종료 -->
		<!-- 버튼추가 시작 -->
		<input type="button" value="예약취소" id="cancelBtn">
		<input type="button" value="목록" id="reservationListBtn">
		<!-- 버튼추가 종료 -->
	</div>
</body>
</html>