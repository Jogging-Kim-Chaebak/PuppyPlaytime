<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>글쓰기 화면</title>

		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		
		<script type="text/javascript">
			$(function(){
				/* 저장 버튼 클릭 시 처리 이벤트 */
				$("#inquiryInsertBtn").click(function(){
					//입력값 체크					
					//if (!chkSubmit($('#q_title'),"제목을"))	return;
					//else if (!chkSubmit($('#q_content'),"작성할 내용을"))	return;
					//else {
						
						$("#q_writeForm").attr({
							"method":"POST",
							"action":"/client/inquiry/inquiryInsert"
						});
						$("#q_writeForm").submit();
					//}
				});
				
				/* 목록 버튼 클릭 시 처리 이벤트 */
				$("#inquiryListBtn").click(function(){
					location.href="/client/inquiry/inquiryList";
				});
			});
		</script>
	</head>
	<body>	
		<div class="contentContainer">
			<div class="contentTit"><h3>문의하기</h3></div>
	
			<div class="contentTB">
				<form id="q_writeForm" name="q_writeForm">
					<table id="inquiryWrite" class="table table-hover">
						<colgroup>
							<col width="17%" />
							<col width="83%" />
						</colgroup>
						<tr>
							<td class="ac">작성자</td>
							<td>${userId }</td>
						</tr>
						<tr>
							<td class="ac">글제목</td>
							<td><input type="text" name="q_title" id="q_title"></td>
						</tr>
						<tr>
							<td class="ac vm">내용</td>
							<td><textarea name="q_content" id="q_content" class="form-label mt-4"></textarea></td>
						</tr>	
					</table>
				</form>
			</div>
				
			<div class="contentBtn">
				<input type="button" value="저장" class="btn btn-primary" id="inquiryInsertBtn" class="btn btn-primary">
				<input type="button" value="목록" class="btn btn-primary" id="inquiryListBtn" class="btn btn-primary">
			</div>
		</div>
	</body>
</html>

