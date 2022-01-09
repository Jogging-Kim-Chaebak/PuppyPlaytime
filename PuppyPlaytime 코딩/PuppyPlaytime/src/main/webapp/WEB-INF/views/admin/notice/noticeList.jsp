<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 목록</title>
<style>
h2{ text-align: center; }

/*게시판 td 정렬*/
td{ text-align: center;}

.pagination{ justify-content:center; margin-top:50px;
}
</style>

<link rel="stylesheet" type="text/css" href="/resources/include/assets/css/common.css"/>

<script type="text/javascript"
src="/resources/include/assets/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" 
src="/resources/include/assets/js/common.js"></script>
<script type="text/javascript">
$(function(){
	
	//현재 페이지 번호와 페이징 크기
	var pageObj = $("#page");
	var sizePerPageObj = $("#sizePerPage");
	var pageVal = pageObj.val();
	var sizePerPageVal = sizePerPageObj.val();

	/*등록 버튼 클릭 시 처리 이벤트*/
	$("#insertBtn").click(function(){
		location.href="/admin/notice/writeForm";
	});

});

</script>

</head>
<body>

<div class="contentContainer">
	
<%-- ============= 상세 페이지 이동을 위한 FORM ============== --%>
<form name="detailForm" id="detailForm">
	<input type="hidden" name="n_no" id="n_no" />
	
	<!-- 현재 페이지 번호와 페이징 크기를 숨겨진 필드 요소를 사용하여 전달한다. -->
	<input type="hidden" name="page" value="${pgrq.page}">
	<input type="hidden" name="sizePerPage" value="${pgrq.sizePerPage}">
</form>

<%--============== 리스트 시작 =============== --%>
<div>
	
<table border="1" summary="공지사항 리스트" class="table table-dark table-striped">
	<colgroup>
		<col width="10%">
		<col width="15%">
		<col width="42%">
		<col width="13%">
	
	</colgroup>
	<thead>
		<tr>
			<th class="order">글번호</th>
			<th data-value="n_regdate" class="order">작성일</th>
			<th>글제목</th>
			<th class="borcle">작성자</th>
		</tr>
	</thead>
	<tbody id="list">
		
	<!-- 데이터 출력 -->
	<c:choose>
		<c:when test="${not empty noticeList}">
			<c:forEach var="notice" items="${noticeList}">
			<tr class="tac" data-num="${notice.n_no}">
				<td>${notice.n_no}</td>
				<td>${notice.n_regdate}</td>
				<td class="tad"><a href="/admin/notice/noticeDetail${pgrq.toUriString(pgrq.page)}&n_no=${notice.n_no}"><c:out value="${notice.n_title}"/></td>
				<td class="name">
				${notice.n_registrant}</td>
				
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


<%--============== 등록 버튼 출력 시작 =============== --%>

<div class="btnR">
	<input type="button" value="등록" id="insertBtn" class="btn btn-primary">
</div>
<%--============== 등록 버튼 출력 종료 =============== --%>

</div>

<!-- 페이징 네비게이션 -->
<ul class="pagination">
	<c:if test="${pagination.prev}">
		<li class="page-item"><a class="page-link" href="${pagination.startPage - 1}">&laquo;</a></li>
	</c:if>
	
	<c:forEach begin="${pagination.startPage }" end="${pagination.endPage }" var="idx">
	<li class="page-item"><a class="page-link" href="/admin/notice/noticeList${pagination.makeQuery(idx)}">${idx}</a></li>
	</c:forEach>
	
	<c:if test="${pagination.next && pagination.endPage > 0}">
		<li class="page-item"><a class="page-link" href="${pagination.endPage +1}">&raquo;</a></li>
	</c:if>
</ul>

<%--============== 리스트 종료 =============== --%>

</div>
</body>
</html>