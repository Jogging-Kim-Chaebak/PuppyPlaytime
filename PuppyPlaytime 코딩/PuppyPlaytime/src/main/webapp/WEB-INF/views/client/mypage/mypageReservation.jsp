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
<style type="text/css">
table, td, th {

  border-collapse : collapse;
}

th, td {
  text-align: center;
}
</style>
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

	<div class="nav-item2">
		<div class="tab-pane fade active show" id="reservationList">
		<div align="center">
		<br><br><h3>예약 관리</h3><br><br>
		</div>
		
		<!-- 예약리스트 시작 -->
		<form id="userFoam" name="userFoam">
		<div id="reservationList">		
		<table class="table table-hover" border="1" summary="예약 리스트">
			<colgroup>
				<col width="10%" />
				<col width="10%" />
				<col width="10%" />
				<col width="10%" />
				<col width="10%" />
				<col width="10%" />
				<col width="20%" />
				<col width="10%" />
			</colgroup>
			<thead>
				<tr class="table-primary">
					<th scope="row">예약번호</th>
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
				<c:if test="${not empty mypageReservation}">
					<c:forEach var="list" items="${mypageReservation}" varStatus="status">

					<tr class="table-secondary" data-num="${list.r_no}">
						<td><input type="hidden" name="r_no" id="r_no" value="${list.r_no}"/>${list.r_no}</td>
						<td><input type="hidden" name="c_no" id="c_no" value="${list.c_no}"/>${list.c_no}</td>
						<td>${list.c_kind}</td>
						<td>${list.c_type}</td>
						<td><fmt:formatDate value="${list.r_startDate}" pattern="yyyy-MM-dd"/></td>
						<td><fmt:formatDate value="${list.r_endDate}" pattern="yyyy-MM-dd"/></td>
						<td>${list.r_payPrice}원</td>
						<td><c:set var="name" value="${list.r_approval}" />
							<c:set var="st" value="${list.r_status}" />
								<c:choose> 
								    <c:when test="${name eq 'Y'}">
								    	<c:if test="${st eq 'done'}">
								        	<a>이용완료</a>
								      	</c:if>
								   		<c:if test="${st eq 'cancle'}">
								       		<a>예약취소</a>
								  		</c:if>
								  		<c:if test="${st eq 'refunded'}">
								        	<a>환불완료</a>
								  	 	</c:if>
								   		<c:if test="${st eq 'valid'}">
								        	<a>예약완료</a>
								   		</c:if>
								    </c:when>
								    <c:when test="${name eq 'W'}">
								        <a>승인대기중</a>
								    </c:when>
								    <c:when test="${name eq 'N'}">
								        <a>승인취소</a>
								    </c:when>
								</c:choose>
								</td>
						<td><input type="button" id="reservationdetailBtn" name="reservationdetailBtn"
			class="reservationdetailBtn" value="상세보기"></td>
					</tr>
					
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		
		<!-- 페이징 네비게이션 -->
<ul class="pagination justify-content">
	<c:if test="${mypagepagination.prev}">
		<li class="page-item"><a class="page-link" href="${mypagepagination.startPage - 1}">&laquo;</a></li>
	</c:if>
	
	<c:forEach begin="${mypagepagination.startPage }" end="${mypagepagination.endPage }"
var="idx">
	<li class="page-item"><a class="page-link" href="/client/mypage/mypageReservation${mypagepagination.makeQuery(idx)}">${idx}</a></li>
	</c:forEach>
	<c:if test="${mypagepagination.next && mypagepagination.endPage > 0}">
		<li class="page-item"><a class="page-link" href="${mypagepagination.endPage +1}">&raquo;</a></li>
	</c:if>
</ul>

		</div>
		<!-- 예약리스트 종료 -->
	</form>
	<!-- 상세 페이지 이동을 위한 FORM -->
		<form name="detailForm" id="detailForm" method="post">
			<input type="hidden" name="r_no" id="r_no">
		</form>
		</div>
	</div>
	
</body>
</html>