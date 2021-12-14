<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	 <div class="form-group row">
      <label for="staticEmail" class="col-sm-2 col-form-label">시작날짜</label>
      <div class="col-sm-10">
        <input type="text" class="form-control-plaintext" id="staticEmail" value="${startDate }">
      </div>
      <label for="staticEmail" class="col-sm-2 col-form-label">종료날짜</label>
      <div class="col-sm-10">
        <input type="text" class="form-control-plaintext" id="staticEmail" value="${endDate }">
      </div>
    </div>
</body>
</html>