<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개별 케이지 리스트</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">

	function writeForm(){
		$("#detailForm").attr({
			"method":"GET",
			"action":"/admin/room/writeForm.do"
		});
		$("#detailForm").submit();
	}
	
	function detailRoom(c_no){
		/* var c_no = $(this).parents("tr").attr("data-num"); */
	/* 	$("#c_no").val(c_no); */
		$("#c_no").val(c_no);
		$("#detailForm").attr({
			"method":"GET",
			"action":"/admin/room/roomDetail.do"
		});
		$("#detailForm").submit();
	}
	
	/* $(function(){
		$("#goDetail").click(function(){
			var c_no = $(this).parents("tr").attr("data-num");
			$("#c_no").val(c_no);
			console.log("룸번호 : " +c_no);
			$("#detailForm").attr({
				"method":"GET",
				"action":"/admin/room/roomDetail.do"
			});
			$("#detailForm").submit();
		});
	}); */
	
</script>
<style type ="text/css">

</style>
</head>
<body>
	<form id ="detailForm" name="detailForm" method ="post">
		<input type ="hidden" name="c_no" id ="c_no"/>
	</form>
	<div>
		<table border = "1">
			<caption>룸 리스트</caption>
			<colgroup>
				<col width="100px" />
				<col width="100px" />
				<col width="120px" />
				<col width="200px" />
				<col width="120px" />
			</colgroup>
			<thead>
				<tr>
					<th>케이지 번호</th>
					<th>종류</th>
					<th>유형</th>
					<th>가격</th>
					<th>사용현황</th>
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
						<td align ="center">${room.c_price}</td>
						<td align ="center">${room.c_usestatus}</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan ="4" align ="center">개별 케이지 등록</td>
					<td align="center"><input type= "button" value="케이지 등록" onclick ="writeForm()"/></td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>