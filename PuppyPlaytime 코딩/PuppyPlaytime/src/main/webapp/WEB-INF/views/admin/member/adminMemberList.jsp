<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부가서비스 리스트</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">


function updateData(m_id){
	if(confirm('회원탈퇴를 진행하시겠습니까?')){
		$("#m_id").val(m_id);
		$("#memberForm").attr({
			"method":"post",
			"action":"/admin/member/adminMemberDisabled"
		});
		$("#memberForm").submit();
	}
}

	
</script>
<style type ="text/css">

</style>
</head>
<body>
	<form id ="memberForm" name="memberForm" method ="post">
		<input type ="hidden" name="m_id" id ="m_id"/>
	</form>
	<h3>회원 리스트</h3>
	<div>
		<table class="table table-dark table-striped">
			<caption>회원 리스트</caption>
			<colgroup>
				<col width="200px" />
				<col width="100px" />
				<col width="150px" />
				<col width="400px" />
				<col width="400px" />
				<col width="700px" />
				<col width="100px" />
			</colgroup>
			<thead>
				<tr>
					<th class="text-center">아이디</th>
					<th class="text-center">이름</th>
					<th class="text-center">생년월일</th>
					<th class="text-center">이메일주소</th>
					<th class="text-center">전화번호</th>
					<th class="text-center">주소</th>
					<th class="text-center">상태</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty adminMemberList}">
					<tr>
						<td colspan="7" align="center">등록된 회원 정보가 존재하지 않습니다.</td>
					</tr>
				</c:if>
				<c:forEach items="${adminMemberList}" var="member">
					<tr class ="tac" data-num="${service.s_no}">
						<td align ="center"><input type ="button" onclick ="updateData('${member.m_id}')" value ="${member.m_id}"/></td>
						<td align ="center">${member.m_name}</td>
						<td align ="center">${member.m_birth}</td>
						<td align ="center">${member.m_email}</td>
						<td align ="center">${member.m_phone}</td>
						<td align ="center">${member.m_address}</td>
						<td align ="center">${member.m_status}</td>
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
	<li class="page-item"><a class="page-link" href="/admin/member/adminMemberList${pagination.makeQuery(idx)}">${idx}</a></li>
	</c:forEach>
	<c:if test="${pagination.next && pagination.endPage > 0}">
		<li class="page-item"><a class="page-link" href="${pagination.endPage +1}">&raquo;</a></li>
	</c:if>
</ul>
		
	</div>
</body>
</html>