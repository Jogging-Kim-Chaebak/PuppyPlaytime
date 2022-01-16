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

<script type="text/javascript"
src="/resources/include/assets/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" 
src="/resources/include/assets/js/common.js"></script>



<style type="text/css">
.contentContainer{ text-align:center; margin-top:30px; margin-bottom:30px}
th {text-align:center; padding:8px}
body { margin:0 }
td {padding:8px}
input { margin:0; padding:0;border:0; text-align:left }
textarea { margin:0; padding:8px; border:0;display:inline}
.btn{font-weight:bold; font-size:medium; display:inline-block}
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
	<div class="contentContainer">
		<form name="rForm" id ="rForm" method="post">
		<%-- <input type="hidden" name="c_no" value="${roomData.c_no}"/> --%>
		</form>
		<div class="contentTB">
			<table>
				<colgroup>
					<col width="25%"/>
				</colgroup>
				<tbody>
					<tr>
						<td class="ac">케이지 종류</td>
						<td><input type="text" id="c_kind" name="c_kind" value="${roomData.c_kind}" readonly="readonly"/></td>
						<td class="ac">케이지 유형</td>
						<td><input type="text" id="c_type" name="c_type" value="${roomData.c_type}" readonly="readonly"/></td>
					</tr>

<%-- 				<tr>
						<th><span class ="required"></span>케이지 번호</th>
						<td colspan ="3"><input type="text" id="c_no" name="c_no" value="${roomData.c_no}" readonly="readonly"/></td>
					</tr> --%>
					<tr>
						<td class="ac">가격</td>
						<td colspan ="3"><input type="text" id="c_price" name="c_price" value="${roomData.c_price} 원" readonly="readonly" rows="8"/></td>
					</tr>
					<tr>
						<td class="ac vm">케이지 설명</td>
						<td colspan ="3"><textarea cols="70" rows="4" id="c_explain" name="c_explain" readonly="readonly"><c:out value="${roomData.c_explain}"/></textarea></td>
					</tr>
					<tr>
						<td class="ac vm">케이지 사진</td>
						
						<c:if test="${empty roomData.c_picture}">
							<td colspan="3" align="center">등록된 사진 정보가 존재하지 않습니다.</td>
						</c:if>
						<c:if test="${!empty roomData.c_picture}">
							<td colspan="3"><img src="/image/roomImages/${roomData.c_picture}" width="400px" height="250px"/></td>
						</c:if>
					</tr>
			
				</tbody>
			</table>
	</div>
	<div class="btn">
		<input type="button" value="목록" id ="listBtn"  class="btn btn-primary" />	
	</div>
	</div>
</body>
</html>