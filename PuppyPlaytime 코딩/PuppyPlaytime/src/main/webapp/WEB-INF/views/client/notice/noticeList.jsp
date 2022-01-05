<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 목록</title>
<style>
.pagination{ justify-content:center; }
th,td{text-align: center; }
</style>

<link rel="stylesheet" type="text/css" href="/resources/include/assets/css/common.css"/>
<link rel="stylesheet" type="text/css" href="/resources/include/assets/css/noticeList.css"/>
<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.css"/>
<script type="text/javascript"
src="/resources/include/assets/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" 
src="/resources/include/assets/js/common.js"></script>
<script type="text/javascript">
$(function(){
		
		/* 상세 페이지로 이동할 때 페이징 요청 정보를 매개변수로 전달한다 */
		$("#detailForm").attr({
			"method":"get",
			"action":"/client/notice/noticeDetail"
		});
		$("#detailForm").submit();
	});
});

</script>

</head>
<body>

	<div class="contentTit"></div>
<%-- ============= 상세 페이지 이동을 위한 FORM ============== --%>
<form name="detailForm" id="detailForm">
	<input type="hidden" name="n_no" id="n_no" />
</form>

<%--============== 리스트 시작 =============== --%>
<div id="noticeList">
	
<table class="table table-bordered table-sm">
	<colgroup>
		<col width="8%">
		<col width="15%">
		<col width="42%">
		<col width="15%">
	</colgroup>
	<thead>
		<tr>
			<th class="tac">글번호</th>
			<th class="tac">작성자</th>
			<th class="tac">글제목</th>
			<th data-value="n_regdate" class="tac">작성일</th>
			
			
		</tr>
	</thead>
	<tbody id="list">
		
	<!-- 데이터 출력 -->
	<c:choose>
		<c:when test="${not empty noticeList}">
			<c:forEach var="notice" items="${noticeList}"
			varStatus="status">
			<tr align="center" data-num="${notice.n_no}">
				<td>${notice.n_no}</td>
				<td class="name">
				${notice.n_registrant}</td>
				
				<td class ="goDetail tal"><a href="/client/notice/noticeDetail${pgrq.toUriString(pgrq.page)}&n_no=${notice.n_no}"><c:out value="${notice.n_title}"/></td>
				<td>${notice.n_regdate}</td>
	
			</tr>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<tr>
				<td colspan="6" class="tac">등록된 게시물이 존재하지 않습니다.</td>
			</tr>
		</c:otherwise>
	</c:choose>

</tbody>
</table>

<!-- 페이징 네비게이션 -->
<ul class="pagination justify-content">
	<c:if test="${pagination.prev}">
		<li class="page-item"><a class="page-link" href="${pagination.startPage - 1}">&laquo;</a></li>
	</c:if>
	
	<c:forEach begin="${pagination.startPage }" end="${pagination.endPage }"
var="idx">
	<li class="page-item"><a class="page-link" href="/client/notice/noticeList${pagination.makeQuery(idx)}">${idx}</a></li>
	</c:forEach>
	<c:if test="${pagination.next && pagination.endPage > 0}">
		<li class="page-item"><a class="page-link" href="${pagination.endPage +1}">&raquo;</a></li>
	</c:if>
</ul>

<%--============== 리스트 종료 =============== --%>

</div>
</body>
</html>