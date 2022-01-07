<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서비스 상세</title>

<style type="text/css">
body { margin:0 }
input { margin:0; padding:0;border:0;display:inline}
textarea { margin:0; padding:0;border:0;display:inline}
</style>

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	
$(function(){
	$("#updateData").click(function(){
		if(confirm('서비스 비활성화를 진행할까요?')){
			$("#serviceForm").attr("action","/admin/extraService/extraServiceDisabled");
			$("#serviceForm").submit();
		}
	});
	$("#closeWindow").click(function(){
		window.history.back();
	});
});

</script>
</head>
<body>
	<div>
		<form id ="serviceForm" name="serviceForm" method="post">
			<table class="table table-dark table-striped">
				<thead>
					<tr>
						<td colspan="4" align="center"><h4>서비스 상세 정보</h4></td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th><span class ="required"></span>서비스 명</th>
						<td><input type="text" id="s_name" name="s_name" value="${ExtraServiceVO.s_name}" readonly="readonly"/></td>
					</tr>
					<tr>
						<th><span class ="required"></span>서비스 번호</th>
						<td><input type="text" id="s_no" name="s_no" value="${ExtraServiceVO.s_no}" readonly="readonly"/></td>
					</tr>
					<tr>
						<th><span class ="required"></span>가격</th>
						<td colspan ="3"><input type="text" id="s_price" name="s_price" value="${ExtraServiceVO.s_price}" readonly="readonly"/></td>
					</tr>
					<tr>
						<th><span class ="required"></span>케이지 설명</th>
						<td colspan ="3"><textarea cols="60" rows="10" id="s_explain" name="s_explain" readonly="readonly"><c:out value="${ExtraServiceVO.s_explain}"/></textarea></td>
					</tr>
					
				</tbody>
			</table>
		</form>
	</div>
	<div>
		<p></p>
		<table>
			<tr align ="center">
				<td><input type="button" id ="updateData" value="비활성" /></td>
				<td><input type="button" id ="closeWindow" value="취소" /></td>
			</tr>
		</table>
	</div>
</body>
</html>