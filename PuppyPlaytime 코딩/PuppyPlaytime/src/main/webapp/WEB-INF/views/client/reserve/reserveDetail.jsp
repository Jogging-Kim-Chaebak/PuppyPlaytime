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
		var services = $('input[type=checkbox]');
		var r_price;
		$(services).each(function(index, item){
			// 체크박스 클릭시 실행
			$(item).click(function(){
				r_price = parseInt($("#r_payPrice").val());
				if($(item).is(':checked')){
					$("#r_payPrice").val(r_price + parseInt($("#servicePrice"+index).val()));
				}else if(!$(item).is(':checked')){
					$("#r_payPrice").val(r_price - parseInt($("#servicePrice"+index).val()));
				}
			});
		});
	});
	
	
	function requestReservation(){
		$("#reserveDetailForm").attr({
			"action" : "/client/reserve/reserveDetail",
			"method" : "post"
		});
		
		alert("예약이 등록되었습니다.");	
		$("#reserveDetailForm").submit();
	}
</script>
</head>
<body>
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="reserveCalendar">예약 날짜</a></li>
		<li class="breadcrumb-item"><a href="javascript:history.back(-2)">마이펫</a></li>
		<li class="breadcrumb-item"><a href="javascript:history.back()">예약 룸 정보</a></li>
		<li class="breadcrumb-item active">결제 페이지</li>
	</ol>
	
	<div class="row">
		<div class="container">
			<h3>예약내용</h3>
			<form id="reserveDetailForm">
			<div class="form-group row">
      			<label class="col-sm-5 col-form-label" for="inputDefault">부가서비스</label> 
				<div class="col-sm-5">
				<c:choose>
					<c:when test="${empty extraServiceList}">
						<label>부가서비스가 존재하지 않습니다.</label>
					</c:when>
					<c:otherwise>
						<c:set var="serviceIndex" value="${0}"/>
						<c:forEach items="${extraServiceList}" var="extraservice">
							<label class="form-check-label"> 
							<input type="checkbox" class="form-check-input" name="services" value="${extraservice.s_no }">
							${extraservice.s_name }
							<input type="hidden" id="servicePrice${serviceIndex}" value="${extraservice.s_price}"/>
							<c:set var="serviceIndex" value="${serviceIndex + 1}" />
							</label>
							&nbsp;&nbsp;
						</c:forEach>
					</c:otherwise>	
				</c:choose>
				</div>
  		  	</div> 
  		  	
  		  	<input type="text" value="${cageRoomVO.c_price }" name="r_payPrice" id="r_payPrice" />
  		  	<input type="hidden" value="valid" name="r_status" id="r_status"/>
  		  	<input type="hidden" value="W" name="r_approval" id="r_approval"/>
  		  	<input type="text" value="${cageRoomVO.c_no }" name="c_no" id="c_no"/>
  		  	<input type="text" value="${p_no}" name="r_pet" id="r_pet"/>
			
			<input type="text" name="startDate" value="${rDate.startDate }"/>
  			<input type="text" name="endDate" value="${rDate.endDate }"/>
			</form>
		</div>
	</div>

</body>
</html>