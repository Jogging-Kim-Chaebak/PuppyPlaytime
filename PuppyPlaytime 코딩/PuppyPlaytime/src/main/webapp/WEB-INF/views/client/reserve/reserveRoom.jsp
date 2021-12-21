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
	<ol class="breadcrumb">
  		<li class="breadcrumb-item"><a href="javascript:history.back()">예약 날짜</a></li>
  		<li class="breadcrumb-item active">예약 룸 정보</li>
	</ol>
	
	<!--  <div class="container mt-3">-->
  	<h2>예약 가능 룸 리스트</h2>
  	<form id="dateForm"> 
  		<input type="hidden" name="startDate" value="${startDate }"/>
  		<input type="hidden" name="endDate" value="${endDate }"/>
  		<input type="hidden" id="c_no" name="c_no">
  	</form>
  	<div class="row">
	<c:forEach items="${roomList }" var="room">
		<div class="col-sm">
		 	<div class="card" style="width:330px">
			   	<img class="card-img-top"> <!-- src="../bootstrap4/img_avatar1.png" alt="Card image" style="width:100%"> -->
			    <div class="card-body">
			     	<h4 class="card-title">${room.c_kind}&nbsp;${room.c_type }</h4>
			      	<p class="card-text">${room.c_explain }</p>
			     	<p class="card-text">가격 : ${room.c_price }</p>
			     	<img src="/image/roomImages/${room.c_picture}" class="mx-auto d-block"/>
			     	<a onclick="lik(${room.c_no})" class="btn btn-primary">예약하기</a>
			    </div>
		  	</div>
		  	<br>
	  	</div>
	</c:forEach>
	</div>
	
</body>
</html>