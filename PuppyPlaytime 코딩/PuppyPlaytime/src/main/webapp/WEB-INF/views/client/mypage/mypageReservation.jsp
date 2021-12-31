<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 목록</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(function() {
		/* 상세보기 클릭시 상세 페이지 이동을 위한 처리 이벤트 */
		$(".reservationdetailBtn").click(function(){
			var r_no = $(this).parents("tr").attr("data-num");
			$("#r_no").val(r_no);
			console.log("예약번호 : " + r_no);
			
		//상세 페이지로 이동하기 위해 form추가
		$("#detailForm").attr({
			"method":"post",
			"action":"/client/mypage/reservationDetail"
		});
		$("#detailForm").submit();
		
		//상세 페이지로 이동하기 위해 form추가
		$("#userFoam").attr({	
			"method":"post",
			"action":"/client/mypage/reservationDetail"
			
		});
		$("#userFoam").submit();
		});
		});
	
</script>


</head>
<body>

	<div class="contentContainer">
		<div class="contentTit"><h3>예약 관리</h3></div>
	
		
		<!-- 예약리스트 시작 -->
		<form id="userFoam" name="userFoam">
		<div id="reservationList">		
		<table border="1" summary="예약 리스트">
			<colgroup>
				<col width="10%" />
				<col width="10%" />
				<col width="20%" />
				<col width="15%" />
				<col width="15%" />
				<col width="10%" />
				<col width="10%" />
				<col width="10%" />
			</colgroup>
			<thead>
				<tr>
					<th>예약번호</th>
					<th>케이지번호</th>
					<th>케이지종류</th>
					<th>케이지유형</th>
					<th>이용시작날짜</th>
					<th>이용종료날짜</th>
					<th>결제금액</th>
					<th>진행상태</th>
					<th>상세보기</th>
				</tr>
			</thead>
			<tbody>
			<!-- 데이터 출력 -->
				<c:if test="${not empty reservationList}">
					<c:forEach var="list" items="${reservationList}" varStatus="status">

					<tr class="tac" data-num="${list.r_no}">
						<td><input type="hidden" name="r_no" id="r_no" value="${list.r_no}"/>${list.r_no}</td>
						<td><input type="hidden" name="c_no" id="c_no" value="${list.c_no}"/>${list.c_no}</td>
						<td>${list.c_kind}</td>
						<td>${list.c_type}</td>
						<td><fmt:formatDate value="${list.r_startDate}" pattern="yyyy-MM-dd"/></td>
						<td><fmt:formatDate value="${list.r_endDate}" pattern="yyyy-MM-dd"/></td>
						<td>${list.r_payPrice}원</td>
						<td><c:set var="name" value="${list.r_status}" />
								<c:choose> 
								    <c:when test="${name eq 'done'}">
								        <a>이용완료</a>
								    </c:when>
								    <c:when test="${name eq 'cancel'}">
								        <a>예약취소</a>
								    </c:when>
								    <c:when test="${name eq 'refunded'}">
								        <a>환불완료</a>
								    </c:when>
								    <c:otherwise>
								        <a>예약완료</a>
								    </c:otherwise>
								</c:choose>
						</td>
						<td><input type="button" id="reservationdetailBtn" name="reservationdetailBtn"
			class="reservationdetailBtn" value="상세보기"></td>
					</tr>
					
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		</div>
		<!-- 예약리스트 종료 -->
	</form>
	<!-- 상세 페이지 이동을 위한 FORM -->
		<form name="detailForm" id="detailForm" method="post">
			<input type="hidden" name="r_no" id="r_no">
		</form>
	</div>
	
</body>
</html>