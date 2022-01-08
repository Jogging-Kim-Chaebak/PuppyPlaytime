<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<!-- 모바일 웹 페이지 설정 끝 -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<style type="text/css">
.form {
	width: 800px;
	padding: 20px;
	margin-left: auto;
	border: 1px solid #d9230f;
	text-align: left;
	margin-right: auto;
	margin-bottom: 10px;
}
</style>
<script type="text/javascript">
	//회원가입 버튼 클릭시
	function checks() {
		//유효성
		var checkIP = /^[a-zA-Z0-9]{8,20}$/; //아이디와 비밀번호 유효성 검사 정규식
		var p_RegExp = /^.*(?=^.{8,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/; //비밀번호 유효성 검사 정규식
		var checkName = /^[가-힣]{0,50}$/; //이름 유효성 검사 정규식(한글만 가능)
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
		var userPhone = document.getElementById("m_phone"); //핸드폰번호
		var userAddress = document.getElementById("m_address"); //주소
		var userEmail = document.getElementById("m_email"); //이메일
		
		
		/*아이디 유효성 검사*/
		//아이디에서 입력 필수 조건문
		if (userID.value == '') {
			alert("아이디를 입력해야 합니다.");
			return false;
		}

		//아이디 입력 문자수를 8~20자로 제한하는 조건문
		if (!checkIP.test(userID.value)) {
			alert("아이디는 8~20자 이내로 입력 가능합니다.");
			return false;
		}
		//아이디 중복 체크
		if ($("#resultAll").val() != "Y") {
			alert('중복 체크부터 하세요.');
			$('#m_idConfirm').focus();
			return false;
		}
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
		if (userPassC.value == '') {
			alert("비밀번호 확인을 입력해야 합니다.");
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
		//주소 입력
		if (userAddress.value == '') {
			alert("주소를 입력해주세요.");
			return false;
		}
		//필수 약관 동의
		if ($("input:checkbox[name=m_required1]:checked").length < 1) {
			alert("약관 동의에 체크 해주세요.");
			return false;
		}
		//개인정보 동의
		if ($("input:checkbox[name=m_required2]:checked").length < 1) {
			alert("개인정보 동의에 체크 해주세요.");
			return false;
		}

		/*이메일 유효성검사*/
		//이메일에서 입력 필수 조건문
		if (form.m_email.value == "") {
			alert("이메일을 입력하세요.");
			form.m_email.focus();//이메일 박스로 이동.
			return false;
		}
		//이메일 형식 입력
		if (!checkEmail.test(userEmail.value)) {
			alert("이메일 ---@---.com 형식으로 입력 가능합니다.");
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
		if (confirm("회원가입을 하시겠습니까?")) {
			alert("회원가입을 축하합니다");
		}
		form.submit();

	}

	$(function() {
		/*아이디 중복검사 버튼 클릭시  */
		$("#m_idConfirm").click(function() {
			var checkIP = /^[a-zA-Z0-9]{8,20}$/; //아이디와 비밀번호 유효성 검사 정규식
			var userID = document.getElementById("m_id"); //아이디

			if ($("#m_id").val().replace(/\s/g, "") == "") {
				alert('아이디를 입력해주세요.');
				return;
			}//아이디 입력 문자수를 8~20자로 제한하는 조건문
			if (!checkIP.test(userID.value)) {
				alert("아이디는 8~20자 이내로 입력 가능합니다.");
				return false;
			} else {
				$.ajax({
					url : "/client/member/m_idConfirm",
					type : "POST",
					data : "m_id=" + $("#m_id").val(),
					datatype : "text",
					success : function(result) {

						if (result == "N") {
							alert("사용할 수 없는 아이디입니다.");
							$('#m_idConfirm').attr('m_idConfirm', 'N');
							$("#m_id").val("");
							$("#m_id").focus();
						} else if (result == "Y") {
							alert("사용할 수 있는 아이디입니다.");
							$('#m_idConfirm').attr('m_idConfirm', 'Y');
							$("#m_id").attr("readOnly", "readOnly");
						}
						$("#resultAll").val(result);
					},
					error : function() {
						alert('시스템 오류입니다.')
					}
				});
			}

		}); //ajax 종료

	});//function 종료

	$(function() {
		var code = "a"; //이메일전송 인증번호 저장위한 코드

		/* 인증번호 이메일 전송 */
		$("#mailCheckBtn").on("click", function() {
			var email = $("#m_email").val(); // 입력한 이메일
			var checkBox = $("#m_emailNumber"); // 인증번호 입력란

			$.ajax({
				type : "GET",
				url : "mailCheck?email=" + email,
				success : function(data) {
					alert("인증번호를 보냈습니다.");
					$("#mailCheckBtn").val("true");
					checkBox.attr("disabled", false);
					code = data;
					
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
				$("#m_emailNumber").attr("disabled", true);

			}
			
		});
	});
</script>

<title>회원가입</title>
</head>
<body>
<body>
	<div class="form">
		<form id="memberForm" name="memberForm" action="#" onsubmit="return checks();" method="post">
			<div class="form-group">

				<h3>회원가입</h3>

				<div class="input-group mb-3">
					<input type="text" id="m_id" name="m_id" class="form-control form-control-lg"
							aria-describedby="button-addon2" placeholder="아이디"/>
					<label for="m_id"></label>
					<input type="hidden" name="resultAll" id="resultAll" value="N">
					<button type="button" id="m_idConfirm" name="m_idConfirm" class="btn btn-primary btn-sm">아이디 중복체크</button>
				</div>
			

				<div class="form-floating">
					<input type="password" id="m_pw" name="m_pw" placeholder="영문 숫자 특수문자 포함 20자" class="form-control">
					<label for="m_pw">비밀번호</label><br>
				</div>

				<div class="form-floating">
					<input type="password" id="m_pwCheck" name="m_pwCheck"
						maxlength="15" class="form-control" placeholder="입력한 비밀번호와 일치해야함">
					<label for="m_pwCheck">비밀번호 확인</label><br>
				</div>

				<div class="form-floating">
					<input type="text" id="m_name" name="m_name" class="form-control" placeholder="이름"> 
					<label for="m_name">이름</label><br>
				</div>

				<div class="form-floating">
					<input type="date" id="m_birth" name="m_birth" class="form-control">
					<label for="m_birth">생일</label><br>
				</div>
				<div class="form-floating">
					<input type="text" id="m_phone" name="m_phone" class="form-control">
					<label for="m_phone">핸드폰 번호 : (-) 제외 숫자로만 11자</label><br>
				</div>
				
				<div class="form-floating">
					<input type="text" id="m_address" name="m_address" placeholder=" 도로명 주소" class="form-control">
					<label for="m_address"> 주소</label>
				</div>
				
				<fieldset class="form-group">
				<legend class="mt-4">필수약관</legend>
				<div class="form-check">
					<input class="form-check-input" type="checkbox" id="m_required1" name="m_required1" value="Y" />
					<label for="m_required1" class="form-check-label">[필수] 약관 동의 </label>
					<textarea class="form-control" rows="3"> 약관동의-puppy playtime  서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 puppy playtime 서비스의 이용과 관련하여 puppy playtime  서비스를 제공하는 puppy playtime
 주식회사(이하 ‘puppy playtime’)와 이를 이용하는 puppy playtime  서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 puppy playtime 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
제 1장 총칙

제 1 조(목적)

본 약관은 국가공간정보포털 웹사이트(이하 "국가공간정보포털")가 제공하는 모든 서비스(이하 "서비스")의 이용조건 및 절차, 회원과 국가공간정보포털의 권리, 의무, 책임사항과 기타 필요한 사항을 규정함을 목적으로 합니다.

제 2 조(약관의 효력과 변경)

1. 국가공간정보포털은 이용자가 본 약관 내용에 동의하는 경우, 국가공간정보포털의 서비스 제공 행위 및 회원의 서비스 사용 행위에 본 약관이 우선적으로 적용됩니다.
2. 국가공간정보포털은 약관을 개정할 경우, 적용일자 및 개정사유를 명시하여 현행약관과 함께 국가공간정보포털의 초기화면에 그 적용일 7일 이전부터 적용 전일까지 공지합니다. 단, 회원에 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 국가공간정보포털은 개정 전 내용과 개정 후 내용을 명확하게 비교하여 회원이 알기 쉽도록 표시합니다.
3. 변경된 약관은 국가공간정보포털 홈페이지에 공지하거나 e-mail을 통해 회원에게 공지하며, 약관의 부칙에 명시된 날부터 그 효력이 발생됩니다. 회원이 변경된 약관에 동의하지 않는 경우, 회원은 본인의 회원등록을 취소(회원탈퇴)할 수 있으며, 변경된 약관의 효력 발생일로부터 7일 이내에 거부의사를 표시하지 아니하고 서비스를 계속 사용할 경우는 약관 변경에 대한 동의로 간주됩니다.

제 3 조(약관 외 준칙)

본 약관에 명시되지 않은 사항은 전기통신기본법, 전기통신사업법, 정보통신윤리위원회심의규정, 정보통신 윤리강령, 프로그램보호법 및 기타 관련 법령의 규정에 의합니다.

제 4 조(용어의 정의)

본 약관에서 사용하는 용어의 정의는 다음과 같습니다.
1. 이용자 : 본 약관에 따라 국가공간정보포털이 제공하는 서비스를 받는 자
2. 가입 : 국가공간정보포털이 제공하는 신청서 양식에 해당 정보를 기입하고, 본 약관에 동의하여 서비스 이용계약을 완료시키는 행위
3. 회원 : 국가공간정보포털에 개인 정보를 제공하여 회원 등록을 한 자로서 국가공간정보포털이 제공하는 서비스를 이용할 수 있는 자.
4. 계정(ID) : 회원의 식별과 회원의 서비스 이용을 위하여 회원이 선정하고 국가공간정보포털에서 부여하는 문자와 숫자의 조합
5. 비밀번호 : 회원과 계정이 일치하는지를 확인하고 통신상의 자신의 비밀보호를 위하여 회원 자신이 선정한 문자와 숫자의 조합
6. 탈퇴 : 회원이 이용계약을 종료시키는 행위
7. 본 약관에서 정의하지 않은 용어는 개별서비스에 대한 별도 약관 및 이용규정에서 정의합니다. </textarea>

					<br>
					 <input class="form-check-input" type="checkbox" id="m_required2" name="m_required2" value="Y" />
					 <label for="m_required2"  class="form-check-label">[필수] 개인 정보 동의 </label>
					<textarea class="form-control" rows="3">개인 정보 수집 및 이용 동의 -개인정보보호법에 따라 puppy playtime 에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적,
                    개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부 시 불이익에 관한  사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.
                    제15조(개인정보의 수집ㆍ이용)

① 개인정보처리자는 다음 각 호의 어느 하나에 해당하는 경우에는 개인정보를 수집할 수 있으며 그 수집 목적의 범위에서 이용할 수 있다.

1. 정보주체의 동의를 받은 경우

2. 법률에 특별한 규정이 있거나 법령상 의무를 준수하기 위하여 불가피한 경우

3. 공공기관이 법령 등에서 정하는 소관 업무의 수행을 위하여 불가피한 경우

4. 정보주체와의 계약의 체결 및 이행을 위하여 불가피하게 필요한 경우

5. 정보주체 또는 그 법정대리인이 의사표시를 할 수 없는 상태에 있거나 주소불명 등으로 사전 동의를 받을 수 없는 경우로서 명백히 정보주체 또는 제3자의 급박한 생명, 신체, 재산의 이익을 위하여 필요하다고 인정되는 경우

6. 개인정보처리자의 정당한 이익을 달성하기 위하여 필요한 경우로서 명백하게 정보주체의 권리보다 우선하는 경우. 이 경우 개인정보처리자의 정당한 이익과 상당한 관련이 있고 합리적인 범위를 초과하지 아니하는 경우에 한한다.

 

② 개인정보처리자는 제1항제1호에 따른 동의를 받을 때에는 다음 각 호의 사항을 정보주체에게 알려야 한다. 다음 각 호의 어느 하나의 사항을 변경하는 경우에도 이를 알리고 동의를 받아야 한다.

1. 개인정보의 수집·이용 목적

2. 수집하려는 개인정보의 항목

3. 개인정보의 보유 및 이용 기간

4. 동의를 거부할 권리가 있다는 사실 및 동의 거부에 따른 불이익이 있는 경우에는 그 불이익의 내용</textarea>
				</div>
				</fieldset>
				<fieldset class="form-group">
					<legend class="mt-4">광고성 정보 수신 동의</legend>
					<div class="form-check">
					
						<input class="form-check-input" type="checkbox" id="m_optional" name="m_optional" value='Y' /> 
						<label class="form-check-label">[선택]이메일</label>
					</div>
				</fieldset>
				<br>
				<div class="m_emailNumber_box_warn">
					<div class="input-group mb-3">
						<input type="text" id="m_email" name="m_email" placeholder="이메일" class="form-control"
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
			<div class="form-group">
				<button type="button" class="btn btn-primary" id="member" onclick="checks()">회원가입</button>
			</div>
		</form>
	</div>
</body>
</html>