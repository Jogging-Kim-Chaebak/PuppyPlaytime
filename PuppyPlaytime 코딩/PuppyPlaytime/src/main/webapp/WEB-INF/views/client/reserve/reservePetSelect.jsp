<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 예약</title>
<link rel="stylesheet" type="text/css" href="/resources/css/reserve/reservePetSelect.css">

<script>
$(function(){
	$("#petSelectList").change(function() {
		var p_no_data = { "p_no":  $("#petSelectList").val() };
		
		$.ajax({
			url : "/client/reserve/reservePetSelect",
			type : "post",
			data : p_no_data,
			dataType : "json",
			error : function(){
				alert("시스템 오류입니다. 관리자에게 문의하세요.");
			},
			success : function(result){
				$("#p_name").val(result.p_name);
				$("#p_dogbreed").val(result.p_dogbreed);
				
				var p_gender_korean;
				var p_weight_korean;
				
				switch(result.p_gender) {
				case "M" :
					p_gender_korean = "수컷";
					break;
				case "F" :
					p_gender_korean = "암컷";
					break;
				}
				
				switch(result.p_weight) {
				case "small" :
					p_weight_korean = "소형";
					break;
				case "middle" :
					p_weight_korean = "중형";
					break;
				case "big" :
					p_weight_korean = "대형";
					break;
				}
				
				$("#p_gender").val(p_gender_korean);
				$("#p_weight").val(p_weight_korean);
				$("#p_unique").val(result.p_unique);
			}
		});
	});
});

function reserveRoom(){
	$("#mypetForm").attr({
		"action" : "/client/reserve/reserveRoom",
		"method" : "post"
	});
	
	alert($("#p_name").val() + "이(로) 예약 진행합니다.");	
	$("#mypetForm").submit();
}

</script>
</head>
<body>
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="javascript:history.back()">예약 날짜</a></li>
		<li class="breadcrumb-item active">마이펫 정보</li>
	</ol>
	<h2>마이펫 정보</h2>
	<div class="row">
		<div class="container" id="mypetInputForm">
			<c:if test="${empty petList }">
				펫이 존재하지 않습니다.<br>
				마이페이지에서 펫을 추가하고 와주세요.
			</c:if>
			<c:if test="${not empty petList }">
			<form id="mypetForm">
			<div class="form-group row">
				<div class="col-sm-6">
					<select class="form-select" id="petSelectList" name="p_no">
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
			
			 
			<div class="card">
	 			<div class="card-header">
	    		등록한 펫 정보
	  			</div>
 				<ul class="list-group list-group-flush">
    				<li class="list-group-item">
    					<label for="p_name">펫 이름 :</label> 
						<input type="text" id="p_name" name="p_name" value="${petVO.p_name}" readonly>
    				</li>
    				<li class="list-group-item">
    					<label for="p_name">펫 견종 :</label> 
						<input type="text" id="p_dogbreed" name="p_dogbreed" value="${petVO.p_dogbreed}" readonly>
    				</li>  
    				<li class="list-group-item">
    					<label for="p_name">펫 성별 :</label> 
						<input type="text" id="p_gender" name="p_gender" value="${p_gender_korean}" readonly>	
    				</li>  
    				<li class="list-group-item">
    					<label for="p_name">펫 체급 :</label> 
						<input type="text" id="p_weight" name="p_weight" value="${p_weight_korean}" readonly>
    				</li>  
				</ul>
				<div class="card-body">
					<label for="p_unique">특이사항</label><br>	
					<textarea id="p_unique" name="p_unique" rows="3" readonly>${petVO.p_unique }</textarea>
				</div>
			</div>
			
			<br><br>
			
			<input type="hidden" name="startDate" value="${rDate.startDate }" />
			<input type="hidden" name="endDate" value="${rDate.endDate }" />
			
			<button type="button" id="InputReserveBtn" class="btn btn-secondary" onclick="reserveRoom()">예약하러 가기</button>
			</form>
			</c:if>
		</div>
	</div>
</body>
</html>