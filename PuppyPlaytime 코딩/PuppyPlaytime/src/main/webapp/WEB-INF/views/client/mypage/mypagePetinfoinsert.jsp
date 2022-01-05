<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫 등록 화면</title>
<style type="text/css">
table, td, th {
  table-layout: fixed;
  border-collapse : collapse;
  
}

th, td {
  text-align: center;
  vertical-align: middle;
  overflow:hidden;
  white-space : nowrap;
  text-overflow: ellipsis;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(function(){
		/* 등록하기 버튼 클릭 시 처리 이벤트 */
		$("#petInsertBtn").click(function(){

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
			
			$("#insertForm").attr({
				"method":"POST",
				"action":"/client/mypage/petInsert"
			});
			
			$("#insertForm").submit();
			
		});
			
 	/* 취소 버튼 클릭 시 처리 이벤트 */
	$("#petListBtn").click(function(){
		location.href="/client/mypage/petList";
	
	}); 
});
</script>
</head>
<body>

	<div class="contentContainer">
		<div style="width: 70%" align="center" class="form-group row">
		<div><br><br><h3>마이펫 등록</h3><br><br></div>
		<form id="insertForm" name="insertForm" enctype="multipart/form-data">
				<table class="table table-hover" border="1">
					
					<tr>
						<td width="10%" class="table-primary">이름</td>
						<td width="25%"><div align="left"><input type="text" name="p_name" id="p_name" class="col-sm-10"></div></td>
					</tr>
					<tr>
						<td width="20%" class="table-primary">견종</td>
						<td><div align="left"><input type="text" name="p_dogbreed" id="p_dogbreed" class="col-sm-10"></div></td>
					</tr>
					<tr>
						<td width="20%" class="table-primary">성별</td>
						<td><input type="radio" name="p_gender" id="p_gender" value="M" class="form-check-input">수컷&emsp;&emsp;&emsp;
						<input type="radio" name="p_gender" id="p_gender" value="F" class="form-check-input">암컷</td>
					</tr>
					<tr>
						<td width="20%" class="table-primary">체중</td>
						<td><input type="radio" name="p_weight" id="p_weight" value="small" class="form-check-input">소형(5kg미만)&emsp;
							<input type="radio" name="p_weight" id="p_weight" value="middle" class="form-check-input">중형(5kg이상 20kg미만)&emsp;
							<input type="radio" name="p_weight" id="p_weight" value="big" class="form-check-input">대형(20kg이상)
						</td>
					<tr>
						<td width="20%" class="table-primary">펫사진</td>
						<td><div align="left"><input type="file" name="file" id="file" class="form-control" class="col-sm-10"/></div></td>
					</tr>	
						
				
					<tr>
						<td width="20%" class="table-primary">특이사항</td>
						<td><textarea rows="10" cols="30" name="p_unique" id="p_unique" class="form-control"></textarea></td>
						
					</tr>											
				</table>
				<input type="hidden" id="p_picture" name="p_picture" value="${file}" />
				<input type="hidden" id="m_id" name="m_id" value="ghld12345" />
			</form>
		
		
		<!-- 등록하기, 취소 버튼 구현 시작 -->
		<div align="center" class="contentBtn">
			<input type="button" value="등록하기" class="btn btn-primary" id="petInsertBtn">
			<input type="button" value="취소" class="btn btn-primary" id="petListBtn">
		</div>
		<!-- 등록하기, 취소 버튼 구현 종료 -->
		</div>
	</div>
	
</body>
</html>