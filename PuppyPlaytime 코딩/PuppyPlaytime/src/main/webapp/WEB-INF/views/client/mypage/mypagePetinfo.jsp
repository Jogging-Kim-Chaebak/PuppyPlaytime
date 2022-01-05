<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫 목록</title>
<style type="text/css">
table, td, th {
  table-layout: fixed;
  border-collapse : collapse;
}

th, td {
  text-align: center;
  vertical-align: middle;
  overflow:hidden;
  white-space : nowrap;
  text-overflow: ellipsis;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
		$(function(){
			/* 등록 버튼 클릭 시 처리 이벤트 */
			$("#insertFormBtn").click(function(){
				location.href="/client/mypage/insertForm";
			});
			
			/* 펫번호 클릭시 상세 페이지 이동을 위한 처리 이벤트 */
			$(".petdetailBtn").click(function(){
				var p_no = $(this).parents("tr").attr("data-num");
				$("#p_no").val(p_no);
				console.log("펫번호 : " + p_no);
			//상세 페이지로 이동하기 위해 form추가
			$("#detailForm").attr({
				"method":"post",
				"action":"/client/mypage/petDetail"
			});
			$("#detailForm").submit();
			});
			
			
			
		});	
			
		
	</script>
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> -->
</head>
<body>

	<div class="nav-item3">
		<div align="center" class="contentTit"><br><br><h3>마이펫 정보</h3></div>
	
		<!-- 상세 페이지 이동을 위한 FORM -->
		<form name="detailForm" id="detailForm" method="post">
			<input type="hidden" name="p_no" id="p_no">
		</form>
		<!-- 펫 등록 버튼 출력시작 -->
		<div class="contentBtn" align="right">
			<input type="button" value="등록" id="insertFormBtn"  class="btn btn-primary">
		</div>
		<!-- 펫 등록 버튼 출력종료 -->
		
		<!-- 펫리스트 시작 -->
		<form name="userFoam">
		<div id="petList">		
		<table border="1" summary="마이펫 리스트" class="table table-bordered">
			<colgroup>
				<col width="7%" />
				<col width="13%" />
				<col width="10%" />
				<col width="10%" />
				<col width="10%" />
				<col width="10%" />
				<col width="20%" />
			</colgroup>
			<thead>
				<tr class="table-primary">
					<th align="center">펫번호</th>
					<th align="center">강아지사진</th>
					<th align="center">이름</th>
					<th align="center">견종</th>
					<th align="center">성별</th>
					<th align="center">체중</th>
					<th align="center">특이사항</th>
					<th align="center">상세보기</th>
				</tr>
			</thead>
			<tbody id="list">
			<!-- 데이터 출력 -->
			<c:choose>
				<c:when test="${not empty petList}">
					<c:forEach var="pet" items="${petList}" varStatus="status">
					<tr class="tac" data-num="${pet.p_no}">
						<td class="goDetail tal">${pet.p_no}</td>
						<c:choose>
						<c:when test="${empty pet.p_picture}">
							<td>등록된 사진 정보가 존재하지 않습니다.</td>
						</c:when>
						<c:otherwise>
							<td><img src="/image/petImages/${pet.p_picture}" width="150px" height="80px"/></td>
						</c:otherwise>
						</c:choose>
						<td>${pet.p_name}</td>
						<td>${pet.p_dogbreed}</td>
						<td><c:set var="name" value="${pet.p_gender}" />
								<c:choose> 
								    <c:when test="${name eq 'M'}">
								        <a>수컷</a>
								    </c:when>
								    <c:when test="${name eq 'F'}">
								        <a>암컷</a>
								    </c:when>
								</c:choose>
						</td>
						<td><c:set var="name" value="${pet.p_weight}" />
								<c:choose> 
								    <c:when test="${name eq 'small'}">
								        <a>소형견</a>
								    </c:when>
								    <c:when test="${name eq 'middle'}">
								        <a>중형견</a>
								    </c:when>
								    <c:when test="${name eq 'big'}">
								        <a>대형견</a>
								    </c:when>
								</c:choose>
						</td>
						<td>${pet.p_unique}</td>
						<td><input type="button" id="petdetailBtn" name="petdetailBtn"
			class="petdetailBtn" value="상세보기"></td>
					</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
					<td colspan="8" class="tac">등록된 펫이 존재하지 않습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
			</tbody>
		</table>
		</div>
		<!-- 펫리스트 종료 -->
			</form>
	</div>
	
</body>
</html>