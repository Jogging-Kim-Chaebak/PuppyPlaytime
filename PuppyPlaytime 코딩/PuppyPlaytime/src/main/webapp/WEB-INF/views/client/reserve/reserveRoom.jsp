<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/resources/js/reserve/reserveRoom.js"></script>
</head>
<body>
	<h2>예약 룸 정보</h2>
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="reserveCalendar">예약 날짜</a></li>
		<li class="breadcrumb-item active">마이펫</li>
		<li class="breadcrumb-item active">예약 룸 정보</li>
	</ol>
	
	<!--  <div class="container mt-3">-->
  	<form id="dateCageForm"> 
  		<input type="hidden" name="startDate" value="${rDate.startDate}"/>
  		<input type="hidden" name="endDate" value="${rDate.endDate }"/>
  		<input type="hidden" id="c_no" name="c_no">
  		<input type="hidden" id="p_no" name="p_no" value="${p_no}">
  		<input type="hidden" id="page" name="pageRequest.page" value="${rDate.pageRequest.page }" />
  		<input type="hidden" id="sizePerPage" name="pageRequest.sizePerPage" value="${rDate.pageRequest.sizePerPage }" />
  	</form>
  	<c:choose>
	  	<c:when test="${empty roomList}">
			<label>예약 가능한 방이 존재하지 않습니다.</label>
		</c:when>
		<c:otherwise>
			<c:forEach items="${roomList }" var="room">
				<div class="card">
					<div class="row g-0">
						<div class="col-md-4">
							<img class="img-fluid rounded-start" src="/image/roomImages/${room.c_picture}"/>
						</div>
						<div class="col-md-8">
							<div class="card-body">
								<h4 class="card-title">${room.c_kind}&nbsp;${room.c_type }</h4>
								<p class="card-text">${room.c_explain }</p>
							 	<p class="card-text">1박당 가격 : ${room.c_price }</p>
							   	<a onclick="reservationDetail(${room.c_no})" class="btn btn-primary">예약하기</a>
						  	</div>
					  	</div>
					</div>
			  	</div>
			  	<br>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	
	<!-- 페이징 네비게이션 -->
	<div>
		<ul class="pagination justify-content-center">
		<c:forEach begin="${pagination.startPage }" end="${pagination.endPage }" var="idx">
			<li class="page-ltem">
				<a class="page-link" href="javascript:reservationRoom('${idx}')">${idx }</a>
			</li>
		</c:forEach>
		</ul>
	</div>
	
</body>
</html>