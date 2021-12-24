<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 상세보기</title>
<link rel="stylesheet" type="text/css" href="/resources/include/assets/css/common.css"/>
<link rel="stylesheet" type="text/css" href="/resources/include/assets/css/noticeList.css"/>
<script type="text/javascript"
src="/resources/include/assets/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" 
src="/resources/include/assets/js/common.js"></script>
<script type="text/javascript">
	
	$(function(){
		/*삭제 버튼 클릭 시 처리 이벤트*/
		$("#deleteBtn").click(function(){
			var goUrl=""; //이동할 경로를 저장할 변수
			
			goUrl = "/admin/notice/noticeDelete";
		
			$("#f_data").attr("action",goUrl);
			$("#f_data").submit();
		});
		
		/*목록 버튼 클릭 시 처리 이벤트*/
		$("#noticeListBtn").click(function(){
			location.href="/admin/notice/noticeList";
		});
		
		/*수정 버튼 클릭 시 처리 이벤트*/
		$("#updateBtn").click(function(){
			var goUrl=""; //이동할 경로를 저장할 변수
			
			goUrl = "/admin/notice/modify";
			
			$("#f_data").attr("action",goUrl);

			$("#f_data").submit();
	
		});
		
	
	});
	
</script>
</head>
<body>
	<div class="contentContainer">
		<div class="contentTit"><!-- <h3>게시판 상세보기</h3> --></div>
		<form name="f_data" id="f_data" method="GET">
			<input type="hidden" name="n_no" value="${detail.n_no}"/>
		</form>
	
	
	<%-- ========== 상세 정보 보여주기 시작 ========== --%>
	<div class="contentTB">
		<table>
			<colgroup>
				<col width="17%"/>
				<col width="33%"/>
				<col width="17%"/>
				<col width="33%"/>
			</colgroup>
			<tbody>
				<tr>
					<td class="ac">작성자</td>
					<td>${detail.n_registrant}</td>
					<td class="ac">작성일</td>
					<td>${detail.n_regdate}</td>
				</tr>
				<tr>
					<td class="ac">제목</td>
					<td colspan="3">${detail.n_title}</td>
				</tr>
				<tr>
					<td class="ac vm">내용</td>
					<td colspan="3">${detail.n_content}</td>
				</tr>
			</tbody>
		</table>
	
	
	</div>
	<%-- ========== 상세 정보 보여주기 종료 ========== --%>
	
	</div>
	
	<%-- ========== 버튼 추가 시작 ========== --%>
	
	<table id="noticeBut">
		<tr>
			<td id="btd2">
				
				<input type="button" value="수정" id="updateBtn">
				<input type="button" value="삭제" id="deleteBtn">
				<input type="button" value="목록" id="noticeListBtn">
			</td>
		</tr>
	</table>
	<%-- ========== 버튼 추가 종료 ========== --%>

</body>
</html>