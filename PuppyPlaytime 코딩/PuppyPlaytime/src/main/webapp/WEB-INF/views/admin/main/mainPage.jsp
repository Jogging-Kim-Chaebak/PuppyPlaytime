<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당일 방문 예약</title>
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
		<table border = "1">
			<caption>룸 리스트</caption>
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
					<th>예약번호</th>
					<th>승인여부</th>
					<th>가격</th>
					<th>신청날짜</th>
					<th>실제 예약날짜</th>
					<th>아이디</th>
					<th>케이지번호</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty reservationList}">
					<tr>
						<td colspan="7" align="center">등록된 예약 정보가 존재하지 않습니다.</td>
					</tr>
				</c:if>
				<c:forEach items="${reservationList}" var="rlist">
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
	</div>
	<div>
		<table>
				<c:if test="${empty join}">
					<tr>
						<td colspan="2" align="center">등록된 회원 정보가 존재하지 않습니다.</td>
					</tr>
				</c:if>
		
				<c:if test="${!empty join}">
					<tr>
						<td align ="center">금일 가입자 수 : </td>
						<td align ="center">${join}명</td>
					</tr>
				</c:if> 
		</table>
	</div>
</body>
</html>