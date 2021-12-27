<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 예약</title>
<link rel="stylesheet" type="text/css" href="/resources/css/reserve/reserveDetail.css">
<script>
	$(function(){
		$("#petSelectList").change(function() {
			var p_no_data = { "p_no":  $("#petSelectList").val() };
			
			$.ajax({
				url : "/client/reserve/reservePetSelect",
				type : "post",
				data : p_no_data,
				dataType : "text",
				error : function(){
					alert("시스템 오류입니다. 관리자에게 문의하세요.");
				}
			});
		});
	});

	function importPet(){
		$("#petSelectList").removeAttr("disabled");
	}
</script>
</head>
<body>
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="javascript:history.back()">예약 날짜</a></li>
		<li class="breadcrumb-item active">예약 룸 정보</li>
	</ol>
	<div class="row">
		<div class="col p-6" id="mypetInputForm">
			<h3>마이펫</h3>
			<div class="form-group row">
				<div class="col-sm-6">
					<select class="form-select" id="petSelectList">
						<c:choose>
							<c:when test="${not empty petList}">
								<c:forEach var="pet" items="${petList }">
									<option value="${pet.p_no }">${pet.p_name }</option>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<option>펫이 존재하지 않습니다.</option>
							</c:otherwise>
						</c:choose>
					</select>
				</div>
			</div>
			<br>
			<form id="mypetForm">
			<div class="form-group row">
      			<label class="col-sm-2 col-form-label" for="p_name">이름</label> 
				<div class="col-sm-10">
				</div>
  		  	</div>
  		  	
  		  	<br>
  		  	
  		  	<div class="form-group row">
      			<label class="col-sm-2 col-form-label" for="p_dogbreed">견종</label> 
				<div class="col-sm-10">
				</div>
  		  	</div>
  		  	
  		  	<br>
  		  	
  		  	<div class="form-group row" id="petGenderRadio">
      			<label class="col-sm-2 col-form-label">성별</label> 
				<div class="col-sm-10">
				</div>
  		  	</div>

			<br>
			
			<div class="form-group row" id="petWeightRadio">
      			<label class="col-sm-2 col-form-label">체급</label> 
				<div class="col-sm-10">
				</div>
  		  	</div>
			
			<br>
			
			<label class="form-check-label" for="p_unique">특이사항</label>	
			
			<br>
			
			<input type="hidden" name="startDate" value="${rDate.startDate }" />
			<input type="hidden" name="endDate" value="${rDate.endDate }" />
			
			<button type="button" id="InputReserveBtn" class="btn btn-secondary" onclick="petInput()" disabled>예약하러 가기</button>
			</form>
		</div>
		
		<div class="col p-2" id="reservationContent">

		</div>
	</div>
	
	

	${reservationVO.c_no }
	<br> ${reservationVO.r_startDate }
	<br> ${reservationVO.r_endDate }

</body>
</html>