<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>글상세 보기</title>

<link rel="stylesheet" type="text/css"
	href="/resources/include/dist/css/bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/include/dist/css/bootstrap.min.css" />
<script type="text/javascript">
	$(function() {

		/* 수정 버튼 클릭 시 처리 이벤트 */
		$("#inquiryupdateBtn").click(function() {
			console.log("글번호 : " + q_no);
			$("#inquiryUpdate").attr ("method","get");
			$("#inquiryUpdate").attr("action","client/inquiry/inquiryUpdate");
			$("#inquiryUpdate").submit();
		});

		/* 목록 버튼 클릭 시 처리 이벤트 */
		$("#inquiryListBtn").click(function() {
			location.href = "/client/inquiry/inquiryList";
		});

		// 삭제
		$("#inquiryDeleteBtn").click(function() {
			$("#inquiryUpdate").attr("action","client/inquiry/inquiryDelete");
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
			<table class="table table-hover">
				<colgroup>
					<col width="17%" />
					<col width="33%" />
					<col width="17%" />
					<col width="33%" />
				</colgroup>
				<tbody>
					<tr>
						<td class="ac">작성자</td>
						<td>${userId}</td>
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
				<c:if test="${m_id eq 'admin'}">
				<input type="button" value="수정"
					id="inquiryupdateBtn"/> 
					<input type="button" value="삭제"
					id="inquiryDeleteBtn"/> 
				</c:if>
					
					<input type="button" value="목록"
					id="inquiryListBtn"  class="btn btn-primary"/></td>
			</tr>
		</table>
		<br>
			<jsp:include page="reply.jsp"></jsp:include>
	</div>
</body>
</html>

