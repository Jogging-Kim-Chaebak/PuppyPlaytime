<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>취소사유 전송</title>

<style type="text/css">
body { margin:0 }
input,textarea,select { margin:0; padding:0;border:0;display:inline}
</style>

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	
$(function(){
		$("#insertData").click(function(){
			var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			var emailVal = $("#to").val();
			
			if($("#subject").val().replace(/\s/g,"")==""){
				alert('제목을 입력해주세요.');
				return false;
			}
			if($("#content").val().replace(/\s/g,"")==""){
				alert('내용을 입력해주세요.');
				return false;
			}
			
			if(emailVal.match(regExp) != null){
				alert('전송');
			}else{
				alert('받는사람 이메일을 형식에 맞게 입력해주세요.');
				return false;	
			}
			
			$("#mailForm").attr({
				"method":"POST",
				"action":"/admin/reservation/sendMail"
			});

			$("#mailForm").submit();
		});
	});
	
	
	
</script>
</head>
<body>
	<div>
		<form id ="mailForm" name="mailForm">
			<table class="table table-dark table-striped">
				<thead>
					<tr>
						<td colspan="4" align="center"><h4><input type="text" id="subject" name="subject"/></h4></td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th><span class ="required">*</span>받는사람 이메일</th>
						<td colspan ="3"><input type="text" id="to" name="to"/></td>
					</tr>
					<tr>
						<th><span class ="required">*</span>취소 사유</th>
						<td colspan ="3"><textarea cols="60" rows="10" id="content" name="content"></textarea></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<div>
		<p></p>
		<table>
			<tr align ="center">
				<td><input type="button" id ="insertData" value="전송"/></td>
			</tr>
		</table>
	</div>
</body>
</html>