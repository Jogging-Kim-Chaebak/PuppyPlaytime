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
	text-align: left;
	margin-right: auto;
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
			alert("아이디 형식으로 입력 가능합니다.");
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

		} else {
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
</script>
</head>
<body>
	<div class="form">
		<form name="findPw" id="findPw" action="/client/login/pw_popup">
			<div class="row">
				<label class="form-label mt-4">비밀번호 찾기</label>
				<div class="col">
				<label for="m_id">아이디</label>
					<input type="text" class="form-control" id="m_id" name="m_id"
						placeholder="아이디"> 
				
				
				 <label for="m_email">이메일</label>
					<input type="text" class="form-control" id="m_email" name="m_email"
						placeholder="이메일">
				</div>
				
				<div class="col">
					<button type="button" value="찾기" onclick="pwFind()" id="updatePw"
						 class="btn btn-primary mb-2">비밀번호 변경</button>
				</div>
			</div>
		</form>
		<br>
		<button type="button" class="btn btn-primary"
			onclick="location.href='http://localhost:8080/client/login/login'">돌아가기</button>
		<button type="button" class="btn btn-primary"
			onclick="location.href='http://localhost:8080/client/login/find_pw'">다시입력</button>
	</div>
</body>
</html>