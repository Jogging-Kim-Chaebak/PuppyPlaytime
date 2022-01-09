<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri ="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정 화면</title>
<link rel="stylesheet" type="text/css" href="/resources/include/assets/css/common.css"/>
<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.css"/>

<script type="text/javascript"
src="/resources/include/assets/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" 
src="/resources/include/assets/js/common.js"></script>
<script type="text/javascript">

	$(function(){
		
		var formObj = $("#f_writeForm");
		
		//현재 페이지 번호와 페이징 크기
		var pageObj = $("#page");
		var sizePerPageObj = $("#sizePerPage");
		var pageVal = pageObj.val();
		var sizePerPageVal = sizePerPageObj.val();
			
		/*수정 버튼 클릭 시 처리 이벤트*/
		$("#modifyBtn").click(function(){
			//입력값 체크
			if(!chkSubmit($('#n_title'),"제목을")) return;
			else if(!chkSubmit($('#n_registrant'),"작성자를")) return;
			else if(!chkSubmit($('#n_content'),"작성할 내용을")) return;
			else{
			
			var goUrl=""; //이동할 경로를 저장할 변수
			
			formObj.attr({
				"method":"POST",
				"action":"/admin/notice/modify"
					
			});
			formObj.submit();
					
		}
		});
	
		/*삭제 버튼 클릭 시 처리 이벤트*/
		$("#deleteBtn").click(function(){
		var goUrl=""; //이동할 경로를 저장할 변수
		goUrl = "/admin/notice/noticeDelete";
		
		formObj.attr("action",goUrl);
		formObj.submit();
		});
		
		
		/*취소 버튼 클릭 시 처리 이벤트(목록으로 이동)*/
		$("#cancelBtn").click(function(){
			
			//페이징 관련 정보를 쿼리 파라미터로 전달한다.
			self.location = "noticeList${pgrq.toUriString()}";
			
			
		});
	});
</script>
</head>
<body>



<div class="contentContainer">
	<div class="contentTit"><h3>공지사항 글수정</h3></div>
	<div class="contentTB">
	<form id="f_writeForm" name="f_writeForm">
	<input type="hidden" name="n_no" id="n_no" value="${updateData.n_no}"/>
	
	<!-- 현재 페이지 번호와 페이징 크기를 숨겨진 필드 요소를 사용하여 전달한다. -->
	
	<input type="hidden" name="page" value="${pgrq.page}"/>
	<input type="hidden" name="sizePerPage" value="${pgrq.sizePerPage}"/>
	
		<%-- ========== 수정 정보 보여주기 시작 ========== --%>
	<div id="List">
		<table>
			<colgroup>
				<col width="17%"/>
				<col width="33%"/>
				<col width="17%"/>
				<col width="33%"/>
			</colgroup>
			<tbody>
				<tr>
					<td class="ac">글번호</td>
					<td>${updateData.n_no}</td>
					<td class="ac">작성일</td>
					<td>${updateData.n_regdate}</td>
				</tr>
				<tr>
					<td class="ac">작성자</td>
					<td colspan="3">
					<input type="text" id="n_registrant" name="n_registrant" value="${updateData.n_registrant}"/></td>
				</tr>
				<tr>
					<td class="ac">제목</td>
					<td colspan="3">
					<input type="text" name="n_title" id="n_title" value="${updateData.n_title}"/></td>
				</tr>
				<tr>
					<td class="ac vm">내용</td>
					<td colspan="3">
					<textarea name="n_content" id="n_content">${updateData.n_content}</textarea></td>
				</tr>
			</tbody>
		</table>
	</form>
</div>
	<%-- ========== 상세 정보 보여주기 종료 ========== --%>
</div>
<div>
	<input type="button" value="수정" id="modifyBtn" class="btn btn-primary">
	<input type="button" value="삭제" id="deleteBtn" class="btn btn-primary">
	<input type="button" value="취소" id="cancelBtn" class="btn btn-primary">
</div>
</div>
</body>
</html>