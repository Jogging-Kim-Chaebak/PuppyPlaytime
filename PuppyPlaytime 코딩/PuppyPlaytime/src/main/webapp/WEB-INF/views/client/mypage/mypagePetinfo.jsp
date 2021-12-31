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
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
		$(function(){
			
			/* 등록 버튼 클릭 시 처리 이벤트 */
			$("#insertFormBtn").click(function(){
				location.href="/client/mypage/insertForm";
			});
			
			/* 펫번호 클릭시 상세 페이지 이동을 위한 처리 이벤트 */
			$(".goDetail").click(function(){
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

	<div class="contentContainer">
		<div class="contentTit"><h3>마이펫 정보</h3></div>
	
		<!-- 상세 페이지 이동을 위한 FORM -->
		<form name="detailForm" id="detailForm" method="post">
			<input type="hidden" name="p_no" id="p_no">
		</form>
		<!-- 펫 등록 버튼 출력시작 -->
		<div class="contentBtn">
			<input type="button" value="등록" id="insertFormBtn">
		</div>
		<!-- 펫 등록 버튼 출력종료 -->
		
		<!-- 펫리스트 시작 -->
		<form name="userFoam">
		<div id="petList">		
		<table border="1" summary="마이펫 리스트">
			<colgroup>
				<col width="10%" />
				<col width="20%" />
				<col width="10%" />
				<col width="10%" />
				<col width="10%" />
				<col width="10%" />
				<col width="20%" />
			</colgroup>
			<thead>
				<tr>
					<th>no</th>
					<th>강아지사진</th>
					<th>이름</th>
					<th>견종</th>
					<th>성별</th>
					<th>체중</th>
					<th>특이사항</th>
				</tr>
			</thead>
			<tbody id="list">
			<!-- 데이터 출력 -->
			<c:choose>
				<c:when test="${not empty petList}">
					<c:forEach var="pet" items="${petList}" varStatus="status">
					<tr class="tac" data-num="${pet.p_no}">
						<td class="goDetail tal">${pet.p_no}</td>
						<c:if test="${empty pet.p_picture}">
									<td>등록된 사진 정보가 존재하지 않습니다.</td>
							</c:if>
									<td><img src="/image/petImages/${pet.p_picture}"/></td>
									
						<td>${pet.p_name}</td>
						<td>${pet.p_dogbreed}</td>
						<td>${pet.p_gender}</td>
						<td>${pet.p_weight}</td>
						<td>${pet.p_unique}</td>
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