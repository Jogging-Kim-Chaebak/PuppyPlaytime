<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<style>
th{font-weight:bold}
 #contentForm { width: 40%; text-align:left; padding:8px}
.contentContainer{ text-align:center; }
.contentTit{ margin-top:30px; margin-bottom:30px; text-align:left;}
.btn{ margin-top:30px; margin-bottom:30px; font-weight:bold; font-size:medium; margin:auto; display:block}
</style>
<head>
<meta charset="UTF-8">
<title>글 상세보기</title>
<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.css"/>
<script type="text/javascript"
src="/resources/include/assets/js/jquery-1.12.4.min.js"></script>

<script type="text/javascript">
	$(function(){
		
		var formObj = $("#f_data");
		
		//현재 페이지 번호와 페이징 크기
		var pageObj = $("#page");
		var sizePerPageObj = $("#sizePerPage");
		var pageVal = pageObj.val();
		var sizePerPageVal = sizePerPageObj.val();
		
		/*삭제 버튼 클릭 시 처리 이벤트*/
		$("#deleteBtn").click(function(){
			var goUrl=""; //이동할 경로를 저장할 변수
			
			goUrl = "/admin/notice/noticeDelete";
		
			$("#f_data").attr("action",goUrl);
			$("#f_data").submit();
		});
		
		/*목록 버튼 클릭 시 처리 이벤트*/
		$("#noticeListBtn").click(function(){
			self.location = "noticeList${pgrq.toUriString()}";
			//location.href="/admin/notice/noticeList";
		});
		
		/*수정 버튼 클릭 시 처리 이벤트*/
		$("#updateBtn").click(function(){
			
			var goUrl=""; //이동할 경로를 저장할 변수
			goUrl = "/admin/notice/modify";
			
			$("#f_data").attr("action", goUrl);

			$("#f_data").submit();
		
		});
	});
	
</script>
<script>
	$(document).ready(function(){
		var formObj = $("#notice");
		
		//현재 페이지 번호와 페이징 크기
		var pageObj = $("#page");
		var sizePerPageObj = $("#sizePerPage");
		var pageVal = pageObj.val();
		var sizePerPageVal = sizePerPageObj.val();
		
	});
	
</script>
</head>
<body>

	<div class="contentContainer">
		<div class="contentTit"><h3>공지사항 상세보기</h3></div>
		<form name="f_data" id="f_data" method="GET">
			<input type="hidden" name="n_no" value="${detail.n_no}"/>
			<!-- 현재 페이지 번호와 페이징 크기를 숨겨진 필드 요소를 사용하여 전달한다. -->
			<input type="hidden" name="page" value="${pgrq.page}">
			<input type="hidden" name="sizePerPage" value="${pgrq.sizePerPage}">
		</form>
	
	
	<%-- ========== 상세 정보 보여주기 시작 ========== --%>
	
	<div class="contentTB">
		<table class="table table-dark table-striped">
			<colgroup>
				<col width="17%"/>
				<col width="33%"/>
				<col width="17%"/>
				<col width="33%"/>
			</colgroup>
			<tbody>
				<tr>
					<th>작성자</th>
					<td>${detail.n_registrant}</td>
					<th>작성일</th>
					<td>${detail.n_regdate}</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>${detail.n_title}</td>
					<th>글번호</th>
					<td>${detail.n_no}</td>
				</tr>
				<tr>
					<th>내용</th>
					<td id="contentForm" colspan="3">
					${detail.n_content}</td>
				</tr>
			</tbody>
		</table>
	</div>
	<%-- ========== 상세 정보 보여주기 종료 ========== --%>

	<%-- ========== 버튼 추가 시작 ========== --%>
	<div class="btn">
				<input type="button" value="수정" id="updateBtn" class="btn btn-primary">
				<input type="button" value="삭제" id="deleteBtn" class="btn btn-primary">
				<input type="button" value="목록" id="noticeListBtn" class="btn btn-primary">
	</div>
	<%-- ========== 버튼 추가 종료 ========== --%>
</div>
</body>
</html>