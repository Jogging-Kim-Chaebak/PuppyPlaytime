<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Login</title>
<!-- 모바일 웹 페이지 설정 끝 -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- Bootstrap core CSS -->
<link href="/resources/include/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/resources/include/dist/css/sticky-footer-navbar.css"
	rel="stylesheet">

<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript" src="/resources/include/js/login.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
   //로그인 버튼 클릭시
     function login(){
        var form = document.form1;
        var special = "~!@#$%^&*( )_=+|\\{}[];:\‘\“<>,?/"; // 특수문자 일람
        var bool = false; // Boolean 초기값

          /*
          if (bool) {
             alert("특수문자는 ID에 사용할 수 없습니다");
          } 
        //아이디에서 입력 필수 조건문
        if (form.m_id.value == ""){
             alert("아이디를 입력해야 합니다.");
             form.m_id.focus();//id박스로 이동.
             return;
            }

         //아이디 입력 문자수를 8~15자로 제한하는 조건문
         if (form.m_id.value.length < 8 || form.m_id.value.length > 15){
              alert("아이디는 8~15자 이내로 입력 가능합니다.");
              form.m_id.select();//입력한 문자를 선택 상태로 만듬.
              return;
           }

           
          //패스워드 검사
            if (form.m_pw.value == ""){
                 alert("패스워드를 입력 해야 합니다.");
                 form.m_pw.focus();//포커스를 Password박스로 이동.
                 return;
            }
            if (form.m_pw.value.length < 8 || form.m_pw.value.length > 15)
            {
                 alert("비밀번호는 8~15 이내로 입력 가능 합니다.");

                 form.m_pw.select();
                 return;
            }
		*/
   form.submit();
   }
</script>
</head>
<body>
	<form name="form1" action="/client/login/login" method="post">
		<div class="form-group">
			<label class="form-label mt-4">로그인</label>
			<div class="form-floating mb-3">
				<input type="text" class="form-control" id="m_id" name="m_id"
					placeholder="아이디"> <label for="m_id">아이디</label>
			</div>
			<div class="form-floating">
				<input type="password" class="form-control" id="m_pw" name="m_pw"
					placeholder="Password"> <label for="m_pw">패스워드</label><br>
				<button type="button" class="btn btn-primary" onclick="login()">로그인</button>
			</div>
		</div>
	</form>
	<br>

	<div class="form-group">
		<button type="button" class="btn btn-primary"
			onclick="location.href='http://localhost:8080/client/member/joinForm' ">회원가입</button>
		<button type="button" class="btn btn-primary"onclick="location.href='http://localhost:8080/client/login/find_id' ">아이디 찾기</button>
		<button type="button" class="btn btn-primary">비밀번호 찾기</button>
	</div>

</body>
</html>