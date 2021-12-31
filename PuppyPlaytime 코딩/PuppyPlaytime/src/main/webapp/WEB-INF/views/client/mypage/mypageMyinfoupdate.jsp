<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
$(function() {
	/* 수정 버튼 클릭 시 처리 이벤트 */
	$("#updatebtn").click(function() {
		alert("수정");
		goUrl = "/client/mypage/myUpdate";
		$("#memberForm").attr("action", goUrl);
		$("#memberForm").submit();
	});
	
	
});
</script>
<meta charset="UTF-8">
<title>내정보 수정</title>

</head>
<body>
<form id="memberForm" name="memberForm" method="post">
		<div class="form-group">
			<caption>
				<h3>내정보수정</h3>
			</caption>

			<div class="form-floating">
				<input type="text" id="m_id" name="m_id" value="${updateData.m_id}" readonly class="form-control"
					placeholder="영문 숫자 포함 20자" /> <label for="m_id">아이디</label>
			</div>
			<div class="form-floating">
				<input type="password" id="m_pw" name="m_pw"
					placeholder="영문 숫자 특수문자 포함 20자" class="form-control"> <label
					for="m_pw">비밀번호</label>
			</div>
			<div class="form-floating">

				 <input type="password" id="m_pwCheck" name="m_pwCheck"
					maxlength="15" class="form-control" placeholder="입력한 비밀번호와 일치해야함">
				<label for="m_pwCheck">비밀번호 확인</label>
			</div>

			<div class="form-floating">
				<input type="text" id="m_name" name="m_name" class="form-control"
					placeholder="이름"><label for="m_name">이름</label>

			</div>

			<div class="form-floating">
				<input type="text" id="m_birth" name="m_birth" class="form-control"
					placeholder="YYYY-MM-DD 입력"><label for="m_birth">생일</label>
			</div>
			<div class="form-floating">
				<input type="text" id="m_phone" name="m_phone" class="form-control"
					placeholder="(-) 제외 숫자로만 11자"><label for="m_phone">핸드폰
					번호</label>
			</div>
			<div class="form-floating">
				<input type="text" id="m_address" name="m_address"
					placeholder=" 도로명 주소" class="form-control"><label
					for="m_address"> 주소</label>
			</div>
			
			
			<div class="form-floating">
				<input type="text" id="m_email" name="m_email" class="form-control"
					placeholder="이메일 입력"> <input type="button" value="인증하기"
					id="mailCheckBtn"><br>
				<label for="m_email">회원 이메일 </label> 
			</div>
		</div>

		<br>
		<div class="form-group">
			<input type="button" id="updatebtn" name="updatebtn" class="btn btn-primary" value="수정반영하기">
		</div>
	</form>
</body>
</html>