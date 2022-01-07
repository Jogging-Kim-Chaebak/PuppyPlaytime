<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개별 케이지 리스트</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">

	function writeForm(){
		if(${fn:length(roomList)}<50){
			window.location.href ="/admin/room/writeForm"
		}
		else{
			alert('서비스는 50개까지만 등록가능합니다.');
			return false;
		}
	}
	
	
	
	function detailRoom(c_no){
			$("#c_no").val(c_no);
			$("#detailForm").attr({
				"method":"GET",
				"action":"/admin/room/roomDetail"
			});
			$("#detailForm").submit();
		
	}
	

</script>
<style type ="text/css">

</style>
</head>
<body>
	<form id ="detailForm" name="detailForm" method ="post">
		<input type ="hidden" name="c_no" id ="c_no"/>
	</form>
	<div>
		<table class="table table-dark table-striped">
			<caption>룸 리스트</caption>
			<colgroup>
				<col width="100px" />
				<col width="100px" />
				<col width="120px" />
				<col width="200px" />
			</colgroup>
			<thead>
				<tr>
					<th class="text-center">케이지 번호</th>
					<th class="text-center">종류</th>
					<th class="text-center">유형</th>
					<th class="text-center">가격</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty roomList}">
					<tr>
						<td colspan="5" align="center">등록된 케이지 정보가 존재하지 않습니다.</td>
					</tr>
				</c:if>
				<c:forEach items="${roomList}" var="room">
					<tr class ="tac" data-num="${room.c_no}">
						<%-- <td align ="center"><input type ="button" value ="${room.c_no}" onclick="detailRoom('${room.c_no}')" /></td> --%>
						<td align ="center"><input type ="button" onclick ="detailRoom('${room.c_no}')" value ="${room.c_no}"/></td>
						<td align ="center">${room.c_kind}</td>
						<td align ="center">${room.c_type}</td>
						<td colspan ="2" align ="center">${room.c_price}</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan ="3" align ="center">개별 케이지 등록</td>
					<td align="center"><input type= "button" value="케이지 등록" onclick ="writeForm()"/></td>
				</tr>
			</tbody>
		</table>
				<!-- 페이징 네비게이션 -->
<ul class="pagination justify-content">
	<c:if test="${pagination.prev}">
		<li class="page-item"><a class="page-link" href="${pagination.startPage - 1}">&laquo;</a></li>
	</c:if>
	
	<c:forEach begin="${pagination.startPage }" end="${pagination.endPage }"
var="idx">
	<li class="page-item"><a class="page-link" href="/admin/room/roomList${pagination.makeQuery(idx)}">${idx}</a></li>
	</c:forEach>
	<c:if test="${pagination.next && pagination.endPage > 0}">
		<li class="page-item"><a class="page-link" href="${pagination.endPage +1}">&raquo;</a></li>
	</c:if>
</ul>
	</div>
</body>
</html>