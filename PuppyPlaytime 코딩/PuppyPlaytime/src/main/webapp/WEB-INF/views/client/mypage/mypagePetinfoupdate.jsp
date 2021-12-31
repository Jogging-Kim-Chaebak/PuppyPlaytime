<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫 수정하기</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(function(){
		/* 수정 버튼 클릭 시 처리 이벤트 */
		$("#petUpdateBtn").click(function(){
			alert("수정버튼클릭");
			
			var checked_radio=$('input:radio[name=p_gender]:checked').val();
			var checked_radio=$('input:radio[name=p_weight]:checked').val();
			$("#f_writeForm").attr({
				"method":"POST",
				"action":"/client/mypage/petUpdate"
			});
			$("#f_writeForm").submit();
		});
		
		/* 목록 버튼 클릭 시 처리 이벤트 */
		$("#petListBtn").click(function(){
			location.href="/client/mypage/petList";
		});
	});
</script>
</head>
<body>
<form id="f_writeForm" name="f_writeForm" enctype="multipart/form-data">
	<div class="contentContainer">
		<div class="contentTit"><h3>펫정보 수정하기</h3></div>
		
		<div class="contentTB">
			
				<input type="hidden" id="p_no" name="p_no" value="${updateData.p_no}" />
				<input type="hidden" id="p_picture" name="p_picture" value="${updateData.file}" />
				
				
			<table border="1">
					
					<tr>
						<td>이름</td>
						<td><input type="text" name="p_name" id="p_name" value="${updateData.p_name}"></td>
						<td rowspan="3"><td><img src="/image/petImages/${updateData.p_picture}"/></td>
					</tr>
					<tr>
						<td>견종</td>
						<td><input type="text" name="p_dogbreed" id="p_dogbreed" value="${updateData.p_dogbreed}"></td>
					</tr>
					<tr>
						<td>성별</td>
						<td><input type="radio" name="p_gender" id="p_gender" value="M">수컷
						<input type="radio" name="p_gender" id="p_gender" value="F">암컷</td>
					</tr>
					<tr>
						<td>체중</td>
						<td><input type="radio" name="p_weight" id="p_weight" value="S">소형(5kg미만)
							<input type="radio" name="p_weight" id="p_weight" value="M">중형(5kg이상 20kg미만)
							<input type="radio" name="p_weight" id="p_weight" value="L">대형(20kg이상)
						</td>
						
						<td><input type="file" name="file" id="file"></td>
					</tr>
					<tr>
						<td>특이사항</td>
						<td><input type="text" name="p_unique" id="p_unique"></td>
					</tr>
					
				</table>
		
		</div>
		<div class="contentBtn">
			<input type="button" value="수정" id="petUpdateBtn">
			<input type="button" value="목록" id="petListBtn">
		</div>
	</div>
	</form>
</body>
</html>