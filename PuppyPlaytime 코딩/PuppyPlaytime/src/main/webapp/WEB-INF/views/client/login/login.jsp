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
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript" src="/resources/include/js/login.js"></script>
<script type="text/javascript">
	//아이디와 패스워드 정규식
	  function login(){
        var form = document.form1;
        var special = "~!@#$%^&*( )_=+|\\{}[];:\‘\“<>,?/"; // 특수문자 일람
       	var str = prompt("ID를 입력 하세요", "language"); // 사용자가 입력한 ID
       	var bool = false; // Boolean 초기값

       	for (i = 0; i < str.length; i++) {
       		var c = str.charAt(i); // c는 ID중에서 index가 i인 문자
       		if (special.search(c) >= 0) { // 특수문자 중에 c가 있으면 true
       			bool = true;
       			break;
       		}
       	}
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
              alert("아이디는 8~15자 이내로 입력 가능합니다!");
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
                 alert("비밀번호는 8~15 이내로 입력 가능 합니다!");

                 form.m_pw.select();
                 return;
            }

   form.submit();
   }
</script>
</head>
<body>

	<form name="f1" method="post"></form>
	<form name="form1" action="#" method="post">
		<div>로그인</div>
		<br /> <label> 아이디 </label><br /> <input type="text" name="m_id"
			id="m_id" /><br /> 
			<label> 패스워드 </label><br /> 
			<input type="password" name="m_pw" id="m_pw" /><br />
			 <br /> <input type="button" value="로그인 " name="m_login" id="m_login"  onclick="login()" />
	</form>
	<div class="form-group">
		<a href="joinBtn">회원가입</a> <a href="findId">아이디 찾기</a> <a
			href="findPw">비밀번호 찾기</a>
	</div>

</body>
</html>