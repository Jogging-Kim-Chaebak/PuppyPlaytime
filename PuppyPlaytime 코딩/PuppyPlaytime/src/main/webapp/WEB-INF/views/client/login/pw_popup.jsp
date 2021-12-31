<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경 팝업</title>
<!-- 모바일 웹 페이지 설정 끝 -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>

<script type="text/javascript">
	function pwUpdate() {
		//유효성
		var form = document.updatePw;
		var p_RegExp = /^.*(?=^.{8,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/; //비밀번호 유효성 검사 정규식
		//값 불러오기
		var userPass = document.getElementById("m_pw"); //비밀번호

		if (form.m_pw.value == "") {
			alert("비밀번호를 입력하세요.");
			form.m_pw.focus();//비밀번호 박스로 이동.
			return;
		}
		if (!p_RegExp.test(userPass.value)) {
			alert("비밀번호 영문/숫자/특수문자 포함 8~20자 입력 가능합니다.");
			return;

		} else {
			$.ajax({
				url : "/client/login/pw_popup", //전송 url
				type : "POST",//전송 method빙식
				data : {
					"m_id" : $("#m_id").val(),
					"m_pw" : $("#m_pw").val()
				},
				datatype : "text",
				success : function(resultData) {
					alert("변경하시겠습니까?");
					$("#m_pw").attr("readOnly", "readOnly");
					$('#updatePw').attr('disabled', false);
					window.close();
					$("#updatePw").submit();
					

				},
				error : function() {
					alert('시스템 오류입니다.');
				}
			});
		}
	}
</script>
</head>
<body>
	<div>
		<form id="updatePw" name="updatePw" method="post">


			<div class="form-group">
			<input type="hidden" id="m_id" name="m_id" value="${m_id}">
				<label class="form-label mt-4">비밀번호 수정 팝업창</label>
				<div class="form-floating mb-3">
					<input type="password" class="form-control" id="m_pw" name="m_pw"
						placeholder="비밀번호를 입력해주세요"><label for="m_pw">비밀번호</label><br>
				</div>

			</div>
		</form>
		<button type="button" value="수정" onclick="pwUpdate()" id="updateData"
			class="col-sm-2 control-label">수정</button>
		<button type="button" value="닫기"
			onclick="window.close();"
			class="col-sm-2 control-label">닫기</button>

	</div>
</body>
</html>