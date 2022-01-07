<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<meta charset="UTF-8">
<title>글 상세보기</title>
<link rel="stylesheet" type="text/css" href="/resources/include/assets/css/common.css"/>
<link rel="stylesheet" type="text/css" href="/resources/include/assets/css/noticeList.css"/>
<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.css"/>

<script type="text/javascript"
src="/resources/include/assets/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	
	$(function(){
		
		
		/*목록 버튼 클릭 시 처리 이벤트*/
		$("#noticeListBtn").click(function(){
			location.href="/client/notice/noticeList";
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
<!-- 현재 페이지 번호와 페이징 크기를 숨겨진 필드 요소를 사용하여 전달한다. -->
	<input type="hidden" name="page" value="${pgrq.page}">
	<input type="hidden" name="sizePerPage" value="${pgrq.sizePerPage}">

	<div class="contentContainer">
		
		<form name="f_data" id="f_data" method="GET">
			<input type="hidden" name="n_no" value="${detail.n_no}"/>
		</form>
	
	
	<%-- ========== 상세 정보 보여주기 시작 ========== --%>
			<div class="contentTBT">
					<table>
						<colgroup>
						<col width="25%"/>
						<col width="25%"/>
						</colgroup>
						
							<tbody>
								<tr>
									<td class="aca">글번호</td>
									<td>${detail.n_no}</td>
								</tr>
								<tr>
									<td class="aca">작성자</td>
									<td>${detail.n_registrant}</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="contentTB">
						<table>
							
								<tbody>
									<tr>
										<td class="ac">제목</td>
										<td colspan="3">${detail.n_title}</td>
									</tr>
									<tr>
										<td class="ac vm">내용</td>
										<td colspan="3" class="ctr">${detail.n_content}</td>
									</tr>
									<tr>
										<td class="ac">작성일</td>
										<td colspan="3">${detail.n_regdate}</td>
									</tr>
								</tbody>
						</table>	
					</div>
	<%-- ========== 상세 정보 보여주기 종료 ========== --%>
	
	<%-- ========== 버튼 추가 시작 ========== --%>
		<div class="btn">
			<input type="button" value="목록" id="noticeListBtn" class="btn btn-lg btn-primary">
		</div>
	<%-- ========== 버튼 추가 종료 ========== --%>
		
	</div>
</body>
</html>