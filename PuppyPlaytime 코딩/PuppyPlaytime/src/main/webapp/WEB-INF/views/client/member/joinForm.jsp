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
		//비밀번호에서 입력 필수 조건문
		if (userPass.value == '') {
			alert("아이디를 입력해야 합니다.");
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
		//필수 약관 동의
		if ($("input:radio[name=m_required1]:checked").length < 1) {
			alert("약관 동의에 체크 해주세요.");
			return false;
		}
		//개인정보 동의
		if ($("input:radio[name=m_required2]:checked").length < 1) {
			alert("개인정보 동의에 체크 해주세요.");
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
		//아이디 중복
		if($("#resultAll").val() != "Y") {
			alert('중복 체크부터 하세요.');
			$('#m_idConfirm').focus();
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
			
			if ($("#m_id").val().replace(/\s/g, "") == "") {
				alert('아이디를 입력해주세요.');
				return;
			} else {
				$.ajax({
					url : "/client/member/m_idConfirm",
					type : "POST",
					data : "m_id=" + $("#m_id").val(),
					datatype : "text",
					success : function(result) {
						
						if (result == "N") {
							alert("사용할 수 없는 아이디입니다.");
							$('#m_idConfirm').attr('m_idConfirm','N');
							$("#m_id").val("");
							$("#m_id").focus();
						} else if(result == "Y"){
							alert("사용할 수 있는 아이디입니다.");
							$('#m_idConfirm').attr('m_idConfirm','Y');
							$("#m_id").attr("readOnly", "readOnly");
							//$('#joinInsert').attr('disabled', false);
						}
						$("#resultAll").val(result);
						// alert($("#resultAll").val());
					},
					error : function() {
						alert('시스템 오류입니다.')
					}
				});
			}

		}); //ajax 종료

	});//function 종료
	$(function() {
		var code = "";                //이메일전송 인증번호 저장위한 코드
	/* 인증번호 이메일 전송 */
	$("#mailCheckBtn").click(function(){
		 var email = $("#m_email").val();        // 입력한 이메일
		 var cehckBox = $("#m_emailNumber");        // 인증번호 입력란
		 
		 $.ajax({
		        type:"GET",
		        url:"mailCheck?email=" + email,
		        success:function(data){
		        	//console.log("data : "+data); //정상적으로 들어왔는지 확인
		        	cehckBox.attr("disabled",false);
		        	code = data;
		        }       
		    });
		});
	});
	$(function() {
		var code = ""; 
	/* 인증번호 비교 */
	$("#m_emailNumber_box").blur(function(){
	    
	    var inputCode = $("#m_emailNumber").val();        // 입력코드    
	    var checkResult = $("#m_emailNumber_box");   // 비교 결과     
	    
	    if(inputCode == code){                               // 일치할 경우
	        checkResult.html("인증번호가 일치합니다.");
	        checkResult.attr("class", "correct");        
	    } else {                                             // 일치하지 않을 경우
	        checkResult.html("인증번호를 다시 확인해주세요.");
	        checkResult.attr("class", "incorrect");
	    } 
	});
	});
</script>
<title>회원가입</title>
</head>
<body>
<body>
	<div class="form">
		<form id="memberForm" name="memberForm" action="#"
			onsubmit="return checks();" method="post">
			<div class="form-group">

				<h3>회원가입</h3>

				<div class="form-floating mb-3">
					<input type="text" id="m_id" name="m_id" class="form-control"
						placeholder="아이디" aria-describedby="button-addon2" />
				    <label for="m_id">아이디</label>
				    <input type="hidden" name="resultAll" id="resultAll" value="N">
					<button type="button" id="m_idConfirm" name="m_idConfirm" class="btn btn-primary">아이디 중복체크</button>
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
					<input type="text" id="m_address" name="m_address" 	placeholder=" 도로명 주소" class="form-control">
					<label for="m_address"> 주소</label><br>
				</div>
				
				<span>약관</span>
				<div class="form-floating mb-3">
					<input type="radio" id="m_required1" name="m_required1" value="y" />약관동의
					<label for="m_required1" class="form-label mt-4"></label>
					<textarea class="form-control" rows="15"> 약관동의-puppy playtime  서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 puppy playtime 서비스의 이용과 관련하여 puppy playtime  서비스를 제공하는 puppy playtime
 주식회사(이하 ‘puppy playtime’)와 이를 이용하는 puppy playtime  서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 puppy playtime 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
- 이름, 생년월일, 성별, 아이디, 비밀번호, 별명, 연락처(메일주소, 휴대폰 번호 중 선택), 가입인증정보
만14세 미만 아동 회원가입
- 이름, 생년월일, 성별, 법정대리인 정보, 아이디, 비밀번호, 연락처 (메일주소, 휴대폰 번호 중 선택), 가입인증정보
단체아이디 회원가입
- 단체아이디, 회사명, 대표자명, 대표 전화번호, 대표 이메일 주소, 단체주소, 관리자 아이디, 관리자 연락처, 관리자 부서/직위
- 선택항목 : 대표 홈페이지, 대표 팩스번호
둘째, 서비스 이용과정이나 사업처리 과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다.
- IP Address, 쿠키, 방문 일시, 서비스 이용 기록, 불량 이용 기록
셋째, 네이버 아이디를 이용한 부가 서비스 및 맞춤식 서비스 이용 또는 이벤트 응모 과정에서 해당 서비스의 이용자에 한해서만
 개인정보 추가 수집이 발생할 수 있으며, 이러한 경우 별도의 동의를 받습니다. </textarea>
					
					<br> <input type="radio" id="m_required2" name="m_required2" value="y" />개인정보
					<label for="m_required2" class="form-label mt-4"></label>
					<textarea class="form-control" rows="15">개인 정보 수집 및 이용 동의 -개인정보보호법에 따라 puppy playtime 에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적,
						  개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부 시 불이익에 관한  사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.</textarea>
				</div>

				<div class="form-floating">
					선택 <input type="checkbox" id="m_optional" name="m_optional" />이메일
				</div>
				
				<div class="input-group mb-3">
					<input type="text" id="m_email" name="m_email" class="form-control"
						placeholder="이메일 입력" aria-describedby="button-addon2">
					<label 	for="m_email"></label>
					<button class="btn btn-primary" type="button" value="인증하기" name="mailCheckBtn"
						id="mailCheckBtn" class="btn btn-primary btn-sm">인증</button>
					<br>
				</div>
				<div class="input-group mb-3">
					<input type="text" id="m_emailNumber" class="form-control"
						name="m_emailNumber" placeholder="인증번호"
						aria-describedby="button-addon2">
					<button type="button" value="인증" id="m_emailNumber_box"
						class="btn btn-primary btn-sm">인증하기</button>
					<br>
				</div>
			</div>
			<br>
			<div class="form-group">
				<button type="button" class="btn btn-primary"
				onclick="checks()">회원가입</button>
			</div>
		</form>
	</div>
</body>
</html>