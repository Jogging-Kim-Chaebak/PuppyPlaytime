<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
$(function() {
	/* 수정 버튼 클릭 시 처리 이벤트 */
	$("#updatebtn").click(function() {
		
		//유효성
		var checkIP = /^[a-zA-Z0-9]{8,20}$/; //아이디와 비밀번호 유효성 검사 정규식
		var p_RegExp = /^.*(?=^.{8,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/; //비밀번호 유효성 검사 정규식
		var checkName = /^[가-힣a-zA-Z]{0,50}$/; //이름 유효성 검사 정규식(한글,영문만 가능)
		var checkBirth = /^(19[0-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/; //생년월일 유효성 검사 정규식   
		var t_RegExp = /^01(?:0|1|[6-9])(?:\d{3}|\d{4})\d{4}$/;//핸드폰 번호 유효성 검사 정규식
		var checkEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/; //Email 유효성 검사 정규식
		var form = document.memberForm;
		
		//값 불러오기
		var userID = document.getElementById("m_id"); //아이디
		var userPass = document.getElementById("m_pw"); //비밀번호
		var userPassC = document.getElementById("m_pwCheck"); //비밀번호 확인
		var userName = document.getElementById("m_name"); //이름
		var userbirth = document.getElementById("m_birth"); //생일
		var userPhone = document.getElementById("m_phone"); //핸드폰 번호
		var userEmail = document.getElementById("m_email"); //이메일

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
			alert("생년월일 입력해주세요.");
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
			alert("핸드폰 번호 입력해주세요.");
			return false;
		}
		//핸드폰 번호 형식 입력
		if (!t_RegExp.test(userPhone.value)) {
			alert("(-) 제외 형식으로 입력하여주세요.");
			return false;
		}
		
		/*이메일 유효성검사*/
		//이메일에서 입력 필수 조건문
		if (userEmail.value == '') {
			alert("이메일 입력해주세요.");
			return false;
		}
		//이메일 형식 입력
		if (!checkEmail.test(userEmail.value)) {
			alert("---@---.com 형식으로 입력하여주세요.");
			return false;
		}
		
		//인증하기버튼
		if($("#mailCheckBtn").val() != "true"){
			 alert("이메일 인증을 완료해주세요.");
			 
			 $("#m_emailNumber_box").focus();
			 return false;
		}
		
		 //인증번호 입력
		if (form.m_emailNumber.value == "") {
			alert("인증번호를 입력하세요.");
			form.m_emailNumber.focus();//인증번호 박스로 이동.
			return false;
		}
		//인증버튼
		if($("#m_emailNumber_box").val() != "true"){
			 alert("이메일 번호 인증을 완료해주세요.");
			 
			 $("#m_emailNumber_box").focus();
			 return false;
		} 
		
		goUrl = "/client/mypage/myUpdate";
		$("#memberForm").attr("action", goUrl);
		$("#memberForm").submit();
		alert("내정보가 수정되었습니다.");
		
		
	});
	
});	


	$(function() {
    var code = "a";                //이메일전송 인증번호 저장위한 코드
    
    /* 인증번호 이메일 전송 */
	$("#mailCheckBtn").on("click", function() {
		var email = $("#m_email").val(); // 입력한 이메일
		
		var checkEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/; //Email 유효성 검사 정규식
		
		//이메일에서 입력 필수 조건문
		if (email == "") {
			alert("이메일을 입력하세요.");
			return;
		}
		
		//이메일 형식 입력
		if (!checkEmail.test(email)) {
			alert("이메일 ---@---.com 형식으로 입력 가능합니다.");
			return;
		}
		
		var checkBox = $("#m_emailNumber"); // 인증번호 입력란

		$.ajax({
			type : "GET",
			url : "mailCheck?email=" + email,
			success : function(data) {
				var userEmail = document.getElementById("m_email"); //이메일
				
				// 이메일 중복체크
				if(data === "Already Registered"){
					alert("이미 등록된 이메일입니다.");
				}else{
					alert("인증번호를 보냈습니다.");
					$("#mailCheckBtn").val("true");
					checkBox.attr("disabled", false);
					code = data;
				}
			},
			error:function(request,status,error){
			    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	});

	/* 인증번호 비교 */
	$("#m_emailNumber_box").on("click", function() {

		var inputCode = $("#m_emailNumber").val(); // 입력코드    
		var checkResult = $("#mailCheckBtn"); // 비교 결과     

		if (inputCode == code) { // 일치할 경우
			alert("인증번호가 일치합니다.");
			$("#m_emailNumber_box").val("true");
			$("#m_emailNumber").attr("disabled", true);
			$("#updatePw").attr("disabled", true);

		} else { // 일치하지 않을 경우
			alert("인증번호를 다시 확인해주세요.");
			$("#mailCheckBtn").val("false");
		}
		
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
				<br>
				<br>
				<h3 align="center">내정보 수정</h3>
			</caption>

			<div class="form-group">
				<label class="form-label mt-4" for="m_id">아이디</label>
				<input type="text" id="m_id" name="m_id" value="${updateData.m_id}" readonly class="form-control"
					placeholder="영문 숫자 포함 20자" /> 
			</div>
			
			<div class="form-group">
				<label class="form-label mt-4" for="m_pw">비밀번호</label>
				<input type="password" id="m_pw" name="m_pw"
					placeholder="영문 숫자 특수문자 포함 20자" class="form-control">
			</div>
			
			<div class="form-group">
				<label class="form-label mt-4" for="m_pwCheck">비밀번호 확인</label>
				<input type="password" id="m_pwCheck" name="m_pwCheck"
					maxlength="15" class="form-control" placeholder="입력한 비밀번호와 일치해야함">
			</div>

			<div class="form-group">
				<label class="form-label mt-4" for="m_name">이름</label>
				<input type="text" id="m_name" name="m_name" value="${updateData.m_name}" class="form-control"
					placeholder="이름">
			</div>

			<div class="form-group">
				<label class="form-label mt-4" for="m_birth">생일</label>
				<input type="text" id="m_birth" name="m_birth" value="${updateData.m_birth}" class="form-control"
					placeholder="YYYY-MM-DD 입력">
			</div>
			
			<div class="form-group">
				<label class="form-label mt-4" for="m_phone">핸드폰 번호</label>
				<input type="text" id="m_phone" name="m_phone" value="${updateData.m_phone}" class="form-control"
					placeholder="(-) 제외 숫자로만 11자">
			</div>
			<div class="form-group">
				<label class="form-label mt-4" for="m_address">주소</label>
				<input type="text" id="m_address" name="m_address" value="${updateData.m_address}"
					placeholder=" 도로명 주소" class="form-control">
			</div>
						
			<div class="m_emailNumber_box_warn">
			<label class="form-label mt-4" for="m_email">이메일</label>
					<div class="input-group mb-3">
					
						<input type="text" id="m_email" name="m_email" placeholder="이메일(이메일은 1개만 등록 가능합니다.)" class="form-control"
							aria-describedby="button-addon2">
						<label for="m_email"></label>
						<button type="button" value="인증하기" name="mailCheckBtn" id="mailCheckBtn"
							class="btn btn-primary btn-sm" >인증하기</button>
						 <br>
					</div>
					<div class="input-group mb-3">
					
						<input type="text" id="m_emailNumber" class="form-control" name="m_emailNumber" placeholder="인증번호"
							aria-describedby="button-addon2">
						<button type="button" value="인증" id="m_emailNumber_box" name="m_emailNumber_box" class="btn btn-primary btn-sm">인증</button>
						<br>
					</div>
				</div>
			</div>
					
		

		<br>
		<div align="center" class="form-group">
			<input type="button" id="updatebtn" name="updatebtn" class="btn btn-primary" value="수정반영하기">
		</div>
	</form>
</body>
</html>