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
<style type="text/css">
table{
	
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
	$(function(){
		
		/* 목록 버튼 클릭 시 처리 이벤트 */
		$("#petListBtn").click(function(){
			
			location.href="/client/mypage/petList";
		});
		
		/* 수정 버튼 클릭 시 처리 이벤트 */
		$("#updateFormBtn").click(function(){
			
			goUrl="/client/mypage/updateForm";
			$("#f_data").attr("action",goUrl);
			$("#f_data").submit();
			
		}); 
		
		/* 삭제 버튼 클릭 시 처리 이벤트 */
		$("#petDeleteBtn").click(function(){
			alert("삭제되었습니다.");
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
	<div class="contentContainer" align="center" style="width: 60%">
		<div align="center" class="contentTit"><br><br><h3>펫정보 상세보기</h3><br><br></div>
		<form name="f_data" id="f_data" method="post">
			<input type="hidden" name="p_no" value="${detail.p_no}" />
		</form>
		<!-- 버튼추가 시작 -->
		<div align="right">
		<input type="button" value="편집" id="updateFormBtn" class="btn btn-primary">
		<input type="button" value="삭제" id="petDeleteBtn" class="btn btn-primary">
		<input type="button" value="목록" id="petListBtn" class="btn btn-primary">
		</div>
		<!-- 버튼추가 종료 -->
		
		<!-- 상세정보 보여주기 시작 -->
		<div class="contentTB" align="center">
			<table  class="table table-hover" border="1">
					<tr>
						<td align="center" class="table-primary">이름</td>
						<td><input type="text" name="p_name" id="p_name" readonly style="background-color: #e2e2e2;" value="${detail.p_name}" class="form-control"></td>
						<td width="40%" rowspan="4"><div style="height: 100%"><img src="/image/petImages/${detail.p_picture}" width="100%" height="100%" align="middle" class="img-thumbnail"/></div></td>
					</tr>
					<tr>
						<td align="center" class="table-primary">견종</td>
						<td><input type="text" name="p_dogbreed" id="p_dogbreed" style="background-color: #e2e2e2;" readonly value="${detail.p_dogbreed}" class="form-control"></td>
					</tr>
					<tr>
						<td align="center" class="table-primary">성별</td>
						<td><c:set var="name" value="${detail.p_gender}" />
								<c:choose> 
								    <c:when test="${name eq 'M'}">
								        <a><input type="text" name="p_gender" id="p_gender" style="background-color: #e2e2e2;" readonly value="수컷" class="form-control"></a>
								    </c:when>
								    <c:when test="${name eq 'F'}">
								        <a><input type="text" name="p_gender" id="p_gender" style="background-color: #e2e2e2;" readonly value="암컷" class="form-control"></a>
								    </c:when>
								</c:choose>
						</td>
					</tr>
					<tr>
						<td align="center" class="table-primary">체중</td>
						<td><c:set var="name" value="${detail.p_weight}" />
								<c:choose> 
								    <c:when test="${name eq 'small'}">
								        <a><input type="text" name="p_weight" id="p_weight" style="background-color: #e2e2e2;" readonly value="소형견" class="form-control"></a>
								    </c:when>
								    <c:when test="${name eq 'middle'}">
								        <a><input type="text" name="p_weight" id="p_weight" style="background-color: #e2e2e2;" readonly value="중형견" class="form-control"></a>
								    </c:when>
								     <c:when test="${name eq 'big'}">
								        <a><input type="text" name="p_weight" id="p_weight" style="background-color: #e2e2e2;" readonly value="대형견" class="form-control"></a>
								    </c:when>
								</c:choose>
						</td>
						
							
					</tr>
					<tr>
						<td align="center" class="table-primary">특이사항</td>
						<td><textarea id="p_unique" name="p_unique" rows="10" cols="20" class="form-control" readonly>${detail.p_unique}</textarea></td>
						<td>
							<input type="file" name="p_picture" id="p_picture" style="background-color: #e2e2e2;" readonly class="form-control">
						</td>
					</tr>
					
				</table>
		</div>
		<!-- 상세정보 보여주기 종료 -->
	</div>
</body>
</html>