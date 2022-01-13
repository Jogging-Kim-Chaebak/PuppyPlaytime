<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>케이지 테이블 팝업</title>

<link rel="stylesheet" type="text/css" href="/resources/include/assets/css/common.css"/>
<link rel="stylesheet" type="text/css" href="/resources/include/assets/css/noticeList.css"/>
<script type="text/javascript"
src="/resources/include/assets/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" 
src="/resources/include/assets/js/common.js"></script>



<style type="text/css">
body { margin:0 }
input { margin:0; padding:0;border:0;display:inline}
textarea { margin:0; padding:0;border:0;display:inline}
</style>

<script type="text/javascript">

$(function(){
	
	/*목록 버튼 클릭 시 처리 이벤트*/
	$("#listBtn").click(function(){
		
		var goUrl=""; //이동할 경로를 저장할 변수
		
		goUrl = "/client/guide/guideList";
	
		$("#rForm").attr("action",goUrl);
		$("#rForm").submit();
		
		//location.href="/client/guide/guideList";
	});


$(function(){
	
	var file = "<c:out value='${roomData.c_picture}'/>";
	$("#fileImage").attr({
		src:"/roomPicture/${roomData.c_picture}",width:"450px",height:"200px"
	});
	
});

});
</script>
</head>
<body>
	<div>
		<form name="rForm" id ="rForm" method="post">
		<%-- <input type="hidden" name="c_no" value="${roomData.c_no}"/> --%>
		</form>
			<table border="1">
				<thead>
					<tr>
						<td colspan="4" align="center"><h4>룸 상세 정보</h4></td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th><span class ="required"></span>케이지 종류</th>
						<td><input type="text" id="c_kind" name="c_kind" value="${roomData.c_kind}" readonly="readonly"/></td>
						<th><span class ="required"></span>케이지 유형</th>
						<td><input type="text" id="c_type" name="c_type" value="${roomData.c_type}" readonly="readonly"/></td>
					</tr>

<%-- 					<tr>
						<th><span class ="required"></span>케이지 번호</th>
						<td colspan ="3"><input type="text" id="c_no" name="c_no" value="${roomData.c_no}" readonly="readonly"/></td>
					</tr> --%>
					<tr>
						<th><span class ="required"></span>가격</th>
						<td colspan ="3"><input type="text" id="c_price" name="c_price" value="${roomData.c_price}" readonly="readonly"/></td>
					</tr>
					<tr>
						<th><span class ="required"></span>케이지 설명</th>
						<td colspan ="3"><textarea cols="60" rows="10" id="c_explain" name="c_explain" readonly="readonly"><c:out value="${roomData.c_explain}"/></textarea></td>
					</tr>
					<tr>
						<th><span class ="required"></span>케이지 사진</th>
						
						<c:if test="${empty roomData.c_picture}">
							<td colspan="3" align="center">등록된 사진 정보가 존재하지 않습니다.</td>
						</c:if>
						<c:if test="${!empty roomData.c_picture}">
							<td colspan="3"><img src="/image/roomImages/${roomData.c_picture}" width="200px" height="200px"/></td>
						</c:if>
					</tr>
			
				</tbody>
			</table>
		
	</div>
	<div>
		<p></p>
		<table>
				<td><input type="button" value="목록" id ="listBtn"  /></td>
			</tr>
		</table>
	</div>
</body>
</html>