<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
$(function(){
	
	/* 등록 버튼 클릭 시 처리 이벤트 
	$("#insertFormBtn").click(function(){
		location.href="/mypage/insertForm.do";
	});*/
</script>
		

</head>
<body>
	<div>
		<form name="abc">
		<table>
			<tr>
				<td></td>
				<td>이름</td>
				<td>전화번호</td>
			</tr>
			<tr>
				<td></td>
				<td>이름</td>
				<td>전화번호</td>
			</tr>
		</table>	
		</form>
	</div>
</body>
</html>