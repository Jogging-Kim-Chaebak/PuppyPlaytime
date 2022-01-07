<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>글상세 보기</title>
<script type="text/javascript">
	$(function() {


		/* 목록 버튼 클릭 시 처리 이벤트 */
		$("#inquiryListBtn").click(function() {
			location.href = "/admin/inquiry/adminInquiryList";
		});

		// 삭제
		$("#inquiryDeleteBtn").click(function() {
			$("#inquiryUpdate").attr("action","/admin/inquiry/adminInquiryDelete");
			$("#inquiryUpdate").submit();
		});
	});
</script>
</head>
<body>
	<div class="contentContainer">
		<div class="contentTit">
			<h3>문의게시판 상세보기</h3>
		</div>
		<form name="inquiryUpdate" id="inquiryUpdate">
			<input type="hidden" name="q_no" id="q_no" value="${detail.q_no}">
		</form>
		<%-- =============== 상세 정보 보여주기 시작 ============ --%>
		<div class="contentTB">
			<table  class="table table-hover">
				<colgroup>
					<col width="17%" />
					<col width="33%" />
					<col width="17%" />
					<col width="33%" />
				</colgroup>
				<tbody>
					<tr>
						<td class="ac">작성자</td>
						<td>${detail.m_id}</td>
						<td class="ac">작성일</td>
						<td>${detail.q_regdate}</td>
					</tr>
					<tr>
						<td class="ac">제목</td>
						<td colspan="3">${detail.q_title}</td>
					</tr>
					<tr>
						<td class="ac vm">내용</td>
						<td colspan="3">${detail.q_content}</td>
					</tr>
				</tbody>
			</table>
		</div>
		<%-- =============== 상세 정보 보여주기 종료 ============ --%>

		<table id="inquiryPwdBut">
			<tr>

				<td id="btd2">
					
					
					<input type="button" value="삭제"
					id="inquiryDeleteBtn" class="btn btn-primary"/> 
				
					
					<input type="button" value="목록"
					id="inquiryListBtn" class="btn btn-primary"/></td>
			</tr>
		</table>
		<br>
			<jsp:include page="reply.jsp"></jsp:include>
	</div>
</body>
</html>

