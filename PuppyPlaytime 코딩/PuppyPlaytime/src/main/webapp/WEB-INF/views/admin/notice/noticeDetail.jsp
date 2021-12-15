<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 상세보기</title>
<script type="text/javascript"
src="/resources/include/assets/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" 
src="/resources/include/assets/js/common.js"></script>
<script type="text/javascript">
	
	$(function(){
		/*삭제 버튼 클릭 시 처리 이벤트*/
		$("#noticeDeleteBtn").click(function(){
		var goUrl=""; //이동할 경로를 저장할 변수
			
		goUrl = "/admin/notice/noticeDelete";
		
		$("#f_data").attr("action",goUrl);
		$("#f_data").submit();
		});
		
		/*목록 버튼 클릭 시 처리 이벤트*/
		$("#noticeListBtn").click(function(){
			location.href="/admin/notice/noticeList";
		});
	
	});
	
</script>
</head>
<body>
	<div>
		<div><h3>게시판 상세보기</h3></div>
		<form name="f_data" id="f_data" method="POST">
			<input type="hidden" name="n_no" value="${detail.n_no}"/>
		</form>
	<%-- ========== 버튼 추가 시작 ========== --%>
	<table id="noticeBtn">
		<tr>
			<td>
				
				<input type="button" value="수정" id="updateFormBtn">
				<input type="button" value="삭제" id="noticeDeleteBtn">
				<input type="button" value="목록" id="noticeListBtn">
			</td>
		</tr>
	</table>
	<%-- ========== 버튼 추가 종료 ========== --%>
	
	<%-- ========== 상세 정보 보여주기 시작 ========== --%>
	<div>
		<table>
			<colgroup>
				<col width="17%"/>
				<col width="33%"/>
				<col width="17%"/>
				<col width="33%"/>
			</colgroup>
			<tbody>
				<tr>
					<td>작성자</td>
					<td>${detail.n_registrant}</td>
					<td>작성일</td>
					<td>${detail.n_regdate}</td>
				</tr>
				<tr>
					<td>제목</td>
					<td colspan="3">${detail.n_title}</td>
				</tr>
				<tr>
					<td>내용</td>
					<td colspan="3">${detail.n_content}</td>
				</tr>
			</tbody>
		</table>
	
	
	</div>
	<%-- ========== 상세 정보 보여주기 종료 ========== --%>
	
	</div>

</body>
</html>