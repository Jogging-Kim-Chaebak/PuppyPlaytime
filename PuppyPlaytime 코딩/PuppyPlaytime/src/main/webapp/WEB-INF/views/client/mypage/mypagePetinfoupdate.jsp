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
			var name = document.getElementById("p_name"); //이름
			var dogbreed = document.getElementById("p_dogbreed"); //견종
			
			if (name.value == '') {
				alert("이름을 입력해야 합니다.");
				return false;
			}
			
			if (dogbreed.value == '') {
				alert("견종을 입력해야 합니다.");
				return false;
			}
			
			if ( ! $('input[name=p_gender]:checked').val()) {
				alert('성별을 선택해주세요.');
				return false;
			}
			
			if ( ! $('input[name=p_weight]:checked').val()) {
				alert('체중을 선택해주세요.');
				return false;
			}
			
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
		<div class="contentTit"><br><br><h3>펫정보 수정하기</h3><br></div>
		
		<div align="center" class="form-group row">
			
				<input type="hidden" id="p_no" name="p_no" value="${updateData.p_no}" />
				<input type="hidden" id="p_picture" name="p_picture" value="${updateData.file}" />
				
				
			<table style="width: 70%" class="table table-hover" border="1">
					
					<tr>
						<td width="15%" class="table-primary">이름</td>
						<td width="50%"><input type="text" name="p_name" id="p_name" value="${updateData.p_name}" class="form-control"></td>
						<td width="35%" rowspan="4"><img src="/image/petImages/${updateData.p_picture}" width="100%" height="100%" class="img-thumbnail"/></td>
					</tr>
					<tr>
						<td class="table-primary">견종</td>
						<td><input type="text" name="p_dogbreed" id="p_dogbreed" value="${updateData.p_dogbreed}" class="form-control"></td>
					</tr>
					<tr>
						<td class="table-primary">성별</td>
						<td><input type="radio" name="p_gender" id="p_gender" value="M" class="form-check-input">수컷
						<input type="radio" name="p_gender" id="p_gender" value="F" class="form-check-input">암컷</td>
					</tr>
					<tr>
						<td class="table-primary">체중</td>
						<td><input type="radio" name="p_weight" id="p_weight" value="small" class="form-check-input">소형(5kg미만)
							<input type="radio" name="p_weight" id="p_weight" value="middle" class="form-check-input">중형(5kg이상 20kg미만)
							<input type="radio" name="p_weight" id="p_weight" value="big" class="form-check-input">대형(20kg이상)
						</td>
						
						
					</tr>
					<tr>
						<td class="table-primary">특이사항</td>
						<td><textarea rows="10" cols="10" class="form-control" name="p_unique" id="p_unique"></textarea></td>
						<td><input type="file" name="file" id="file"></td>
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