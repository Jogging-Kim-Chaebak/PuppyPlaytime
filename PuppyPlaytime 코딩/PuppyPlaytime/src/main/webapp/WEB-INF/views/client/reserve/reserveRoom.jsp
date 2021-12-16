<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ol class="breadcrumb">
  		<li class="breadcrumb-item"><a href="javascript:history.back()">예약 날짜</a></li>
  		<li class="breadcrumb-item active">예약 룸 정보</li>
	</ol>
	<div class="container mt-3">
  		<h2>예약 가능 룸 리스트</h2>
  
		<c:forEach items="${roomList }" var="room">
	 		<div class="card" style="width:400px">
		    	<img class="card-img-top"> <!-- src="../bootstrap4/img_avatar1.png" alt="Card image" style="width:100%"> -->
		    	<div class="card-body">
		     		<h4 class="card-title">${room.c_kind}&nbsp;${room.c_type }</h4>
		      		<p class="card-text">${room.c_explain }</p>
		      		<a href="#" class="btn btn-primary">예약하기</a>
		    	</div>
	  		</div>
	  		<br>
		</c:forEach>
	</div>

</body>
</html>