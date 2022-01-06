<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서비스 등록</title>

<style type="text/css">
body { margin:0 }
input,textarea,select { margin:0; padding:0;border:0;display:inline}
</style>

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	
	$(function(){
		$("#insertData").click(function(){
			if($("#s_no").val()==""){
				$("#s_no").val(0);
			}
			
			if($("#s_status").val()==""){
				$("#s_status").val("use");
			}
			if($("#s_name").val().length > 9){
				alert('서비스 명을 8자 이하로 작성해주십시오.');
				return false;
			}
			if($("#s_name").val().replace(/\s/g,"")==""){
				alert('서비스 명을 입력해주세요.');
				return false;
			}
			
			if($("#s_price").val().replace(/[^0-9]/g,"")==""){
				alert('서비스 가격을 입력해주세요.');
				return false;
			}
			if($("#s_explain").val().replace(/\s/g,"")==""){
				alert('서비스 설명을 입력해주세요.');
				return false;
			}
			
			$("#serviceForm").attr({
				"method":"POST",
				"action":"/admin/extraService/extraServiceAdd"
			});

			$("#serviceForm").submit();
		});
		
		$("#closeWindow").click(function(){
			window.history.back();
		});
	});
	
	
	
</script>
</head>
<body>
	<div>
		<form id ="serviceForm" name="serviceForm">
			<table border="1">
				<thead>
					<tr>
						<td colspan="4" align="center"><h4>부가서비스 등록</h4></td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th><span class ="required">*</span>서비스 명</th>
						<td colspan ="3"><input type="text" id="s_name" name="s_name"/></td>
					</tr>
					<tr>
						<th><span class ="required">*</span>서비스 번호</th>
						<td colspan ="3"><input type="text" id="s_no" name="s_no" disabled="disabled"/></td>
					</tr>
					<tr>
						<th><span class ="required">*</span>가격</th>
						<td colspan ="3"><input type="text" id="s_price" name="s_price"/></td>
					</tr>
					<tr>
						<th><span class ="required">*</span>서비스 설명</th>
						<td colspan ="3"><textarea cols="60" rows="10" id="s_explain" name="s_explain"></textarea></td>
					</tr>
				</tbody>
			</table>
			<input type="hidden" id="s_status" name="s_status" />
		</form>
	</div>
	<div>
		<p></p>
		<table>
			<tr align ="center">
				<td><input type="button" id ="insertData" value="등록"/></td>
				<td><input type="button" id ="closeWindow" value="취소" /></td>
			</tr>
		</table>
	</div>
</body>
</html>