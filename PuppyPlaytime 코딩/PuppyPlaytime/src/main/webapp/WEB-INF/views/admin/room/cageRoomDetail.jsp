<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>케이지 테이블 팝업</title>

<style type="text/css">
body { margin:0 }
input { margin:0; padding:0;border:0;display:inline}
textarea { margin:0; padding:0;border:0;display:inline}
</style>

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	
$(function(){
	var file = "<c:out value='${cageRoomVO.c_picture}'/>";
	$("#fileImage").attr({
		src:"/roomPicture/${cageRoomVO.c_picture}",width:"450px",height:"200px"
	});
	
	/* if(file!=""){
		$("#fileImage").attr({
			src:"${AdminRoomVO.c_picture}",width:"450px",height:"200px"
		});
	} */
	
	$("#updateData").click(function(){
		if(confirm('케이지 비활성화를 진행할까요?')){
			$("#roomForm").attr("action","/admin/room/roomDisabled");
			$("#roomForm").submit();
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
		<form id ="roomForm" name="roomForm" method="post">
			<table border="1">
				<thead>
					<tr>
						<td colspan="4" align="center"><h4>룸 상세 정보</h4></td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th><span class ="required"></span>케이지 종류</th>
						<td><input type="text" id="c_kind" name="c_kind" value="${cageRoomVO.c_kind}" readonly="readonly"/></td>
						<th><span class ="required"></span>케이지 유형</th>
						<td><input type="text" id="c_type" name="c_type" value="${cageRoomVO.c_type}" readonly="readonly"/></td>
					</tr>

					<tr>
						<th><span class ="required"></span>케이지 번호</th>
						<td colspan ="3"><input type="text" id="c_no" name="c_no" value="${cageRoomVO.c_no}" readonly="readonly"/></td>
					</tr>
					<tr>
						<th><span class ="required"></span>가격</th>
						<td colspan ="3"><input type="text" id="c_price" name="c_price" value="${cageRoomVO.c_price}" readonly="readonly"/></td>
					</tr>
					<tr>
						<th><span class ="required"></span>사용현황</th>
						<td colspan ="3"><input type="text" id="c_usestatus" name="c_usestatus" value="${cageRoomVO.c_usestatus}" readonly="readonly"/></td>
					</tr>
					<tr>
						<th><span class ="required"></span>케이지 설명</th>
						<td colspan ="3"><textarea cols="60" rows="10" id="c_explain" name="c_explain" readonly="readonly"><c:out value="${cageRoomVO.c_explain}"/></textarea></td>
					</tr>
					<tr>
						<th><span class ="required"></span>케이지 사진</th>
						
						<c:if test="${empty cageRoomVO.c_picture}">
									<td colspan="3" align="center">등록된 사진 정보가 존재하지 않습니다.</td>
							</c:if>
									<td colspan="3"><img src="/image/roomImages/${cageRoomVO.c_picture}"/></td>
						
					</tr>
					
					<tr>
						<th><span class ="required"></span>부가서비스</th>
							<c:if test="${empty extraServiceList}">
									<td colspan="3" align="center">등록된 부가서비스 정보가 존재하지 않습니다.</td>
							</c:if>
							<c:if test="${!empty extraServiceList}">
							<td>
								<c:forEach items="${extraServiceList}" var="ex">
									<input type="text" id="s_name" name="s_name" value="${ex.s_name} " readonly="readonly"/>
								</c:forEach>
							</td> 
							</c:if>
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