<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 예약</title>
<link rel="stylesheet" type="text/css" href="/resources/css/reserve/reserveDetail.css">
<script>
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
		<div class="col p-3" id="mypetInputForm">
			<h3>예약내용</h3>
			<form id="reserveDetailForm">
			<!-- 
			<div class="form-group row">
				<label class="col-sm-3 col-form-label" for="inputDefault">룸 종류</label> 
				<div class="col-sm-7">
					<input type="text" class="form-control-plaintext" value="이름을 입력해주세요." readonly>
				</div>
			</div>
			
			<br>
			
			<div class="form-group row">
				<label class="col-sm-3 col-form-label" for="inputDefault">룸 유형</label> 
				<div class="col-sm-7">
					<input type="text" class="form-control-plaintext" value="이름을 입력해주세요." readonly>
				</div>
			</div>
			
			<br>
			
			<div class="form-group row">
      			<label class="col-sm-2 col-form-label" for="inputDefault">부가서비스</label> 
				<div class="col-sm-10">
					<label class="form-check-label"> 
					<input type="radio" class="form-check-input" value="option1" checked>
					목욕서비스
					</label>
					&nbsp;&nbsp;	
					<label class="form-check-label"> 
					<input type="radio" class="form-check-input" value="option2"> 
					매너벨트
					</label>
					&nbsp;&nbsp;
					<label class="form-check-label"> 
					<input type="radio" class="form-check-input" value="option2"> 
					간식, 사료 추가
					</label>
				</div>
  		  	</div> -->
  		  	
  		  	<input type="text" value="${cageRoomVO.c_price }" name="r_payprice" />
  		  	<input type="hidden" value="valid" name="r_status" id="r_status"/>
  		  	<input type="hidden" value="N" name="r_approval" id="r_approval"/>
  		  	<input type="hidden" value="${cageRoomVO.c_no }" name="c_no" id="c_no"/>
			
			<input type="text" name="startDate" value="${rDate.startDate }"/>
  			<input type="text" name="endDate" value="${rDate.endDate }"/>
			</form>
		</div>
		
		<div class="col p-3" id="reservationContent">
			<h3>결제 수단</h3>
		</div>
		<button type="button" class="btn btn-secondary" onclick="requestReservation()">예약하기</button>
	</div>
	
	

	${reservationVO.c_no }
	<br> ${reservationVO.r_startDate }
	<br> ${reservationVO.r_endDate }

</body>
</html>