<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫 등록 화면</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(function(){
		/* 등록하기 버튼 클릭 시 처리 이벤트 */
		$("#petInsertBtn").click(function(){
			alert("등록");
			$("#insertForm").attr({
				"method":"POST",
				"action":"/client/mypage/petInsert"
			});
			
			$("#insertForm").submit();
			
		});
			
 	/* 취소 버튼 클릭 시 처리 이벤트 */
	$("#petListBtn").click(function(){
		location.href="/mypage/petList";
	
	}); 
});
</script>
</head>
<body>

	<div class="contentContainer">
		<div class="contentTB">
		<form id="insertForm" name="insertForm" enctype="multipart/form-data">
				<table border="1">
					
					<tr>
						<td>이름</td>
						<td><input type="text" name="p_name" id="p_name"></td>
						<td rowspan="3"></td>
					</tr>
					<tr>
						<td>견종</td>
						<td><input type="text" name="p_dogbreed" id="p_dogbreed"></td>
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
						<td><input type="file" name="file" id="file" /></td>
						
					</tr>
					<tr>
						<td>특이사항</td>
						<td><input type="text" name="p_unique" id="p_unique"></td>
					</tr>
											
				</table>
				<input type="hidden" id="p_picture" name="p_picture" value="${file}" />
				<input type="hidden" id="m_id" name="m_id" value="ghld12345" />
			</form>
		</div>
		
		<!-- 등록하기, 취소 버튼 구현 시작 -->
		<div class="contentBtn">
			<input type="button" value="등록하기" class="but" id="petInsertBtn">
			<input type="button" value="취소" class="but" id="petListBtn">
		</div>
		<!-- 등록하기, 취소 버튼 구현 종료 -->
		
	</div>
	
</body>
</html>