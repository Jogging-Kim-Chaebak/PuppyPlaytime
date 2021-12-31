<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri ="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기 화면</title>
<link rel="stylesheet" type="text/css" href="/resources/include/assets/css/common.css"/>
<link rel="stylesheet" type="text/css" href="/resources/include/assets/css/noticeList.css"/>
<script type="text/javascript"
src="/resources/include/assets/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" 
src="/resources/include/assets/js/common.js"></script>
<script type="text/javascript">
	$(function(){
		/*저장 버튼 클릭 시 처리 이벤트*/
		$("#insertBtn").click(function(){
			//입력값 체크
			//if(!chkSubmit($('#n_title'),"제목을")) return;
			//else if(!chkSubmit($('#n_registrant'),"작성자를")) return;
			//else if(!chkSubmit($('#n_content'),"작성할 내용을")) return;
			//else{
				$("#f_writeForm").attr({
						"method":"POST",
						"action":"/admin/notice/noticeAdd"
				});
				$("#f_writeForm").submit();
			//}
		});
		
		
		/*목록 버튼 클릭 시 처리 이벤트*/
		$("#noticeListBtn").click(function(){
			location.href="/admin/notice/noticeList";
		});
		
	});


</script>
</head>
<body>
<div class="contentContainer">
	<div class="contentTit"><h3>공지사항 등록</h3></div>
	
	<div class="contentTB">
	<form id="f_writeForm" name="f_writeForm">
		<table id="noticeWrite">
			<colgroup>
				<col width="17%"/>
				<col width="83%"/>
			</colgroup>
			<tr>
				<td class="ac">작성자</td>
				<td><input type="text" value="${userId}" readonly></td>
			<tr>
				<td class="ac">글제목</td>
				<td><input type="text" name="n_title" id="n_title"></td>
			</tr>
			<tr>
				<td class="ac vm">내용</td>
				<td><textarea name="n_content" id="n_content"></textarea></td>
			</tr>
		</table>	
	</form>
	</div>
</div>
<div class="contentBtn">
	<input type="button" value="저장" id="insertBtn">
	<input type="button" value="목록" id="noticeListBtn">
</div>
</body>
</html>