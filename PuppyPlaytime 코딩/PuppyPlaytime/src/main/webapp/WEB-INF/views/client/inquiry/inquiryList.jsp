<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>글 목록</title>
		<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script type="text/javascript">
		$(function(){
		
			/* 글쓰기 버튼 클릭 시 처리 이벤트 */		
			$("#insertFormBtn").click(function(){
				location.href = "/client/inquiry/inquiryWrite";
			});
			
			/* 제목 클릭시 상세 페이지 이동을 위한 처리 이벤트 */	
			$(".goDetail").click(function(){
				var q_no =  $(this).parents("tr").attr("data-num");	
				$("#q_no").val(q_no);
				console.log("글번호 : "+q_no);
				//상세 페이지 
				$("#inquirydetail").attr({
					"method":"get",
					"action":"/client/inquiry/inquiryDetail"
				});
				$("#inquirydetail").submit(); 
			});
		});
		</script>
	</head>
	<body>
		<div class="contentContainer">
			<div class="contentTit"><h3>문의게시판 리스트</h3></div>
			
			<%-- ======= 상세 페이지 이동을 위한 FORM ============ --%>
			<form name="inquirydetail" id="inquirydetail">
			      <input type="hidden" name="q_no" id="q_no">
			</form>
			
			<%-- ================= 리스트 시작  =============== --%>
			<div id="inquiryList">
			<table summary="문의게시판 리스트" class="table table-hover">
				<colgroup>
					<col width="10%" />
					<col width="62%" />
					<col width="15%" />
					<col width="13%" />
				</colgroup>
				<thead>
					<tr>
					  <th data-value="q_no" class="order">글번호
					
					   </th>
					   <th>문의내역</th>
					   <th data-value="q_regdate" class="order">작성일

					    </th>
					    <th class="borcle">작성자</th>
					</tr>
				</thead>
				<tbody id="list" class="table-secondary">
				<!-- 데이터 출력 -->
				<c:choose>
					<c:when test="${not empty inquiryList}" >
						<c:forEach var="inquiry" items="${inquiryList}" varStatus="status">
							<tr class="tac" data-num="${inquiry.q_no}">
								<td>${inquiry.q_no}</td>
								<td class="goDetail tal">${inquiry.q_title}</td>
								<td>${inquiry.q_regdate}</td>
								<td class="name">${inquiry.m_id}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="4" class="tac">등록된 게시물이 존재하지 않습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody> 
			</table>
			</div>
			<%-- ================= 리스트 종료 ================ --%>
			<%-- ============== 글쓰기 버튼 출력 시작============ --%>
			<div class="contentBtn">
				<input type="button" value="문의하기" id="insertFormBtn"  class="btn btn-lg btn-primary">
			</div>
			<%-- ============== 글쓰기 버튼 출력 종료============ --%>
			
		</div>
	</body>
</html>
