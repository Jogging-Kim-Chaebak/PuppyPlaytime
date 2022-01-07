<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 리스트</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">

	function detailRoom(r_no){
		$("#r_no").val(r_no);
		$("#detailForm").attr({
			"method":"GET",
			"action":"/admin/reservation/reservationDetail"
		});
		$("#detailForm").submit();
	}
	
	
</script>
<style type ="text/css">

</style>
</head>
<body>
	<form id ="detailForm" name="detailForm" method ="post">
		<input type ="hidden" name="r_no" id ="r_no"/>
	</form>
	
		<div>
			<table class="table table-dark table-striped">
				<colgroup>
					<col width="100px" />
					<col width="100px" />
					<col width="120px" />
					<col width="200px" />
					<col width="500px" />
					<col width="200px" />
					<col width="100px" />
				</colgroup>
				<thead>
					<tr>
						<th class="text-center">예약번호</th>
						<th class="text-center">승인여부</th>
						<th class="text-center">가격</th>
						<th class="text-center">신청날짜</th>
						<th class="text-center">실제 예약날짜</th>
						<th class="text-center">아이디</th>
						<th class="text-center">케이지번호</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty newReservationList}">
						<tr>
							<td colspan="7" align="center">등록된 예약 정보가 존재하지 않습니다.</td>
						</tr>
					</c:if>
					<c:forEach items="${newReservationList}" var="rlist">
						<tr class ="tac" data-num="${rlist.r_no}">
							<%-- <td align ="center"><input type ="button" value ="${room.c_no}" onclick="detailRoom('${room.c_no}')" /></td> --%>
							<td align ="center"><input type ="button" onclick ="detailRoom('${rlist.r_no}')" value ="${rlist.r_no}"/></td>
							<td align ="center">${rlist.r_approval}</td>
							<td align ="center">${rlist.r_payPrice}</td>
							<td align ="center">${rlist.r_requestDate}</td>
							<td align ="center">${rlist.r_startDate} ~ ${rlist.r_endDate}</td>
							<td align ="center">${rlist.m_id}</td>
							<td align ="center">${rlist.c_no}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
							<!-- 페이징 네비게이션 -->
<ul class="pagination justify-content">
	<c:if test="${pagination.prev}">
		<li class="page-item"><a class="page-link" href="${pagination.startPage - 1}">&laquo;</a></li>
	</c:if>
	
	<c:forEach begin="${pagination.startPage }" end="${pagination.endPage }"
var="idx">
	<li class="page-item"><a class="page-link" href="/admin/reservation/newReservationList${pagination.makeQuery(idx)}">${idx}</a></li>
	</c:forEach>
	<c:if test="${pagination.next && pagination.endPage > 0}">
		<li class="page-item"><a class="page-link" href="${pagination.endPage +1}">&raquo;</a></li>
	</c:if>
</ul>
		</div>
</body>
</html>