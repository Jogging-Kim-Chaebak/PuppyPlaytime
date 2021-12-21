<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 예약</title>
<link rel="stylesheet" type="text/css" href="/resources/css/reserve/reserveDetail.css">
</head>
<body>
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="reserveCalendar">예약 날짜</a></li>
		<li class="breadcrumb-item"><a href="javascript:history.back()">예약 룸 정보</a></li>
		<li class="breadcrumb-item active">상세예약</li>
	</ol>
	<div class="row">
		<div class="col p-3">
			<h3>마이펫</h3>
			<form id="mypetForm">
			<div class="form-group row">
				<button type="button" class="col-sm-3 btn btn-outline-info">정보 불러오기</button>
				<div class="col-sm-7">
					<select class="form-select" id="exampleSelect1" disabled>
						<option>강아지를 선택해주세요</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
					</select>
				</div>
			</div>
			<br>
			
			<div class="form-group row">
      			<label class="col-sm-2 col-form-label" for="p_name">이름</label> 
				<div class="col-sm-10">
					<input type="text" name="p_name" class="form-control" placeholder="이름을 입력해주세요." id="p_name">
				</div>
  		  	</div>
  		  	
  		  	<br>
  		  	
  		  	<div class="form-group row">
      			<label class="col-sm-2 col-form-label" for="p_dogbreed">견종</label> 
				<div class="col-sm-10">
					<input type="text" name="p_dogbreed" class="form-control" placeholder="견종을 입력해주세요." id="p_dogbreed">
				</div>
  		  	</div>
  		  	
  		  	<br>
  		  	
  		  	<div class="form-group row">
      			<label class="col-sm-2 col-form-label">성별</label> 
				<div class="col-sm-10">
					<label class="form-check-label"> 
					<input type="radio" class="form-check-input" name="p_gender" id="p_gender1" value="M" checked>
					수컷
					</label>
					&nbsp;&nbsp;
					<label class="form-check-label"> 
					<input type="radio" class="form-check-input" name="p_gender" id="p_gender2" value="F"> 
					암컷
					</label>
				</div>
  		  	</div>

			<br>
			
			<div class="form-group row">
      			<label class="col-sm-2 col-form-label">견종</label> 
				<div class="col-sm-10">
					<label class="form-check-label"> 
					<input type="radio" class="form-check-input" name="p_weight" id="p_weight1" value="small" checked>
					소형
					</label>
					&nbsp;&nbsp;	
					<label class="form-check-label"> 
					<input type="radio" class="form-check-input" name="p_weight" id="p_weight2" value="middle"> 
					중형
					</label>
					&nbsp;&nbsp;
					<label class="form-check-label"> 
					<input type="radio" class="form-check-input" name="p_weight" id="p_weight3" value="big"> 
					대형
					</label>
				</div>
  		  	</div>
			
			<br>
			
			<label class="form-check-label" for="p_unique">특이사항</label>	
			<textarea class="form-control" id="p_unique" name="p_unique" rows="3"></textarea>
			
			<br>
			
			<input type="hidden" value="ghld12345" name="m_id" id="m_id"/>
			<button type="button" class="btn btn-secondary">입력하기</button>
			</form>
		</div>
		
		<div class="col p-3" id="reservationContent">
			<h3>예약내용</h3>
			<div class="form-group row">
				<label class="col-sm-3 col-form-label" for="inputDefault">룸 종류</label> 
				<div class="col-sm-7">
					<input type="text" class="form-control-plaintext" value="이름을 입력해주세요." id="inputDefault" readonly>
				</div>
			</div>
			
			<br>
			
			<div class="form-group row">
				<label class="col-sm-3 col-form-label" for="inputDefault">룸 유형</label> 
				<div class="col-sm-7">
					<input type="text" class="form-control-plaintext" value="이름을 입력해주세요." id="inputDefault" readonly>
				</div>
			</div>
			
			<br>
			
			<div class="form-group row">
      			<label class="col-sm-2 col-form-label" for="inputDefault">부가서비스</label> 
				<div class="col-sm-10">
					<label class="form-check-label"> 
					<input type="radio" class="form-check-input" name="extraService" id="optionsRadios2" value="option1" checked>
					목욕서비스
					</label>
					&nbsp;&nbsp;	
					<label class="form-check-label"> 
					<input type="radio" class="form-check-input" name="extraService" id="optionsRadios2" value="option2"> 
					매너벨트
					</label>
					&nbsp;&nbsp;
					<label class="form-check-label"> 
					<input type="radio" class="form-check-input" name="extraService" id="optionsRadios2" value="option2"> 
					간식, 사료 추가
					</label>
				</div>
  		  	</div>
  		  	
  		  	<br>
  		  	
  		  	
		</div>
	</div>
	
	

	${reservationVO.c_no }
	<br> ${reservationVO.r_startDate }
	<br> ${reservationVO.r_endDate }

</body>
</html>