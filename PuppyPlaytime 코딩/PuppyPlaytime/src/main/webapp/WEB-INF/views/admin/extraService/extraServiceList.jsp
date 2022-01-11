<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부가서비스 리스트</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">

	function writeForm(){
		if(${fn:length(extraServiceList)}<4){
			$("#detailForm").attr({
				"method":"GET",
				"action":"/admin/extraService/writeForm"
			});
			$("#detailForm").submit();
		}
		else{
			alert('서비스는 4개까지만 등록가능합니다.');
			return false;
		}
		
	}
	
	function detailService(s_no){
		$("#s_no").val(s_no);
		$("#detailForm").attr({
			"method":"GET",
			"action":"/admin/extraService/extraServiceDetail"
		});
		$("#detailForm").submit();
	}
	
</script>
<style type ="text/css">

</style>
</head>
<body>
	<form id ="detailForm" name="detailForm" method ="post">
		<input type ="hidden" name="s_no" id ="s_no"/>
	</form>
	<h3>부가서비스 리스트</h3>
	<div>
		<table class="table table-dark table-striped">
			<caption>부가서비스 리스트</caption>
			<colgroup>
				<col width="100px" />
				<col width="100px" />
				<col width="180px" />
			</colgroup>
			<thead>
				<tr>
					<th class="text-center">서비스 번호</th>
					<th class="text-center">서비스 명</th>
					<th class="text-center">가격</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty extraServiceList}">
					<tr>
						<td colspan="5" align="center">등록된 서비스 정보가 존재하지 않습니다.</td>
					</tr>
				</c:if>
				<c:forEach items="${extraServiceList}" var="service">
					<tr class ="tac" data-num="${service.s_no}">
						<td align ="center"><input type ="button" onclick ="detailService('${service.s_no}')" value ="${service.s_no}"/></td>
						<td align ="center">${service.s_name}</td>
						<td align ="center">${service.s_price}</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan ="2" align ="center">부가서비스 등록</td>
					<td align="center"><input type= "button" value="서비스 등록" onclick ="writeForm()"/></td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>