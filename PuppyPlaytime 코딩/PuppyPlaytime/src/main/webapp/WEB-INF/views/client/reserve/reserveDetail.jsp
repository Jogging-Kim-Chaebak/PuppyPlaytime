<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 페이지</title>
<link rel="stylesheet" type="text/css" href="/resources/css/reserve/reserveDetail.css">
<style>
#days, #r_payPrice, #c_price{
	border : 0;
}

#r_payPrice{
	font-size: 30px;
	font-weight: bold;
	color: red;
}

</style>
<script>
	$(function(){
		var services = $('input[type=checkbox]');
		var r_price;
		var days;
		
		r_price = parseInt($("#r_payPrice").val());
		days = parseInt($("#days").val());
		
		$("#r_payPrice").val(r_price * days);
		
		// 부가서비스 체크박스 구현 
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
	<h3>예약 페이지</h3>
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="reserveCalendar">예약 날짜</a></li>
		<li class="breadcrumb-item active">마이펫 정보</li>
		<li class="breadcrumb-item active">예약룸 정보</li>
		<li class="breadcrumb-item active">예약 페이지</li>
	</ol>
	<div class="row">
		<div class="container">
			<form id="reserveDetailForm">
  		  	
  		  	<div class="card">
	 			<div class="card-header">
	    		부가서비스 선택
	  			</div>
	  			<div class="card-body">
	    		<c:choose>
					<c:when test="${empty extraServiceList}">
						<label>부가서비스가 존재하지 않습니다.</label>
					</c:when>
					<c:otherwise>
						<c:set var="serviceIndex" value="${0}"/>
						<c:forEach items="${extraServiceList}" var="extraservice">
							<label class="form-check-label"> 
							<input type="checkbox" class="form-check-input" name="services" value="${extraservice.s_no }">
							${extraservice.s_name }&nbsp;(+ ${extraservice.s_price }원)
							<input type="hidden" id="servicePrice${serviceIndex}" value="${extraservice.s_price}"/>
							<c:set var="serviceIndex" value="${serviceIndex + 1}" />
							</label>
							&nbsp;&nbsp;&nbsp;&nbsp;
						</c:forEach>
					</c:otherwise>	
				</c:choose>
	  			</div>
			</div>
			
			<br>
  		  	
	  		<div class="card">
	 			<div class="card-header">
	    		예약 정보
	  			</div>
 				<ul class="list-group list-group-flush">
    				<li class="list-group-item">예약 시작 : ${rDate.startDate }</li>
    				<li class="list-group-item">예약 종료 : ${rDate.endDate }</li>    					
    				<li class="list-group-item">룸 번호 : ${cageRoomVO.c_no } &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
    				<c:if test="${cageRoomVO.c_kind eq 'small'}" >
    					방 종류 : 소형
   					</c:if>
   					<c:if test="${cageRoomVO.c_kind eq 'middle'}" >
   						방 종류 : 중형
   					</c:if>    					
   					<c:if test="${cageRoomVO.c_kind eq 'big'}" >
    					방 종류 : 대형
    				</c:if>
					&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;방 유형 : ${cageRoomVO.c_type } </li>
  				</ul>
			</div>
			
			<br>
			
			<div class="card">
	 			<div class="card-header">
	    		가격 정보
	  			</div>
	  			<ul class="list-group list-group-flush">
	    			<li class="list-group-item">
	    			숙박할 일 수 : 
    				<input type="text" id="days" value="${calDateDays}" readonly />
	  				</li>
	  				<li class="list-group-item">
	    			1박당 룸 가격 : 
    				<input type="text" id="c_price" value="${cageRoomVO.c_price }" readonly />
	  				</li>
	  			</ul>	
	  			<div class="card-body">
	  				가격 : 
	  				<input type="text" value="${cageRoomVO.c_price }" name="r_payPrice" id="r_payPrice" readonly />
	  			</div>
			</div>
  		  	
  		  	<br>
  		  	
  		  	<input type="hidden" value="valid" name="r_status" id="r_status"/>
  		  	<input type="hidden" value="W" name="r_approval" id="r_approval"/>
  		  	<input type="hidden" value="${cageRoomVO.c_no }" name="c_no" id="c_no"/>
  		  	<input type="hidden" value="${p_no}" name="r_pet" id="r_pet"/>
			
			<input type="hidden" name="startDate" value="${rDate.startDate }" id="startDate"/>
  			<input type="hidden" name="endDate" value="${rDate.endDate }" id="endDate"/>
			
			<button type="button" class="btn btn-secondary" onclick="requestReservation()">예약하기</button>
			</form>
		</div>
	</div>

</body>
</html>