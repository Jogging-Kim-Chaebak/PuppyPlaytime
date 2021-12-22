<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫 상세 화면</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
	$(function(){
		
		/* 목록 버튼 클릭 시 처리 이벤트 */
		$("#petListBtn").click(function(){
			alert("목록");
			location.href="/client/mypage/petList";
		});
		
		/* 수정 버튼 클릭 시 처리 이벤트 */
		$("#updateFormBtn").click(function(){
			alert("수정");
			goUrl="/client/mypage/updateForm";
			$("#f_data").attr("action",goUrl);
			$("#f_data").submit();
			
		}); 
		
		/* 삭제 버튼 클릭 시 처리 이벤트 */
		$("#petDeleteBtn").click(function(){
			alert("삭제");
			goUrl="/client/mypage/petDelete";
			$("#f_data").attr("action",goUrl);
			$("#f_data").submit();
		});
		
	/*	//첨부파일 이미지 보여주기 위한 속성 추가
		var file="<c:out value='${detail.p_picture}'/>";
		alert(file);
		if(file!=""){
			$("#fileImage").attr({
				src:"/petImages/${detail.p_picture}"
			});
		}*/
	});
	
</script>

</head>
<body>
	<div class="contentContainer">
		<div class="contentTit"><h3>펫정보 상세보기</h3></div>
		<form name="f_data" id="f_data" method="post">
			<input type="hidden" name="p_no" value="${detail.p_no}" />
		</form>
		<!-- 버튼추가 시작 -->
		<input type="button" value="수정" id="updateFormBtn">
		<input type="button" value="삭제" id="petDeleteBtn">
		<input type="button" value="목록" id="petListBtn">
		<!-- 버튼추가 종료 -->
		
		<!-- 상세정보 보여주기 시작 -->
		<div class="contentTB">
			<table border="1">
					
					<tr>
						<td>이름</td>
						<td><input type="text" name="p_name" id="p_name" value="${detail.p_name}"></td>
						<td rowspan="3"><img src="/image/petImages/${detail.p_picture}"/></td>
					</tr>
					<tr>
						<td>견종</td>
						<td><input type="text" name="p_dogbreed" id="p_dogbreed" value="${detail.p_dogbreed}"></td>
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
						<td><input type="file" name="p_picture" id="p_picture">
						
							
					</tr>
					<tr>
						<td>특이사항</td>
						<td><input type="text" name="p_unique" id="p_unique"></td>
					</tr>
					
				</table>
		</div>
		<!-- 상세정보 보여주기 종료 -->
	</div>
</body>
</html>