<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	
	function checks() {
		//유효성
		var checkIP = /^[a-zA-Z0-9]{8,20}$/; //아이디와 비밀번호 유효성 검사 정규식
		var p_RegExp = /^.*(?=^.{8,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/; //비밀번호 유효성 검사 정규식
		var checkName = /^[가-힣a-zA-Z]{0,50}$/; //이름 유효성 검사 정규식(한글,영문만 가능)
		var checkBirth = /^(19[0-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/; //생년월일 유효성 검사 정규식   
		var t_RegExp = /^01(?:0|1|[6-9])(?:\d{3}|\d{4})\d{4}$/;//핸드폰 번호 유효성 검사 정규식
		var checkEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/; //Email 유효성 검사 정규식

		//값 불러오기
		var userID = document.getElementById("m_id"); //아이디
		var userPass = document.getElementById("m_pw"); //비밀번호
		var userPassC = document.getElementById("m_pwCheck"); //비밀번호 확인
		var userName = document.getElementById("m_name"); //이름
		var userbirth = document.getElementById("m_birth"); //생일
		var userPhone = document.getElementById("m_phone"); //핸드폰 번호

		/*비밀번호 유효성 검사*/
		//비밀번호에서 입력 필수 조건문
		if (userPass.value == '') {
			alert("비밀번호를 입력해야 합니다.");
			return false;
		}
		//비밀번호 입력 문자수를 8~20자/특수문자로 제한하는 조건문
		if (!p_RegExp.test(userPass.value)) {
			alert("비밀번호는 특수문자 포함 8~20자 이내로 입력 가능합니다.");
			return false;
		}
		//비밀번호와 비밀번호확인이 동일한지 검사
		if (userPassC.value != userPass.value) {
			alert("비밀번호가 틀립니다. 다시 확인하여 입력해주세요.");
			return false;
		}
		/*이름 유효성검사*/
		//비밀번호에서 입력 필수 조건문
		if (userName.value == '') {
			alert("이름을 입력해주세요.");
			return false;
		}
		//이름 한글 입력
		if (!checkName.test(userName.value)) {
			alert("특수문자,영어,숫자는 사용할수 없습니다. 한글만 입력하여주세요.");
			return false;
		}
		/*생년월일 유효성검사*/
		//생년월일에서 입력 필수 조건문
		if (userbirth.value == '') {
			alert("생년월일을 입력해주세요.");
			return false;
		}
		//생년월일 yyyy-MM-dd 형식 입력
		if (!checkBirth.test(userbirth.value)) {
			alert(" yyyy-MM-dd 형식으로 입력하여주세요.");
			return false;
		}
		/*핸드폰 번호 유효성검사*/
		//핸드폰 번호에서 입력 필수 조건문
		if (userPhone.value == '') {
			alert("핸드폰번호를 입력해주세요.");
			return false;
		}
		//핸드폰 번호 형식 입력
		if (!t_RegExp.test(userPhone.value)) {
			alert("(-) 제외 형식으로 입력하여주세요.");
			return false;
		}
		

		}

	}
</script>
<meta charset="UTF-8">
<title>내정보 수정</title>

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
					placeholder="영문 숫자 포함 20자" /> <label for="m_id">${updateData.m_id}</label>
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
			<input type="submit" class="btn btn-primary"
				onclick="location.href=client/mypage/myDetail" value="수정반영하기">
		</div>
	</form>
</body>
</html>