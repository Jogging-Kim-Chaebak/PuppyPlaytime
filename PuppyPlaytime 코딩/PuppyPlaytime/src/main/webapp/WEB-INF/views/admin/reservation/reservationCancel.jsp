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
	$("#updateData").click(function(){
		if($("#r_approval").val()=="Y"){
			
			if(confirm('예약을 거부하시겠습니까?')){
				$("#reservationForm").attr("action","/admin/reservation/reservationCancel");
				$("#reservationForm").submit();
			}
		}else{
			alert("이미 거부된 예약입니다.");
			window.location.href ="/admin/reservation/reservationList"
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
		<form id ="reservationForm" name="reservationForm" method="post">
			<input type ="hidden" id ="r_no" name ="r_no" value ="${reservationVO.r_no}"/>
			<input type ="hidden" id ="r_approval" name ="r_approval" value ="${reservationVO.r_approval}"/>
		</form>
			<table class="table table-dark table-striped">
				<thead>
					<tr>
						<td colspan="4" align="center"><h4>예약 상세(승인/거부)</h4></td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th><span class ="required"></span>케이지 종류 / 유형</th>
						<td><input type="text" id="c_kind" name="c_kind" value="${cageRoomVO.c_kind} / ${cageRoomVO.c_type}" readonly="readonly"/></td>
						<th><span class ="required"></span>케이지 번호</th>
						<td><input type="text" id="c_no" name="c_no" value="${cageRoomVO.c_no}" readonly="readonly"/></td>
					</tr>

					<tr>
						<th><span class ="required">회원 아이디</span></th>
						<td><input type="text" id="m_id" name="m_id" value="${memberVO.m_id}" readonly="readonly"/></td>
						<th><span class ="required"></span>회원 전화번호</th>
						<td><input type="text" id="m_phone" name="m_phone" value="${memberVO.m_phone}" readonly="readonly"/></td>
					</tr>
					
					<tr>
						<th><span class ="required">회원 이름</span></th>
						<td><input type="text" id="m_name" name="m_name" value="${memberVO.m_name}" readonly="readonly"/></td>
						<th><span class ="required"></span>회원 이메일 주소</th>
						<td><input type="text" id="m_email" name="m_email" value="${memberVO.m_email}" readonly="readonly"/></td>
					</tr>
					<tr>
						<th><span class ="required"></span>회원 주소</th>
						<td colspan ="3"><input type="text" id="m_address" name="m_address" value="${memberVO.m_address}" readonly="readonly"/></td>
					</tr>
					<tr>
						<th><span class ="required">강아지 이름</span></th>
						<td><input type="text" id="p_name" name="p_name" value="${petVO.p_name}" readonly="readonly"/></td>
						<th><span class ="required"></span>견종</th>
						<td><input type="text" id="p_dogbreed" name="p_dogbreed" value="${petVO.p_dogbreed}" readonly="readonly"/></td>
					</tr>
					<tr>
						<th><span class ="required">성별</span></th>
						<td><input type="text" id="p_gender" name="p_gender" value="${petVO.p_gender}" readonly="readonly"/></td>
						<th><span class ="required"></span>체중</th>
						<td><input type="text" id="p_weight" name="p_weight" value="${petVO.p_weight}" readonly="readonly"/></td>
					</tr>
					<tr>
						<th><span class ="required"></span>강아지 사진</th>
						
						<c:if test="${empty petVO.p_picture}">
							<td colspan="3" align="center">등록된 사진 정보가 존재하지 않습니다.</td>
						</c:if>
						<c:if test="${!empty petVO.p_picture}">
                        	<td colspan="3"><img src="/image/petImages/${pet.p_picture}" width="520" height="250"/></td>
                     	</c:if>
						
					</tr>
					<tr>
						<th><span class ="required"></span>강아지 특의사항</th>
						<td colspan ="3"><input type="text" id="p_unique" name="p_unique" value="${petVO.p_unique}" readonly="readonly"/></td>
					</tr>
					
					<tr>
						<th><span class ="required"></span>부가서비스</th>
							<c:if test="${empty extraServiceList}">
									<td colspan="3" align="center">등록된 부가서비스 정보가 존재하지 않습니다.</td>
							</c:if>
							<c:if test="${!empty extraServiceList}">
							<td colspan="3">
								<c:forEach items="${extraServiceList}" var="ex">
									<input type="text" id="s_name" name="s_name" value="${ex.s_name} " readonly="readonly"/>
								</c:forEach>
							</td> 
							</c:if>
					</tr>
					<tr>
						<th><span class ="required"></span>가격</th>
						<td colspan ="3"><input type="text" id="r_payPrice" name="r_payPrice" value="${reservationVO.r_payPrice}" readonly="readonly"/></td>
					</tr>
					<tr>
						<th><span class ="required">예약 신청일</span></th>
						<td><input type="text" id="r_requestDate" name="r_requestDate" value="${reservationVO.r_requestDate}" readonly="readonly"/></td>
						<th><span class ="required"></span>실제 예약일</th>
						<td><input type="text" id="r_startDate" name="r_startDate" value="${reservationVO.r_startDate} ~ ${reservationVO.r_endDate}" readonly="readonly"/></td>
					</tr>
					
				</tbody>
			</table>
	</div>
	<div>
		<p></p>
		<table>
			<tr align ="center">
				<td><input type="button" id ="updateData" value="예약취소" /></td>
				<td><input type="button" id ="closeWindow" value="취소" /></td>
			</tr>
		</table>
	</div>
</body>
</html>