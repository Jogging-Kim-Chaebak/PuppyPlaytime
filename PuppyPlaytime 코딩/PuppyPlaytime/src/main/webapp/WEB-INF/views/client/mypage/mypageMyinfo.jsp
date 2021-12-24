<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내정보</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
$(function(){
		
	/* 수정 버튼 클릭 시 처리 이벤트 */
	$("#myUpdateBtn").click(function(){
		alert("수정");
		goUrl="/client/mypage/myUpdateForm";
		$("#myFoam").attr("action",goUrl);
		$("#myFoam").submit();
		
	}); 
	
});
</script>
</head>
<body>
<form id="memberForm" name="memberForm" action="#"
		onsubmit="return checks();" method="post">
		<div class="form-group">
			<caption>
				<h3>내정보수정</h3>
			</caption>

			<div class="form-floating">
				<input type="text" id="m_id" name="m_id"  readonly class="form-control"
					placeholder="영문 숫자 포함 20자" value="${updatedata.m_id }" /> <label for="m_id">아이디</label>
			</div>
			<div class="form-floating">
				<input type="password" id="m_pw" name="m_pw"
					placeholder="영문 숫자 특수문자 포함 20자" readonly class="form-control"> <label
					for="m_pw">비밀번호</label>
			</div>
			<div class="form-floating">

				 <input type="password" id="m_pwCheck" name="m_pwCheck"
					maxlength="15" class="form-control" readonly placeholder="입력한 비밀번호와 일치해야함">
				<label for="m_pwCheck">비밀번호 확인</label>
			</div>

			<div class="form-floating">
				<input type="text" id="m_name" name="m_name" readonly class="form-control"
					placeholder="이름"><label for="m_name">이름</label>

			</div>

			<div class="form-floating">
				<input type="text" id="m_birth" name="m_birth" readonly class="form-control"
					placeholder="YYYY-MM-DD 입력"><label for="m_birth">생일</label>
			</div>
			<div class="form-floating">
				<input type="text" id="m_phone" name="m_phone" readonly class="form-control"
					placeholder="(-) 제외 숫자로만 11자"><label for="m_phone">핸드폰
					번호</label>
			</div>
			<div class="form-floating">
				<input type="text" id="m_address" name="m_address"
					placeholder=" 도로명 주소" readonly class="form-control"><label
					for="m_address"> 주소</label>
			</div>
			
			
			<div class="form-floating">
				<input type="text" id="m_email" name="m_email" readonly class="form-control"
					placeholder="이메일 입력"> <input type="button" value="인증하기"
					id="mailCheckBtn"><br>
				<label for="m_email">회원 이메일 </label> 
			</div>
		</div>

		<br>
		<div class="form-group">
			<input type="button" id ="myUpdateBtn" name="myUpdateBtn" class="myUpdateBtn" value="수정하러가기">
		</div>
	</form>
</body>
</html>