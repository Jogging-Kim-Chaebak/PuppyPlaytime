<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<style type="text/css">
.form {
	width: 800px;
	padding: 20px;
	margin-left: auto;
	border: 1px solid #d9230f;
	text-align: center;
	margin-right: auto;
	margin-top:65px;
	margin-bottom: 10px;
}
</style>
<!-- 모바일 웹 페이지 설정 끝 -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>

<script type="text/javascript">
	function pwFind() {
		//유효성
		var form = document.findPw;
		var checkEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/; //Email 유효성 검사 정규식
		var checkID = /^[a-zA-Z0-9]{8,20}$/; //아이디 유효성 검사 정규식
		//값 불러오기
		var userEmail = document.getElementById("m_email"); //이메일
		var userID = document.getElementById("m_id"); //아이디

		if (form.m_id.value == "") {
			alert("아이디를 입력하세요.");
			form.m_id.focus();//이메일 박스로 이동.
			return;
		}
		if (!checkID.test(userID.value)) {
			alert("아이디는 8~20자 이내로 입력 가능합니다.");
			return;

		}
		if (form.m_email.value == "") {
			alert("이메일을 입력하세요.");
			form.m_email.focus();//이메일 박스로 이동.
			return;
		}
		if (!checkEmail.test(userEmail.value)) {
			alert("이메일 ---@---.com 형식으로 입력 가능합니다.");
			return;

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
		}else {
			$.ajax({
				url : "/client/login/find_pw",
				type : "GET",
				data : {
					"m_id" : $("#m_id").val(),
					"m_email" : $("#m_email").val()
				},
				datatype : "text",
				success : function(resultData) {
					if (resultData == "ok") {//해당되는 아이디와 이메일이 없을 경우 
						alert("해당되는 아이디와 이메일이 없습니다.");
						$("#m_id").val("");
						$("#m_email").val("");
						$("#m_id").focus();//아이디 박스로 이동
						$("#m_email").focus();//이메일 박스로 이동
					} else {
						alert("아이디와 이메일이 맞습니다.");
						$('#findPw').attr('disabled', false);
						window.open("", "pop",//""으로 get으로!
						"width=700, height=400");
						$("#findPw").attr("action", "/client/login/pw_popup");
						$("#findPw").attr("target", "pop");
						$("#findPw").submit();//get 으로 전송하고 post로!

					}
				},
				error : function() {
					alert('에러입니다.')
				}
			});
		}

	}
	
	$(document).ready(function() {
		var code = "a";                //이메일전송 인증번호 저장위한 코드
		
	/* 인증번호 이메일 전송 */
	$("#mailCheckBtn").on("click",function(){
		 var id = $("#m_id").val();        	// 입력한 아이디
		 var email = $("#m_email").val();	// 입력한 이메일
		 var checkBox = $("#m_emailNumber");        // 인증번호 입력란
		 
		 $.ajax({
		        type:"GET",
		        url:"mailCheck?id=" + id + "&email=" + email,
		        success:function(data){
		        	// 아이디와 이메일이 동일한지 체크
		        	if(data === "Not equal"){
		        		alert("아이디에 등록된 이메일이 아닙니다.");
		        		return;
		        	}else{
		        		alert("인증번호를 보냈습니다.");
			        	$("#mailCheckBtn").val("true");
			        	checkBox.attr("disabled",false);
			        	code=data;
		        	}
		        }       
		    });
		});
			
		/* 인증번호 비교 */
		$("#m_emailNumber_box").on("click",function(){
		
	    	var inputCode = $("#m_emailNumber").val();        // 입력코드    
	    	var checkResult = $("#mailCheckBtn");             // 비교 결과     
	    
	    	if(inputCode == code){                               // 일치할 경우
	        	alert("인증번호가 일치합니다.");
	        	$("#m_emailNumber_box").val("true");
				$("#updatePw").attr("disabled",false);
				
	    	} else {                                             // 일치하지 않을 경우
	    	 	alert("인증번호를 다시 확인해주세요.");
	 		 	//$("#mailCheckBtn").val("false");
	 			
	    	} 
	    
	    
		});
	});
</script>
</head>
	<body>
		<div class="form">
			<form name="findPw" id="findPw" action="/client/login/pw_popup">
				<div class="form-group">
					<label class="form-label mt-4"><h2>비밀번호 찾기</h2></label>
					<div class="col">
						<label for="m_id">아이디</label>
						<input type="text" class="form-control" id="m_id" name="m_id" placeholder="아이디"> <br>
					</div>
					<label for="m_email">이메일</label>
					<div class="m_emailNumber_box_warn">
						<div class="input-group mb-3">							
							<input type="text" id="m_email" name="m_email" placeholder="이메일" class="form-control" aria-describedby="button-addon2">
							<button type="button" value="인증하기" name="mailCheckBtn" id="mailCheckBtn" class="btn btn-primary btn-sm">인증하기</button>
							<br>
						</div>
						<div class="input-group mb-3">
							<input type="text" id="m_emailNumber" class="form-control" 	name="m_emailNumber" placeholder="인증번호"
							aria-describedby="button-addon2">
							<button type="button" value="인증" id="m_emailNumber_box" name="m_emailNumber_box" class="btn btn-primary btn-sm">인증</button>
							<br>
						</div>
					</div>
				
					<div class="form-group">
						<button type="button" value="찾기" onclick="pwFind()" id="updatePw"
						 class="btn btn-primary mb-2">비밀번호 변경</button>
						 <button type="button" class="btn btn-primary mb-2"
							onclick="location.href='/client/login/login'">돌아가기</button>
						<button type="button" class="btn btn-primary mb-2"
							onclick="location.href='/client/login/find_pw'">다시입력</button>
					</div>
				</div>
			</form>
			<br>
			
		</div>
	</body>
</html>