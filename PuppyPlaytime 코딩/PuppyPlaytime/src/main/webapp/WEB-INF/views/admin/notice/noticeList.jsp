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
</style>

<link rel="stylesheet" type="text/css" href="/resources/include/assets/css/common.css"/>
<link rel="stylesheet" type="text/css" href="/resources/include/assets/css/noticeList.css"/>

<script type="text/javascript"
src="/resources/include/assets/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" 
src="/resources/include/assets/js/common.js"></script>
<script type="text/javascript">
$(function(){

	/*등록 버튼 클릭 시 처리 이벤트*/
	$("#insertBtn").click(function(){
		location.href="/admin/notice/writeForm";
	});
	
	/* 제목 클릭시 상세 페이지 이동을 위한 처리 이벤트 */
	$(".goDetail").click(function(){
		var n_no = $(this).parents("tr").attr("data-num");
		$("#n_no").val(n_no);
		console.log("글번호 : "+ n_no);
		
		/* 상세 페이지로 이동하기 위해 form추가 */
		$("#detailForm").attr({
			"method":"get",
			"action":"/admin/notice/noticeDetail"
		});
		$("#detailForm").submit();
	});
});

/*수정/삭제 버튼 클릭 시 처리 이벤트*/
function modifyForm(n_no){
	/* 수정 페이지로 이동하기 위해 form추가 */
	$("#n_no").val(n_no);
	
	$("#detailForm").attr({
		"method":"get",
		"action":"/admin/notice/modify"
	});
	
	$("#detailForm").submit();
}

</script>

</head>
<body>

<div class="contentContainer">
	<div class="contentTit"><h2>공지사항</h2></div>
<%-- ============= 상세 페이지 이동을 위한 FORM ============== --%>
<form name="detailForm" id="detailForm">
	<input type="hidden" name="n_no" id="n_no" />
</form>

<%--============== 리스트 시작 =============== --%>
<div id="noticeList">
	
<table border="1" summary="공지사항 리스트">
	<colgroup>
		<col width="10%">
		<col width="15%">
		<col width="42%">
		<col width="13%">
		<col width="25%">
	</colgroup>
	<thead>
		<tr>
			<th class="order">글번호</th>
			<th data-value="n_regdate" class="order">작성일</th>
			<th>글제목</th>
			<th class="borcle">작성자</th>
			<th class="order">수정/삭제</th>
		</tr>
	</thead>
	<tbody id="list">
		
	<!-- 데이터 출력 -->
	<c:choose>
		<c:when test="${not empty noticeList}">
			<c:forEach var="notice" items="${noticeList}"
			varStatus="status">
			<tr class="tac" data-num="${notice.n_no}">
				<td>${notice.n_no}</td>
				<td>${notice.n_regdate}</td>
				<td class ="goDetail tal">${notice.n_title}</td>
				<td class="name">
				${notice.n_registrant}</td>
				<td>
					<input type="button" id = "delNUp_Btn" value="[수정/삭제]" onclick="modifyForm(${notice.n_no})">
				</td>
			
				
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

<div class="contentBtn">
	<input type="button" value="등록" id="insertBtn">
</div>
<%--============== 등록 버튼 출력 종료 =============== --%>

</div>

<%--============== 리스트 종료 =============== --%>


</div>
</body>
</html>